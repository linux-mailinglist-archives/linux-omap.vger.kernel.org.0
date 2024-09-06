Return-Path: <linux-omap+bounces-2141-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D530896ECE5
	for <lists+linux-omap@lfdr.de>; Fri,  6 Sep 2024 09:55:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8B0911F27FC6
	for <lists+linux-omap@lfdr.de>; Fri,  6 Sep 2024 07:55:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1A75156F5F;
	Fri,  6 Sep 2024 07:54:57 +0000 (UTC)
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4129D15697B;
	Fri,  6 Sep 2024 07:54:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725609297; cv=none; b=M+wobzeNPziDLVDzXd1phPwjGPrFHHOJ7OeBbZZUwljU4RuRhD3jDE6SKTnLdj2v9tBF+NLNeWHvsacHFzZdtrfvZBnss3lxTaI2A2Xg5HBFEfzZKMeM4N95LpfaXhIyMJmT8WcxjDYBU6KSztRmzEEwL0u8C7VjIzJK2+6ZN74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725609297; c=relaxed/simple;
	bh=pOuebbufJz0W8VfTa8C6TAZPwCtOKnb6T5S1wJS29xg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HW2pyeAQjs21ZoDlc8oj7pgqbqpmgdrcGW/EEQzgCm293uJfPPz+vZhixDte6QgZKbyOoJSpd440xhPTz/wd5aM/eqE+Jg6ww6OcQrWWeT1lPSsFUajuwqTQyPnXnpudA3eUXbE+V0gawJynjezZwqDPJePfQ7XuXPwhU/4hE2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 9516F1F897;
	Fri,  6 Sep 2024 07:54:54 +0000 (UTC)
Authentication-Results: smtp-out2.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id F2EFB13A7A;
	Fri,  6 Sep 2024 07:54:53 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id eJBfOE212mbGPAAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Fri, 06 Sep 2024 07:54:53 +0000
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
Subject: [PATCH v2 22/28] fbdev: imxfb: Replace check_fb in favor of struct fb_info.lcd_dev
Date: Fri,  6 Sep 2024 09:52:36 +0200
Message-ID: <20240906075439.98476-23-tzimmermann@suse.de>
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
X-Rspamd-Queue-Id: 9516F1F897
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org

Store the lcd device in struct fb_info.lcd_dev. The lcd subsystem can
now detect the lcd's fbdev device from this field.

This makes the implementation of check_fb in imxfb_lcd_ops obsolete.
Remove it.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>
---
 drivers/video/fbdev/imxfb.c | 26 ++++++++------------------
 1 file changed, 8 insertions(+), 18 deletions(-)

diff --git a/drivers/video/fbdev/imxfb.c b/drivers/video/fbdev/imxfb.c
index 4ebfe9b9df60..88c117f29f7f 100644
--- a/drivers/video/fbdev/imxfb.c
+++ b/drivers/video/fbdev/imxfb.c
@@ -782,16 +782,6 @@ static int imxfb_of_read_mode(struct device *dev, struct device_node *np,
 	return 0;
 }
 
-static int imxfb_lcd_check_fb(struct lcd_device *lcddev, struct fb_info *fi)
-{
-	struct imxfb_info *fbi = dev_get_drvdata(&lcddev->dev);
-
-	if (!fi || fi->par == fbi)
-		return 1;
-
-	return 0;
-}
-
 static int imxfb_lcd_get_contrast(struct lcd_device *lcddev)
 {
 	struct imxfb_info *fbi = dev_get_drvdata(&lcddev->dev);
@@ -858,7 +848,6 @@ static int imxfb_lcd_set_power(struct lcd_device *lcddev, int power)
 }
 
 static const struct lcd_ops imxfb_lcd_ops = {
-	.check_fb	= imxfb_lcd_check_fb,
 	.get_contrast	= imxfb_lcd_get_contrast,
 	.set_contrast	= imxfb_lcd_set_contrast,
 	.get_power	= imxfb_lcd_get_power,
@@ -1025,11 +1014,6 @@ static int imxfb_probe(struct platform_device *pdev)
 		goto failed_cmap;
 
 	imxfb_set_par(info);
-	ret = register_framebuffer(info);
-	if (ret < 0) {
-		dev_err(&pdev->dev, "failed to register framebuffer\n");
-		goto failed_register;
-	}
 
 	fbi->lcd_pwr = devm_regulator_get(&pdev->dev, "lcd");
 	if (PTR_ERR(fbi->lcd_pwr) == -EPROBE_DEFER) {
@@ -1046,13 +1030,19 @@ static int imxfb_probe(struct platform_device *pdev)
 
 	lcd->props.max_contrast = 0xff;
 
+	info->lcd_dev = lcd;
+
+	ret = register_framebuffer(info);
+	if (ret < 0) {
+		dev_err(&pdev->dev, "failed to register framebuffer\n");
+		goto failed_lcd;
+	}
+
 	imxfb_enable_controller(fbi);
 
 	return 0;
 
 failed_lcd:
-	unregister_framebuffer(info);
-failed_register:
 	fb_dealloc_cmap(&info->cmap);
 failed_cmap:
 	dma_free_wc(&pdev->dev, fbi->map_size, info->screen_buffer,
-- 
2.46.0


