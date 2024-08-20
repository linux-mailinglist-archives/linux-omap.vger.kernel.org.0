Return-Path: <linux-omap+bounces-1950-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DA649582A0
	for <lists+linux-omap@lfdr.de>; Tue, 20 Aug 2024 11:36:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E8F66285957
	for <lists+linux-omap@lfdr.de>; Tue, 20 Aug 2024 09:36:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9FB4818D651;
	Tue, 20 Aug 2024 09:35:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="N2iqKoyk";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="SQF6IoDx";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="N2iqKoyk";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="SQF6IoDx"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE13A158DCE;
	Tue, 20 Aug 2024 09:35:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724146511; cv=none; b=TtpBqjF+jozGkrqDvCuwzaep0dHvu6NJvhvPINS3KANXssOStoKdFhZaskFV05eF3eT79LWhLZ3u2MoxXyMTkTe1rogEc4gMUQtB23KJwnBh2VNE/Kz0q2GGKKEAo3+twxUQFhSvqoqSx1Fc2xJBZwSTkvQZlQEuKfPTWNYXvbs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724146511; c=relaxed/simple;
	bh=VviNuR0IC02xdkBJdxkx8pHOhzTIAYrhE6Q4MVsbbrY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ntkvh6wl+5C+InGDIksLkXdNpca3fbtwsU+R1egxzg+i3UzdsrLhXxfmZbxjGdf8KPlVdQU5Qsr9nRLubcjS/gucvZVhrGfn0/QVrqX+4O39C0dKX4QdcMhIQZOO48zkVbQ8wuKehzSeamydtkbb6c27pjtz2cYEIuiX6aHzlFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=N2iqKoyk; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=SQF6IoDx; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=N2iqKoyk; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=SQF6IoDx; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 14FC41FFD6;
	Tue, 20 Aug 2024 09:35:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1724146508; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hoAMQXS7nhRjUmGE2WCwR9P39djbCpWNGRizlFeXyW0=;
	b=N2iqKoykUUmbccj5Bt0beMZvqPN0V+lkpN1FAXMkuyWdmq28DoiczCLEo2eDxNCdzO5QNI
	OKYP9LdtHJNfrChMgfUElAWSxq4Te7OKq2gJCvU0/cEBKMc3Cy2izwc3SQUA0SKZBzI7vX
	V2Ni5rZVJ5/ecQ9S+5VrRaB5UQPeJzc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1724146508;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hoAMQXS7nhRjUmGE2WCwR9P39djbCpWNGRizlFeXyW0=;
	b=SQF6IoDxGz8uZIYd+y1KGqov9O4VHX3aKo2AwtB4+mfZJiM/Rm1Cm01iCNbjR62jVOIpyF
	WEMSi33XpAl1jbDQ==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=N2iqKoyk;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=SQF6IoDx
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1724146508; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hoAMQXS7nhRjUmGE2WCwR9P39djbCpWNGRizlFeXyW0=;
	b=N2iqKoykUUmbccj5Bt0beMZvqPN0V+lkpN1FAXMkuyWdmq28DoiczCLEo2eDxNCdzO5QNI
	OKYP9LdtHJNfrChMgfUElAWSxq4Te7OKq2gJCvU0/cEBKMc3Cy2izwc3SQUA0SKZBzI7vX
	V2Ni5rZVJ5/ecQ9S+5VrRaB5UQPeJzc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1724146508;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hoAMQXS7nhRjUmGE2WCwR9P39djbCpWNGRizlFeXyW0=;
	b=SQF6IoDxGz8uZIYd+y1KGqov9O4VHX3aKo2AwtB4+mfZJiM/Rm1Cm01iCNbjR62jVOIpyF
	WEMSi33XpAl1jbDQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id AC47B13770;
	Tue, 20 Aug 2024 09:35:07 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id AIrtKEtjxGa3RAAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Tue, 20 Aug 2024 09:35:07 +0000
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
Subject: [PATCH 20/28] fbdev: clps711x-fb: Replace check_fb in favor of struct fb_info.lcd_dev
Date: Tue, 20 Aug 2024 11:22:58 +0200
Message-ID: <20240820093452.68270-21-tzimmermann@suse.de>
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
X-Rspamd-Queue-Id: 14FC41FFD6
X-Spam-Score: -3.01
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
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
	R_RATELIMIT(0.00)[to_ip_from(RLk469idygq4891mojaqehp6ty),to(RLr3u6jgwj9sedc854c38mga)];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	TO_DN_SOME(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com,gmx.de,mail.ru]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO
X-Spam-Level: 

Store the lcd device in struct fb_info.lcd_dev. The lcd subsystem can
now detect the lcd's fbdev device from this field.

This makes the implementation of check_fb in clps711x_lcd_ops obsolete.
Remove it.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
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


