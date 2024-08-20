Return-Path: <linux-omap+bounces-1934-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 13427958281
	for <lists+linux-omap@lfdr.de>; Tue, 20 Aug 2024 11:35:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C3E40283207
	for <lists+linux-omap@lfdr.de>; Tue, 20 Aug 2024 09:35:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3CB0918C34A;
	Tue, 20 Aug 2024 09:35:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="zBzdtIw/";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="lT2X/hq/";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="zBzdtIw/";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="lT2X/hq/"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 696AF18A952;
	Tue, 20 Aug 2024 09:35:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724146504; cv=none; b=KgrYt9UENxo2MD6ncKoaQiGrTG3ow1e705On06XTa9ErsztL5mM1Yf8Yf/mLmJJm3kZQdU59GZPbb4/ueABh+miShvTPAflhgcsvd+qT69PoXkJmdjWx1xbCxckkjmww8VwND558BGMC/EZV0bOJzQr7cxtrkW6ycwLUqexmETo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724146504; c=relaxed/simple;
	bh=a4j/zCB3LonyNSm1Cg1mFxOXAPFIuLS4h9WLwIG776Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PT4ifmjOFk1K3jhye+E0qS1+sfOr5h3sqpiogk74BjiLfTCwyDOsZvREwU6fYTttmprr9O5tzy+FmVW2xW3674OOgpZOHY5OJVDhX4XI4wgx1oMI8Q1+bw7u2gGlu+BbrthKA65DP+woe3Uun60Pouuw6OqLcACx81Ih5jA2W1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=zBzdtIw/; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=lT2X/hq/; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=zBzdtIw/; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=lT2X/hq/; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id C097D224E2;
	Tue, 20 Aug 2024 09:35:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1724146501; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=C8RjHLtGUGznPny8uWoKkT9lDQHyybnApAofaOhEFU8=;
	b=zBzdtIw/LgmpKa0bGvkeIE8osCuZoYVUUirjDSDWRjBbCTCLxHB/v/vdVq8FPBYwKR9o87
	7ACmVIobNjH3MmHNx24BaFY9LQt29bCG1fOz7w3m4tPCOZCTTmmAY92nI4lH5UMT+yimIp
	B6inVpT5GDgsC6ZCdP16m/wzP1Mq7rM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1724146501;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=C8RjHLtGUGznPny8uWoKkT9lDQHyybnApAofaOhEFU8=;
	b=lT2X/hq/EGGlF5zA0drE03IEBpMpfBqUbY/YvnvZ49HkumYMFzy8p57uR9IQnHGV/bM5gi
	6bEVIoEfZ5UROLAA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1724146501; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=C8RjHLtGUGznPny8uWoKkT9lDQHyybnApAofaOhEFU8=;
	b=zBzdtIw/LgmpKa0bGvkeIE8osCuZoYVUUirjDSDWRjBbCTCLxHB/v/vdVq8FPBYwKR9o87
	7ACmVIobNjH3MmHNx24BaFY9LQt29bCG1fOz7w3m4tPCOZCTTmmAY92nI4lH5UMT+yimIp
	B6inVpT5GDgsC6ZCdP16m/wzP1Mq7rM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1724146501;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=C8RjHLtGUGznPny8uWoKkT9lDQHyybnApAofaOhEFU8=;
	b=lT2X/hq/EGGlF5zA0drE03IEBpMpfBqUbY/YvnvZ49HkumYMFzy8p57uR9IQnHGV/bM5gi
	6bEVIoEfZ5UROLAA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 5782513AFE;
	Tue, 20 Aug 2024 09:35:01 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id yE4qFEVjxGa3RAAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Tue, 20 Aug 2024 09:35:01 +0000
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
Subject: [PATCH 05/28] backlight: hx8357: Use lcd power constants
Date: Tue, 20 Aug 2024 11:22:43 +0200
Message-ID: <20240820093452.68270-6-tzimmermann@suse.de>
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
	R_RATELIMIT(0.00)[to_ip_from(RL7eb4yoy35resap1sns3bbybe)];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FREEMAIL_ENVRCPT(0.00)[gmail.com,gmx.de,mail.ru]
X-Spam-Score: -2.80
X-Spam-Flag: NO

Replace FB_BLANK_ constants with their counterparts from the
lcd subsystem. The values are identical, so there's no change
in functionality.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/video/backlight/hx8357.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/video/backlight/hx8357.c b/drivers/video/backlight/hx8357.c
index cdd7b7686723..61a57d38700f 100644
--- a/drivers/video/backlight/hx8357.c
+++ b/drivers/video/backlight/hx8357.c
@@ -532,7 +532,7 @@ static int hx8369_lcd_init(struct lcd_device *lcdev)
 	return 0;
 }
 
-#define POWER_IS_ON(pwr)	((pwr) <= FB_BLANK_NORMAL)
+#define POWER_IS_ON(pwr)	((pwr) <= LCD_POWER_REDUCED)
 
 static int hx8357_set_power(struct lcd_device *lcdev, int power)
 {
-- 
2.46.0


