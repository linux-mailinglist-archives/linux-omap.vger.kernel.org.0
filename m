Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7FCCD7AFC5D
	for <lists+linux-omap@lfdr.de>; Wed, 27 Sep 2023 09:47:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230048AbjI0Hrh (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 27 Sep 2023 03:47:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50762 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230043AbjI0Hrb (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 27 Sep 2023 03:47:31 -0400
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 491EA1A5;
        Wed, 27 Sep 2023 00:47:28 -0700 (PDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out1.suse.de (Postfix) with ESMTPS id 14B652187B;
        Wed, 27 Sep 2023 07:47:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1695800845; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=oY0i4UK34L7nr7xZ30uhUhEt/fgW7HZcMAw4vpL9y1w=;
        b=NAQrwn0vOHOUeDtuz8duOP1q1KKGXBNIwG07Y8PXZFF8/eRGffAGwSX+2wprVd5qKIS2nl
        tC3AyshRyocOz9YyWnCDPc/UznY2y1LGAWww2EaR2+DUSeHNa9fYbpNohnhZh9F1t7QoXs
        6HShFT7l8mKFkOOGFsIncX4YANa7OCo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1695800845;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=oY0i4UK34L7nr7xZ30uhUhEt/fgW7HZcMAw4vpL9y1w=;
        b=d4200Of02irElHR6+7mnD0qgX7ZRqn+zUs808jVnl3d30fb/rMv4QFpRj0NQgzfDXutwdf
        ZNF9qbsmrxvWVRAg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id D0C5C13A74;
        Wed, 27 Sep 2023 07:47:24 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id MMQpMgzeE2XvUQAAMHmgww
        (envelope-from <tzimmermann@suse.de>); Wed, 27 Sep 2023 07:47:24 +0000
From:   Thomas Zimmermann <tzimmermann@suse.de>
To:     deller@gmx.de, javierm@redhat.com, sam@ravnborg.org, arnd@arndb.de,
        daniel@ffwll.ch
Cc:     linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org,
        linux-nvidia@lists.surfsouth.com, linux-omap@vger.kernel.org,
        linux-parisc@vger.kernel.org,
        Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 01/46] fbdev: Provide I/O-memory helpers as module
Date:   Wed, 27 Sep 2023 09:26:34 +0200
Message-ID: <20230927074722.6197-2-tzimmermann@suse.de>
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

Provide helpers for accessing I/O memory in a helper module. The fbdev
core uses these helpers, so select the module unconditionally for fbdev.
Drivers will later be able to select the module individually and the
helpers will become optional.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/video/fbdev/core/Kconfig      | 6 ++++++
 drivers/video/fbdev/core/Makefile     | 3 ++-
 drivers/video/fbdev/core/fb_io_fops.c | 3 +++
 3 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/video/fbdev/core/Kconfig b/drivers/video/fbdev/core/Kconfig
index 756c8603cf39b..7a3ed13bed708 100644
--- a/drivers/video/fbdev/core/Kconfig
+++ b/drivers/video/fbdev/core/Kconfig
@@ -4,6 +4,7 @@
 #
 
 config FB_CORE
+	select FB_IOMEM_FOPS
 	select VIDEO_CMDLINE
 	tristate
 
@@ -144,12 +145,17 @@ config FB_DMAMEM_HELPERS
 	select FB_SYS_FOPS
 	select FB_SYS_IMAGEBLIT
 
+config FB_IOMEM_FOPS
+	tristate
+	depends on FB_CORE
+
 config FB_IOMEM_HELPERS
 	bool
 	depends on FB_CORE
 	select FB_CFB_COPYAREA
 	select FB_CFB_FILLRECT
 	select FB_CFB_IMAGEBLIT
+	select FB_IOMEM_FOPS
 
 config FB_IOMEM_HELPERS_DEFERRED
 	bool
diff --git a/drivers/video/fbdev/core/Makefile b/drivers/video/fbdev/core/Makefile
index 36d3156dc759c..c1d657601b2be 100644
--- a/drivers/video/fbdev/core/Makefile
+++ b/drivers/video/fbdev/core/Makefile
@@ -3,7 +3,7 @@ obj-$(CONFIG_FB_NOTIFY)           += fb_notify.o
 obj-$(CONFIG_FB_CORE)             += fb.o
 fb-y                              := fb_info.o \
                                      fbmem.o fbcmap.o \
-                                     modedb.o fbcvt.o fb_cmdline.o fb_io_fops.o
+                                     modedb.o fbcvt.o fb_cmdline.o
 ifdef CONFIG_FB
 fb-y                              += fb_backlight.o fbmon.o
 endif
@@ -28,6 +28,7 @@ fb-$(CONFIG_LOGO)		  += fb_logo.o
 obj-$(CONFIG_FB_CFB_FILLRECT)  += cfbfillrect.o
 obj-$(CONFIG_FB_CFB_COPYAREA)  += cfbcopyarea.o
 obj-$(CONFIG_FB_CFB_IMAGEBLIT) += cfbimgblt.o
+obj-$(CONFIG_FB_IOMEM_FOPS)    += fb_io_fops.o
 obj-$(CONFIG_FB_SYS_FILLRECT)  += sysfillrect.o
 obj-$(CONFIG_FB_SYS_COPYAREA)  += syscopyarea.o
 obj-$(CONFIG_FB_SYS_IMAGEBLIT) += sysimgblt.o
diff --git a/drivers/video/fbdev/core/fb_io_fops.c b/drivers/video/fbdev/core/fb_io_fops.c
index 5985e5e1b040c..871b829521af3 100644
--- a/drivers/video/fbdev/core/fb_io_fops.c
+++ b/drivers/video/fbdev/core/fb_io_fops.c
@@ -131,3 +131,6 @@ ssize_t fb_io_write(struct fb_info *info, const char __user *buf, size_t count,
 	return (cnt) ? cnt : err;
 }
 EXPORT_SYMBOL(fb_io_write);
+
+MODULE_DESCRIPTION("Fbdev helpers for framebuffers in I/O memory");
+MODULE_LICENSE("GPL");
-- 
2.42.0

