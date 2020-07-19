Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D9B452253D4
	for <lists+linux-omap@lfdr.de>; Sun, 19 Jul 2020 21:57:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726093AbgGST4X (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sun, 19 Jul 2020 15:56:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54366 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726073AbgGST4X (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sun, 19 Jul 2020 15:56:23 -0400
Received: from smtp.al2klimov.de (smtp.al2klimov.de [IPv6:2a01:4f8:c0c:1465::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DD388C0619D2;
        Sun, 19 Jul 2020 12:56:22 -0700 (PDT)
Received: from authenticated-user (PRIMARY_HOSTNAME [PUBLIC_IP])
        by smtp.al2klimov.de (Postfix) with ESMTPA id BFD2BBC069;
        Sun, 19 Jul 2020 19:56:19 +0000 (UTC)
From:   "Alexander A. Klimov" <grandmaster@al2klimov.de>
To:     lee.jones@linaro.org, robh+dt@kernel.org, tony@atomide.com,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-omap@vger.kernel.org
Cc:     "Alexander A. Klimov" <grandmaster@al2klimov.de>
Subject: [PATCH for v5.9] mfd: Replace HTTP links with HTTPS ones
Date:   Sun, 19 Jul 2020 21:56:13 +0200
Message-Id: <20200719195613.61458-1-grandmaster@al2klimov.de>
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


 Documentation/devicetree/bindings/mfd/twl-family.txt | 2 +-
 drivers/mfd/hi6421-pmic-core.c                       | 2 +-
 drivers/mfd/lp873x.c                                 | 2 +-
 drivers/mfd/lp87565.c                                | 2 +-
 drivers/mfd/omap-usb-host.c                          | 2 +-
 drivers/mfd/omap-usb-tll.c                           | 2 +-
 drivers/mfd/smsc-ece1099.c                           | 2 +-
 drivers/mfd/ti_am335x_tscadc.c                       | 2 +-
 drivers/mfd/tps65086.c                               | 2 +-
 drivers/mfd/tps65217.c                               | 2 +-
 drivers/mfd/tps65218.c                               | 2 +-
 drivers/mfd/tps65912-core.c                          | 2 +-
 drivers/mfd/tps65912-i2c.c                           | 2 +-
 drivers/mfd/tps65912-spi.c                           | 2 +-
 include/linux/mfd/hi6421-pmic.h                      | 2 +-
 include/linux/mfd/lp873x.h                           | 2 +-
 include/linux/mfd/lp87565.h                          | 2 +-
 include/linux/mfd/ti_am335x_tscadc.h                 | 2 +-
 include/linux/mfd/tps65086.h                         | 2 +-
 include/linux/mfd/tps65217.h                         | 2 +-
 include/linux/mfd/tps65218.h                         | 2 +-
 include/linux/mfd/tps65912.h                         | 2 +-
 22 files changed, 22 insertions(+), 22 deletions(-)

diff --git a/Documentation/devicetree/bindings/mfd/twl-family.txt b/Documentation/devicetree/bindings/mfd/twl-family.txt
index 56f244b5d8a4..c2f9302965de 100644
--- a/Documentation/devicetree/bindings/mfd/twl-family.txt
+++ b/Documentation/devicetree/bindings/mfd/twl-family.txt
@@ -26,7 +26,7 @@ Optional node:
 Example:
 /*
  * Integrated Power Management Chip
- * http://www.ti.com/lit/ds/symlink/twl6030.pdf
+ * https://www.ti.com/lit/ds/symlink/twl6030.pdf
  */
 twl@48 {
     compatible = "ti,twl6030";
diff --git a/drivers/mfd/hi6421-pmic-core.c b/drivers/mfd/hi6421-pmic-core.c
index edfc172b8607..eba88b80d969 100644
--- a/drivers/mfd/hi6421-pmic-core.c
+++ b/drivers/mfd/hi6421-pmic-core.c
@@ -5,7 +5,7 @@
  * Copyright (c) <2011-2014> HiSilicon Technologies Co., Ltd.
  *              http://www.hisilicon.com
  * Copyright (c) <2013-2017> Linaro Ltd.
- *              http://www.linaro.org
+ *              https://www.linaro.org
  *
  * Author: Guodong Xu <guodong.xu@linaro.org>
  */
diff --git a/drivers/mfd/lp873x.c b/drivers/mfd/lp873x.c
index 873c608e6a5d..858c9e0a49a4 100644
--- a/drivers/mfd/lp873x.c
+++ b/drivers/mfd/lp873x.c
@@ -1,5 +1,5 @@
 /*
- * Copyright (C) 2016 Texas Instruments Incorporated - http://www.ti.com/
+ * Copyright (C) 2016 Texas Instruments Incorporated - https://www.ti.com/
  *
  * Author: Keerthy <j-keerthy@ti.com>
  *
diff --git a/drivers/mfd/lp87565.c b/drivers/mfd/lp87565.c
index 4a5c8ade4ae0..2268be9113f1 100644
--- a/drivers/mfd/lp87565.c
+++ b/drivers/mfd/lp87565.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
- * Copyright (C) 2017 Texas Instruments Incorporated - http://www.ti.com/
+ * Copyright (C) 2017 Texas Instruments Incorporated - https://www.ti.com/
  *
  * Author: Keerthy <j-keerthy@ti.com>
  */
diff --git a/drivers/mfd/omap-usb-host.c b/drivers/mfd/omap-usb-host.c
index 1f4f01b02d98..26c8b928307f 100644
--- a/drivers/mfd/omap-usb-host.c
+++ b/drivers/mfd/omap-usb-host.c
@@ -2,7 +2,7 @@
 /**
  * omap-usb-host.c - The USBHS core driver for OMAP EHCI & OHCI
  *
- * Copyright (C) 2011-2013 Texas Instruments Incorporated - http://www.ti.com
+ * Copyright (C) 2011-2013 Texas Instruments Incorporated - https://www.ti.com
  * Author: Keshava Munegowda <keshava_mgowda@ti.com>
  * Author: Roger Quadros <rogerq@ti.com>
  */
diff --git a/drivers/mfd/omap-usb-tll.c b/drivers/mfd/omap-usb-tll.c
index 4b7f73c317e8..a2db4ee3a244 100644
--- a/drivers/mfd/omap-usb-tll.c
+++ b/drivers/mfd/omap-usb-tll.c
@@ -2,7 +2,7 @@
 /**
  * omap-usb-tll.c - The USB TLL driver for OMAP EHCI & OHCI
  *
- * Copyright (C) 2012-2013 Texas Instruments Incorporated - http://www.ti.com
+ * Copyright (C) 2012-2013 Texas Instruments Incorporated - https://www.ti.com
  * Author: Keshava Munegowda <keshava_mgowda@ti.com>
  * Author: Roger Quadros <rogerq@ti.com>
  */
diff --git a/drivers/mfd/smsc-ece1099.c b/drivers/mfd/smsc-ece1099.c
index 57b792eb58fd..387898447789 100644
--- a/drivers/mfd/smsc-ece1099.c
+++ b/drivers/mfd/smsc-ece1099.c
@@ -1,7 +1,7 @@
 /*
  * TI SMSC MFD Driver
  *
- * Copyright (C) 2012 Texas Instruments Incorporated - http://www.ti.com
+ * Copyright (C) 2012 Texas Instruments Incorporated - https://www.ti.com
  *
  * Author: Sourav Poddar <sourav.poddar@ti.com>
  *
diff --git a/drivers/mfd/ti_am335x_tscadc.c b/drivers/mfd/ti_am335x_tscadc.c
index 926c289cb040..0e6e25308190 100644
--- a/drivers/mfd/ti_am335x_tscadc.c
+++ b/drivers/mfd/ti_am335x_tscadc.c
@@ -1,7 +1,7 @@
 /*
  * TI Touch Screen / ADC MFD driver
  *
- * Copyright (C) 2012 Texas Instruments Incorporated - http://www.ti.com/
+ * Copyright (C) 2012 Texas Instruments Incorporated - https://www.ti.com/
  *
  * This program is free software; you can redistribute it and/or
  * modify it under the terms of the GNU General Public License as
diff --git a/drivers/mfd/tps65086.c b/drivers/mfd/tps65086.c
index 43119a6867fe..341466ef20cc 100644
--- a/drivers/mfd/tps65086.c
+++ b/drivers/mfd/tps65086.c
@@ -1,5 +1,5 @@
 /*
- * Copyright (C) 2015 Texas Instruments Incorporated - http://www.ti.com/
+ * Copyright (C) 2015 Texas Instruments Incorporated - https://www.ti.com/
  *	Andrew F. Davis <afd@ti.com>
  *
  * This program is free software; you can redistribute it and/or
diff --git a/drivers/mfd/tps65217.c b/drivers/mfd/tps65217.c
index 7566ce4457a0..42bcdf040614 100644
--- a/drivers/mfd/tps65217.c
+++ b/drivers/mfd/tps65217.c
@@ -3,7 +3,7 @@
  *
  * TPS65217 chip family multi-function driver
  *
- * Copyright (C) 2011 Texas Instruments Incorporated - http://www.ti.com/
+ * Copyright (C) 2011 Texas Instruments Incorporated - https://www.ti.com/
  *
  * This program is free software; you can redistribute it and/or
  * modify it under the terms of the GNU General Public License as
diff --git a/drivers/mfd/tps65218.c b/drivers/mfd/tps65218.c
index a62ea4cb8be7..eb6e7ad8b648 100644
--- a/drivers/mfd/tps65218.c
+++ b/drivers/mfd/tps65218.c
@@ -1,7 +1,7 @@
 /*
  * Driver for TPS65218 Integrated power management chipsets
  *
- * Copyright (C) 2014 Texas Instruments Incorporated - http://www.ti.com/
+ * Copyright (C) 2014 Texas Instruments Incorporated - https://www.ti.com/
  *
  * This program is free software; you can redistribute it and/or
  * modify it under the terms of the GNU General Public License version 2 as
diff --git a/drivers/mfd/tps65912-core.c b/drivers/mfd/tps65912-core.c
index f33567bc428d..b55b1d5d6955 100644
--- a/drivers/mfd/tps65912-core.c
+++ b/drivers/mfd/tps65912-core.c
@@ -1,7 +1,7 @@
 /*
  * Core functions for TI TPS65912x PMICs
  *
- * Copyright (C) 2015 Texas Instruments Incorporated - http://www.ti.com/
+ * Copyright (C) 2015 Texas Instruments Incorporated - https://www.ti.com/
  *	Andrew F. Davis <afd@ti.com>
  *
  * This program is free software; you can redistribute it and/or
diff --git a/drivers/mfd/tps65912-i2c.c b/drivers/mfd/tps65912-i2c.c
index 785d19f6f7c9..f7c22ea7b36c 100644
--- a/drivers/mfd/tps65912-i2c.c
+++ b/drivers/mfd/tps65912-i2c.c
@@ -1,7 +1,7 @@
 /*
  * I2C access driver for TI TPS65912x PMICs
  *
- * Copyright (C) 2015 Texas Instruments Incorporated - http://www.ti.com/
+ * Copyright (C) 2015 Texas Instruments Incorporated - https://www.ti.com/
  *	Andrew F. Davis <afd@ti.com>
  *
  * This program is free software; you can redistribute it and/or
diff --git a/drivers/mfd/tps65912-spi.c b/drivers/mfd/tps65912-spi.c
index f78be039e463..21a8d6ac5c4a 100644
--- a/drivers/mfd/tps65912-spi.c
+++ b/drivers/mfd/tps65912-spi.c
@@ -1,7 +1,7 @@
 /*
  * SPI access driver for TI TPS65912x PMICs
  *
- * Copyright (C) 2015 Texas Instruments Incorporated - http://www.ti.com/
+ * Copyright (C) 2015 Texas Instruments Incorporated - https://www.ti.com/
  *	Andrew F. Davis <afd@ti.com>
  *
  * This program is free software; you can redistribute it and/or
diff --git a/include/linux/mfd/hi6421-pmic.h b/include/linux/mfd/hi6421-pmic.h
index bbc64484c021..2cadf8897c64 100644
--- a/include/linux/mfd/hi6421-pmic.h
+++ b/include/linux/mfd/hi6421-pmic.h
@@ -5,7 +5,7 @@
  * Copyright (c) <2011-2014> HiSilicon Technologies Co., Ltd.
  *              http://www.hisilicon.com
  * Copyright (c) <2013-2014> Linaro Ltd.
- *              http://www.linaro.org
+ *              https://www.linaro.org
  *
  * Author: Guodong Xu <guodong.xu@linaro.org>
  */
diff --git a/include/linux/mfd/lp873x.h b/include/linux/mfd/lp873x.h
index edbec8350a49..5546688c7da7 100644
--- a/include/linux/mfd/lp873x.h
+++ b/include/linux/mfd/lp873x.h
@@ -1,7 +1,7 @@
 /*
  * Functions to access LP873X power management chip.
  *
- * Copyright (C) 2016 Texas Instruments Incorporated - http://www.ti.com/
+ * Copyright (C) 2016 Texas Instruments Incorporated - https://www.ti.com/
  *
  * This program is free software; you can redistribute it and/or
  * modify it under the terms of the GNU General Public License as
diff --git a/include/linux/mfd/lp87565.h b/include/linux/mfd/lp87565.h
index ce965354bbad..43716aca46fa 100644
--- a/include/linux/mfd/lp87565.h
+++ b/include/linux/mfd/lp87565.h
@@ -2,7 +2,7 @@
 /*
  * Functions to access LP87565 power management chip.
  *
- * Copyright (C) 2017 Texas Instruments Incorporated - http://www.ti.com/
+ * Copyright (C) 2017 Texas Instruments Incorporated - https://www.ti.com/
  */
 
 #ifndef __LINUX_MFD_LP87565_H
diff --git a/include/linux/mfd/ti_am335x_tscadc.h b/include/linux/mfd/ti_am335x_tscadc.h
index 483168403ae5..ffc091b77633 100644
--- a/include/linux/mfd/ti_am335x_tscadc.h
+++ b/include/linux/mfd/ti_am335x_tscadc.h
@@ -4,7 +4,7 @@
 /*
  * TI Touch Screen / ADC MFD driver
  *
- * Copyright (C) 2012 Texas Instruments Incorporated - http://www.ti.com/
+ * Copyright (C) 2012 Texas Instruments Incorporated - https://www.ti.com/
  *
  * This program is free software; you can redistribute it and/or
  * modify it under the terms of the GNU General Public License as
diff --git a/include/linux/mfd/tps65086.h b/include/linux/mfd/tps65086.h
index a228ae4c88d9..e0a417e53766 100644
--- a/include/linux/mfd/tps65086.h
+++ b/include/linux/mfd/tps65086.h
@@ -1,5 +1,5 @@
 /*
- * Copyright (C) 2015 Texas Instruments Incorporated - http://www.ti.com/
+ * Copyright (C) 2015 Texas Instruments Incorporated - https://www.ti.com/
  *	Andrew F. Davis <afd@ti.com>
  *
  * This program is free software; you can redistribute it and/or
diff --git a/include/linux/mfd/tps65217.h b/include/linux/mfd/tps65217.h
index b5dd108421c8..db7091824ed0 100644
--- a/include/linux/mfd/tps65217.h
+++ b/include/linux/mfd/tps65217.h
@@ -3,7 +3,7 @@
  *
  * Functions to access TPS65217 power management chip.
  *
- * Copyright (C) 2011 Texas Instruments Incorporated - http://www.ti.com/
+ * Copyright (C) 2011 Texas Instruments Incorporated - https://www.ti.com/
  *
  * This program is free software; you can redistribute it and/or
  * modify it under the terms of the GNU General Public License as
diff --git a/include/linux/mfd/tps65218.h b/include/linux/mfd/tps65218.h
index b0470c35162d..f4ca367e3473 100644
--- a/include/linux/mfd/tps65218.h
+++ b/include/linux/mfd/tps65218.h
@@ -3,7 +3,7 @@
  *
  * Functions to access TPS65219 power management chip.
  *
- * Copyright (C) 2014 Texas Instruments Incorporated - http://www.ti.com/
+ * Copyright (C) 2014 Texas Instruments Incorporated - https://www.ti.com/
  *
  * This program is free software; you can redistribute it and/or
  * modify it under the terms of the GNU General Public License version 2 as
diff --git a/include/linux/mfd/tps65912.h b/include/linux/mfd/tps65912.h
index b25d0297ba88..7943e413deae 100644
--- a/include/linux/mfd/tps65912.h
+++ b/include/linux/mfd/tps65912.h
@@ -1,5 +1,5 @@
 /*
- * Copyright (C) 2015 Texas Instruments Incorporated - http://www.ti.com/
+ * Copyright (C) 2015 Texas Instruments Incorporated - https://www.ti.com/
  *	Andrew F. Davis <afd@ti.com>
  *
  * This program is free software; you can redistribute it and/or
-- 
2.27.0

