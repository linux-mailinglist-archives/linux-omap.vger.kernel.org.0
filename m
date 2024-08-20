Return-Path: <linux-omap+bounces-1943-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id EB9E0958293
	for <lists+linux-omap@lfdr.de>; Tue, 20 Aug 2024 11:36:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1B3641C2452B
	for <lists+linux-omap@lfdr.de>; Tue, 20 Aug 2024 09:36:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39BB218CC13;
	Tue, 20 Aug 2024 09:35:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="kceSStU7";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="fwi1sle0";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="kceSStU7";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="fwi1sle0"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4352018C018;
	Tue, 20 Aug 2024 09:35:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724146508; cv=none; b=CDRczIfFIvZ1xIZUyX/l9YugGFj7o4gvBDBeYLn3569CgrkgthrWsvNTNQWI7okcIBSAgFpwke30Sac564cpzusURS5jR3I/QDQ9NmRXqWToG0gyuGgJpMckN/VOGEl/IC2lz484t7PZTyFh3x5HE+u1tOVMOyBgZTr0Ih4+79M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724146508; c=relaxed/simple;
	bh=9FJhUxiDFcOCNEfhJhmOp4SANisizVdRy6bI6LeGuN4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FKdxBi4o4p8n50XFWXVG5BFFkFarDc0am1ZIP7MqHEbz2L0NdwJeapkWJQxa1aEAHwfiUpG6kCwwjitwipKeQYZovUHtKaQc9eEU+7O8cD9kSrJkIZoMdcfJuoFddJK3pN7SBYcghw7RGYbUri96CQe4lQYfg94DykEcdGLveB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=kceSStU7; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=fwi1sle0; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=kceSStU7; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=fwi1sle0; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 91D3A1FFCF;
	Tue, 20 Aug 2024 09:35:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1724146505; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JlHClxVlB0wR5ulw4rVzp0kpT3nJf/fx0/Y25IZ3Wyk=;
	b=kceSStU7BMEtnq418OAQWxMsjXQBxWVkqSfueTT3jTtR1a1KHrz/BLs48C4luI8XNDEgxG
	qjMPPzAsMerUBFvA5AKJ43C5GDSMCL/zgZhAmMnu5XbGUfPTUIaqHWn7fIgFe0fXuifpBN
	CjxiuKwOBNEMYwWKr5Sw3w0xXsAtj1w=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1724146505;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JlHClxVlB0wR5ulw4rVzp0kpT3nJf/fx0/Y25IZ3Wyk=;
	b=fwi1sle0Qrc3F4t/cgsSV9micDzs7ASyaFDZUu319oHOz2EYL3/OO+rYluzQ0HeiPbrUQs
	AgzUD8Z6gtypFvBw==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=kceSStU7;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=fwi1sle0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1724146505; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JlHClxVlB0wR5ulw4rVzp0kpT3nJf/fx0/Y25IZ3Wyk=;
	b=kceSStU7BMEtnq418OAQWxMsjXQBxWVkqSfueTT3jTtR1a1KHrz/BLs48C4luI8XNDEgxG
	qjMPPzAsMerUBFvA5AKJ43C5GDSMCL/zgZhAmMnu5XbGUfPTUIaqHWn7fIgFe0fXuifpBN
	CjxiuKwOBNEMYwWKr5Sw3w0xXsAtj1w=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1724146505;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JlHClxVlB0wR5ulw4rVzp0kpT3nJf/fx0/Y25IZ3Wyk=;
	b=fwi1sle0Qrc3F4t/cgsSV9micDzs7ASyaFDZUu319oHOz2EYL3/OO+rYluzQ0HeiPbrUQs
	AgzUD8Z6gtypFvBw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 32DB513770;
	Tue, 20 Aug 2024 09:35:05 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id YC4HC0ljxGa3RAAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Tue, 20 Aug 2024 09:35:05 +0000
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
Subject: [PATCH 14/28] backlight: ltv350qv: Use lcd power constants
Date: Tue, 20 Aug 2024 11:22:52 +0200
Message-ID: <20240820093452.68270-15-tzimmermann@suse.de>
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
X-Rspamd-Queue-Id: 91D3A1FFCF
X-Spam-Score: -3.01
X-Rspamd-Action: no action
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:dkim,suse.de:mid,suse.de:email];
	FROM_EQ_ENVFROM(0.00)[];
	R_RATELIMIT(0.00)[to_ip_from(RLk469idygq4891mojaqehp6ty)];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	TO_DN_SOME(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com,gmx.de,mail.ru]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO
X-Spam-Level: 

Replace FB_BLANK_ constants with their counterparts from the
lcd subsystem. The values are identical, so there's no change
in functionality.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/video/backlight/ltv350qv.c | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/drivers/video/backlight/ltv350qv.c b/drivers/video/backlight/ltv350qv.c
index cdc4c087f230..c919b0fe4cd9 100644
--- a/drivers/video/backlight/ltv350qv.c
+++ b/drivers/video/backlight/ltv350qv.c
@@ -6,7 +6,6 @@
  */
 #include <linux/delay.h>
 #include <linux/err.h>
-#include <linux/fb.h>
 #include <linux/init.h>
 #include <linux/lcd.h>
 #include <linux/module.h>
@@ -15,7 +14,7 @@
 
 #include "ltv350qv.h"
 
-#define POWER_IS_ON(pwr)	((pwr) <= FB_BLANK_NORMAL)
+#define POWER_IS_ON(pwr)	((pwr) <= LCD_POWER_REDUCED)
 
 struct ltv350qv {
 	struct spi_device	*spi;
@@ -233,7 +232,7 @@ static int ltv350qv_probe(struct spi_device *spi)
 		return -ENOMEM;
 
 	lcd->spi = spi;
-	lcd->power = FB_BLANK_POWERDOWN;
+	lcd->power = LCD_POWER_OFF;
 	lcd->buffer = devm_kzalloc(&spi->dev, 8, GFP_KERNEL);
 	if (!lcd->buffer)
 		return -ENOMEM;
@@ -245,7 +244,7 @@ static int ltv350qv_probe(struct spi_device *spi)
 
 	lcd->ld = ld;
 
-	ret = ltv350qv_power(lcd, FB_BLANK_UNBLANK);
+	ret = ltv350qv_power(lcd, LCD_POWER_ON);
 	if (ret)
 		return ret;
 
@@ -258,7 +257,7 @@ static void ltv350qv_remove(struct spi_device *spi)
 {
 	struct ltv350qv *lcd = spi_get_drvdata(spi);
 
-	ltv350qv_power(lcd, FB_BLANK_POWERDOWN);
+	ltv350qv_power(lcd, LCD_POWER_OFF);
 }
 
 #ifdef CONFIG_PM_SLEEP
@@ -266,14 +265,14 @@ static int ltv350qv_suspend(struct device *dev)
 {
 	struct ltv350qv *lcd = dev_get_drvdata(dev);
 
-	return ltv350qv_power(lcd, FB_BLANK_POWERDOWN);
+	return ltv350qv_power(lcd, LCD_POWER_OFF);
 }
 
 static int ltv350qv_resume(struct device *dev)
 {
 	struct ltv350qv *lcd = dev_get_drvdata(dev);
 
-	return ltv350qv_power(lcd, FB_BLANK_UNBLANK);
+	return ltv350qv_power(lcd, LCD_POWER_ON);
 }
 #endif
 
@@ -284,7 +283,7 @@ static void ltv350qv_shutdown(struct spi_device *spi)
 {
 	struct ltv350qv *lcd = spi_get_drvdata(spi);
 
-	ltv350qv_power(lcd, FB_BLANK_POWERDOWN);
+	ltv350qv_power(lcd, LCD_POWER_OFF);
 }
 
 static struct spi_driver ltv350qv_driver = {
-- 
2.46.0


