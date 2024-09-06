Return-Path: <linux-omap+bounces-2138-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DB5396ECDF
	for <lists+linux-omap@lfdr.de>; Fri,  6 Sep 2024 09:55:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 397B9280EA4
	for <lists+linux-omap@lfdr.de>; Fri,  6 Sep 2024 07:55:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13114156C72;
	Fri,  6 Sep 2024 07:54:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="PIO7RLEX";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="vshlfgTq";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="PIO7RLEX";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="vshlfgTq"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44F6B14C5B5;
	Fri,  6 Sep 2024 07:54:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725609294; cv=none; b=nlNGe7DqiKoFJe+airRtBXqmi047rg3ZoeEc9+mWWQc0Ky1l6HMwsKS0jRKOLmRlK0tUNKMz/SHVYjuxL894eJ/IAA+5ZMa9qJqRXCjL64Vrr2+2jqY01fJJdlPCO8gtYUSSP3ufkskQbsb+kVu7ghjwV5rgLaAElgPP6SQFYEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725609294; c=relaxed/simple;
	bh=2ljvpV7Ddr+ITaiP3jExJ++X1x0sMPMttuIliuOAWn8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=N+ZkO04k9cY17Cp04GABm+5DaG+z+IeyM0EdP+eSQEF8ddoKmtrfGJ1fSEnzMRaDEPXH70DMyPakw0gkBR+/hhwyH0uSjTdBBhhTth6opRf9I93jkQ2gIlnufqKazi8BBaDXKqDRDyG+mhecPdNHjhVdvXLeTZMHrUeDnM9730g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=PIO7RLEX; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=vshlfgTq; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=PIO7RLEX; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=vshlfgTq; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id C41EB21AC4;
	Fri,  6 Sep 2024 07:54:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1725609291; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=adSw7F19Q8aU5pGUF+8I1UIiC7pis/K78hWlcDhkBlk=;
	b=PIO7RLEXd8+oFoishWPJnob04dCxNzFwA6h+EDRt17g2drZ0CP9elLGkO8ndmo+sbqw0WW
	0z9HJD7zL+C3MqleKS7I9F3gl3aZ8IEjBMdLYkAe0dABb4OTJSZRG7cyrYdXL0onayj1A8
	lF13EMXF3QCX+IzwzaUDf/XewpCfOYU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1725609291;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=adSw7F19Q8aU5pGUF+8I1UIiC7pis/K78hWlcDhkBlk=;
	b=vshlfgTqDFrWmTTs12+vp/GAvIDX2Clk3cVbBOId4KTuyl0mkhlSM/Kp1hJX+54GpeHFhF
	KhyJ89SPBLgEeFAA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1725609291; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=adSw7F19Q8aU5pGUF+8I1UIiC7pis/K78hWlcDhkBlk=;
	b=PIO7RLEXd8+oFoishWPJnob04dCxNzFwA6h+EDRt17g2drZ0CP9elLGkO8ndmo+sbqw0WW
	0z9HJD7zL+C3MqleKS7I9F3gl3aZ8IEjBMdLYkAe0dABb4OTJSZRG7cyrYdXL0onayj1A8
	lF13EMXF3QCX+IzwzaUDf/XewpCfOYU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1725609291;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=adSw7F19Q8aU5pGUF+8I1UIiC7pis/K78hWlcDhkBlk=;
	b=vshlfgTqDFrWmTTs12+vp/GAvIDX2Clk3cVbBOId4KTuyl0mkhlSM/Kp1hJX+54GpeHFhF
	KhyJ89SPBLgEeFAA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id B89F5136A8;
	Fri,  6 Sep 2024 07:54:50 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 4NzVK0q12mbGPAAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Fri, 06 Sep 2024 07:54:50 +0000
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
Subject: [PATCH v2 19/28] backlight: tdo24m: Use lcd power constants
Date: Fri,  6 Sep 2024 09:52:33 +0200
Message-ID: <20240906075439.98476-20-tzimmermann@suse.de>
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
X-Spam-Level: 
X-Spamd-Result: default: False [-6.80 / 50.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,linaro.org,gmail.com,gmx.de,linux-vserver.org,pengutronix.de];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	R_RATELIMIT(0.00)[to_ip_from(RL7eb4yoy35resap1sns3bbybe)];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FREEMAIL_ENVRCPT(0.00)[gmail.com,gmx.de]
X-Spam-Score: -6.80
X-Spam-Flag: NO

Replace FB_BLANK_ constants with their counterparts from the
lcd subsystem. The values are identical, so there's no change
in functionality.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>
---
 drivers/video/backlight/tdo24m.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/video/backlight/tdo24m.c b/drivers/video/backlight/tdo24m.c
index c413b3c68e95..a14a94114e9d 100644
--- a/drivers/video/backlight/tdo24m.c
+++ b/drivers/video/backlight/tdo24m.c
@@ -16,7 +16,7 @@
 #include <linux/lcd.h>
 #include <linux/slab.h>
 
-#define POWER_IS_ON(pwr)	((pwr) <= FB_BLANK_NORMAL)
+#define POWER_IS_ON(pwr)	((pwr) <= LCD_POWER_REDUCED)
 
 #define TDO24M_SPI_BUFF_SIZE	(4)
 #define MODE_QVGA	0
@@ -354,7 +354,7 @@ static int tdo24m_probe(struct spi_device *spi)
 		return -ENOMEM;
 
 	lcd->spi_dev = spi;
-	lcd->power = FB_BLANK_POWERDOWN;
+	lcd->power = LCD_POWER_OFF;
 	lcd->mode = MODE_VGA;	/* default to VGA */
 
 	lcd->buf = devm_kzalloc(&spi->dev, TDO24M_SPI_BUFF_SIZE, GFP_KERNEL);
@@ -390,7 +390,7 @@ static int tdo24m_probe(struct spi_device *spi)
 		return PTR_ERR(lcd->lcd_dev);
 
 	spi_set_drvdata(spi, lcd);
-	err = tdo24m_power(lcd, FB_BLANK_UNBLANK);
+	err = tdo24m_power(lcd, LCD_POWER_ON);
 	if (err)
 		return err;
 
@@ -401,7 +401,7 @@ static void tdo24m_remove(struct spi_device *spi)
 {
 	struct tdo24m *lcd = spi_get_drvdata(spi);
 
-	tdo24m_power(lcd, FB_BLANK_POWERDOWN);
+	tdo24m_power(lcd, LCD_POWER_OFF);
 }
 
 #ifdef CONFIG_PM_SLEEP
@@ -409,14 +409,14 @@ static int tdo24m_suspend(struct device *dev)
 {
 	struct tdo24m *lcd = dev_get_drvdata(dev);
 
-	return tdo24m_power(lcd, FB_BLANK_POWERDOWN);
+	return tdo24m_power(lcd, LCD_POWER_OFF);
 }
 
 static int tdo24m_resume(struct device *dev)
 {
 	struct tdo24m *lcd = dev_get_drvdata(dev);
 
-	return tdo24m_power(lcd, FB_BLANK_UNBLANK);
+	return tdo24m_power(lcd, LCD_POWER_ON);
 }
 #endif
 
@@ -427,7 +427,7 @@ static void tdo24m_shutdown(struct spi_device *spi)
 {
 	struct tdo24m *lcd = spi_get_drvdata(spi);
 
-	tdo24m_power(lcd, FB_BLANK_POWERDOWN);
+	tdo24m_power(lcd, LCD_POWER_OFF);
 }
 
 static struct spi_driver tdo24m_driver = {
-- 
2.46.0


