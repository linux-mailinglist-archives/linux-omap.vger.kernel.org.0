Return-Path: <linux-omap+bounces-2129-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C263696ECC9
	for <lists+linux-omap@lfdr.de>; Fri,  6 Sep 2024 09:55:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 451B71F28127
	for <lists+linux-omap@lfdr.de>; Fri,  6 Sep 2024 07:55:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72DB315666B;
	Fri,  6 Sep 2024 07:54:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="zgqjCEuy";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="+6YOrgQ9";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="zgqjCEuy";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="+6YOrgQ9"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87E0C155391;
	Fri,  6 Sep 2024 07:54:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725609289; cv=none; b=LggmNw0AD682bN7vaGfs+hn0ToJkd1CX4rUihNKXsoqIVCmJspXDpHuc96gN2z3Cp9H6mdS1dobqgp4xqG41WZlv/RjgbIwFvQCVEXeN8cwuHDyCBqK4PIOCILPOxCkH/xyQffwMbYEL2l5maKEYu4+i1BA6u1uGELSSQIEhs40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725609289; c=relaxed/simple;
	bh=M/9EFGbjtcOmH1FdgeQVdgGJiRMKqtzW+HPJ/fsSa8Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WxPLlRWuhARJ35/IReVr2ALTOSbsYrcWODoaW7BHjvOxCbI6mNEGGSYVD7sQQmQVI4uhRhOlU0OtZN/vtrk0q6rNAgZ7Eo3SCb0sBvvZIlNcDVLDykdQAuj5HqkCouz8Yz3g5ZDIGnhiEUmMK1ZUnOKcEsPgoiurYuX08kqt3XA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=zgqjCEuy; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=+6YOrgQ9; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=zgqjCEuy; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=+6YOrgQ9; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 0C7D521A52;
	Fri,  6 Sep 2024 07:54:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1725609286; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hkJaRPmiCGND5KtwBLt2WvI/u6hoMLb4kxcBIb1At80=;
	b=zgqjCEuy4J10ZfleOEW2ZCeJriZdPIDCL24e+Pl/VbLdD+bKd1vff37GfaFBg4gK/yUnyl
	fBLCaCdlY4Es1nVrgTOK5tXxuqVci74/kihAhjPfdla34Pg6Vd0vxy0aXIqSYLrDRAifK9
	aJqAFFpxyOucn9WYyiO6LiEut6x7vW4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1725609286;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hkJaRPmiCGND5KtwBLt2WvI/u6hoMLb4kxcBIb1At80=;
	b=+6YOrgQ9QEvRjAcxjsA18IPVj70rYoIMx9eXEL+XyqwM97Z4EBlekQpHDcjtoUHXUIq58D
	wd42NKpKPCrTH/Ag==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1725609286; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hkJaRPmiCGND5KtwBLt2WvI/u6hoMLb4kxcBIb1At80=;
	b=zgqjCEuy4J10ZfleOEW2ZCeJriZdPIDCL24e+Pl/VbLdD+bKd1vff37GfaFBg4gK/yUnyl
	fBLCaCdlY4Es1nVrgTOK5tXxuqVci74/kihAhjPfdla34Pg6Vd0vxy0aXIqSYLrDRAifK9
	aJqAFFpxyOucn9WYyiO6LiEut6x7vW4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1725609286;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hkJaRPmiCGND5KtwBLt2WvI/u6hoMLb4kxcBIb1At80=;
	b=+6YOrgQ9QEvRjAcxjsA18IPVj70rYoIMx9eXEL+XyqwM97Z4EBlekQpHDcjtoUHXUIq58D
	wd42NKpKPCrTH/Ag==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A1D56136A8;
	Fri,  6 Sep 2024 07:54:45 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id WAdDJkW12mbGPAAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Fri, 06 Sep 2024 07:54:45 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: lee@kernel.org,
	daniel.thompson@linaro.org,
	jingoohan1@gmail.com,
	deller@gmx.de,
	bonbons@linux-vserver.org,
	jikos@kernel.org,
	bentiss@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	shawnguo@kernel.org,
	festevam@gmail.com
Cc: dri-devel@lists.freedesktop.org,
	linux-fbdev@vger.kernel.org,
	linux-omap@vger.kernel.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v2 10/28] backlight: l4f00242t03: Use lcd power constants
Date: Fri,  6 Sep 2024 09:52:24 +0200
Message-ID: <20240906075439.98476-11-tzimmermann@suse.de>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240906075439.98476-1-tzimmermann@suse.de>
References: <20240906075439.98476-1-tzimmermann@suse.de>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [-6.80 / 50.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,linaro.org,gmail.com,gmx.de,linux-vserver.org,pengutronix.de];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	R_RATELIMIT(0.00)[to_ip_from(RL7eb4yoy35resap1sns3bbybe)];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FREEMAIL_ENVRCPT(0.00)[gmail.com,gmx.de]
X-Spam-Score: -6.80
X-Spam-Flag: NO

Replace FB_BLANK_ constants with their counterparts from the
lcd subsystem. The values are identical, so there's no change
in functionality.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>
---
 drivers/video/backlight/l4f00242t03.c | 32 +++++++++++++--------------
 1 file changed, 16 insertions(+), 16 deletions(-)

diff --git a/drivers/video/backlight/l4f00242t03.c b/drivers/video/backlight/l4f00242t03.c
index dd0874f8c7ff..5b5887607f16 100644
--- a/drivers/video/backlight/l4f00242t03.c
+++ b/drivers/video/backlight/l4f00242t03.c
@@ -112,40 +112,40 @@ static int l4f00242t03_lcd_power_set(struct lcd_device *ld, int power)
 	const u16 slpin = 0x10;
 	const u16 disoff = 0x28;
 
-	if (power <= FB_BLANK_NORMAL) {
-		if (priv->lcd_state <= FB_BLANK_NORMAL) {
+	if (power <= LCD_POWER_REDUCED) {
+		if (priv->lcd_state <= LCD_POWER_REDUCED) {
 			/* Do nothing, the LCD is running */
-		} else if (priv->lcd_state < FB_BLANK_POWERDOWN) {
+		} else if (priv->lcd_state < LCD_POWER_OFF) {
 			dev_dbg(&spi->dev, "Resuming LCD\n");
 
 			spi_write(spi, (const u8 *)&slpout, sizeof(u16));
 			msleep(60);
 			spi_write(spi, (const u8 *)&dison, sizeof(u16));
 		} else {
-			/* priv->lcd_state == FB_BLANK_POWERDOWN */
+			/* priv->lcd_state == LCD_POWER_OFF */
 			l4f00242t03_lcd_init(spi);
-			priv->lcd_state = FB_BLANK_VSYNC_SUSPEND;
+			priv->lcd_state = LCD_POWER_REDUCED_VSYNC_SUSPEND;
 			l4f00242t03_lcd_power_set(priv->ld, power);
 		}
-	} else if (power < FB_BLANK_POWERDOWN) {
-		if (priv->lcd_state <= FB_BLANK_NORMAL) {
+	} else if (power < LCD_POWER_OFF) {
+		if (priv->lcd_state <= LCD_POWER_REDUCED) {
 			/* Send the display in standby */
 			dev_dbg(&spi->dev, "Standby the LCD\n");
 
 			spi_write(spi, (const u8 *)&disoff, sizeof(u16));
 			msleep(60);
 			spi_write(spi, (const u8 *)&slpin, sizeof(u16));
-		} else if (priv->lcd_state < FB_BLANK_POWERDOWN) {
+		} else if (priv->lcd_state < LCD_POWER_OFF) {
 			/* Do nothing, the LCD is already in standby */
 		} else {
-			/* priv->lcd_state == FB_BLANK_POWERDOWN */
+			/* priv->lcd_state == LCD_POWER_OFF */
 			l4f00242t03_lcd_init(spi);
-			priv->lcd_state = FB_BLANK_UNBLANK;
+			priv->lcd_state = LCD_POWER_ON;
 			l4f00242t03_lcd_power_set(ld, power);
 		}
 	} else {
-		/* power == FB_BLANK_POWERDOWN */
-		if (priv->lcd_state != FB_BLANK_POWERDOWN) {
+		/* power == LCD_POWER_OFF */
+		if (priv->lcd_state != LCD_POWER_OFF) {
 			/* Clear the screen before shutting down */
 			spi_write(spi, (const u8 *)&disoff, sizeof(u16));
 			msleep(60);
@@ -209,8 +209,8 @@ static int l4f00242t03_probe(struct spi_device *spi)
 
 	/* Init the LCD */
 	l4f00242t03_lcd_init(spi);
-	priv->lcd_state = FB_BLANK_VSYNC_SUSPEND;
-	l4f00242t03_lcd_power_set(priv->ld, FB_BLANK_UNBLANK);
+	priv->lcd_state = LCD_POWER_REDUCED_VSYNC_SUSPEND;
+	l4f00242t03_lcd_power_set(priv->ld, LCD_POWER_ON);
 
 	dev_info(&spi->dev, "Epson l4f00242t03 lcd probed.\n");
 
@@ -221,7 +221,7 @@ static void l4f00242t03_remove(struct spi_device *spi)
 {
 	struct l4f00242t03_priv *priv = spi_get_drvdata(spi);
 
-	l4f00242t03_lcd_power_set(priv->ld, FB_BLANK_POWERDOWN);
+	l4f00242t03_lcd_power_set(priv->ld, LCD_POWER_OFF);
 }
 
 static void l4f00242t03_shutdown(struct spi_device *spi)
@@ -229,7 +229,7 @@ static void l4f00242t03_shutdown(struct spi_device *spi)
 	struct l4f00242t03_priv *priv = spi_get_drvdata(spi);
 
 	if (priv)
-		l4f00242t03_lcd_power_set(priv->ld, FB_BLANK_POWERDOWN);
+		l4f00242t03_lcd_power_set(priv->ld, LCD_POWER_OFF);
 
 }
 
-- 
2.46.0


