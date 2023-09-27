Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ABED97AFCB5
	for <lists+linux-omap@lfdr.de>; Wed, 27 Sep 2023 09:48:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230185AbjI0Hr6 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 27 Sep 2023 03:47:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50706 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230041AbjI0Hrf (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 27 Sep 2023 03:47:35 -0400
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 67DA612A;
        Wed, 27 Sep 2023 00:47:34 -0700 (PDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out1.suse.de (Postfix) with ESMTPS id 0A698218CE;
        Wed, 27 Sep 2023 07:47:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1695800853; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=GaxMUTxJx9REMKwDO9x/6XTWgzZI2rs0OcKvhJZVHQ8=;
        b=Ds07cppu9esS5bqr4WlvqywT/Nn6DVNuKAa9OXwxQIUS155b2t7OnJi42gxJP2JXHC6ykG
        N2w0AQ1wfYbzbmuDaxfAWa8HFIxbXKyYlkxsdqtUj0SlCnoXDS9UeuBapt/gD+qOKoamLa
        DQbP0DJbX9pLGDjp0sgBvbsu0ris44A=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1695800853;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=GaxMUTxJx9REMKwDO9x/6XTWgzZI2rs0OcKvhJZVHQ8=;
        b=S6vECYBQdIhDxJVnevb0+OLehSOeXE1NGQAQzOxVBu1wJB+cVBHOZOv4lH0AlRpJPUxIJc
        VUyjP5ZPDmMjIZCQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id C41071338F;
        Wed, 27 Sep 2023 07:47:32 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id WMUXLxTeE2XvUQAAMHmgww
        (envelope-from <tzimmermann@suse.de>); Wed, 27 Sep 2023 07:47:32 +0000
From:   Thomas Zimmermann <tzimmermann@suse.de>
To:     deller@gmx.de, javierm@redhat.com, sam@ravnborg.org, arnd@arndb.de,
        daniel@ffwll.ch
Cc:     linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org,
        linux-nvidia@lists.surfsouth.com, linux-omap@vger.kernel.org,
        linux-parisc@vger.kernel.org,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Kristoffer Ericson <kristoffer.ericson@gmail.com>
Subject: [PATCH 31/46] fbdev/s1d13xxxfb: Initialize fb_ops to fbdev I/O-memory helpers
Date:   Wed, 27 Sep 2023 09:27:04 +0200
Message-ID: <20230927074722.6197-32-tzimmermann@suse.de>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20230927074722.6197-1-tzimmermann@suse.de>
References: <20230927074722.6197-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Initialize the instance of struct fb_ops with fbdev initializer
macros for framebuffers in I/O address space. Set the read/write,
draw and mmap callbacks to the correct implementation and avoid
implicit defaults. Also select the necessary I/O helpers in Kconfig.

Fbdev drivers sometimes rely on the callbacks being NULL for a
default implementation to be invoked; hence requiring the I/O
helpers to be built in any case. Setting all callbacks in all
drivers explicitly will allow to make the I/O helpers optional.
This benefits systems that do not use these functions.

To simplify the conversion, provide a dedicated fb_ops instance
for accelerated devices. No functional changes.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Kristoffer Ericson <kristoffer.ericson@gmail.com>
---
 drivers/video/fbdev/Kconfig      |  1 +
 drivers/video/fbdev/s1d13xxxfb.c | 25 ++++++++++++++++---------
 2 files changed, 17 insertions(+), 9 deletions(-)

diff --git a/drivers/video/fbdev/Kconfig b/drivers/video/fbdev/Kconfig
index 64131e2b11bd5..fdac5f9177068 100644
--- a/drivers/video/fbdev/Kconfig
+++ b/drivers/video/fbdev/Kconfig
@@ -671,6 +671,7 @@ config FB_S1D13XXX
 	select FB_CFB_FILLRECT
 	select FB_CFB_COPYAREA
 	select FB_CFB_IMAGEBLIT
+	select FB_IOMEM_FOPS
 	help
 	  Support for S1D13XXX framebuffer device family (currently only
 	  working with S1D13806). Product specs at
diff --git a/drivers/video/fbdev/s1d13xxxfb.c b/drivers/video/fbdev/s1d13xxxfb.c
index c7d221cce06d7..0e871197c6de6 100644
--- a/drivers/video/fbdev/s1d13xxxfb.c
+++ b/drivers/video/fbdev/s1d13xxxfb.c
@@ -596,18 +596,26 @@ s1d13xxxfb_bitblt_solidfill(struct fb_info *info, const struct fb_fillrect *rect
 }
 
 /* framebuffer information structures */
-static struct fb_ops s1d13xxxfb_fbops = {
+static const struct fb_ops s1d13xxxfb_fbops = {
 	.owner		= THIS_MODULE,
+	FB_DEFAULT_IOMEM_OPS,
 	.fb_set_par	= s1d13xxxfb_set_par,
 	.fb_setcolreg	= s1d13xxxfb_setcolreg,
 	.fb_blank	= s1d13xxxfb_blank,
-
 	.fb_pan_display	= s1d13xxxfb_pan_display,
+};
 
-	/* gets replaced at chip detection time */
-	.fb_fillrect	= cfb_fillrect,
-	.fb_copyarea	= cfb_copyarea,
+static const struct fb_ops s1d13xxxfb_fbops_s1d13506 = {
+	.owner		= THIS_MODULE,
+	__FB_DEFAULT_IOMEM_OPS_RDWR,
+	.fb_set_par	= s1d13xxxfb_set_par,
+	.fb_setcolreg	= s1d13xxxfb_setcolreg,
+	.fb_blank	= s1d13xxxfb_blank,
+	.fb_pan_display	= s1d13xxxfb_pan_display,
+	.fb_fillrect	= s1d13xxxfb_bitblt_solidfill,
+	.fb_copyarea	= s1d13xxxfb_bitblt_copyarea,
 	.fb_imageblit	= cfb_imageblit,
+	__FB_DEFAULT_IOMEM_OPS_MMAP,
 };
 
 static int s1d13xxxfb_width_tab[2][4] = {
@@ -869,17 +877,16 @@ static int s1d13xxxfb_probe(struct platform_device *pdev)
 	       default_par->regs, info->fix.smem_len / 1024, info->screen_base);
 
 	info->par = default_par;
-	info->flags = FBINFO_HWACCEL_YPAN;
-	info->fbops = &s1d13xxxfb_fbops;
 
 	switch(prod_id) {
 	case S1D13506_PROD_ID:	/* activate acceleration */
-		s1d13xxxfb_fbops.fb_fillrect = s1d13xxxfb_bitblt_solidfill;
-		s1d13xxxfb_fbops.fb_copyarea = s1d13xxxfb_bitblt_copyarea;
 		info->flags = FBINFO_HWACCEL_YPAN |
 			FBINFO_HWACCEL_FILLRECT | FBINFO_HWACCEL_COPYAREA;
+		info->fbops = &s1d13xxxfb_fbops_s1d13506;
 		break;
 	default:
+		info->flags = FBINFO_HWACCEL_YPAN;
+		info->fbops = &s1d13xxxfb_fbops;
 		break;
 	}
 
-- 
2.42.0

