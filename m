Return-Path: <linux-omap+bounces-1814-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5149D942E9E
	for <lists+linux-omap@lfdr.de>; Wed, 31 Jul 2024 14:35:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C73C81F22898
	for <lists+linux-omap@lfdr.de>; Wed, 31 Jul 2024 12:35:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C96491B1424;
	Wed, 31 Jul 2024 12:35:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="EWYetj7c";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ltkFZ/fT";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="v91YYjAZ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="7i3U81hE"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2D041A7F8C;
	Wed, 31 Jul 2024 12:35:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722429312; cv=none; b=OMlssDU0rYr6cHJJvA93bZk1OGVtq0el/85iasZAyCx05hqi5kXTPd5VoPW4KB/F4oH6rviIgtYhFcEZyu0OUvHH5+snExhJKFN3Ctk20B+yeIsAF+qHPVz3tGvDPJ407y7zCTOSnl2zhMgYSCbbe5CnBHGWT5MWjR3CLkpKsbU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722429312; c=relaxed/simple;
	bh=Lduh3CfOjaFM6djP15BHpRyiYWmOYyvUFZruUJ6Qs4A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GlqHR5B/rtP/z588xrfx59tlm7qJAyWjRP+ABMdhYEbWxhaa3Xf8+1kgtDug57BR8uOhNKQNwYSA/YbHG+9I13MCFGmS0UA7o6QGd1luc3bVGt5mBOIA1nqFYkEdjV/m+ByOfSax2DGMT3Urd1FzlqVxLTpH3CbaTjmQ3Hr6N8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=EWYetj7c; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=ltkFZ/fT; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=v91YYjAZ; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=7i3U81hE; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id CFD8321297;
	Wed, 31 Jul 2024 12:35:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1722429306; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BL0a25ZpJSPsxL2onqAlXke+80fsRhhcQq5WevDlKfo=;
	b=EWYetj7cxiNcEAudl7AaVzA7UAEDID9VQDhykDAdp/e8YpJsc8KeHGLSqrLHJcPNUnU87s
	z2fubdznv2EefbLtLzKrEPvmeXRoVyJz+IkJvm6KzZzVMnSJSidoJZRG8Eo+yeXPO1Utgi
	kF/7yA/jawnSv5UDmzIldKwrwuMqJLw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1722429306;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BL0a25ZpJSPsxL2onqAlXke+80fsRhhcQq5WevDlKfo=;
	b=ltkFZ/fTjFcfA3FGU+HaOYixBMluk0zMv8sR8SNBoKLF+1zyBEzzuAJyx1QeZCHWcLbbMb
	X7k2Dksnd+A4L6CA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1722429305; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BL0a25ZpJSPsxL2onqAlXke+80fsRhhcQq5WevDlKfo=;
	b=v91YYjAZdsWG59O1Xp15MDI28vZZ5dpuDxs1rKDMqSlmfGlToTUop4OhyFaiB2YOzgyjHf
	NCyhI6kbxbK13RAy/wb/Qk6CrO3lKKNH1Fmki7WrWIeoCcvMNzBdEOiF14N+XbAONxu/5x
	UrbHRR8wIJem2Pi8P3OE+gG1w2PDS7A=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1722429305;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BL0a25ZpJSPsxL2onqAlXke+80fsRhhcQq5WevDlKfo=;
	b=7i3U81hEkrQYvLhi0gefeMwicywn7NelELTLmkpAUS9ibO4jyoiywbOg7SRpCN9h+wxpbX
	MTiRfm1gdvEuiyDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 8C9B013AD8;
	Wed, 31 Jul 2024 12:35:05 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id IK8PIXkvqmYiUQAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Wed, 31 Jul 2024 12:35:05 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: deller@gmx.de
Cc: linux-fbdev@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-omap@vger.kernel.org,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>
Subject: [PATCH 1/9] fbdev: atmel_lcdfb: Use backlight power constants
Date: Wed, 31 Jul 2024 14:33:42 +0200
Message-ID: <20240731123502.1145082-2-tzimmermann@suse.de>
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
X-Spamd-Result: default: False [-2.60 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	MIME_GOOD(-0.10)[text/plain];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	FREEMAIL_TO(0.00)[gmx.de];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bootlin.com:email,imap1.dmz-prg2.suse.org:helo,suse.de:email];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmx.de]
X-Spam-Level: 
X-Spam-Flag: NO
X-Spam-Score: -2.60

Replace FB_BLANK_ constants with their counterparts from the
backlight subsystem. The values are identical, so there's no
change in functionality or semantics.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Nicolas Ferre <nicolas.ferre@microchip.com>
Cc: Helge Deller <deller@gmx.de>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Claudiu Beznea <claudiu.beznea@tuxon.dev>
---
 drivers/video/fbdev/atmel_lcdfb.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/video/fbdev/atmel_lcdfb.c b/drivers/video/fbdev/atmel_lcdfb.c
index 5574fb0361ee..4da233fb02a8 100644
--- a/drivers/video/fbdev/atmel_lcdfb.c
+++ b/drivers/video/fbdev/atmel_lcdfb.c
@@ -152,7 +152,7 @@ static void init_backlight(struct atmel_lcdfb_info *sinfo)
 	}
 	sinfo->backlight = bl;
 
-	bl->props.power = FB_BLANK_UNBLANK;
+	bl->props.power = BACKLIGHT_POWER_ON;
 	bl->props.brightness = atmel_bl_get_brightness(bl);
 }
 
@@ -162,7 +162,7 @@ static void exit_backlight(struct atmel_lcdfb_info *sinfo)
 		return;
 
 	if (sinfo->backlight->ops) {
-		sinfo->backlight->props.power = FB_BLANK_POWERDOWN;
+		sinfo->backlight->props.power = BACKLIGHT_POWER_OFF;
 		sinfo->backlight->ops->update_status(sinfo->backlight);
 	}
 	backlight_device_unregister(sinfo->backlight);
-- 
2.45.2


