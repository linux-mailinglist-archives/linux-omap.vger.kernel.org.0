Return-Path: <linux-omap+bounces-2133-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CCF296ECD4
	for <lists+linux-omap@lfdr.de>; Fri,  6 Sep 2024 09:55:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 514E61F282A1
	for <lists+linux-omap@lfdr.de>; Fri,  6 Sep 2024 07:55:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0409D15699E;
	Fri,  6 Sep 2024 07:54:51 +0000 (UTC)
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5591B156641;
	Fri,  6 Sep 2024 07:54:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725609290; cv=none; b=VP+yDbbDed5uZ+0c2Izo8EYqlx59Bm/mjw7E+m8/mem/DsMG424P1lHRL4rCj8GbgtLUZwn9oUrotr01t/Y/O+8tXlYhWlQK+dwF0AFxOhLQd7/N6LEXF1K0lmx9tRMsOVatA/DXTwV1+wju9FHOBMmjY+PL95fYT3g9NgDbA+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725609290; c=relaxed/simple;
	bh=1n32e7VJajooMoeDLyu8waNJ92upeDSPGgmCtX7E8Js=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CzfUsH0T5T4zAl5+pW2ECRLDeFJTyiLWulWzEsb9efc2fl4AqYFLjcxBo325zNSHADNEFtdHuNdwvvCFf7Z3Z75yWAiuWAw1whhd9qNAEmoZX+lCcZsFm0lEZae1jzrOhvsPGV1r8C/6KECkAaB/v98zurBr3TeJp2jy83YLNLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id B582021ABD;
	Fri,  6 Sep 2024 07:54:47 +0000 (UTC)
Authentication-Results: smtp-out1.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 58FA613A7A;
	Fri,  6 Sep 2024 07:54:47 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id OMeCFEe12mbGPAAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Fri, 06 Sep 2024 07:54:47 +0000
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
Subject: [PATCH v2 14/28] backlight: ltv350qv: Use lcd power constants
Date: Fri,  6 Sep 2024 09:52:28 +0200
Message-ID: <20240906075439.98476-15-tzimmermann@suse.de>
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
X-Rspamd-Queue-Id: B582021ABD
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


