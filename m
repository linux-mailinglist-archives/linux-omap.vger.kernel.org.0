Return-Path: <linux-omap+bounces-2132-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AFEE096ECD2
	for <lists+linux-omap@lfdr.de>; Fri,  6 Sep 2024 09:55:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6A2DF288D59
	for <lists+linux-omap@lfdr.de>; Fri,  6 Sep 2024 07:55:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE5C914BF8F;
	Fri,  6 Sep 2024 07:54:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="vl5uOj9E";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="T6OyLBCZ";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="vl5uOj9E";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="T6OyLBCZ"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2616156238;
	Fri,  6 Sep 2024 07:54:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725609290; cv=none; b=EcGOLwycprDRPhTWeAeyl2F4YWRYWfwWXi7a6Si9X/vaK9bNaJfR9+k9LzmlHhLhDoRJVyJCMpqlAKEUk5ODSXh1x0A+2D7mOwEgDbopTOzUne/iXVA50PtAQSW4t0TZsEw5Ew5LecTLsg+9/0RdoTUYPk4v7VbYluOKXxexg+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725609290; c=relaxed/simple;
	bh=uH0nAwFByX3eG/B3hT3sbLSSj3t6HBIg+dSucK3qo0w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kfORFXwXyRoYENWU/e6BlcUiiv2Goo4gD9CIv3ZmK17VnWhyS+cSSWcE27hcFQRw7tUj7xQ+YQ4no8UVmlIGN/eOopFqPN7FgvSlIupiAF4nQxSDKkiAOo36ahn5gagv4ArZuT6P6I4qYj16rHVd8uAIf/cLZG7Tw1Wippy3YN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=vl5uOj9E; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=T6OyLBCZ; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=vl5uOj9E; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=T6OyLBCZ; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 609A521AC6;
	Fri,  6 Sep 2024 07:54:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1725609287; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=V7kJSJChbz6R+M0DxNzkHw4mTjtHIKP4Y3cgzPtXLEc=;
	b=vl5uOj9EH/bwT7I6CeGCC5iwD4unTdbdnOFI6xiYKG22Xy7zJ/SBc64VcWw+8F2HW9Kp1j
	VCOaqPlyJaMojOvAXmx9tSHgkToM7/PLlOhn2u+pQaqH0Yz/g8OaghBh0pgJ2hZVYeskPX
	b++m9R4Rm5T7ene8YKFnstrSApcuDqE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1725609287;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=V7kJSJChbz6R+M0DxNzkHw4mTjtHIKP4Y3cgzPtXLEc=;
	b=T6OyLBCZpaDLVvUyX/VntMoOQsYhT1Y91m9qHwfSOHkSvwxOI4laRf5DNjXk3uc35Fs8/9
	u1S9ZXWcmY2e5gAg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1725609287; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=V7kJSJChbz6R+M0DxNzkHw4mTjtHIKP4Y3cgzPtXLEc=;
	b=vl5uOj9EH/bwT7I6CeGCC5iwD4unTdbdnOFI6xiYKG22Xy7zJ/SBc64VcWw+8F2HW9Kp1j
	VCOaqPlyJaMojOvAXmx9tSHgkToM7/PLlOhn2u+pQaqH0Yz/g8OaghBh0pgJ2hZVYeskPX
	b++m9R4Rm5T7ene8YKFnstrSApcuDqE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1725609287;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=V7kJSJChbz6R+M0DxNzkHw4mTjtHIKP4Y3cgzPtXLEc=;
	b=T6OyLBCZpaDLVvUyX/VntMoOQsYhT1Y91m9qHwfSOHkSvwxOI4laRf5DNjXk3uc35Fs8/9
	u1S9ZXWcmY2e5gAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id E7D94136A8;
	Fri,  6 Sep 2024 07:54:46 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id gAZgN0a12mbGPAAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Fri, 06 Sep 2024 07:54:46 +0000
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
Subject: [PATCH v2 13/28] backlight: lms501kf03: Use lcd power constants
Date: Fri,  6 Sep 2024 09:52:27 +0200
Message-ID: <20240906075439.98476-14-tzimmermann@suse.de>
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
X-Spam-Score: -6.80
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
X-Spam-Flag: NO
X-Spam-Level: 

Replace FB_BLANK_ constants with their counterparts from the
lcd subsystem. The values are identical, so there's no change
in functionality.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>
---
 drivers/video/backlight/lms501kf03.c | 23 +++++++++++------------
 1 file changed, 11 insertions(+), 12 deletions(-)

diff --git a/drivers/video/backlight/lms501kf03.c b/drivers/video/backlight/lms501kf03.c
index e051e6b6036e..28721b48b4c7 100644
--- a/drivers/video/backlight/lms501kf03.c
+++ b/drivers/video/backlight/lms501kf03.c
@@ -7,7 +7,6 @@
  */
 
 #include <linux/delay.h>
-#include <linux/fb.h>
 #include <linux/lcd.h>
 #include <linux/module.h>
 #include <linux/spi/spi.h>
@@ -205,7 +204,7 @@ static int lms501kf03_ldi_disable(struct lms501kf03 *lcd)
 
 static int lms501kf03_power_is_on(int power)
 {
-	return (power) <= FB_BLANK_NORMAL;
+	return (power) <= LCD_POWER_REDUCED;
 }
 
 static int lms501kf03_power_on(struct lms501kf03 *lcd)
@@ -294,8 +293,8 @@ static int lms501kf03_set_power(struct lcd_device *ld, int power)
 {
 	struct lms501kf03 *lcd = lcd_get_data(ld);
 
-	if (power != FB_BLANK_UNBLANK && power != FB_BLANK_POWERDOWN &&
-		power != FB_BLANK_NORMAL) {
+	if (power != LCD_POWER_ON && power != LCD_POWER_OFF &&
+		power != LCD_POWER_REDUCED) {
 		dev_err(lcd->dev, "power value should be 0, 1 or 4.\n");
 		return -EINVAL;
 	}
@@ -349,11 +348,11 @@ static int lms501kf03_probe(struct spi_device *spi)
 		 * current lcd status is powerdown and then
 		 * it enables lcd panel.
 		 */
-		lcd->power = FB_BLANK_POWERDOWN;
+		lcd->power = LCD_POWER_OFF;
 
-		lms501kf03_power(lcd, FB_BLANK_UNBLANK);
+		lms501kf03_power(lcd, LCD_POWER_ON);
 	} else {
-		lcd->power = FB_BLANK_UNBLANK;
+		lcd->power = LCD_POWER_ON;
 	}
 
 	spi_set_drvdata(spi, lcd);
@@ -367,7 +366,7 @@ static void lms501kf03_remove(struct spi_device *spi)
 {
 	struct lms501kf03 *lcd = spi_get_drvdata(spi);
 
-	lms501kf03_power(lcd, FB_BLANK_POWERDOWN);
+	lms501kf03_power(lcd, LCD_POWER_OFF);
 }
 
 #ifdef CONFIG_PM_SLEEP
@@ -381,16 +380,16 @@ static int lms501kf03_suspend(struct device *dev)
 	 * when lcd panel is suspend, lcd panel becomes off
 	 * regardless of status.
 	 */
-	return lms501kf03_power(lcd, FB_BLANK_POWERDOWN);
+	return lms501kf03_power(lcd, LCD_POWER_OFF);
 }
 
 static int lms501kf03_resume(struct device *dev)
 {
 	struct lms501kf03 *lcd = dev_get_drvdata(dev);
 
-	lcd->power = FB_BLANK_POWERDOWN;
+	lcd->power = LCD_POWER_OFF;
 
-	return lms501kf03_power(lcd, FB_BLANK_UNBLANK);
+	return lms501kf03_power(lcd, LCD_POWER_ON);
 }
 #endif
 
@@ -401,7 +400,7 @@ static void lms501kf03_shutdown(struct spi_device *spi)
 {
 	struct lms501kf03 *lcd = spi_get_drvdata(spi);
 
-	lms501kf03_power(lcd, FB_BLANK_POWERDOWN);
+	lms501kf03_power(lcd, LCD_POWER_OFF);
 }
 
 static struct spi_driver lms501kf03_driver = {
-- 
2.46.0


