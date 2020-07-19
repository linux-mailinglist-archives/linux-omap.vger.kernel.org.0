Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5386E2250C9
	for <lists+linux-omap@lfdr.de>; Sun, 19 Jul 2020 10:59:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726038AbgGSI7G (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sun, 19 Jul 2020 04:59:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38964 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725836AbgGSI7G (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sun, 19 Jul 2020 04:59:06 -0400
Received: from smtp.al2klimov.de (smtp.al2klimov.de [IPv6:2a01:4f8:c0c:1465::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 14D25C0619D2;
        Sun, 19 Jul 2020 01:59:06 -0700 (PDT)
Received: from authenticated-user (PRIMARY_HOSTNAME [PUBLIC_IP])
        by smtp.al2klimov.de (Postfix) with ESMTPA id A834EBC065;
        Sun, 19 Jul 2020 08:59:00 +0000 (UTC)
From:   "Alexander A. Klimov" <grandmaster@al2klimov.de>
To:     paul@pwsan.com, tony@atomide.com, linux@armlinux.org.uk,
        linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Cc:     "Alexander A. Klimov" <grandmaster@al2klimov.de>
Subject: [PATCH for v5.9] ARM: OMAP2+: Replace HTTP links with HTTPS ones
Date:   Sun, 19 Jul 2020 10:58:53 +0200
Message-Id: <20200719085853.57137-1-grandmaster@al2klimov.de>
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


 arch/arm/mach-omap2/clockdomains33xx_data.c | 2 +-
 arch/arm/mach-omap2/clockdomains81xx_data.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/mach-omap2/clockdomains33xx_data.c b/arch/arm/mach-omap2/clockdomains33xx_data.c
index 32c90fd9eba2..b4d5144df445 100644
--- a/arch/arm/mach-omap2/clockdomains33xx_data.c
+++ b/arch/arm/mach-omap2/clockdomains33xx_data.c
@@ -1,7 +1,7 @@
 /*
  * AM33XX Clock Domain data.
  *
- * Copyright (C) 2011-2012 Texas Instruments Incorporated - http://www.ti.com/
+ * Copyright (C) 2011-2012 Texas Instruments Incorporated - https://www.ti.com/
  * Vaibhav Hiremath <hvaibhav@ti.com>
  *
  * This program is free software; you can redistribute it and/or
diff --git a/arch/arm/mach-omap2/clockdomains81xx_data.c b/arch/arm/mach-omap2/clockdomains81xx_data.c
index 65fbd136b20c..127dc7ace71f 100644
--- a/arch/arm/mach-omap2/clockdomains81xx_data.c
+++ b/arch/arm/mach-omap2/clockdomains81xx_data.c
@@ -1,7 +1,7 @@
 /*
  * TI81XX Clock Domain data.
  *
- * Copyright (C) 2010 Texas Instruments, Inc. - http://www.ti.com/
+ * Copyright (C) 2010 Texas Instruments, Inc. - https://www.ti.com/
  * Copyright (C) 2013 SKTB SKiT, http://www.skitlab.ru/
  *
  * This program is free software; you can redistribute it and/or
-- 
2.27.0

