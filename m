Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C4B4B722992
	for <lists+linux-omap@lfdr.de>; Mon,  5 Jun 2023 16:48:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234607AbjFEOsn (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 5 Jun 2023 10:48:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36250 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234585AbjFEOs0 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 5 Jun 2023 10:48:26 -0400
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E7E1BF1;
        Mon,  5 Jun 2023 07:48:24 -0700 (PDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out2.suse.de (Postfix) with ESMTPS id 8D0E21F8D4;
        Mon,  5 Jun 2023 14:48:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1685976503; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=iPujHv22di3dsdNbubVF4J0weZ+H5873bWSXmBhXjpA=;
        b=WNPAtOl5s5dbzzcr9ayGXVVipMHWSAbizLadV20Uz6TUohyjNSv/pDpPLV7CiMT+Y8PcsT
        oDQqVm54YWL+powR3s3oIb+uPJmH4ZLVz7i/9PcC11vK3Z3cQk9OjDCjk9/6Z7q710UWmw
        rQ9M3RBcVEYAQ+hnq4J9ezrL/kYmoWY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1685976503;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=iPujHv22di3dsdNbubVF4J0weZ+H5873bWSXmBhXjpA=;
        b=fQI1tZt25h/jS6PWKURIpDtMjJCHNkJ+MtwGvjMCj+28d7vRpFxlagzbFu9rtZGuRTP/RY
        hzMs+Th2jdarCtDA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 4920F13A3C;
        Mon,  5 Jun 2023 14:48:23 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id qJj5ELf1fWQvXwAAMHmgww
        (envelope-from <tzimmermann@suse.de>); Mon, 05 Jun 2023 14:48:23 +0000
From:   Thomas Zimmermann <tzimmermann@suse.de>
To:     daniel@ffwll.ch, javierm@redhat.com, sam@ravnborg.org,
        deller@gmx.de, geert+renesas@glider.be, lee@kernel.org,
        daniel.thompson@linaro.org, jingoohan1@gmail.com
Cc:     linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-sh@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-staging@lists.linux.dev,
        Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 29/30] fbdev/core: Rework fb init code
Date:   Mon,  5 Jun 2023 16:48:11 +0200
Message-Id: <20230605144812.15241-30-tzimmermann@suse.de>
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

Init the class "graphics" before the rest of fbdev. Later steps, such
as the sysfs code, depend on the class. Also arrange the module's exit
code in reverse order.

Unexport the global variable fb_class, which is only shared internally
within the fbdev core module.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/video/fbdev/core/fb_internal.h |  1 +
 drivers/video/fbdev/core/fbcon.c       |  1 +
 drivers/video/fbdev/core/fbmem.c       | 52 ++++++++++----------------
 include/linux/fb.h                     |  1 -
 4 files changed, 22 insertions(+), 33 deletions(-)

diff --git a/drivers/video/fbdev/core/fb_internal.h b/drivers/video/fbdev/core/fb_internal.h
index abe06c9da36e..0b43c0cd5096 100644
--- a/drivers/video/fbdev/core/fb_internal.h
+++ b/drivers/video/fbdev/core/fb_internal.h
@@ -11,6 +11,7 @@ int fb_register_chrdev(void);
 void fb_unregister_chrdev(void);
 
 /* fbmem.c */
+extern struct class *fb_class;
 extern struct mutex registration_lock;
 extern struct fb_info *registered_fb[FB_MAX];
 extern int num_registered_fb;
diff --git a/drivers/video/fbdev/core/fbcon.c b/drivers/video/fbdev/core/fbcon.c
index c6c9d040bdec..8e76bc246b38 100644
--- a/drivers/video/fbdev/core/fbcon.c
+++ b/drivers/video/fbdev/core/fbcon.c
@@ -78,6 +78,7 @@
 #include <asm/irq.h>
 
 #include "fbcon.h"
+#include "fb_internal.h"
 
 /*
  * FIXME: Locking
diff --git a/drivers/video/fbdev/core/fbmem.c b/drivers/video/fbdev/core/fbmem.c
index 2d26ac46337b..b21b66017c01 100644
--- a/drivers/video/fbdev/core/fbmem.c
+++ b/drivers/video/fbdev/core/fbmem.c
@@ -45,6 +45,8 @@
 
 #define FBPIXMAPSIZE	(1024 * 8)
 
+struct class *fb_class;
+
 DEFINE_MUTEX(registration_lock);
 struct fb_info *registered_fb[FB_MAX] __read_mostly;
 int num_registered_fb __read_mostly;
@@ -897,9 +899,6 @@ fb_blank(struct fb_info *info, int blank)
 }
 EXPORT_SYMBOL(fb_blank);
 
-struct class *fb_class;
-EXPORT_SYMBOL(fb_class);
-
 static int fb_check_foreignness(struct fb_info *fi)
 {
 	const bool foreign_endian = fi->flags & FBINFO_FOREIGN_ENDIAN;
@@ -1106,59 +1105,48 @@ void fb_set_suspend(struct fb_info *info, int state)
 }
 EXPORT_SYMBOL(fb_set_suspend);
 
-/**
- *	fbmem_init - init frame buffer subsystem
- *
- *	Initialize the frame buffer subsystem.
- *
- *	NOTE: This function is _only_ to be called by drivers/char/mem.c.
- *
- */
-
-static int __init
-fbmem_init(void)
+static int __init fbmem_init(void)
 {
 	int ret;
 
+	fb_class = class_create("graphics");
+	if (IS_ERR(fb_class)) {
+		ret = PTR_ERR(fb_class);
+		pr_err("Unable to create fb class; errno = %d\n", ret);
+		goto err_fb_class;
+	}
+
 	ret = fb_init_procfs();
 	if (ret)
-		return ret;
+		goto err_class_destroy;
 
 	ret = fb_register_chrdev();
 	if (ret)
-		goto err_chrdev;
-
-	fb_class = class_create("graphics");
-	if (IS_ERR(fb_class)) {
-		ret = PTR_ERR(fb_class);
-		pr_warn("Unable to create fb class; errno = %d\n", ret);
-		fb_class = NULL;
-		goto err_class;
-	}
+		goto err_fb_cleanup_procfs;
 
 	fb_console_init();
 
 	return 0;
 
-err_class:
-	fb_unregister_chrdev();
-err_chrdev:
+err_fb_cleanup_procfs:
 	fb_cleanup_procfs();
+err_class_destroy:
+	class_destroy(fb_class);
+err_fb_class:
+	fb_class = NULL;
 	return ret;
 }
 
 #ifdef MODULE
-module_init(fbmem_init);
-static void __exit
-fbmem_exit(void)
+static void __exit fbmem_exit(void)
 {
 	fb_console_exit();
-
+	fb_unregister_chrdev();
 	fb_cleanup_procfs();
 	class_destroy(fb_class);
-	fb_unregister_chrdev();
 }
 
+module_init(fbmem_init);
 module_exit(fbmem_exit);
 MODULE_LICENSE("GPL");
 MODULE_DESCRIPTION("Framebuffer base");
diff --git a/include/linux/fb.h b/include/linux/fb.h
index 1988d11f78bc..541a0e3ce21f 100644
--- a/include/linux/fb.h
+++ b/include/linux/fb.h
@@ -609,7 +609,6 @@ extern int fb_new_modelist(struct fb_info *info);
 
 extern bool fb_center_logo;
 extern int fb_logo_count;
-extern struct class *fb_class;
 
 static inline void lock_fb_info(struct fb_info *info)
 {
-- 
2.40.1

