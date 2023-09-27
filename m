Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6FF867AFC82
	for <lists+linux-omap@lfdr.de>; Wed, 27 Sep 2023 09:47:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230161AbjI0Hrq (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 27 Sep 2023 03:47:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40468 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230086AbjI0Hrd (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 27 Sep 2023 03:47:33 -0400
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4DA8E1B9;
        Wed, 27 Sep 2023 00:47:30 -0700 (PDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out1.suse.de (Postfix) with ESMTPS id 8719A2189E;
        Wed, 27 Sep 2023 07:47:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1695800847; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=OTRgjt9ZIxQ8wFm8yqaudH0Dvs4qJ3X/F+C81dN1guQ=;
        b=sYF7UICBTy0vHY1RyJPAlA/aq8R43iAqGRyyQbQn6HlCwyrqMk8CDtO3diRr3KjCpU/D2r
        ib7lWJZC1nnddEvkcLoXun0UWfPzgBLoF7VglTcXyX7XzHLuoQumW2+uPmFkxMPP0nUdbv
        lrm67Bldhg57WlLVdgkq+lUaScHRj5g=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1695800847;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=OTRgjt9ZIxQ8wFm8yqaudH0Dvs4qJ3X/F+C81dN1guQ=;
        b=4vFlmY7+NBgSDYMmfYbgJIlF4r5PrRXijodYHhO6rr3WXbZjdW80JijDaTHCTIrKb2YMjw
        rjRTZp+IH73pilCw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 503D413A74;
        Wed, 27 Sep 2023 07:47:27 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id SBCzEg/eE2XvUQAAMHmgww
        (envelope-from <tzimmermann@suse.de>); Wed, 27 Sep 2023 07:47:27 +0000
From:   Thomas Zimmermann <tzimmermann@suse.de>
To:     deller@gmx.de, javierm@redhat.com, sam@ravnborg.org, arnd@arndb.de,
        daniel@ffwll.ch
Cc:     linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org,
        linux-nvidia@lists.surfsouth.com, linux-omap@vger.kernel.org,
        linux-parisc@vger.kernel.org,
        Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 11/46] fbdev/controlfb: Initialize fb_ops to fbdev I/O-memory helpers
Date:   Wed, 27 Sep 2023 09:26:44 +0200
Message-ID: <20230927074722.6197-12-tzimmermann@suse.de>
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
 drivers/video/fbdev/Kconfig     | 4 +---
 drivers/video/fbdev/controlfb.c | 5 ++---
 2 files changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/video/fbdev/Kconfig b/drivers/video/fbdev/Kconfig
index 5f8ba796aa382..499403f69329f 100644
--- a/drivers/video/fbdev/Kconfig
+++ b/drivers/video/fbdev/Kconfig
@@ -309,9 +309,7 @@ config FB_OF
 config FB_CONTROL
 	bool "Apple \"control\" display support"
 	depends on (FB = y) && ((PPC_PMAC && PPC32) || COMPILE_TEST)
-	select FB_CFB_FILLRECT
-	select FB_CFB_COPYAREA
-	select FB_CFB_IMAGEBLIT
+	select FB_IOMEM_HELPERS
 	select FB_MACMODES
 	help
 	  This driver supports a frame buffer for the graphics adapter in the
diff --git a/drivers/video/fbdev/controlfb.c b/drivers/video/fbdev/controlfb.c
index 717134c141ffe..5c5284e8ae0e9 100644
--- a/drivers/video/fbdev/controlfb.c
+++ b/drivers/video/fbdev/controlfb.c
@@ -755,15 +755,14 @@ static int controlfb_mmap(struct fb_info *info,
 
 static const struct fb_ops controlfb_ops = {
 	.owner		= THIS_MODULE,
+	__FB_DEFAULT_IOMEM_OPS_RDWR,
 	.fb_check_var	= controlfb_check_var,
 	.fb_set_par	= controlfb_set_par,
 	.fb_setcolreg	= controlfb_setcolreg,
 	.fb_pan_display = controlfb_pan_display,
 	.fb_blank	= controlfb_blank,
+	__FB_DEFAULT_IOMEM_OPS_DRAW,
 	.fb_mmap	= controlfb_mmap,
-	.fb_fillrect	= cfb_fillrect,
-	.fb_copyarea	= cfb_copyarea,
-	.fb_imageblit	= cfb_imageblit,
 };
 
 /*
-- 
2.42.0

