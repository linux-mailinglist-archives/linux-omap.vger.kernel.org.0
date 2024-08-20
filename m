Return-Path: <linux-omap+bounces-1947-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B0A3B95829B
	for <lists+linux-omap@lfdr.de>; Tue, 20 Aug 2024 11:36:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 67EBC285876
	for <lists+linux-omap@lfdr.de>; Tue, 20 Aug 2024 09:36:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A07A18D622;
	Tue, 20 Aug 2024 09:35:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="VyqKBazJ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="06+SThGR";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="VyqKBazJ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="06+SThGR"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF24F18C35E;
	Tue, 20 Aug 2024 09:35:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724146510; cv=none; b=kHkcms3+M151e7Ntk2SMoA7nx2G7bVKqHr7nJk0aCEKnevvQJvympxWyVmPNL9pQE9M0dHFt9do4qLhNsDrqQJWXUHdZJdjuF91OiMzGfY+7IYCFXELuN0UfJyairugXHk7fa/dmj5S+t1SAbAtjqLyRgstsGdn23L1Nz6W6V3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724146510; c=relaxed/simple;
	bh=WlXe4iY9ZcqogIYH6rEicKr81o3HyN2VYxyFr8ESC58=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CYpkdQec9nGqhGX0UDBm3k9Uh/LX8ZgWnO+JNlAwi5yzj4F92KN1PATFrqTA7Jhc5lb1XhVU+LAng1acyQUA02wYMbXbTFv9kBOX9aY0jSor+LWTDRqyjs+/I0DxygjwraBgvIj6xnoRxxM68JXS3TkXGkU+DcSLwLYfKaAx8fg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=VyqKBazJ; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=06+SThGR; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=VyqKBazJ; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=06+SThGR; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id D41A31FFD2;
	Tue, 20 Aug 2024 09:35:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1724146506; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Or+BrdX15TMdoqOhetrkQm8yWPCPiwdq4E9crt6sI4k=;
	b=VyqKBazJ1u4YZIFva+8W+eXYAeYlNGZpvuZRf1Ksa8KloldRtwCuv4q2rkFIgexv4em81R
	VhS6+IvZP0qHntLINo6xvq6ep1nSljliRmku3bRKvMnn2IKFnEGoAuEJQMMtLcSyqTJ/JF
	obyq1VME9Vk5o/jnlfqCgdPl14bWqgE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1724146506;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Or+BrdX15TMdoqOhetrkQm8yWPCPiwdq4E9crt6sI4k=;
	b=06+SThGRd3PJqkSXit0WDixVbD9jD8O7IwGYC6xII8HpBPW9zykD5CVPKz0xai2eiTaEtW
	RY0ubH7Qd8NYYiCw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1724146506; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Or+BrdX15TMdoqOhetrkQm8yWPCPiwdq4E9crt6sI4k=;
	b=VyqKBazJ1u4YZIFva+8W+eXYAeYlNGZpvuZRf1Ksa8KloldRtwCuv4q2rkFIgexv4em81R
	VhS6+IvZP0qHntLINo6xvq6ep1nSljliRmku3bRKvMnn2IKFnEGoAuEJQMMtLcSyqTJ/JF
	obyq1VME9Vk5o/jnlfqCgdPl14bWqgE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1724146506;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Or+BrdX15TMdoqOhetrkQm8yWPCPiwdq4E9crt6sI4k=;
	b=06+SThGRd3PJqkSXit0WDixVbD9jD8O7IwGYC6xII8HpBPW9zykD5CVPKz0xai2eiTaEtW
	RY0ubH7Qd8NYYiCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 76E7113AFE;
	Tue, 20 Aug 2024 09:35:06 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 4LWAG0pjxGa3RAAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Tue, 20 Aug 2024 09:35:06 +0000
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
Subject: [PATCH 17/28] backlight: platform_lcd: Remove match_fb from struct plat_lcd_data
Date: Tue, 20 Aug 2024 11:22:55 +0200
Message-ID: <20240820093452.68270-18-tzimmermann@suse.de>
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
X-Spam-Level: 
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:email,suse.de:mid];
	FREEMAIL_TO(0.00)[kernel.org,linaro.org,gmail.com,gmx.de,linux-vserver.org,mail.ru,pengutronix.de];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	R_RATELIMIT(0.00)[to(RLr3u6jgwj9sedc854c38mga),to_ip_from(RL7eb4yoy35resap1sns3bbybe)];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FREEMAIL_ENVRCPT(0.00)[gmail.com,gmx.de,mail.ru]
X-Spam-Score: -2.80
X-Spam-Flag: NO

The match_fb callback in struct plat_lcd_data is unused. Remove it.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/video/backlight/platform_lcd.c | 4 ----
 include/video/platform_lcd.h           | 3 ---
 2 files changed, 7 deletions(-)

diff --git a/drivers/video/backlight/platform_lcd.c b/drivers/video/backlight/platform_lcd.c
index 08d0ff400d88..8b89d2f47df7 100644
--- a/drivers/video/backlight/platform_lcd.c
+++ b/drivers/video/backlight/platform_lcd.c
@@ -53,10 +53,6 @@ static int platform_lcd_set_power(struct lcd_device *lcd, int power)
 static int platform_lcd_match(struct lcd_device *lcd, struct fb_info *info)
 {
 	struct platform_lcd *plcd = to_our_lcd(lcd);
-	struct plat_lcd_data *pdata = plcd->pdata;
-
-	if (pdata->match_fb)
-		return pdata->match_fb(pdata, info);
 
 	return plcd->us->parent == info->device;
 }
diff --git a/include/video/platform_lcd.h b/include/video/platform_lcd.h
index 6a95184a28c1..2bdf46519298 100644
--- a/include/video/platform_lcd.h
+++ b/include/video/platform_lcd.h
@@ -8,11 +8,8 @@
 */
 
 struct plat_lcd_data;
-struct fb_info;
 
 struct plat_lcd_data {
 	int	(*probe)(struct plat_lcd_data *);
 	void	(*set_power)(struct plat_lcd_data *, unsigned int power);
-	int	(*match_fb)(struct plat_lcd_data *, struct fb_info *);
 };
-
-- 
2.46.0


