Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7A0A2A05C4
	for <lists+linux-omap@lfdr.de>; Wed, 28 Aug 2019 17:11:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726536AbfH1PLF (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 28 Aug 2019 11:11:05 -0400
Received: from muru.com ([72.249.23.125]:58918 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726437AbfH1PLF (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 28 Aug 2019 11:11:05 -0400
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 84A5180C5;
        Wed, 28 Aug 2019 15:11:33 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     Bin Liu <b-liu@ti.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, linux-omap@vger.kernel.org
Subject: [PATCH] usb: musb: omap2430: Fix flakeyness enumerating when connected to a lapdock
Date:   Wed, 28 Aug 2019 08:11:00 -0700
Message-Id: <20190828151100.31996-1-tony@atomide.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

With commit 594632efbb9a ("usb: musb: Adding musb support for OMAP4430")
we were supposed to call otg_set_vbus() only if enabling session for a
A-device fails. But the conditional test was always true and at some point
commit 10770c5aa0fe ("usb: musb: omap2430.c delete unused variable.")
removed the check.

Looks like always calling otg_set_vbus() causes flakeyness enumerating when
droid4 is connected to a lapdock. In this case lapdock runs in USB carkit
type mode and feeds the VBUS.

Let's fix the issue by adding a flag to call otg_set_vbus() conditionally
only if A-device session fails that probably was the intention originally.

Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 drivers/usb/musb/omap2430.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/musb/omap2430.c b/drivers/usb/musb/omap2430.c
--- a/drivers/usb/musb/omap2430.c
+++ b/drivers/usb/musb/omap2430.c
@@ -52,6 +52,7 @@ static void omap2430_musb_set_vbus(struct musb *musb, int is_on)
 
 	if (is_on) {
 		if (musb->xceiv->otg->state == OTG_STATE_A_IDLE) {
+			bool need_otg_set_vbus = true;
 			int loops = 100;
 			/* start the session */
 			devctl |= MUSB_DEVCTL_SESSION;
@@ -72,9 +73,13 @@ static void omap2430_musb_set_vbus(struct musb *musb, int is_on)
 					"configured as A device timeout");
 					break;
 				}
+
+				/* Session enabled as A-device, we have VBUS */
+				need_otg_set_vbus = false;
 			}
 
-			otg_set_vbus(otg, 1);
+			if (need_otg_set_vbus)
+				otg_set_vbus(otg, 1);
 		} else {
 			musb->is_active = 1;
 			musb->xceiv->otg->state = OTG_STATE_A_WAIT_VRISE;
-- 
2.23.0
