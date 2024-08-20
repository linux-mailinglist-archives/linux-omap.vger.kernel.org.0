Return-Path: <linux-omap+bounces-1941-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id F364B958291
	for <lists+linux-omap@lfdr.de>; Tue, 20 Aug 2024 11:36:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 50797B23C30
	for <lists+linux-omap@lfdr.de>; Tue, 20 Aug 2024 09:36:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F064218A952;
	Tue, 20 Aug 2024 09:35:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ydUttb3q";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="yjb5+Ele";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ydUttb3q";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="yjb5+Ele"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0621C18C358;
	Tue, 20 Aug 2024 09:35:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724146507; cv=none; b=QadYqcXujPXx3AdyNhskjXrxGPco9WoHHVeH0tCJB46A7VAqDDnksoWmxedcpi7n529aLuysx6kjMLz+pNUtl6f8NJvuVahDGr+ikVoCk32+h9eJ2kmWaLrufJWNnEl/nd1DVkyup9w0vi2afgp8V8BWZTmvFiiDYjJzP84GBPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724146507; c=relaxed/simple;
	bh=XKdxtPpHNfW7MrLsu2v96hY5kAx1IlR8ckf8LVvP2T4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=l+Zout1jthwMLhcNYSfw0+TkZ1ZOJYzokf9wU3l4VzXG378dwxHnR50dJNtf5HbjQ/yi1lhny0zlZtEtCRpUkSEwiPS1rFGAG4Sa2BqW+DawTfQcf/X6isrLjvYSFsaVmEk5CFEQ+IZdGKgZSRMsd4mIGLaho28ALjDwV+hwowg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ydUttb3q; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=yjb5+Ele; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ydUttb3q; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=yjb5+Ele; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 507F21FFCD;
	Tue, 20 Aug 2024 09:35:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1724146504; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=W8gqg9IK6mu7XoSOow6pCGBRFL4qW/0GEnyMslozgJU=;
	b=ydUttb3qXWFCw5SdDs6j37LoFk4wNTcYc0ZIzm/MIRK0YCwI6TPBYLvdJtVZThjqrFnXE1
	y8GyWVBBPvmSpE1QB9aGBDupSivSDO6DWxDpciQ0Z5auSUyuUfTFXgTN8JcH8dwwBMe8Ft
	+YqY4SfX2smBnbWaSXDX0CXBsl5hS/E=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1724146504;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=W8gqg9IK6mu7XoSOow6pCGBRFL4qW/0GEnyMslozgJU=;
	b=yjb5+EleAsFR7UBtX5U65N279E4BH0E4AKqTiOsjZzlkv+lh2d7qoGrRmX/0QFbVvWdZsQ
	yzKksezKhv0hUYAw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1724146504; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=W8gqg9IK6mu7XoSOow6pCGBRFL4qW/0GEnyMslozgJU=;
	b=ydUttb3qXWFCw5SdDs6j37LoFk4wNTcYc0ZIzm/MIRK0YCwI6TPBYLvdJtVZThjqrFnXE1
	y8GyWVBBPvmSpE1QB9aGBDupSivSDO6DWxDpciQ0Z5auSUyuUfTFXgTN8JcH8dwwBMe8Ft
	+YqY4SfX2smBnbWaSXDX0CXBsl5hS/E=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1724146504;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=W8gqg9IK6mu7XoSOow6pCGBRFL4qW/0GEnyMslozgJU=;
	b=yjb5+EleAsFR7UBtX5U65N279E4BH0E4AKqTiOsjZzlkv+lh2d7qoGrRmX/0QFbVvWdZsQ
	yzKksezKhv0hUYAw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id E7C5113AFE;
	Tue, 20 Aug 2024 09:35:03 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id CCVzN0djxGa3RAAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Tue, 20 Aug 2024 09:35:03 +0000
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
Subject: [PATCH 11/28] backlight: lms283gf05: Use lcd power constants
Date: Tue, 20 Aug 2024 11:22:49 +0200
Message-ID: <20240820093452.68270-12-tzimmermann@suse.de>
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
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:email,imap1.dmz-prg2.suse.org:helo];
	FREEMAIL_TO(0.00)[kernel.org,linaro.org,gmail.com,gmx.de,linux-vserver.org,mail.ru,pengutronix.de];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	R_RATELIMIT(0.00)[to_ip_from(RL7eb4yoy35resap1sns3bbybe)];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FREEMAIL_ENVRCPT(0.00)[gmail.com,gmx.de,mail.ru]
X-Spam-Flag: NO
X-Spam-Level: 

Replace FB_BLANK_ constants with their counterparts from the
lcd subsystem. The values are identical, so there's no change
in functionality.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/video/backlight/lms283gf05.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/video/backlight/lms283gf05.c b/drivers/video/backlight/lms283gf05.c
index a65490e83d3d..c8b7eeeb333e 100644
--- a/drivers/video/backlight/lms283gf05.c
+++ b/drivers/video/backlight/lms283gf05.c
@@ -126,7 +126,7 @@ static int lms283gf05_power_set(struct lcd_device *ld, int power)
 	struct lms283gf05_state *st = lcd_get_data(ld);
 	struct spi_device *spi = st->spi;
 
-	if (power <= FB_BLANK_NORMAL) {
+	if (power <= LCD_POWER_REDUCED) {
 		if (st->reset)
 			lms283gf05_reset(st->reset);
 		lms283gf05_toggle(spi, disp_initseq, ARRAY_SIZE(disp_initseq));
-- 
2.46.0


