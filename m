Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 501461667C9
	for <lists+linux-omap@lfdr.de>; Thu, 20 Feb 2020 20:59:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729073AbgBTT7v (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 20 Feb 2020 14:59:51 -0500
Received: from muru.com ([72.249.23.125]:56532 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728770AbgBTT7u (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 20 Feb 2020 14:59:50 -0500
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 9B6BC8168;
        Thu, 20 Feb 2020 20:00:32 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     Lee Jones <lee.jones@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Alan Cox <gnomes@lxorguk.ukuu.org.uk>, Jiri Slaby <jslaby@suse.cz>,
        Johan Hovold <johan@kernel.org>,
        Merlijn Wajer <merlijn@wizzup.org>,
        Pavel Machek <pavel@ucw.cz>,
        Peter Hurley <peter@hurleysoftware.com>,
        Rob Herring <robh@kernel.org>,
        Sebastian Reichel <sre@kernel.org>,
        linux-serial@vger.kernel.org, devicetree@vger.kernel.org,
        linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/4] tty: n_gsm: Add support for serdev drivers
Date:   Thu, 20 Feb 2020 11:59:40 -0800
Message-Id: <20200220195943.15314-2-tony@atomide.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200220195943.15314-1-tony@atomide.com>
References: <20200220195943.15314-1-tony@atomide.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

We can make use of serdev drivers to do simple device drivers for
TS 27.010 chanels, and we can handle vendor specific protocols on top
of TS 27.010 with serdev drivers.

So far this has been tested with Motorola droid4 where there is a custom
packet numbering protocol on top of TS 27.010 for the MDM6600 modem.

I initially though about adding the serdev support into a separate file,
but that will take some refactoring of n_gsm.c. And I'd like to have
things working first. Then later on we might want to consider splitting
n_gsm.c into three pieces for core, tty and serdev parts.

Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 drivers/tty/n_gsm.c        | 372 +++++++++++++++++++++++++++++++++++++
 include/linux/serdev-gsm.h | 168 +++++++++++++++++
 2 files changed, 540 insertions(+)
 create mode 100644 include/linux/serdev-gsm.h

diff --git a/drivers/tty/n_gsm.c b/drivers/tty/n_gsm.c
--- a/drivers/tty/n_gsm.c
+++ b/drivers/tty/n_gsm.c
@@ -39,6 +39,7 @@
 #include <linux/file.h>
 #include <linux/uaccess.h>
 #include <linux/module.h>
+#include <linux/serdev.h>
 #include <linux/timer.h>
 #include <linux/tty_flip.h>
 #include <linux/tty_driver.h>
@@ -50,6 +51,7 @@
 #include <linux/netdevice.h>
 #include <linux/etherdevice.h>
 #include <linux/gsmmux.h>
+#include <linux/serdev-gsm.h>
 
 static int debug;
 module_param(debug, int, 0600);
@@ -145,6 +147,7 @@ struct gsm_dlci {
 	/* Data handling callback */
 	void (*data)(struct gsm_dlci *dlci, const u8 *data, int len);
 	void (*prev_data)(struct gsm_dlci *dlci, const u8 *data, int len);
+	struct gsm_serdev_dlci *ops; /* serdev dlci ops, if used */
 	struct net_device *net; /* network interface, if created */
 };
 
@@ -179,6 +182,7 @@ struct gsm_control {
  */
 
 struct gsm_mux {
+	struct gsm_serdev *gsd;		/* Serial device bus data */
 	struct tty_struct *tty;		/* The tty our ldisc is bound to */
 	spinlock_t lock;
 	struct mutex mutex;
@@ -2326,6 +2330,374 @@ static int gsm_config(struct gsm_mux *gsm, struct gsm_config *c)
 	return 0;
 }
 
+#ifdef CONFIG_SERIAL_DEV_BUS
+
+/**
+ * gsm_serdev_get_config - read ts 27.010 config
+ * @gsd:	serdev-gsm instance
+ * @c:		ts 27.010 config data
+ *
+ * See gsm_copy_config_values() for more information.
+ */
+int gsm_serdev_get_config(struct gsm_serdev *gsd, struct gsm_config *c)
+{
+	struct gsm_mux *gsm;
+
+	if (!gsd || !gsd->gsm)
+		return -ENODEV;
+
+	gsm = gsd->gsm;
+
+	if (!c)
+		return -EINVAL;
+
+	gsm_copy_config_values(gsm, c);
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(gsm_serdev_get_config);
+
+/**
+ * gsm_serdev_set_config - set ts 27.010 config
+ * @gsd:	serdev-gsm instance
+ * @c:		ts 27.010 config data
+ *
+ * See gsm_config() for more information.
+ */
+int gsm_serdev_set_config(struct gsm_serdev *gsd, struct gsm_config *c)
+{
+	struct gsm_mux *gsm;
+
+	if (!gsd || !gsd->serdev || !gsd->gsm)
+		return -ENODEV;
+
+	gsm = gsd->gsm;
+
+	if (!c)
+		return -EINVAL;
+
+	return gsm_config(gsm, c);
+}
+EXPORT_SYMBOL_GPL(gsm_serdev_set_config);
+
+static struct gsm_dlci *gsd_dlci_get(struct gsm_serdev *gsd, int line,
+				     bool allocate)
+{
+	struct gsm_mux *gsm;
+	struct gsm_dlci *dlci;
+
+	if (!gsd || !gsd->gsm)
+		return ERR_PTR(-ENODEV);
+
+	gsm = gsd->gsm;
+
+	if (line < 1 || line >= 63)
+		return ERR_PTR(-EINVAL);
+
+	mutex_lock(&gsm->mutex);
+
+	if (gsm->dlci[line]) {
+		dlci = gsm->dlci[line];
+		goto unlock;
+	} else if (!allocate) {
+		dlci = ERR_PTR(-ENODEV);
+		goto unlock;
+	}
+
+	dlci = gsm_dlci_alloc(gsm, line);
+	if (!dlci) {
+		gsm = ERR_PTR(-ENOMEM);
+		goto unlock;
+	}
+
+	gsm->dlci[line] = dlci;
+
+unlock:
+	mutex_unlock(&gsm->mutex);
+
+	return dlci;
+}
+
+static void gsd_dlci_data(struct gsm_dlci *dlci, const u8 *buf, int len)
+{
+	struct gsm_mux *gsm = dlci->gsm;
+	struct gsm_serdev *gsd = gsm->gsd;
+
+	if (!gsd || !dlci->ops)
+		return;
+
+	switch (dlci->adaption) {
+	case 0:
+	case 1:
+		if (dlci->ops->receive_buf)
+			dlci->ops->receive_buf(dlci->ops, buf, len);
+		break;
+	default:
+		pr_warn("dlci%i adaption %i not yet implemented\n",
+			dlci->addr, dlci->adaption);
+		break;
+	}
+}
+
+/**
+ * gsm_serdev_write - write data to a ts 27.010 channel
+ * @gsd:	serdev-gsm instance
+ * @ops:	channel ops
+ * @buf:	write buffer
+ * @len:	buffer length
+ */
+int gsm_serdev_write(struct gsm_serdev *gsd, struct gsm_serdev_dlci *ops,
+		     const u8 *buf, int len)
+{
+	struct gsm_mux *gsm;
+	struct gsm_dlci *dlci;
+	struct gsm_msg *msg;
+	int h, size, total_size = 0;
+	u8 *dp;
+
+	if (!gsd || !gsd->gsm)
+		return -ENODEV;
+
+	gsm = gsd->gsm;
+
+	dlci = gsd_dlci_get(gsd, ops->line, false);
+	if (IS_ERR(dlci))
+		return PTR_ERR(dlci);
+
+	h = dlci->adaption - 1;
+
+	if (len > gsm->mtu)
+		len = gsm->mtu;
+
+	size = len + h;
+
+	msg = gsm_data_alloc(gsm, dlci->addr, size, gsm->ftype);
+	if (!msg)
+		return -ENOMEM;
+
+	dp = msg->data;
+	switch (dlci->adaption) {
+	case 1:
+		break;
+	case 2:
+		*dp++ = gsm_encode_modem(dlci);
+		break;
+	}
+	memcpy(dp, buf, len);
+	gsm_data_queue(dlci, msg);
+	total_size += size;
+
+	return total_size;
+}
+EXPORT_SYMBOL_GPL(gsm_serdev_write);
+
+/**
+ * gsm_serdev_data_kick - indicate more data can be transmitted
+ * @gsd:	serdev-gsm instance
+ *
+ * See gsm_data_kick() for more information.
+ */
+void gsm_serdev_data_kick(struct gsm_serdev *gsd)
+{
+	struct gsm_mux *gsm;
+	unsigned long flags;
+
+	if (!gsd || !gsd->gsm)
+		return;
+
+	gsm = gsd->gsm;
+
+	spin_lock_irqsave(&gsm->tx_lock, flags);
+	gsm_data_kick(gsm);
+	spin_unlock_irqrestore(&gsm->tx_lock, flags);
+}
+EXPORT_SYMBOL_GPL(gsm_serdev_data_kick);
+
+/**
+ * gsm_serdev_register_dlci - register a ts 27.010 channel
+ * @gsd:	serdev-gsm instance
+ * @ops:	channel ops
+ */
+int gsm_serdev_register_dlci(struct gsm_serdev *gsd,
+			     struct gsm_serdev_dlci *ops)
+{
+	struct gsm_dlci *dlci;
+	struct gsm_mux *gsm;
+	int retries;
+
+	if (!gsd || !gsd->gsm || !gsd->serdev)
+		return -ENODEV;
+
+	gsm = gsd->gsm;
+
+	if (!ops || !ops->line || !ops->receive_buf)
+		return -EINVAL;
+
+	dlci = gsd_dlci_get(gsd, ops->line, true);
+	if (IS_ERR(dlci))
+		return PTR_ERR(dlci);
+
+	if (dlci->state == DLCI_OPENING || dlci->state == DLCI_OPEN ||
+	    dlci->state == DLCI_CLOSING)
+		return -EBUSY;
+
+	mutex_lock(&dlci->mutex);
+	dlci->ops = ops;
+	dlci->modem_rx = 0;
+	dlci->prev_data = dlci->data;
+	dlci->data = gsd_dlci_data;
+	mutex_unlock(&dlci->mutex);
+
+	gsm_dlci_begin_open(dlci);
+
+	/*
+	 * Allow some time for dlci to move to DLCI_OPEN state. Otherwise
+	 * the serdev consumer driver can start sending data too early during
+	 * the setup, and the response will be missed by gms_queue() if we
+	 * still have DLCI_CLOSED state.
+	 */
+	for (retries = 10; retries > 0; retries--) {
+		if (dlci->state == DLCI_OPEN)
+			break;
+		msleep(100);
+	}
+
+	if (!retries)
+		dev_dbg(&gsd->serdev->dev, "dlci%i not currently active\n",
+			dlci->addr);
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(gsm_serdev_register_dlci);
+
+/**
+ * gsm_serdev_unregister_dlci - unregister a ts 27.010 channel
+ * @gsd:	serdev-gsm instance
+ * @ops:	channel ops
+ */
+void gsm_serdev_unregister_dlci(struct gsm_serdev *gsd,
+				struct gsm_serdev_dlci *ops)
+{
+	struct gsm_mux *gsm;
+	struct gsm_dlci *dlci;
+
+	if (!gsd || !gsd->gsm || !gsd->serdev)
+		return;
+
+	gsm = gsd->gsm;
+
+	if (!ops || !ops->line)
+		return;
+
+	dlci = gsd_dlci_get(gsd, ops->line, false);
+	if (IS_ERR(dlci))
+		return;
+
+	mutex_lock(&dlci->mutex);
+	gsm_destroy_network(dlci);
+	dlci->data = dlci->prev_data;
+	dlci->ops = NULL;
+	mutex_unlock(&dlci->mutex);
+
+	gsm_dlci_begin_close(dlci);
+}
+EXPORT_SYMBOL_GPL(gsm_serdev_unregister_dlci);
+
+static int gsm_serdev_output(struct gsm_mux *gsm, u8 *data, int len)
+{
+	struct gsm_serdev *gsd = gsm->gsd;
+	struct serdev_device *serdev = gsm->gsd->serdev;
+	bool asleep;
+
+	asleep = atomic_read(&gsd->asleep);
+	if (asleep)
+		return -ENOSPC;
+
+	if (gsm->gsd->output)
+		return gsm->gsd->output(gsm->gsd, data, len);
+	else
+		return serdev_device_write_buf(serdev, data, len);
+}
+
+static int gsd_receive_buf(struct serdev_device *serdev, const u8 *data,
+			   size_t count)
+{
+	struct gsm_serdev *gsd = serdev_device_get_drvdata(serdev);
+	struct gsm_mux *gsm;
+	const unsigned char *dp;
+	int i;
+
+	if (WARN_ON(!gsd))
+		return 0;
+
+	gsm = gsd->gsm;
+
+	if (debug & 4)
+		print_hex_dump_bytes("gsd_receive_buf: ",
+				     DUMP_PREFIX_OFFSET,
+				     data, count);
+
+	for (i = count, dp = data; i; i--, dp++)
+		gsm->receive(gsm, *dp);
+
+	return count;
+}
+
+static void gsd_write_wakeup(struct serdev_device *serdev)
+{
+	serdev_device_write_wakeup(serdev);
+}
+
+static struct serdev_device_ops gsd_client_ops = {
+	.receive_buf = gsd_receive_buf,
+	.write_wakeup = gsd_write_wakeup,
+};
+
+int gsm_serdev_register_device(struct gsm_serdev *gsd)
+{
+	struct gsm_mux *gsm;
+	int error;
+
+	if (WARN(!gsd || !gsd->serdev || !gsd->output,
+		 "serdev and output must be initialized\n"))
+		return -EINVAL;
+
+	serdev_device_set_client_ops(gsd->serdev, &gsd_client_ops);
+
+	gsm = gsm_alloc_mux();
+	if (!gsm)
+		return -ENOMEM;
+
+	gsm->encoding = 1;
+	gsm->tty = NULL;
+	gsm->gsd = gsd;
+	gsm->output = gsm_serdev_output;
+	atomic_set(&gsd->asleep, 0);
+	gsd->gsm = gsm;
+	mux_get(gsd->gsm);
+
+	error = gsm_activate_mux(gsd->gsm);
+	if (error) {
+		gsm_cleanup_mux(gsd->gsm);
+		mux_put(gsd->gsm);
+
+		return error;
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(gsm_serdev_register_device);
+
+void gsm_serdev_unregister_device(struct gsm_serdev *gsd)
+{
+	gsm_cleanup_mux(gsd->gsm);
+	mux_put(gsd->gsm);
+	gsd->gsm = NULL;
+}
+EXPORT_SYMBOL_GPL(gsm_serdev_unregister_device);
+
+#endif	/* CONFIG_SERIAL_DEV_BUS */
+
 /**
  *	gsmld_output		-	write to link
  *	@gsm: our mux
diff --git a/include/linux/serdev-gsm.h b/include/linux/serdev-gsm.h
new file mode 100644
--- /dev/null
+++ b/include/linux/serdev-gsm.h
@@ -0,0 +1,168 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+#ifndef _LINUX_SERDEV_GSM_H
+#define _LINUX_SERDEV_GSM_H
+
+#include <linux/device.h>
+#include <linux/serdev.h>
+#include <linux/types.h>
+
+struct gsm_serdev_dlci;
+struct gsm_config;
+
+/**
+ * struct gsm_serdev - serdev-gsm instance
+ * @serdev:		serdev instance
+ * @gsm:		ts 27.010 n_gsm instance
+ * @asleep:		device is in idle state
+ * @drvdata:		serdev-gsm consumer driver data
+ * @output:		read data from ts 27.010 channel
+ *
+ * Currently only serdev and output must be initialized, the rest are
+ * are initialized by gsm_serdev_register_dlci().
+ */
+struct gsm_serdev {
+	struct serdev_device *serdev;
+	struct gsm_mux *gsm;
+	atomic_t asleep;
+	void *drvdata;
+	int (*output)(struct gsm_serdev *gsd, u8 *data, int len);
+};
+
+/**
+ * struct gsm_serdev_dlci - serdev-gsm ts 27.010 channel data
+ * @line:		ts 27.010 channel, control channel 0 is not available
+ * @receive_buf:	function to handle data received for the channel
+ */
+struct gsm_serdev_dlci {
+	int line;
+	int (*receive_buf)(struct gsm_serdev_dlci *ops,
+			   const unsigned char *buf,
+			   size_t len);
+};
+
+#if IS_ENABLED(CONFIG_N_GSM) && IS_ENABLED(CONFIG_SERIAL_DEV_BUS)
+
+int gsm_serdev_register_device(struct gsm_serdev *gsd);
+void gsm_serdev_unregister_device(struct gsm_serdev *gsd);
+
+static inline void *gsm_serdev_get_drvdata(struct device *dev)
+{
+	struct serdev_device *serdev = to_serdev_device(dev);
+	struct gsm_serdev *gsd = serdev_device_get_drvdata(serdev);
+
+	if (gsd)
+		return gsd->drvdata;
+
+	return NULL;
+}
+
+static inline void gsm_serdev_set_drvdata(struct device *dev, void *drvdata)
+{
+	struct serdev_device *serdev = to_serdev_device(dev);
+	struct gsm_serdev *gsd = serdev_device_get_drvdata(serdev);
+
+	if (gsd)
+		gsd->drvdata = drvdata;
+}
+
+static inline void gsm_serdev_suspend(struct gsm_serdev *gsd)
+{
+	if (!gsd)
+		return;
+
+	atomic_set(&gsd->asleep, 1);
+}
+
+static inline int gsm_serdev_resume(struct gsm_serdev *gsd)
+{
+	if (!gsd)
+		return -EINVAL;
+
+	atomic_set(&gsd->asleep, 0);
+
+	return 0;
+}
+
+extern int gsm_serdev_get_config(struct gsm_serdev *gsd, struct gsm_config *c);
+extern int gsm_serdev_set_config(struct gsm_serdev *gsd, struct gsm_config *c);
+extern int gsm_serdev_register_dlci(struct gsm_serdev *gsd,
+				    struct gsm_serdev_dlci *ops);
+extern void gsm_serdev_unregister_dlci(struct gsm_serdev *gsd,
+				       struct gsm_serdev_dlci *ops);
+extern int gsm_serdev_write(struct gsm_serdev *gsd,
+			    struct gsm_serdev_dlci *ops,
+			    const u8 *buf, int len);
+extern void gsm_serdev_data_kick(struct gsm_serdev *gsd);
+
+#else	/* CONFIG_SERIAL_DEV_BUS */
+
+static inline
+int gsm_serdev_register_device(struct gsm_serdev *gsd)
+{
+	return -ENODEV;
+}
+
+static inline
+void gsm_serdev_unregister_device(struct gsm_serdev *gsd)
+{
+}
+
+static inline void *gsm_serdev_get_drvdata(struct device *dev)
+{
+	return NULL;
+}
+
+static inline
+void gsm_serdev_set_drvdata(struct device *dev, void *drvdata)
+{
+}
+
+static inline void gsm_serdev_suspend(struct gsm_serdev *gsd)
+{
+}
+
+static inline int gsm_serdev_resume(struct gsm_serdev *gsd)
+{
+	return -ENODEV;
+}
+
+static inline
+int gsm_serdev_get_config(struct gsm_serdev *gsd, struct gsm_config *c)
+{
+	return -ENODEV;
+}
+
+static inline
+int gsm_serdev_set_config(struct gsm_serdev *gsd, struct gsm_config *c)
+{
+	return -ENODEV;
+}
+
+static inline
+int gsm_serdev_register_dlci(struct gsm_serdev *gsd,
+			     struct gsm_serdev_dlci *ops)
+{
+	return -ENODEV;
+}
+
+static inline
+void gsm_serdev_unregister_dlci(struct gsm_serdev *gsd,
+				struct gsm_serdev_dlci *ops)
+{
+}
+
+static inline
+int gsm_serdev_write(struct gsm_serdev *gsd, struct gsm_serdev_dlci *ops,
+		     const u8 *buf, int len)
+{
+	return -ENODEV;
+}
+
+static inline
+void gsm_serdev_data_kick(struct gsm_serdev *gsd)
+{
+}
+
+#endif	/* CONFIG_N_GSM && CONFIG_SERIAL_DEV_BUS */
+#endif	/* _LINUX_SERDEV_GSM_H */
-- 
2.25.1
