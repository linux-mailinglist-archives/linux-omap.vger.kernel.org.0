Return-Path: <linux-omap+bounces-1809-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 37CE6942E91
	for <lists+linux-omap@lfdr.de>; Wed, 31 Jul 2024 14:35:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D7B8E1F23C52
	for <lists+linux-omap@lfdr.de>; Wed, 31 Jul 2024 12:35:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D14EB1B0106;
	Wed, 31 Jul 2024 12:35:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="vxk3HdSO";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="UlQxfpIs";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="vxk3HdSO";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="UlQxfpIs"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9C9A1AE856;
	Wed, 31 Jul 2024 12:35:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722429310; cv=none; b=f7K04w6o3Pu69cLLZCcrKl2d+vU7tgj0fpIgfeH7ej5WVrz2fVOvOhf10S3zal1D1Q/zBfaS0l6Fh6ZI2OOsdmGLqpFVzTihz/PyS4fYsugVeh/440NA0CnR/t8Gj4iN+pCucJF17w2ZPOhpdD7l6wV3LgbFjbVi/gLrwKv/CNA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722429310; c=relaxed/simple;
	bh=9HP/D9D1vCB78t5H0s7qV2irRSxHcVLOFVksg3ogQzM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=r0Of0MX2IoE35iBplblMNlHfPbur3d3ZW+ri6H3PJWb6i+saF4OOVBlFOH1eDo7am6nBRPiUHE923qziBVMg1NecjRtDorGGTsBjjVyMkh7VnDxCM2NAp/PxmDJ5quXzN1lgZrkYnvhboVYosqRLIKYuR468Ntwg3Mz7DZXdwE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=vxk3HdSO; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=UlQxfpIs; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=vxk3HdSO; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=UlQxfpIs; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 425051F849;
	Wed, 31 Jul 2024 12:35:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1722429306; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mkS9ADi9HZeN39Q9QY9EU8mRvpo150KmCobaHcVZbHY=;
	b=vxk3HdSORz0X1ezizYKWXo0WtELsfy8iP7JttYBoHw/dufZrJxMByZYVfRkRcvgLa2vt+o
	Yv4n2WPkmErPOMQwfjzCwG3vmqMVHOon7T4nFF1rTHqosqYZlt2B818r6HeWtY4fxaVH7X
	PM0b0W0VhkeETDNKiJseL8tYUjQ+IkU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1722429306;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mkS9ADi9HZeN39Q9QY9EU8mRvpo150KmCobaHcVZbHY=;
	b=UlQxfpIsb+BmDVkUpo4O+UUYSfzbAKOs2xWrum+nOvsLIzThSjbz7SSAfVu/OR0aG974GD
	Jq7G6gtd8CkX4oAg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1722429306; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mkS9ADi9HZeN39Q9QY9EU8mRvpo150KmCobaHcVZbHY=;
	b=vxk3HdSORz0X1ezizYKWXo0WtELsfy8iP7JttYBoHw/dufZrJxMByZYVfRkRcvgLa2vt+o
	Yv4n2WPkmErPOMQwfjzCwG3vmqMVHOon7T4nFF1rTHqosqYZlt2B818r6HeWtY4fxaVH7X
	PM0b0W0VhkeETDNKiJseL8tYUjQ+IkU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1722429306;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mkS9ADi9HZeN39Q9QY9EU8mRvpo150KmCobaHcVZbHY=;
	b=UlQxfpIsb+BmDVkUpo4O+UUYSfzbAKOs2xWrum+nOvsLIzThSjbz7SSAfVu/OR0aG974GD
	Jq7G6gtd8CkX4oAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 1320513AD8;
	Wed, 31 Jul 2024 12:35:06 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id uNZeA3ovqmYiUQAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Wed, 31 Jul 2024 12:35:06 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: deller@gmx.de
Cc: linux-fbdev@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-omap@vger.kernel.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 3/9] fbdev: atyfb: Use backlight power constants
Date: Wed, 31 Jul 2024 14:33:44 +0200
Message-ID: <20240731123502.1145082-4-tzimmermann@suse.de>
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
	FREEMAIL_TO(0.00)[gmx.de];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:email];
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
Cc: Helge Deller <deller@gmx.de>
---
 drivers/video/fbdev/aty/atyfb_base.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/video/fbdev/aty/atyfb_base.c b/drivers/video/fbdev/aty/atyfb_base.c
index a6dd1cd27125..210fd3ac18a4 100644
--- a/drivers/video/fbdev/aty/atyfb_base.c
+++ b/drivers/video/fbdev/aty/atyfb_base.c
@@ -2272,7 +2272,7 @@ static void aty_bl_init(struct atyfb_par *par)
 			    0xFF * FB_BACKLIGHT_MAX / MAX_LEVEL);
 
 	bd->props.brightness = bd->props.max_brightness;
-	bd->props.power = FB_BLANK_UNBLANK;
+	bd->props.power = BACKLIGHT_POWER_ON;
 	backlight_update_status(bd);
 
 	printk("aty: Backlight initialized (%s)\n", name);
-- 
2.45.2


