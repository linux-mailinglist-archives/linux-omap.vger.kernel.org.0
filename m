Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5B349722950
	for <lists+linux-omap@lfdr.de>; Mon,  5 Jun 2023 16:48:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233098AbjFEOsZ (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 5 Jun 2023 10:48:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36102 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232467AbjFEOsU (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 5 Jun 2023 10:48:20 -0400
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 168B110A;
        Mon,  5 Jun 2023 07:48:19 -0700 (PDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out2.suse.de (Postfix) with ESMTPS id 7DA981FE68;
        Mon,  5 Jun 2023 14:48:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1685976497; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=0uHJvrhLmzEPeOw0RdHMUnyLLXBwhpaTKMuUOa6/rKg=;
        b=jdbqMTPVxe2umwJpgenWffNE8eBkkevM+AM+G7kF4OpReYzjMLhnxeqnJj4jc8DHT166kn
        LjaVpyGoTCogoKKxL1kGY5m9ebi9Fi1itkV/b05+T8EP1uRimGM5cpSd5vxeTF3N431PAl
        9L3x56iueavE2C3jaxZAguR75wXyqBA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1685976497;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=0uHJvrhLmzEPeOw0RdHMUnyLLXBwhpaTKMuUOa6/rKg=;
        b=95a7bhQjT3Q/ZJetDlQaICVFwSQT21/o5P+dE/EGgKRVRHOgWsXvMzNWVAVwzaQlPUMKoU
        81WK2XQFmTBqvcCA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 3EE35139C8;
        Mon,  5 Jun 2023 14:48:17 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id AMCGDrH1fWQvXwAAMHmgww
        (envelope-from <tzimmermann@suse.de>); Mon, 05 Jun 2023 14:48:17 +0000
From:   Thomas Zimmermann <tzimmermann@suse.de>
To:     daniel@ffwll.ch, javierm@redhat.com, sam@ravnborg.org,
        deller@gmx.de, geert+renesas@glider.be, lee@kernel.org,
        daniel.thompson@linaro.org, jingoohan1@gmail.com
Cc:     linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-sh@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-staging@lists.linux.dev,
        Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 09/30] fbdev/ep93xx-fb: Alloc DMA memory from hardware device
Date:   Mon,  5 Jun 2023 16:47:51 +0200
Message-Id: <20230605144812.15241-10-tzimmermann@suse.de>
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

Pass the hardware device to the DMA helpers dma_alloc_wc(), dma_mmap_wc()
and dma_free_coherent(). The fbdev device that is currently being used is
a software device and does not provide DMA memory.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/video/fbdev/ep93xx-fb.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/video/fbdev/ep93xx-fb.c b/drivers/video/fbdev/ep93xx-fb.c
index 94fe52928be2..376ee59e925c 100644
--- a/drivers/video/fbdev/ep93xx-fb.c
+++ b/drivers/video/fbdev/ep93xx-fb.c
@@ -312,7 +312,7 @@ static int ep93xxfb_mmap(struct fb_info *info, struct vm_area_struct *vma)
 	unsigned int offset = vma->vm_pgoff << PAGE_SHIFT;
 
 	if (offset < info->fix.smem_len) {
-		return dma_mmap_wc(info->dev, vma, info->screen_base,
+		return dma_mmap_wc(info->device, vma, info->screen_base,
 				   info->fix.smem_start, info->fix.smem_len);
 	}
 
@@ -423,7 +423,7 @@ static int ep93xxfb_alloc_videomem(struct fb_info *info)
 	/* Maximum 16bpp -> used memory is maximum x*y*2 bytes */
 	fb_size = EP93XXFB_MAX_XRES * EP93XXFB_MAX_YRES * 2;
 
-	virt_addr = dma_alloc_wc(info->dev, fb_size, &phys_addr, GFP_KERNEL);
+	virt_addr = dma_alloc_wc(info->device, fb_size, &phys_addr, GFP_KERNEL);
 	if (!virt_addr)
 		return -ENOMEM;
 
@@ -440,7 +440,7 @@ static int ep93xxfb_alloc_videomem(struct fb_info *info)
 			"has bit 27 set: cannot init framebuffer\n",
 			phys_addr);
 
-		dma_free_coherent(info->dev, fb_size, virt_addr, phys_addr);
+		dma_free_coherent(info->device, fb_size, virt_addr, phys_addr);
 		return -ENOMEM;
 	}
 
@@ -454,7 +454,7 @@ static int ep93xxfb_alloc_videomem(struct fb_info *info)
 static void ep93xxfb_dealloc_videomem(struct fb_info *info)
 {
 	if (info->screen_base)
-		dma_free_coherent(info->dev, info->fix.smem_len,
+		dma_free_coherent(info->device, info->fix.smem_len,
 				  info->screen_base, info->fix.smem_start);
 }
 
-- 
2.40.1

