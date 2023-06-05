Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A5E23722961
	for <lists+linux-omap@lfdr.de>; Mon,  5 Jun 2023 16:48:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234547AbjFEOs3 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 5 Jun 2023 10:48:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36100 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234559AbjFEOsW (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 5 Jun 2023 10:48:22 -0400
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 987C6102;
        Mon,  5 Jun 2023 07:48:20 -0700 (PDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out1.suse.de (Postfix) with ESMTPS id 2AD4921B6D;
        Mon,  5 Jun 2023 14:48:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1685976499; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=dsSyvg8FHtJnoA3BFuRy1iCoC22Drdkx5ZHUod07FX4=;
        b=edzU03M5LZl1lv408SfWkJpayQIyq8qdDwrxzWOo3nS6wZm8ACE/q192Oq8ytGepOuod6G
        d7bw+s+DFx2RUCwhOmZTQ6hcHTnyKmrA3o+UfY13bzcGrteNfbGTTOWOtsU4Isw8JGYKHe
        O0Y9f5jA3VLjlmQXh2kkXYB3q+mxYv0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1685976499;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=dsSyvg8FHtJnoA3BFuRy1iCoC22Drdkx5ZHUod07FX4=;
        b=+y1u0AClw5HvX8rvTk5wcx+i3G+K6AiDhj8Ml0GCyvk1PiddbSse7uZF//+p/3S7m42trl
        p87A4Is9s+kIvVBA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id DCBB113A3C;
        Mon,  5 Jun 2023 14:48:18 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id 0OsTNbL1fWQvXwAAMHmgww
        (envelope-from <tzimmermann@suse.de>); Mon, 05 Jun 2023 14:48:18 +0000
From:   Thomas Zimmermann <tzimmermann@suse.de>
To:     daniel@ffwll.ch, javierm@redhat.com, sam@ravnborg.org,
        deller@gmx.de, geert+renesas@glider.be, lee@kernel.org,
        daniel.thompson@linaro.org, jingoohan1@gmail.com
Cc:     linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-sh@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-staging@lists.linux.dev,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Antonino Daplas <adaplas@gmail.com>
Subject: [PATCH 15/30] fbdev/nvidiafb: Use hardware device as backlight parent
Date:   Mon,  5 Jun 2023 16:47:57 +0200
Message-Id: <20230605144812.15241-16-tzimmermann@suse.de>
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

Use the hardware device in struct fb_info.device as parent of the
backlight device. Aligns the driver with the rest of the codebase
and prepares fbdev for making struct fb_info.dev optional.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Antonino Daplas <adaplas@gmail.com>
---
 drivers/video/fbdev/nvidia/nv_backlight.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/video/fbdev/nvidia/nv_backlight.c b/drivers/video/fbdev/nvidia/nv_backlight.c
index 503a7a683855..160da9c50a52 100644
--- a/drivers/video/fbdev/nvidia/nv_backlight.c
+++ b/drivers/video/fbdev/nvidia/nv_backlight.c
@@ -98,7 +98,7 @@ void nvidia_bl_init(struct nvidia_par *par)
 	memset(&props, 0, sizeof(struct backlight_properties));
 	props.type = BACKLIGHT_RAW;
 	props.max_brightness = FB_BACKLIGHT_LEVELS - 1;
-	bd = backlight_device_register(name, info->dev, par, &nvidia_bl_ops,
+	bd = backlight_device_register(name, info->device, par, &nvidia_bl_ops,
 				       &props);
 	if (IS_ERR(bd)) {
 		info->bl_dev = NULL;
-- 
2.40.1

