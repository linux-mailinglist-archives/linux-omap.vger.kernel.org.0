Return-Path: <linux-omap+bounces-2137-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A6A2B96ECDC
	for <lists+linux-omap@lfdr.de>; Fri,  6 Sep 2024 09:55:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 642EB280E79
	for <lists+linux-omap@lfdr.de>; Fri,  6 Sep 2024 07:55:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DAEB1156C71;
	Fri,  6 Sep 2024 07:54:53 +0000 (UTC)
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 403DD43AA9;
	Fri,  6 Sep 2024 07:54:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725609293; cv=none; b=rgiI9j+L5iAZujszt62Jm9eeOBYQc+FTfYL0cUxbF60RVxB2uYppR6iMRd5nNEPNXY35kFrUfoQzA2zrIEHvrdTCsthkNPCxxjtUwVW4Uk1MCEZ3AqXmqGjDgzqnHrxxlxJxvgSW87O0LbeKdtTUB2Q14nr8hRbn9vRHyW92Etw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725609293; c=relaxed/simple;
	bh=XmyVQoL+LcNTzOy54MH2r69bD7E6Q1P9b3GI0dhvytw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BHpb7EtcOsNwbrCMEFNbxs3ph/IEfkOeUbFwc7DikrTnhboDcfIqMqkWoLUubD5L6SdiuvdK8O2EyH5lIhquA66HB1FlV/P/INswJDX5yNZWHFWd2BD3Pzcad7bsp+GP/EuBEojKfP5kHV7O4Xta7KPVBy9/Ui0B9HWIBUk764w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id B2AE31F899;
	Fri,  6 Sep 2024 07:54:50 +0000 (UTC)
Authentication-Results: smtp-out2.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A93D013A7A;
	Fri,  6 Sep 2024 07:54:49 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id aB0lKEm12mbGPAAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Fri, 06 Sep 2024 07:54:49 +0000
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
Subject: [PATCH v2 18/28] backlight: platform_lcd: Use lcd power constants
Date: Fri,  6 Sep 2024 09:52:32 +0200
Message-ID: <20240906075439.98476-19-tzimmermann@suse.de>
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
X-Rspamd-Queue-Id: B2AE31F899
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
 drivers/video/backlight/platform_lcd.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/video/backlight/platform_lcd.c b/drivers/video/backlight/platform_lcd.c
index 8b89d2f47df7..69a22d1a8a35 100644
--- a/drivers/video/backlight/platform_lcd.c
+++ b/drivers/video/backlight/platform_lcd.c
@@ -41,7 +41,7 @@ static int platform_lcd_set_power(struct lcd_device *lcd, int power)
 	struct platform_lcd *plcd = to_our_lcd(lcd);
 	int lcd_power = 1;
 
-	if (power == FB_BLANK_POWERDOWN || plcd->suspended)
+	if (power == LCD_POWER_OFF || plcd->suspended)
 		lcd_power = 0;
 
 	plcd->pdata->set_power(plcd->pdata, lcd_power);
@@ -97,7 +97,7 @@ static int platform_lcd_probe(struct platform_device *pdev)
 	}
 
 	platform_set_drvdata(pdev, plcd);
-	platform_lcd_set_power(plcd->lcd, FB_BLANK_NORMAL);
+	platform_lcd_set_power(plcd->lcd, LCD_POWER_REDUCED);
 
 	return 0;
 }
-- 
2.46.0


