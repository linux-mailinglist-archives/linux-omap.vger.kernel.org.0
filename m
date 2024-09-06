Return-Path: <linux-omap+bounces-2140-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F3B3F96ECE3
	for <lists+linux-omap@lfdr.de>; Fri,  6 Sep 2024 09:55:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B18B7281E44
	for <lists+linux-omap@lfdr.de>; Fri,  6 Sep 2024 07:55:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1362B156F3B;
	Fri,  6 Sep 2024 07:54:57 +0000 (UTC)
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6899114C5B5;
	Fri,  6 Sep 2024 07:54:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725609296; cv=none; b=mpmqpcsZIEhcTB/P2KCYBFZTvlWeR2g/9HH6fisvwjbmunZR+ssVlvz0gP9o+hgfp8ta69Gm4SnauJegQQKBnolEitTgdEDVFIyBRr4LrfHcmZdoNXCUBmReuPBuhQRmR063Qp5JCad67Qm26CAdwkUau5qTJ6K4suO9fxNZnhI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725609296; c=relaxed/simple;
	bh=TIR6iXUQwZE4JvyJbGtY88zZN28Van+k5Y6OihzMxkg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Sj+guvIWrOXGxc03y21m1RjGRPLCKIeFV4vyNVAVDxdJklJNp/PsCupHy4q553EH2A5suTirNJc6eLD/xYBwOhvOk5skkgFK3taOcf9K5jldzy6C7qMtthGKEwLKvVoiwQRj1HQXC1/go1aeMwftsXvzY1EBVghygJ8UrQic6qY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id F072421ABD;
	Fri,  6 Sep 2024 07:54:53 +0000 (UTC)
Authentication-Results: smtp-out1.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 31936136A8;
	Fri,  6 Sep 2024 07:54:53 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 4DjmCk212mbGPAAAD6G6ig
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
Subject: [PATCH v2 21/28] fbdev: clps711x-fb: Use lcd power constants
Date: Fri,  6 Sep 2024 09:52:35 +0200
Message-ID: <20240906075439.98476-22-tzimmermann@suse.de>
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
X-Rspamd-Queue-Id: F072421ABD
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
 drivers/video/fbdev/clps711x-fb.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/video/fbdev/clps711x-fb.c b/drivers/video/fbdev/clps711x-fb.c
index 4340ea3b9660..9e3df1df5ac4 100644
--- a/drivers/video/fbdev/clps711x-fb.c
+++ b/drivers/video/fbdev/clps711x-fb.c
@@ -168,9 +168,9 @@ static int clps711x_lcd_get_power(struct lcd_device *lcddev)
 
 	if (!IS_ERR_OR_NULL(cfb->lcd_pwr))
 		if (!regulator_is_enabled(cfb->lcd_pwr))
-			return FB_BLANK_NORMAL;
+			return LCD_POWER_REDUCED;
 
-	return FB_BLANK_UNBLANK;
+	return LCD_POWER_ON;
 }
 
 static int clps711x_lcd_set_power(struct lcd_device *lcddev, int blank)
@@ -178,7 +178,7 @@ static int clps711x_lcd_set_power(struct lcd_device *lcddev, int blank)
 	struct clps711x_fb_info *cfb = dev_get_drvdata(&lcddev->dev);
 
 	if (!IS_ERR_OR_NULL(cfb->lcd_pwr)) {
-		if (blank == FB_BLANK_UNBLANK) {
+		if (blank == LCD_POWER_ON) {
 			if (!regulator_is_enabled(cfb->lcd_pwr))
 				return regulator_enable(cfb->lcd_pwr);
 		} else {
-- 
2.46.0


