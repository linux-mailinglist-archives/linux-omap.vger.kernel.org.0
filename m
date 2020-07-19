Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C49352253E4
	for <lists+linux-omap@lfdr.de>; Sun, 19 Jul 2020 22:06:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726093AbgGSUGe (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sun, 19 Jul 2020 16:06:34 -0400
Received: from smtp.al2klimov.de ([78.46.175.9]:39488 "EHLO smtp.al2klimov.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726009AbgGSUGe (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Sun, 19 Jul 2020 16:06:34 -0400
Received: from authenticated-user (PRIMARY_HOSTNAME [PUBLIC_IP])
        by smtp.al2klimov.de (Postfix) with ESMTPA id BDBE4BC063;
        Sun, 19 Jul 2020 20:06:29 +0000 (UTC)
From:   "Alexander A. Klimov" <grandmaster@al2klimov.de>
To:     lgirdwood@gmail.com, broonie@kernel.org, robh+dt@kernel.org,
        tony@atomide.com, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-omap@vger.kernel.org
Cc:     "Alexander A. Klimov" <grandmaster@al2klimov.de>
Subject: [PATCH for v5.9] regulator: Replace HTTP links with HTTPS ones
Date:   Sun, 19 Jul 2020 22:06:23 +0200
Message-Id: <20200719200623.61524-1-grandmaster@al2klimov.de>
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


 Documentation/devicetree/bindings/regulator/lp872x.txt | 4 ++--
 drivers/regulator/hi6421-regulator.c                   | 2 +-
 drivers/regulator/hi6421v530-regulator.c               | 2 +-
 drivers/regulator/lp873x-regulator.c                   | 2 +-
 drivers/regulator/lp87565-regulator.c                  | 2 +-
 drivers/regulator/pbias-regulator.c                    | 2 +-
 drivers/regulator/tps65023-regulator.c                 | 2 +-
 drivers/regulator/tps6507x-regulator.c                 | 2 +-
 drivers/regulator/tps65086-regulator.c                 | 2 +-
 drivers/regulator/tps65217-regulator.c                 | 2 +-
 drivers/regulator/tps65218-regulator.c                 | 2 +-
 drivers/regulator/tps65912-regulator.c                 | 2 +-
 12 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/Documentation/devicetree/bindings/regulator/lp872x.txt b/Documentation/devicetree/bindings/regulator/lp872x.txt
index ca58a68ffdf1..ab895cd1cac1 100644
--- a/Documentation/devicetree/bindings/regulator/lp872x.txt
+++ b/Documentation/devicetree/bindings/regulator/lp872x.txt
@@ -37,8 +37,8 @@ Optional properties:
     (Documentation/devicetree/bindings/regulator/regulator.txt)
 
 Datasheet
-  - LP8720: http://www.ti.com/lit/ds/symlink/lp8720.pdf
-  - LP8725: http://www.ti.com/lit/ds/symlink/lp8725.pdf
+  - LP8720: https://www.ti.com/lit/ds/symlink/lp8720.pdf
+  - LP8725: https://www.ti.com/lit/ds/symlink/lp8725.pdf
 
 Example 1) LP8720
 
diff --git a/drivers/regulator/hi6421-regulator.c b/drivers/regulator/hi6421-regulator.c
index 66219d8dfc1a..dc631c1a46b4 100644
--- a/drivers/regulator/hi6421-regulator.c
+++ b/drivers/regulator/hi6421-regulator.c
@@ -5,7 +5,7 @@
 // Copyright (c) <2011-2014> HiSilicon Technologies Co., Ltd.
 //              http://www.hisilicon.com
 // Copyright (c) <2013-2014> Linaro Ltd.
-//              http://www.linaro.org
+//              https://www.linaro.org
 //
 // Author: Guodong Xu <guodong.xu@linaro.org>
 
diff --git a/drivers/regulator/hi6421v530-regulator.c b/drivers/regulator/hi6421v530-regulator.c
index 06ae65199afd..988115f9b594 100644
--- a/drivers/regulator/hi6421v530-regulator.c
+++ b/drivers/regulator/hi6421v530-regulator.c
@@ -5,7 +5,7 @@
 // Copyright (c) <2017> HiSilicon Technologies Co., Ltd.
 //              http://www.hisilicon.com
 // Copyright (c) <2017> Linaro Ltd.
-//              http://www.linaro.org
+//              https://www.linaro.org
 //
 // Author: Wang Xiaoyin <hw.wangxiaoyin@hisilicon.com>
 //         Guodong Xu <guodong.xu@linaro.org>
diff --git a/drivers/regulator/lp873x-regulator.c b/drivers/regulator/lp873x-regulator.c
index fe049b67e7d5..c38387e0fbb2 100644
--- a/drivers/regulator/lp873x-regulator.c
+++ b/drivers/regulator/lp873x-regulator.c
@@ -1,7 +1,7 @@
 /*
  * Regulator driver for LP873X PMIC
  *
- * Copyright (C) 2016 Texas Instruments Incorporated - http://www.ti.com/
+ * Copyright (C) 2016 Texas Instruments Incorporated - https://www.ti.com/
  *
  * This program is free software; you can redistribute it and/or
  * modify it under the terms of the GNU General Public License version 2 as
diff --git a/drivers/regulator/lp87565-regulator.c b/drivers/regulator/lp87565-regulator.c
index 5d525dacf959..b77d69b687d9 100644
--- a/drivers/regulator/lp87565-regulator.c
+++ b/drivers/regulator/lp87565-regulator.c
@@ -2,7 +2,7 @@
 /*
  * Regulator driver for LP87565 PMIC
  *
- * Copyright (C) 2017 Texas Instruments Incorporated - http://www.ti.com/
+ * Copyright (C) 2017 Texas Instruments Incorporated - https://www.ti.com/
  */
 
 #include <linux/module.h>
diff --git a/drivers/regulator/pbias-regulator.c b/drivers/regulator/pbias-regulator.c
index bfc15dd3f730..4eccf12f39de 100644
--- a/drivers/regulator/pbias-regulator.c
+++ b/drivers/regulator/pbias-regulator.c
@@ -1,7 +1,7 @@
 /*
  * pbias-regulator.c
  *
- * Copyright (C) 2014 Texas Instruments Incorporated - http://www.ti.com/
+ * Copyright (C) 2014 Texas Instruments Incorporated - https://www.ti.com/
  * Author: Balaji T K <balajitk@ti.com>
  *
  * This program is free software; you can redistribute it and/or
diff --git a/drivers/regulator/tps65023-regulator.c b/drivers/regulator/tps65023-regulator.c
index 5ca6d2130593..795d459ff3cf 100644
--- a/drivers/regulator/tps65023-regulator.c
+++ b/drivers/regulator/tps65023-regulator.c
@@ -3,7 +3,7 @@
  *
  * Supports TPS65023 Regulator
  *
- * Copyright (C) 2009 Texas Instrument Incorporated - http://www.ti.com/
+ * Copyright (C) 2009 Texas Instrument Incorporated - https://www.ti.com/
  *
  * This program is free software; you can redistribute it and/or
  * modify it under the terms of the GNU General Public License as
diff --git a/drivers/regulator/tps6507x-regulator.c b/drivers/regulator/tps6507x-regulator.c
index d2a8f69b2665..eafbc2bb4b57 100644
--- a/drivers/regulator/tps6507x-regulator.c
+++ b/drivers/regulator/tps6507x-regulator.c
@@ -3,7 +3,7 @@
  *
  * Regulator driver for TPS65073 PMIC
  *
- * Copyright (C) 2009 Texas Instrument Incorporated - http://www.ti.com/
+ * Copyright (C) 2009 Texas Instrument Incorporated - https://www.ti.com/
  *
  * This program is free software; you can redistribute it and/or
  * modify it under the terms of the GNU General Public License as
diff --git a/drivers/regulator/tps65086-regulator.c b/drivers/regulator/tps65086-regulator.c
index 9910e949373c..23528475a962 100644
--- a/drivers/regulator/tps65086-regulator.c
+++ b/drivers/regulator/tps65086-regulator.c
@@ -1,5 +1,5 @@
 /*
- * Copyright (C) 2015 Texas Instruments Incorporated - http://www.ti.com/
+ * Copyright (C) 2015 Texas Instruments Incorporated - https://www.ti.com/
  *
  * Author: Andrew F. Davis <afd@ti.com>
  *
diff --git a/drivers/regulator/tps65217-regulator.c b/drivers/regulator/tps65217-regulator.c
index d27dbbafcf72..2c989256c0a7 100644
--- a/drivers/regulator/tps65217-regulator.c
+++ b/drivers/regulator/tps65217-regulator.c
@@ -3,7 +3,7 @@
  *
  * Regulator driver for TPS65217 PMIC
  *
- * Copyright (C) 2011 Texas Instruments Incorporated - http://www.ti.com/
+ * Copyright (C) 2011 Texas Instruments Incorporated - https://www.ti.com/
  *
  * This program is free software; you can redistribute it and/or
  * modify it under the terms of the GNU General Public License as
diff --git a/drivers/regulator/tps65218-regulator.c b/drivers/regulator/tps65218-regulator.c
index 05d13f807918..433f27cb324e 100644
--- a/drivers/regulator/tps65218-regulator.c
+++ b/drivers/regulator/tps65218-regulator.c
@@ -3,7 +3,7 @@
  *
  * Regulator driver for TPS65218 PMIC
  *
- * Copyright (C) 2014 Texas Instruments Incorporated - http://www.ti.com/
+ * Copyright (C) 2014 Texas Instruments Incorporated - https://www.ti.com/
  *
  * This program is free software; you can redistribute it and/or
  * modify it under the terms of the GNU General Public License version 2 as
diff --git a/drivers/regulator/tps65912-regulator.c b/drivers/regulator/tps65912-regulator.c
index 15c79931ea89..63d6bbd4969b 100644
--- a/drivers/regulator/tps65912-regulator.c
+++ b/drivers/regulator/tps65912-regulator.c
@@ -1,7 +1,7 @@
 /*
  * Regulator driver for TI TPS65912x PMICs
  *
- * Copyright (C) 2015 Texas Instruments Incorporated - http://www.ti.com/
+ * Copyright (C) 2015 Texas Instruments Incorporated - https://www.ti.com/
  *	Andrew F. Davis <afd@ti.com>
  *
  * This program is free software; you can redistribute it and/or
-- 
2.27.0

