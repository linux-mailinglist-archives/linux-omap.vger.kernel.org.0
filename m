Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3C429722984
	for <lists+linux-omap@lfdr.de>; Mon,  5 Jun 2023 16:48:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234582AbjFEOsf (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 5 Jun 2023 10:48:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36252 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234214AbjFEOsZ (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 5 Jun 2023 10:48:25 -0400
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D75F10A;
        Mon,  5 Jun 2023 07:48:23 -0700 (PDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out2.suse.de (Postfix) with ESMTPS id 474AF1FE64;
        Mon,  5 Jun 2023 14:48:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1685976502; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=rqAX52qqfRpLpzevjcJesS/XiruCZ8o7V+8ke3hghE0=;
        b=Np1z6TTZJ4b+i5TKaSo4gJkFXlV3BSsE8ict59pZkp61lYgz6tqV4I7pZxtTYbcbBuG6m0
        BIymcDBSj92pbao+ZJRDGJ7YXvTc4ainyVjetfC2u7MhAjOl2Ck8jHp+ycjVSp2ZEzWeew
        smji6XkDQe+zR+jBJhpC394Gmq9XpSA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1685976502;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=rqAX52qqfRpLpzevjcJesS/XiruCZ8o7V+8ke3hghE0=;
        b=VVI1faeeAgA1PmNreHoq5qVSkbWStPcsOPw4pwVLCtgLb9h3nLlbYTvDC1jYikAWxyA01/
        QP0z9GpDUGAsA7BA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 0327E13A3C;
        Mon,  5 Jun 2023 14:48:21 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id QGJyO7X1fWQvXwAAMHmgww
        (envelope-from <tzimmermann@suse.de>); Mon, 05 Jun 2023 14:48:21 +0000
From:   Thomas Zimmermann <tzimmermann@suse.de>
To:     daniel@ffwll.ch, javierm@redhat.com, sam@ravnborg.org,
        deller@gmx.de, geert+renesas@glider.be, lee@kernel.org,
        daniel.thompson@linaro.org, jingoohan1@gmail.com
Cc:     linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-sh@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-staging@lists.linux.dev,
        Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 25/30] fbdev/core: Move framebuffer and backlight helpers into separate files
Date:   Mon,  5 Jun 2023 16:48:07 +0200
Message-Id: <20230605144812.15241-26-tzimmermann@suse.de>
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

Move framebuffer and backlight helpers into separate files. Leave
fbsysfs.c to sysfs-related code. No functional changes.

The framebuffer helpers are not in fbmem.c because they are under
GPL-2.0-or-later copyright, while fbmem.c is GPL-2.0.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/video/fbdev/core/Makefile       |   4 +-
 drivers/video/fbdev/core/fb_backlight.c |  32 +++++++
 drivers/video/fbdev/core/fb_info.c      |  76 ++++++++++++++++
 drivers/video/fbdev/core/fbsysfs.c      | 110 +-----------------------
 4 files changed, 112 insertions(+), 110 deletions(-)
 create mode 100644 drivers/video/fbdev/core/fb_backlight.c
 create mode 100644 drivers/video/fbdev/core/fb_info.c

diff --git a/drivers/video/fbdev/core/Makefile b/drivers/video/fbdev/core/Makefile
index 8f0060160ffb..eee3295bc225 100644
--- a/drivers/video/fbdev/core/Makefile
+++ b/drivers/video/fbdev/core/Makefile
@@ -1,7 +1,9 @@
 # SPDX-License-Identifier: GPL-2.0
 obj-$(CONFIG_FB_NOTIFY)           += fb_notify.o
 obj-$(CONFIG_FB)                  += fb.o
-fb-y                              := fbmem.o fbmon.o fbcmap.o fbsysfs.o \
+fb-y                              := fb_backlight.o \
+                                     fb_info.o \
+                                     fbmem.o fbmon.o fbcmap.o fbsysfs.o \
                                      modedb.o fbcvt.o fb_cmdline.o fb_io_fops.o
 fb-$(CONFIG_FB_DEFERRED_IO)       += fb_defio.o
 
diff --git a/drivers/video/fbdev/core/fb_backlight.c b/drivers/video/fbdev/core/fb_backlight.c
new file mode 100644
index 000000000000..feffe6c68039
--- /dev/null
+++ b/drivers/video/fbdev/core/fb_backlight.c
@@ -0,0 +1,32 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+
+#include <linux/export.h>
+#include <linux/fb.h>
+
+#if IS_ENABLED(CONFIG_FB_BACKLIGHT)
+/*
+ * This function generates a linear backlight curve
+ *
+ *     0: off
+ *   1-7: min
+ * 8-127: linear from min to max
+ */
+void fb_bl_default_curve(struct fb_info *fb_info, u8 off, u8 min, u8 max)
+{
+	unsigned int i, flat, count, range = (max - min);
+
+	mutex_lock(&fb_info->bl_curve_mutex);
+
+	fb_info->bl_curve[0] = off;
+
+	for (flat = 1; flat < (FB_BACKLIGHT_LEVELS / 16); ++flat)
+		fb_info->bl_curve[flat] = min;
+
+	count = FB_BACKLIGHT_LEVELS * 15 / 16;
+	for (i = 0; i < count; ++i)
+		fb_info->bl_curve[flat + i] = min + (range * (i + 1) / count);
+
+	mutex_unlock(&fb_info->bl_curve_mutex);
+}
+EXPORT_SYMBOL_GPL(fb_bl_default_curve);
+#endif
diff --git a/drivers/video/fbdev/core/fb_info.c b/drivers/video/fbdev/core/fb_info.c
new file mode 100644
index 000000000000..fb5b75009ee7
--- /dev/null
+++ b/drivers/video/fbdev/core/fb_info.c
@@ -0,0 +1,76 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+
+#include <linux/export.h>
+#include <linux/fb.h>
+
+/**
+ * framebuffer_alloc - creates a new frame buffer info structure
+ *
+ * @size: size of driver private data, can be zero
+ * @dev: pointer to the device for this fb, this can be NULL
+ *
+ * Creates a new frame buffer info structure. Also reserves @size bytes
+ * for driver private data (info->par). info->par (if any) will be
+ * aligned to sizeof(long).
+ *
+ * Returns the new structure, or NULL if an error occurred.
+ *
+ */
+struct fb_info *framebuffer_alloc(size_t size, struct device *dev)
+{
+#define BYTES_PER_LONG (BITS_PER_LONG/8)
+#define PADDING (BYTES_PER_LONG - (sizeof(struct fb_info) % BYTES_PER_LONG))
+	int fb_info_size = sizeof(struct fb_info);
+	struct fb_info *info;
+	char *p;
+
+	if (size)
+		fb_info_size += PADDING;
+
+	p = kzalloc(fb_info_size + size, GFP_KERNEL);
+
+	if (!p)
+		return NULL;
+
+	info = (struct fb_info *) p;
+
+	if (size)
+		info->par = p + fb_info_size;
+
+	info->device = dev;
+	info->fbcon_rotate_hint = -1;
+
+#if IS_ENABLED(CONFIG_FB_BACKLIGHT)
+	mutex_init(&info->bl_curve_mutex);
+#endif
+
+	return info;
+#undef PADDING
+#undef BYTES_PER_LONG
+}
+EXPORT_SYMBOL(framebuffer_alloc);
+
+/**
+ * framebuffer_release - marks the structure available for freeing
+ *
+ * @info: frame buffer info structure
+ *
+ * Drop the reference count of the device embedded in the
+ * framebuffer info structure.
+ *
+ */
+void framebuffer_release(struct fb_info *info)
+{
+	if (!info)
+		return;
+
+	if (WARN_ON(refcount_read(&info->count)))
+		return;
+
+#if IS_ENABLED(CONFIG_FB_BACKLIGHT)
+	mutex_destroy(&info->bl_curve_mutex);
+#endif
+
+	kfree(info);
+}
+EXPORT_SYMBOL(framebuffer_release);
diff --git a/drivers/video/fbdev/core/fbsysfs.c b/drivers/video/fbdev/core/fbsysfs.c
index 0c33c4adcd79..849073f1ca06 100644
--- a/drivers/video/fbdev/core/fbsysfs.c
+++ b/drivers/video/fbdev/core/fbsysfs.c
@@ -5,93 +5,12 @@
  * Copyright (c) 2004 James Simmons <jsimmons@infradead.org>
  */
 
-/*
- * Note:  currently there's only stubs for framebuffer_alloc and
- * framebuffer_release here.  The reson for that is that until all drivers
- * are converted to use it a sysfsification will open OOPSable races.
- */
-
-#include <linux/kernel.h>
-#include <linux/slab.h>
+#include <linux/console.h>
 #include <linux/fb.h>
 #include <linux/fbcon.h>
-#include <linux/console.h>
-#include <linux/module.h>
 
 #define FB_SYSFS_FLAG_ATTR 1
 
-/**
- * framebuffer_alloc - creates a new frame buffer info structure
- *
- * @size: size of driver private data, can be zero
- * @dev: pointer to the device for this fb, this can be NULL
- *
- * Creates a new frame buffer info structure. Also reserves @size bytes
- * for driver private data (info->par). info->par (if any) will be
- * aligned to sizeof(long).
- *
- * Returns the new structure, or NULL if an error occurred.
- *
- */
-struct fb_info *framebuffer_alloc(size_t size, struct device *dev)
-{
-#define BYTES_PER_LONG (BITS_PER_LONG/8)
-#define PADDING (BYTES_PER_LONG - (sizeof(struct fb_info) % BYTES_PER_LONG))
-	int fb_info_size = sizeof(struct fb_info);
-	struct fb_info *info;
-	char *p;
-
-	if (size)
-		fb_info_size += PADDING;
-
-	p = kzalloc(fb_info_size + size, GFP_KERNEL);
-
-	if (!p)
-		return NULL;
-
-	info = (struct fb_info *) p;
-
-	if (size)
-		info->par = p + fb_info_size;
-
-	info->device = dev;
-	info->fbcon_rotate_hint = -1;
-
-#if IS_ENABLED(CONFIG_FB_BACKLIGHT)
-	mutex_init(&info->bl_curve_mutex);
-#endif
-
-	return info;
-#undef PADDING
-#undef BYTES_PER_LONG
-}
-EXPORT_SYMBOL(framebuffer_alloc);
-
-/**
- * framebuffer_release - marks the structure available for freeing
- *
- * @info: frame buffer info structure
- *
- * Drop the reference count of the device embedded in the
- * framebuffer info structure.
- *
- */
-void framebuffer_release(struct fb_info *info)
-{
-	if (!info)
-		return;
-
-	if (WARN_ON(refcount_read(&info->count)))
-		return;
-
-#if IS_ENABLED(CONFIG_FB_BACKLIGHT)
-	mutex_destroy(&info->bl_curve_mutex);
-#endif
-
-	kfree(info);
-}
-EXPORT_SYMBOL(framebuffer_release);
-
 static int activate(struct fb_info *fb_info, struct fb_var_screeninfo *var)
 {
 	int err;
@@ -551,30 +470,3 @@ void fb_cleanup_device(struct fb_info *fb_info)
 		fb_info->class_flag &= ~FB_SYSFS_FLAG_ATTR;
 	}
 }
-
-#if IS_ENABLED(CONFIG_FB_BACKLIGHT)
-/* This function generates a linear backlight curve
- *
- *     0: off
- *   1-7: min
- * 8-127: linear from min to max
- */
-void fb_bl_default_curve(struct fb_info *fb_info, u8 off, u8 min, u8 max)
-{
-	unsigned int i, flat, count, range = (max - min);
-
-	mutex_lock(&fb_info->bl_curve_mutex);
-
-	fb_info->bl_curve[0] = off;
-
-	for (flat = 1; flat < (FB_BACKLIGHT_LEVELS / 16); ++flat)
-		fb_info->bl_curve[flat] = min;
-
-	count = FB_BACKLIGHT_LEVELS * 15 / 16;
-	for (i = 0; i < count; ++i)
-		fb_info->bl_curve[flat + i] = min + (range * (i + 1) / count);
-
-	mutex_unlock(&fb_info->bl_curve_mutex);
-}
-EXPORT_SYMBOL_GPL(fb_bl_default_curve);
-#endif
-- 
2.40.1

