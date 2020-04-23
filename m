Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5D4081B69CD
	for <lists+linux-omap@lfdr.de>; Fri, 24 Apr 2020 01:27:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726079AbgDWX11 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 23 Apr 2020 19:27:27 -0400
Received: from muru.com ([72.249.23.125]:51156 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728116AbgDWX11 (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 23 Apr 2020 19:27:27 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 8FFB58088;
        Thu, 23 Apr 2020 23:28:13 +0000 (UTC)
Date:   Thu, 23 Apr 2020 16:27:22 -0700
From:   Tony Lindgren <tony@atomide.com>
To:     Johan Hovold <johan@kernel.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Alan Cox <gnomes@lxorguk.ukuu.org.uk>,
        Lee Jones <lee.jones@linaro.org>, Jiri Slaby <jslaby@suse.cz>,
        Merlijn Wajer <merlijn@wizzup.org>,
        Pavel Machek <pavel@ucw.cz>,
        Peter Hurley <peter@hurleysoftware.com>,
        Sebastian Reichel <sre@kernel.org>,
        linux-serial@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org
Subject: Re: [PATCHv6 0/4] n_gsm serdev support and protocol driver for
 droid4 modem
Message-ID: <20200423232722.GG37466@atomide.com>
References: <20200421232752.3070-1-tony@atomide.com>
 <20200423114326.GQ18608@localhost>
 <20200423153756.GE37466@atomide.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200423153756.GE37466@atomide.com>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Tony Lindgren <tony@atomide.com> [200423 15:38]:
> * Johan Hovold <johan@kernel.org> [200423 11:44]:
> > I'd rather see a generic implementation which can be used with other
> > modems and that continues to expose a /dev/gsmttyN interface to which we
> > could attach serdev clients instead (and not create a motmdm serdev
> > replica of sorts).
> 
> Yeah this should be doable quite easily actually without really any of
> the motorola driver code. It's a separate driver though, and not
> usable for this case because of the custom layer.

Well here's a first take at the such a generic serdev-ngsm driver
that depends on patch 1/4 of this series. All this does is configure
a serial port for TS 27.010 adaption1, and brings up 16 /dev/gsmtty*
devices. So no custom options for the binding so far, and no support
for adding channel specific device drivers. But all that can be added
naturally later on.

I've briefly tested it with my droid4 instead of the custom driver
in this series to make sure things work with the following steps:

I added modem to arch/arm/boot/dts/motorola-mapphone-common.dtsi
under uart1:

	modem {
		compatible = "3gpp,ts27010-adaption1";
	};

And then I had to disable the shared gpio PM pin toggling for the
USB PHY to prevent the modem from idling:

# echo on > /sys/devices/platform/usb-phy@1/power/control

And then I was able to talk with the modem by prepending
custom packet numbering to the messages:

# cat /dev/gsmtty10 &
# printf "U1234AT+MSIM?\r" > /dev/gsmtty10
# U1234+MSIM=0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0

Hmm. Maybe we could just handle the droid4 PM needs with a
custom compatible here too. And deal with the motorola packet
layer somewhere.

Then the only difference to the custom driver in this series
really is that we would be using the /dev/gsmtty* tty devices
for userspace isntead of the custom /dev/motmdm* char devices.

Regards,

Tony

8< --------------------
 drivers/tty/n_gsm.c              |  65 ++++++++++++-
 drivers/tty/serdev/Kconfig       |  10 ++
 drivers/tty/serdev/Makefile      |   1 +
 drivers/tty/serdev/serdev-ngsm.c | 156 +++++++++++++++++++++++++++++++
 include/linux/serdev-gsm.h       |  11 +++
 5 files changed, 242 insertions(+), 1 deletion(-)
 create mode 100644 drivers/tty/serdev/serdev-ngsm.c

diff --git a/drivers/tty/n_gsm.c b/drivers/tty/n_gsm.c
--- a/drivers/tty/n_gsm.c
+++ b/drivers/tty/n_gsm.c
@@ -2438,6 +2438,19 @@ static struct gsm_dlci *gsd_dlci_get(struct gsm_serdev *gsd, int line,
 	return dlci;
 }
 
+static int gsd_dlci_receive_buf(struct gsm_dlci *dlci,
+				const unsigned char *buf,
+				size_t len)
+{
+	struct tty_port *port;
+
+	port = &dlci->port;
+	tty_insert_flip_string(port, buf, len);
+	tty_flip_buffer_push(port);
+
+	return 0;
+}
+
 static void gsd_dlci_data(struct gsm_dlci *dlci, const u8 *buf, int len)
 {
 	struct gsm_mux *gsm = dlci->gsm;
@@ -2451,6 +2464,8 @@ static void gsd_dlci_data(struct gsm_dlci *dlci, const u8 *buf, int len)
 	case 1:
 		if (dlci->ops->receive_buf)
 			dlci->ops->receive_buf(dlci->ops, buf, len);
+		else
+			gsd_dlci_receive_buf(dlci, buf, len);
 		break;
 	default:
 		pr_warn("dlci%i adaption %i not yet implemented\n",
@@ -2550,7 +2565,7 @@ int gsm_serdev_register_dlci(struct gsm_serdev *gsd,
 
 	gsm = gsd->gsm;
 
-	if (!ops || !ops->line || !ops->receive_buf)
+	if (!ops || !ops->line)
 		return -EINVAL;
 
 	dlci = gsd_dlci_get(gsd, ops->line, true);
@@ -2673,6 +2688,54 @@ static struct serdev_device_ops gsd_client_ops = {
 	.write_wakeup = gsd_write_wakeup,
 };
 
+int gsm_serdev_register_tty_port(struct gsm_serdev *gsd, int line)
+{
+	struct gsm_serdev_dlci *ops;
+	unsigned int base;
+	int error;
+
+	if (line < 1)
+		return -EINVAL;
+
+	ops = kzalloc(sizeof(*ops), GFP_KERNEL);
+	if (!ops)
+		return -ENOMEM;
+
+	ops->line = line;
+
+	error = gsm_serdev_register_dlci(gsd, ops);
+	if (error) {
+		kfree(ops);
+
+		return error;
+	}
+
+	base = mux_num_to_base(gsd->gsm);
+	tty_register_device(gsm_tty_driver, base + ops->line, NULL);
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(gsm_serdev_register_tty_port);
+
+void gsm_serdev_unregister_tty_port(struct gsm_serdev *gsd, int line)
+{
+	struct gsm_dlci *dlci;
+	unsigned int base;
+
+	if (line < 1)
+		return;
+
+	dlci = gsd_dlci_get(gsd, line, false);
+	if (IS_ERR(dlci))
+		return;
+
+	base = mux_num_to_base(gsd->gsm);
+	tty_unregister_device(gsm_tty_driver, base + line);
+	gsm_serdev_unregister_dlci(gsd, dlci->ops);
+	kfree(dlci->ops);
+}
+EXPORT_SYMBOL_GPL(gsm_serdev_unregister_tty_port);
+
 int gsm_serdev_register_device(struct gsm_serdev *gsd)
 {
 	struct gsm_mux *gsm;
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
@@ -0,0 +1,156 @@
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
+#include <linux/serdev.h>
+#include <linux/serdev-gsm.h>
+
+#include <uapi/linux/gsmmux.h>
+
+#define TS27010_C_N2		3	/* TS 27.010 default value */
+#define TS27010_NUM_DLCI	16
+
+struct serdev_ngsm {
+	struct device *dev;
+	struct gsm_serdev gsd;
+};
+
+static int serdev_ngsm_set_config_adaption1(struct device *dev,
+					    int retransmissions)
+{
+	struct serdev_ngsm *ddata = gsm_serdev_get_drvdata(dev);
+	struct gsm_serdev *gsd = &ddata->gsd;
+	struct gsm_config c;
+	int err;
+
+	err = gsm_serdev_get_config(gsd, &c);
+	if (err)
+		return err;
+
+	c.i = 1;		/* 1 = UIH, 2 = UI */
+	c.initiator = 1;
+	c.encapsulation = 0;	/* basic mode */
+	c.adaption = 1;
+	c.mru = 1024;		/* from android TS 27010 driver */
+	c.mtu = 1024;		/* from android TS 27010 driver */
+	c.t1 = 10;		/* ack timer, default 10ms */
+	c.t2 = 34;		/* response timer, default 34 */
+	c.n2 = retransmissions;	/* retransmissions, default 3 */
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
+
+	serdev_device_write_buf(serdev, data, len);
+
+	return len;
+}
+
+static const struct of_device_id serdev_ngsm_id_table[] = {
+	{ .compatible = "3gpp,ts27010-adaption1", },
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
+	int err, i;
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
+
+	gsd = &ddata->gsd;
+	gsd->serdev = serdev;
+	gsd->output = serdev_ngsm_output;
+	serdev_device_set_drvdata(serdev, gsd);
+	gsm_serdev_set_drvdata(dev, ddata);
+
+	err = gsm_serdev_register_device(gsd);
+	if (err)
+		goto err_disable;
+
+	err = serdev_device_open(gsd->serdev);
+	if (err)
+		goto err_disable;
+
+	serdev_device_set_baudrate(gsd->serdev, 115200);
+	serdev_device_set_rts(gsd->serdev, true);
+	serdev_device_set_flow_control(gsd->serdev, true);
+
+	err = serdev_ngsm_set_config_adaption1(dev, TS27010_C_N2);
+	if (err)
+		goto err_close;
+
+	/* Start from dlci1 as dlci0 is reserved control channel */
+	for (i = 1; i < TS27010_NUM_DLCI; i++) {
+		err = gsm_serdev_register_tty_port(gsd, i);
+		if (err)
+			dev_warn(dev, "tty init failed for dlci%i: %i\n",
+				 i, err);
+	}
+
+	return 0;
+
+err_close:
+	serdev_device_close(serdev);
+
+err_disable:
+	gsm_serdev_unregister_device(gsd);
+
+	return err;
+}
+
+static void serdev_ngsm_remove(struct serdev_device *serdev)
+{
+	struct gsm_serdev *gsd = serdev_device_get_drvdata(serdev);
+	int i;
+
+	for (i = 1; i < TS27010_NUM_DLCI; i++)
+		gsm_serdev_unregister_tty_port(gsd, i);
+
+	serdev_device_close(serdev);
+	gsm_serdev_unregister_device(gsd);
+}
+
+static struct serdev_device_driver serdev_ngsm_driver = {
+	.driver = {
+		.name = "serdev_ngsm",
+		.of_match_table = of_match_ptr(serdev_ngsm_id_table),
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
@@ -45,6 +45,8 @@ struct gsm_serdev_dlci {
 
 int gsm_serdev_register_device(struct gsm_serdev *gsd);
 void gsm_serdev_unregister_device(struct gsm_serdev *gsd);
+int gsm_serdev_register_tty_port(struct gsm_serdev *gsd, int line);
+void gsm_serdev_unregister_tty_port(struct gsm_serdev *gsd, int line);
 
 static inline void *gsm_serdev_get_drvdata(struct device *dev)
 {
@@ -108,6 +110,15 @@ void gsm_serdev_unregister_device(struct gsm_serdev *gsd)
 {
 }
 
+int gsm_serdev_register_tty_port(struct gsm_serdev *gsd, int line);
+{
+	return -ENODEV;
+}
+
+void gsm_serdev_unregister_tty_port(struct gsm_serdev *gsd, int line);
+{
+}
+
 static inline void *gsm_serdev_get_drvdata(struct device *dev)
 {
 	return NULL;
-- 
2.26.2
