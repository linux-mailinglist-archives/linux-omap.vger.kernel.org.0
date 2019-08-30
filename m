Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ECFD2A40F6
	for <lists+linux-omap@lfdr.de>; Sat, 31 Aug 2019 01:21:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728350AbfH3XVJ (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 30 Aug 2019 19:21:09 -0400
Received: from muru.com ([72.249.23.125]:59282 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728122AbfH3XVJ (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Fri, 30 Aug 2019 19:21:09 -0400
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 02CD081A1;
        Fri, 30 Aug 2019 23:21:36 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     Bin Liu <b-liu@ti.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, linux-omap@vger.kernel.org,
        Jacopo Mondi <jacopo@jmondi.org>,
        Marcel Partap <mpartap@gmx.net>,
        Merlijn Wajer <merlijn@wizzup.org>,
        Michael Scott <hashcode0f@gmail.com>,
        NeKit <nekit1000@gmail.com>, Pavel Machek <pavel@ucw.cz>,
        Sebastian Reichel <sre@kernel.org>
Subject: [PATCH 3/4] usb: musb: Add musb_set_host and peripheral and use them for omap2430
Date:   Fri, 30 Aug 2019 16:20:57 -0700
Message-Id: <20190830232058.53414-4-tony@atomide.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190830232058.53414-1-tony@atomide.com>
References: <20190830232058.53414-1-tony@atomide.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

At least some revisions of musb core need to set devctl session bit
in peripheral mode to force musb to host mode. And we have places
clearing the devctl session bit.

Let's add a generic function to do this, and use it for omap2430.
This should get us a bit closer to completely removing devctl register
tinkering in the SoC glue code.

Before making use of this code for the other glue layers, things need
to be tested carefully as there may be a approximately a 200 ms delay
needed between powering up musb and calling musb_set_host() to avoid.
Otherwise the system hangs at least with omap2430 glue layer.

Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 drivers/usb/musb/musb_core.c | 103 +++++++++++++++++++++++++++++++++++
 drivers/usb/musb/musb_core.h |   3 +
 drivers/usb/musb/omap2430.c  |  70 +++++++-----------------
 3 files changed, 127 insertions(+), 49 deletions(-)

diff --git a/drivers/usb/musb/musb_core.c b/drivers/usb/musb/musb_core.c
--- a/drivers/usb/musb/musb_core.c
+++ b/drivers/usb/musb/musb_core.c
@@ -73,6 +73,7 @@
 #include <linux/prefetch.h>
 #include <linux/platform_device.h>
 #include <linux/io.h>
+#include <linux/iopoll.h>
 #include <linux/dma-mapping.h>
 #include <linux/usb.h>
 #include <linux/usb/of.h>
@@ -414,6 +415,108 @@ void musb_write_fifo(struct musb_hw_ep *hw_ep, u16 len, const u8 *src)
 	return hw_ep->musb->io.write_fifo(hw_ep, len, src);
 }
 
+static u8 musb_read_devctl(struct musb *musb)
+{
+	return musb_readb(musb->mregs, MUSB_DEVCTL);
+}
+
+/**
+ * musb_set_host - set and initialize host mode
+ * @musb: musb controller driver data
+ *
+ * At least some musb revisions need to enable devctl session bit in
+ * peripheral mode to switch to host mode. Initializes things to host
+ * mode and sets A_IDLE. SoC glue needs to advance state further
+ * based on phy provided VBUS state.
+ *
+ * Note that the SoC glue code may need to wait for musb to settle
+ * on enable before calling this to avoid babble.
+ */
+int musb_set_host(struct musb *musb)
+{
+	int error = 0;
+	u8 devctl;
+
+	if (!musb)
+		return -EINVAL;
+
+	devctl = musb_read_devctl(musb);
+	if (!(devctl & MUSB_DEVCTL_BDEVICE)) {
+		dev_info(musb->controller,
+			 "%s: already in host mode: %02x\n",
+			 __func__, devctl);
+		goto init_data;
+	}
+
+	devctl |= MUSB_DEVCTL_SESSION;
+	musb_writeb(musb->mregs, MUSB_DEVCTL, devctl);
+
+	error = readx_poll_timeout(musb_read_devctl, musb, devctl,
+				   !(devctl & MUSB_DEVCTL_BDEVICE), 5000,
+				   1000000);
+	if (error) {
+		dev_err(musb->controller, "%s: could not set host: %02x\n",
+			__func__, devctl);
+
+		return error;
+	}
+
+init_data:
+	musb->is_active = 1;
+	musb->xceiv->otg->state = OTG_STATE_A_IDLE;
+	MUSB_HST_MODE(musb);
+
+	return error;
+}
+EXPORT_SYMBOL_GPL(musb_set_host);
+
+/**
+ * musb_set_peripheral - set and initialize peripheral mode
+ * @musb: musb controller driver data
+ *
+ * Clears devctl session bit and initializes things for peripheral
+ * mode and sets B_IDLE. SoC glue needs to advance state further
+ * based on phy provided VBUS state.
+ */
+int musb_set_peripheral(struct musb *musb)
+{
+	int error = 0;
+	u8 devctl;
+
+	if (!musb)
+		return -EINVAL;
+
+	devctl = musb_read_devctl(musb);
+	if (devctl & MUSB_DEVCTL_BDEVICE) {
+		dev_info(musb->controller,
+			 "%s: already in peripheral mode: %02x\n",
+			 __func__, devctl);
+
+		goto init_data;
+	}
+
+	devctl &= ~MUSB_DEVCTL_SESSION;
+	musb_writeb(musb->mregs, MUSB_DEVCTL, devctl);
+
+	error = readx_poll_timeout(musb_read_devctl, musb, devctl,
+				   devctl & MUSB_DEVCTL_BDEVICE, 5000,
+				   1000000);
+	if (error) {
+		dev_err(musb->controller, "%s: could not set periperal: %02x\n",
+			__func__, devctl);
+
+		return error;
+	}
+
+init_data:
+	musb->is_active = 0;
+	musb->xceiv->otg->state = OTG_STATE_B_IDLE;
+	MUSB_DEV_MODE(musb);
+
+	return error;
+}
+EXPORT_SYMBOL_GPL(musb_set_peripheral);
+
 /*-------------------------------------------------------------------------*/
 
 /* for high speed test mode; see USB 2.0 spec 7.1.20 */
diff --git a/drivers/usb/musb/musb_core.h b/drivers/usb/musb/musb_core.h
--- a/drivers/usb/musb/musb_core.h
+++ b/drivers/usb/musb/musb_core.h
@@ -487,6 +487,9 @@ extern void musb_start(struct musb *musb);
 extern void musb_write_fifo(struct musb_hw_ep *ep, u16 len, const u8 *src);
 extern void musb_read_fifo(struct musb_hw_ep *ep, u16 len, u8 *dst);
 
+extern int musb_set_host(struct musb *musb);
+extern int musb_set_peripheral(struct musb *musb);
+
 extern void musb_load_testpacket(struct musb *);
 
 extern irqreturn_t musb_interrupt(struct musb *);
diff --git a/drivers/usb/musb/omap2430.c b/drivers/usb/musb/omap2430.c
--- a/drivers/usb/musb/omap2430.c
+++ b/drivers/usb/musb/omap2430.c
@@ -38,65 +38,37 @@ struct omap2430_glue {
 
 static struct omap2430_glue	*_glue;
 
+/*
+ * HDRC controls CPEN, but beware current surges during device connect.
+ * They can trigger transient overcurrent conditions that must be ignored.
+ *
+ * Note that we're skipping A_WAIT_VFALL -> A_IDLE and jumping right to B_IDLE
+ * as set by musb_set_peripheral().
+ */
 static void omap2430_musb_set_vbus(struct musb *musb, int is_on)
 {
-	struct usb_otg	*otg = musb->xceiv->otg;
-	u8		devctl;
-	unsigned long timeout = jiffies + msecs_to_jiffies(1000);
-	/* HDRC controls CPEN, but beware current surges during device
-	 * connect.  They can trigger transient overcurrent conditions
-	 * that must be ignored.
-	 */
-
-	devctl = musb_readb(musb->mregs, MUSB_DEVCTL);
+	struct usb_otg *otg = musb->xceiv->otg;
+	int error;
 
 	if (is_on) {
-		if (musb->xceiv->otg->state == OTG_STATE_A_IDLE) {
-			int loops = 100;
-			/* start the session */
-			devctl |= MUSB_DEVCTL_SESSION;
-			musb_writeb(musb->mregs, MUSB_DEVCTL, devctl);
-			/*
-			 * Wait for the musb to set as A device to enable the
-			 * VBUS
-			 */
-			while (musb_readb(musb->mregs, MUSB_DEVCTL) &
-			       MUSB_DEVCTL_BDEVICE) {
-
-				mdelay(5);
-				cpu_relax();
-
-				if (time_after(jiffies, timeout)
-				    || loops-- <= 0) {
-					dev_err(musb->controller,
-					"configured as A device timeout");
-					break;
-				}
+		switch (musb->xceiv->otg->state) {
+		case OTG_STATE_A_IDLE:
+			error = musb_set_host(musb);
+			if (!error) {
+				musb->xceiv->otg->state = OTG_STATE_A_WAIT_VRISE;
+				otg_set_vbus(otg, 1);
 			}
-
+			break;
+		default:
 			otg_set_vbus(otg, 1);
-		} else {
-			musb->is_active = 1;
-			musb->xceiv->otg->state = OTG_STATE_A_WAIT_VRISE;
-			devctl |= MUSB_DEVCTL_SESSION;
-			MUSB_HST_MODE(musb);
+			break;
 		}
 	} else {
-		musb->is_active = 0;
-
-		/* NOTE:  we're skipping A_WAIT_VFALL -> A_IDLE and
-		 * jumping right to B_IDLE...
-		 */
-
-		musb->xceiv->otg->state = OTG_STATE_B_IDLE;
-		devctl &= ~MUSB_DEVCTL_SESSION;
-
-		MUSB_DEV_MODE(musb);
+		error = musb_set_peripheral(musb);
+		otg_set_vbus(otg, 0);
 	}
-	musb_writeb(musb->mregs, MUSB_DEVCTL, devctl);
 
-	dev_dbg(musb->controller, "VBUS %s, devctl %02x "
-		/* otg %3x conf %08x prcm %08x */ "\n",
+	dev_dbg(musb->controller, "VBUS %s, devctl %02x\n",
 		usb_otg_state_string(musb->xceiv->otg->state),
 		musb_readb(musb->mregs, MUSB_DEVCTL));
 }
-- 
2.23.0
