Return-Path: <linux-omap+bounces-1933-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4188C95827C
	for <lists+linux-omap@lfdr.de>; Tue, 20 Aug 2024 11:35:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B50781F24857
	for <lists+linux-omap@lfdr.de>; Tue, 20 Aug 2024 09:35:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A360318C33B;
	Tue, 20 Aug 2024 09:35:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ttrkV99W";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="IdhlVyWN";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ttrkV99W";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="IdhlVyWN"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A185C18C018;
	Tue, 20 Aug 2024 09:35:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724146504; cv=none; b=ts6LJOQzjKQqqN0b5+Q/jpPJhqV46Ot6Gh42cCVu0KXYUgJd9XxpUk1AqWEbzRsKeeoKY/36lZ/CwSe9h0Rl/y0dVcTTm708w4mwuHmR9ehCpFSz/gBb/mFlqhwWPYbjVzHj2JObrDVnqX6g8GW+R2FEI84+n+K6S3gdkNA3TQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724146504; c=relaxed/simple;
	bh=hO+9/peRBRSOdRKYxz3cRAB9PYRVvZF1O3GdneUrT1Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VP8ypwwrNiEyZ4mhSwvzXvU6plnfBUkgKnP8Qs6MRPt5P0wfRX4u2q2pAVGj/AMrUxstcwsBjNSz1ZjTddss4NWor6nirYJXM+Nl+0UecxmnhSSSgn6aNi5+M4pKe65EkKAQZZ2sVANbYLCxM/nw40WY93YWSPqLSvKLeubP3+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ttrkV99W; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=IdhlVyWN; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ttrkV99W; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=IdhlVyWN; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id DEC611FFC7;
	Tue, 20 Aug 2024 09:35:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1724146500; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=12WOr2Ic7YY7MSE30hYZeg06cAskBzKrUPGQ1N0jNZ0=;
	b=ttrkV99WAkowS1AsPbapvlTuUEEKyTKMNk6mZmDEEI1C5LsqVM5U8Ixfd892DU6sIo77ZX
	s5FEMIEAaLDpUs1tKE3KLsuF31rEatNvLOXufuwDPOCpvixno2enIv74Jv+xEMbheB7Pyx
	pfbIPQv5Dy9I6cKmKNqmKMXRQYIUDdM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1724146500;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=12WOr2Ic7YY7MSE30hYZeg06cAskBzKrUPGQ1N0jNZ0=;
	b=IdhlVyWNn4Bwt9UqkZ++PX9SML1oiwTb477Bb5K/W0subaHSv1P5rq6kSOkENgfu1EPC7f
	mbTUCZS2MpxOTmBg==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=ttrkV99W;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=IdhlVyWN
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1724146500; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=12WOr2Ic7YY7MSE30hYZeg06cAskBzKrUPGQ1N0jNZ0=;
	b=ttrkV99WAkowS1AsPbapvlTuUEEKyTKMNk6mZmDEEI1C5LsqVM5U8Ixfd892DU6sIo77ZX
	s5FEMIEAaLDpUs1tKE3KLsuF31rEatNvLOXufuwDPOCpvixno2enIv74Jv+xEMbheB7Pyx
	pfbIPQv5Dy9I6cKmKNqmKMXRQYIUDdM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1724146500;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=12WOr2Ic7YY7MSE30hYZeg06cAskBzKrUPGQ1N0jNZ0=;
	b=IdhlVyWNn4Bwt9UqkZ++PX9SML1oiwTb477Bb5K/W0subaHSv1P5rq6kSOkENgfu1EPC7f
	mbTUCZS2MpxOTmBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 81C6013AFE;
	Tue, 20 Aug 2024 09:35:00 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 0MN6HkRjxGa3RAAAD6G6ig
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
Subject: [PATCH 03/28] backlight: lcd: Add LCD_POWER_ constants for power states
Date: Tue, 20 Aug 2024 11:22:41 +0200
Message-ID: <20240820093452.68270-4-tzimmermann@suse.de>
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
X-Rspamd-Queue-Id: DEC611FFC7
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:dkim,suse.de:mid,suse.de:email];
	FROM_EQ_ENVFROM(0.00)[];
	R_RATELIMIT(0.00)[to_ip_from(RLk469idygq4891mojaqehp6ty)];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	TO_DN_SOME(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com,gmx.de,mail.ru]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO
X-Spam-Level: 

Duplicate FB_BLANK_ constants as LCD_POWER_ constants in the lcd
header file. Allows lcd drivers to avoid including the fbdev header
file and removes a compile-time dependency between the two subsystems.

The new LCD_POWER_ constants have the same values as their
FB_BLANK_ counterparts. Hence semantics does not change and the lcd
drivers can be converted one by one. Each instance of FB_BLANK_UNBLANK
becomes LCD_POWER_ON, each of FB_BLANK_POWERDOWN becomes LCD_POWER_OFF,
FB_BLANK_NORMAL becomes LCD_POWER_REDUCED and FB_BLANK_VSYNC_SUSPEND
becomes LCD_POWER_REDUCED_VSYNC_SUSPEND.

Lcd code or drivers do not use FB_BLANK_HSYNC_SUSPEND, so no
new constants for this is being added. The tokens LCD_POWER_REDUCED
and LCD_POWER_REDUCED_VSYNC_SUSPEND are deprecated and drivers should
replace them with LCD_POWER_ON and LCD_POWER_OFF.

See also commit a1cacb8a8e70 ("backlight: Add BACKLIGHT_POWER_ constants
for power states"), which added similar constants fro backlight drivers.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/video/backlight/lcd.c | 22 +++++++++++++++++++++-
 include/linux/lcd.h           |  5 +++++
 2 files changed, 26 insertions(+), 1 deletion(-)

diff --git a/drivers/video/backlight/lcd.c b/drivers/video/backlight/lcd.c
index 43a6752ec27f..edd5ccb7a43a 100644
--- a/drivers/video/backlight/lcd.c
+++ b/drivers/video/backlight/lcd.c
@@ -20,6 +20,24 @@
 
 #if defined(CONFIG_FB) || (defined(CONFIG_FB_MODULE) && \
 			   defined(CONFIG_LCD_CLASS_DEVICE_MODULE))
+static int to_lcd_power(int fb_blank)
+{
+	switch (fb_blank) {
+	case FB_BLANK_UNBLANK:
+		return LCD_POWER_ON;
+	/* deprecated; TODO: should become 'off' */
+	case FB_BLANK_NORMAL:
+		return LCD_POWER_REDUCED;
+	case FB_BLANK_VSYNC_SUSPEND:
+		return LCD_POWER_REDUCED_VSYNC_SUSPEND;
+	/* 'off' */
+	case FB_BLANK_HSYNC_SUSPEND:
+	case FB_BLANK_POWERDOWN:
+	default:
+		return LCD_POWER_OFF;
+	}
+}
+
 /* This callback gets called when something important happens inside a
  * framebuffer driver. We're looking if that important event is blanking,
  * and if it is, we're switching lcd power as well ...
@@ -43,8 +61,10 @@ static int fb_notifier_callback(struct notifier_block *self,
 		goto out;
 
 	if (event == FB_EVENT_BLANK) {
+		int power = to_lcd_power(*(int *)evdata->data);
+
 		if (ld->ops->set_power)
-			ld->ops->set_power(ld, *(int *)evdata->data);
+			ld->ops->set_power(ld, power);
 	} else {
 		if (ld->ops->set_mode)
 			ld->ops->set_mode(ld, evdata->data);
diff --git a/include/linux/lcd.h b/include/linux/lcd.h
index 68703a51dc53..dfcc54d327f5 100644
--- a/include/linux/lcd.h
+++ b/include/linux/lcd.h
@@ -14,6 +14,11 @@
 #include <linux/notifier.h>
 #include <linux/fb.h>
 
+#define LCD_POWER_ON			(0)
+#define LCD_POWER_REDUCED		(1) // deprecated; don't use in new code
+#define LCD_POWER_REDUCED_VSYNC_SUSPEND	(2) // deprecated; don't use in new code
+#define LCD_POWER_OFF			(4)
+
 /* Notes on locking:
  *
  * lcd_device->ops_lock is an internal backlight lock protecting the ops
-- 
2.46.0


