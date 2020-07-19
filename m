Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3B3062250C6
	for <lists+linux-omap@lfdr.de>; Sun, 19 Jul 2020 10:48:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725988AbgGSIs4 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sun, 19 Jul 2020 04:48:56 -0400
Received: from smtp.al2klimov.de ([78.46.175.9]:36374 "EHLO smtp.al2klimov.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725836AbgGSIsz (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Sun, 19 Jul 2020 04:48:55 -0400
Received: from authenticated-user (PRIMARY_HOSTNAME [PUBLIC_IP])
        by smtp.al2klimov.de (Postfix) with ESMTPA id D879EBC065;
        Sun, 19 Jul 2020 08:48:50 +0000 (UTC)
From:   "Alexander A. Klimov" <grandmaster@al2klimov.de>
To:     rnayak@codeaurora.org, paul@pwsan.com, tony@atomide.com,
        linux@armlinux.org.uk, linux-omap@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc:     "Alexander A. Klimov" <grandmaster@al2klimov.de>
Subject: [PATCH for v5.9] ARM: OMAP2+: PRM: Replace HTTP links with HTTPS ones
Date:   Sun, 19 Jul 2020 10:48:44 +0200
Message-Id: <20200719084844.57001-1-grandmaster@al2klimov.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Bar: ++++++
X-Spam-Level: ******
Authentication-Results: smtp.al2klimov.de;
        auth=pass smtp.auth=aklimov@al2klimov.de smtp.mailfrom=grandmaster@al2klimov.de
X-Spam: Yes
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


 arch/arm/mach-omap2/prm-regbits-33xx.h | 2 +-
 arch/arm/mach-omap2/prm33xx.c          | 2 +-
 arch/arm/mach-omap2/prm33xx.h          | 2 +-
 arch/arm/mach-omap2/prm54xx.h          | 2 +-
 arch/arm/mach-omap2/prm7xx.h           | 2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/arm/mach-omap2/prm-regbits-33xx.h b/arch/arm/mach-omap2/prm-regbits-33xx.h
index 84feecee4fe6..7dfdff09ddeb 100644
--- a/arch/arm/mach-omap2/prm-regbits-33xx.h
+++ b/arch/arm/mach-omap2/prm-regbits-33xx.h
@@ -1,7 +1,7 @@
 /*
  * AM33XX PRM_XXX register bits
  *
- * Copyright (C) 2011-2012 Texas Instruments Incorporated - http://www.ti.com/
+ * Copyright (C) 2011-2012 Texas Instruments Incorporated - https://www.ti.com/
  *
  * This program is free software; you can redistribute it and/or
  * modify it under the terms of the GNU General Public License as
diff --git a/arch/arm/mach-omap2/prm33xx.c b/arch/arm/mach-omap2/prm33xx.c
index d5141669c28d..9144cc0479af 100644
--- a/arch/arm/mach-omap2/prm33xx.c
+++ b/arch/arm/mach-omap2/prm33xx.c
@@ -1,7 +1,7 @@
 /*
  * AM33XX PRM functions
  *
- * Copyright (C) 2011-2012 Texas Instruments Incorporated - http://www.ti.com/
+ * Copyright (C) 2011-2012 Texas Instruments Incorporated - https://www.ti.com/
  *
  * This program is free software; you can redistribute it and/or
  * modify it under the terms of the GNU General Public License as
diff --git a/arch/arm/mach-omap2/prm33xx.h b/arch/arm/mach-omap2/prm33xx.h
index 66302c6aba61..d0b7404565f1 100644
--- a/arch/arm/mach-omap2/prm33xx.h
+++ b/arch/arm/mach-omap2/prm33xx.h
@@ -1,7 +1,7 @@
 /*
  * AM33XX PRM instance offset macros
  *
- * Copyright (C) 2011-2012 Texas Instruments Incorporated - http://www.ti.com/
+ * Copyright (C) 2011-2012 Texas Instruments Incorporated - https://www.ti.com/
  *
  * This program is free software; you can redistribute it and/or
  * modify it under the terms of the GNU General Public License as
diff --git a/arch/arm/mach-omap2/prm54xx.h b/arch/arm/mach-omap2/prm54xx.h
index ee0f1cc92e3a..7329d6fcd78b 100644
--- a/arch/arm/mach-omap2/prm54xx.h
+++ b/arch/arm/mach-omap2/prm54xx.h
@@ -2,7 +2,7 @@
 /*
  * OMAP54xx PRM instance offset macros
  *
- * Copyright (C) 2013 Texas Instruments Incorporated - http://www.ti.com
+ * Copyright (C) 2013 Texas Instruments Incorporated - https://www.ti.com
  *
  * Paul Walmsley (paul@pwsan.com)
  * Rajendra Nayak (rnayak@ti.com)
diff --git a/arch/arm/mach-omap2/prm7xx.h b/arch/arm/mach-omap2/prm7xx.h
index cf99307d1b1f..e5aee0409eae 100644
--- a/arch/arm/mach-omap2/prm7xx.h
+++ b/arch/arm/mach-omap2/prm7xx.h
@@ -2,7 +2,7 @@
 /*
  * DRA7xx PRM instance offset macros
  *
- * Copyright (C) 2013 Texas Instruments Incorporated - http://www.ti.com
+ * Copyright (C) 2013 Texas Instruments Incorporated - https://www.ti.com
  *
  * Generated by code originally written by:
  * Paul Walmsley (paul@pwsan.com)
-- 
2.27.0

