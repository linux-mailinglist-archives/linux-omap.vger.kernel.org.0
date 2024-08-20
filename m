Return-Path: <linux-omap+bounces-1944-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 01150958295
	for <lists+linux-omap@lfdr.de>; Tue, 20 Aug 2024 11:36:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id ACFE51F2472A
	for <lists+linux-omap@lfdr.de>; Tue, 20 Aug 2024 09:36:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65DBB18C018;
	Tue, 20 Aug 2024 09:35:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Bs/HupYq";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="lD+o5kZn";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Bs/HupYq";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="lD+o5kZn"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 937A218CBFC;
	Tue, 20 Aug 2024 09:35:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724146509; cv=none; b=oOo2eO6LiUxrvWHZa6GLBZqwUj9k0TSoxAWeUgns73MQL5j3Mb33j5SzsLvt7CKCXQ3cbN6t+TmF8V/oOxSavgVhAOLnuojSzMPVT2+vzE3IUiejn9FtY38xEuPWNk6hHYzRHcJPXjp+cXkGxl1QoeB1e0L538Bm0NBSC4JM9qA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724146509; c=relaxed/simple;
	bh=zP+U3n7fgWsu3BlENtcBBqZNiFPkb0qxhosi9R/2/7M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VhhxCzuMdtpF7p622AN4Iz7j2y4WrKSxW9gRvbq2W9W99rqOnnelkDAaZGNt7vaRKAGoc5J1Hp5Yww/Eg2R0MKuaQsQ2yLfCOS2W5oZYF0ktcocVAmki84q7gxNZrkkXLXnMdi4mSzYSoeCbtQQbyugXfB9jwoKt/TiDoqX1VxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Bs/HupYq; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=lD+o5kZn; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Bs/HupYq; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=lD+o5kZn; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 00BC81FFD0;
	Tue, 20 Aug 2024 09:35:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1724146506; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=i4j6MXpEvcW8BwOzb35DyKgwOAyAHiF6T0pH+QwK6F0=;
	b=Bs/HupYquVb1kOM0sZySwH1lgvqWYZxibku48Vy7knb8UHSbtL2xBKbYFXMoXuZ1LrCcp/
	iPsyYTtIFKytjSxle2VCN0RpBNMpX+S9iBwyXdPNNtgu4xIC7KSEAD5WOz0SlgngDa/fm3
	i4hI7OTMdTfUiFElYzk+diKxod9Fp04=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1724146506;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=i4j6MXpEvcW8BwOzb35DyKgwOAyAHiF6T0pH+QwK6F0=;
	b=lD+o5kZnCer2qkaHFFodk0zypIVCUpB+K2HPryYmFa2/mWWQZDrp4iLWcs9QTsEVW6EhA3
	utNa3PmIQY9Zz7Ag==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1724146506; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=i4j6MXpEvcW8BwOzb35DyKgwOAyAHiF6T0pH+QwK6F0=;
	b=Bs/HupYquVb1kOM0sZySwH1lgvqWYZxibku48Vy7knb8UHSbtL2xBKbYFXMoXuZ1LrCcp/
	iPsyYTtIFKytjSxle2VCN0RpBNMpX+S9iBwyXdPNNtgu4xIC7KSEAD5WOz0SlgngDa/fm3
	i4hI7OTMdTfUiFElYzk+diKxod9Fp04=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1724146506;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=i4j6MXpEvcW8BwOzb35DyKgwOAyAHiF6T0pH+QwK6F0=;
	b=lD+o5kZnCer2qkaHFFodk0zypIVCUpB+K2HPryYmFa2/mWWQZDrp4iLWcs9QTsEVW6EhA3
	utNa3PmIQY9Zz7Ag==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 95C2213AFE;
	Tue, 20 Aug 2024 09:35:05 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id uKlhI0ljxGa3RAAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Tue, 20 Aug 2024 09:35:05 +0000
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
Subject: [PATCH 15/28] backlight: otm3225a: Use lcd power constants
Date: Tue, 20 Aug 2024 11:22:53 +0200
Message-ID: <20240820093452.68270-16-tzimmermann@suse.de>
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:mid,imap1.dmz-prg2.suse.org:helo];
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
 drivers/video/backlight/otm3225a.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/video/backlight/otm3225a.c b/drivers/video/backlight/otm3225a.c
index efe52fa08b07..5c6575f23ea8 100644
--- a/drivers/video/backlight/otm3225a.c
+++ b/drivers/video/backlight/otm3225a.c
@@ -189,7 +189,7 @@ static int otm3225a_set_power(struct lcd_device *ld, int power)
 	if (power == dd->power)
 		return 0;
 
-	if (power > FB_BLANK_UNBLANK)
+	if (power > LCD_POWER_ON)
 		otm3225a_write(dd->spi, display_off, ARRAY_SIZE(display_off));
 	else
 		otm3225a_write(dd->spi, display_on, ARRAY_SIZE(display_on));
-- 
2.46.0


