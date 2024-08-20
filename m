Return-Path: <linux-omap+bounces-1936-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AC018958285
	for <lists+linux-omap@lfdr.de>; Tue, 20 Aug 2024 11:35:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2EBE51F244A0
	for <lists+linux-omap@lfdr.de>; Tue, 20 Aug 2024 09:35:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 092A918C35F;
	Tue, 20 Aug 2024 09:35:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Q0zFiOh6";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="6WSGggca";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Q0zFiOh6";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="6WSGggca"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FD9418C32D;
	Tue, 20 Aug 2024 09:35:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724146505; cv=none; b=dajjrnM4pOL1C1a/wUHz1GUWh6N9uBN39p1yGZzvJfvkug92uSjas4QdmgD3GuPl1ZlWvscRZsXDfy9s59s4OJ3yWGOLDMCHYKec1TYd5+j10wTrcXeCziS+9dGKIKQAroxUGPsW5hWmDnIzEx4HVMI1DCYhuqLqnI8kvr+Po68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724146505; c=relaxed/simple;
	bh=Jlpm9S34M0xnhFy9Nc5mC+t/j1LqE8WtCccH0R0auMQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KRRROZMKhsEf9gKxdMwNaBLM9FlgYeddZVKxZviSI5SwgqoVClqjqHeZlgSXUC25teRsSjO/OSVLBqdMF5/X6/cYFdjD31s1HN6zx8Ber5MlwgrchvhI2f48z8hyaFNIdLEV1gBym/OxTLrXcn0nbklMf3P5rIaKQJzf5ZREJdU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Q0zFiOh6; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=6WSGggca; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Q0zFiOh6; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=6WSGggca; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 330CB2257F;
	Tue, 20 Aug 2024 09:35:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1724146502; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qGuoG0grcL5zeyINwuFzsAdWI0SDH5KECH5wbmGURFQ=;
	b=Q0zFiOh6tCoA0Ysf7ZzpQYtqS6kjjzDxZhnx8LxVZFw7kELKn7Rm8tScBxY3dFiez/jb5Q
	5ezjs88hRvjvvCJAljWux2mizBCFHnEXG0taH3GvOW/s4zzz6g1r/awASy0C2OMk2KLKIP
	JJAeSBCEB7wO+Io4UQL7fkLzT89/Y0Q=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1724146502;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qGuoG0grcL5zeyINwuFzsAdWI0SDH5KECH5wbmGURFQ=;
	b=6WSGggcaxsHoSH9BHBYH//Lqi9a3u2ACPOGHEa+fX1fE+1EvHbNFqW4g12IGs4R7WDJ9w9
	4J1K0oIvm81bd/BQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1724146502; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qGuoG0grcL5zeyINwuFzsAdWI0SDH5KECH5wbmGURFQ=;
	b=Q0zFiOh6tCoA0Ysf7ZzpQYtqS6kjjzDxZhnx8LxVZFw7kELKn7Rm8tScBxY3dFiez/jb5Q
	5ezjs88hRvjvvCJAljWux2mizBCFHnEXG0taH3GvOW/s4zzz6g1r/awASy0C2OMk2KLKIP
	JJAeSBCEB7wO+Io4UQL7fkLzT89/Y0Q=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1724146502;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qGuoG0grcL5zeyINwuFzsAdWI0SDH5KECH5wbmGURFQ=;
	b=6WSGggcaxsHoSH9BHBYH//Lqi9a3u2ACPOGHEa+fX1fE+1EvHbNFqW4g12IGs4R7WDJ9w9
	4J1K0oIvm81bd/BQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id C85A313770;
	Tue, 20 Aug 2024 09:35:01 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id YENkL0VjxGa3RAAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Tue, 20 Aug 2024 09:35:01 +0000
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
Subject: [PATCH 06/28] backlight: ili922x: Use lcd power constants
Date: Tue, 20 Aug 2024 11:22:44 +0200
Message-ID: <20240820093452.68270-7-tzimmermann@suse.de>
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
	R_RATELIMIT(0.00)[to_ip_from(RL7eb4yoy35resap1sns3bbybe)];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FREEMAIL_ENVRCPT(0.00)[gmail.com,gmx.de,mail.ru]
X-Spam-Flag: NO
X-Spam-Level: 

Replace FB_BLANK_ constants with their counterparts from the
lcd subsystem. The values are identical, so there's no change
in functionality.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/video/backlight/ili922x.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/video/backlight/ili922x.c b/drivers/video/backlight/ili922x.c
index 7683e209ad6b..5e1bf0c5831f 100644
--- a/drivers/video/backlight/ili922x.c
+++ b/drivers/video/backlight/ili922x.c
@@ -8,7 +8,6 @@
  * memory is cyclically updated over the RGB interface.
  */
 
-#include <linux/fb.h>
 #include <linux/delay.h>
 #include <linux/errno.h>
 #include <linux/init.h>
@@ -119,7 +118,7 @@
 
 #define CMD_BUFSIZE		16
 
-#define POWER_IS_ON(pwr)	((pwr) <= FB_BLANK_NORMAL)
+#define POWER_IS_ON(pwr)	((pwr) <= LCD_POWER_REDUCED)
 
 #define set_tx_byte(b)		(tx_invert ? ~(b) : b)
 
@@ -513,7 +512,7 @@ static int ili922x_probe(struct spi_device *spi)
 
 	ili922x_display_init(spi);
 
-	ili->power = FB_BLANK_POWERDOWN;
+	ili->power = LCD_POWER_OFF;
 
 	lcd = devm_lcd_device_register(&spi->dev, "ili922xlcd", &spi->dev, ili,
 					&ili922x_ops);
@@ -525,7 +524,7 @@ static int ili922x_probe(struct spi_device *spi)
 	ili->ld = lcd;
 	spi_set_drvdata(spi, ili);
 
-	ili922x_lcd_power(ili, FB_BLANK_UNBLANK);
+	ili922x_lcd_power(ili, LCD_POWER_ON);
 
 	return 0;
 }
-- 
2.46.0


