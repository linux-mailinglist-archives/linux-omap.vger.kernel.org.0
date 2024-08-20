Return-Path: <linux-omap+bounces-1952-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 92B039582A5
	for <lists+linux-omap@lfdr.de>; Tue, 20 Aug 2024 11:36:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1FE0A1F2475B
	for <lists+linux-omap@lfdr.de>; Tue, 20 Aug 2024 09:36:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A38218CC1F;
	Tue, 20 Aug 2024 09:35:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="0EpemxFd";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="yGNJ8GmU";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="0EpemxFd";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="yGNJ8GmU"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B5AE18D620;
	Tue, 20 Aug 2024 09:35:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724146512; cv=none; b=l3TQ3kXvf1CQhTD41keyt7UkyZI4R5BT9usguVCJQBetwCVrm37MAsFdfRzuoSqbBQE0JrE4oe4rQZx+SjnxLaO1Q3FYgemVQS9OGTG+Wix1E517qSIvz8569NH+IFUXRIvsUWbmRj+haQ9/FHQYWuQlNyyZI6uaWXAlffXfXXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724146512; c=relaxed/simple;
	bh=hQ76s/23Eor36MdlHRyXfblL3cMoXQq24LaJvIaVy7s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pt2R8ihcUvZqfIfFffASF6q7//mgcQ8LfK7yxX9q6gEvBhYLrj1pykjFZ26Hg8vnkBrAmsWMdWF2UpRzxXLTn6KgfGbO/90Yztk0toUMEofAW4U2/09g9RogHLP/pjy67dMMG1e9ovDBe73ZAJ1bSrobXYE/SCVBeeQk+22NMBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=0EpemxFd; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=yGNJ8GmU; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=0EpemxFd; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=yGNJ8GmU; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id DBCFB225AD;
	Tue, 20 Aug 2024 09:35:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1724146508; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YTNANsIODSyg5pivT1qonEIrZsrgaPRMfEohzsWB42g=;
	b=0EpemxFdlGKUUk39hAGITZGYhIt75m4RD6j1l95olajrZ93Lp8GEvEFN0kTCahfqG7A4Y0
	P0K4bgM8Jx+CgjWYqhO5EveJ4Wb06SclH0S+QExL/YLd0JA8q0E1BjBi52eIwWBsSzq5rd
	qaw9u8WlGuj34M3I60aJUb28J+x8LqE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1724146508;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YTNANsIODSyg5pivT1qonEIrZsrgaPRMfEohzsWB42g=;
	b=yGNJ8GmUjbEqx+hooWQN1hsWQcNczKU4A2iV4Ef1aO7/6ZPSWpgHvD9I3OGeo+t5H9nS5H
	AYqw9p8EV+nW9jDA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1724146508; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YTNANsIODSyg5pivT1qonEIrZsrgaPRMfEohzsWB42g=;
	b=0EpemxFdlGKUUk39hAGITZGYhIt75m4RD6j1l95olajrZ93Lp8GEvEFN0kTCahfqG7A4Y0
	P0K4bgM8Jx+CgjWYqhO5EveJ4Wb06SclH0S+QExL/YLd0JA8q0E1BjBi52eIwWBsSzq5rd
	qaw9u8WlGuj34M3I60aJUb28J+x8LqE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1724146508;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YTNANsIODSyg5pivT1qonEIrZsrgaPRMfEohzsWB42g=;
	b=yGNJ8GmUjbEqx+hooWQN1hsWQcNczKU4A2iV4Ef1aO7/6ZPSWpgHvD9I3OGeo+t5H9nS5H
	AYqw9p8EV+nW9jDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 7D10513770;
	Tue, 20 Aug 2024 09:35:08 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id uEZXHUxjxGa3RAAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Tue, 20 Aug 2024 09:35:08 +0000
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
Subject: [PATCH 22/28] fbdev: imxfb: Replace check_fb in favor of struct fb_info.lcd_dev
Date: Tue, 20 Aug 2024 11:23:00 +0200
Message-ID: <20240820093452.68270-23-tzimmermann@suse.de>
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
	BAYES_HAM(-3.00)[99.99%];
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
	R_RATELIMIT(0.00)[to(RLr3u6jgwj9sedc854c38mga),to_ip_from(RL7eb4yoy35resap1sns3bbybe)];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FREEMAIL_ENVRCPT(0.00)[gmail.com,gmx.de,mail.ru]
X-Spam-Flag: NO
X-Spam-Level: 

Store the lcd device in struct fb_info.lcd_dev. The lcd subsystem can
now detect the lcd's fbdev device from this field.

This makes the implementation of check_fb in imxfb_lcd_ops obsolete.
Remove it.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
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


