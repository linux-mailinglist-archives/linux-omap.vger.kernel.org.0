Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 97ADA752224
	for <lists+linux-omap@lfdr.de>; Thu, 13 Jul 2023 15:03:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234597AbjGMNDs (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 13 Jul 2023 09:03:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40480 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234076AbjGMNDo (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 13 Jul 2023 09:03:44 -0400
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6929B1BEB;
        Thu, 13 Jul 2023 06:03:43 -0700 (PDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out2.suse.de (Postfix) with ESMTPS id 20AC11F45A;
        Thu, 13 Jul 2023 13:03:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1689253422; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=sWCVV7wJiemOx2M9P2wz1m/QXnYnbGSsQYJ48wiDA5o=;
        b=G3PYzma+GnPXsWDQcWEiJv7+6N0jkIzvIqL3XrkAaNDI5dGI8oCyGDegIPMBEhOO6zso9c
        K5VThQHBuOhXlprpuD0nN/dF79tpjdwwkTSMKFCLf145LdCAaSa7mwQ+6NYpUz5Y4s5PAn
        tEbKa6k8zUIs+FVcjuyiTVPw1uhIoY4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1689253422;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=sWCVV7wJiemOx2M9P2wz1m/QXnYnbGSsQYJ48wiDA5o=;
        b=WeSOcLCLUIdHcwsbiId4esnjfTG+ztdeDfD2PYzOsAG3OUq0C7SYad86to4wDt0BZzV2cu
        qQ29qEYIeql73fBw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 9AA8D13A94;
        Thu, 13 Jul 2023 13:03:41 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id OGKbJC32r2TVPgAAMHmgww
        (envelope-from <tzimmermann@suse.de>); Thu, 13 Jul 2023 13:03:41 +0000
From:   Thomas Zimmermann <tzimmermann@suse.de>
To:     deller@gmx.de, javierm@redhat.com
Cc:     linux-sh@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
        linux-input@vger.kernel.org, linux-media@vger.kernel.org,
        linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        linux-geode@lists.infradead.org, linux-nvidia@lists.surfsouth.com,
        linux-hyperv@vger.kernel.org, linux-omap@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Sam Ravnborg <sam@ravnborg.org>,
        Patrik Jakobsson <patrik.r.jakobsson@gmail.com>,
        Alex Deucher <alexander.deucher@amd.com>,
        =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
        "Pan, Xinhui" <Xinhui.Pan@amd.com>
Subject: [PATCH v2 01/18] drm: Remove flag FBINFO_DEFAULT from fbdev emulation
Date:   Thu, 13 Jul 2023 14:58:21 +0200
Message-ID: <20230713130338.31086-2-tzimmermann@suse.de>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230713130338.31086-1-tzimmermann@suse.de>
References: <20230713130338.31086-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

The flag FBINFO_DEFAULT is 0 and has no effect, as struct fbinfo.flags
has been allocated to zero by framebuffer_alloc(). So do not set it.

Flags should signal differences from the default values. After cleaning
up all occurrences of FBINFO_DEFAULT, the token will be removed.

v2:
	* fix commit message (Miguel)

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Acked-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: "Christian König" <christian.koenig@amd.com>
Cc: "Pan, Xinhui" <Xinhui.Pan@amd.com>
---
 drivers/gpu/drm/drm_fbdev_dma.c       | 1 -
 drivers/gpu/drm/drm_fbdev_generic.c   | 1 -
 drivers/gpu/drm/gma500/fbdev.c        | 2 +-
 drivers/gpu/drm/radeon/radeon_fbdev.c | 2 +-
 4 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/drm_fbdev_dma.c b/drivers/gpu/drm/drm_fbdev_dma.c
index f9b1f7cd31b7..ee7c265b0585 100644
--- a/drivers/gpu/drm/drm_fbdev_dma.c
+++ b/drivers/gpu/drm/drm_fbdev_dma.c
@@ -123,7 +123,6 @@ static int drm_fbdev_dma_helper_fb_probe(struct drm_fb_helper *fb_helper,
 	drm_fb_helper_fill_info(info, fb_helper, sizes);
 
 	info->fbops = &drm_fbdev_dma_fb_ops;
-	info->flags = FBINFO_DEFAULT;
 
 	/* screen */
 	info->flags |= FBINFO_VIRTFB; /* system memory */
diff --git a/drivers/gpu/drm/drm_fbdev_generic.c b/drivers/gpu/drm/drm_fbdev_generic.c
index b9343fb6cf13..a0ea042b1526 100644
--- a/drivers/gpu/drm/drm_fbdev_generic.c
+++ b/drivers/gpu/drm/drm_fbdev_generic.c
@@ -109,7 +109,6 @@ static int drm_fbdev_generic_helper_fb_probe(struct drm_fb_helper *fb_helper,
 	drm_fb_helper_fill_info(info, fb_helper, sizes);
 
 	info->fbops = &drm_fbdev_generic_fb_ops;
-	info->flags = FBINFO_DEFAULT;
 
 	/* screen */
 	info->flags |= FBINFO_VIRTFB | FBINFO_READS_FAST;
diff --git a/drivers/gpu/drm/gma500/fbdev.c b/drivers/gpu/drm/gma500/fbdev.c
index 054426549fc6..be8f5fbd5260 100644
--- a/drivers/gpu/drm/gma500/fbdev.c
+++ b/drivers/gpu/drm/gma500/fbdev.c
@@ -215,7 +215,7 @@ static int psb_fbdev_fb_probe(struct drm_fb_helper *fb_helper,
 	}
 
 	info->fbops = &psb_fbdev_fb_ops;
-	info->flags = FBINFO_DEFAULT;
+
 	/* Accessed stolen memory directly */
 	info->screen_base = dev_priv->vram_addr + backing->offset;
 	info->screen_size = size;
diff --git a/drivers/gpu/drm/radeon/radeon_fbdev.c b/drivers/gpu/drm/radeon/radeon_fbdev.c
index f941e2e7cae6..68c06ac9acce 100644
--- a/drivers/gpu/drm/radeon/radeon_fbdev.c
+++ b/drivers/gpu/drm/radeon/radeon_fbdev.c
@@ -253,7 +253,7 @@ static int radeon_fbdev_fb_helper_fb_probe(struct drm_fb_helper *fb_helper,
 	}
 
 	info->fbops = &radeon_fbdev_fb_ops;
-	info->flags = FBINFO_DEFAULT;
+
 	/* radeon resume is fragile and needs a vt switch to help it along */
 	info->skip_vt_switch = false;
 
-- 
2.41.0

