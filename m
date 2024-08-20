Return-Path: <linux-omap+bounces-1932-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E8A97958279
	for <lists+linux-omap@lfdr.de>; Tue, 20 Aug 2024 11:35:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0D4C41C241AA
	for <lists+linux-omap@lfdr.de>; Tue, 20 Aug 2024 09:35:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F88A18C332;
	Tue, 20 Aug 2024 09:35:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="UvDWMN6/";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="jU55NKha";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="UvDWMN6/";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="jU55NKha"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6157718B46D;
	Tue, 20 Aug 2024 09:35:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724146504; cv=none; b=rguYxTVVw4EPxdGUcdmIxLf0yt7GZU52hZBuUtesQjVsKk0v9pZA491KvvyPNsFcnmB76z6pNnw75qR3N8HnkmBJZ0hI0rhY7C7R/B1gn3KJi7cRsI9GTNZF8LlUjETkyDUFhOnarfKqftMh41pqdZD7hWZWSnwnEODow7tVHyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724146504; c=relaxed/simple;
	bh=bxkwR+gKTVUd2geHfByJ7hzu9D32K6p9OOT/NtwbgzI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=F+fcSFiQJhvu4IGAbQXflo1uMyVX7Cv+XQqi8W5hI6Sf/PTehTxv2ujmfPC1jprKaH3yYyvO4K9Fyk5v/mgcdobEBijjmYSs+ITnrzkFqG2OA797hnbYq6GKPu6+td+t4fvv7cz9WGDaArK3baygrKKemIw+qa7QvA9P7Bz5el8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=UvDWMN6/; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=jU55NKha; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=UvDWMN6/; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=jU55NKha; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 7D15F22509;
	Tue, 20 Aug 2024 09:35:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1724146500; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zfoDWSf8/KpMvUgri33pZdUHWlpxp8R6PeDH0tG5gmE=;
	b=UvDWMN6/69sjtVCU7n2/z7zQ+kr3dJ1HiWrdam6IGsdHts/TVqzMEBXfEnDb0wFU0xeUuc
	NZxIkvNwyQu2RpM+FH+m8LIEVBqtYP6GMkDzpXBalXbh5H78a6Dmy3tQFv3zFrCJr/6c5f
	yMDw+msxs1KTJJjGDsSvlP9uytChqWA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1724146500;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zfoDWSf8/KpMvUgri33pZdUHWlpxp8R6PeDH0tG5gmE=;
	b=jU55NKhaSF95uI/ftzLX5/cvMrTLKvBLJF7mHWXcVVhzKdm0zsXD1nGsuujZeFmVQILjUE
	5cWsu//HRsOlvLBg==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b="UvDWMN6/";
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=jU55NKha
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1724146500; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zfoDWSf8/KpMvUgri33pZdUHWlpxp8R6PeDH0tG5gmE=;
	b=UvDWMN6/69sjtVCU7n2/z7zQ+kr3dJ1HiWrdam6IGsdHts/TVqzMEBXfEnDb0wFU0xeUuc
	NZxIkvNwyQu2RpM+FH+m8LIEVBqtYP6GMkDzpXBalXbh5H78a6Dmy3tQFv3zFrCJr/6c5f
	yMDw+msxs1KTJJjGDsSvlP9uytChqWA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1724146500;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zfoDWSf8/KpMvUgri33pZdUHWlpxp8R6PeDH0tG5gmE=;
	b=jU55NKhaSF95uI/ftzLX5/cvMrTLKvBLJF7mHWXcVVhzKdm0zsXD1nGsuujZeFmVQILjUE
	5cWsu//HRsOlvLBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 1E99E13770;
	Tue, 20 Aug 2024 09:35:00 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id qKQ5BkRjxGa3RAAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Tue, 20 Aug 2024 09:35:00 +0000
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
Subject: [PATCH 02/28] backlight: lcd: Test against struct fb_info.lcd_dev
Date: Tue, 20 Aug 2024 11:22:40 +0200
Message-ID: <20240820093452.68270-3-tzimmermann@suse.de>
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
X-Rspamd-Queue-Id: 7D15F22509
X-Spam-Level: 
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:email,suse.de:dkim,suse.de:mid];
	FROM_EQ_ENVFROM(0.00)[];
	R_RATELIMIT(0.00)[to_ip_from(RLk469idygq4891mojaqehp6ty)];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	TO_DN_SOME(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com,gmx.de,mail.ru]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -3.01
X-Spam-Flag: NO

Add struct fb_info.lcd_dev for fbdev drivers to store a reference to
their lcd device. Update the lcd's fb_notifier_callback() to test for
this field. The lcd module can now detect if an lcd device belongs to
an fbdev device.

This works similar to the bl_dev for backlights and will allow for
the removal of the check_fb callback from several fbdev driver's lcd
devices.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/video/backlight/lcd.c |  3 +++
 include/linux/fb.h            | 13 +++++++++++++
 2 files changed, 16 insertions(+)

diff --git a/drivers/video/backlight/lcd.c b/drivers/video/backlight/lcd.c
index 0cd0fa1b24f9..43a6752ec27f 100644
--- a/drivers/video/backlight/lcd.c
+++ b/drivers/video/backlight/lcd.c
@@ -30,6 +30,7 @@ static int fb_notifier_callback(struct notifier_block *self,
 	struct lcd_device *ld;
 	struct fb_event *evdata = data;
 	struct fb_info *info = evdata->info;
+	struct lcd_device *fb_lcd = fb_lcd_device(info);
 
 	ld = container_of(self, struct lcd_device, fb_notif);
 	mutex_lock(&ld->ops_lock);
@@ -38,6 +39,8 @@ static int fb_notifier_callback(struct notifier_block *self,
 		goto out;
 	if (ld->ops->check_fb && !ld->ops->check_fb(ld, evdata->info))
 		goto out;
+	if (fb_lcd && fb_lcd != ld)
+		goto out;
 
 	if (event == FB_EVENT_BLANK) {
 		if (ld->ops->set_power)
diff --git a/include/linux/fb.h b/include/linux/fb.h
index 865dad03e73e..bf1893616e9c 100644
--- a/include/linux/fb.h
+++ b/include/linux/fb.h
@@ -21,6 +21,7 @@ struct fb_info;
 struct file;
 struct i2c_adapter;
 struct inode;
+struct lcd_device;
 struct module;
 struct notifier_block;
 struct page;
@@ -480,6 +481,13 @@ struct fb_info {
 	struct mutex bl_curve_mutex;
 	u8 bl_curve[FB_BACKLIGHT_LEVELS];
 #endif
+
+	/*
+	 * Assigned LCD device; set before framebuffer
+	 * registration, remove after unregister
+	 */
+	struct lcd_device *lcd_dev;
+
 #ifdef CONFIG_FB_DEFERRED_IO
 	struct delayed_work deferred_work;
 	unsigned long npagerefs;
@@ -753,6 +761,11 @@ static inline struct backlight_device *fb_bl_device(struct fb_info *info)
 }
 #endif
 
+static inline struct lcd_device *fb_lcd_device(struct fb_info *info)
+{
+	return info->lcd_dev;
+}
+
 /* fbmon.c */
 #define FB_MAXTIMINGS		0
 #define FB_VSYNCTIMINGS		1
-- 
2.46.0


