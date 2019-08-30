Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4F4BAA40F5
	for <lists+linux-omap@lfdr.de>; Sat, 31 Aug 2019 01:21:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728332AbfH3XVH (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 30 Aug 2019 19:21:07 -0400
Received: from muru.com ([72.249.23.125]:59260 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728122AbfH3XVH (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Fri, 30 Aug 2019 19:21:07 -0400
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 26E68817C;
        Fri, 30 Aug 2019 23:21:35 +0000 (UTC)
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
Subject: [PATCH 2/4] usb: musb: omap2430: Handle multiple ID ground interrupts
Date:   Fri, 30 Aug 2019 16:20:56 -0700
Message-Id: <20190830232058.53414-3-tony@atomide.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190830232058.53414-1-tony@atomide.com>
References: <20190830232058.53414-1-tony@atomide.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

We currently get "unhandled DISCONNECT transition" warnings from musb core
on device disconnect as things are wrongly set to OTG_STATE_A_IDLE in
host mode when enumerating devices. We can also get "Failed to write reg
index" errors after enumerating.

This is happening at least with cpcap phy where we get multiple ID ground
interrupts. Looks like it's VBUS keeps timing out and needs to be kicked
when the phy sends multiple ID ground interrupts during host mode.

Cc: Jacopo Mondi <jacopo@jmondi.org>
Cc: Marcel Partap <mpartap@gmx.net>
Cc: Merlijn Wajer <merlijn@wizzup.org>
Cc: Michael Scott <hashcode0f@gmail.com>
Cc: NeKit <nekit1000@gmail.com>
Cc: Pavel Machek <pavel@ucw.cz>
Cc: Sebastian Reichel <sre@kernel.org>
Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 drivers/usb/musb/omap2430.c | 25 +++++++++++++++++++------
 1 file changed, 19 insertions(+), 6 deletions(-)

diff --git a/drivers/usb/musb/omap2430.c b/drivers/usb/musb/omap2430.c
--- a/drivers/usb/musb/omap2430.c
+++ b/drivers/usb/musb/omap2430.c
@@ -151,13 +151,26 @@ static void omap_musb_set_mailbox(struct omap2430_glue *glue)
 	switch (glue->status) {
 	case MUSB_ID_GROUND:
 		dev_dbg(musb->controller, "ID GND\n");
-
-		musb->xceiv->otg->state = OTG_STATE_A_IDLE;
-		musb->xceiv->last_event = USB_EVENT_ID;
-		if (musb->gadget_driver) {
-			omap_control_usb_set_mode(glue->control_otghs,
-				USB_MODE_HOST);
+		switch (musb->xceiv->otg->state) {
+		case OTG_STATE_A_WAIT_VRISE:
+		case OTG_STATE_A_WAIT_BCON:
+		case OTG_STATE_A_HOST:
+		case OTG_STATE_A_IDLE:
+			/*
+			 * On multiple ID ground interrupts just keep enabling
+			 * VBUS. At least cpcap VBUS shuts down otherwise.
+			 */
 			omap2430_musb_set_vbus(musb, 1);
+			break;
+		default:
+			musb->xceiv->otg->state = OTG_STATE_A_IDLE;
+			musb->xceiv->last_event = USB_EVENT_ID;
+			if (musb->gadget_driver) {
+				omap_control_usb_set_mode(glue->control_otghs,
+							  USB_MODE_HOST);
+				omap2430_musb_set_vbus(musb, 1);
+			}
+			break;
 		}
 		break;
 
-- 
2.23.0
