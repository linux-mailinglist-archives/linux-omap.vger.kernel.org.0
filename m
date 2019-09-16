Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 29E07B32EE
	for <lists+linux-omap@lfdr.de>; Mon, 16 Sep 2019 03:26:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728872AbfIPB0s (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sun, 15 Sep 2019 21:26:48 -0400
Received: from muru.com ([72.249.23.125]:33118 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727084AbfIPB0s (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Sun, 15 Sep 2019 21:26:48 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id B66EC80BB;
        Mon, 16 Sep 2019 01:27:16 +0000 (UTC)
Date:   Sun, 15 Sep 2019 18:26:42 -0700
From:   Tony Lindgren <tony@atomide.com>
To:     Pavel Machek <pavel@ucw.cz>
Cc:     Pavel Machek <pavel@denx.de>, Bin Liu <b-liu@ti.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, linux-omap@vger.kernel.org,
        Jacopo Mondi <jacopo@jmondi.org>,
        Marcel Partap <mpartap@gmx.net>,
        Merlijn Wajer <merlijn@wizzup.org>,
        Michael Scott <hashcode0f@gmail.com>,
        NeKit <nekit1000@gmail.com>, Sebastian Reichel <sre@kernel.org>
Subject: Re: [PATCH 0/4] musb host improvments mostly for omap2430 glue
Message-ID: <20190916012642.GY52127@atomide.com>
References: <20190830232058.53414-1-tony@atomide.com>
 <20190902092344.GA31410@amd>
 <20190902094408.GB31410@amd>
 <20190902160651.GI52127@atomide.com>
 <20190903080725.GA26076@amd>
 <20190916012023.GX52127@atomide.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190916012023.GX52127@atomide.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Tony Lindgren <tony@atomide.com> [190916 01:21]:
> Let's just get rid of .set_vbus for omap2430 glue layer and let the PHY
> code handle VBUS with musb_set_vbus(). Note that in the follow-up patch
> we can completely remove omap2430_musb_set_vbus(), but let's do it in a
> separate patch as this change may actually turn out to be needed as a
> fix.

FYI, below is a quick take at dropping omap2430_musb_set_vbus(),
needs more testing though. I'm still seeing some errors on
disconnect with this one like:

VBUS_ERROR in b_idle (80, <SessEnd), retry #0, port1 00000100

Other than that, things seems to work just fine for host and
peripheral.

Regards,

Tony

8< -------------------From tony Mon Sep 17 00:00:00 2001
diff --git a/drivers/usb/musb/omap2430.c b/drivers/usb/musb/omap2430.c
--- a/drivers/usb/musb/omap2430.c
+++ b/drivers/usb/musb/omap2430.c
@@ -38,41 +38,6 @@ struct omap2430_glue {
 
 static struct omap2430_glue	*_glue;
 
-/*
- * HDRC controls CPEN, but beware current surges during device connect.
- * They can trigger transient overcurrent conditions that must be ignored.
- *
- * Note that we're skipping A_WAIT_VFALL -> A_IDLE and jumping right to B_IDLE
- * as set by musb_set_peripheral().
- */
-static void omap2430_musb_set_vbus(struct musb *musb, int is_on)
-{
-	struct usb_otg *otg = musb->xceiv->otg;
-	int error;
-
-	if (is_on) {
-		switch (musb->xceiv->otg->state) {
-		case OTG_STATE_A_IDLE:
-			error = musb_set_host(musb);
-			if (!error) {
-				musb->xceiv->otg->state = OTG_STATE_A_WAIT_VRISE;
-				otg_set_vbus(otg, 1);
-			}
-			break;
-		default:
-			otg_set_vbus(otg, 1);
-			break;
-		}
-	} else {
-		error = musb_set_peripheral(musb);
-		otg_set_vbus(otg, 0);
-	}
-
-	dev_dbg(musb->controller, "VBUS %s, devctl %02x\n",
-		usb_otg_state_string(musb->xceiv->otg->state),
-		musb_readb(musb->mregs, MUSB_DEVCTL));
-}
-
 static inline void omap2430_low_level_exit(struct musb *musb)
 {
 	u32 l;
@@ -112,27 +77,42 @@ static int omap2430_musb_mailbox(enum musb_vbus_id_status status)
 	return 0;
 }
 
+/*
+ * HDRC controls CPEN, but beware current surges during device connect.
+ * They can trigger transient overcurrent conditions that must be ignored.
+ *
+ * Note that we're skipping A_WAIT_VFALL -> A_IDLE and jumping right to B_IDLE
+ * as set by musb_set_peripheral().
+ */
 static void omap_musb_set_mailbox(struct omap2430_glue *glue)
 {
 	struct musb *musb = glue_to_musb(glue);
-	struct musb_hdrc_platform_data *pdata =
-		dev_get_platdata(musb->controller);
-	struct omap_musb_board_data *data = pdata->board_data;
+	int error;
 
 	pm_runtime_get_sync(musb->controller);
+
+	dev_dbg(musb->controller, "VBUS %s, devctl %02x\n",
+		usb_otg_state_string(musb->xceiv->otg->state),
+		musb_readb(musb->mregs, MUSB_DEVCTL));
+
 	switch (glue->status) {
 	case MUSB_ID_GROUND:
 		dev_dbg(musb->controller, "ID GND\n");
 		switch (musb->xceiv->otg->state) {
+		case OTG_STATE_A_IDLE:
+			error = musb_set_host(musb);
+			if (error)
+				break;
+			musb->xceiv->otg->state = OTG_STATE_A_WAIT_VRISE;
+			/* Fall through */
 		case OTG_STATE_A_WAIT_VRISE:
 		case OTG_STATE_A_WAIT_BCON:
 		case OTG_STATE_A_HOST:
-		case OTG_STATE_A_IDLE:
 			/*
 			 * On multiple ID ground interrupts just keep enabling
 			 * VBUS. At least cpcap VBUS shuts down otherwise.
 			 */
-			omap2430_musb_set_vbus(musb, 1);
+			otg_set_vbus(musb->xceiv->otg, 1);
 			break;
 		default:
 			musb->xceiv->otg->state = OTG_STATE_A_IDLE;
@@ -140,7 +120,7 @@ static void omap_musb_set_mailbox(struct omap2430_glue *glue)
 			if (musb->gadget_driver) {
 				omap_control_usb_set_mode(glue->control_otghs,
 							  USB_MODE_HOST);
-				omap2430_musb_set_vbus(musb, 1);
+				otg_set_vbus(musb->xceiv->otg, 1);
 			}
 			break;
 		}
@@ -159,14 +139,10 @@ static void omap_musb_set_mailbox(struct omap2430_glue *glue)
 		dev_dbg(musb->controller, "VBUS Disconnect\n");
 
 		musb->xceiv->last_event = USB_EVENT_NONE;
-		if (musb->gadget_driver)
-			omap2430_musb_set_vbus(musb, 0);
-
-		if (data->interface_type == MUSB_INTERFACE_UTMI)
-			otg_set_vbus(musb->xceiv->otg, 0);
-
+		otg_set_vbus(musb->xceiv->otg, 0);
 		omap_control_usb_set_mode(glue->control_otghs,
 			USB_MODE_DISCONNECT);
+		musb_set_peripheral(musb);
 		break;
 	default:
 		dev_dbg(musb->controller, "ID float\n");
-- 
2.23.0
