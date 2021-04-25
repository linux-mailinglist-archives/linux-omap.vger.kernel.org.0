Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9571A36A7C6
	for <lists+linux-omap@lfdr.de>; Sun, 25 Apr 2021 16:22:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230214AbhDYOW4 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sun, 25 Apr 2021 10:22:56 -0400
Received: from smtp-35-i2.italiaonline.it ([213.209.12.35]:35514 "EHLO
        libero.it" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230194AbhDYOW4 (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Sun, 25 Apr 2021 10:22:56 -0400
Received: from passgat-Modern-14-A10M.homenet.telecomitalia.it
 ([95.244.94.151])
        by smtp-35.iol.local with ESMTPA
        id afeElXy75pK9wafeHlb5Pb; Sun, 25 Apr 2021 16:22:14 +0200
x-libjamoibt: 1601
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=libero.it; s=s2021;
        t=1619360535; bh=+BEJKrjoCB0Pc9xZ9FrsP955BwTzO6grC2V0XszkgtQ=;
        h=From;
        b=v/CJsO43VNnqvtMyXZCljJHgKOwhkZ0oKG/doSfZe6XbbpsqgJoD74Rcvsy+4jE0L
         oBygSLyfY6ziRqqgfpXls0gqxKoaa2KrByQ0lIcrx/7snSv0IUuv8SSMaddwwBM5JJ
         aH6ojD87htGmR23sBot4moUAoSTDg7EA5aA4RnZ8H7SNR2uNMvkoaGh+EPv8O+ajvc
         tF/wtwfc178j4R8ie5c5rT8GVKqUR9iKeugL3PP9Az0LG2wrkXZdr3hisxcTu36fUa
         MDND5pwd95EzRkcDzfhXc/1rr4s92RbUUxxYx0V5XFdzRiOX3QHuSqRFsyT4XjpjCN
         NHCIn/NZ+eqEQ==
X-CNFS-Analysis: v=2.4 cv=A9ipg4aG c=1 sm=1 tr=0 ts=60857b17 cx=a_exe
 a=ugxisoNCKEotYwafST++Mw==:117 a=ugxisoNCKEotYwafST++Mw==:17
 a=E4scLkpOueEFzuNnOYYA:9
From:   Dario Binacchi <dariobin@libero.it>
To:     linux-kernel@vger.kernel.org
Cc:     Dario Binacchi <dariobin@libero.it>,
        Russell King <linux@armlinux.org.uk>,
        Tony Lindgren <tony@atomide.com>,
        linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org
Subject: [RESEND PATCH] ARM: OMAP2+: CM: remove omap2_set_globals_cm()
Date:   Sun, 25 Apr 2021 16:22:08 +0200
Message-Id: <20210425142208.20159-1-dariobin@libero.it>
X-Mailer: git-send-email 2.17.1
X-CMAE-Envelope: MS4xfPOiWRwNiiCrlWz94Tm0Gpby2Ynopx6Ri3QPYZG5GCHkOQ0OcdYGXDGg9LrMvH7Ho9t59JCHHvQMqo27F9TvSepaX1hjpF2coWo9p0mCa1Vbj7rtQypg
 WtI6aAQodOllMus8JtF6GLKjmmAZOk6h2GEDRkN/4pcjLrq3Ue4qbYHnRno1zFlMbC+ljRQAgUcCsOKPSxZnh51shPfEg9O5qaqzGoKxNEytLaaQNsoTjqBg
 e5YPk1Z+J+N3NQ4EFy7fSEtQYeM5Ss3+OP1G7Gux4yyjGLZPPMouwa/yXBW4kChIQvbDdAkPKaI17vlz3wNkkndyiKmUN5XJXWqgmQILPqeKJ5MIQMgTUp5A
 EvLGxuEIFGcc5eeBAt2dLSe2MLfXba2kwrKR9MOV1N9BgEu6wlBvX8MZBNAAeW6WjRd6aB+5
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

