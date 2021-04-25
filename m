Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0AD9036A7C8
	for <lists+linux-omap@lfdr.de>; Sun, 25 Apr 2021 16:23:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230214AbhDYOYR (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sun, 25 Apr 2021 10:24:17 -0400
Received: from smtp-35-i2.italiaonline.it ([213.209.12.35]:34608 "EHLO
        libero.it" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229906AbhDYOYR (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Sun, 25 Apr 2021 10:24:17 -0400
Received: from passgat-Modern-14-A10M.homenet.telecomitalia.it
 ([95.244.94.151])
        by smtp-35.iol.local with ESMTPA
        id affYlXyTppK9waffclb5c3; Sun, 25 Apr 2021 16:23:36 +0200
x-libjamoibt: 1601
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=libero.it; s=s2021;
        t=1619360616; bh=Y/MNykPQn4PwVYrHUYU3vVSPjd1zSJtXm6bJIvyQWsI=;
        h=From;
        b=cwxQJQ+UMAz5QRs+KklkvKPjAp8wNZDiYu0GUGGp1QVitel7kRYzdjZy8vCk0BKW1
         V42Z/XOzHmRqHKWyO7hHFOll5eknodJUyw8OAuyfWByY7kfaJjjlIuDKtBpVjR2XtS
         5VESsH28jZvpGL404aB3xRYt4FVg77WvJPOx9EwvIka0hFwR2duPAH/Ai4eZOsBPBk
         Y2xT0JPzkjc8qr6+ONotTRGTRGGMxH3ObpFTxqx2wdZcgZfDShxslT++q4EI8FeJl1
         cEE6yTASgV495zGSoMhQzlOY4z2v7+qSN8A7HpMvOIqUM2i3tH7kDTXfalU9Cxe9iE
         PoUSaRqMk/FYw==
X-CNFS-Analysis: v=2.4 cv=A9ipg4aG c=1 sm=1 tr=0 ts=60857b68 cx=a_exe
 a=ugxisoNCKEotYwafST++Mw==:117 a=ugxisoNCKEotYwafST++Mw==:17
 a=E4scLkpOueEFzuNnOYYA:9
From:   Dario Binacchi <dariobin@libero.it>
To:     linux-kernel@vger.kernel.org
Cc:     Dario Binacchi <dariobin@libero.it>,
        Russell King <linux@armlinux.org.uk>,
        Tony Lindgren <tony@atomide.com>,
        linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org
Subject: [RESEND PATCH] ARM: OMAP2+: remove omap2_set_globals_control()
Date:   Sun, 25 Apr 2021 16:23:30 +0200
Message-Id: <20210425142331.20268-1-dariobin@libero.it>
X-Mailer: git-send-email 2.17.1
X-CMAE-Envelope: MS4xfMgKwOID1roNc39iP0pIfBCIaYwA1srH4wLyvKaYmQJi79YwskMPIx+B847wKhJJ4K8HWAqjrbKieObKduqe91s/UCBYPamkezr5e8B0bkTIp/hymXvM
 gOvvSE2FvdrTrkCR+vQNovxKbFNvHq3Pybx1eviXaXWXZY42TEQxUM4KEl4n26GKFhtHgIsIcOEL0gpeFGVDnsK7Q9Ia7FPjtthW9pgbvy8xP1aGBURO9081
 Kr+TD9uwevFRJrn5DBxSDWAKDXQH613u6Y3Xm//G/CCh3ctuL8tmZYrAlzK3Do5WhVuywooaa43XzrZ52WvHpIox4mX3Ahh1qiccVysbJltBZrk+PsAnCT4x
 5zDzsWcK71DQfEwuP5+jJUTzsTQ4lpHokXayDyjk3kYfTF78RZNK9HVuw77CsO9ol9sYf+7W
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

The function is no longer used, so let's remove it.

Signed-off-by: Dario Binacchi <dariobin@libero.it>


---

 arch/arm/mach-omap2/control.c | 5 -----
 arch/arm/mach-omap2/control.h | 1 -
 2 files changed, 6 deletions(-)

diff --git a/arch/arm/mach-omap2/control.c b/arch/arm/mach-omap2/control.c
index 73338cf80d76..062d431fc33a 100644
--- a/arch/arm/mach-omap2/control.c
+++ b/arch/arm/mach-omap2/control.c
@@ -136,11 +136,6 @@ struct omap3_control_regs {
 static struct omap3_control_regs control_context;
 #endif /* CONFIG_ARCH_OMAP3 && CONFIG_PM */
 
-void __init omap2_set_globals_control(void __iomem *ctrl)
-{
-	omap2_ctrl_base = ctrl;
-}
-
 u8 omap_ctrl_readb(u16 offset)
 {
 	u32 val;
diff --git a/arch/arm/mach-omap2/control.h b/arch/arm/mach-omap2/control.h
index eceb4b09adb2..c4ca30ba1790 100644
--- a/arch/arm/mach-omap2/control.h
+++ b/arch/arm/mach-omap2/control.h
@@ -528,7 +528,6 @@ extern int omap3_ctrl_save_padconf(void);
 void omap3_ctrl_init(void);
 int omap2_control_base_init(void);
 int omap_control_init(void);
-void omap2_set_globals_control(void __iomem *ctrl);
 void __init omap3_control_legacy_iomap_init(void);
 #else
 #define omap_ctrl_readb(x)		0
-- 
2.17.1

