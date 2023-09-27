Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 88CC57AFCC1
	for <lists+linux-omap@lfdr.de>; Wed, 27 Sep 2023 09:48:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230108AbjI0HsB (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 27 Sep 2023 03:48:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40354 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230116AbjI0Hrg (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 27 Sep 2023 03:47:36 -0400
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 62A3A198;
        Wed, 27 Sep 2023 00:47:35 -0700 (PDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out2.suse.de (Postfix) with ESMTPS id 0F3991F8B6;
        Wed, 27 Sep 2023 07:47:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1695800854; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=mQkKc/h6/3tCXG4Y1Fvgfmz/5VCV3YyJLn5dHo8ZkGo=;
        b=MNTtqbPGrx+rg3BKlXWt4r198KBkWzXWkKouDAaPIYNKira4aTQd3l8+uMVdTx45QWWZga
        ov6NgpYfO28ubXPS4E9VRn9BcY16m+3A34Em9sloMcXp+naE/umvoPRWPNHRMSVBISl07I
        xkcboScShx7O61rfEjS8meP85p57JEM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1695800854;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=mQkKc/h6/3tCXG4Y1Fvgfmz/5VCV3YyJLn5dHo8ZkGo=;
        b=CD+aDLJKzhmfqGLnXxNhwCI7RNPhJwfXNOAvjgAGIOY8qnM6K+3k6lMv4Crxrctm1pKqoU
        zWqQQtCrYjA29EAg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id CC21713A74;
        Wed, 27 Sep 2023 07:47:33 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id sLH+MBXeE2XvUQAAMHmgww
        (envelope-from <tzimmermann@suse.de>); Wed, 27 Sep 2023 07:47:33 +0000
From:   Thomas Zimmermann <tzimmermann@suse.de>
To:     deller@gmx.de, javierm@redhat.com, sam@ravnborg.org, arnd@arndb.de,
        daniel@ffwll.ch
Cc:     linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org,
        linux-nvidia@lists.surfsouth.com, linux-omap@vger.kernel.org,
        linux-parisc@vger.kernel.org,
        Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 35/46] fbdev/sisfb: Initialize fb_ops to fbdev I/O-memory helpers
Date:   Wed, 27 Sep 2023 09:27:08 +0200
Message-ID: <20230927074722.6197-36-tzimmermann@suse.de>
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
 drivers/video/fbdev/Kconfig        | 3 ++-
 drivers/video/fbdev/sis/sis_main.c | 4 +++-
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/video/fbdev/Kconfig b/drivers/video/fbdev/Kconfig
index 2d8b7fe502f74..bda5ed8a40b0a 100644
--- a/drivers/video/fbdev/Kconfig
+++ b/drivers/video/fbdev/Kconfig
@@ -1203,10 +1203,11 @@ config FB_SAVAGE_ACCEL
 config FB_SIS
 	tristate "SiS/XGI display support"
 	depends on FB && PCI
+	select BOOT_VESA_SUPPORT if FB_SIS = y
 	select FB_CFB_FILLRECT
 	select FB_CFB_COPYAREA
 	select FB_CFB_IMAGEBLIT
-	select BOOT_VESA_SUPPORT if FB_SIS = y
+	select FB_IOMEM_FOPS
 	select FB_SIS_300 if !FB_SIS_315
 	select VIDEO_NOMODESET
 	help
diff --git a/drivers/video/fbdev/sis/sis_main.c b/drivers/video/fbdev/sis/sis_main.c
index 0f5374f6ef055..6ad47b6b60046 100644
--- a/drivers/video/fbdev/sis/sis_main.c
+++ b/drivers/video/fbdev/sis/sis_main.c
@@ -1911,6 +1911,7 @@ static const struct fb_ops sisfb_ops = {
 	.owner		= THIS_MODULE,
 	.fb_open	= sisfb_open,
 	.fb_release	= sisfb_release,
+	__FB_DEFAULT_IOMEM_OPS_RDWR,
 	.fb_check_var	= sisfb_check_var,
 	.fb_set_par	= sisfb_set_par,
 	.fb_setcolreg	= sisfb_setcolreg,
@@ -1923,7 +1924,8 @@ static const struct fb_ops sisfb_ops = {
 #ifdef SIS_NEW_CONFIG_COMPAT
 	.fb_compat_ioctl= sisfb_ioctl,
 #endif
-	.fb_ioctl	= sisfb_ioctl
+	.fb_ioctl	= sisfb_ioctl,
+	__FB_DEFAULT_IOMEM_OPS_MMAP,
 };
 
 /* ---------------- Chip generation dependent routines ---------------- */
-- 
2.42.0

