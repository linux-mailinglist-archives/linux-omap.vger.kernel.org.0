Return-Path: <linux-omap+bounces-2143-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E48C96ECEB
	for <lists+linux-omap@lfdr.de>; Fri,  6 Sep 2024 09:55:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 50455B26827
	for <lists+linux-omap@lfdr.de>; Fri,  6 Sep 2024 07:55:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D955215748A;
	Fri,  6 Sep 2024 07:54:58 +0000 (UTC)
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DFB014C5B5;
	Fri,  6 Sep 2024 07:54:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725609298; cv=none; b=lKF4tw8idfP1q112HpPmlGTgWK39JZdgr2rG2cH62+Ec/r2ngtKhbObuanSGsw3sWaoXdjoqXx8X08ZnoDWwDi6BWeE2M0DJ14PdPsiR3s+DxNTyV6KpcDmqIAt4QZPUuGqdYUGyid5zETrl9xcW7QUv3Pv34b9/QK1sLDrt9Ck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725609298; c=relaxed/simple;
	bh=qO5VIBR+6cy74GDmdkhmIgfGS2y66+PCSTPKCSTX4Bk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lC64219Z4tDLHxd8vQ0MRSdIOdtF/iec1BfgD4kTw9JLT7aLVfOqy/VoGJFlsXwG3j0oS4jEUYGrs5gz+acmefmw2jRLrf5f5dvVWNW5jxX76u5Pn7ifVYlXsYeib8bQdx/VJ05oCkMGXgy1YKr0ZpQr0ck2JKMrPJvSamn6X2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id A785A21AC1;
	Fri,  6 Sep 2024 07:54:55 +0000 (UTC)
Authentication-Results: smtp-out1.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 4B34C13A7A;
	Fri,  6 Sep 2024 07:54:55 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id uBgAEU+12mbGPAAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Fri, 06 Sep 2024 07:54:55 +0000
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
Subject: [PATCH v2 24/28] fbdev: omap: Use lcd power constants
Date: Fri,  6 Sep 2024 09:52:38 +0200
Message-ID: <20240906075439.98476-25-tzimmermann@suse.de>
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
X-Spam-Level: 
X-Spamd-Result: default: False [-4.00 / 50.00];
	REPLY(-4.00)[]
X-Spam-Score: -4.00
X-Spam-Flag: NO
X-Rspamd-Queue-Id: A785A21AC1
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org

Replace FB_BLANK_ constants with their counterparts from the
lcd subsystem. The values are identical, so there's no change
in functionality.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>
---
 drivers/video/fbdev/omap/lcd_ams_delta.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/video/fbdev/omap/lcd_ams_delta.c b/drivers/video/fbdev/omap/lcd_ams_delta.c
index 97e2b71b64d7..456e6e9e11a9 100644
--- a/drivers/video/fbdev/omap/lcd_ams_delta.c
+++ b/drivers/video/fbdev/omap/lcd_ams_delta.c
@@ -32,7 +32,7 @@ static struct gpio_desc *gpiod_ndisp;
 
 static int ams_delta_lcd_set_power(struct lcd_device *dev, int power)
 {
-	if (power == FB_BLANK_UNBLANK) {
+	if (power == LCD_POWER_ON) {
 		if (!(ams_delta_lcd & AMS_DELTA_LCD_POWER)) {
 			omap_writeb(ams_delta_lcd & AMS_DELTA_MAX_CONTRAST,
 					OMAP_PWL_ENABLE);
@@ -63,9 +63,9 @@ static int ams_delta_lcd_set_contrast(struct lcd_device *dev, int value)
 static int ams_delta_lcd_get_power(struct lcd_device *dev)
 {
 	if (ams_delta_lcd & AMS_DELTA_LCD_POWER)
-		return FB_BLANK_UNBLANK;
+		return LCD_POWER_ON;
 	else
-		return FB_BLANK_POWERDOWN;
+		return LCD_POWER_OFF;
 }
 
 static int ams_delta_lcd_get_contrast(struct lcd_device *dev)
@@ -155,7 +155,7 @@ static int ams_delta_panel_probe(struct platform_device *pdev)
 #endif
 
 	ams_delta_lcd_set_contrast(lcd_device, AMS_DELTA_DEFAULT_CONTRAST);
-	ams_delta_lcd_set_power(lcd_device, FB_BLANK_UNBLANK);
+	ams_delta_lcd_set_power(lcd_device, LCD_POWER_ON);
 
 	omapfb_register_panel(&ams_delta_panel);
 	return 0;
-- 
2.46.0


