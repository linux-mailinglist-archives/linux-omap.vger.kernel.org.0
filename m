Return-Path: <linux-omap+bounces-1940-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 269AB95828F
	for <lists+linux-omap@lfdr.de>; Tue, 20 Aug 2024 11:36:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8E4F0B23B74
	for <lists+linux-omap@lfdr.de>; Tue, 20 Aug 2024 09:36:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF15618C324;
	Tue, 20 Aug 2024 09:35:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="CmdJTkjV";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ehkrBKf2";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="VrnH5eF6";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="KSBV65o8"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B304818A952;
	Tue, 20 Aug 2024 09:35:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724146507; cv=none; b=GJSvVbaBWfNfz9KcFWH86iHfrw2tK5SMnc6pt86o/VCQx6QR6ZXG/k2fXaHV6sw23Xb4o7O8oPKWuyeH0vXm3MtFD5n1T2tHVTC+mangyAZx4SBTGHwML94bsIUKw2canayXW7K6kRBYAjjBrNv9E8VrfYkUrRzeAgWQN9Oawu8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724146507; c=relaxed/simple;
	bh=b6cexZNe2/ptChvLO54l5aw8Lu8BNz6QbG+lsRTGJAU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pheIa34NQcOFrMAQwWWhLtc3G/BeGcBe8slJn9JM5nBtUcis2XwdL7UyAqiBG8+GDXlR542wKMf0c7BOyyO7FIF618gmoAoIP50nzyjQPqVqrTPbP70V4BYf/n4hQZwYoQTfo0VGDlEsqWtVE+mcjPMDdzs2horf8Dl0KBnUh5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=CmdJTkjV; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=ehkrBKf2; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=VrnH5eF6; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=KSBV65o8; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id E2BE51FFCC;
	Tue, 20 Aug 2024 09:35:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1724146504; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=t0T2kwmTQqz3SW/2uupIOOVDm1drAWUI9+jqkQEb1Vg=;
	b=CmdJTkjVYXsJS0DhS6SgQ8jOnB+WARfLwv0Z4bjs2T46Wahu/sjO4+XEpirdSK45wR/Lpe
	zvcg/6jnigqm7zXseJynLFkYqJsS8TOi1ArFazOLTEq58ZXt4kELBkzDGd217Mdbd9SZCB
	vX9QyEAZ7t1dGnyX2idw4MAVtW1RpBE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1724146504;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=t0T2kwmTQqz3SW/2uupIOOVDm1drAWUI9+jqkQEb1Vg=;
	b=ehkrBKf2n9ncC8RMFdc0FjV9RTsRo9Wk5ItDE0AABvTgAudKadcpc+nWdooaxif47XLsTn
	uwjeEfjMT3gS8YAQ==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=VrnH5eF6;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=KSBV65o8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1724146503; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=t0T2kwmTQqz3SW/2uupIOOVDm1drAWUI9+jqkQEb1Vg=;
	b=VrnH5eF6kkHVv4xsVJqgTvOLcg37GsaH9wDrywsIKyrIWTFQjrhtaiu/qZNXqDBf68A+46
	uv09t/tYKxwhtZkVh2xlS+JqH8rfD2TaTN/rGbKCpOt4UmPsOPqZoorIH8s6n5L80YXR+x
	emAZKulhdfReomK32SZO7jaPe9xENdI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1724146503;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=t0T2kwmTQqz3SW/2uupIOOVDm1drAWUI9+jqkQEb1Vg=;
	b=KSBV65o8F1+Y2K7o7ri7lTgz9c2U9ylAo2icZe2fF1lFRC2VecoxWA/iamGzui4M3SNl70
	MD+LrgffBzg1tyAQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 8790213770;
	Tue, 20 Aug 2024 09:35:03 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id mOveH0djxGa3RAAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Tue, 20 Aug 2024 09:35:03 +0000
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
Subject: [PATCH 10/28] backlight: l4f00242t03: Use lcd power constants
Date: Tue, 20 Aug 2024 11:22:48 +0200
Message-ID: <20240820093452.68270-11-tzimmermann@suse.de>
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
X-Rspamd-Queue-Id: E2BE51FFCC
X-Spam-Level: 
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	FREEMAIL_TO(0.00)[kernel.org,linaro.org,gmail.com,gmx.de,linux-vserver.org,mail.ru,pengutronix.de];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCPT_COUNT_TWELVE(0.00)[16];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:dkim,suse.de:mid,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	FROM_EQ_ENVFROM(0.00)[];
	R_RATELIMIT(0.00)[to_ip_from(RLk469idygq4891mojaqehp6ty)];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	TO_DN_SOME(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com,gmx.de,mail.ru]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -3.01
X-Spam-Flag: NO

Replace FB_BLANK_ constants with their counterparts from the
lcd subsystem. The values are identical, so there's no change
in functionality.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
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


