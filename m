Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 165F0387BEC
	for <lists+linux-omap@lfdr.de>; Tue, 18 May 2021 17:06:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344697AbhERPHl (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 18 May 2021 11:07:41 -0400
Received: from muru.com ([72.249.23.125]:57170 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1343837AbhERPHj (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 18 May 2021 11:07:39 -0400
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 7E07980F5;
        Tue, 18 May 2021 15:06:23 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     Bin Liu <b-liu@ti.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org, linux-omap@vger.kernel.org
Subject: [PATCH] usb: musb: Check devctl status again for a spurious session request
Date:   Tue, 18 May 2021 18:06:15 +0300
Message-Id: <20210518150615.53464-1-tony@atomide.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On start-up, we can get a spurious session request interrupt with nothing
connected. After that the devctl session bit will silently clear, but the
musb hardware is never idled until a cable is plugged in, or the glue
layer module is reloaded.

Let's just check the session bit again in 3 seconds in peripheral mode
to catch the issue.

Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 drivers/usb/musb/musb_core.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/usb/musb/musb_core.c b/drivers/usb/musb/musb_core.c
--- a/drivers/usb/musb/musb_core.c
+++ b/drivers/usb/musb/musb_core.c
@@ -2055,6 +2055,15 @@ static void musb_pm_runtime_check_session(struct musb *musb)
 			dev_err(musb->controller, "Could not enable: %i\n",
 				error);
 		musb->quirk_retries = 3;
+
+		/*
+		 * We can get a spurious MUSB_INTR_SESSREQ interrupt on start-up
+		 * in B-peripheral mode with nothing connected and the session
+		 * bit clears silently. Check status again in 3 seconds.
+		 */
+		if (devctl & MUSB_DEVCTL_BDEVICE)
+			schedule_delayed_work(&musb->irq_work,
+					      msecs_to_jiffies(3000));
 	} else {
 		musb_dbg(musb, "Allow PM with no session: %02x", devctl);
 		pm_runtime_mark_last_busy(musb->controller);
-- 
2.31.1
