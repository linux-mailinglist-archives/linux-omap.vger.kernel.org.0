Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1942A1C4A62
	for <lists+linux-omap@lfdr.de>; Tue,  5 May 2020 01:35:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728273AbgEDXfP (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 4 May 2020 19:35:15 -0400
Received: from smtprelay0057.hostedemail.com ([216.40.44.57]:36100 "EHLO
        smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728092AbgEDXfP (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 4 May 2020 19:35:15 -0400
X-Greylist: delayed 371 seconds by postgrey-1.27 at vger.kernel.org; Mon, 04 May 2020 19:35:14 EDT
Received: from smtprelay.hostedemail.com (10.5.19.251.rfc1918.com [10.5.19.251])
        by smtpgrave03.hostedemail.com (Postfix) with ESMTP id 411321802562C;
        Mon,  4 May 2020 23:29:04 +0000 (UTC)
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net [216.40.38.60])
        by smtprelay06.hostedemail.com (Postfix) with ESMTP id 8294D1822384F;
        Mon,  4 May 2020 23:29:02 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Spam-Summary: 2,0,0,,d41d8cd98f00b204,joe@perches.com,,RULES_HIT:41:355:379:800:857:960:973:988:989:1260:1277:1311:1313:1314:1345:1437:1515:1516:1518:1535:1544:1593:1594:1711:1730:1747:1777:1792:2393:2559:2562:2828:3138:3139:3140:3141:3142:3355:3867:4321:4605:5007:6117:6119:6642:7903:7974:8879:9592:10004:10848:11026:11473:11657:11658:11914:12043:12296:12297:12438:12555:12760:12986:13439:14181:14659:14721:21080:21451:21611:21627:21773:30054:30055,0,RBL:none,CacheIP:none,Bayesian:0.5,0.5,0.5,Netcheck:none,DomainCache:0,MSF:not bulk,SPF:,MSBL:0,DNSBL:none,Custom_rules:0:0:0,LFtime:1,LUA_SUMMARY:none
X-HE-Tag: burst33_88fb33cf02246
X-Filterd-Recvd-Size: 5410
Received: from XPS-9350.home (unknown [47.151.136.130])
        (Authenticated sender: joe@perches.com)
        by omf04.hostedemail.com (Postfix) with ESMTPA;
        Mon,  4 May 2020 23:29:01 +0000 (UTC)
Message-ID: <b1cf967015c5beafa475aaa30d8e21a58caff870.camel@perches.com>
Subject: [trivial PATCH] video: fbdev: Use IS_BUILTIN
From:   Joe Perches <joe@perches.com>
To:     Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Cc:     linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
Date:   Mon, 04 May 2020 16:29:00 -0700
Content-Type: text/plain; charset="ISO-8859-1"
User-Agent: Evolution 3.36.1-2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

IS_BUILTIN can be use to replace various initializations
like #if CONFIG_<FOO> int val = 1; #else int val = 0; #endif
so do so.

Signed-off-by: Joe Perches <joe@perches.com>
---
 drivers/video/fbdev/aty/aty128fb.c     | 6 +-----
 drivers/video/fbdev/aty/atyfb_base.c   | 7 +------
 drivers/video/fbdev/aty/radeon_base.c  | 6 +-----
 drivers/video/fbdev/nvidia/nvidia.c    | 6 +-----
 drivers/video/fbdev/omap/omapfb_main.c | 6 +-----
 drivers/video/fbdev/riva/fbdev.c       | 6 +-----
 drivers/video/fbdev/s3c2410fb.c        | 6 +-----
 7 files changed, 7 insertions(+), 36 deletions(-)

diff --git a/drivers/video/fbdev/aty/aty128fb.c b/drivers/video/fbdev/aty/aty128fb.c
index d05d4195acad..6fae6ad6cb77 100644
--- a/drivers/video/fbdev/aty/aty128fb.c
+++ b/drivers/video/fbdev/aty/aty128fb.c
@@ -384,11 +384,7 @@ static int default_lcd_on = 1;
 static bool mtrr = true;
 
 #ifdef CONFIG_FB_ATY128_BACKLIGHT
-#ifdef CONFIG_PMAC_BACKLIGHT
-static int backlight = 1;
-#else
-static int backlight = 0;
-#endif
+static int backlight = IS_BUILTIN(CONFIG_PMAC_BACKLIGHT);
 #endif
 
 /* PLL constants */
diff --git a/drivers/video/fbdev/aty/atyfb_base.c b/drivers/video/fbdev/aty/atyfb_base.c
index 49d192869cf5..23a29d61c2a2 100644
--- a/drivers/video/fbdev/aty/atyfb_base.c
+++ b/drivers/video/fbdev/aty/atyfb_base.c
@@ -317,12 +317,7 @@ static int mclk;
 static int xclk;
 static int comp_sync = -1;
 static char *mode;
-
-#ifdef CONFIG_PMAC_BACKLIGHT
-static int backlight = 1;
-#else
-static int backlight = 0;
-#endif
+static int backlight = IS_BUILTIN(CONFIG_PMAC_BACKLIGHT);
 
 #ifdef CONFIG_PPC
 static int default_vmode = VMODE_CHOOSE;
diff --git a/drivers/video/fbdev/aty/radeon_base.c b/drivers/video/fbdev/aty/radeon_base.c
index e116a3f9ad56..3fe509cb9b87 100644
--- a/drivers/video/fbdev/aty/radeon_base.c
+++ b/drivers/video/fbdev/aty/radeon_base.c
@@ -269,11 +269,7 @@ static bool force_measure_pll = 0;
 static bool nomtrr = 0;
 static bool force_sleep;
 static bool ignore_devlist;
-#ifdef CONFIG_PMAC_BACKLIGHT
-static int backlight = 1;
-#else
-static int backlight = 0;
-#endif
+static int backlight = IS_BUILTIN(CONFIG_PMAC_BACKLIGHT);
 
 /* Note about this function: we have some rare cases where we must not schedule,
  * this typically happen with our special "wake up early" hook which allows us to
diff --git a/drivers/video/fbdev/nvidia/nvidia.c b/drivers/video/fbdev/nvidia/nvidia.c
index c24de9107958..c6820e21875d 100644
--- a/drivers/video/fbdev/nvidia/nvidia.c
+++ b/drivers/video/fbdev/nvidia/nvidia.c
@@ -74,11 +74,7 @@ static int vram = 0;
 static int bpp = 8;
 static int reverse_i2c;
 static bool nomtrr = false;
-#ifdef CONFIG_PMAC_BACKLIGHT
-static int backlight = 1;
-#else
-static int backlight = 0;
-#endif
+static int backlight = IS_BUILTIN(CONFIG_PMAC_BACKLIGHT);
 
 static char *mode_option = NULL;
 
diff --git a/drivers/video/fbdev/omap/omapfb_main.c b/drivers/video/fbdev/omap/omapfb_main.c
index 1a9d6242916e..0cbcc74fa943 100644
--- a/drivers/video/fbdev/omap/omapfb_main.c
+++ b/drivers/video/fbdev/omap/omapfb_main.c
@@ -34,11 +34,7 @@ static unsigned long	def_vyres;
 static unsigned int	def_rotate;
 static unsigned int	def_mirror;
 
-#ifdef CONFIG_FB_OMAP_MANUAL_UPDATE
-static bool		manual_update = 1;
-#else
-static bool		manual_update;
-#endif
+static bool	manual_update = IS_BUILTIN(CONFIG_FB_OMAP_MANUAL_UPDATE);
 
 static struct platform_device	*fbdev_pdev;
 static struct lcd_panel		*fbdev_panel;
diff --git a/drivers/video/fbdev/riva/fbdev.c b/drivers/video/fbdev/riva/fbdev.c
index 764ec3285e62..9b3493846f4d 100644
--- a/drivers/video/fbdev/riva/fbdev.c
+++ b/drivers/video/fbdev/riva/fbdev.c
@@ -202,11 +202,7 @@ static int flatpanel = -1; /* Autodetect later */
 static int forceCRTC = -1;
 static bool noaccel  = 0;
 static bool nomtrr = 0;
-#ifdef CONFIG_PMAC_BACKLIGHT
-static int backlight = 1;
-#else
-static int backlight = 0;
-#endif
+static int backlight = IS_BUILTIN(CONFIG_PMAC_BACKLIGHT);
 
 static char *mode_option = NULL;
 static bool strictmode       = 0;
diff --git a/drivers/video/fbdev/s3c2410fb.c b/drivers/video/fbdev/s3c2410fb.c
index 2fb15a540167..6f8fa501583f 100644
--- a/drivers/video/fbdev/s3c2410fb.c
+++ b/drivers/video/fbdev/s3c2410fb.c
@@ -44,11 +44,7 @@
 #include "s3c2410fb.h"
 
 /* Debugging stuff */
-#ifdef CONFIG_FB_S3C2410_DEBUG
-static int debug	= 1;
-#else
-static int debug;
-#endif
+static int debug = IS_BUILTIN(CONFIG_FB_S3C2410_DEBUG);
 
 #define dprintk(msg...) \
 do { \


