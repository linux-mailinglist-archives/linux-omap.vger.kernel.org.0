Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0CEB5722946
	for <lists+linux-omap@lfdr.de>; Mon,  5 Jun 2023 16:48:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230298AbjFEOsX (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 5 Jun 2023 10:48:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36158 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234214AbjFEOsT (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 5 Jun 2023 10:48:19 -0400
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 11136FD;
        Mon,  5 Jun 2023 07:48:18 -0700 (PDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out2.suse.de (Postfix) with ESMTPS id ACCD01FE64;
        Mon,  5 Jun 2023 14:48:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1685976496; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=aNOsnTCXGxo4lhDmbd6GlKilpcUQ1gl7UIJ+9Mi53Zo=;
        b=W3jfr2dIowXlbSQkDVjLDSEu+Ru5M/278EqRF6xi06kuxa4ADpThoAFT8+FgvJw8iGiRvU
        S9xhKlKuQiuwJH6NxfsXXGw7ovirOo4BOD73rh5nDvEFc1n0e08/IGdnSNdouVYy0fBBzm
        +PKcQXm0Bh8kOOZorozqohzSR2l/tBw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1685976496;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=aNOsnTCXGxo4lhDmbd6GlKilpcUQ1gl7UIJ+9Mi53Zo=;
        b=fkAPy2DV8cqrdHbwkvk9CDox1RCsN+s3JJ3L7nkRMbOQr09KUgWyNngKT9hfkqxMmm2U1t
        CFRLjRA9kaUKOqAg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 6CD6113A3C;
        Mon,  5 Jun 2023 14:48:16 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id oPO7GbD1fWQvXwAAMHmgww
        (envelope-from <tzimmermann@suse.de>); Mon, 05 Jun 2023 14:48:16 +0000
From:   Thomas Zimmermann <tzimmermann@suse.de>
To:     daniel@ffwll.ch, javierm@redhat.com, sam@ravnborg.org,
        deller@gmx.de, geert+renesas@glider.be, lee@kernel.org,
        daniel.thompson@linaro.org, jingoohan1@gmail.com
Cc:     linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-sh@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-staging@lists.linux.dev,
        Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 06/30] fbdev/aty128fb: Reorder backlight and framebuffer init/cleanup
Date:   Mon,  5 Jun 2023 16:47:48 +0200
Message-Id: <20230605144812.15241-7-tzimmermann@suse.de>
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
 drivers/video/fbdev/aty/aty128fb.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/video/fbdev/aty/aty128fb.c b/drivers/video/fbdev/aty/aty128fb.c
index 36a9ac05a340..b4a49068a522 100644
--- a/drivers/video/fbdev/aty/aty128fb.c
+++ b/drivers/video/fbdev/aty/aty128fb.c
@@ -2028,14 +2028,14 @@ static int aty128_init(struct pci_dev *pdev, const struct pci_device_id *ent)
 	par->asleep = 0;
 	par->lock_blank = 0;
 
+	if (register_framebuffer(info) < 0)
+		return 0;
+
 #ifdef CONFIG_FB_ATY128_BACKLIGHT
 	if (backlight)
 		aty128_bl_init(par);
 #endif
 
-	if (register_framebuffer(info) < 0)
-		return 0;
-
 	fb_info(info, "%s frame buffer device on %s\n",
 		info->fix.id, video_card);
 
@@ -2167,12 +2167,12 @@ static void aty128_remove(struct pci_dev *pdev)
 
 	par = info->par;
 
-	unregister_framebuffer(info);
-
 #ifdef CONFIG_FB_ATY128_BACKLIGHT
 	aty128_bl_exit(info->bl_dev);
 #endif
 
+	unregister_framebuffer(info);
+
 	arch_phys_wc_del(par->wc_cookie);
 	iounmap(par->regbase);
 	iounmap(info->screen_base);
-- 
2.40.1

