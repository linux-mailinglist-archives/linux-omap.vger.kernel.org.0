Return-Path: <linux-omap+bounces-2128-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D33E696ECC3
	for <lists+linux-omap@lfdr.de>; Fri,  6 Sep 2024 09:55:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7B2DB1F280B7
	for <lists+linux-omap@lfdr.de>; Fri,  6 Sep 2024 07:55:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6985156220;
	Fri,  6 Sep 2024 07:54:48 +0000 (UTC)
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47E5A15532A;
	Fri,  6 Sep 2024 07:54:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725609288; cv=none; b=j01Uxft0uFf/EWjytxaQgLoLGm4u61+J9/0DYoyxxkqRF3nkb65di4HBUHQWjLasnga+TSxfaXd75zA8gZ/RwSwpLqLThSithayMQHmkT/I7snMiYumQ/N29tkerlSBeOjw0T9Z2FWKQLQok+V18VLTtZ3Q4zm1rASub8nbU0kk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725609288; c=relaxed/simple;
	bh=jImh8Bgif7e1JLTzVbhlmwFbweNyMI5cPWDi/VFlC2k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=orNpqaP6RnA0BVgapjDjB47Znrw2h9AOSq4ycvnMQxBr9yHBkqXCvrE+F4O6i2z/xvCbfCvVAfHWlgVZuGQyz+MKC8VFNr95mzN+BDf9s+3EhoXToOyafHyc/bNue2e+T14eDl9E+haFha7qcC/fRPCgO6/hd4bZTuxayFV8mbU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 9CEAC21AC1;
	Fri,  6 Sep 2024 07:54:45 +0000 (UTC)
Authentication-Results: smtp-out1.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 3CF1313A7A;
	Fri,  6 Sep 2024 07:54:45 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id eAWTDUW12mbGPAAAD6G6ig
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
Subject: [PATCH v2 09/28] backlight: jornada720_lcd: Use lcd power constants
Date: Fri,  6 Sep 2024 09:52:23 +0200
Message-ID: <20240906075439.98476-10-tzimmermann@suse.de>
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
X-Rspamd-Queue-Id: 9CEAC21AC1
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
 drivers/video/backlight/jornada720_lcd.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/video/backlight/jornada720_lcd.c b/drivers/video/backlight/jornada720_lcd.c
index 73278f6ace64..31a52dee9060 100644
--- a/drivers/video/backlight/jornada720_lcd.c
+++ b/drivers/video/backlight/jornada720_lcd.c
@@ -6,7 +6,6 @@
  */
 
 #include <linux/device.h>
-#include <linux/fb.h>
 #include <linux/io.h>
 #include <linux/kernel.h>
 #include <linux/lcd.h>
@@ -24,14 +23,14 @@
 
 static int jornada_lcd_get_power(struct lcd_device *ld)
 {
-	return PPSR & PPC_LDD2 ? FB_BLANK_UNBLANK : FB_BLANK_POWERDOWN;
+	return PPSR & PPC_LDD2 ? LCD_POWER_ON : LCD_POWER_OFF;
 }
 
 static int jornada_lcd_get_contrast(struct lcd_device *ld)
 {
 	int ret;
 
-	if (jornada_lcd_get_power(ld) != FB_BLANK_UNBLANK)
+	if (jornada_lcd_get_power(ld) != LCD_POWER_ON)
 		return 0;
 
 	jornada_ssp_start();
@@ -72,7 +71,7 @@ static int jornada_lcd_set_contrast(struct lcd_device *ld, int value)
 
 static int jornada_lcd_set_power(struct lcd_device *ld, int power)
 {
-	if (power != FB_BLANK_UNBLANK) {
+	if (power != LCD_POWER_ON) {
 		PPSR &= ~PPC_LDD2;
 		PPDR |= PPC_LDD2;
 	} else {
@@ -107,7 +106,7 @@ static int jornada_lcd_probe(struct platform_device *pdev)
 
 	/* lets set our default values */
 	jornada_lcd_set_contrast(lcd_device, LCD_DEF_CONTRAST);
-	jornada_lcd_set_power(lcd_device, FB_BLANK_UNBLANK);
+	jornada_lcd_set_power(lcd_device, LCD_POWER_ON);
 	/* give it some time to startup */
 	msleep(100);
 
-- 
2.46.0


