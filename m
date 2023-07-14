Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 295ED7541F7
	for <lists+linux-omap@lfdr.de>; Fri, 14 Jul 2023 20:01:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236547AbjGNR67 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 14 Jul 2023 13:58:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45284 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236876AbjGNR6O (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 14 Jul 2023 13:58:14 -0400
Received: from mail-io1-xd32.google.com (mail-io1-xd32.google.com [IPv6:2607:f8b0:4864:20::d32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A58DE1BD4;
        Fri, 14 Jul 2023 10:57:49 -0700 (PDT)
Received: by mail-io1-xd32.google.com with SMTP id ca18e2360f4ac-78666994bc2so90382239f.0;
        Fri, 14 Jul 2023 10:57:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689357086; x=1691949086;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tsm18Z/x+l+oB943/XiV2kuKPcdxzHAhIxFuPRhImLE=;
        b=QBNZsBu9hmnVp2P8ZWjG65b36gOrlcvmphn+vlGf53MGz1d1zVu/FnMmOQPmEEMZIS
         VelPW3OGf/jyOXAHGhjvoLd2Z7J+vjclo0M8x6C6Uz838DRAPQAkVrgfM9+G6kgQGPNB
         6sjFDUSrDrl2XAWoV7Qgj0jCkJOQqn+mdxWplk2qCi67/CanLwOg94S6P4LdSFsJEpJX
         TKPocKSkySBOfWCbozP5sX8lzKS8WO7A7y7b1ZDRJvXrnG4vBIYFc/oRnSR4IiallSFC
         HYP5IYbVjLYAkawgnP5oT2r2GoDdf42ggJU/Xs90tHcUy3U8nSQvCtotURhhyZXIJ1yW
         yCxQ==
X-Gm-Message-State: ABy/qLbcmawuDItYenG9WlG2HLg0mgN+S7mQ4KDa6EDTHuvwnjHFKoJQ
        OakQkhlVSz2OXxmjoGCoTw==
X-Google-Smtp-Source: APBJJlEBjHZ93+83bg5vG9zxP+ye50/ZV4Ps/NTZz7ryBzH4IRLL0LhGABVbLueVX73r4x7dl56wHQ==
X-Received: by 2002:a5e:a916:0:b0:785:fbe8:1da0 with SMTP id c22-20020a5ea916000000b00785fbe81da0mr5454406iod.15.1689357086619;
        Fri, 14 Jul 2023 10:51:26 -0700 (PDT)
Received: from robh_at_kernel.org ([64.188.179.250])
        by smtp.gmail.com with ESMTPSA id dm26-20020a0566023b9a00b0077a1d1029fcsm2850098iob.28.2023.07.14.10.51.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Jul 2023 10:51:25 -0700 (PDT)
Received: (nullmailer pid 4065617 invoked by uid 1000);
        Fri, 14 Jul 2023 17:50:38 -0000
From:   Rob Herring <robh@kernel.org>
To:     Helge Deller <deller@gmx.de>, Michal Simek <michal.simek@amd.com>
Cc:     devicetree@vger.kernel.org, linux-fbdev@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH] fb: Explicitly include correct DT includes
Date:   Fri, 14 Jul 2023 11:50:34 -0600
Message-Id: <20230714175035.4065508-1-robh@kernel.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

The DT of_device.h and of_platform.h date back to the separate
of_platform_bus_type before it as merged into the regular platform bus.
As part of that merge prepping Arm DT support 13 years ago, they
"temporarily" include each other. They also include platform_device.h
and of.h. As a result, there's a pretty much random mix of those include
files used throughout the tree. In order to detangle these headers and
replace the implicit includes with struct declarations, users need to
explicitly include the correct includes.

Signed-off-by: Rob Herring <robh@kernel.org>
---
 drivers/video/fbdev/bw2.c                                | 3 ++-
 drivers/video/fbdev/cg14.c                               | 3 ++-
 drivers/video/fbdev/cg3.c                                | 3 ++-
 drivers/video/fbdev/cg6.c                                | 3 ++-
 drivers/video/fbdev/ffb.c                                | 3 ++-
 drivers/video/fbdev/grvga.c                              | 3 +--
 drivers/video/fbdev/leo.c                                | 3 ++-
 drivers/video/fbdev/mb862xx/mb862xxfb_accel.c            | 4 +---
 drivers/video/fbdev/mb862xx/mb862xxfbdrv.c               | 6 +++---
 drivers/video/fbdev/omap2/omapfb/displays/panel-dsi-cm.c | 2 +-
 drivers/video/fbdev/p9100.c                              | 3 ++-
 drivers/video/fbdev/platinumfb.c                         | 4 ++--
 drivers/video/fbdev/sbuslib.c                            | 6 +++---
 drivers/video/fbdev/sunxvr1000.c                         | 3 ++-
 drivers/video/fbdev/sunxvr2500.c                         | 2 +-
 drivers/video/fbdev/sunxvr500.c                          | 2 +-
 drivers/video/fbdev/tcx.c                                | 3 ++-
 drivers/video/fbdev/xilinxfb.c                           | 5 ++---
 18 files changed, 33 insertions(+), 28 deletions(-)

diff --git a/drivers/video/fbdev/bw2.c b/drivers/video/fbdev/bw2.c
index 025d663dc6fd..39f438de0d6b 100644
--- a/drivers/video/fbdev/bw2.c
+++ b/drivers/video/fbdev/bw2.c
@@ -17,7 +17,8 @@
 #include <linux/init.h>
 #include <linux/fb.h>
 #include <linux/mm.h>
-#include <linux/of_device.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
 
 #include <asm/io.h>
 #include <asm/fbio.h>
diff --git a/drivers/video/fbdev/cg14.c b/drivers/video/fbdev/cg14.c
index 832a82f45c80..90fdc9d9bf5a 100644
--- a/drivers/video/fbdev/cg14.c
+++ b/drivers/video/fbdev/cg14.c
@@ -17,7 +17,8 @@
 #include <linux/fb.h>
 #include <linux/mm.h>
 #include <linux/uaccess.h>
-#include <linux/of_device.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
 
 #include <asm/io.h>
 #include <asm/fbio.h>
diff --git a/drivers/video/fbdev/cg3.c b/drivers/video/fbdev/cg3.c
index 6335cd364c74..98c60f72046a 100644
--- a/drivers/video/fbdev/cg3.c
+++ b/drivers/video/fbdev/cg3.c
@@ -17,7 +17,8 @@
 #include <linux/init.h>
 #include <linux/fb.h>
 #include <linux/mm.h>
-#include <linux/of_device.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
 
 #include <asm/io.h>
 #include <asm/fbio.h>
diff --git a/drivers/video/fbdev/cg6.c b/drivers/video/fbdev/cg6.c
index 6884572efea1..6427b85f1a94 100644
--- a/drivers/video/fbdev/cg6.c
+++ b/drivers/video/fbdev/cg6.c
@@ -17,7 +17,8 @@
 #include <linux/init.h>
 #include <linux/fb.h>
 #include <linux/mm.h>
-#include <linux/of_device.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
 
 #include <asm/io.h>
 #include <asm/fbio.h>
diff --git a/drivers/video/fbdev/ffb.c b/drivers/video/fbdev/ffb.c
index c6d3111dcbb0..c473841eb6ff 100644
--- a/drivers/video/fbdev/ffb.c
+++ b/drivers/video/fbdev/ffb.c
@@ -16,7 +16,8 @@
 #include <linux/fb.h>
 #include <linux/mm.h>
 #include <linux/timer.h>
-#include <linux/of_device.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
 
 #include <asm/io.h>
 #include <asm/upa.h>
diff --git a/drivers/video/fbdev/grvga.c b/drivers/video/fbdev/grvga.c
index 9aa15be29ea9..d4a9a58b3691 100644
--- a/drivers/video/fbdev/grvga.c
+++ b/drivers/video/fbdev/grvga.c
@@ -12,8 +12,7 @@
 
 #include <linux/platform_device.h>
 #include <linux/dma-mapping.h>
-#include <linux/of_platform.h>
-#include <linux/of_device.h>
+#include <linux/of.h>
 #include <linux/module.h>
 #include <linux/kernel.h>
 #include <linux/string.h>
diff --git a/drivers/video/fbdev/leo.c b/drivers/video/fbdev/leo.c
index 3ffc0a725f89..89ca48235dbe 100644
--- a/drivers/video/fbdev/leo.c
+++ b/drivers/video/fbdev/leo.c
@@ -16,8 +16,9 @@
 #include <linux/init.h>
 #include <linux/fb.h>
 #include <linux/mm.h>
-#include <linux/of_device.h>
 #include <linux/io.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
 
 #include <asm/fbio.h>
 
diff --git a/drivers/video/fbdev/mb862xx/mb862xxfb_accel.c b/drivers/video/fbdev/mb862xx/mb862xxfb_accel.c
index 61aed7fc0b8d..c35a7479fbf2 100644
--- a/drivers/video/fbdev/mb862xx/mb862xxfb_accel.c
+++ b/drivers/video/fbdev/mb862xx/mb862xxfb_accel.c
@@ -15,9 +15,7 @@
 #include <linux/module.h>
 #include <linux/pci.h>
 #include <linux/slab.h>
-#if defined(CONFIG_OF)
-#include <linux/of_platform.h>
-#endif
+
 #include "mb862xxfb.h"
 #include "mb862xx_reg.h"
 #include "mb862xxfb_accel.h"
diff --git a/drivers/video/fbdev/mb862xx/mb862xxfbdrv.c b/drivers/video/fbdev/mb862xx/mb862xxfbdrv.c
index b5c8fcab9940..9dc347d163cf 100644
--- a/drivers/video/fbdev/mb862xx/mb862xxfbdrv.c
+++ b/drivers/video/fbdev/mb862xx/mb862xxfbdrv.c
@@ -18,11 +18,11 @@
 #include <linux/init.h>
 #include <linux/interrupt.h>
 #include <linux/pci.h>
-#if defined(CONFIG_OF)
+#include <linux/of.h>
 #include <linux/of_address.h>
 #include <linux/of_irq.h>
-#include <linux/of_platform.h>
-#endif
+#include <linux/platform_device.h>
+
 #include "mb862xxfb.h"
 #include "mb862xx_reg.h"
 
diff --git a/drivers/video/fbdev/omap2/omapfb/displays/panel-dsi-cm.c b/drivers/video/fbdev/omap2/omapfb/displays/panel-dsi-cm.c
index ba94a0a7bd4f..77fce1223a64 100644
--- a/drivers/video/fbdev/omap2/omapfb/displays/panel-dsi-cm.c
+++ b/drivers/video/fbdev/omap2/omapfb/displays/panel-dsi-cm.c
@@ -15,12 +15,12 @@
 #include <linux/gpio/consumer.h>
 #include <linux/interrupt.h>
 #include <linux/jiffies.h>
+#include <linux/mod_devicetable.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
 #include <linux/sched/signal.h>
 #include <linux/slab.h>
 #include <linux/workqueue.h>
-#include <linux/of_device.h>
 
 #include <video/omapfb_dss.h>
 #include <video/mipi_display.h>
diff --git a/drivers/video/fbdev/p9100.c b/drivers/video/fbdev/p9100.c
index 0876962c52eb..e2e747cae9b1 100644
--- a/drivers/video/fbdev/p9100.c
+++ b/drivers/video/fbdev/p9100.c
@@ -15,7 +15,8 @@
 #include <linux/init.h>
 #include <linux/fb.h>
 #include <linux/mm.h>
-#include <linux/of_device.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
 
 #include <asm/io.h>
 #include <asm/fbio.h>
diff --git a/drivers/video/fbdev/platinumfb.c b/drivers/video/fbdev/platinumfb.c
index f8283fcd5edb..b27f43b3616e 100644
--- a/drivers/video/fbdev/platinumfb.c
+++ b/drivers/video/fbdev/platinumfb.c
@@ -30,9 +30,9 @@
 #include <linux/fb.h>
 #include <linux/init.h>
 #include <linux/nvram.h>
+#include <linux/of.h>
 #include <linux/of_address.h>
-#include <linux/of_device.h>
-#include <linux/of_platform.h>
+#include <linux/platform_device.h>
 
 #include "macmodes.h"
 #include "platinumfb.h"
diff --git a/drivers/video/fbdev/sbuslib.c b/drivers/video/fbdev/sbuslib.c
index 7f79db827b07..4d524db5c4f2 100644
--- a/drivers/video/fbdev/sbuslib.c
+++ b/drivers/video/fbdev/sbuslib.c
@@ -11,7 +11,7 @@
 #include <linux/fb.h>
 #include <linux/mm.h>
 #include <linux/uaccess.h>
-#include <linux/of_device.h>
+#include <linux/of.h>
 
 #include <asm/fbio.h>
 
@@ -48,7 +48,7 @@ int sbusfb_mmap_helper(struct sbus_mmap_map *map,
 	unsigned long map_offset = 0;
 	unsigned long off;
 	int i;
-                                        
+
 	if (!(vma->vm_flags & (VM_SHARED | VM_MAYSHARE)))
 		return -EINVAL;
 
@@ -72,7 +72,7 @@ int sbusfb_mmap_helper(struct sbus_mmap_map *map,
 #define POFF_MASK	(PAGE_MASK|0x1UL)
 #else
 #define POFF_MASK	(PAGE_MASK)
-#endif				
+#endif
 				map_offset = (physbase + map[i].poff) & POFF_MASK;
 				break;
 			}
diff --git a/drivers/video/fbdev/sunxvr1000.c b/drivers/video/fbdev/sunxvr1000.c
index 490bd9a14763..17d61e1d11a6 100644
--- a/drivers/video/fbdev/sunxvr1000.c
+++ b/drivers/video/fbdev/sunxvr1000.c
@@ -8,7 +8,8 @@
 #include <linux/kernel.h>
 #include <linux/fb.h>
 #include <linux/init.h>
-#include <linux/of_device.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
 
 struct gfb_info {
 	struct fb_info		*info;
diff --git a/drivers/video/fbdev/sunxvr2500.c b/drivers/video/fbdev/sunxvr2500.c
index 2cab4b9be68a..e64ec7d0caf9 100644
--- a/drivers/video/fbdev/sunxvr2500.c
+++ b/drivers/video/fbdev/sunxvr2500.c
@@ -10,7 +10,7 @@
 #include <linux/fb.h>
 #include <linux/pci.h>
 #include <linux/init.h>
-#include <linux/of_device.h>
+#include <linux/of.h>
 
 #include <asm/io.h>
 
diff --git a/drivers/video/fbdev/sunxvr500.c b/drivers/video/fbdev/sunxvr500.c
index 6ec358af1256..c4e01e871483 100644
--- a/drivers/video/fbdev/sunxvr500.c
+++ b/drivers/video/fbdev/sunxvr500.c
@@ -10,7 +10,7 @@
 #include <linux/fb.h>
 #include <linux/pci.h>
 #include <linux/init.h>
-#include <linux/of_device.h>
+#include <linux/of.h>
 
 #include <asm/io.h>
 
diff --git a/drivers/video/fbdev/tcx.c b/drivers/video/fbdev/tcx.c
index fc3ac2301b45..255eb57aefa2 100644
--- a/drivers/video/fbdev/tcx.c
+++ b/drivers/video/fbdev/tcx.c
@@ -17,7 +17,8 @@
 #include <linux/init.h>
 #include <linux/fb.h>
 #include <linux/mm.h>
-#include <linux/of_device.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
 
 #include <asm/io.h>
 #include <asm/fbio.h>
diff --git a/drivers/video/fbdev/xilinxfb.c b/drivers/video/fbdev/xilinxfb.c
index 2aa3a528277f..542baddd54ad 100644
--- a/drivers/video/fbdev/xilinxfb.c
+++ b/drivers/video/fbdev/xilinxfb.c
@@ -24,14 +24,13 @@
 #include <linux/module.h>
 #include <linux/kernel.h>
 #include <linux/errno.h>
+#include <linux/platform_device.h>
 #include <linux/string.h>
 #include <linux/mm.h>
 #include <linux/fb.h>
 #include <linux/init.h>
 #include <linux/dma-mapping.h>
-#include <linux/of_device.h>
-#include <linux/of_platform.h>
-#include <linux/of_address.h>
+#include <linux/of.h>
 #include <linux/io.h>
 #include <linux/slab.h>
 
-- 
2.40.1

