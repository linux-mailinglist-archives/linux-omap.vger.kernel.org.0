Return-Path: <linux-omap+bounces-2125-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 14CB396ECBB
	for <lists+linux-omap@lfdr.de>; Fri,  6 Sep 2024 09:55:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 77E8AB2639D
	for <lists+linux-omap@lfdr.de>; Fri,  6 Sep 2024 07:55:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2CDE1553B3;
	Fri,  6 Sep 2024 07:54:47 +0000 (UTC)
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01C4115278E;
	Fri,  6 Sep 2024 07:54:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725609287; cv=none; b=KrN197qn/u5achk9Z96UIX9sSL01AxyFCGL3e5rlI+Hmk+Wv4FHuht2+5rqdx4znKdCmJ0ISRTx31fLtP3EaR+vl/g0MVdnckPgvv3R6UVkCs4pANSZYy4uJIYxBLieoX7udW8egK3DU34sa0UIzZk4I8sbJe+0ELXGNX2bd13Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725609287; c=relaxed/simple;
	bh=6L0R8Ybz5nAySgKY5T61nya+XSDB7OgdROILfWI/1m8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BWrmZBO0PcRtFry0VeFIFeOxqoBueK1EOMX5/VOI923qYOVVGRG9mqhs8+7PfQzbR901N4E9UqXwIlCI1BiA9xAxa895fg+JSpaZeXaV7J8n0YOpKr2dMp6UQY1Ffdwp+B1R+lgcAfDmy10P9Km13tTcrw2F6FqS/yV73ChnDHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 51B9121ABD;
	Fri,  6 Sep 2024 07:54:44 +0000 (UTC)
Authentication-Results: smtp-out1.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id E21DA136A8;
	Fri,  6 Sep 2024 07:54:43 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 4N0BNkO12mbGPAAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Fri, 06 Sep 2024 07:54:43 +0000
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
Subject: [PATCH v2 06/28] backlight: ili922x: Use lcd power constants
Date: Fri,  6 Sep 2024 09:52:20 +0200
Message-ID: <20240906075439.98476-7-tzimmermann@suse.de>
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
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Spamd-Result: default: False [-4.00 / 50.00];
	REPLY(-4.00)[]
X-Spam-Flag: NO
X-Spam-Score: -4.00
X-Rspamd-Queue-Id: 51B9121ABD
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Level: 

Replace FB_BLANK_ constants with their counterparts from the
lcd subsystem. The values are identical, so there's no change
in functionality.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>
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


