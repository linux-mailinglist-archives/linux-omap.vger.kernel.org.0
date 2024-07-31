Return-Path: <linux-omap+bounces-1811-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 41808942E97
	for <lists+linux-omap@lfdr.de>; Wed, 31 Jul 2024 14:35:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B9CAF1F22A44
	for <lists+linux-omap@lfdr.de>; Wed, 31 Jul 2024 12:35:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83ABF1B012D;
	Wed, 31 Jul 2024 12:35:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="w9a7OUOE";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="93xQwPEH";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="w9a7OUOE";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="93xQwPEH"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A7361AE869;
	Wed, 31 Jul 2024 12:35:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722429311; cv=none; b=gfDcmOC7NOXfUTF+DMEUeQUlL13Z5qSv81ItvI9zL0Cx4HN+AYeCeWoz9pXSyoclmf+lcsqKLvKAiTBW/iDtI8aYIhYLf4reduIBNG4KG+Gla00gRlCLFDDrNGJ8JdB022C9vLEtrtewpokOZ5KEne9U5gAfEcfEmJGg3W6oFos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722429311; c=relaxed/simple;
	bh=p05yJxkfqbBZumP/meBZ5LV3fb0xyrwFtHNBj878eqs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZGYa/GQoCn7xA1h8c5VfR2/yKAYAPNYzaykXDW8VY4JqpL2F0iR3EMof9/NAahS6kIXrXcKUgDJKF3/INyuTCv/gIymOqOmOfF7wnqYs0UQutW1C0i2QV5VccwTNqXvmPYMkynOr1M6EaANm+48bxXOoo3kGAEj4iC6/B1UCHYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=w9a7OUOE; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=93xQwPEH; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=w9a7OUOE; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=93xQwPEH; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id B25AC21A09;
	Wed, 31 Jul 2024 12:35:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1722429306; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xcWL7qAKyVPpswZYBwjAUaZeGQldwCq83FdsQGTGo9k=;
	b=w9a7OUOEhVumo5wTuUMDPwWroy7VcvXONzx/+LWOqD/Pfhm+8iLK5ksdkQ52XIeEKwl1tO
	YeTBhvy0+m1jEpl7hxVY6S7FCxmwRXP/UW9O25Cd7USBu6pPNJfXlKyExpus3icwH95cP2
	V7fgyiAGjHvay/49ocyJzLHmsxIXoKI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1722429306;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xcWL7qAKyVPpswZYBwjAUaZeGQldwCq83FdsQGTGo9k=;
	b=93xQwPEHORPDSPp16zjnd+RLAUD8PwKrRcBrdeF+8KzUpIbsDB2ZsPcgVkWotOl+UgOGqm
	1Xw4JFk5oxe262Cg==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=w9a7OUOE;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=93xQwPEH
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1722429306; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xcWL7qAKyVPpswZYBwjAUaZeGQldwCq83FdsQGTGo9k=;
	b=w9a7OUOEhVumo5wTuUMDPwWroy7VcvXONzx/+LWOqD/Pfhm+8iLK5ksdkQ52XIeEKwl1tO
	YeTBhvy0+m1jEpl7hxVY6S7FCxmwRXP/UW9O25Cd7USBu6pPNJfXlKyExpus3icwH95cP2
	V7fgyiAGjHvay/49ocyJzLHmsxIXoKI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1722429306;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xcWL7qAKyVPpswZYBwjAUaZeGQldwCq83FdsQGTGo9k=;
	b=93xQwPEHORPDSPp16zjnd+RLAUD8PwKrRcBrdeF+8KzUpIbsDB2ZsPcgVkWotOl+UgOGqm
	1Xw4JFk5oxe262Cg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 7E39F13AD8;
	Wed, 31 Jul 2024 12:35:06 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id cEqCHXovqmYiUQAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Wed, 31 Jul 2024 12:35:06 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: deller@gmx.de
Cc: linux-fbdev@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-omap@vger.kernel.org,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Antonino Daplas <adaplas@gmail.com>
Subject: [PATCH 5/9] fbdev: nvidiafb: Use backlight power constants
Date: Wed, 31 Jul 2024 14:33:46 +0200
Message-ID: <20240731123502.1145082-6-tzimmermann@suse.de>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240731123502.1145082-1-tzimmermann@suse.de>
References: <20240731123502.1145082-1-tzimmermann@suse.de>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: B25AC21A09
X-Spam-Score: -4.81
X-Spam-Level: 
X-Spam-Flag: NO
X-Spamd-Result: default: False [-4.81 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	DWL_DNSWL_MED(-2.00)[suse.de:dkim];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	FROM_EQ_ENVFROM(0.00)[];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:dkim,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.freedesktop.org,lists.infradead.org,suse.de,gmail.com];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCPT_COUNT_SEVEN(0.00)[7];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RCVD_COUNT_TWO(0.00)[2];
	FREEMAIL_TO(0.00)[gmx.de];
	FREEMAIL_ENVRCPT(0.00)[gmail.com,gmx.de];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+]

Replace FB_BLANK_ constants with their counterparts from the
backlight subsystem. The values are identical, so there's no
change in functionality or semantics.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Antonino Daplas <adaplas@gmail.com>
Cc: Helge Deller <deller@gmx.de>
---
 drivers/video/fbdev/nvidia/nv_backlight.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/video/fbdev/nvidia/nv_backlight.c b/drivers/video/fbdev/nvidia/nv_backlight.c
index 160da9c50a52..7edd47ab16e9 100644
--- a/drivers/video/fbdev/nvidia/nv_backlight.c
+++ b/drivers/video/fbdev/nvidia/nv_backlight.c
@@ -112,7 +112,7 @@ void nvidia_bl_init(struct nvidia_par *par)
 		0x534 * FB_BACKLIGHT_MAX / MAX_LEVEL);
 
 	bd->props.brightness = bd->props.max_brightness;
-	bd->props.power = FB_BLANK_UNBLANK;
+	bd->props.power = BACKLIGHT_POWER_ON;
 	backlight_update_status(bd);
 
 	printk("nvidia: Backlight initialized (%s)\n", name);
-- 
2.45.2


