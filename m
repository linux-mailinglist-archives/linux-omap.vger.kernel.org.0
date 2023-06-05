Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 05E25722935
	for <lists+linux-omap@lfdr.de>; Mon,  5 Jun 2023 16:48:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232342AbjFEOsT (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 5 Jun 2023 10:48:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36102 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232467AbjFEOsS (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 5 Jun 2023 10:48:18 -0400
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E878B103;
        Mon,  5 Jun 2023 07:48:16 -0700 (PDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out1.suse.de (Postfix) with ESMTPS id 7C35221B5B;
        Mon,  5 Jun 2023 14:48:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1685976495; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=8Jdtf2GKLM6JlfSgNDYgNeFajTa+TxjD2eBIr6BqQEk=;
        b=WbaZTJDQY1KujBlkPT05GFL0zJwaEdUio499VwvBMkLOoDe/jDNRDtwT0jVUw1QB8LD8E9
        +F4B9pz8PhzLqBzhnz1OnQtdgl8JHNr5q916GJPb/DagkCg3fOcifiNPNxIIr5Sy7ZaCK7
        MbMUQAJEPa3Pgm2x+gOMIL8/O2B7jU4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1685976495;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=8Jdtf2GKLM6JlfSgNDYgNeFajTa+TxjD2eBIr6BqQEk=;
        b=OEkuoeIVVi313RnpQW5X3kFJ3N0Wm1L9PHphi8VNpNblHWxonY7Z+34Ef3s9pvi+nMcFbP
        qSNHz0INTO2UalCQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 32C35139C8;
        Mon,  5 Jun 2023 14:48:15 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id YEaAC6/1fWQvXwAAMHmgww
        (envelope-from <tzimmermann@suse.de>); Mon, 05 Jun 2023 14:48:15 +0000
From:   Thomas Zimmermann <tzimmermann@suse.de>
To:     daniel@ffwll.ch, javierm@redhat.com, sam@ravnborg.org,
        deller@gmx.de, geert+renesas@glider.be, lee@kernel.org,
        daniel.thompson@linaro.org, jingoohan1@gmail.com
Cc:     linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-sh@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-staging@lists.linux.dev,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Rich Felker <dalias@libc.org>,
        John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Subject: [PATCH 02/30] backlight/gpio_backlight: Compare against struct fb_info.device
Date:   Mon,  5 Jun 2023 16:47:44 +0200
Message-Id: <20230605144812.15241-3-tzimmermann@suse.de>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230605144812.15241-1-tzimmermann@suse.de>
References: <20230605144812.15241-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Struct gpio_backlight_platform_data refers to a platform device within
the Linux device hierarchy. The test in gpio_backlight_check_fb()
compares it against the fbdev device in struct fb_info.dev, which
is different. Fix the test by comparing to struct fb_info.device.

Fixes a bug in the backlight driver and prepares fbdev for making
struct fb_info.dev optional.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Rich Felker <dalias@libc.org>
Cc: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc: Lee Jones <lee@kernel.org>
Cc: Daniel Thompson <daniel.thompson@linaro.org>
Cc: Jingoo Han <jingoohan1@gmail.com>
Cc: linux-sh@vger.kernel.org
---
 arch/sh/boards/mach-ecovec24/setup.c         | 2 +-
 drivers/video/backlight/gpio_backlight.c     | 6 +++---
 include/linux/platform_data/gpio_backlight.h | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/sh/boards/mach-ecovec24/setup.c b/arch/sh/boards/mach-ecovec24/setup.c
index 674da7ebd8b7..310513646c9b 100644
--- a/arch/sh/boards/mach-ecovec24/setup.c
+++ b/arch/sh/boards/mach-ecovec24/setup.c
@@ -386,7 +386,7 @@ static struct property_entry gpio_backlight_props[] = {
 };
 
 static struct gpio_backlight_platform_data gpio_backlight_data = {
-	.fbdev = &lcdc_device.dev,
+	.dev = &lcdc_device.dev,
 };
 
 static const struct platform_device_info gpio_backlight_device_info = {
diff --git a/drivers/video/backlight/gpio_backlight.c b/drivers/video/backlight/gpio_backlight.c
index 6f78d928f054..d3bea42407f1 100644
--- a/drivers/video/backlight/gpio_backlight.c
+++ b/drivers/video/backlight/gpio_backlight.c
@@ -17,7 +17,7 @@
 #include <linux/slab.h>
 
 struct gpio_backlight {
-	struct device *fbdev;
+	struct device *dev;
 	struct gpio_desc *gpiod;
 };
 
@@ -35,7 +35,7 @@ static int gpio_backlight_check_fb(struct backlight_device *bl,
 {
 	struct gpio_backlight *gbl = bl_get_data(bl);
 
-	return gbl->fbdev == NULL || gbl->fbdev == info->dev;
+	return !gbl->dev || gbl->dev == info->device;
 }
 
 static const struct backlight_ops gpio_backlight_ops = {
@@ -59,7 +59,7 @@ static int gpio_backlight_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	if (pdata)
-		gbl->fbdev = pdata->fbdev;
+		gbl->dev = pdata->dev;
 
 	def_value = device_property_read_bool(dev, "default-on");
 
diff --git a/include/linux/platform_data/gpio_backlight.h b/include/linux/platform_data/gpio_backlight.h
index 1a8b5b1946fe..323fbf5f7613 100644
--- a/include/linux/platform_data/gpio_backlight.h
+++ b/include/linux/platform_data/gpio_backlight.h
@@ -8,7 +8,7 @@
 struct device;
 
 struct gpio_backlight_platform_data {
-	struct device *fbdev;
+	struct device *dev;
 };
 
 #endif
-- 
2.40.1

