Return-Path: <linux-omap+bounces-1955-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 104169582AD
	for <lists+linux-omap@lfdr.de>; Tue, 20 Aug 2024 11:36:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 72C73B24633
	for <lists+linux-omap@lfdr.de>; Tue, 20 Aug 2024 09:36:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 550A918CC1A;
	Tue, 20 Aug 2024 09:35:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="nNru4CrA";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="UFUt/JtZ";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="nNru4CrA";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="UFUt/JtZ"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3583D18DF65;
	Tue, 20 Aug 2024 09:35:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724146514; cv=none; b=iMH9unUxecDf0szdSKatTiZF8Jrhrq46CBvXbe8/8GWhtqUMwbofQpivk8PT4N1A6a4JBrR/+L4HcsCAQLO6m1FC8xaG+NM/9T3yO32Kp8UeCxGx+IfiWuhjndy7xe4IfsuNgJen24bgIvXks9qMYfyAZRk11qAsZYbuzFXS7tw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724146514; c=relaxed/simple;
	bh=zVAI5l+rvMvWthGssMub/cg8ZWuie4ndDMHr6d/5Idw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uIUR4Sjs4Fbg/wE79RAQM0ZvIL5+WESEUdxGA3re5i21L5Yfp7RISFCYiv18ekjoEKQdCxrAIndvs+AXN0BnEO0sThXxSTzGAICLWIHOxKkyxyCO5+tM3b9SG9ymOQl2DeNlnZlSOUmWutZRx2xeVBWjj66mC9LQTJ8m4ZgCKfI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=nNru4CrA; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=UFUt/JtZ; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=nNru4CrA; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=UFUt/JtZ; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 8F95C225B5;
	Tue, 20 Aug 2024 09:35:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1724146510; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=elrB9C7E2DmLnWiL3WWjuoe9Ak8wXSiKuHQyZVEZPBs=;
	b=nNru4CrAxSJR2RtgPw/YAYPseLz1rINlT7nulVPvZZskRaF2+YPVyNejg9mTz+hiAajVGx
	Dg0qiweHOCeJg3IZJ4DPwozhC0kszf3gqb8GKDWHjRch79N+HJje8dXt5u9Bh6Q/pCBS+a
	nTrV7pSlFgYRlXC3Fa11zVaziZNhmrI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1724146510;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=elrB9C7E2DmLnWiL3WWjuoe9Ak8wXSiKuHQyZVEZPBs=;
	b=UFUt/JtZnSb/JUlMmRqBMrOBb8EOfLnmGzC3sO42gZaWv3GnjsnpEMX3ZBFD4VTFIl2oNR
	eWi7cL47VbaT8KDA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1724146510; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=elrB9C7E2DmLnWiL3WWjuoe9Ak8wXSiKuHQyZVEZPBs=;
	b=nNru4CrAxSJR2RtgPw/YAYPseLz1rINlT7nulVPvZZskRaF2+YPVyNejg9mTz+hiAajVGx
	Dg0qiweHOCeJg3IZJ4DPwozhC0kszf3gqb8GKDWHjRch79N+HJje8dXt5u9Bh6Q/pCBS+a
	nTrV7pSlFgYRlXC3Fa11zVaziZNhmrI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1724146510;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=elrB9C7E2DmLnWiL3WWjuoe9Ak8wXSiKuHQyZVEZPBs=;
	b=UFUt/JtZnSb/JUlMmRqBMrOBb8EOfLnmGzC3sO42gZaWv3GnjsnpEMX3ZBFD4VTFIl2oNR
	eWi7cL47VbaT8KDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 2C29313B04;
	Tue, 20 Aug 2024 09:35:10 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id IBWPCU5jxGa3RAAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Tue, 20 Aug 2024 09:35:10 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: lee@kernel.org,
	daniel.thompson@linaro.org,
	jingoohan1@gmail.com,
	deller@gmx.de,
	bonbons@linux-vserver.org,
	jikos@kernel.org,
	bentiss@kernel.org,
	shc_work@mail.ru,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	shawnguo@kernel.org,
	festevam@gmail.com
Cc: dri-devel@lists.freedesktop.org,
	linux-fbdev@vger.kernel.org,
	linux-omap@vger.kernel.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 26/28] backlight: lcd: Replace check_fb with controls_device
Date: Tue, 20 Aug 2024 11:23:04 +0200
Message-ID: <20240820093452.68270-27-tzimmermann@suse.de>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240820093452.68270-1-tzimmermann@suse.de>
References: <20240820093452.68270-1-tzimmermann@suse.de>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: -2.80
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:email,imap1.dmz-prg2.suse.org:helo];
	FREEMAIL_TO(0.00)[kernel.org,linaro.org,gmail.com,gmx.de,linux-vserver.org,mail.ru,pengutronix.de];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	R_RATELIMIT(0.00)[to_ip_from(RL7eb4yoy35resap1sns3bbybe),to(RLr3u6jgwj9sedc854c38mga)];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FREEMAIL_ENVRCPT(0.00)[gmail.com,gmx.de,mail.ru]
X-Spam-Flag: NO
X-Spam-Level: 

Rename check_fb in struct lcd_ops with controls_device. The callback
is not independent from fbdev's struct fb_info and tests is an lcd
device controls a hardware display device. The new naming and semantics
follow similar funcionality for backlight devices.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/video/backlight/lcd.c          |  2 +-
 drivers/video/backlight/platform_lcd.c | 11 +++++------
 include/linux/lcd.h                    | 16 ++++++++++++----
 3 files changed, 18 insertions(+), 11 deletions(-)

diff --git a/drivers/video/backlight/lcd.c b/drivers/video/backlight/lcd.c
index edd5ccb7a43a..269ca9061df4 100644
--- a/drivers/video/backlight/lcd.c
+++ b/drivers/video/backlight/lcd.c
@@ -55,7 +55,7 @@ static int fb_notifier_callback(struct notifier_block *self,
 
 	if (!ld->ops)
 		goto out;
-	if (ld->ops->check_fb && !ld->ops->check_fb(ld, evdata->info))
+	if (ld->ops->controls_device && !ld->ops->controls_device(ld, info->device))
 		goto out;
 	if (fb_lcd && fb_lcd != ld)
 		goto out;
diff --git a/drivers/video/backlight/platform_lcd.c b/drivers/video/backlight/platform_lcd.c
index 69a22d1a8a35..c9fe50f4d8ed 100644
--- a/drivers/video/backlight/platform_lcd.c
+++ b/drivers/video/backlight/platform_lcd.c
@@ -9,7 +9,6 @@
 
 #include <linux/module.h>
 #include <linux/platform_device.h>
-#include <linux/fb.h>
 #include <linux/lcd.h>
 #include <linux/slab.h>
 
@@ -50,17 +49,17 @@ static int platform_lcd_set_power(struct lcd_device *lcd, int power)
 	return 0;
 }
 
-static int platform_lcd_match(struct lcd_device *lcd, struct fb_info *info)
+static bool platform_lcd_controls_device(struct lcd_device *lcd, struct device *display_device)
 {
 	struct platform_lcd *plcd = to_our_lcd(lcd);
 
-	return plcd->us->parent == info->device;
+	return plcd->us->parent == display_device;
 }
 
 static const struct lcd_ops platform_lcd_ops = {
-	.get_power	= platform_lcd_get_power,
-	.set_power	= platform_lcd_set_power,
-	.check_fb	= platform_lcd_match,
+	.get_power		= platform_lcd_get_power,
+	.set_power		= platform_lcd_set_power,
+	.controls_device	= platform_lcd_controls_device,
 };
 
 static int platform_lcd_probe(struct platform_device *pdev)
diff --git a/include/linux/lcd.h b/include/linux/lcd.h
index dfcc54d327f5..8399b5ed48f2 100644
--- a/include/linux/lcd.h
+++ b/include/linux/lcd.h
@@ -35,7 +35,6 @@
  */
 
 struct lcd_device;
-struct fb_info;
 
 struct lcd_properties {
 	/* The maximum value for contrast (read-only) */
@@ -54,9 +53,18 @@ struct lcd_ops {
         int (*set_contrast)(struct lcd_device *, int contrast);
 	/* Set LCD panel mode (resolutions ...) */
 	int (*set_mode)(struct lcd_device *, struct fb_videomode *);
-	/* Check if given framebuffer device is the one LCD is bound to;
-	   return 0 if not, !=0 if it is. If NULL, lcd always matches the fb. */
-	int (*check_fb)(struct lcd_device *, struct fb_info *);
+
+	/*
+	 * Check if the LCD controls the given display device. This
+	 * operation is optional and if not implemented it is assumed that
+	 * the display is always the one controlled by the LCD.
+	 *
+	 * RETURNS:
+	 *
+	 * If display_dev is NULL or display_dev matches the device controlled by
+	 * the LCD, return true. Otherwise return false.
+	 */
+	bool (*controls_device)(struct lcd_device *lcd, struct device *display_device);
 };
 
 struct lcd_device {
-- 
2.46.0


