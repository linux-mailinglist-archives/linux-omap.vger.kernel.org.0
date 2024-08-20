Return-Path: <linux-omap+bounces-1946-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A0560958299
	for <lists+linux-omap@lfdr.de>; Tue, 20 Aug 2024 11:36:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C50F71C2462B
	for <lists+linux-omap@lfdr.de>; Tue, 20 Aug 2024 09:36:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 453A418CC1D;
	Tue, 20 Aug 2024 09:35:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="1TI+FpX9";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="y6y2F8TG";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="1TI+FpX9";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="y6y2F8TG"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EFFB18C00F;
	Tue, 20 Aug 2024 09:35:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724146509; cv=none; b=AHhWmdD2Kzn1/0icnk3VKwJHoFmgq3uMqqk6CghyitzthB67Y4/9xAu5PlRI/KCM8h2RgOVoMAaWaA0LA7ZO3xn1T+WzyBQDUbIJ9RlQwR2aIOUb5HEbR3hPLw9ysZwccOYa4RRb0gQnLgDqfygTjzWHl+mZFOrjkoYTrIoxPsI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724146509; c=relaxed/simple;
	bh=DxDf1zsQbetdovU8JbjOM0B9B6XVxIcaM4WZWxQgZfw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hNUp9cN22OD6UGqPfD2iSgw7RiCjlMnwIkSxvwmZQWGlreqGnbQfuPnUme8AQkyovmKQ6y6kPE8BghTVK29VK2cxXNxv8ESwMNTNMjDhwLwsGzhC1h7JEHXYZCU9qK+s3LFlOcpXnG2HCsbWG8mv2gFfmcBSJRhop2hnrXyKnT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=1TI+FpX9; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=y6y2F8TG; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=1TI+FpX9; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=y6y2F8TG; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 703E11FFD1;
	Tue, 20 Aug 2024 09:35:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1724146506; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MjbhB8/GIHRogDfxfQJnk09tWcgbJ7P8qGEWnzsjrt0=;
	b=1TI+FpX9g9FnSMu5VofFR16u6slF0sxMsjIkc7TlBP8PgVESWpzklgjpq5WWcbkWE15jbe
	82wuGgwunzAMZqgF9m2lTNxt6QM/M7lbhkoVikmMWymr9OK8DI7+OJ7AkxwL2oZRlq7gbG
	ChLgRUmQ+RHyxMhByVcGkPcHIOhK7Yk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1724146506;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MjbhB8/GIHRogDfxfQJnk09tWcgbJ7P8qGEWnzsjrt0=;
	b=y6y2F8TGJmaHcHICfwQt2ZDS3s1+7Pm5ZJ2FllmWeDJ4iHBxlXQaiA7TbtH4NJnqATX7tV
	HEkSSZXJpOVLR2DA==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=1TI+FpX9;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=y6y2F8TG
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1724146506; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MjbhB8/GIHRogDfxfQJnk09tWcgbJ7P8qGEWnzsjrt0=;
	b=1TI+FpX9g9FnSMu5VofFR16u6slF0sxMsjIkc7TlBP8PgVESWpzklgjpq5WWcbkWE15jbe
	82wuGgwunzAMZqgF9m2lTNxt6QM/M7lbhkoVikmMWymr9OK8DI7+OJ7AkxwL2oZRlq7gbG
	ChLgRUmQ+RHyxMhByVcGkPcHIOhK7Yk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1724146506;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MjbhB8/GIHRogDfxfQJnk09tWcgbJ7P8qGEWnzsjrt0=;
	b=y6y2F8TGJmaHcHICfwQt2ZDS3s1+7Pm5ZJ2FllmWeDJ4iHBxlXQaiA7TbtH4NJnqATX7tV
	HEkSSZXJpOVLR2DA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 0596613770;
	Tue, 20 Aug 2024 09:35:06 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id uOsuAEpjxGa3RAAAD6G6ig
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
Subject: [PATCH 16/28] backlight: platform_lcd: Remove include statement for <linux/backlight.h>
Date: Tue, 20 Aug 2024 11:22:54 +0200
Message-ID: <20240820093452.68270-17-tzimmermann@suse.de>
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
X-Rspamd-Queue-Id: 703E11FFD1
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
	R_RATELIMIT(0.00)[to_ip_from(RLk469idygq4891mojaqehp6ty)];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	TO_DN_SOME(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com,gmx.de,mail.ru]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO
X-Spam-Level: 

This lcd driver does not depend on backlight interfaces. Remove the
include statement.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/video/backlight/platform_lcd.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/video/backlight/platform_lcd.c b/drivers/video/backlight/platform_lcd.c
index b0af612834a7..08d0ff400d88 100644
--- a/drivers/video/backlight/platform_lcd.c
+++ b/drivers/video/backlight/platform_lcd.c
@@ -10,7 +10,6 @@
 #include <linux/module.h>
 #include <linux/platform_device.h>
 #include <linux/fb.h>
-#include <linux/backlight.h>
 #include <linux/lcd.h>
 #include <linux/slab.h>
 
-- 
2.46.0


