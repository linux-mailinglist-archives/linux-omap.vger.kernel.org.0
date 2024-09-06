Return-Path: <linux-omap+bounces-2139-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D45696ECE1
	for <lists+linux-omap@lfdr.de>; Fri,  6 Sep 2024 09:55:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1ADE01F27E97
	for <lists+linux-omap@lfdr.de>; Fri,  6 Sep 2024 07:55:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5AF03156F20;
	Fri,  6 Sep 2024 07:54:56 +0000 (UTC)
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0F7043AA9;
	Fri,  6 Sep 2024 07:54:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725609296; cv=none; b=LGHZ5Oqyie5NXaWEQZaVpYRLMoFO2GKboKjpYG/kujwL41Mt3rwjLB/R1Bwgf9HVzbMKtU8BM+vTdGyRcuVBvtu8snCeslC964yFT3IzrXfXtSe3/9YoVefY2AoisDonI5/4otR42R3waRs5n+LbdLnavtfz+1eFGS4XtETQFj0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725609296; c=relaxed/simple;
	bh=F0fFlnH3xkpotDpFjzMxYI//NWccFC8oDf0o38jeK68=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rb2+58G1ax+Md+JY/ttOFsUBSXsacxd0cpMqOkSHMhLCnaDT07YKUyyFog9uKekzEO7FoZ2qyNfVg+82iR/IkTlqpe1E14Vt7JM6PmV4a1uP2XUaw14KFl16aHLT57NvvR/hoiCJJSklCRanT6Mm/GobyvbghUXLXRDAMtfB0co=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 1FB9321AAC;
	Fri,  6 Sep 2024 07:54:53 +0000 (UTC)
Authentication-Results: smtp-out1.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id F1BB9136A8;
	Fri,  6 Sep 2024 07:54:51 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id yJy2OUu12mbGPAAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Fri, 06 Sep 2024 07:54:51 +0000
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
Subject: [PATCH v2 20/28] fbdev: clps711x-fb: Replace check_fb in favor of struct fb_info.lcd_dev
Date: Fri,  6 Sep 2024 09:52:34 +0200
Message-ID: <20240906075439.98476-21-tzimmermann@suse.de>
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
X-Rspamd-Queue-Id: 1FB9321AAC
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org

Store the lcd device in struct fb_info.lcd_dev. The lcd subsystem can
now detect the lcd's fbdev device from this field.

This makes the implementation of check_fb in clps711x_lcd_ops obsolete.
Remove it.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>
---
 drivers/video/fbdev/clps711x-fb.c | 23 ++++++++++-------------
 1 file changed, 10 insertions(+), 13 deletions(-)

diff --git a/drivers/video/fbdev/clps711x-fb.c b/drivers/video/fbdev/clps711x-fb.c
index 6171a98a48fd..4340ea3b9660 100644
--- a/drivers/video/fbdev/clps711x-fb.c
+++ b/drivers/video/fbdev/clps711x-fb.c
@@ -162,13 +162,6 @@ static const struct fb_ops clps711x_fb_ops = {
 	.fb_blank	= clps711x_fb_blank,
 };
 
-static int clps711x_lcd_check_fb(struct lcd_device *lcddev, struct fb_info *fi)
-{
-	struct clps711x_fb_info *cfb = dev_get_drvdata(&lcddev->dev);
-
-	return (!fi || fi->par == cfb) ? 1 : 0;
-}
-
 static int clps711x_lcd_get_power(struct lcd_device *lcddev)
 {
 	struct clps711x_fb_info *cfb = dev_get_drvdata(&lcddev->dev);
@@ -198,7 +191,6 @@ static int clps711x_lcd_set_power(struct lcd_device *lcddev, int blank)
 }
 
 static const struct lcd_ops clps711x_lcd_ops = {
-	.check_fb	= clps711x_lcd_check_fb,
 	.get_power	= clps711x_lcd_get_power,
 	.set_power	= clps711x_lcd_set_power,
 };
@@ -325,16 +317,21 @@ static int clps711x_fb_probe(struct platform_device *pdev)
 	if (ret)
 		goto out_fb_dealloc_cmap;
 
+	lcd = devm_lcd_device_register(dev, "clps711x-lcd", dev, cfb,
+				       &clps711x_lcd_ops);
+	if (IS_ERR(lcd)) {
+		ret = PTR_ERR(lcd);
+		goto out_fb_dealloc_cmap;
+	}
+
+	info->lcd_dev = lcd;
+
 	ret = register_framebuffer(info);
 	if (ret)
 		goto out_fb_dealloc_cmap;
 
-	lcd = devm_lcd_device_register(dev, "clps711x-lcd", dev, cfb,
-				       &clps711x_lcd_ops);
-	if (!IS_ERR(lcd))
-		return 0;
+	return 0;
 
-	ret = PTR_ERR(lcd);
 	unregister_framebuffer(info);
 
 out_fb_dealloc_cmap:
-- 
2.46.0


