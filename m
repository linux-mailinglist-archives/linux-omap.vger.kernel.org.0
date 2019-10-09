Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1F462D1AD8
	for <lists+linux-omap@lfdr.de>; Wed,  9 Oct 2019 23:22:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732034AbfJIVWM (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 9 Oct 2019 17:22:12 -0400
Received: from muru.com ([72.249.23.125]:36668 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731916AbfJIVWL (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 9 Oct 2019 17:22:11 -0400
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id D09B98162;
        Wed,  9 Oct 2019 21:22:43 +0000 (UTC)
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
Subject: [PATCH 7/7] usb: musb: Get rid of omap2430_musb_set_vbus()
Date:   Wed,  9 Oct 2019 14:21:44 -0700
Message-Id: <20191009212145.28495-8-tony@atomide.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191009212145.28495-1-tony@atomide.com>
References: <20191009212145.28495-1-tony@atomide.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Now that we've removed direct calls from interrupt handler to
omap2430_musb_set_vbus(), let's make things less confusing and
configure VBUS directly in omap_musb_set_mailbox().

We have omap_musb_set_mailbox() called from the PHYs, and that's
all we need.

Note that we can now also drop the check for MUSB_INTERFACE_UTMI,
we've been already calling otg_set_vbus(musb->xceiv->otg, 0)
unconditionally via omap2430_musb_set_vbus() and we should only
need to call it once.

And we want to disable VBUS unconditionally on disconnect even
without musb->gadget_driver, so let's drop that check too.

Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 drivers/usb/musb/omap2430.c | 70 ++++++++++++-------------------------
 1 file changed, 23 insertions(+), 47 deletions(-)

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
@@ -159,12 +139,8 @@ static void omap_musb_set_mailbox(struct omap2430_glue *glue)
 		dev_dbg(musb->controller, "VBUS Disconnect\n");
 
 		musb->xceiv->last_event = USB_EVENT_NONE;
-		if (musb->gadget_driver)
-			omap2430_musb_set_vbus(musb, 0);
-
-		if (data->interface_type == MUSB_INTERFACE_UTMI)
-			otg_set_vbus(musb->xceiv->otg, 0);
-
+		musb_set_peripheral(musb);
+		otg_set_vbus(musb->xceiv->otg, 0);
 		omap_control_usb_set_mode(glue->control_otghs,
 			USB_MODE_DISCONNECT);
 		break;
-- 
2.23.0
