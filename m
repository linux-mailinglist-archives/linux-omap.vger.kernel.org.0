Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8F98886C6D
	for <lists+linux-omap@lfdr.de>; Thu,  8 Aug 2019 23:31:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733295AbfHHVbR (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 8 Aug 2019 17:31:17 -0400
Received: from mout.kundenserver.de ([212.227.126.130]:42593 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728020AbfHHVbR (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 8 Aug 2019 17:31:17 -0400
Received: from threadripper.lan ([149.172.19.189]) by mrelayeu.kundenserver.de
 (mreue012 [212.227.15.129]) with ESMTPA (Nemesis) id
 1MRVy9-1hhrWF2GCz-00NOKO; Thu, 08 Aug 2019 23:30:54 +0200
From:   Arnd Bergmann <arnd@arndb.de>
To:     Tony Lindgren <tony@atomide.com>,
        Aaro Koskinen <aaro.koskinen@iki.fi>,
        Lee Jones <lee.jones@linaro.org>,
        Daniel Thompson <daniel.thompson@linaro.org>,
        Jingoo Han <jingoohan1@gmail.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Cc:     linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Arnd Bergmann <arnd@arndb.de>, dri-devel@lists.freedesktop.org,
        linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 09/22] fbdev: omap: avoid using mach/*.h files
Date:   Thu,  8 Aug 2019 23:22:18 +0200
Message-Id: <20190808212234.2213262-10-arnd@arndb.de>
X-Mailer: git-send-email 2.20.0
In-Reply-To: <20190808212234.2213262-1-arnd@arndb.de>
References: <20190808212234.2213262-1-arnd@arndb.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:88szA/Fo8mKxxZtSI6a/3DryoEp3R0RLjKS0a4qc6cmQ6XF/WLN
 W6t9LZZrLHyweQaVq4It4vpP6q85bngaTLNjJhSu5Zs2FGsc54mk16/FUff6KabydJOjjCe
 gSmfFkLusQj3C1K+t2nV3Wqk3CMDq1pgtV+FfUcRXuvH8yvWc3/+WkYXaDaoJQ/KokIL5Gr
 xffTou6CcBEBFvrAC7+Ag==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:6N8ZFBB2B8Y=:wwhyQ2dKFdjd+6txhxm6GB
 r5EWrXStpxQkas/tMQjlyNgIuWpDTVEGNewKIx4571rKYanefuhEZP0pD3j2pjFRdNzg5UgW+
 IW7CzqHLPdUm85HJLglUX7OqEOcVEbgGAI1kCxHvXS1uOvbmi7D2v1c7w/yFoBi+vwWVS8LMC
 aDov4Mh+N2gS8ZThs48vRk+9QD7cxwEEL8X/KY9uzByDaCWMzl/TCZ3Jh6fDzEz8gLit7wkEv
 4JZLpB3hartGRTwG+xBsKnN88mk4uf/CDeVnuk7PPbUHKr24BUHqNIqEZL5xsH6QHc5aAR7Hz
 gRGxaUH6+xvfrWQsKR+4BVWyHEWi3DK7jRLdTDHoA9G0e9QOSV2qwxXqDKyLbuYsjUKFLnRLR
 HnxedBZ1eZoQXa7u0JGSC3gTvrZODSrSNLszP37JOJu5YYZ2Xk3Z/89TeOGvfjXQHd+pY3I+a
 qgQxEoY3gquwky6+fW1cac+0CMNSLt0rLsz4B/FSaOPcpddCWCFi7g56CFoGYRWStLTdMI3ku
 VsedmQ+8yonko1eXRZbay8pU8N/GF4B7zrZKut9GQYn0tU3zh3gak2KJPmQQ3rxDT2ay263OF
 GKprQYzYiToguAEYLSmF0fj+PvLCyShLqvTE0X9bwMYJ74sQrNCo7ua2Qs9aDs+Lb4jZ8A34Q
 g6EE4OlJUTq14Pq3PRMnoKSvhNov8EeS6ihQ6jSwX2ds7twSs2Uvp3NvVraWllP7kdtbLG4ZL
 CY7+25N0BR2fUkAk9y/nUxS35Oa1K3St34qBFQ==
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

All the headers we actually need are now in include/linux/soc,
so use those versions instead and allow compile-testing on
other architectures.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/video/backlight/Kconfig          | 4 ++--
 drivers/video/backlight/omap1_bl.c       | 4 ++--
 drivers/video/fbdev/omap/Kconfig         | 4 ++--
 drivers/video/fbdev/omap/lcd_ams_delta.c | 2 +-
 drivers/video/fbdev/omap/lcd_dma.c       | 3 ++-
 drivers/video/fbdev/omap/lcd_inn1510.c   | 2 +-
 drivers/video/fbdev/omap/lcd_osk.c       | 4 ++--
 drivers/video/fbdev/omap/lcdc.c          | 2 ++
 drivers/video/fbdev/omap/omapfb_main.c   | 3 +--
 drivers/video/fbdev/omap/sossi.c         | 1 +
 10 files changed, 16 insertions(+), 13 deletions(-)

diff --git a/drivers/video/backlight/Kconfig b/drivers/video/backlight/Kconfig
index 8b081d61773e..195c71130827 100644
--- a/drivers/video/backlight/Kconfig
+++ b/drivers/video/backlight/Kconfig
@@ -213,8 +213,8 @@ config BACKLIGHT_LOCOMO
 
 config BACKLIGHT_OMAP1
 	tristate "OMAP1 PWL-based LCD Backlight"
-	depends on ARCH_OMAP1
-	default y
+	depends on ARCH_OMAP1 || COMPILE_TEST
+	default ARCH_OMAP1
 	help
 	  This driver controls the LCD backlight level and power for
 	  the PWL module of OMAP1 processors.  Say Y if your board
diff --git a/drivers/video/backlight/omap1_bl.c b/drivers/video/backlight/omap1_bl.c
index 74263021b1b3..69a49384b3de 100644
--- a/drivers/video/backlight/omap1_bl.c
+++ b/drivers/video/backlight/omap1_bl.c
@@ -14,8 +14,8 @@
 #include <linux/slab.h>
 #include <linux/platform_data/omap1_bl.h>
 
-#include <mach/hardware.h>
-#include <mach/mux.h>
+#include <linux/soc/ti/omap1-io.h>
+#include <linux/soc/ti/omap1-mux.h>
 
 #define OMAPBL_MAX_INTENSITY		0xff
 
diff --git a/drivers/video/fbdev/omap/Kconfig b/drivers/video/fbdev/omap/Kconfig
index df2a5d0d4aa2..b1786cf1b486 100644
--- a/drivers/video/fbdev/omap/Kconfig
+++ b/drivers/video/fbdev/omap/Kconfig
@@ -2,7 +2,7 @@
 config FB_OMAP
 	tristate "OMAP frame buffer support"
 	depends on FB
-	depends on ARCH_OMAP1
+	depends on ARCH_OMAP1 || (ARM && COMPILE_TEST)
 	select FB_CFB_FILLRECT
 	select FB_CFB_COPYAREA
 	select FB_CFB_IMAGEBLIT
@@ -42,7 +42,7 @@ config FB_OMAP_LCD_MIPID
 
 config FB_OMAP_LCD_H3
 	bool "TPS65010 LCD controller on OMAP-H3"
-	depends on MACH_OMAP_H3
+	depends on MACH_OMAP_H3 || COMPILE_TEST
 	depends on TPS65010=y
 	default y
 	help
diff --git a/drivers/video/fbdev/omap/lcd_ams_delta.c b/drivers/video/fbdev/omap/lcd_ams_delta.c
index 8e54aae544a0..da2e32615abe 100644
--- a/drivers/video/fbdev/omap/lcd_ams_delta.c
+++ b/drivers/video/fbdev/omap/lcd_ams_delta.c
@@ -14,7 +14,7 @@
 #include <linux/gpio/consumer.h>
 #include <linux/lcd.h>
 
-#include <mach/hardware.h>
+#include <linux/soc/ti/omap1-io.h>
 
 #include "omapfb.h"
 
diff --git a/drivers/video/fbdev/omap/lcd_dma.c b/drivers/video/fbdev/omap/lcd_dma.c
index 867a63c06f42..f85817635a8c 100644
--- a/drivers/video/fbdev/omap/lcd_dma.c
+++ b/drivers/video/fbdev/omap/lcd_dma.c
@@ -25,7 +25,8 @@
 
 #include <linux/omap-dma.h>
 
-#include <mach/hardware.h>
+#include <linux/soc/ti/omap1-soc.h>
+#include <linux/soc/ti/omap1-io.h>
 
 #include "lcdc.h"
 #include "lcd_dma.h"
diff --git a/drivers/video/fbdev/omap/lcd_inn1510.c b/drivers/video/fbdev/omap/lcd_inn1510.c
index 37ed0c14aa5a..bb915637e9b6 100644
--- a/drivers/video/fbdev/omap/lcd_inn1510.c
+++ b/drivers/video/fbdev/omap/lcd_inn1510.c
@@ -10,7 +10,7 @@
 #include <linux/platform_device.h>
 #include <linux/io.h>
 
-#include <mach/hardware.h>
+#include <linux/soc/ti/omap1-soc.h>
 
 #include "omapfb.h"
 
diff --git a/drivers/video/fbdev/omap/lcd_osk.c b/drivers/video/fbdev/omap/lcd_osk.c
index 5d5762128c8d..8168ba0d47fd 100644
--- a/drivers/video/fbdev/omap/lcd_osk.c
+++ b/drivers/video/fbdev/omap/lcd_osk.c
@@ -11,8 +11,8 @@
 #include <linux/platform_device.h>
 #include <linux/gpio.h>
 
-#include <mach/hardware.h>
-#include <mach/mux.h>
+#include <linux/soc/ti/omap1-io.h>
+#include <linux/soc/ti/omap1-mux.h>
 
 #include "omapfb.h"
 
diff --git a/drivers/video/fbdev/omap/lcdc.c b/drivers/video/fbdev/omap/lcdc.c
index 65953b7fbdb9..3af758f12afd 100644
--- a/drivers/video/fbdev/omap/lcdc.c
+++ b/drivers/video/fbdev/omap/lcdc.c
@@ -17,6 +17,8 @@
 #include <linux/clk.h>
 #include <linux/gfp.h>
 
+#include <linux/soc/ti/omap1-io.h>
+#include <linux/soc/ti/omap1-soc.h>
 #include <linux/omap-dma.h>
 
 #include <asm/mach-types.h>
diff --git a/drivers/video/fbdev/omap/omapfb_main.c b/drivers/video/fbdev/omap/omapfb_main.c
index dc06057de91d..af73a3f9ac53 100644
--- a/drivers/video/fbdev/omap/omapfb_main.c
+++ b/drivers/video/fbdev/omap/omapfb_main.c
@@ -19,8 +19,7 @@
 
 #include <linux/omap-dma.h>
 
-#include <mach/hardware.h>
-
+#include <linux/soc/ti/omap1-soc.h>
 #include "omapfb.h"
 #include "lcdc.h"
 
diff --git a/drivers/video/fbdev/omap/sossi.c b/drivers/video/fbdev/omap/sossi.c
index ade9d452254c..6b99d89fbe6e 100644
--- a/drivers/video/fbdev/omap/sossi.c
+++ b/drivers/video/fbdev/omap/sossi.c
@@ -13,6 +13,7 @@
 #include <linux/interrupt.h>
 
 #include <linux/omap-dma.h>
+#include <linux/soc/ti/omap1-io.h>
 
 #include "omapfb.h"
 #include "lcd_dma.h"
-- 
2.20.0

