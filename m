Return-Path: <linux-omap+bounces-2136-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4670296ECDB
	for <lists+linux-omap@lfdr.de>; Fri,  6 Sep 2024 09:55:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BC0741F27B80
	for <lists+linux-omap@lfdr.de>; Fri,  6 Sep 2024 07:55:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 100DF156880;
	Fri,  6 Sep 2024 07:54:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="HaZL2Zad";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="L0P23I+I";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="HaZL2Zad";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="L0P23I+I"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4949514C5B5;
	Fri,  6 Sep 2024 07:54:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725609292; cv=none; b=JHHqVSsP2Q9ClMFez/YXRYqwsN/aqfIbE4Cg/UKApodTFc4odw8uCWv7DwRvgRkFMbECCZSoywEDemW8yVTOShdRzoNqUj2xeW+NjnY4Aw1CD05PaF4IwTCMB4quZwNx6BICFtmstMXs4LyQkwreTrFDygt2Va7Z5ihIlrCQal0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725609292; c=relaxed/simple;
	bh=jcTXYlFcoEg2vS0ni0UAXPYVwCv0bVfnZY+SRVQ1zvo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ai8G8WusNGO3lUFSEsKF3Yb2EPgOc2CRy7NwVXQmfLmlptRzkFHDjQEG7kKJKfk9/N+My8G5WKdZ/pzrpjRyhK0T/wl00Ne4rWL50qKR/21aLLi48Qo8aRHVHqtHZVFOtd1rcJ0U1LboBFIVX56DL97RMPxMAPQWmvozkF9c4E8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=HaZL2Zad; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=L0P23I+I; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=HaZL2Zad; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=L0P23I+I; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id A3A5821AAC;
	Fri,  6 Sep 2024 07:54:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1725609289; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=S6bpwhMyklAN/5Lq/iKAY/5XSZndk2kzxVCIg6I/VUM=;
	b=HaZL2ZadRBmSPic+1xcdR29AboAWoIO3OdJeHEL6Wo/ItlFGMOI5ggZg9WawP/LprEqX26
	aoMjIPptjlvL9aru4oWlL//rteDEuiHbXnliUyO58vvMQYcrvhSle/mX21FxFeKM1uNg2A
	J7gksOYvn0nreYCEf66d6OWWRBFhxeM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1725609289;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=S6bpwhMyklAN/5Lq/iKAY/5XSZndk2kzxVCIg6I/VUM=;
	b=L0P23I+InAFMmPfw4UNDC2H4tw9SqCqIYiRjyt9SjBUUSyIYtqVdU8OdnIHD1f+V1X8iwj
	lwjM3iTWlPJXexBw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1725609289; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=S6bpwhMyklAN/5Lq/iKAY/5XSZndk2kzxVCIg6I/VUM=;
	b=HaZL2ZadRBmSPic+1xcdR29AboAWoIO3OdJeHEL6Wo/ItlFGMOI5ggZg9WawP/LprEqX26
	aoMjIPptjlvL9aru4oWlL//rteDEuiHbXnliUyO58vvMQYcrvhSle/mX21FxFeKM1uNg2A
	J7gksOYvn0nreYCEf66d6OWWRBFhxeM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1725609289;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=S6bpwhMyklAN/5Lq/iKAY/5XSZndk2kzxVCIg6I/VUM=;
	b=L0P23I+InAFMmPfw4UNDC2H4tw9SqCqIYiRjyt9SjBUUSyIYtqVdU8OdnIHD1f+V1X8iwj
	lwjM3iTWlPJXexBw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id DBDB1136A8;
	Fri,  6 Sep 2024 07:54:48 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id QB9LMki12mbGPAAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Fri, 06 Sep 2024 07:54:48 +0000
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
Subject: [PATCH v2 17/28] backlight: platform_lcd: Remove match_fb from struct plat_lcd_data
Date: Fri,  6 Sep 2024 09:52:31 +0200
Message-ID: <20240906075439.98476-18-tzimmermann@suse.de>
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
	BAYES_HAM(-3.00)[99.99%];
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

The match_fb callback in struct plat_lcd_data is unused. Remove it.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>
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


