Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9F9AA86C47
	for <lists+linux-omap@lfdr.de>; Thu,  8 Aug 2019 23:25:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390219AbfHHVZJ (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 8 Aug 2019 17:25:09 -0400
Received: from mout.kundenserver.de ([212.227.126.131]:58877 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732327AbfHHVZJ (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 8 Aug 2019 17:25:09 -0400
Received: from threadripper.lan ([149.172.19.189]) by mrelayeu.kundenserver.de
 (mreue012 [212.227.15.129]) with ESMTPA (Nemesis) id
 1MJWgK-1hc7Bs1j2W-00JoM1; Thu, 08 Aug 2019 23:24:36 +0200
From:   Arnd Bergmann <arnd@arndb.de>
To:     Tony Lindgren <tony@atomide.com>,
        Aaro Koskinen <aaro.koskinen@iki.fi>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Cc:     linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org
Subject: [PATCH 02/22] ARM: omap1: make omapfb standalone compilable
Date:   Thu,  8 Aug 2019 23:22:11 +0200
Message-Id: <20190808212234.2213262-3-arnd@arndb.de>
X-Mailer: git-send-email 2.20.0
In-Reply-To: <20190808212234.2213262-1-arnd@arndb.de>
References: <20190808212234.2213262-1-arnd@arndb.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:11i56NfFlknfNnC84C5yQ9TME7FVsp8Y+DmrbBUbFNY0KYTjh7r
 qwXQfS1rxSZwzWV3GXq9HyioqLR6Y1NlbXTchmgozHhdIZX4fFbNmboEj7Md18xoSkmgaYS
 SnLPl1CdxRR/02K7+wQDfEoWCS0ny+uZj3ooZAvr5jQUWyV0XTddIYfFZKZgoqHpGTjEEIN
 Zv4bEIHCYk5aFgjgrwCQw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:Kp3KkkDmuLo=:x2OyPkvc2DT2eWNV3abo+4
 QJheF9GV8zXOrQbgMx2NBCwhlRbWwsylsLof8719DmVPRyBUB1SItpBw7lp3FVm6aCGikCALt
 FEMEktzLxyj108G89zZZSTqbV59taLq35kkM8sWcuEJO9UYoP7y5UBb/J7rQHqFWW0Ql00k1B
 FR0gAKj90PIoghnm+MK0Xpfdhweh3oyVEUzSNP6iE4emJC5k/+ZUQADbOhZEuQQ3cdNMJEUi+
 8uXnr2BKOJcpzx6Ce537od9N7bLbYTkzBdNfkYM6jat1b4ru8cJQ5UtvxDO1bkCFMylr3roUW
 t4T6T/dCJzGnrZGq8BUC/7TA44/egNfgAdGvHAFFQSG376E+4cYzWTSlp5bXwRFncL7CB0gjd
 /9WrcovCYjoVK4nDObWDLLKh3xtuM4uNgSmKu1ErYItY3ax2inc7bjrId7u8OxQJGFPqa8VH6
 Hv2zmS4x3sLBT5xdxX8danIJeguENiFybA4pSQRbcUraem1KmpPw1e11PsdT7XtM4QKNfZ1AE
 dwbhblwCysaFAvPgKf7nk3vvs6mTp7/jRPavBV92K8VoxSMmA4Y39xaQ4YtbkraTcjjqXcQ/y
 tbs67iLZEazULgIeIBsVDMQ4qbprvDf7kB4crhhn4h/HAaBzRvIa3a3EBoPdDNcjrWUsZC6XX
 vEhThDfJWoa56a/5bGZUBPTijQGCQc+BIiL5K0PLLE+RZ/COGBmT14I4tWT1DlfWQJIYJvFvq
 m9DnjwZrX6GOvIfJSX113bDsaW6PymUjzOI3VQ==
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

The omapfb driver is split into platform specific code for omap1, and
driver code that is also specific to omap1.

Moving both parts into the driver directory simplifies the structure
and avoids the dependency on certain omap machine header files.

The interrupt numbers in particular however must not be referenced
directly from the driver to allow building in a multiplatform
configuration, so these have to be passed through resources, is
done for all other omap drivers.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/arm/mach-omap1/Makefile                  |  4 --
 arch/arm/mach-omap1/fb.c                      | 19 +++++++-
 arch/arm/mach-omap1/include/mach/lcdc.h       | 44 -------------------
 drivers/video/fbdev/Makefile                  |  2 +-
 drivers/video/fbdev/omap/Makefile             |  5 +++
 .../video/fbdev/omap}/lcd_dma.c               |  4 +-
 .../video/fbdev/omap}/lcd_dma.h               |  2 -
 drivers/video/fbdev/omap/lcdc.c               |  8 ++--
 drivers/video/fbdev/omap/lcdc.h               | 35 +++++++++++++++
 drivers/video/fbdev/omap/omapfb.h             |  2 +
 drivers/video/fbdev/omap/omapfb_main.c        | 16 ++++++-
 drivers/video/fbdev/omap/sossi.c              |  3 +-
 include/linux/omap-dma.h                      |  7 ++-
 13 files changed, 90 insertions(+), 61 deletions(-)
 delete mode 100644 arch/arm/mach-omap1/include/mach/lcdc.h
 rename {arch/arm/mach-omap1 => drivers/video/fbdev/omap}/lcd_dma.c (99%)
 rename {arch/arm/mach-omap1/include/mach => drivers/video/fbdev/omap}/lcd_dma.h (98%)

diff --git a/arch/arm/mach-omap1/Makefile b/arch/arm/mach-omap1/Makefile
index c757a52d0801..450bbf552b57 100644
--- a/arch/arm/mach-omap1/Makefile
+++ b/arch/arm/mach-omap1/Makefile
@@ -57,7 +57,3 @@ obj-$(CONFIG_ARCH_OMAP730)		+= gpio7xx.o
 obj-$(CONFIG_ARCH_OMAP850)		+= gpio7xx.o
 obj-$(CONFIG_ARCH_OMAP15XX)		+= gpio15xx.o
 obj-$(CONFIG_ARCH_OMAP16XX)		+= gpio16xx.o
-
-ifneq ($(CONFIG_FB_OMAP),)
-obj-y += lcd_dma.o
-endif
diff --git a/arch/arm/mach-omap1/fb.c b/arch/arm/mach-omap1/fb.c
index 0e32a959f254..b093375afc27 100644
--- a/arch/arm/mach-omap1/fb.c
+++ b/arch/arm/mach-omap1/fb.c
@@ -17,9 +17,12 @@
 #include <linux/io.h>
 #include <linux/omapfb.h>
 #include <linux/dma-mapping.h>
+#include <linux/irq.h>
 
 #include <asm/mach/map.h>
 
+#include <mach/irqs.h>
+
 #if IS_ENABLED(CONFIG_FB_OMAP)
 
 static bool omapfb_lcd_configured;
@@ -27,6 +30,19 @@ static struct omapfb_platform_data omapfb_config;
 
 static u64 omap_fb_dma_mask = ~(u32)0;
 
+struct resource omap_fb_resources[] = {
+	{
+		.name  = "irq",
+		.start = INT_LCD_CTRL,
+		.flags = IORESOURCE_IRQ,
+	},
+	{
+		.name  = "irq",
+		.start = INT_SOSSI_MATCH,
+		.flags = IORESOURCE_IRQ,
+	},
+};
+
 static struct platform_device omap_fb_device = {
 	.name		= "omapfb",
 	.id		= -1,
@@ -35,7 +51,8 @@ static struct platform_device omap_fb_device = {
 		.coherent_dma_mask	= DMA_BIT_MASK(32),
 		.platform_data		= &omapfb_config,
 	},
-	.num_resources = 0,
+	.num_resources = ARRAY_SIZE(omap_fb_resources),
+	.resource = omap_fb_resources,
 };
 
 void __init omapfb_set_lcd_config(const struct omap_lcd_config *config)
diff --git a/arch/arm/mach-omap1/include/mach/lcdc.h b/arch/arm/mach-omap1/include/mach/lcdc.h
deleted file mode 100644
index 7152db1f5361..000000000000
--- a/arch/arm/mach-omap1/include/mach/lcdc.h
+++ /dev/null
@@ -1,44 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-or-later */
-/*
- * arch/arm/mach-omap1/include/mach/lcdc.h
- *
- * Extracted from drivers/video/omap/lcdc.c
- * Copyright (C) 2004 Nokia Corporation
- * Author: Imre Deak <imre.deak@nokia.com>
- */
-#ifndef __MACH_LCDC_H__
-#define __MACH_LCDC_H__
-
-#define OMAP_LCDC_BASE			0xfffec000
-#define OMAP_LCDC_SIZE			256
-#define OMAP_LCDC_IRQ			INT_LCD_CTRL
-
-#define OMAP_LCDC_CONTROL		(OMAP_LCDC_BASE + 0x00)
-#define OMAP_LCDC_TIMING0		(OMAP_LCDC_BASE + 0x04)
-#define OMAP_LCDC_TIMING1		(OMAP_LCDC_BASE + 0x08)
-#define OMAP_LCDC_TIMING2		(OMAP_LCDC_BASE + 0x0c)
-#define OMAP_LCDC_STATUS		(OMAP_LCDC_BASE + 0x10)
-#define OMAP_LCDC_SUBPANEL		(OMAP_LCDC_BASE + 0x14)
-#define OMAP_LCDC_LINE_INT		(OMAP_LCDC_BASE + 0x18)
-#define OMAP_LCDC_DISPLAY_STATUS	(OMAP_LCDC_BASE + 0x1c)
-
-#define OMAP_LCDC_STAT_DONE		(1 << 0)
-#define OMAP_LCDC_STAT_VSYNC		(1 << 1)
-#define OMAP_LCDC_STAT_SYNC_LOST	(1 << 2)
-#define OMAP_LCDC_STAT_ABC		(1 << 3)
-#define OMAP_LCDC_STAT_LINE_INT		(1 << 4)
-#define OMAP_LCDC_STAT_FUF		(1 << 5)
-#define OMAP_LCDC_STAT_LOADED_PALETTE	(1 << 6)
-
-#define OMAP_LCDC_CTRL_LCD_EN		(1 << 0)
-#define OMAP_LCDC_CTRL_LCD_TFT		(1 << 7)
-#define OMAP_LCDC_CTRL_LINE_IRQ_CLR_SEL	(1 << 10)
-
-#define OMAP_LCDC_IRQ_VSYNC		(1 << 2)
-#define OMAP_LCDC_IRQ_DONE		(1 << 3)
-#define OMAP_LCDC_IRQ_LOADED_PALETTE	(1 << 4)
-#define OMAP_LCDC_IRQ_LINE_NIRQ		(1 << 5)
-#define OMAP_LCDC_IRQ_LINE		(1 << 6)
-#define OMAP_LCDC_IRQ_MASK		(((1 << 5) - 1) << 2)
-
-#endif /* __MACH_LCDC_H__ */
diff --git a/drivers/video/fbdev/Makefile b/drivers/video/fbdev/Makefile
index aab7155884ea..3324301e4c36 100644
--- a/drivers/video/fbdev/Makefile
+++ b/drivers/video/fbdev/Makefile
@@ -111,7 +111,7 @@ obj-$(CONFIG_FB_UDL)		  += udlfb.o
 obj-$(CONFIG_FB_SMSCUFX)	  += smscufx.o
 obj-$(CONFIG_FB_XILINX)           += xilinxfb.o
 obj-$(CONFIG_FB_SH_MOBILE_LCDC)	  += sh_mobile_lcdcfb.o
-obj-$(CONFIG_FB_OMAP)             += omap/
+obj-y				  += omap/
 obj-y                             += omap2/
 obj-$(CONFIG_XEN_FBDEV_FRONTEND)  += xen-fbfront.o
 obj-$(CONFIG_FB_CARMINE)          += carminefb.o
diff --git a/drivers/video/fbdev/omap/Makefile b/drivers/video/fbdev/omap/Makefile
index daaa73a94e7f..b88e02f5cb1f 100644
--- a/drivers/video/fbdev/omap/Makefile
+++ b/drivers/video/fbdev/omap/Makefile
@@ -5,6 +5,11 @@
 
 obj-$(CONFIG_FB_OMAP) += omapfb.o
 
+ifdef CONFIG_FB_OMAP
+# must be built-in
+obj-y += lcd_dma.o
+endif
+
 objs-yy := omapfb_main.o lcdc.o
 
 objs-y$(CONFIG_FB_OMAP_LCDC_EXTERNAL) += sossi.o
diff --git a/arch/arm/mach-omap1/lcd_dma.c b/drivers/video/fbdev/omap/lcd_dma.c
similarity index 99%
rename from arch/arm/mach-omap1/lcd_dma.c
rename to drivers/video/fbdev/omap/lcd_dma.c
index a72ac0c02b4f..867a63c06f42 100644
--- a/arch/arm/mach-omap1/lcd_dma.c
+++ b/drivers/video/fbdev/omap/lcd_dma.c
@@ -26,7 +26,9 @@
 #include <linux/omap-dma.h>
 
 #include <mach/hardware.h>
-#include <mach/lcdc.h>
+
+#include "lcdc.h"
+#include "lcd_dma.h"
 
 int omap_lcd_dma_running(void)
 {
diff --git a/arch/arm/mach-omap1/include/mach/lcd_dma.h b/drivers/video/fbdev/omap/lcd_dma.h
similarity index 98%
rename from arch/arm/mach-omap1/include/mach/lcd_dma.h
rename to drivers/video/fbdev/omap/lcd_dma.h
index 1a3c0cf17899..1b4780197381 100644
--- a/arch/arm/mach-omap1/include/mach/lcd_dma.h
+++ b/drivers/video/fbdev/omap/lcd_dma.h
@@ -60,6 +60,4 @@ extern void omap_set_lcd_dma_b1_vxres(unsigned long vxres);
 extern void omap_set_lcd_dma_b1_mirror(int mirror);
 extern void omap_set_lcd_dma_b1_scale(unsigned int xscale, unsigned int yscale);
 
-extern int omap_lcd_dma_running(void);
-
 #endif /* __MACH_OMAP1_LCD_DMA_H__ */
diff --git a/drivers/video/fbdev/omap/lcdc.c b/drivers/video/fbdev/omap/lcdc.c
index fa73acfc1371..65953b7fbdb9 100644
--- a/drivers/video/fbdev/omap/lcdc.c
+++ b/drivers/video/fbdev/omap/lcdc.c
@@ -17,7 +17,6 @@
 #include <linux/clk.h>
 #include <linux/gfp.h>
 
-#include <mach/lcdc.h>
 #include <linux/omap-dma.h>
 
 #include <asm/mach-types.h>
@@ -25,6 +24,7 @@
 #include "omapfb.h"
 
 #include "lcdc.h"
+#include "lcd_dma.h"
 
 #define MODULE_NAME			"lcdc"
 
@@ -713,7 +713,7 @@ static int omap_lcdc_init(struct omapfb_device *fbdev, int ext_mode,
 	}
 	clk_enable(lcdc.lcd_ck);
 
-	r = request_irq(OMAP_LCDC_IRQ, lcdc_irq_handler, 0, MODULE_NAME, fbdev);
+	r = request_irq(fbdev->int_irq, lcdc_irq_handler, 0, MODULE_NAME, fbdev);
 	if (r) {
 		dev_err(fbdev->dev, "unable to get IRQ\n");
 		goto fail2;
@@ -744,7 +744,7 @@ static int omap_lcdc_init(struct omapfb_device *fbdev, int ext_mode,
 fail4:
 	omap_free_lcd_dma();
 fail3:
-	free_irq(OMAP_LCDC_IRQ, lcdc.fbdev);
+	free_irq(fbdev->int_irq, lcdc.fbdev);
 fail2:
 	clk_disable(lcdc.lcd_ck);
 fail1:
@@ -759,7 +759,7 @@ static void omap_lcdc_cleanup(void)
 		free_palette_ram();
 	free_fbmem();
 	omap_free_lcd_dma();
-	free_irq(OMAP_LCDC_IRQ, lcdc.fbdev);
+	free_irq(lcdc.fbdev->int_irq, lcdc.fbdev);
 	clk_disable(lcdc.lcd_ck);
 	clk_put(lcdc.lcd_ck);
 }
diff --git a/drivers/video/fbdev/omap/lcdc.h b/drivers/video/fbdev/omap/lcdc.h
index 8a7607d861c1..cbbfd9b9e949 100644
--- a/drivers/video/fbdev/omap/lcdc.h
+++ b/drivers/video/fbdev/omap/lcdc.h
@@ -1,6 +1,41 @@
 /* SPDX-License-Identifier: GPL-2.0 */
 #ifndef LCDC_H
 #define LCDC_H
+/*
+ * Copyright (C) 2004 Nokia Corporation
+ * Author: Imre Deak <imre.deak@nokia.com>
+ */
+#define OMAP_LCDC_BASE			0xfffec000
+#define OMAP_LCDC_SIZE			256
+#define OMAP_LCDC_IRQ			INT_LCD_CTRL
+
+#define OMAP_LCDC_CONTROL		(OMAP_LCDC_BASE + 0x00)
+#define OMAP_LCDC_TIMING0		(OMAP_LCDC_BASE + 0x04)
+#define OMAP_LCDC_TIMING1		(OMAP_LCDC_BASE + 0x08)
+#define OMAP_LCDC_TIMING2		(OMAP_LCDC_BASE + 0x0c)
+#define OMAP_LCDC_STATUS		(OMAP_LCDC_BASE + 0x10)
+#define OMAP_LCDC_SUBPANEL		(OMAP_LCDC_BASE + 0x14)
+#define OMAP_LCDC_LINE_INT		(OMAP_LCDC_BASE + 0x18)
+#define OMAP_LCDC_DISPLAY_STATUS	(OMAP_LCDC_BASE + 0x1c)
+
+#define OMAP_LCDC_STAT_DONE		(1 << 0)
+#define OMAP_LCDC_STAT_VSYNC		(1 << 1)
+#define OMAP_LCDC_STAT_SYNC_LOST	(1 << 2)
+#define OMAP_LCDC_STAT_ABC		(1 << 3)
+#define OMAP_LCDC_STAT_LINE_INT		(1 << 4)
+#define OMAP_LCDC_STAT_FUF		(1 << 5)
+#define OMAP_LCDC_STAT_LOADED_PALETTE	(1 << 6)
+
+#define OMAP_LCDC_CTRL_LCD_EN		(1 << 0)
+#define OMAP_LCDC_CTRL_LCD_TFT		(1 << 7)
+#define OMAP_LCDC_CTRL_LINE_IRQ_CLR_SEL	(1 << 10)
+
+#define OMAP_LCDC_IRQ_VSYNC		(1 << 2)
+#define OMAP_LCDC_IRQ_DONE		(1 << 3)
+#define OMAP_LCDC_IRQ_LOADED_PALETTE	(1 << 4)
+#define OMAP_LCDC_IRQ_LINE_NIRQ		(1 << 5)
+#define OMAP_LCDC_IRQ_LINE		(1 << 6)
+#define OMAP_LCDC_IRQ_MASK		(((1 << 5) - 1) << 2)
 
 int omap_lcdc_set_dma_callback(void (*callback)(void *data), void *data);
 void omap_lcdc_free_dma_callback(void);
diff --git a/drivers/video/fbdev/omap/omapfb.h b/drivers/video/fbdev/omap/omapfb.h
index d930152c289c..313a051fe7a4 100644
--- a/drivers/video/fbdev/omap/omapfb.h
+++ b/drivers/video/fbdev/omap/omapfb.h
@@ -204,6 +204,8 @@ struct omapfb_device {
 	struct lcd_panel	*panel;			/* LCD panel */
 	const struct lcd_ctrl	*ctrl;			/* LCD controller */
 	const struct lcd_ctrl	*int_ctrl;		/* internal LCD ctrl */
+	int			ext_irq;
+	int			int_irq;
 	struct lcd_ctrl_extif	*ext_if;		/* LCD ctrl external
 							   interface */
 	struct device		*dev;
diff --git a/drivers/video/fbdev/omap/omapfb_main.c b/drivers/video/fbdev/omap/omapfb_main.c
index 90eca64e3144..dc06057de91d 100644
--- a/drivers/video/fbdev/omap/omapfb_main.c
+++ b/drivers/video/fbdev/omap/omapfb_main.c
@@ -1618,7 +1618,7 @@ static int omapfb_do_probe(struct platform_device *pdev,
 
 	init_state = 0;
 
-	if (pdev->num_resources != 0) {
+	if (pdev->num_resources != 1) {
 		dev_err(&pdev->dev, "probed for an unknown device\n");
 		r = -ENODEV;
 		goto cleanup;
@@ -1637,6 +1637,20 @@ static int omapfb_do_probe(struct platform_device *pdev,
 		r = -ENOMEM;
 		goto cleanup;
 	}
+	fbdev->int_irq = platform_get_irq(pdev, 0);
+	if (!fbdev->int_irq) {
+		dev_err(&pdev->dev, "unable to get irq\n");
+		r = ENXIO;
+		goto cleanup;
+	}
+
+	fbdev->ext_irq = platform_get_irq(pdev, 1);
+	if (!fbdev->ext_irq) {
+		dev_err(&pdev->dev, "unable to get irq\n");
+		r = ENXIO;
+		goto cleanup;
+	}
+
 	init_state++;
 
 	fbdev->dev = &pdev->dev;
diff --git a/drivers/video/fbdev/omap/sossi.c b/drivers/video/fbdev/omap/sossi.c
index 80ac67f27f0d..ade9d452254c 100644
--- a/drivers/video/fbdev/omap/sossi.c
+++ b/drivers/video/fbdev/omap/sossi.c
@@ -15,6 +15,7 @@
 #include <linux/omap-dma.h>
 
 #include "omapfb.h"
+#include "lcd_dma.h"
 #include "lcdc.h"
 
 #define MODULE_NAME		"omapfb-sossi"
@@ -638,7 +639,7 @@ static int sossi_init(struct omapfb_device *fbdev)
 	l &= ~(1 << 31); /* REORDERING */
 	sossi_write_reg(SOSSI_INIT1_REG, l);
 
-	if ((r = request_irq(INT_1610_SoSSI_MATCH, sossi_match_irq,
+	if ((r = request_irq(fbdev->ext_irq, sossi_match_irq,
 			     IRQ_TYPE_EDGE_FALLING,
 	     "sossi_match", sossi.fbdev->dev)) < 0) {
 		dev_err(sossi.fbdev->dev, "can't get SoSSI match IRQ\n");
diff --git a/include/linux/omap-dma.h b/include/linux/omap-dma.h
index ba3cfbb52312..e9d76ac6321d 100644
--- a/include/linux/omap-dma.h
+++ b/include/linux/omap-dma.h
@@ -346,8 +346,8 @@ extern void omap_dma_set_global_params(int arb_rate, int max_fifo_depth,
 void omap_dma_global_context_save(void);
 void omap_dma_global_context_restore(void);
 
-#if defined(CONFIG_ARCH_OMAP1) && IS_ENABLED(CONFIG_FB_OMAP)
-#include <mach/lcd_dma.h>
+#if IS_ENABLED(CONFIG_FB_OMAP)
+extern int omap_lcd_dma_running(void);
 #else
 static inline int omap_lcd_dma_running(void)
 {
@@ -356,6 +356,9 @@ static inline int omap_lcd_dma_running(void)
 #endif
 
 #else /* CONFIG_ARCH_OMAP */
+static inline void omap_set_dma_priority(int lch, int dst_port, int priority)
+{
+}
 
 static inline struct omap_system_dma_plat_info *omap_get_plat_info(void)
 {
-- 
2.20.0

