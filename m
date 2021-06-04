Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BDE2F39B493
	for <lists+linux-omap@lfdr.de>; Fri,  4 Jun 2021 10:05:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229925AbhFDIH2 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 4 Jun 2021 04:07:28 -0400
Received: from muru.com ([72.249.23.125]:36172 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229900AbhFDIH2 (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Fri, 4 Jun 2021 04:07:28 -0400
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id C40EB8167;
        Fri,  4 Jun 2021 08:05:48 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     Bin Liu <b-liu@ti.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org, linux-omap@vger.kernel.org,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Andreas Kemnade <andreas@kemnade.info>,
        Bhushan Shah <bshah@kde.org>,
        Drew Fustini <drew@beagleboard.org>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: [PATCH 1/2] usb: musb: Simplify cable state handling
Date:   Fri,  4 Jun 2021 11:05:35 +0300
Message-Id: <20210604080536.12185-1-tony@atomide.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Simplify cable state handling a bit to leave out duplicated code.
We are just scheduling work and showing state info if a recheck is
needed. No intended functional changes.

Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Andreas Kemnade <andreas@kemnade.info>
Cc: Bhushan Shah <bshah@kde.org>
Cc: Drew Fustini <drew@beagleboard.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 drivers/usb/musb/musb_core.c | 40 ++++++++++++++++++------------------
 1 file changed, 20 insertions(+), 20 deletions(-)

diff --git a/drivers/usb/musb/musb_core.c b/drivers/usb/musb/musb_core.c
--- a/drivers/usb/musb/musb_core.c
+++ b/drivers/usb/musb/musb_core.c
@@ -1984,6 +1984,20 @@ ATTRIBUTE_GROUPS(musb);
 #define MUSB_QUIRK_A_DISCONNECT_19	((3 << MUSB_DEVCTL_VBUS_SHIFT) | \
 					 MUSB_DEVCTL_SESSION)
 
+static bool musb_state_needs_recheck(struct musb *musb, const char *desc)
+{
+	if (musb->quirk_retries && !musb->flush_irq_work) {
+		musb_dbg(musb, desc);
+		schedule_delayed_work(&musb->irq_work,
+				      msecs_to_jiffies(1000));
+		musb->quirk_retries--;
+
+		return true;
+	}
+
+	return false;
+}
+
 /*
  * Check the musb devctl session bit to determine if we want to
  * allow PM runtime for the device. In general, we want to keep things
@@ -2004,32 +2018,18 @@ static void musb_pm_runtime_check_session(struct musb *musb)
 		MUSB_DEVCTL_HR;
 	switch (devctl & ~s) {
 	case MUSB_QUIRK_B_DISCONNECT_99:
-		if (musb->quirk_retries && !musb->flush_irq_work) {
-			musb_dbg(musb, "Poll devctl in case of suspend after disconnect\n");
-			schedule_delayed_work(&musb->irq_work,
-					      msecs_to_jiffies(1000));
-			musb->quirk_retries--;
-		}
+		musb_state_needs_recheck(musb,
+			"Poll devctl in case of suspend after disconnect\n");
 		break;
 	case MUSB_QUIRK_B_INVALID_VBUS_91:
-		if (musb->quirk_retries && !musb->flush_irq_work) {
-			musb_dbg(musb,
-				 "Poll devctl on invalid vbus, assume no session");
-			schedule_delayed_work(&musb->irq_work,
-					      msecs_to_jiffies(1000));
-			musb->quirk_retries--;
+		if (musb_state_needs_recheck(musb,
+				"Poll devctl on invalid vbus, assume no session"))
 			return;
-		}
 		fallthrough;
 	case MUSB_QUIRK_A_DISCONNECT_19:
-		if (musb->quirk_retries && !musb->flush_irq_work) {
-			musb_dbg(musb,
-				 "Poll devctl on possible host mode disconnect");
-			schedule_delayed_work(&musb->irq_work,
-					      msecs_to_jiffies(1000));
-			musb->quirk_retries--;
+		if (musb_state_needs_recheck(musb,
+				"Poll devctl on possible host mode disconnect"))
 			return;
-		}
 		if (!musb->session)
 			break;
 		musb_dbg(musb, "Allow PM on possible host mode disconnect");
-- 
2.31.1
