Return-Path: <linux-omap+bounces-1953-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C8B19582A7
	for <lists+linux-omap@lfdr.de>; Tue, 20 Aug 2024 11:36:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 49358285A53
	for <lists+linux-omap@lfdr.de>; Tue, 20 Aug 2024 09:36:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB43E18DF6A;
	Tue, 20 Aug 2024 09:35:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="jLofA7JD";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="fmtUmkDZ";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="jLofA7JD";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="fmtUmkDZ"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2156418D65D;
	Tue, 20 Aug 2024 09:35:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724146513; cv=none; b=La7OU9ZGT6e9yjrquuuS8nWjIDpYfyKz30SjUlmYoblwLILbjfhzKBFHpkIx1GRhhYixz//vwr6mp0uYTwrsfBmqKR9oVeph+a1pmnbDnSJ1sNElIRIMMLa0isCh+5OVJv06Du1QthnuhqDFEnng34HxERqpmGI9ykal4amwvDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724146513; c=relaxed/simple;
	bh=2yl6Hso7HGBfHcI37MaTXCquafh2yLmgQUb1bUq1TtU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kP9f1vE8zeBJH3qg3IZznkqgwJkaHTQ19qfDqX29C1DjZ1O0xqf+U2Km8HvH53AnHy54oiWCxP5DRM0Ki17Y3Gjz3eT1gkUfVng55mx4fhTvqsDCmcKJM6OFmWAm7RmrWtgEMapoMMrNY2BfaR62EfDmE57rZ+S8TnKO2tSbX2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=jLofA7JD; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=fmtUmkDZ; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=jLofA7JD; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=fmtUmkDZ; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 28F9C1FFD8;
	Tue, 20 Aug 2024 09:35:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1724146510; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=L77ZX4ZusK24OhiJf9u5WYHoe5XJdoXRl6s07vCWReY=;
	b=jLofA7JDUOWUpogyiZWrBwvtESnxc1k5rODzOZsYVl7QH1+ZSflRVidR15YlzWvBHXB9nB
	BmU9H8DlqcN9fRw7vpQmMRrcTRnzSIrENS9LSePnFi1pXvA1QrO8Lg86JnbxwJqcQpjLIc
	yH6iNwyFF+Yph93tdeB8A2apV39J4tM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1724146510;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=L77ZX4ZusK24OhiJf9u5WYHoe5XJdoXRl6s07vCWReY=;
	b=fmtUmkDZjBNVsapr+cdVLVNhXUn3QLZJGgIHeahsfkc4q7xXEfWUidHMT6y4MwP39r//ds
	qV6ADGBBZL1EVQCg==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=jLofA7JD;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=fmtUmkDZ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1724146510; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=L77ZX4ZusK24OhiJf9u5WYHoe5XJdoXRl6s07vCWReY=;
	b=jLofA7JDUOWUpogyiZWrBwvtESnxc1k5rODzOZsYVl7QH1+ZSflRVidR15YlzWvBHXB9nB
	BmU9H8DlqcN9fRw7vpQmMRrcTRnzSIrENS9LSePnFi1pXvA1QrO8Lg86JnbxwJqcQpjLIc
	yH6iNwyFF+Yph93tdeB8A2apV39J4tM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1724146510;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=L77ZX4ZusK24OhiJf9u5WYHoe5XJdoXRl6s07vCWReY=;
	b=fmtUmkDZjBNVsapr+cdVLVNhXUn3QLZJGgIHeahsfkc4q7xXEfWUidHMT6y4MwP39r//ds
	qV6ADGBBZL1EVQCg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id B4BDC13B02;
	Tue, 20 Aug 2024 09:35:09 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id GGf7Kk1jxGa3RAAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Tue, 20 Aug 2024 09:35:09 +0000
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
Subject: [PATCH 25/28] HID: picoLCD: Replace check_fb in favor of struct fb_info.lcd_dev
Date: Tue, 20 Aug 2024 11:23:03 +0200
Message-ID: <20240820093452.68270-26-tzimmermann@suse.de>
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
X-Rspamd-Queue-Id: 28F9C1FFD8
X-Spam-Score: -3.01
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,suse.de:email,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
	FROM_EQ_ENVFROM(0.00)[];
	R_RATELIMIT(0.00)[to(RLr3u6jgwj9sedc854c38mga),to_ip_from(RLk469idygq4891mojaqehp6ty)];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	TO_DN_SOME(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com,gmx.de,mail.ru]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO
X-Spam-Level: 

Store the lcd device in struct fb_info.lcd_dev. The lcd subsystem can
now detect the lcd's fbdev device from this field.

This makes the implementation of check_fb in picolcd_lcdops obsolete.
Remove it.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/hid/hid-picolcd_fb.c  | 4 ++++
 drivers/hid/hid-picolcd_lcd.c | 6 ------
 2 files changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/hid/hid-picolcd_fb.c b/drivers/hid/hid-picolcd_fb.c
index 83e3409d170c..22188acfcbb0 100644
--- a/drivers/hid/hid-picolcd_fb.c
+++ b/drivers/hid/hid-picolcd_fb.c
@@ -497,6 +497,10 @@ int picolcd_init_framebuffer(struct picolcd_data *data)
 #endif
 #endif
 
+#ifdef CONFIG_HID_PICOLCD_LCD
+	info->lcd_dev = data->lcd;
+#endif
+
 	fbdata = info->par;
 	spin_lock_init(&fbdata->lock);
 	fbdata->picolcd = data;
diff --git a/drivers/hid/hid-picolcd_lcd.c b/drivers/hid/hid-picolcd_lcd.c
index 061a33ba7b1d..318f19eac0e7 100644
--- a/drivers/hid/hid-picolcd_lcd.c
+++ b/drivers/hid/hid-picolcd_lcd.c
@@ -41,15 +41,9 @@ static int picolcd_set_contrast(struct lcd_device *ldev, int contrast)
 	return 0;
 }
 
-static int picolcd_check_lcd_fb(struct lcd_device *ldev, struct fb_info *fb)
-{
-	return fb && fb == picolcd_fbinfo((struct picolcd_data *)lcd_get_data(ldev));
-}
-
 static const struct lcd_ops picolcd_lcdops = {
 	.get_contrast   = picolcd_get_contrast,
 	.set_contrast   = picolcd_set_contrast,
-	.check_fb       = picolcd_check_lcd_fb,
 };
 
 int picolcd_init_lcd(struct picolcd_data *data, struct hid_report *report)
-- 
2.46.0


