Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9B2BD121FE3
	for <lists+linux-omap@lfdr.de>; Tue, 17 Dec 2019 01:41:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727427AbfLQAk5 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 16 Dec 2019 19:40:57 -0500
Received: from muru.com ([72.249.23.125]:48864 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726556AbfLQAk5 (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 16 Dec 2019 19:40:57 -0500
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id E6FCD8126;
        Tue, 17 Dec 2019 00:41:33 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     Evgeniy Polyakov <zbr@ioremap.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org,
        Adam Ford <aford173@gmail.com>,
        "Andrew F . Davis" <afd@ti.com>,
        Andreas Kemnade <andreas@kemnade.info>,
        "H . Nikolaus Schaller" <hns@goldelico.com>,
        Vignesh R <vigneshr@ti.com>
Subject: [PATCHv3] w1: omap-hdq: Simplify driver with PM runtime autosuspend
Date:   Mon, 16 Dec 2019 16:40:48 -0800
Message-Id: <20191217004048.46298-1-tony@atomide.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

We've had generic code handling module sysconfig and OCP reset registers
for omap variants for many years now and all the drivers really needs to
do is just call runtime PM functions.

Looks like the omap-hdq driver got only partially updated over the years
to use runtime PM, and still has lots of custom PM code left.

We can replace all the custom code for sysconfig, OCP reset, and PM with
just a few lines of runtime PM autosuspend code.

In order to set the device mode properly when pm_runtime_get_sync() is
called during probe, we need to also move parsing of "ti,mode" to happen
earlier before we call pm_runtime_enable().

Since we now disable interrupts lazily in omap_hdq_runtime_suspend(), we
must remove the call to hdq_disable_interrupt() in omap_w1_read_byte().
And we must clear irqstatus calling wait_event_timeout() on it, so let's
add hdq_reset_irqstatus() for that.

Note that the earlier driver specific usage count limit of four seems
completely artificial and should not be an issue in normal use.

Cc: Adam Ford <aford173@gmail.com>
Cc: Andrew F. Davis <afd@ti.com>
Cc: Andreas Kemnade <andreas@kemnade.info>
Cc: H. Nikolaus Schaller <hns@goldelico.com>
Cc: Vignesh R <vigneshr@ti.com>
Tested-by: Andreas Kemnade <andreas@kemnade.info> # gta04
Tested-by: Adam Ford <aford173@gmail.com> #logicpd-torpedo-37xx-devkit
Signed-off-by: Tony Lindgren <tony@atomide.com>
---

Changes since v2:

- Added hdq_reset_irqstatus() and fixed up the calls so ti,mode = "1w"
  works

- Kept earlier Tested-by from Adam and Andreas as the hdq_reset_irqstatus()
  fix only affected "1w" mode and not "hdq" mode

Changes since v1:

- Drop call to hdq_disable_interrupt() as we now disable interrupts
  lazily un runtime_suspend

- Parse "ti,mode" earlier before first pm_runtime_get_sync() so the
  mode gets set properly also during the probe


 drivers/w1/masters/omap_hdq.c | 348 +++++++++++-----------------------
 1 file changed, 113 insertions(+), 235 deletions(-)

diff --git a/drivers/w1/masters/omap_hdq.c b/drivers/w1/masters/omap_hdq.c
--- a/drivers/w1/masters/omap_hdq.c
+++ b/drivers/w1/masters/omap_hdq.c
@@ -38,12 +38,6 @@
 #define OMAP_HDQ_INT_STATUS_TXCOMPLETE		BIT(2)
 #define OMAP_HDQ_INT_STATUS_RXCOMPLETE		BIT(1)
 #define OMAP_HDQ_INT_STATUS_TIMEOUT		BIT(0)
-#define OMAP_HDQ_SYSCONFIG			0x14
-#define OMAP_HDQ_SYSCONFIG_SOFTRESET		BIT(1)
-#define OMAP_HDQ_SYSCONFIG_AUTOIDLE		BIT(0)
-#define OMAP_HDQ_SYSCONFIG_NOIDLE		0x0
-#define OMAP_HDQ_SYSSTATUS			0x18
-#define OMAP_HDQ_SYSSTATUS_RESETDONE		BIT(0)
 
 #define OMAP_HDQ_FLAG_CLEAR			0
 #define OMAP_HDQ_FLAG_SET			1
@@ -62,17 +56,9 @@ struct hdq_data {
 	void __iomem		*hdq_base;
 	/* lock status update */
 	struct  mutex		hdq_mutex;
-	int			hdq_usecount;
 	u8			hdq_irqstatus;
 	/* device lock */
 	spinlock_t		hdq_spinlock;
-	/*
-	 * Used to control the call to omap_hdq_get and omap_hdq_put.
-	 * HDQ Protocol: Write the CMD|REG_address first, followed by
-	 * the data wrire or read.
-	 */
-	int			init_trans;
-	int                     rrw;
 	/* mode: 0-HDQ 1-W1 */
 	int                     mode;
 
@@ -99,15 +85,6 @@ static inline u8 hdq_reg_merge(struct hdq_data *hdq_data, u32 offset,
 	return new_val;
 }
 
-static void hdq_disable_interrupt(struct hdq_data *hdq_data, u32 offset,
-				  u32 mask)
-{
-	u32 ie;
-
-	ie = readl(hdq_data->hdq_base + offset);
-	writel(ie & mask, hdq_data->hdq_base + offset);
-}
-
 /*
  * Wait for one or more bits in flag change.
  * HDQ_FLAG_SET: wait until any bit in the flag is set.
@@ -142,22 +119,24 @@ static int hdq_wait_for_flag(struct hdq_data *hdq_data, u32 offset,
 	return ret;
 }
 
+/* Clear saved irqstatus after using an interrupt */
+static void hdq_reset_irqstatus(struct hdq_data *hdq_data)
+{
+	unsigned long irqflags;
+
+	spin_lock_irqsave(&hdq_data->hdq_spinlock, irqflags);
+	hdq_data->hdq_irqstatus = 0;
+	spin_unlock_irqrestore(&hdq_data->hdq_spinlock, irqflags);
+}
+
 /* write out a byte and fill *status with HDQ_INT_STATUS */
 static int hdq_write_byte(struct hdq_data *hdq_data, u8 val, u8 *status)
 {
 	int ret;
 	u8 tmp_status;
-	unsigned long irqflags;
 
 	*status = 0;
 
-	spin_lock_irqsave(&hdq_data->hdq_spinlock, irqflags);
-	/* clear interrupt flags via a dummy read */
-	hdq_reg_in(hdq_data, OMAP_HDQ_INT_STATUS);
-	/* ISR loads it with new INT_STATUS */
-	hdq_data->hdq_irqstatus = 0;
-	spin_unlock_irqrestore(&hdq_data->hdq_spinlock, irqflags);
-
 	hdq_reg_out(hdq_data, OMAP_HDQ_TX_DATA, val);
 
 	/* set the GO bit */
@@ -191,6 +170,7 @@ static int hdq_write_byte(struct hdq_data *hdq_data, u8 val, u8 *status)
 	}
 
 out:
+	hdq_reset_irqstatus(hdq_data);
 	return ret;
 }
 
@@ -237,47 +217,11 @@ static void omap_w1_search_bus(void *_hdq, struct w1_master *master_dev,
 	slave_found(master_dev, id);
 }
 
-static int _omap_hdq_reset(struct hdq_data *hdq_data)
-{
-	int ret;
-	u8 tmp_status;
-
-	hdq_reg_out(hdq_data, OMAP_HDQ_SYSCONFIG,
-		    OMAP_HDQ_SYSCONFIG_SOFTRESET);
-	/*
-	 * Select HDQ/1W mode & enable clocks.
-	 * It is observed that INT flags can't be cleared via a read and GO/INIT
-	 * won't return to zero if interrupt is disabled. So we always enable
-	 * interrupt.
-	 */
-	hdq_reg_out(hdq_data, OMAP_HDQ_CTRL_STATUS,
-		OMAP_HDQ_CTRL_STATUS_CLOCKENABLE |
-		OMAP_HDQ_CTRL_STATUS_INTERRUPTMASK);
-
-	/* wait for reset to complete */
-	ret = hdq_wait_for_flag(hdq_data, OMAP_HDQ_SYSSTATUS,
-		OMAP_HDQ_SYSSTATUS_RESETDONE, OMAP_HDQ_FLAG_SET, &tmp_status);
-	if (ret)
-		dev_dbg(hdq_data->dev, "timeout waiting HDQ reset, %x",
-				tmp_status);
-	else {
-		hdq_reg_out(hdq_data, OMAP_HDQ_CTRL_STATUS,
-			OMAP_HDQ_CTRL_STATUS_CLOCKENABLE |
-			OMAP_HDQ_CTRL_STATUS_INTERRUPTMASK |
-			hdq_data->mode);
-		hdq_reg_out(hdq_data, OMAP_HDQ_SYSCONFIG,
-			OMAP_HDQ_SYSCONFIG_AUTOIDLE);
-	}
-
-	return ret;
-}
-
 /* Issue break pulse to the device */
 static int omap_hdq_break(struct hdq_data *hdq_data)
 {
 	int ret = 0;
 	u8 tmp_status;
-	unsigned long irqflags;
 
 	ret = mutex_lock_interruptible(&hdq_data->hdq_mutex);
 	if (ret < 0) {
@@ -286,13 +230,6 @@ static int omap_hdq_break(struct hdq_data *hdq_data)
 		goto rtn;
 	}
 
-	spin_lock_irqsave(&hdq_data->hdq_spinlock, irqflags);
-	/* clear interrupt flags via a dummy read */
-	hdq_reg_in(hdq_data, OMAP_HDQ_INT_STATUS);
-	/* ISR loads it with new INT_STATUS */
-	hdq_data->hdq_irqstatus = 0;
-	spin_unlock_irqrestore(&hdq_data->hdq_spinlock, irqflags);
-
 	/* set the INIT and GO bit */
 	hdq_reg_merge(hdq_data, OMAP_HDQ_CTRL_STATUS,
 		OMAP_HDQ_CTRL_STATUS_INITIALIZATION | OMAP_HDQ_CTRL_STATUS_GO,
@@ -341,6 +278,7 @@ static int omap_hdq_break(struct hdq_data *hdq_data)
 			" return to zero, %x", tmp_status);
 
 out:
+	hdq_reset_irqstatus(hdq_data);
 	mutex_unlock(&hdq_data->hdq_mutex);
 rtn:
 	return ret;
@@ -357,7 +295,7 @@ static int hdq_read_byte(struct hdq_data *hdq_data, u8 *val)
 		goto rtn;
 	}
 
-	if (!hdq_data->hdq_usecount) {
+	if (pm_runtime_suspended(hdq_data->dev)) {
 		ret = -EINVAL;
 		goto out;
 	}
@@ -388,86 +326,13 @@ static int hdq_read_byte(struct hdq_data *hdq_data, u8 *val)
 	/* the data is ready. Read it in! */
 	*val = hdq_reg_in(hdq_data, OMAP_HDQ_RX_DATA);
 out:
+	hdq_reset_irqstatus(hdq_data);
 	mutex_unlock(&hdq_data->hdq_mutex);
 rtn:
 	return ret;
 
 }
 
-/* Enable clocks and set the controller to HDQ/1W mode */
-static int omap_hdq_get(struct hdq_data *hdq_data)
-{
-	int ret = 0;
-
-	ret = mutex_lock_interruptible(&hdq_data->hdq_mutex);
-	if (ret < 0) {
-		ret = -EINTR;
-		goto rtn;
-	}
-
-	if (OMAP_HDQ_MAX_USER == hdq_data->hdq_usecount) {
-		dev_dbg(hdq_data->dev, "attempt to exceed the max use count");
-		ret = -EINVAL;
-		goto out;
-	} else {
-		hdq_data->hdq_usecount++;
-		try_module_get(THIS_MODULE);
-		if (1 == hdq_data->hdq_usecount) {
-
-			pm_runtime_get_sync(hdq_data->dev);
-
-			/* make sure HDQ/1W is out of reset */
-			if (!(hdq_reg_in(hdq_data, OMAP_HDQ_SYSSTATUS) &
-				OMAP_HDQ_SYSSTATUS_RESETDONE)) {
-				ret = _omap_hdq_reset(hdq_data);
-				if (ret)
-					/* back up the count */
-					hdq_data->hdq_usecount--;
-			} else {
-				/* select HDQ/1W mode & enable clocks */
-				hdq_reg_out(hdq_data, OMAP_HDQ_CTRL_STATUS,
-					OMAP_HDQ_CTRL_STATUS_CLOCKENABLE |
-					OMAP_HDQ_CTRL_STATUS_INTERRUPTMASK |
-					hdq_data->mode);
-				hdq_reg_out(hdq_data, OMAP_HDQ_SYSCONFIG,
-					OMAP_HDQ_SYSCONFIG_NOIDLE);
-				hdq_reg_in(hdq_data, OMAP_HDQ_INT_STATUS);
-			}
-		}
-	}
-
-out:
-	mutex_unlock(&hdq_data->hdq_mutex);
-rtn:
-	return ret;
-}
-
-/* Disable clocks to the module */
-static int omap_hdq_put(struct hdq_data *hdq_data)
-{
-	int ret = 0;
-
-	ret = mutex_lock_interruptible(&hdq_data->hdq_mutex);
-	if (ret < 0)
-		return -EINTR;
-
-	hdq_reg_out(hdq_data, OMAP_HDQ_SYSCONFIG,
-		    OMAP_HDQ_SYSCONFIG_AUTOIDLE);
-	if (0 == hdq_data->hdq_usecount) {
-		dev_dbg(hdq_data->dev, "attempt to decrement use count"
-			" when it is zero");
-		ret = -EINVAL;
-	} else {
-		hdq_data->hdq_usecount--;
-		module_put(THIS_MODULE);
-		if (0 == hdq_data->hdq_usecount)
-			pm_runtime_put_sync(hdq_data->dev);
-	}
-	mutex_unlock(&hdq_data->hdq_mutex);
-
-	return ret;
-}
-
 /*
  * W1 triplet callback function - used for searching ROM addresses.
  * Registered only when controller is in 1-wire mode.
@@ -482,7 +347,12 @@ static u8 omap_w1_triplet(void *_hdq, u8 bdir)
 		  OMAP_HDQ_CTRL_STATUS_INTERRUPTMASK;
 	u8 mask = ctrl | OMAP_HDQ_CTRL_STATUS_DIR;
 
-	omap_hdq_get(_hdq);
+	err = pm_runtime_get_sync(hdq_data->dev);
+	if (err < 0) {
+		pm_runtime_put_noidle(hdq_data->dev);
+
+		return err;
+	}
 
 	err = mutex_lock_interruptible(&hdq_data->hdq_mutex);
 	if (err < 0) {
@@ -490,7 +360,6 @@ static u8 omap_w1_triplet(void *_hdq, u8 bdir)
 		goto rtn;
 	}
 
-	hdq_data->hdq_irqstatus = 0;
 	/* read id_bit */
 	hdq_reg_merge(_hdq, OMAP_HDQ_CTRL_STATUS,
 		      ctrl | OMAP_HDQ_CTRL_STATUS_DIR, mask);
@@ -504,7 +373,9 @@ static u8 omap_w1_triplet(void *_hdq, u8 bdir)
 	}
 	id_bit = (hdq_reg_in(_hdq, OMAP_HDQ_RX_DATA) & 0x01);
 
-	hdq_data->hdq_irqstatus = 0;
+	/* Must clear irqstatus for another RXCOMPLETE interrupt */
+	hdq_reset_irqstatus(hdq_data);
+
 	/* read comp_bit */
 	hdq_reg_merge(_hdq, OMAP_HDQ_CTRL_STATUS,
 		      ctrl | OMAP_HDQ_CTRL_STATUS_DIR, mask);
@@ -547,18 +418,33 @@ static u8 omap_w1_triplet(void *_hdq, u8 bdir)
 		      OMAP_HDQ_CTRL_STATUS_SINGLE);
 
 out:
+	hdq_reset_irqstatus(hdq_data);
 	mutex_unlock(&hdq_data->hdq_mutex);
 rtn:
-	omap_hdq_put(_hdq);
+	pm_runtime_mark_last_busy(hdq_data->dev);
+	pm_runtime_put_autosuspend(hdq_data->dev);
+
 	return ret;
 }
 
 /* reset callback */
 static u8 omap_w1_reset_bus(void *_hdq)
 {
-	omap_hdq_get(_hdq);
-	omap_hdq_break(_hdq);
-	omap_hdq_put(_hdq);
+	struct hdq_data *hdq_data = _hdq;
+	int err;
+
+	err = pm_runtime_get_sync(hdq_data->dev);
+	if (err < 0) {
+		pm_runtime_put_noidle(hdq_data->dev);
+
+		return err;
+	}
+
+	omap_hdq_break(hdq_data);
+
+	pm_runtime_mark_last_busy(hdq_data->dev);
+	pm_runtime_put_autosuspend(hdq_data->dev);
+
 	return 0;
 }
 
@@ -569,37 +455,19 @@ static u8 omap_w1_read_byte(void *_hdq)
 	u8 val = 0;
 	int ret;
 
-	/* First write to initialize the transfer */
-	if (hdq_data->init_trans == 0)
-		omap_hdq_get(hdq_data);
+	ret = pm_runtime_get_sync(hdq_data->dev);
+	if (ret < 0) {
+		pm_runtime_put_noidle(hdq_data->dev);
 
-	ret = hdq_read_byte(hdq_data, &val);
-	if (ret) {
-		ret = mutex_lock_interruptible(&hdq_data->hdq_mutex);
-		if (ret < 0) {
-			dev_dbg(hdq_data->dev, "Could not acquire mutex\n");
-			return -EINTR;
-		}
-		hdq_data->init_trans = 0;
-		mutex_unlock(&hdq_data->hdq_mutex);
-		omap_hdq_put(hdq_data);
 		return -1;
 	}
 
-	hdq_disable_interrupt(hdq_data, OMAP_HDQ_CTRL_STATUS,
-			      ~OMAP_HDQ_CTRL_STATUS_INTERRUPTMASK);
+	ret = hdq_read_byte(hdq_data, &val);
+	if (ret)
+		ret = -1;
 
-	/* Write followed by a read, release the module */
-	if (hdq_data->init_trans) {
-		ret = mutex_lock_interruptible(&hdq_data->hdq_mutex);
-		if (ret < 0) {
-			dev_dbg(hdq_data->dev, "Could not acquire mutex\n");
-			return -EINTR;
-		}
-		hdq_data->init_trans = 0;
-		mutex_unlock(&hdq_data->hdq_mutex);
-		omap_hdq_put(hdq_data);
-	}
+	pm_runtime_mark_last_busy(hdq_data->dev);
+	pm_runtime_put_autosuspend(hdq_data->dev);
 
 	return val;
 }
@@ -611,9 +479,12 @@ static void omap_w1_write_byte(void *_hdq, u8 byte)
 	int ret;
 	u8 status;
 
-	/* First write to initialize the transfer */
-	if (hdq_data->init_trans == 0)
-		omap_hdq_get(hdq_data);
+	ret = pm_runtime_get_sync(hdq_data->dev);
+	if (ret < 0) {
+		pm_runtime_put_noidle(hdq_data->dev);
+
+		return;
+	}
 
 	/*
 	 * We need to reset the slave before
@@ -623,31 +494,15 @@ static void omap_w1_write_byte(void *_hdq, u8 byte)
 	if (byte == W1_SKIP_ROM)
 		omap_hdq_break(hdq_data);
 
-	ret = mutex_lock_interruptible(&hdq_data->hdq_mutex);
-	if (ret < 0) {
-		dev_dbg(hdq_data->dev, "Could not acquire mutex\n");
-		return;
-	}
-	hdq_data->init_trans++;
-	mutex_unlock(&hdq_data->hdq_mutex);
-
 	ret = hdq_write_byte(hdq_data, byte, &status);
 	if (ret < 0) {
 		dev_dbg(hdq_data->dev, "TX failure:Ctrl status %x\n", status);
-		return;
+		goto out_err;
 	}
 
-	/* Second write, data transferred. Release the module */
-	if (hdq_data->init_trans > 1) {
-		omap_hdq_put(hdq_data);
-		ret = mutex_lock_interruptible(&hdq_data->hdq_mutex);
-		if (ret < 0) {
-			dev_dbg(hdq_data->dev, "Could not acquire mutex\n");
-			return;
-		}
-		hdq_data->init_trans = 0;
-		mutex_unlock(&hdq_data->hdq_mutex);
-	}
+out_err:
+	pm_runtime_mark_last_busy(hdq_data->dev);
+	pm_runtime_put_autosuspend(hdq_data->dev);
 }
 
 static struct w1_bus_master omap_w1_master = {
@@ -656,6 +511,35 @@ static struct w1_bus_master omap_w1_master = {
 	.reset_bus	= omap_w1_reset_bus,
 };
 
+static int __maybe_unused omap_hdq_runtime_suspend(struct device *dev)
+{
+	struct hdq_data *hdq_data = dev_get_drvdata(dev);
+
+	hdq_reg_out(hdq_data, 0, hdq_data->mode);
+	hdq_reg_in(hdq_data, OMAP_HDQ_INT_STATUS);
+
+	return 0;
+}
+
+static int __maybe_unused omap_hdq_runtime_resume(struct device *dev)
+{
+	struct hdq_data *hdq_data = dev_get_drvdata(dev);
+
+	/* select HDQ/1W mode & enable clocks */
+	hdq_reg_out(hdq_data, OMAP_HDQ_CTRL_STATUS,
+		    OMAP_HDQ_CTRL_STATUS_CLOCKENABLE |
+		    OMAP_HDQ_CTRL_STATUS_INTERRUPTMASK |
+		    hdq_data->mode);
+	hdq_reg_in(hdq_data, OMAP_HDQ_INT_STATUS);
+
+	return 0;
+}
+
+static const struct dev_pm_ops omap_hdq_pm_ops = {
+	SET_RUNTIME_PM_OPS(omap_hdq_runtime_suspend,
+			   omap_hdq_runtime_resume, NULL)
+};
+
 static int omap_hdq_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -677,23 +561,27 @@ static int omap_hdq_probe(struct platform_device *pdev)
 	if (IS_ERR(hdq_data->hdq_base))
 		return PTR_ERR(hdq_data->hdq_base);
 
-	hdq_data->hdq_usecount = 0;
-	hdq_data->rrw = 0;
 	mutex_init(&hdq_data->hdq_mutex);
 
+	ret = of_property_read_string(pdev->dev.of_node, "ti,mode", &mode);
+	if (ret < 0 || !strcmp(mode, "hdq")) {
+		hdq_data->mode = 0;
+		omap_w1_master.search = omap_w1_search_bus;
+	} else {
+		hdq_data->mode = 1;
+		omap_w1_master.triplet = omap_w1_triplet;
+	}
+
 	pm_runtime_enable(&pdev->dev);
+	pm_runtime_use_autosuspend(&pdev->dev);
+	pm_runtime_set_autosuspend_delay(&pdev->dev, 300);
 	ret = pm_runtime_get_sync(&pdev->dev);
 	if (ret < 0) {
+		pm_runtime_put_noidle(&pdev->dev);
 		dev_dbg(&pdev->dev, "pm_runtime_get_sync failed\n");
 		goto err_w1;
 	}
 
-	ret = _omap_hdq_reset(hdq_data);
-	if (ret) {
-		dev_dbg(&pdev->dev, "reset failed\n");
-		goto err_irq;
-	}
-
 	rev = hdq_reg_in(hdq_data, OMAP_HDQ_REVISION);
 	dev_info(&pdev->dev, "OMAP HDQ Hardware Rev %c.%c. Driver in %s mode\n",
 		(rev >> 4) + '0', (rev & 0x0f) + '0', "Interrupt");
@@ -715,16 +603,8 @@ static int omap_hdq_probe(struct platform_device *pdev)
 
 	omap_hdq_break(hdq_data);
 
-	pm_runtime_put_sync(&pdev->dev);
-
-	ret = of_property_read_string(pdev->dev.of_node, "ti,mode", &mode);
-	if (ret < 0 || !strcmp(mode, "hdq")) {
-		hdq_data->mode = 0;
-		omap_w1_master.search = omap_w1_search_bus;
-	} else {
-		hdq_data->mode = 1;
-		omap_w1_master.triplet = omap_w1_triplet;
-	}
+	pm_runtime_mark_last_busy(&pdev->dev);
+	pm_runtime_put_autosuspend(&pdev->dev);
 
 	omap_w1_master.data = hdq_data;
 
@@ -739,6 +619,7 @@ static int omap_hdq_probe(struct platform_device *pdev)
 err_irq:
 	pm_runtime_put_sync(&pdev->dev);
 err_w1:
+	pm_runtime_dont_use_autosuspend(&pdev->dev);
 	pm_runtime_disable(&pdev->dev);
 
 	return ret;
@@ -746,23 +627,19 @@ static int omap_hdq_probe(struct platform_device *pdev)
 
 static int omap_hdq_remove(struct platform_device *pdev)
 {
-	struct hdq_data *hdq_data = platform_get_drvdata(pdev);
+	int active;
 
-	mutex_lock(&hdq_data->hdq_mutex);
-
-	if (hdq_data->hdq_usecount) {
-		dev_dbg(&pdev->dev, "removed when use count is not zero\n");
-		mutex_unlock(&hdq_data->hdq_mutex);
-		return -EBUSY;
-	}
+	active = pm_runtime_get_sync(&pdev->dev);
+	if (active < 0)
+		pm_runtime_put_noidle(&pdev->dev);
 
-	mutex_unlock(&hdq_data->hdq_mutex);
+	w1_remove_master_device(&omap_w1_master);
 
-	/* remove module dependency */
+	pm_runtime_dont_use_autosuspend(&pdev->dev);
+	if (active >= 0)
+		pm_runtime_put_sync(&pdev->dev);
 	pm_runtime_disable(&pdev->dev);
 
-	w1_remove_master_device(&omap_w1_master);
-
 	return 0;
 }
 
@@ -779,6 +656,7 @@ static struct platform_driver omap_hdq_driver = {
 	.driver = {
 		.name =	"omap_hdq",
 		.of_match_table = omap_hdq_dt_ids,
+		.pm = &omap_hdq_pm_ops,
 	},
 };
 module_platform_driver(omap_hdq_driver);
-- 
2.24.1
