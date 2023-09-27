Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 38FDC7AFCA6
	for <lists+linux-omap@lfdr.de>; Wed, 27 Sep 2023 09:48:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230168AbjI0Hry (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 27 Sep 2023 03:47:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40490 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230044AbjI0Hrf (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 27 Sep 2023 03:47:35 -0400
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E5A86CC2;
        Wed, 27 Sep 2023 00:47:32 -0700 (PDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out1.suse.de (Postfix) with ESMTPS id 71EAF218A9;
        Wed, 27 Sep 2023 07:47:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1695800851; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=f9++LjsnH7yAhNPAXtWrv3/mQA8oqsgHR5HwyxPZ/n8=;
        b=iGt8RSFx+qwdAVUE5ENX/gS9CvFjEUyPgKX+Z6Hbyx+EOkBaFF0n+goaCdq9itSTFh9aSY
        lKNxmWbz4+J9UuQup+tvxBfyQcBAPFQQNz10MikzPUIYPt2yldbaAhnrIolAojCrWhMRR+
        eNOOl4V/NKkQ13CFp84Y/BBoEAqprzI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1695800851;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=f9++LjsnH7yAhNPAXtWrv3/mQA8oqsgHR5HwyxPZ/n8=;
        b=MXS8vStIxVi4Boh8/vDfK6/lOasauFDYKQE0Mj8PA7H0t2Gx5YCo9AeODJTKryFK1gvi6Z
        JWvDM5YHSt2/kGBg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 389571338F;
        Wed, 27 Sep 2023 07:47:31 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id YJGsDBPeE2XvUQAAMHmgww
        (envelope-from <tzimmermann@suse.de>); Wed, 27 Sep 2023 07:47:31 +0000
From:   Thomas Zimmermann <tzimmermann@suse.de>
To:     deller@gmx.de, javierm@redhat.com, sam@ravnborg.org, arnd@arndb.de,
        daniel@ffwll.ch
Cc:     linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org,
        linux-nvidia@lists.surfsouth.com, linux-omap@vger.kernel.org,
        linux-parisc@vger.kernel.org,
        Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 25/46] fbdev/omapfb: Initialize fb_ops to fbdev I/O-memory helpers
Date:   Wed, 27 Sep 2023 09:26:58 +0200
Message-ID: <20230927074722.6197-26-tzimmermann@suse.de>
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
---
 drivers/video/fbdev/omap2/omapfb/Kconfig       | 4 +---
 drivers/video/fbdev/omap2/omapfb/omapfb-main.c | 5 ++---
 2 files changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/video/fbdev/omap2/omapfb/Kconfig b/drivers/video/fbdev/omap2/omapfb/Kconfig
index 21069fdb7cc21..f4cdf999a0801 100644
--- a/drivers/video/fbdev/omap2/omapfb/Kconfig
+++ b/drivers/video/fbdev/omap2/omapfb/Kconfig
@@ -10,9 +10,7 @@ menuconfig FB_OMAP2
 	depends on GPIOLIB
 	select FB_OMAP2_DSS
 	select OMAP2_VRFB if ARCH_OMAP2 || ARCH_OMAP3
-	select FB_CFB_FILLRECT
-	select FB_CFB_COPYAREA
-	select FB_CFB_IMAGEBLIT
+	select FB_IOMEM_HELPERS
 	help
 	  Frame buffer driver for OMAP2+ based boards.
 
diff --git a/drivers/video/fbdev/omap2/omapfb/omapfb-main.c b/drivers/video/fbdev/omap2/omapfb/omapfb-main.c
index b5acad8eb2796..c9fd0ad352d7f 100644
--- a/drivers/video/fbdev/omap2/omapfb/omapfb-main.c
+++ b/drivers/video/fbdev/omap2/omapfb/omapfb-main.c
@@ -1280,10 +1280,9 @@ static const struct fb_ops omapfb_ops = {
 	.owner          = THIS_MODULE,
 	.fb_open        = omapfb_open,
 	.fb_release     = omapfb_release,
-	.fb_fillrect    = cfb_fillrect,
-	.fb_copyarea    = cfb_copyarea,
-	.fb_imageblit   = cfb_imageblit,
+	__FB_DEFAULT_IOMEM_OPS_RDWR,
 	.fb_blank       = omapfb_blank,
+	__FB_DEFAULT_IOMEM_OPS_DRAW,
 	.fb_ioctl       = omapfb_ioctl,
 	.fb_check_var   = omapfb_check_var,
 	.fb_set_par     = omapfb_set_par,
-- 
2.42.0

