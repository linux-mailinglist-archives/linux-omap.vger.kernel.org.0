Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AC71E6B47BB
	for <lists+linux-omap@lfdr.de>; Fri, 10 Mar 2023 15:53:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233490AbjCJOxw (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 10 Mar 2023 09:53:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57620 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233403AbjCJOx2 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 10 Mar 2023 09:53:28 -0500
Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com [209.85.160.49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B67B125AF9;
        Fri, 10 Mar 2023 06:49:27 -0800 (PST)
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-17671fb717cso6053250fac.8;
        Fri, 10 Mar 2023 06:49:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678459709;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5ABh9MagjDNyGivJ3oT/1DUZHeIg4J1qNxCI1uEPy4Q=;
        b=xduS1bTaK+w0+UU0Zy70jd4Utq3VZsmT4t/6+RVgE2t9PaaGgjQAyrCJ1sfaMNbzsN
         ETnHC6owPUuov1UUWfS30ivGbsOaFWv57M0/CvqxTyIgbQH9cGqdaF88er+Ix5e8g6s4
         VNE8Yc8f4xZ6GOJ0uYhdeKHy8045VQtenTbWeGe8Y8bqYdgZuubm1DvWqHlIUJ1jJ/xX
         2FnX3Gvaiaxe5hlNuYAH1E/yT4iuJN12H//Iuh0IAMYpg1+rA4R/PxcnWUIKxSxKjSx5
         +qF1KVGcHB/wwTtV0QCJ4smmaVhmKMm9o1K+qwggIOI2ljGM9pHSQW747ttMWwLQ/Mb1
         1m7Q==
X-Gm-Message-State: AO0yUKVNpG0riEZo8LJljPV2I/in+4lScZ/rAT/MKVC6Sa4T6QIrdJpK
        ydU291gcQeOIebN7cJjhCA==
X-Google-Smtp-Source: AK7set/3qtl4P82g+jyKy/zqrO1gocYbHRAq7O166an25I6PVtSxchhQQDghw8aD3mFYHy2oBhVb6g==
X-Received: by 2002:a05:6870:a68c:b0:16e:8d40:b5ec with SMTP id i12-20020a056870a68c00b0016e8d40b5ecmr16859362oam.50.1678459708772;
        Fri, 10 Mar 2023 06:48:28 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id z21-20020a056870515500b001728d38a41asm71779oak.55.2023.03.10.06.48.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Mar 2023 06:48:28 -0800 (PST)
Received: (nullmailer pid 1545988 invoked by uid 1000);
        Fri, 10 Mar 2023 14:47:29 -0000
From:   Rob Herring <robh@kernel.org>
To:     Russell King <linux@armlinux.org.uk>, Helge Deller <deller@gmx.de>
Cc:     devicetree@vger.kernel.org, linux-fbdev@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-omap@vger.kernel.org
Subject: [PATCH] fbdev: Use of_property_present() for testing DT property presence
Date:   Fri, 10 Mar 2023 08:47:29 -0600
Message-Id: <20230310144729.1545943-1-robh@kernel.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,
        RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

It is preferred to use typed property access functions (i.e.
of_property_read_<type> functions) rather than low-level
of_get_property/of_find_property functions for reading properties. As
part of this, convert of_get_property/of_find_property calls to the
recently added of_property_present() helper when we just want to test
for presence of a property and nothing more.

Signed-off-by: Rob Herring <robh@kernel.org>
---
 drivers/video/fbdev/amba-clcd.c                          | 2 +-
 drivers/video/fbdev/bw2.c                                | 2 +-
 drivers/video/fbdev/cg3.c                                | 2 +-
 drivers/video/fbdev/omap2/omapfb/dss/omapdss-boot-init.c | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/video/fbdev/amba-clcd.c b/drivers/video/fbdev/amba-clcd.c
index f65c96d1394d..e45338227be6 100644
--- a/drivers/video/fbdev/amba-clcd.c
+++ b/drivers/video/fbdev/amba-clcd.c
@@ -854,7 +854,7 @@ static struct clcd_board *clcdfb_of_get_board(struct amba_device *dev)
 	board->caps = CLCD_CAP_ALL;
 	board->check = clcdfb_check;
 	board->decode = clcdfb_decode;
-	if (of_find_property(node, "memory-region", NULL)) {
+	if (of_property_present(node, "memory-region")) {
 		board->setup = clcdfb_of_vram_setup;
 		board->mmap = clcdfb_of_vram_mmap;
 		board->remove = clcdfb_of_vram_remove;
diff --git a/drivers/video/fbdev/bw2.c b/drivers/video/fbdev/bw2.c
index 6403ae07970d..9cbadcd18b25 100644
--- a/drivers/video/fbdev/bw2.c
+++ b/drivers/video/fbdev/bw2.c
@@ -306,7 +306,7 @@ static int bw2_probe(struct platform_device *op)
 	if (!par->regs)
 		goto out_release_fb;
 
-	if (!of_find_property(dp, "width", NULL)) {
+	if (!of_property_present(dp, "width")) {
 		err = bw2_do_default_mode(par, info, &linebytes);
 		if (err)
 			goto out_unmap_regs;
diff --git a/drivers/video/fbdev/cg3.c b/drivers/video/fbdev/cg3.c
index bdcc3f6ab666..3a37fff4df36 100644
--- a/drivers/video/fbdev/cg3.c
+++ b/drivers/video/fbdev/cg3.c
@@ -393,7 +393,7 @@ static int cg3_probe(struct platform_device *op)
 
 	cg3_blank(FB_BLANK_UNBLANK, info);
 
-	if (!of_find_property(dp, "width", NULL)) {
+	if (!of_property_present(dp, "width")) {
 		err = cg3_do_default_mode(par);
 		if (err)
 			goto out_unmap_screen;
diff --git a/drivers/video/fbdev/omap2/omapfb/dss/omapdss-boot-init.c b/drivers/video/fbdev/omap2/omapfb/dss/omapdss-boot-init.c
index 0ae0cab252d3..09f719af0d0c 100644
--- a/drivers/video/fbdev/omap2/omapfb/dss/omapdss-boot-init.c
+++ b/drivers/video/fbdev/omap2/omapfb/dss/omapdss-boot-init.c
@@ -192,7 +192,7 @@ static int __init omapdss_boot_init(void)
 	omapdss_walk_device(dss, true);
 
 	for_each_available_child_of_node(dss, child) {
-		if (!of_find_property(child, "compatible", NULL))
+		if (!of_property_present(child, "compatible"))
 			continue;
 
 		omapdss_walk_device(child, true);
-- 
2.39.2

