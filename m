Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0B2C0722938
	for <lists+linux-omap@lfdr.de>; Mon,  5 Jun 2023 16:48:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234517AbjFEOsU (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 5 Jun 2023 10:48:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36088 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233765AbjFEOsS (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 5 Jun 2023 10:48:18 -0400
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7FF79F1;
        Mon,  5 Jun 2023 07:48:17 -0700 (PDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out2.suse.de (Postfix) with ESMTPS id 22F121FD76;
        Mon,  5 Jun 2023 14:48:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1685976496; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=CCx/dUe5OxwgFGTh2cN0tz4CX+UMv9VY6aqqNukRliQ=;
        b=hX+RpPR6FQKJCa5vubNQMMVx/SXeS8/2r/DXXXzZ+2DK27tyFIMq8hwkcNPqnC4cchqWsj
        mmtxVKNfpcCIbpgab4cuWtEaoLpfSLqRdHUm8PsRvxhPkqDreQ0SGnyt91D9xIc1Qvbqgj
        cbVTOqtOPJN5BgFP524GbsVWFmY+ffE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1685976496;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=CCx/dUe5OxwgFGTh2cN0tz4CX+UMv9VY6aqqNukRliQ=;
        b=miI5026hEzMTKuCL4Uy7gHQ6G5JVR3CJ8Sv6nQheM3LmwtnvSh+sDC6tTmwFl7TAy89Mjs
        buAZxivqDsrSnhAQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id D6C88139C8;
        Mon,  5 Jun 2023 14:48:15 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id yIKLM6/1fWQvXwAAMHmgww
        (envelope-from <tzimmermann@suse.de>); Mon, 05 Jun 2023 14:48:15 +0000
From:   Thomas Zimmermann <tzimmermann@suse.de>
To:     daniel@ffwll.ch, javierm@redhat.com, sam@ravnborg.org,
        deller@gmx.de, geert+renesas@glider.be, lee@kernel.org,
        daniel.thompson@linaro.org, jingoohan1@gmail.com
Cc:     linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-sh@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-staging@lists.linux.dev,
        Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 04/30] fbdev/atyfb: Reorder backlight and framebuffer init/cleanup
Date:   Mon,  5 Jun 2023 16:47:46 +0200
Message-Id: <20230605144812.15241-5-tzimmermann@suse.de>
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

The driver's backlight code requires the framebuffer to be
registered. Therefore reorder the init and cleanup calls for
both data structures.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/video/fbdev/aty/atyfb_base.c | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/drivers/video/fbdev/aty/atyfb_base.c b/drivers/video/fbdev/aty/atyfb_base.c
index cba2b113b28b..51504fe39054 100644
--- a/drivers/video/fbdev/aty/atyfb_base.c
+++ b/drivers/video/fbdev/aty/atyfb_base.c
@@ -2654,11 +2654,6 @@ static int aty_init(struct fb_info *info)
 			   USE_F32KHZ | TRISTATE_MEM_EN, par);
 	} else
 #endif
-	if (M64_HAS(MOBIL_BUS) && backlight) {
-#ifdef CONFIG_FB_ATY_BACKLIGHT
-		aty_bl_init(par);
-#endif
-	}
 
 	memset(&var, 0, sizeof(var));
 #ifdef CONFIG_PPC
@@ -2751,6 +2746,12 @@ static int aty_init(struct fb_info *info)
 		goto aty_init_exit;
 	}
 
+	if (M64_HAS(MOBIL_BUS) && backlight) {
+#ifdef CONFIG_FB_ATY_BACKLIGHT
+		aty_bl_init(par);
+#endif
+	}
+
 	fb_list = info;
 
 	PRINTKI("fb%d: %s frame buffer device on %s\n",
@@ -3716,12 +3717,13 @@ static void atyfb_remove(struct fb_info *info)
 	aty_set_crtc(par, &par->saved_crtc);
 	par->pll_ops->set_pll(info, &par->saved_pll);
 
-	unregister_framebuffer(info);
-
 #ifdef CONFIG_FB_ATY_BACKLIGHT
 	if (M64_HAS(MOBIL_BUS))
 		aty_bl_exit(info->bl_dev);
 #endif
+
+	unregister_framebuffer(info);
+
 	arch_phys_wc_del(par->wc_cookie);
 
 #ifndef __sparc__
-- 
2.40.1

