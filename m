Return-Path: <linux-omap+bounces-1949-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DB29495829F
	for <lists+linux-omap@lfdr.de>; Tue, 20 Aug 2024 11:36:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 66B4E1F24813
	for <lists+linux-omap@lfdr.de>; Tue, 20 Aug 2024 09:36:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2759918CC14;
	Tue, 20 Aug 2024 09:35:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="I8H8l+s2";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="4ODsUpWy";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="I8H8l+s2";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="4ODsUpWy"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BAAA18CC16;
	Tue, 20 Aug 2024 09:35:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724146510; cv=none; b=M4b5S8JeXOWFKt99b21Zse2YHyU7rUX6BVz4gZjdcSQWpQyCpmpQXLbEuKkCjFUEQSxWSxnqyt0YbD0DJ24UDfkFsZ0QrDJYpMLggDtlUmokRXdW7stXEcqVu5wQ9o98CIxUHOs/w8spbtJ3z18L9n/Y2VlYMmsTdlr7me3AeZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724146510; c=relaxed/simple;
	bh=Q7MIgRmsxnI8V0JcvRW43Iw0FGd+ymDZC/S21G3/8Jw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ecIm8DPeGaThOCGKryvQrsLlwqspzF/jkzRlXH9DLlhlHCFSGrgnSLLhW+vkVQMJwxhpI8iHKPj9Vud9rml1ZxJqfsKOscs/fWr/x4xjFKQ7i9DcryhnrxALUN52QzkJMO0+XFIf6Op82Rv3qHIFz65pnPtVYmXSrvmlKhHUt2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=I8H8l+s2; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=4ODsUpWy; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=I8H8l+s2; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=4ODsUpWy; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id A66B51FFD4;
	Tue, 20 Aug 2024 09:35:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1724146507; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yszzEScJjZotv3L1Gt+Uq/mk86GXKyxTlbBB5UlHLlI=;
	b=I8H8l+s2U4vaFV6hTtDMogV8HMUK0RxHsaCzwQklaJkM44d7lAFn4MLNqS+j6Wy9lt0We3
	YBMdacrKxUg2Fbs5sOGXxCce1exl5wSemVtDyi7312ZOV6W5H+aWqUE6eG322pHuNHazqT
	8R5pyoOAy6SI43EHHm2FTNdTnBjZehw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1724146507;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yszzEScJjZotv3L1Gt+Uq/mk86GXKyxTlbBB5UlHLlI=;
	b=4ODsUpWyz+IWv653NvXtkYGBxWtHG/qVRilZnFfF+wO6wtefie4hsmkhSiGNBEydYdXbGa
	KbmYZgA2EOZ2cjCQ==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=I8H8l+s2;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=4ODsUpWy
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1724146507; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yszzEScJjZotv3L1Gt+Uq/mk86GXKyxTlbBB5UlHLlI=;
	b=I8H8l+s2U4vaFV6hTtDMogV8HMUK0RxHsaCzwQklaJkM44d7lAFn4MLNqS+j6Wy9lt0We3
	YBMdacrKxUg2Fbs5sOGXxCce1exl5wSemVtDyi7312ZOV6W5H+aWqUE6eG322pHuNHazqT
	8R5pyoOAy6SI43EHHm2FTNdTnBjZehw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1724146507;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yszzEScJjZotv3L1Gt+Uq/mk86GXKyxTlbBB5UlHLlI=;
	b=4ODsUpWyz+IWv653NvXtkYGBxWtHG/qVRilZnFfF+wO6wtefie4hsmkhSiGNBEydYdXbGa
	KbmYZgA2EOZ2cjCQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 47C5413AFE;
	Tue, 20 Aug 2024 09:35:07 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id sJ9KEEtjxGa3RAAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Tue, 20 Aug 2024 09:35:07 +0000
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
Subject: [PATCH 19/28] backlight: tdo24m: Use lcd power constants
Date: Tue, 20 Aug 2024 11:22:57 +0200
Message-ID: <20240820093452.68270-20-tzimmermann@suse.de>
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
X-Rspamd-Queue-Id: A66B51FFD4
X-Spam-Level: 
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
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
	R_RATELIMIT(0.00)[to(RLr3u6jgwj9sedc854c38mga),to_ip_from(RLk469idygq4891mojaqehp6ty)];
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
 drivers/video/backlight/tdo24m.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/video/backlight/tdo24m.c b/drivers/video/backlight/tdo24m.c
index c413b3c68e95..a14a94114e9d 100644
--- a/drivers/video/backlight/tdo24m.c
+++ b/drivers/video/backlight/tdo24m.c
@@ -16,7 +16,7 @@
 #include <linux/lcd.h>
 #include <linux/slab.h>
 
-#define POWER_IS_ON(pwr)	((pwr) <= FB_BLANK_NORMAL)
+#define POWER_IS_ON(pwr)	((pwr) <= LCD_POWER_REDUCED)
 
 #define TDO24M_SPI_BUFF_SIZE	(4)
 #define MODE_QVGA	0
@@ -354,7 +354,7 @@ static int tdo24m_probe(struct spi_device *spi)
 		return -ENOMEM;
 
 	lcd->spi_dev = spi;
-	lcd->power = FB_BLANK_POWERDOWN;
+	lcd->power = LCD_POWER_OFF;
 	lcd->mode = MODE_VGA;	/* default to VGA */
 
 	lcd->buf = devm_kzalloc(&spi->dev, TDO24M_SPI_BUFF_SIZE, GFP_KERNEL);
@@ -390,7 +390,7 @@ static int tdo24m_probe(struct spi_device *spi)
 		return PTR_ERR(lcd->lcd_dev);
 
 	spi_set_drvdata(spi, lcd);
-	err = tdo24m_power(lcd, FB_BLANK_UNBLANK);
+	err = tdo24m_power(lcd, LCD_POWER_ON);
 	if (err)
 		return err;
 
@@ -401,7 +401,7 @@ static void tdo24m_remove(struct spi_device *spi)
 {
 	struct tdo24m *lcd = spi_get_drvdata(spi);
 
-	tdo24m_power(lcd, FB_BLANK_POWERDOWN);
+	tdo24m_power(lcd, LCD_POWER_OFF);
 }
 
 #ifdef CONFIG_PM_SLEEP
@@ -409,14 +409,14 @@ static int tdo24m_suspend(struct device *dev)
 {
 	struct tdo24m *lcd = dev_get_drvdata(dev);
 
-	return tdo24m_power(lcd, FB_BLANK_POWERDOWN);
+	return tdo24m_power(lcd, LCD_POWER_OFF);
 }
 
 static int tdo24m_resume(struct device *dev)
 {
 	struct tdo24m *lcd = dev_get_drvdata(dev);
 
-	return tdo24m_power(lcd, FB_BLANK_UNBLANK);
+	return tdo24m_power(lcd, LCD_POWER_ON);
 }
 #endif
 
@@ -427,7 +427,7 @@ static void tdo24m_shutdown(struct spi_device *spi)
 {
 	struct tdo24m *lcd = spi_get_drvdata(spi);
 
-	tdo24m_power(lcd, FB_BLANK_POWERDOWN);
+	tdo24m_power(lcd, LCD_POWER_OFF);
 }
 
 static struct spi_driver tdo24m_driver = {
-- 
2.46.0


