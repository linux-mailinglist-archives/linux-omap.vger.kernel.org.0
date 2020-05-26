Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 04DFF1C0419
	for <lists+linux-omap@lfdr.de>; Thu, 30 Apr 2020 19:46:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726841AbgD3Rqf (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 30 Apr 2020 13:46:35 -0400
Received: from muru.com ([72.249.23.125]:52338 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726812AbgD3Rqe (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 30 Apr 2020 13:46:34 -0400
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 0E2F18139;
        Thu, 30 Apr 2020 17:47:19 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Johan Hovold <johan@kernel.org>, Rob Herring <robh@kernel.org>
Cc:     Alan Cox <gnomes@lxorguk.ukuu.org.uk>,
        Lee Jones <lee.jones@linaro.org>, Jiri Slaby <jslaby@suse.cz>,
        Merlijn Wajer <merlijn@wizzup.org>,
        Pavel Machek <pavel@ucw.cz>,
        Peter Hurley <peter@hurleysoftware.com>,
        Sebastian Reichel <sre@kernel.org>,
        linux-serial@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org
Subject: [PATCH 5/6] gnss: motmdm: Add support for Motorola Mapphone MDM6600 modem
Date:   Thu, 30 Apr 2020 10:46:14 -0700
Message-Id: <20200430174615.41185-6-tony@atomide.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200430174615.41185-1-tony@atomide.com>
References: <20200430174615.41185-1-tony@atomide.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Motorola is using a custom TS 27.010 based serial port line discipline
for various devices on the modem. These devices can be accessed on
dedicated channels using Linux kernel serdev-ngsm driver.

For the GNSS on these devices, we need to kick the GNSS device at a
desired rate. Otherwise the GNSS device stops sending data after a
few minutes. The rate we poll data defaults to 1000 ms, and can be
specified with a module option rate_ms between 1 to 16 seconds.

Note that AGPS with xtra2.bin is not yet supported, so getting a fix
can take quite a while. And a recent gpsd is needed to parse the
$GNGNS output, and to properly handle the /dev/gnss0 character device.
I've confirmed it works properly with gpsd-3.20.

Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 drivers/gnss/Kconfig  |   8 +
 drivers/gnss/Makefile |   3 +
 drivers/gnss/motmdm.c | 419 ++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 430 insertions(+)
 create mode 100644 drivers/gnss/motmdm.c

diff --git a/drivers/gnss/Kconfig b/drivers/gnss/Kconfig
--- a/drivers/gnss/Kconfig
+++ b/drivers/gnss/Kconfig
@@ -13,6 +13,14 @@ menuconfig GNSS
 
 if GNSS
 
+config GNSS_MOTMDM
+	tristate "Motorola Modem TS 27.010 serdev GNSS receiver support"
+	depends on SERIAL_DEV_N_GSM
+	---help---
+	  Say Y here if you have a Motorola modem using TS 27.010 line
+	  discipline for GNSS such as a Motorola Mapphone series device
+	  like Droid 4.
+
 config GNSS_SERIAL
 	tristate
 
diff --git a/drivers/gnss/Makefile b/drivers/gnss/Makefile
--- a/drivers/gnss/Makefile
+++ b/drivers/gnss/Makefile
@@ -6,6 +6,9 @@
 obj-$(CONFIG_GNSS)			+= gnss.o
 gnss-y := core.o
 
+obj-$(CONFIG_GNSS_MOTMDM)		+= gnss-motmdm.o
+gnss-motmdm-y := motmdm.o
+
 obj-$(CONFIG_GNSS_SERIAL)		+= gnss-serial.o
 gnss-serial-y := serial.o
 
diff --git a/drivers/gnss/motmdm.c b/drivers/gnss/motmdm.c
new file mode 100644
--- /dev/null
+++ b/drivers/gnss/motmdm.c
@@ -0,0 +1,419 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Motorola Modem TS 27.010 serdev GNSS driver
+ *
+ * Copyright (C) 2018 - 2020 Tony Lindgren <tony@atomide.com>
+ *
+ * Based on drivers/gnss/sirf.c driver example:
+ * Copyright (C) 2018 Johan Hovold <johan@kernel.org>
+ */
+
+#include <linux/errno.h>
+#include <linux/gnss.h>
+#include <linux/init.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/serdev-gsm.h>
+#include <linux/slab.h>
+
+#define MOTMDM_GNSS_TIMEOUT	1000
+#define MOTMDM_GNSS_RATE	1000
+
+/*
+ * Motorola MDM GNSS device communicates over a dedicated TS 27.010 channel
+ * using custom data packets. The packets look like AT commands embedded into
+ * a Motorola invented packet using format like "U1234AT+MPDSTART=0,1,100,0".
+ * But it's not an AT compatible serial interface, it's a packet interface
+ * using AT like commands.
+ */
+#define MOTMDM_GNSS_HEADER_LEN	5				/* U1234 */
+#define MOTMDM_GNSS_RESP_LEN	(MOTMDM_GNSS_HEADER_LEN + 4)	/* U1234+MPD */
+#define MOTMDM_GNSS_DATA_LEN	(MOTMDM_GNSS_RESP_LEN + 1)	/* U1234~+MPD */
+#define MOTMDM_GNSS_STATUS_LEN	(MOTMDM_GNSS_DATA_LEN + 7)	/* STATUS= */
+#define MOTMDM_GNSS_NMEA_LEN	(MOTMDM_GNSS_DATA_LEN + 8)	/* NMEA=NN, */
+
+enum motmdm_gnss_status {
+	MOTMDM_GNSS_UNKNOWN,
+	MOTMDM_GNSS_INITIALIZED,
+	MOTMDM_GNSS_DATA_OR_TIMEOUT,
+	MOTMDM_GNSS_STARTED,
+	MOTMDM_GNSS_STOPPED,
+};
+
+struct motmdm_gnss_data {
+	struct gnss_device *gdev;
+	struct device *modem;
+	struct gsm_serdev_dlci dlci;
+	struct delayed_work restart_work;
+	struct mutex mutex;	/* For modem commands */
+	ktime_t last_update;
+	int status;
+	unsigned char *buf;
+	size_t len;
+	wait_queue_head_t read_queue;
+	unsigned int parsed:1;
+};
+
+static unsigned int rate_ms = MOTMDM_GNSS_RATE;
+module_param(rate_ms, uint, 0644);
+MODULE_PARM_DESC(rate_ms, "GNSS refresh rate between 1000 and 16000 ms (default 1000 ms)");
+
+/*
+ * Note that multiple commands can be sent in series with responses coming
+ * out-of-order. For GNSS, we don't need to care about the out-of-order
+ * responses, and can assume we have at most one command active at a time.
+ * For the commands, can use just a jiffies base packet ID and let the modem
+ * sort out the ID conflicts with the modem's unsolicited message ID
+ * numbering.
+ */
+int motmdm_gnss_send_command(struct motmdm_gnss_data *ddata,
+			     const u8 *buf, int len)
+{
+	struct gnss_device *gdev = ddata->gdev;
+	const int timeout_ms = 1000;
+	unsigned char cmd[128];
+	int ret, cmdlen;
+
+	cmdlen = len + 5 + 1;
+	if (cmdlen > 128)
+		return -EINVAL;
+
+	mutex_lock(&ddata->mutex);
+	memset(ddata->buf, 0, ddata->len);
+	ddata->parsed = false;
+	snprintf(cmd, cmdlen, "U%04li%s", jiffies % 10000, buf);
+	ret = serdev_ngsm_write(ddata->modem, &ddata->dlci, cmd, cmdlen);
+	if (ret < 0)
+		goto out_unlock;
+
+	ret = wait_event_timeout(ddata->read_queue, ddata->parsed,
+				 msecs_to_jiffies(timeout_ms));
+	if (ret == 0) {
+		ret = -ETIMEDOUT;
+		goto out_unlock;
+	} else if (ret < 0) {
+		goto out_unlock;
+	}
+
+	if (!strstr(ddata->buf, ":OK")) {
+		dev_err(&gdev->dev, "command %s error %s\n",
+			cmd, ddata->buf);
+		ret = -EPIPE;
+	}
+
+	ret = len;
+
+out_unlock:
+	mutex_unlock(&ddata->mutex);
+
+	return ret;
+}
+
+/*
+ * Android uses AT+MPDSTART=0,1,100,0 which starts GNSS for a while,
+ * and then GNSS needs to be kicked with an AT command based on a
+ * status message.
+ */
+static void motmdm_gnss_restart(struct work_struct *work)
+{
+	struct motmdm_gnss_data *ddata =
+		container_of(work, struct motmdm_gnss_data,
+			     restart_work.work);
+	struct gnss_device *gdev = ddata->gdev;
+	const unsigned char *cmd = "AT+MPDSTART=0,1,100,0";
+	int error;
+
+	ddata->last_update = ktime_get();
+
+	error = motmdm_gnss_send_command(ddata, cmd, strlen(cmd));
+	if (error < 0) {
+		/* Timeouts can happen, don't warn and try again */
+		if (error != -ETIMEDOUT)
+			dev_warn(&gdev->dev, "%s: could not start: %i\n",
+				 __func__, error);
+
+		schedule_delayed_work(&ddata->restart_work,
+				      msecs_to_jiffies(MOTMDM_GNSS_RATE));
+
+		return;
+	}
+}
+
+static void motmdm_gnss_start(struct gnss_device *gdev, int delay_ms)
+{
+	struct motmdm_gnss_data *ddata = gnss_get_drvdata(gdev);
+	ktime_t now, next, delta;
+	int next_ms;
+
+	now = ktime_get();
+	next = ktime_add_ms(ddata->last_update, delay_ms);
+	delta = ktime_sub(next, now);
+	next_ms = ktime_to_ms(delta);
+
+	if (next_ms < 0)
+		next_ms = 0;
+	if (next_ms > delay_ms)
+		next_ms = delay_ms;
+
+	schedule_delayed_work(&ddata->restart_work, msecs_to_jiffies(next_ms));
+}
+
+static int motmdm_gnss_stop(struct gnss_device *gdev)
+{
+	struct motmdm_gnss_data *ddata = gnss_get_drvdata(gdev);
+	const unsigned char *cmd = "AT+MPDSTOP";
+
+	cancel_delayed_work_sync(&ddata->restart_work);
+
+	return motmdm_gnss_send_command(ddata, cmd, strlen(cmd));
+}
+
+static int motmdm_gnss_init(struct gnss_device *gdev)
+{
+	struct motmdm_gnss_data *ddata = gnss_get_drvdata(gdev);
+	const unsigned char *cmd = "AT+MPDINIT=1";
+	int error;
+
+	error = motmdm_gnss_send_command(ddata, cmd, strlen(cmd));
+	if (error < 0)
+		return error;
+
+	motmdm_gnss_start(gdev, 0);
+
+	return 0;
+}
+
+static int motmdm_gnss_finish(struct gnss_device *gdev)
+{
+	struct motmdm_gnss_data *ddata = gnss_get_drvdata(gdev);
+	const unsigned char *cmd = "AT+MPDINIT=0";
+	int error;
+
+	error = motmdm_gnss_stop(gdev);
+	if (error < 0)
+		return error;
+
+	return motmdm_gnss_send_command(ddata, cmd, strlen(cmd));
+}
+
+static int motmdm_gnss_receive_data(struct gsm_serdev_dlci *dlci,
+				    const unsigned char *buf,
+				    size_t len)
+{
+	struct gnss_device *gdev = dlci->drvdata;
+	struct motmdm_gnss_data *ddata = gnss_get_drvdata(gdev);
+	const unsigned char *msg;
+	size_t msglen;
+	int error = 0;
+
+	if (len <= MOTMDM_GNSS_RESP_LEN)
+		return 0;
+
+	/* Handle U1234+MPD style command response */
+	if (buf[MOTMDM_GNSS_HEADER_LEN] != '~') {
+		msg = buf + MOTMDM_GNSS_RESP_LEN;
+		strncpy(ddata->buf, msg, len - MOTMDM_GNSS_RESP_LEN);
+		ddata->parsed = true;
+		wake_up(&ddata->read_queue);
+
+		return len;
+	}
+
+	if (len <= MOTMDM_GNSS_DATA_LEN)
+		return 0;
+
+	/* Handle U1234~+MPD style unsolicted message */
+	switch (buf[MOTMDM_GNSS_DATA_LEN]) {
+	case 'N':	/* UNNNN~+MPDNMEA=NN, */
+		msg = buf + MOTMDM_GNSS_NMEA_LEN;
+		msglen = len - MOTMDM_GNSS_NMEA_LEN;
+
+		/*
+		 * Firmware bug: Strip out extra duplicate line break always
+		 * in the data
+		 */
+		msglen--;
+
+		/*
+		 * Firmware bug: Strip out extra data based on an
+		 * earlier line break in the data
+		 */
+		if (msg[msglen - 5 - 1] == 0x0a)
+			msglen -= 5;
+
+		error = gnss_insert_raw(gdev, msg, msglen);
+		break;
+	case 'S':	/* UNNNN~+MPDSTATUS=N,NN */
+		msg = buf + MOTMDM_GNSS_STATUS_LEN;
+		msglen = len - MOTMDM_GNSS_STATUS_LEN;
+
+		switch (msg[0]) {
+		case '1':
+			ddata->status = MOTMDM_GNSS_INITIALIZED;
+			break;
+		case '2':
+			ddata->status = MOTMDM_GNSS_DATA_OR_TIMEOUT;
+			if (rate_ms < MOTMDM_GNSS_RATE)
+				rate_ms = MOTMDM_GNSS_RATE;
+			if (rate_ms > 16 * MOTMDM_GNSS_RATE)
+				rate_ms = 16 * MOTMDM_GNSS_RATE;
+			motmdm_gnss_start(gdev, rate_ms);
+			break;
+		case '3':
+			ddata->status = MOTMDM_GNSS_STARTED;
+			break;
+		case '4':
+			ddata->status = MOTMDM_GNSS_STOPPED;
+			break;
+		default:
+			ddata->status = MOTMDM_GNSS_UNKNOWN;
+			break;
+		}
+		break;
+	case 'X':	/* UNNNN~+MPDXREQ=N for updated xtra2.bin needed */
+	default:
+		break;
+	}
+
+	return len;
+}
+
+static int motmdm_gnss_open(struct gnss_device *gdev)
+{
+	struct motmdm_gnss_data *ddata = gnss_get_drvdata(gdev);
+	struct gsm_serdev_dlci *dlci = &ddata->dlci;
+	int error;
+
+	dlci->drvdata = gdev;
+	dlci->receive_buf = motmdm_gnss_receive_data;
+
+	error = serdev_ngsm_register_dlci(ddata->modem, dlci);
+	if (error)
+		return error;
+
+	error = motmdm_gnss_init(gdev);
+	if (error) {
+		serdev_ngsm_unregister_dlci(ddata->modem, dlci);
+
+		return error;
+	}
+
+	return 0;
+}
+
+static void motmdm_gnss_close(struct gnss_device *gdev)
+{
+	struct motmdm_gnss_data *ddata = gnss_get_drvdata(gdev);
+	struct gsm_serdev_dlci *dlci = &ddata->dlci;
+	int error;
+
+	dlci->receive_buf = NULL;
+	error = motmdm_gnss_finish(gdev);
+	if (error < 0)
+		dev_warn(&gdev->dev, "%s: close failed: %i\n",
+			 __func__, error);
+
+	serdev_ngsm_unregister_dlci(ddata->modem, dlci);
+}
+
+static int motmdm_gnss_write_raw(struct gnss_device *gdev,
+				 const unsigned char *buf,
+				 size_t count)
+{
+	struct motmdm_gnss_data *ddata = gnss_get_drvdata(gdev);
+
+	return serdev_ngsm_write(ddata->modem, &ddata->dlci, buf, count);
+}
+
+static const struct gnss_operations motmdm_gnss_ops = {
+	.open		= motmdm_gnss_open,
+	.close		= motmdm_gnss_close,
+	.write_raw	= motmdm_gnss_write_raw,
+};
+
+static int motmdm_gnss_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct motmdm_gnss_data *ddata;
+	struct gnss_device *gdev;
+	u32 line;
+	int ret;
+
+	ddata = devm_kzalloc(dev, sizeof(*ddata), GFP_KERNEL);
+	if (!ddata)
+		return -ENOMEM;
+
+	ret = of_property_read_u32(dev->of_node, "reg", &line);
+	if (ret)
+		return ret;
+
+	if (!line)
+		return -EINVAL;
+
+	ddata->dlci.line = line;
+	ddata->modem = dev->parent;
+	ddata->len = PAGE_SIZE;
+	mutex_init(&ddata->mutex);
+	INIT_DELAYED_WORK(&ddata->restart_work, motmdm_gnss_restart);
+	init_waitqueue_head(&ddata->read_queue);
+
+	ddata->buf = devm_kzalloc(dev, ddata->len, GFP_KERNEL);
+	if (!ddata->buf)
+		return -ENOMEM;
+
+	platform_set_drvdata(pdev, ddata);
+
+	gdev = gnss_allocate_device(dev);
+	if (!gdev)
+		return -ENOMEM;
+
+	gdev->type = GNSS_TYPE_NMEA;
+	gdev->ops = &motmdm_gnss_ops;
+	gnss_set_drvdata(gdev, ddata);
+	ddata->gdev = gdev;
+
+	ret = gnss_register_device(gdev);
+	if (ret)
+		goto err_put_device;
+
+	return 0;
+
+err_put_device:
+	gnss_put_device(ddata->gdev);
+
+	return ret;
+}
+
+static int motmdm_gnss_remove(struct platform_device *pdev)
+{
+	struct motmdm_gnss_data *data = platform_get_drvdata(pdev);
+
+	gnss_deregister_device(data->gdev);
+	gnss_put_device(data->gdev);
+
+	return 0;
+};
+
+#ifdef CONFIG_OF
+static const struct of_device_id motmdm_gnss_of_match[] = {
+	{ .compatible = "motorola,mapphone-mdm6600-gnss" },
+	{},
+};
+MODULE_DEVICE_TABLE(of, motmdm_gnss_of_match);
+#endif
+
+static struct platform_driver motmdm_gnss_driver = {
+	.driver	= {
+		.name		= "gnss-mot-mdm6600",
+		.of_match_table	= of_match_ptr(motmdm_gnss_of_match),
+	},
+	.probe	= motmdm_gnss_probe,
+	.remove	= motmdm_gnss_remove,
+};
+module_platform_driver(motmdm_gnss_driver);
+
+MODULE_AUTHOR("Tony Lindgren <tony@atomide.com>");
+MODULE_DESCRIPTION("Motorola Mapphone MDM6600 GNSS receiver driver");
+MODULE_LICENSE("GPL v2");
-- 
2.26.2
