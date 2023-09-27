Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E14F27AFCC8
	for <lists+linux-omap@lfdr.de>; Wed, 27 Sep 2023 09:48:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230115AbjI0HsE (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 27 Sep 2023 03:48:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40390 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230117AbjI0Hrh (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 27 Sep 2023 03:47:37 -0400
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 25AC31B3;
        Wed, 27 Sep 2023 00:47:36 -0700 (PDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out1.suse.de (Postfix) with ESMTPS id D28ED218DF;
        Wed, 27 Sep 2023 07:47:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1695800854; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=u3eRdS85xwPQzBuwJ54dspR9cbt48tPp46vdNh1wjsk=;
        b=WBdRDS1btysNCgwlgznFfPl70efEpbrCr4Tcv25lls+aMwgz2+dfAZPgRKWNd8kuXiCxt5
        JcLewc0AZXfg1lRNvuPhT+IFIUSgOlq4S4rhq3R7Ttd8P2QXco6mvwnNU4dyJS/7IZHN3s
        GBa/qat9H7Ce3fvcPDL+NkL3r9YigAg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1695800854;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=u3eRdS85xwPQzBuwJ54dspR9cbt48tPp46vdNh1wjsk=;
        b=8YIepgZd82gcTVo2funY19jpuH62p5/D7vph6egOvw4iuYYt+9iaBIsueRoewIXWLPKJRm
        dtWXYMcypeqLTsBA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 956401338F;
        Wed, 27 Sep 2023 07:47:34 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id 4M+fIxbeE2XvUQAAMHmgww
        (envelope-from <tzimmermann@suse.de>); Wed, 27 Sep 2023 07:47:34 +0000
From:   Thomas Zimmermann <tzimmermann@suse.de>
To:     deller@gmx.de, javierm@redhat.com, sam@ravnborg.org, arnd@arndb.de,
        daniel@ffwll.ch
Cc:     linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org,
        linux-nvidia@lists.surfsouth.com, linux-omap@vger.kernel.org,
        linux-parisc@vger.kernel.org,
        Thomas Zimmermann <tzimmermann@suse.de>,
        "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>
Subject: [PATCH 38/46] fbdev/stifb: Initialize fb_ops to fbdev I/O-memory helpers
Date:   Wed, 27 Sep 2023 09:27:11 +0200
Message-ID: <20230927074722.6197-39-tzimmermann@suse.de>
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
Cc: "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>
---
 drivers/video/fbdev/Kconfig | 1 +
 drivers/video/fbdev/stifb.c | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/drivers/video/fbdev/Kconfig b/drivers/video/fbdev/Kconfig
index b018f10ad07fc..a7587f680e3a2 100644
--- a/drivers/video/fbdev/Kconfig
+++ b/drivers/video/fbdev/Kconfig
@@ -384,6 +384,7 @@ config FB_STI
 	select FB_CFB_FILLRECT
 	select FB_CFB_COPYAREA
 	select FB_CFB_IMAGEBLIT
+	select FB_IOMEM_FOPS
 	select STI_CORE
 	default y
 	help
diff --git a/drivers/video/fbdev/stifb.c b/drivers/video/fbdev/stifb.c
index c746deb79afce..548d992f8cb18 100644
--- a/drivers/video/fbdev/stifb.c
+++ b/drivers/video/fbdev/stifb.c
@@ -1167,12 +1167,14 @@ stifb_init_display(struct stifb_info *fb)
 
 static const struct fb_ops stifb_ops = {
 	.owner		= THIS_MODULE,
+	__FB_DEFAULT_IOMEM_OPS_RDWR,
 	.fb_check_var	= stifb_check_var,
 	.fb_setcolreg	= stifb_setcolreg,
 	.fb_blank	= stifb_blank,
 	.fb_fillrect	= stifb_fillrect,
 	.fb_copyarea	= stifb_copyarea,
 	.fb_imageblit	= cfb_imageblit,
+	__FB_DEFAULT_IOMEM_OPS_MMAP,
 };
 
 
-- 
2.42.0

