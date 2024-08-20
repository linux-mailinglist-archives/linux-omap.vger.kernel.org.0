Return-Path: <linux-omap+bounces-1931-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CB3E958278
	for <lists+linux-omap@lfdr.de>; Tue, 20 Aug 2024 11:35:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D8E582820EE
	for <lists+linux-omap@lfdr.de>; Tue, 20 Aug 2024 09:35:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0EFF18C32B;
	Tue, 20 Aug 2024 09:35:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="tLf/Y8Lu";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="u2OFS3Sn";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="tLf/Y8Lu";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="u2OFS3Sn"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDEB118A95C;
	Tue, 20 Aug 2024 09:35:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724146503; cv=none; b=jGntzfvyiQsg0mx9fLVHsFu+bBx601wINr1q1LbZFRR3kK0S19f2a+0DsOZEDrquJW2koUx9VSnvhcDgRApbrjFT5rLcCPO+qY1YRsN8XE7+6aaSqnhiKE/E6/v4qMiszcVXi/VwHlz50+l2onuAuqFj5vht6wPDV9rRCUwQeXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724146503; c=relaxed/simple;
	bh=8htW52eocGo7Q/Y0CHMuwLgGtd94hHMoYZJ9mWvlhJ8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BtDdIjYjP4lXlJSOjxAaF3f65DGJUHJvRfK1r7jmipUxvQBZM9boaw+vZe6i8dRUpIZ04rXshJsl3m3xrA0pZ/iqJ/d1LQ3IiwgMP1DAC5O9xWG5tIlmEqawmcrqLVRt+IFsfkvj6a4Yvv8yTxjlflYKcPaUEKZII3WKts3lDVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=tLf/Y8Lu; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=u2OFS3Sn; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=tLf/Y8Lu; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=u2OFS3Sn; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 178451FFC8;
	Tue, 20 Aug 2024 09:35:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1724146500; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RdYJKJBzIuJjmmFlZR1srYPPFdL6Wytap1BTJ9bD9YE=;
	b=tLf/Y8Luu1c0nMqYb7IT8+MAc3LbQALDPqTH6gsOMvC9qLfMUWjtO995BgvyTZ8djJcWDn
	ilFP4DtDFL3Axa+OhtudXlURoMytFu0VMbYTvGqPhjyT+4SavWGhI0KSPzcBZwRHyR7RYi
	sE+sUBarzR9lIE9jw75ffXwysZ4Q7nQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1724146500;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RdYJKJBzIuJjmmFlZR1srYPPFdL6Wytap1BTJ9bD9YE=;
	b=u2OFS3SnWkU8dy1WFlB/8tIon03NpjGoe7IWousttdZ1IpLcVKnc1K7R3vxANOAi+0uy3e
	808N9UxrehAjs9CQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1724146500; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RdYJKJBzIuJjmmFlZR1srYPPFdL6Wytap1BTJ9bD9YE=;
	b=tLf/Y8Luu1c0nMqYb7IT8+MAc3LbQALDPqTH6gsOMvC9qLfMUWjtO995BgvyTZ8djJcWDn
	ilFP4DtDFL3Axa+OhtudXlURoMytFu0VMbYTvGqPhjyT+4SavWGhI0KSPzcBZwRHyR7RYi
	sE+sUBarzR9lIE9jw75ffXwysZ4Q7nQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1724146500;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RdYJKJBzIuJjmmFlZR1srYPPFdL6Wytap1BTJ9bD9YE=;
	b=u2OFS3SnWkU8dy1WFlB/8tIon03NpjGoe7IWousttdZ1IpLcVKnc1K7R3vxANOAi+0uy3e
	808N9UxrehAjs9CQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 926BA13AFE;
	Tue, 20 Aug 2024 09:34:59 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id iKvxIENjxGa3RAAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Tue, 20 Aug 2024 09:34:59 +0000
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
Subject: [PATCH 01/28] backlight: lcd: Rearrange code in fb_notifier_callback()
Date: Tue, 20 Aug 2024 11:22:39 +0200
Message-ID: <20240820093452.68270-2-tzimmermann@suse.de>
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
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,linaro.org,gmail.com,gmx.de,linux-vserver.org,mail.ru,pengutronix.de];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RCVD_COUNT_TWO(0.00)[2];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:email,imap1.dmz-prg2.suse.org:helo];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com,gmx.de,mail.ru]
X-Spam-Flag: NO
X-Spam-Level: 

First aqcuire the ops_lock and do al tests while holing it. Rearranges
the code in lcd's fb_notifier_callback() to resemble the callback in
the backlight module. This will simplify later changes to these tests.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/video/backlight/lcd.c | 24 ++++++++++++++----------
 1 file changed, 14 insertions(+), 10 deletions(-)

diff --git a/drivers/video/backlight/lcd.c b/drivers/video/backlight/lcd.c
index ceec90ca758b..0cd0fa1b24f9 100644
--- a/drivers/video/backlight/lcd.c
+++ b/drivers/video/backlight/lcd.c
@@ -29,21 +29,25 @@ static int fb_notifier_callback(struct notifier_block *self,
 {
 	struct lcd_device *ld;
 	struct fb_event *evdata = data;
+	struct fb_info *info = evdata->info;
 
 	ld = container_of(self, struct lcd_device, fb_notif);
+	mutex_lock(&ld->ops_lock);
+
 	if (!ld->ops)
-		return 0;
+		goto out;
+	if (ld->ops->check_fb && !ld->ops->check_fb(ld, evdata->info))
+		goto out;
 
-	mutex_lock(&ld->ops_lock);
-	if (!ld->ops->check_fb || ld->ops->check_fb(ld, evdata->info)) {
-		if (event == FB_EVENT_BLANK) {
-			if (ld->ops->set_power)
-				ld->ops->set_power(ld, *(int *)evdata->data);
-		} else {
-			if (ld->ops->set_mode)
-				ld->ops->set_mode(ld, evdata->data);
-		}
+	if (event == FB_EVENT_BLANK) {
+		if (ld->ops->set_power)
+			ld->ops->set_power(ld, *(int *)evdata->data);
+	} else {
+		if (ld->ops->set_mode)
+			ld->ops->set_mode(ld, evdata->data);
 	}
+
+out:
 	mutex_unlock(&ld->ops_lock);
 	return 0;
 }
-- 
2.46.0


