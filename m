Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 568261C0428
	for <lists+linux-omap@lfdr.de>; Thu, 30 Apr 2020 19:46:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726777AbgD3Rqc (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 30 Apr 2020 13:46:32 -0400
Received: from muru.com ([72.249.23.125]:52306 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726766AbgD3Rqa (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 30 Apr 2020 13:46:30 -0400
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 9316D8177;
        Thu, 30 Apr 2020 17:47:14 +0000 (UTC)
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
Subject: [PATCH 3/6] serdev: ngsm: Add generic serdev-ngsm driver
Date:   Thu, 30 Apr 2020 10:46:12 -0700
Message-Id: <20200430174615.41185-4-tony@atomide.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200430174615.41185-1-tony@atomide.com>
References: <20200430174615.41185-1-tony@atomide.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

We can have a generic serdev-ngsm driver bring up the TS 27.010 line
discipline on the selected serial ports based on device tree data.

And we can now do standard Linux device driver for the dedicated
TS 27.010 channels for devices like GNSS and ALSA found on modems.

Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 drivers/tty/serdev/Kconfig       |  10 +
 drivers/tty/serdev/Makefile      |   1 +
 drivers/tty/serdev/serdev-ngsm.c | 449 +++++++++++++++++++++++++++++++
 include/linux/serdev-gsm.h       |  11 +
 4 files changed, 471 insertions(+)
 create mode 100644 drivers/tty/serdev/serdev-ngsm.c

diff --git a/drivers/tty/serdev/Kconfig b/drivers/tty/serdev/Kconfig
--- a/drivers/tty/serdev/Kconfig
+++ b/drivers/tty/serdev/Kconfig
@@ -22,4 +22,14 @@ config SERIAL_DEV_CTRL_TTYPORT
 	depends on SERIAL_DEV_BUS != m
 	default y
 
+config SERIAL_DEV_N_GSM
+	tristate "Serial device TS 27.010 support"
+	help
+	  Select this if you want to use the TS 27.010 with a serial port with
+	  devices such as modems and GNSS devices.
+
+	  If unsure, say N.
+	depends on N_GSM
+	depends on SERIAL_DEV_CTRL_TTYPORT
+
 endif
diff --git a/drivers/tty/serdev/Makefile b/drivers/tty/serdev/Makefile
--- a/drivers/tty/serdev/Makefile
+++ b/drivers/tty/serdev/Makefile
@@ -4,3 +4,4 @@ serdev-objs := core.o
 obj-$(CONFIG_SERIAL_DEV_BUS) += serdev.o
 
 obj-$(CONFIG_SERIAL_DEV_CTRL_TTYPORT) += serdev-ttyport.o
+obj-$(CONFIG_SERIAL_DEV_N_GSM) += serdev-ngsm.o
diff --git a/drivers/tty/serdev/serdev-ngsm.c b/drivers/tty/serdev/serdev-ngsm.c
new file mode 100644
--- /dev/null
+++ b/drivers/tty/serdev/serdev-ngsm.c
@@ -0,0 +1,449 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Generic TS 27.010 serial line discipline serdev driver
+ * Copyright (C) 2020 Tony Lindgren <tony@atomide.com>
+ */
+
+#include <linux/device.h>
+#include <linux/err.h>
+#include <linux/init.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_platform.h>
+#include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
+#include <linux/serdev.h>
+#include <linux/serdev-gsm.h>
+
+#include <linux/phy/phy.h>
+
+#include <uapi/linux/gsmmux.h>
+
+#define TS27010_C_N2		3	/* TS 27.010 default value */
+#define TS27010_RESERVED_DLCI	(BIT_ULL(63) | BIT_ULL(62) | BIT_ULL(0))
+
+struct serdev_ngsm_cfg {
+	const struct gsm_config *gsm;
+	unsigned int init_retry_quirk:1;
+	unsigned int needs_usb_phy:1;
+	unsigned int aggressive_pm:1;
+	int (*init)(struct serdev_device *serdev); /* for device quirks */
+};
+
+struct serdev_ngsm {
+	struct device *dev;
+	struct gsm_serdev gsd;
+	struct phy *phy;
+	u32 baudrate;
+	DECLARE_BITMAP(ttymask, 64);
+	const struct serdev_ngsm_cfg *cfg;
+};
+
+static int serdev_ngsm_tty_init(struct serdev_ngsm *ddata)
+{
+	struct gsm_serdev *gsd = &ddata->gsd;
+	struct device *dev = ddata->dev;
+	int bit, err;
+
+	for_each_set_bit(bit, ddata->ttymask, 64) {
+		if (BIT_ULL(bit) & TS27010_RESERVED_DLCI)
+			continue;
+
+		err = gsm_serdev_register_tty_port(gsd, bit);
+		if (err) {
+			dev_err(dev, "ngsm tty init failed for dlci%i: %i\n",
+				bit, err);
+			return err;
+		}
+	}
+
+	return 0;
+}
+
+static void serdev_ngsm_tty_exit(struct serdev_ngsm *ddata)
+{
+	struct gsm_serdev *gsd = &ddata->gsd;
+	int bit;
+
+	for_each_set_bit(bit, ddata->ttymask, 64) {
+		if (BIT_ULL(bit) & TS27010_RESERVED_DLCI)
+			continue;
+
+		gsm_serdev_unregister_tty_port(gsd, bit);
+	}
+}
+
+/*
+ * Note that we rely on gsm_serdev_register_dlci() locking for
+ * reserved channels that serdev_ngsm_tty_init() and consumer
+ * drivers may have already reserved.
+ */
+int serdev_ngsm_register_dlci(struct device *dev,
+			      struct gsm_serdev_dlci *dlci)
+{
+	struct serdev_ngsm *ddata = gsm_serdev_get_drvdata(dev);
+	struct gsm_serdev *gsd = &ddata->gsd;
+	int err;
+
+	err = gsm_serdev_register_dlci(gsd, dlci);
+	if (err)
+		return err;
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(serdev_ngsm_register_dlci);
+
+void serdev_ngsm_unregister_dlci(struct device *dev,
+				 struct gsm_serdev_dlci *dlci)
+{
+	struct serdev_ngsm *ddata = gsm_serdev_get_drvdata(dev);
+	struct gsm_serdev *gsd = &ddata->gsd;
+
+	gsm_serdev_unregister_dlci(gsd, dlci);
+}
+EXPORT_SYMBOL_GPL(serdev_ngsm_unregister_dlci);
+
+int serdev_ngsm_write(struct device *dev, struct gsm_serdev_dlci *ops,
+		      const u8 *buf, int len)
+{
+	struct serdev_ngsm *ddata = gsm_serdev_get_drvdata(dev);
+	struct gsm_serdev *gsd = &ddata->gsd;
+	int ret;
+
+	ret = pm_runtime_get_sync(dev);
+	if ((ret != -EINPROGRESS) && ret < 0) {
+		pm_runtime_put_noidle(dev);
+
+		return ret;
+	}
+
+	ret = gsm_serdev_write(gsd, ops, buf, len);
+
+	pm_runtime_mark_last_busy(dev);
+	pm_runtime_put_autosuspend(dev);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(serdev_ngsm_write);
+
+static int serdev_ngsm_set_config(struct device *dev)
+{
+	struct serdev_ngsm *ddata = gsm_serdev_get_drvdata(dev);
+	struct gsm_serdev *gsd = &ddata->gsd;
+	struct gsm_config c;
+	int err, n2;
+
+	memcpy(&c, ddata->cfg->gsm, sizeof(c));
+
+	if (ddata->cfg->init_retry_quirk) {
+		n2 = c.n2;
+		c.n2 *= 10;
+		err = gsm_serdev_set_config(gsd, &c);
+		if (err)
+			return err;
+
+		msleep(5000);
+		c.n2 = n2;
+	}
+
+	err = gsm_serdev_set_config(gsd, &c);
+	if (err)
+		return err;
+
+	return 0;
+}
+
+static int serdev_ngsm_output(struct gsm_serdev *gsd, u8 *data, int len)
+{
+	struct serdev_device *serdev = gsd->serdev;
+	struct device *dev = &serdev->dev;
+	int err;
+
+	err = pm_runtime_get(dev);
+	if ((err != -EINPROGRESS) && err < 0) {
+		pm_runtime_put_noidle(dev);
+
+		return err;
+	}
+
+	serdev_device_write_buf(serdev, data, len);
+
+	pm_runtime_put(dev);
+
+	return len;
+}
+
+static int serdev_ngsm_runtime_suspend(struct device *dev)
+{
+	struct serdev_ngsm *ddata = gsm_serdev_get_drvdata(dev);
+	int err;
+
+	if (ddata->cfg->needs_usb_phy) {
+		err = phy_pm_runtime_put(ddata->phy);
+		if (err < 0) {
+			dev_warn(dev, "%s: phy_pm_runtime_put: %i\n",
+				 __func__, err);
+
+			return err;
+		}
+	}
+
+	return 0;
+}
+
+static int serdev_ngsm_runtime_resume(struct device *dev)
+{
+	struct serdev_ngsm *ddata = gsm_serdev_get_drvdata(dev);
+	int err;
+
+	if (ddata->cfg->needs_usb_phy) {
+		err = phy_pm_runtime_get_sync(ddata->phy);
+		if (err < 0) {
+			dev_warn(dev, "%s: phy_pm_runtime_get: %i\n",
+				 __func__, err);
+
+			return err;
+		}
+	}
+
+	gsm_serdev_data_kick(&ddata->gsd);
+
+	return 0;
+}
+
+static const struct dev_pm_ops serdev_ngsm_pm_ops = {
+	SET_RUNTIME_PM_OPS(serdev_ngsm_runtime_suspend,
+			   serdev_ngsm_runtime_resume,
+			   NULL)
+};
+
+/*
+ * At least Motorola MDM6600 devices have GPIO wake pins shared between the
+ * USB PHY and the TS 27.010 interface. So for PM, we need to use the calls
+ * for phy_pm_runtime. Otherwise the modem won't respond to anything on the
+ * UART and will never idle either.
+ */
+static int serdev_ngsm_phy_init(struct device *dev)
+{
+	struct serdev_ngsm *ddata = gsm_serdev_get_drvdata(dev);
+	int err;
+
+	if (!ddata->cfg->needs_usb_phy)
+		return 0;
+
+	ddata->phy = devm_of_phy_get(dev, dev->of_node, NULL);
+	if (IS_ERR(ddata->phy)) {
+		err = PTR_ERR(ddata->phy);
+		if (err != -EPROBE_DEFER)
+			dev_err(dev, "%s: phy error: %i\n", __func__, err);
+
+		return err;
+	}
+
+	return 0;
+}
+
+/*
+ * Configure SoC 8250 device for 700 ms autosuspend delay, Values around 600 ms
+ * and shorter cause spurious wake-up events at least on droid 4. Also keep the
+ * SoC 8250 device active during use because of the OOB GPIO wake-up signaling
+ * shared with USB PHY.
+ */
+static int motmdm_init(struct serdev_device *serdev)
+{
+	pm_runtime_set_autosuspend_delay(serdev->ctrl->dev.parent, 700);
+	pm_suspend_ignore_children(&serdev->ctrl->dev, false);
+
+	return 0;
+}
+
+static const struct gsm_config adaption1 = {
+	.i = 1,			/* 1 = UIH, 2 = UI */
+	.initiator = 1,
+	.encapsulation = 0,	/* basic mode */
+	.adaption = 1,
+	.mru = 1024,		/* from android TS 27010 driver */
+	.mtu = 1024,		/* from android TS 27010 driver */
+	.t1 = 10,		/* ack timer, default 10ms */
+	.t2 = 34,		/* response timer, default 34 */
+	.n2 = 3,		/* retransmissions, default 3 */
+};
+
+static const struct serdev_ngsm_cfg adaption1_cfg = {
+	.gsm = &adaption1,
+};
+
+static const struct serdev_ngsm_cfg motmdm_cfg = {
+	.gsm = &adaption1,
+	.init_retry_quirk = true,
+	.needs_usb_phy = true,
+	.aggressive_pm = true,
+	.init = motmdm_init,
+};
+
+static const struct of_device_id serdev_ngsm_id_table[] = {
+	{
+		.compatible = "etsi,3gpp-ts27010-adaption1",
+		.data = &adaption1_cfg,
+	},
+	{
+		.compatible = "motorola,mapphone-mdm6600-serial",
+		.data = &motmdm_cfg,
+	},
+	{ /* sentinel */ },
+};
+MODULE_DEVICE_TABLE(of, serdev_ngsm_id_table);
+
+static int serdev_ngsm_probe(struct serdev_device *serdev)
+{
+	struct device *dev = &serdev->dev;
+	const struct of_device_id *match;
+	struct gsm_serdev *gsd;
+	struct serdev_ngsm *ddata;
+	u64 ttymask;
+	int err;
+
+	match = of_match_device(of_match_ptr(serdev_ngsm_id_table), dev);
+	if (!match)
+		return -ENODEV;
+
+	ddata = devm_kzalloc(dev, sizeof(*ddata), GFP_KERNEL);
+	if (!ddata)
+		return -ENOMEM;
+
+	ddata->dev = dev;
+	ddata->cfg = match->data;
+
+	gsd = &ddata->gsd;
+	gsd->serdev = serdev;
+	gsd->output = serdev_ngsm_output;
+	serdev_device_set_drvdata(serdev, gsd);
+	gsm_serdev_set_drvdata(dev, ddata);
+
+	err = serdev_ngsm_phy_init(dev);
+	if (err)
+		return err;
+
+	err = of_property_read_u64(dev->of_node, "ttymask", &ttymask);
+	if (err) {
+		dev_err(dev, "invalid or missing ttymask: %i\n", err);
+
+		return err;
+	}
+
+	bitmap_from_u64(ddata->ttymask, ttymask);
+
+	pm_runtime_set_autosuspend_delay(dev, 200);
+	pm_runtime_use_autosuspend(dev);
+	pm_runtime_enable(dev);
+	err = pm_runtime_get_sync(dev);
+	if (err < 0) {
+		pm_runtime_put_noidle(dev);
+
+		return err;
+	}
+
+	err = gsm_serdev_register_device(gsd);
+	if (err)
+		goto err_disable;
+
+	err = serdev_device_open(gsd->serdev);
+	if (err)
+		goto err_disable;
+
+	/* Optional serial port configuration */
+	of_property_read_u32(dev->of_node->parent, "current-speed",
+			     &ddata->baudrate);
+	if (ddata->baudrate)
+		serdev_device_set_baudrate(gsd->serdev, ddata->baudrate);
+
+	if (of_get_property(dev->of_node->parent, "uart-has-rtscts", NULL)) {
+		serdev_device_set_rts(gsd->serdev, true);
+		serdev_device_set_flow_control(gsd->serdev, true);
+	}
+
+	err = serdev_ngsm_set_config(dev);
+	if (err)
+		goto err_close;
+
+	err = serdev_ngsm_tty_init(ddata);
+	if (err)
+		goto err_tty;
+
+	if (ddata->cfg->init) {
+		err = ddata->cfg->init(serdev);
+		if (err)
+			goto err_tty;
+	}
+
+	err = of_platform_populate(dev->of_node, NULL, NULL, dev);
+	if (err)
+		goto err_tty;
+
+	/* Allow parent serdev device to idle when open, balanced in remove */
+	if (ddata->cfg->aggressive_pm)
+		pm_runtime_put(&serdev->ctrl->dev);
+
+	pm_runtime_mark_last_busy(dev);
+	pm_runtime_put_autosuspend(dev);
+
+	return 0;
+
+err_tty:
+	serdev_ngsm_tty_exit(ddata);
+
+err_close:
+	serdev_device_close(serdev);
+
+err_disable:
+	pm_runtime_dont_use_autosuspend(dev);
+	pm_runtime_put_sync(dev);
+	pm_runtime_disable(dev);
+	gsm_serdev_unregister_device(gsd);
+
+	return err;
+}
+
+static void serdev_ngsm_remove(struct serdev_device *serdev)
+{
+	struct gsm_serdev *gsd = serdev_device_get_drvdata(serdev);
+	struct device *dev = &serdev->dev;
+	struct serdev_ngsm *ddata;
+	int err;
+
+	ddata = gsm_serdev_get_drvdata(dev);
+
+	/* Balance the put done in probe for UART */
+	if (ddata->cfg->aggressive_pm)
+		pm_runtime_get(&serdev->ctrl->dev);
+
+	err = pm_runtime_get_sync(dev);
+	if (err < 0)
+		dev_warn(dev, "%s: PM runtime: %i\n", __func__, err);
+
+	of_platform_depopulate(dev);
+	serdev_ngsm_tty_exit(ddata);
+	serdev_device_close(serdev);
+	gsm_serdev_unregister_device(gsd);
+
+	pm_runtime_dont_use_autosuspend(dev);
+	pm_runtime_put_sync(dev);
+	pm_runtime_disable(dev);
+}
+
+static struct serdev_device_driver serdev_ngsm_driver = {
+	.driver = {
+		.name = "serdev_ngsm",
+		.of_match_table = of_match_ptr(serdev_ngsm_id_table),
+		.pm = &serdev_ngsm_pm_ops,
+	},
+	.probe = serdev_ngsm_probe,
+	.remove = serdev_ngsm_remove,
+};
+
+module_serdev_device_driver(serdev_ngsm_driver);
+
+MODULE_DESCRIPTION("serdev n_gsm driver");
+MODULE_AUTHOR("Tony Lindgren <tony@atomide.com>");
+MODULE_LICENSE("GPL v2");
diff --git a/include/linux/serdev-gsm.h b/include/linux/serdev-gsm.h
--- a/include/linux/serdev-gsm.h
+++ b/include/linux/serdev-gsm.h
@@ -43,6 +43,17 @@ struct gsm_serdev_dlci {
 
 #if IS_ENABLED(CONFIG_N_GSM) && IS_ENABLED(CONFIG_SERIAL_DEV_BUS)
 
+/* TS 27.010 channel specific functions for consumer drivers */
+#if IS_ENABLED(CONFIG_SERIAL_DEV_N_GSM)
+extern int
+serdev_ngsm_register_dlci(struct device *dev, struct gsm_serdev_dlci *dlci);
+extern void serdev_ngsm_unregister_dlci(struct device *dev,
+					struct gsm_serdev_dlci *dlci);
+extern int serdev_ngsm_write(struct device *dev, struct gsm_serdev_dlci *ops,
+			     const u8 *buf, int len);
+#endif
+
+/* Interface for_gsm serdev support */
 extern int gsm_serdev_register_device(struct gsm_serdev *gsd);
 extern void gsm_serdev_unregister_device(struct gsm_serdev *gsd);
 extern int gsm_serdev_register_tty_port(struct gsm_serdev *gsd, int line);
-- 
2.26.2
