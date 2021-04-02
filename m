Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4D989352FB0
	for <lists+linux-omap@lfdr.de>; Fri,  2 Apr 2021 21:25:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235392AbhDBTZ2 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 2 Apr 2021 15:25:28 -0400
Received: from smtp-17.italiaonline.it ([213.209.10.17]:42306 "EHLO libero.it"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S235256AbhDBTZ1 (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Fri, 2 Apr 2021 15:25:27 -0400
Received: from passgat-Modern-14-A10M.homenet.telecomitalia.it
 ([87.20.116.197])
        by smtp-17.iol.local with ESMTPA
        id SPPylszTDtpGHSPQ2l2GTq; Fri, 02 Apr 2021 21:25:25 +0200
x-libjamoibt: 1601
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=libero.it; s=s2021;
        t=1617391525; bh=+BEJKrjoCB0Pc9xZ9FrsP955BwTzO6grC2V0XszkgtQ=;
        h=From;
        b=DmuCYDM3bZNOFo7QLyzEtFt8s51a7Fd8pWyODuGBX7FU3rufNx1ok3D5sZ8Qiu3zh
         x08P6UFJyatkB2EqwrJGSYCjolqiQzJlTktqcl6Q4MAXDX30frf60zprDQ4K0vr0RL
         x2iRxOkJ0MuUMhp4O+BLp+rRmzADa0TPuNP6k+gTq++6keQkd+zs1vdDz7hUomAgPQ
         3WiIrv9dZx031skLaat+7VEefl5xNFgYomjS/l3fT3nPdFGQzG3o6hwZgd++XGYnY1
         SHfU0qGVragghm3FcG3j8rCDp3dx9Av1H8B7046WBj9YuLLLuu5lic9/utNXFbFXHB
         //3SqhaaDZMmA==
X-CNFS-Analysis: v=2.4 cv=Q7IXX66a c=1 sm=1 tr=0 ts=60676fa5 cx=a_exe
 a=AVqmXbCQpuNSdJmApS5GbQ==:117 a=AVqmXbCQpuNSdJmApS5GbQ==:17
 a=E4scLkpOueEFzuNnOYYA:9
From:   Dario Binacchi <dariobin@libero.it>
To:     linux-kernel@vger.kernel.org
Cc:     Dario Binacchi <dariobin@libero.it>,
        Russell King <linux@armlinux.org.uk>,
        Tony Lindgren <tony@atomide.com>,
        linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org
Subject: [PATCH] ARM: OMAP2+: CM: remove omap2_set_globals_cm()
Date:   Fri,  2 Apr 2021 21:25:16 +0200
Message-Id: <20210402192516.9143-1-dariobin@libero.it>
X-Mailer: git-send-email 2.17.1
X-CMAE-Envelope: MS4xfB9Z761kIlrTbQfbqK+JmqivD74NH3YoVXeOuxcP9/ff4g4Qzl+zSuNU8hsEmIzeKD54/lPRZ2ajEevY7gLWDJ+ozKV6DLBKFF5QjDphBj+Ed/oxfRug
 njNJyBLymUyXoZbPsumMAP37LjG/vn1k2pAqWVgjOT1zgXaj3xYDhvKEc8Prwzk0sXP7ZkkzoDUpEJMJGFWDvUTUmOgOI82o5zxzsSdIGxLojLFqO5ETNZQs
 uTLN/J2SVva6xNnYXhvQFFxdyDi/SnIyFWFGMbnoctc32r6+MGljf2LdxBK0fs+AnFg7tzxcGQr7vurbK5rMH2ZIsI+GgG3i6zAdp8/3FjxMdpFyA7QFojBj
 o6OZAXW/wVDPaENCWxw3NXK4cSggx6065T3UnjR6Z271caoWFIsS2WnVV2gEQyAOwjJ1OyDU
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

The function is no longer used, so let's remove it.

Signed-off-by: Dario Binacchi <dariobin@libero.it>

---

 arch/arm/mach-omap2/cm.h        |  1 -
 arch/arm/mach-omap2/cm_common.c | 13 -------------
 2 files changed, 14 deletions(-)

diff --git a/arch/arm/mach-omap2/cm.h b/arch/arm/mach-omap2/cm.h
index d02fe63dab59..14beb59e5f7b 100644
--- a/arch/arm/mach-omap2/cm.h
+++ b/arch/arm/mach-omap2/cm.h
@@ -26,7 +26,6 @@
 
 extern struct omap_domain_base cm_base;
 extern struct omap_domain_base cm2_base;
-extern void omap2_set_globals_cm(void __iomem *cm, void __iomem *cm2);
 # endif
 
 /*
diff --git a/arch/arm/mach-omap2/cm_common.c b/arch/arm/mach-omap2/cm_common.c
index b7ea609386d5..e2d069fe67f1 100644
--- a/arch/arm/mach-omap2/cm_common.c
+++ b/arch/arm/mach-omap2/cm_common.c
@@ -37,19 +37,6 @@ struct omap_domain_base cm2_base;
 #define CM_NO_CLOCKS		0x1
 #define CM_SINGLE_INSTANCE	0x2
 
-/**
- * omap2_set_globals_cm - set the CM/CM2 base addresses (for early use)
- * @cm: CM base virtual address
- * @cm2: CM2 base virtual address (if present on the booted SoC)
- *
- * XXX Will be replaced when the PRM/CM drivers are completed.
- */
-void __init omap2_set_globals_cm(void __iomem *cm, void __iomem *cm2)
-{
-	cm_base.va = cm;
-	cm2_base.va = cm2;
-}
-
 /**
  * cm_split_idlest_reg - split CM_IDLEST reg addr into its components
  * @idlest_reg: CM_IDLEST* virtual address
-- 
2.17.1

