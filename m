Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3154734721D
	for <lists+linux-omap@lfdr.de>; Wed, 24 Mar 2021 08:12:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235681AbhCXHMH (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 24 Mar 2021 03:12:07 -0400
Received: from muru.com ([72.249.23.125]:46272 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235727AbhCXHLt (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 24 Mar 2021 03:11:49 -0400
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 6196B8057;
        Wed, 24 Mar 2021 07:12:44 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     Bin Liu <b-liu@ti.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org, linux-omap@vger.kernel.org,
        Bhushan Shah <bshah@kde.org>
Subject: [PATCH RESEND] usb: musb: Fix suspend with devices connected for a64
Date:   Wed, 24 Mar 2021 09:11:41 +0200
Message-Id: <20210324071142.42264-1-tony@atomide.com>
X-Mailer: git-send-email 2.31.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Pinephone running on Allwinner A64 fails to suspend with USB devices
connected as reported by Bhushan Shah <bshah@kde.org>. Reverting
commit 5fbf7a253470 ("usb: musb: fix idling for suspend after
disconnect interrupt") fixes the issue.

Let's add suspend checks also for suspend after disconnect interrupt
quirk handling like we already do elsewhere.

Fixes: 5fbf7a253470 ("usb: musb: fix idling for suspend after disconnect interrupt")
Reported-by: Bhushan Shah <bshah@kde.org>
Tested-by: Bhushan Shah <bshah@kde.org>
Signed-off-by: Tony Lindgren <tony@atomide.com>

---

Looks like this fix is still pending, can you guys please apply? This is also
needed on am335x to suspend with devices connected in addition to a64

---
 drivers/usb/musb/musb_core.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/musb/musb_core.c b/drivers/usb/musb/musb_core.c
--- a/drivers/usb/musb/musb_core.c
+++ b/drivers/usb/musb/musb_core.c
@@ -2004,10 +2004,14 @@ static void musb_pm_runtime_check_session(struct musb *musb)
 		MUSB_DEVCTL_HR;
 	switch (devctl & ~s) {
 	case MUSB_QUIRK_B_DISCONNECT_99:
-		musb_dbg(musb, "Poll devctl in case of suspend after disconnect\n");
-		schedule_delayed_work(&musb->irq_work,
-				      msecs_to_jiffies(1000));
-		break;
+		if (musb->quirk_retries && !musb->flush_irq_work) {
+			musb_dbg(musb, "Poll devctl in case of suspend after disconnect\n");
+			schedule_delayed_work(&musb->irq_work,
+					      msecs_to_jiffies(1000));
+			musb->quirk_retries--;
+			break;
+		}
+		fallthrough;
 	case MUSB_QUIRK_B_INVALID_VBUS_91:
 		if (musb->quirk_retries && !musb->flush_irq_work) {
 			musb_dbg(musb,
-- 
2.31.0
