Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7960622514A
	for <lists+linux-omap@lfdr.de>; Sun, 19 Jul 2020 12:30:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726012AbgGSKan (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sun, 19 Jul 2020 06:30:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52942 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725836AbgGSKam (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sun, 19 Jul 2020 06:30:42 -0400
Received: from smtp.al2klimov.de (smtp.al2klimov.de [IPv6:2a01:4f8:c0c:1465::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 700E4C0619D2;
        Sun, 19 Jul 2020 03:30:42 -0700 (PDT)
Received: from authenticated-user (PRIMARY_HOSTNAME [PUBLIC_IP])
        by smtp.al2klimov.de (Postfix) with ESMTPA id 9EFD9BC085;
        Sun, 19 Jul 2020 10:30:39 +0000 (UTC)
From:   "Alexander A. Klimov" <grandmaster@al2klimov.de>
To:     tony@atomide.com, linux@armlinux.org.uk,
        linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Cc:     "Alexander A. Klimov" <grandmaster@al2klimov.de>
Subject: [PATCH for v5.9] OMAP2+: Replace HTTP links with HTTPS ones
Date:   Sun, 19 Jul 2020 12:30:33 +0200
Message-Id: <20200719103033.57850-1-grandmaster@al2klimov.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Bar: +++++
X-Spam-Level: *****
Authentication-Results: smtp.al2klimov.de;
        auth=pass smtp.auth=aklimov@al2klimov.de smtp.mailfrom=grandmaster@al2klimov.de
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Rationale:
Reduces attack surface on kernel devs opening the links for MITM
as HTTPS traffic is much harder to manipulate.

Deterministic algorithm:
For each file:
  If not .svg:
    For each line:
      If doesn't contain `\bxmlns\b`:
        For each link, `\bhttp://[^# \t\r\n]*(?:\w|/)`:
	  If neither `\bgnu\.org/license`, nor `\bmozilla\.org/MPL\b`:
            If both the HTTP and HTTPS versions
            return 200 OK and serve the same content:
              Replace HTTP with HTTPS.

Signed-off-by: Alexander A. Klimov <grandmaster@al2klimov.de>
---
 Continuing my work started at 93431e0607e5.
 See also: git log --oneline '--author=Alexander A. Klimov <grandmaster@al2klimov.de>' v5.7..master
 (Actually letting a shell for loop submit all this stuff for me.)

 If there are any URLs to be removed completely
 or at least not (just) HTTPSified:
 Just clearly say so and I'll *undo my change*.
 See also: https://lkml.org/lkml/2020/6/27/64

 If there are any valid, but yet not changed URLs:
 See: https://lkml.org/lkml/2020/6/26/837

 If you apply the patch, please let me know.

 Sorry again to all maintainers who complained about subject lines.
 Now I realized that you want an actually perfect prefixes,
 not just subsystem ones.
 I tried my best...
 And yes, *I could* (at least half-)automate it.
 Impossible is nothing! :)


 arch/arm/mach-omap2/am33xx.h                  | 2 +-
 arch/arm/mach-omap2/board-generic.c           | 2 +-
 arch/arm/mach-omap2/cm-regbits-33xx.h         | 2 +-
 arch/arm/mach-omap2/cm-regbits-54xx.h         | 2 +-
 arch/arm/mach-omap2/cm-regbits-7xx.h          | 2 +-
 arch/arm/mach-omap2/cm1_54xx.h                | 2 +-
 arch/arm/mach-omap2/cm1_7xx.h                 | 2 +-
 arch/arm/mach-omap2/cm2_54xx.h                | 2 +-
 arch/arm/mach-omap2/cm2_7xx.h                 | 2 +-
 arch/arm/mach-omap2/cm33xx.c                  | 2 +-
 arch/arm/mach-omap2/cm33xx.h                  | 2 +-
 arch/arm/mach-omap2/cm81xx.h                  | 2 +-
 arch/arm/mach-omap2/display.c                 | 2 +-
 arch/arm/mach-omap2/dma.c                     | 2 +-
 arch/arm/mach-omap2/l3_2xxx.h                 | 2 +-
 arch/arm/mach-omap2/l3_3xxx.h                 | 2 +-
 arch/arm/mach-omap2/l4_2xxx.h                 | 2 +-
 arch/arm/mach-omap2/omap-iommu.c              | 2 +-
 arch/arm/mach-omap2/omap_opp_data.h           | 2 +-
 arch/arm/mach-omap2/omap_phy_internal.c       | 2 +-
 arch/arm/mach-omap2/opp3xxx_data.c            | 2 +-
 arch/arm/mach-omap2/opp4xxx_data.c            | 2 +-
 arch/arm/mach-omap2/powerdomains33xx_data.c   | 2 +-
 arch/arm/mach-omap2/prcm43xx.h                | 2 +-
 arch/arm/mach-omap2/prcm_mpu54xx.h            | 2 +-
 arch/arm/mach-omap2/prcm_mpu7xx.h             | 2 +-
 arch/arm/mach-omap2/scrm54xx.h                | 2 +-
 arch/arm/mach-omap2/sleep33xx.S               | 2 +-
 arch/arm/mach-omap2/sleep43xx.S               | 2 +-
 arch/arm/mach-omap2/ti81xx.h                  | 2 +-
 arch/arm/mach-omap2/voltagedomains54xx_data.c | 2 +-
 31 files changed, 31 insertions(+), 31 deletions(-)

diff --git a/arch/arm/mach-omap2/am33xx.h b/arch/arm/mach-omap2/am33xx.h
index 5eef093e6738..bf2b5f87e404 100644
--- a/arch/arm/mach-omap2/am33xx.h
+++ b/arch/arm/mach-omap2/am33xx.h
@@ -1,7 +1,7 @@
 /*
  * This file contains the address info for various AM33XX modules.
  *
- * Copyright (C) 2011 Texas Instruments, Inc. - http://www.ti.com/
+ * Copyright (C) 2011 Texas Instruments, Inc. - https://www.ti.com/
  *
  * This program is free software; you can redistribute it and/or
  * modify it under the terms of the GNU General Public License as
diff --git a/arch/arm/mach-omap2/board-generic.c b/arch/arm/mach-omap2/board-generic.c
index 334923d7652d..7290f033fd2d 100644
--- a/arch/arm/mach-omap2/board-generic.c
+++ b/arch/arm/mach-omap2/board-generic.c
@@ -3,7 +3,7 @@
  * Copyright (C) 2005 Nokia Corporation
  * Author: Paul Mundt <paul.mundt@nokia.com>
  *
- * Copyright (C) 2011 Texas Instruments Incorporated - http://www.ti.com/
+ * Copyright (C) 2011 Texas Instruments Incorporated - https://www.ti.com/
  *
  * Modified from the original mach-omap/omap2/board-generic.c did by Paul
  * to support the OMAP2+ device tree boards with an unique board file.
diff --git a/arch/arm/mach-omap2/cm-regbits-33xx.h b/arch/arm/mach-omap2/cm-regbits-33xx.h
index c0823fd6d5e0..e7ae2bb515e3 100644
--- a/arch/arm/mach-omap2/cm-regbits-33xx.h
+++ b/arch/arm/mach-omap2/cm-regbits-33xx.h
@@ -4,7 +4,7 @@
  * This file is automatically generated from the AM33XX hardware databases.
  * Vaibhav Hiremath <hvaibhav@ti.com>
  *
- * Copyright (C) 2011-2012 Texas Instruments Incorporated - http://www.ti.com/
+ * Copyright (C) 2011-2012 Texas Instruments Incorporated - https://www.ti.com/
  *
  * This program is free software; you can redistribute it and/or
  * modify it under the terms of the GNU General Public License as
diff --git a/arch/arm/mach-omap2/cm-regbits-54xx.h b/arch/arm/mach-omap2/cm-regbits-54xx.h
index 44663b575bf4..fc886883866f 100644
--- a/arch/arm/mach-omap2/cm-regbits-54xx.h
+++ b/arch/arm/mach-omap2/cm-regbits-54xx.h
@@ -2,7 +2,7 @@
 /*
  * OMAP54xx Clock Management register bits
  *
- * Copyright (C) 2013 Texas Instruments Incorporated - http://www.ti.com
+ * Copyright (C) 2013 Texas Instruments Incorporated - https://www.ti.com
  *
  * Paul Walmsley (paul@pwsan.com)
  * Rajendra Nayak (rnayak@ti.com)
diff --git a/arch/arm/mach-omap2/cm-regbits-7xx.h b/arch/arm/mach-omap2/cm-regbits-7xx.h
index a78ccbaab1a6..2725af4d1f87 100644
--- a/arch/arm/mach-omap2/cm-regbits-7xx.h
+++ b/arch/arm/mach-omap2/cm-regbits-7xx.h
@@ -2,7 +2,7 @@
 /*
  * DRA7xx Clock Management register bits
  *
- * Copyright (C) 2013 Texas Instruments Incorporated - http://www.ti.com
+ * Copyright (C) 2013 Texas Instruments Incorporated - https://www.ti.com
  *
  * Generated by code originally written by:
  * Paul Walmsley (paul@pwsan.com)
diff --git a/arch/arm/mach-omap2/cm1_54xx.h b/arch/arm/mach-omap2/cm1_54xx.h
index 7be363a27a40..eb86bbd93f35 100644
--- a/arch/arm/mach-omap2/cm1_54xx.h
+++ b/arch/arm/mach-omap2/cm1_54xx.h
@@ -2,7 +2,7 @@
 /*
  * OMAP54xx CM1 instance offset macros
  *
- * Copyright (C) 2013 Texas Instruments Incorporated - http://www.ti.com
+ * Copyright (C) 2013 Texas Instruments Incorporated - https://www.ti.com
  *
  * Paul Walmsley (paul@pwsan.com)
  * Rajendra Nayak (rnayak@ti.com)
diff --git a/arch/arm/mach-omap2/cm1_7xx.h b/arch/arm/mach-omap2/cm1_7xx.h
index 28660edc7f5f..aae3831f5233 100644
--- a/arch/arm/mach-omap2/cm1_7xx.h
+++ b/arch/arm/mach-omap2/cm1_7xx.h
@@ -2,7 +2,7 @@
 /*
  * DRA7xx CM1 instance offset macros
  *
- * Copyright (C) 2013 Texas Instruments Incorporated - http://www.ti.com
+ * Copyright (C) 2013 Texas Instruments Incorporated - https://www.ti.com
  *
  * Generated by code originally written by:
  * Paul Walmsley (paul@pwsan.com)
diff --git a/arch/arm/mach-omap2/cm2_54xx.h b/arch/arm/mach-omap2/cm2_54xx.h
index c5da1f5cae93..8e49765cd441 100644
--- a/arch/arm/mach-omap2/cm2_54xx.h
+++ b/arch/arm/mach-omap2/cm2_54xx.h
@@ -2,7 +2,7 @@
 /*
  * OMAP54xx CM2 instance offset macros
  *
- * Copyright (C) 2013 Texas Instruments Incorporated - http://www.ti.com
+ * Copyright (C) 2013 Texas Instruments Incorporated - https://www.ti.com
  *
  * Paul Walmsley (paul@pwsan.com)
  * Rajendra Nayak (rnayak@ti.com)
diff --git a/arch/arm/mach-omap2/cm2_7xx.h b/arch/arm/mach-omap2/cm2_7xx.h
index e16fc58ef152..f8734605b1e1 100644
--- a/arch/arm/mach-omap2/cm2_7xx.h
+++ b/arch/arm/mach-omap2/cm2_7xx.h
@@ -2,7 +2,7 @@
 /*
  * DRA7xx CM2 instance offset macros
  *
- * Copyright (C) 2013 Texas Instruments Incorporated - http://www.ti.com
+ * Copyright (C) 2013 Texas Instruments Incorporated - https://www.ti.com
  *
  * Generated by code originally written by:
  * Paul Walmsley (paul@pwsan.com)
diff --git a/arch/arm/mach-omap2/cm33xx.c b/arch/arm/mach-omap2/cm33xx.c
index 084d454f6074..ac4882ebdca3 100644
--- a/arch/arm/mach-omap2/cm33xx.c
+++ b/arch/arm/mach-omap2/cm33xx.c
@@ -1,7 +1,7 @@
 /*
  * AM33XX CM functions
  *
- * Copyright (C) 2011-2012 Texas Instruments Incorporated - http://www.ti.com/
+ * Copyright (C) 2011-2012 Texas Instruments Incorporated - https://www.ti.com/
  * Vaibhav Hiremath <hvaibhav@ti.com>
  *
  * Reference taken from from OMAP4 cminst44xx.c
diff --git a/arch/arm/mach-omap2/cm33xx.h b/arch/arm/mach-omap2/cm33xx.h
index a91f7d282455..63b362bfc4d9 100644
--- a/arch/arm/mach-omap2/cm33xx.h
+++ b/arch/arm/mach-omap2/cm33xx.h
@@ -1,7 +1,7 @@
 /*
  * AM33XX CM offset macros
  *
- * Copyright (C) 2011-2012 Texas Instruments Incorporated - http://www.ti.com/
+ * Copyright (C) 2011-2012 Texas Instruments Incorporated - https://www.ti.com/
  * Vaibhav Hiremath <hvaibhav@ti.com>
  *
  * This program is free software; you can redistribute it and/or
diff --git a/arch/arm/mach-omap2/cm81xx.h b/arch/arm/mach-omap2/cm81xx.h
index 5d73a1057c82..bd91223e838e 100644
--- a/arch/arm/mach-omap2/cm81xx.h
+++ b/arch/arm/mach-omap2/cm81xx.h
@@ -1,7 +1,7 @@
 /*
  * Clock domain register offsets for TI81XX.
  *
- * Copyright (C) 2010 Texas Instruments, Inc. - http://www.ti.com/
+ * Copyright (C) 2010 Texas Instruments, Inc. - https://www.ti.com/
  * Copyright (C) 2013 SKTB SKiT, http://www.skitlab.ru/
  *
  * This program is free software; you can redistribute it and/or
diff --git a/arch/arm/mach-omap2/display.c b/arch/arm/mach-omap2/display.c
index 46012ca812f4..2000fca6bd4e 100644
--- a/arch/arm/mach-omap2/display.c
+++ b/arch/arm/mach-omap2/display.c
@@ -1,7 +1,7 @@
 /*
  * OMAP2plus display device setup / initialization.
  *
- * Copyright (C) 2010 Texas Instruments Incorporated - http://www.ti.com/
+ * Copyright (C) 2010 Texas Instruments Incorporated - https://www.ti.com/
  *	Senthilvadivu Guruswamy
  *	Sumit Semwal
  *
diff --git a/arch/arm/mach-omap2/dma.c b/arch/arm/mach-omap2/dma.c
index 8cc109cc242a..dfc9b21ff19b 100644
--- a/arch/arm/mach-omap2/dma.c
+++ b/arch/arm/mach-omap2/dma.c
@@ -13,7 +13,7 @@
  * Copyright (C) 2009 Texas Instruments
  * Added OMAP4 support - Santosh Shilimkar <santosh.shilimkar@ti.com>
  *
- * Copyright (C) 2010 Texas Instruments Incorporated - http://www.ti.com/
+ * Copyright (C) 2010 Texas Instruments Incorporated - https://www.ti.com/
  * Converted DMA library into platform driver
  *	- G, Manjunath Kondaiah <manjugk@ti.com>
  */
diff --git a/arch/arm/mach-omap2/l3_2xxx.h b/arch/arm/mach-omap2/l3_2xxx.h
index c2bd8d86202b..6297c62428ac 100644
--- a/arch/arm/mach-omap2/l3_2xxx.h
+++ b/arch/arm/mach-omap2/l3_2xxx.h
@@ -2,7 +2,7 @@
 /*
  * arch/arm/plat-omap/include/plat/l3_2xxx.h - L3 firewall definitions
  *
- * Copyright (C) 2010 Texas Instruments Incorporated - http://www.ti.com/
+ * Copyright (C) 2010 Texas Instruments Incorporated - https://www.ti.com/
  *	Sumit Semwal
  */
 #ifndef __ARCH_ARM_PLAT_OMAP_INCLUDE_PLAT_L3_2XXX_H
diff --git a/arch/arm/mach-omap2/l3_3xxx.h b/arch/arm/mach-omap2/l3_3xxx.h
index 995ebccd13e0..60ea7b201fdc 100644
--- a/arch/arm/mach-omap2/l3_3xxx.h
+++ b/arch/arm/mach-omap2/l3_3xxx.h
@@ -2,7 +2,7 @@
 /*
  * arch/arm/plat-omap/include/plat/l3_3xxx.h - L3 firewall definitions
  *
- * Copyright (C) 2010 Texas Instruments Incorporated - http://www.ti.com/
+ * Copyright (C) 2010 Texas Instruments Incorporated - https://www.ti.com/
  *	Sumit Semwal
  */
 #ifndef __ARCH_ARM_PLAT_OMAP_INCLUDE_PLAT_L3_3XXX_H
diff --git a/arch/arm/mach-omap2/l4_2xxx.h b/arch/arm/mach-omap2/l4_2xxx.h
index 556e69c2bd00..418e1072d730 100644
--- a/arch/arm/mach-omap2/l4_2xxx.h
+++ b/arch/arm/mach-omap2/l4_2xxx.h
@@ -2,7 +2,7 @@
 /*
  * arch/arm/plat-omap/include/plat/l4_2xxx.h - L4 firewall definitions
  *
- * Copyright (C) 2010 Texas Instruments Incorporated - http://www.ti.com/
+ * Copyright (C) 2010 Texas Instruments Incorporated - https://www.ti.com/
  *	Sumit Semwal
  */
 #ifndef __ARCH_ARM_PLAT_OMAP_INCLUDE_PLAT_L4_2XXX_H
diff --git a/arch/arm/mach-omap2/omap-iommu.c b/arch/arm/mach-omap2/omap-iommu.c
index 54aff33e55e6..df6686b97b75 100644
--- a/arch/arm/mach-omap2/omap-iommu.c
+++ b/arch/arm/mach-omap2/omap-iommu.c
@@ -2,7 +2,7 @@
 /*
  * OMAP IOMMU quirks for various TI SoCs
  *
- * Copyright (C) 2015-2019 Texas Instruments Incorporated - http://www.ti.com/
+ * Copyright (C) 2015-2019 Texas Instruments Incorporated - https://www.ti.com/
  *      Suman Anna <s-anna@ti.com>
  */
 
diff --git a/arch/arm/mach-omap2/omap_opp_data.h b/arch/arm/mach-omap2/omap_opp_data.h
index 336fdfcf88bb..533dd643069a 100644
--- a/arch/arm/mach-omap2/omap_opp_data.h
+++ b/arch/arm/mach-omap2/omap_opp_data.h
@@ -1,7 +1,7 @@
 /*
  * OMAP SoC specific OPP Data helpers
  *
- * Copyright (C) 2009-2010 Texas Instruments Incorporated - http://www.ti.com/
+ * Copyright (C) 2009-2010 Texas Instruments Incorporated - https://www.ti.com/
  *	Nishanth Menon
  *	Kevin Hilman
  * Copyright (C) 2010 Nokia Corporation.
diff --git a/arch/arm/mach-omap2/omap_phy_internal.c b/arch/arm/mach-omap2/omap_phy_internal.c
index d2925e8b2eff..6f6a6a66c981 100644
--- a/arch/arm/mach-omap2/omap_phy_internal.c
+++ b/arch/arm/mach-omap2/omap_phy_internal.c
@@ -3,7 +3,7 @@
   * This file configures the internal USB PHY in OMAP4430. Used
   * with TWL6030 transceiver and MUSB on OMAP4430.
   *
-  * Copyright (C) 2010 Texas Instruments Incorporated - http://www.ti.com
+  * Copyright (C) 2010 Texas Instruments Incorporated - https://www.ti.com
   * Author: Hema HK <hemahk@ti.com>
   */
 
diff --git a/arch/arm/mach-omap2/opp3xxx_data.c b/arch/arm/mach-omap2/opp3xxx_data.c
index c2d459f5b0da..b610c5fb423b 100644
--- a/arch/arm/mach-omap2/opp3xxx_data.c
+++ b/arch/arm/mach-omap2/opp3xxx_data.c
@@ -1,7 +1,7 @@
 /*
  * OMAP3 OPP table definitions.
  *
- * Copyright (C) 2009-2010 Texas Instruments Incorporated - http://www.ti.com/
+ * Copyright (C) 2009-2010 Texas Instruments Incorporated - https://www.ti.com/
  *	Nishanth Menon
  *	Kevin Hilman
  * Copyright (C) 2010-2011 Nokia Corporation.
diff --git a/arch/arm/mach-omap2/opp4xxx_data.c b/arch/arm/mach-omap2/opp4xxx_data.c
index 985aeab9bc2a..d937c5ef41c6 100644
--- a/arch/arm/mach-omap2/opp4xxx_data.c
+++ b/arch/arm/mach-omap2/opp4xxx_data.c
@@ -1,7 +1,7 @@
 /*
  * OMAP4 OPP table definitions.
  *
- * Copyright (C) 2010-2012 Texas Instruments Incorporated - http://www.ti.com/
+ * Copyright (C) 2010-2012 Texas Instruments Incorporated - https://www.ti.com/
  *	Nishanth Menon
  *	Kevin Hilman
  *	Thara Gopinath
diff --git a/arch/arm/mach-omap2/powerdomains33xx_data.c b/arch/arm/mach-omap2/powerdomains33xx_data.c
index 869adb82569e..626055e59aed 100644
--- a/arch/arm/mach-omap2/powerdomains33xx_data.c
+++ b/arch/arm/mach-omap2/powerdomains33xx_data.c
@@ -1,7 +1,7 @@
 /*
  * AM33XX Power domain data
  *
- * Copyright (C) 2011-2012 Texas Instruments Incorporated - http://www.ti.com/
+ * Copyright (C) 2011-2012 Texas Instruments Incorporated - https://www.ti.com/
  *
  * This program is free software; you can redistribute it and/or
  * modify it under the terms of the GNU General Public License as
diff --git a/arch/arm/mach-omap2/prcm43xx.h b/arch/arm/mach-omap2/prcm43xx.h
index 7078a61c1d3f..899da0ae9800 100644
--- a/arch/arm/mach-omap2/prcm43xx.h
+++ b/arch/arm/mach-omap2/prcm43xx.h
@@ -1,7 +1,7 @@
 /*
  * AM43x PRCM defines
  *
- * Copyright (C) 2013 Texas Instruments Incorporated - http://www.ti.com/
+ * Copyright (C) 2013 Texas Instruments Incorporated - https://www.ti.com/
  *
  * This file is licensed under the terms of the GNU General Public License
  * version 2.  This program is licensed "as is" without any warranty of any
diff --git a/arch/arm/mach-omap2/prcm_mpu54xx.h b/arch/arm/mach-omap2/prcm_mpu54xx.h
index 6ef38829c064..bdbfa070b08e 100644
--- a/arch/arm/mach-omap2/prcm_mpu54xx.h
+++ b/arch/arm/mach-omap2/prcm_mpu54xx.h
@@ -2,7 +2,7 @@
 /*
  * OMAP54xx PRCM MPU instance offset macros
  *
- * Copyright (C) 2013 Texas Instruments Incorporated - http://www.ti.com
+ * Copyright (C) 2013 Texas Instruments Incorporated - https://www.ti.com
  *
  * Paul Walmsley (paul@pwsan.com)
  * Rajendra Nayak (rnayak@ti.com)
diff --git a/arch/arm/mach-omap2/prcm_mpu7xx.h b/arch/arm/mach-omap2/prcm_mpu7xx.h
index 33d0013aa1d4..2e3032440ea0 100644
--- a/arch/arm/mach-omap2/prcm_mpu7xx.h
+++ b/arch/arm/mach-omap2/prcm_mpu7xx.h
@@ -2,7 +2,7 @@
 /*
  * DRA7xx PRCM MPU instance offset macros
  *
- * Copyright (C) 2013 Texas Instruments Incorporated - http://www.ti.com
+ * Copyright (C) 2013 Texas Instruments Incorporated - https://www.ti.com
  *
  * Generated by code originally written by:
  * Paul Walmsley (paul@pwsan.com)
diff --git a/arch/arm/mach-omap2/scrm54xx.h b/arch/arm/mach-omap2/scrm54xx.h
index 810d2b186337..cb6f3e6a7095 100644
--- a/arch/arm/mach-omap2/scrm54xx.h
+++ b/arch/arm/mach-omap2/scrm54xx.h
@@ -2,7 +2,7 @@
 /*
  * OMAP54XX SCRM registers and bitfields
  *
- * Copyright (C) 2013 Texas Instruments Incorporated - http://www.ti.com
+ * Copyright (C) 2013 Texas Instruments Incorporated - https://www.ti.com
  *
  * Benoit Cousson (b-cousson@ti.com)
  *
diff --git a/arch/arm/mach-omap2/sleep33xx.S b/arch/arm/mach-omap2/sleep33xx.S
index dc221249bc22..ac3d0b363c51 100644
--- a/arch/arm/mach-omap2/sleep33xx.S
+++ b/arch/arm/mach-omap2/sleep33xx.S
@@ -2,7 +2,7 @@
 /*
  * Low level suspend code for AM33XX SoCs
  *
- * Copyright (C) 2012-2018 Texas Instruments Incorporated - http://www.ti.com/
+ * Copyright (C) 2012-2018 Texas Instruments Incorporated - https://www.ti.com/
  *	Dave Gerlach, Vaibhav Bedia
  */
 
diff --git a/arch/arm/mach-omap2/sleep43xx.S b/arch/arm/mach-omap2/sleep43xx.S
index 90d2907a2eb2..832c91327945 100644
--- a/arch/arm/mach-omap2/sleep43xx.S
+++ b/arch/arm/mach-omap2/sleep43xx.S
@@ -2,7 +2,7 @@
 /*
  * Low level suspend code for AM43XX SoCs
  *
- * Copyright (C) 2013-2018 Texas Instruments Incorporated - http://www.ti.com/
+ * Copyright (C) 2013-2018 Texas Instruments Incorporated - https://www.ti.com/
  *	Dave Gerlach, Vaibhav Bedia
  */
 
diff --git a/arch/arm/mach-omap2/ti81xx.h b/arch/arm/mach-omap2/ti81xx.h
index a1e6caf0dba6..192b0e7d3eb4 100644
--- a/arch/arm/mach-omap2/ti81xx.h
+++ b/arch/arm/mach-omap2/ti81xx.h
@@ -1,7 +1,7 @@
 /*
  * This file contains the address data for various TI81XX modules.
  *
- * Copyright (C) 2010 Texas Instruments, Inc. - http://www.ti.com/
+ * Copyright (C) 2010 Texas Instruments, Inc. - https://www.ti.com/
  *
  * This program is free software; you can redistribute it and/or
  * modify it under the terms of the GNU General Public License as
diff --git a/arch/arm/mach-omap2/voltagedomains54xx_data.c b/arch/arm/mach-omap2/voltagedomains54xx_data.c
index aac274d6a93b..e60d76db0f21 100644
--- a/arch/arm/mach-omap2/voltagedomains54xx_data.c
+++ b/arch/arm/mach-omap2/voltagedomains54xx_data.c
@@ -4,7 +4,7 @@
  *
  * Based on voltagedomains44xx_data.c
  *
- * Copyright (C) 2013 Texas Instruments Incorporated - http://www.ti.com
+ * Copyright (C) 2013 Texas Instruments Incorporated - https://www.ti.com
  */
 #include <linux/kernel.h>
 #include <linux/err.h>
-- 
2.27.0

