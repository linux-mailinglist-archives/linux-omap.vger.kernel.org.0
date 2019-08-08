Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3B36686C43
	for <lists+linux-omap@lfdr.de>; Thu,  8 Aug 2019 23:23:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390215AbfHHVXg (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 8 Aug 2019 17:23:36 -0400
Received: from mout.kundenserver.de ([212.227.126.133]:36315 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1733295AbfHHVXg (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 8 Aug 2019 17:23:36 -0400
Received: from threadripper.lan ([149.172.19.189]) by mrelayeu.kundenserver.de
 (mreue012 [212.227.15.129]) with ESMTPA (Nemesis) id
 1MnFps-1icdKs0qea-00jKxt; Thu, 08 Aug 2019 23:23:10 +0200
From:   Arnd Bergmann <arnd@arndb.de>
To:     Tony Lindgren <tony@atomide.com>,
        Aaro Koskinen <aaro.koskinen@iki.fi>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Cc:     linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org,
        linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: [PATCH 01/22] ARM: omap1: innovator: pass lcd control address as pdata
Date:   Thu,  8 Aug 2019 23:22:10 +0200
Message-Id: <20190808212234.2213262-2-arnd@arndb.de>
X-Mailer: git-send-email 2.20.0
In-Reply-To: <20190808212234.2213262-1-arnd@arndb.de>
References: <20190808212234.2213262-1-arnd@arndb.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:gYQzCnwbWs8mL7daViFjHUrU0375LB2jW2jmopnOztbOKCOlUH9
 wzr6xMzlYNNwM9kds2mG3qevqDGBNAJ3ckfUEAJNYKK2tsSbQCiKiSG2zIoL5FigrrtryXb
 Y4gOJjw9g/rplk35Su3pjCxkNftH4wqexHHFCHXeHNLLb4peZcfvWmcPJIjtkK+3FpiI1uO
 R3+EaCP0c583jcXIH3TLw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:+scwJx1aJ24=:fzzjaWEd6UPfzIwJQkEsjs
 3PTOJzPRcySccl4YgEgKXsQSYLtgS3T1hlqg3ZG2nwTEaklnDQd1wsErnSVNJ2YjuNtkgEUNh
 iLJMSmvFG/ccgp/BsS5ghJUtr6n8vBlVcGNIvumQMiY/5sE2/504mNQ2uAI03GlBW3LmYwjcL
 cYCUmNpBsQfxoatS96SDmS+0c56C8BdC5Cs2QkPQ5Zo3VG7V98t2Th5OYJ8U7dD3mEs8wKAau
 +3mXwnpIAvpMCQ4+862wyYMuYn+63CjZgS/J+sdQEqioMPPONV3Cl5u0Kf07S/WtLpvrrkHpz
 Fie4Uaa4YHh+u1hpgJyZUkMl8yDDXLwLPhGWtWFfTGVHALI0RwN12IWuUjFYbXDGLn6hSHYyF
 n11jgojUqdWQF59bUBi7NqCEuGwKXCvylQbWaW1eLg79pLVjw9SZmBgAjoxkEcAuRf/PMfTVb
 93uOK5qGjcH/0VJDhP4u5EQNPEkLjhXYrs7f0fGWQIxH2awjzUHHhBaO8E8TZcuCmY7XR/sZw
 fouqZmyBUeyGE9kyGsRTjLpIisj1GhWIqDXQFQHnaI5xn9abxsiGjPdGL4t507DJ/g2puzCYz
 mO5yy+hPpJ/V44WQbdwNgmuU61K3Ol0StT+Go+tfZLZu5CGGp1cY8F/dZPnyy3fDcfguqzXsq
 3VUbPE24+i8zOqaZL1+UCpVISxqc7h6WID356sPIluGWaulaS4+f6xXxbT5cy3ejlJejzCobv
 pXs4GXE031dxuO+xu0W3giaP84+bJ+pQrG0nMQ==
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

To avoid using the mach/omap1510.h header file, pass the correct
address as platform data.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/arm/mach-omap1/board-innovator.c  | 3 +++
 drivers/video/fbdev/omap/lcd_inn1510.c | 7 +++++--
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/arch/arm/mach-omap1/board-innovator.c b/arch/arm/mach-omap1/board-innovator.c
index cbe093f969d5..2425f1bacb33 100644
--- a/arch/arm/mach-omap1/board-innovator.c
+++ b/arch/arm/mach-omap1/board-innovator.c
@@ -194,6 +194,9 @@ static struct platform_device innovator1510_smc91x_device = {
 static struct platform_device innovator1510_lcd_device = {
 	.name		= "lcd_inn1510",
 	.id		= -1,
+	.dev	= {
+		.platform_data = (void __force *)OMAP1510_FPGA_LCD_PANEL_CONTROL,
+	}
 };
 
 static struct platform_device innovator1510_spi_device = {
diff --git a/drivers/video/fbdev/omap/lcd_inn1510.c b/drivers/video/fbdev/omap/lcd_inn1510.c
index 776e7f8d656e..37ed0c14aa5a 100644
--- a/drivers/video/fbdev/omap/lcd_inn1510.c
+++ b/drivers/video/fbdev/omap/lcd_inn1510.c
@@ -14,15 +14,17 @@
 
 #include "omapfb.h"
 
+static void __iomem *omap1510_fpga_lcd_panel_control;
+
 static int innovator1510_panel_enable(struct lcd_panel *panel)
 {
-	__raw_writeb(0x7, OMAP1510_FPGA_LCD_PANEL_CONTROL);
+	__raw_writeb(0x7, omap1510_fpga_lcd_panel_control);
 	return 0;
 }
 
 static void innovator1510_panel_disable(struct lcd_panel *panel)
 {
-	__raw_writeb(0x0, OMAP1510_FPGA_LCD_PANEL_CONTROL);
+	__raw_writeb(0x0, omap1510_fpga_lcd_panel_control);
 }
 
 static struct lcd_panel innovator1510_panel = {
@@ -48,6 +50,7 @@ static struct lcd_panel innovator1510_panel = {
 
 static int innovator1510_panel_probe(struct platform_device *pdev)
 {
+	omap1510_fpga_lcd_panel_control = (void __iomem *)pdev->dev.platform_data;
 	omapfb_register_panel(&innovator1510_panel);
 	return 0;
 }
-- 
2.20.0

