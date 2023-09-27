Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 542687AFC98
	for <lists+linux-omap@lfdr.de>; Wed, 27 Sep 2023 09:47:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230154AbjI0Hrv (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 27 Sep 2023 03:47:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50676 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230076AbjI0Hrf (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 27 Sep 2023 03:47:35 -0400
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E595DCC0;
        Wed, 27 Sep 2023 00:47:32 -0700 (PDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out2.suse.de (Postfix) with ESMTPS id 9DEEE1F8AE;
        Wed, 27 Sep 2023 07:47:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1695800849; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=NxBcd+igdUhtckrFZURNbcjN7GUux7BiTjx9FHmuYUo=;
        b=ZYCyX7r0cwcVJuy0LbAIc3dfYn16daA1zWaYMDf/G4t2CitbNzwZSjg2O+E7Jk1gxr2qzF
        j61FmDEDjHFlZteTtvA2GdD9T6mLWq3CDooI0sCXqRnEQ8qp8/mfaUc5jAWRpIo1VupUyg
        CFQ41Hg7cBT2+rn9hywtOmYNPxoWVIU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1695800849;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=NxBcd+igdUhtckrFZURNbcjN7GUux7BiTjx9FHmuYUo=;
        b=GI97PDQXS1zxO7wDoQc0aZYPvGqpDwWWGJJGuAdaFAqpCGTlpvL0D9hPs6KhFpTL9jD0Ty
        LWd4okG9vbbYHgCA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 62AB213A74;
        Wed, 27 Sep 2023 07:47:29 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id 0BtDFxHeE2XvUQAAMHmgww
        (envelope-from <tzimmermann@suse.de>); Wed, 27 Sep 2023 07:47:29 +0000
From:   Thomas Zimmermann <tzimmermann@suse.de>
To:     deller@gmx.de, javierm@redhat.com, sam@ravnborg.org, arnd@arndb.de,
        daniel@ffwll.ch
Cc:     linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org,
        linux-nvidia@lists.surfsouth.com, linux-omap@vger.kernel.org,
        linux-parisc@vger.kernel.org,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Antonino Daplas <adaplas@gmail.com>
Subject: [PATCH 19/46] fbdev/i810fb: Initialize fb_ops to fbdev I/O-memory helpers
Date:   Wed, 27 Sep 2023 09:26:52 +0200
Message-ID: <20230927074722.6197-20-tzimmermann@suse.de>
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

No functional changes.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Antonino Daplas <adaplas@gmail.com>
---
 drivers/video/fbdev/Kconfig          | 4 +---
 drivers/video/fbdev/i810/i810_main.c | 2 ++
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/video/fbdev/Kconfig b/drivers/video/fbdev/Kconfig
index 3c28bff8a0770..e42439cfb1a1d 100644
--- a/drivers/video/fbdev/Kconfig
+++ b/drivers/video/fbdev/Kconfig
@@ -793,10 +793,8 @@ config FB_I740
 config FB_I810
 	tristate "Intel 810/815 support"
 	depends on FB && PCI && X86_32 && AGP_INTEL
+	select FB_IOMEM_FOPS
 	select FB_MODE_HELPERS
-	select FB_CFB_FILLRECT
-	select FB_CFB_COPYAREA
-	select FB_CFB_IMAGEBLIT
 	select VGASTATE
 	select VIDEO_NOMODESET
 	help
diff --git a/drivers/video/fbdev/i810/i810_main.c b/drivers/video/fbdev/i810/i810_main.c
index f5511bb4fadca..d73a795fe1bef 100644
--- a/drivers/video/fbdev/i810/i810_main.c
+++ b/drivers/video/fbdev/i810/i810_main.c
@@ -1547,6 +1547,7 @@ static const struct fb_ops i810fb_ops = {
 	.owner =             THIS_MODULE,
 	.fb_open =           i810fb_open,
 	.fb_release =        i810fb_release,
+	__FB_DEFAULT_IOMEM_OPS_RDWR,
 	.fb_check_var =      i810fb_check_var,
 	.fb_set_par =        i810fb_set_par,
 	.fb_setcolreg =      i810fb_setcolreg,
@@ -1557,6 +1558,7 @@ static const struct fb_ops i810fb_ops = {
 	.fb_imageblit =      i810fb_imageblit,
 	.fb_cursor =         i810fb_cursor,
 	.fb_sync =           i810fb_sync,
+	__FB_DEFAULT_IOMEM_OPS_MMAP,
 };
 
 /***********************************************************************
-- 
2.42.0

