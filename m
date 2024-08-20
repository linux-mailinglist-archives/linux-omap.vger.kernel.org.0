Return-Path: <linux-omap+bounces-1937-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CFFD958287
	for <lists+linux-omap@lfdr.de>; Tue, 20 Aug 2024 11:35:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 075821F2475B
	for <lists+linux-omap@lfdr.de>; Tue, 20 Aug 2024 09:35:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7CD1218C902;
	Tue, 20 Aug 2024 09:35:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="tucuGKcX";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="BjGrD95e";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="tucuGKcX";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="BjGrD95e"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69E8E18C335;
	Tue, 20 Aug 2024 09:35:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724146506; cv=none; b=dkjslEOtB7ajjDEsAOillUDUh2GxDnwAPXWa0KsXuz1BIMHJnXNpfRS0iWeD9OGBJqEFEIG51LpZKzV+aEQzn7+5zwJp+tMwOmi18yNJSJLc2n7iNwOonCmcbYCD/SjgObqObh1BySHpsiYaaspagG5ijya/9yJ31QeJdit6s3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724146506; c=relaxed/simple;
	bh=3t1KncPrzEQCETO5Dcpf/FWeTV1oUjF8e+F4DUCsZls=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qMNsnFef8DDtsw7UbYqcEWl0nCdcZA4ZYNulZGw1DRiWhgO41Gg8ij+glQGGiFFnmFRVpwDaEpvLOFxC2Ud6BUfh5+7OoEKwUBgBFotH3k4ZgEoEw39FFf4XU3/uKlqSTROnRZ/DUOEeWCf9END/dehkVKCOQyWKxi54hcZS550=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=tucuGKcX; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=BjGrD95e; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=tucuGKcX; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=BjGrD95e; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 9E8912253C;
	Tue, 20 Aug 2024 09:35:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1724146502; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Vc0oSdYwNPuT4YePHAttBkJ8X8lZEvKJKOd984+7yMM=;
	b=tucuGKcX5yp6tfDMyqH97Y9EfM4+x04bSRtvhp4T8bfPQ82JH0wAmK4BZ61vuc1XuNleaU
	WelL4QDBFMP2PuHgKrseyNXOVPMQrAaj9SXW/aWyWQLfjnkS6lNHP6do3fZBE03Mkg1h/D
	psZemsG98g7iZwor6O0RV3A6LM1tyoU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1724146502;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Vc0oSdYwNPuT4YePHAttBkJ8X8lZEvKJKOd984+7yMM=;
	b=BjGrD95e7NN1DR4VUsMyiR5Du7aoIIWU0CMrqEMgmvy4rpWjKa1pKPudPHJQzQm+EHz+td
	fqr/P30HvMdzvbDw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1724146502; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Vc0oSdYwNPuT4YePHAttBkJ8X8lZEvKJKOd984+7yMM=;
	b=tucuGKcX5yp6tfDMyqH97Y9EfM4+x04bSRtvhp4T8bfPQ82JH0wAmK4BZ61vuc1XuNleaU
	WelL4QDBFMP2PuHgKrseyNXOVPMQrAaj9SXW/aWyWQLfjnkS6lNHP6do3fZBE03Mkg1h/D
	psZemsG98g7iZwor6O0RV3A6LM1tyoU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1724146502;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Vc0oSdYwNPuT4YePHAttBkJ8X8lZEvKJKOd984+7yMM=;
	b=BjGrD95e7NN1DR4VUsMyiR5Du7aoIIWU0CMrqEMgmvy4rpWjKa1pKPudPHJQzQm+EHz+td
	fqr/P30HvMdzvbDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 38BC113AFE;
	Tue, 20 Aug 2024 09:35:02 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id aFWaDEZjxGa3RAAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Tue, 20 Aug 2024 09:35:02 +0000
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
Subject: [PATCH 07/28] backlight: ili9320: Use lcd power constants
Date: Tue, 20 Aug 2024 11:22:45 +0200
Message-ID: <20240820093452.68270-8-tzimmermann@suse.de>
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
X-Spam-Level: 
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:mid,imap1.dmz-prg2.suse.org:helo];
	FREEMAIL_TO(0.00)[kernel.org,linaro.org,gmail.com,gmx.de,linux-vserver.org,mail.ru,pengutronix.de];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	R_RATELIMIT(0.00)[to_ip_from(RL7eb4yoy35resap1sns3bbybe)];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FREEMAIL_ENVRCPT(0.00)[gmail.com,gmx.de,mail.ru]
X-Spam-Score: -2.80
X-Spam-Flag: NO

Replace FB_BLANK_ constants with their counterparts from the
lcd subsystem. The values are identical, so there's no change
in functionality.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/video/backlight/ili9320.c | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/drivers/video/backlight/ili9320.c b/drivers/video/backlight/ili9320.c
index 3e318d1891b6..2df96a882119 100644
--- a/drivers/video/backlight/ili9320.c
+++ b/drivers/video/backlight/ili9320.c
@@ -10,7 +10,6 @@
 
 #include <linux/delay.h>
 #include <linux/err.h>
-#include <linux/fb.h>
 #include <linux/init.h>
 #include <linux/lcd.h>
 #include <linux/module.h>
@@ -121,7 +120,7 @@ static inline int ili9320_power_off(struct ili9320 *lcd)
 	return 0;
 }
 
-#define POWER_IS_ON(pwr)	((pwr) <= FB_BLANK_NORMAL)
+#define POWER_IS_ON(pwr)	((pwr) <= LCD_POWER_REDUCED)
 
 static int ili9320_power(struct ili9320 *lcd, int power)
 {
@@ -223,7 +222,7 @@ int ili9320_probe_spi(struct spi_device *spi,
 
 	ili->dev = dev;
 	ili->client = client;
-	ili->power = FB_BLANK_POWERDOWN;
+	ili->power = LCD_POWER_OFF;
 	ili->platdata = cfg;
 
 	spi_set_drvdata(spi, ili);
@@ -241,7 +240,7 @@ int ili9320_probe_spi(struct spi_device *spi,
 
 	dev_info(dev, "initialising %s\n", client->name);
 
-	ret = ili9320_power(ili, FB_BLANK_UNBLANK);
+	ret = ili9320_power(ili, LCD_POWER_ON);
 	if (ret != 0) {
 		dev_err(dev, "failed to set lcd power state\n");
 		return ret;
@@ -253,7 +252,7 @@ EXPORT_SYMBOL_GPL(ili9320_probe_spi);
 
 void ili9320_remove(struct ili9320 *ili)
 {
-	ili9320_power(ili, FB_BLANK_POWERDOWN);
+	ili9320_power(ili, LCD_POWER_OFF);
 }
 EXPORT_SYMBOL_GPL(ili9320_remove);
 
@@ -262,7 +261,7 @@ int ili9320_suspend(struct ili9320 *lcd)
 {
 	int ret;
 
-	ret = ili9320_power(lcd, FB_BLANK_POWERDOWN);
+	ret = ili9320_power(lcd, LCD_POWER_OFF);
 
 	if (lcd->platdata->suspend == ILI9320_SUSPEND_DEEP) {
 		ili9320_write(lcd, ILI9320_POWER1, lcd->power1 |
@@ -282,7 +281,7 @@ int ili9320_resume(struct ili9320 *lcd)
 	if (lcd->platdata->suspend == ILI9320_SUSPEND_DEEP)
 		ili9320_write(lcd, ILI9320_POWER1, 0x00);
 
-	return ili9320_power(lcd, FB_BLANK_UNBLANK);
+	return ili9320_power(lcd, LCD_POWER_ON);
 }
 EXPORT_SYMBOL_GPL(ili9320_resume);
 #endif
@@ -290,7 +289,7 @@ EXPORT_SYMBOL_GPL(ili9320_resume);
 /* Power down all displays on reboot, poweroff or halt */
 void ili9320_shutdown(struct ili9320 *lcd)
 {
-	ili9320_power(lcd, FB_BLANK_POWERDOWN);
+	ili9320_power(lcd, LCD_POWER_OFF);
 }
 EXPORT_SYMBOL_GPL(ili9320_shutdown);
 
-- 
2.46.0


