Return-Path: <linux-omap+bounces-3792-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BF08AD345F
	for <lists+linux-omap@lfdr.de>; Tue, 10 Jun 2025 13:03:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4686C188275C
	for <lists+linux-omap@lfdr.de>; Tue, 10 Jun 2025 11:03:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5DE528DF08;
	Tue, 10 Jun 2025 11:03:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="b6UxFmg3";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="fu8SklUa";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="b6UxFmg3";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="fu8SklUa"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16ED127E7F4
	for <linux-omap@vger.kernel.org>; Tue, 10 Jun 2025 11:03:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749553419; cv=none; b=uRMpb0q/blcnXva54sI9WCd5gJyv6a0RX9OlXvxzEvSJgEgnM4oIoZpkBB3ENCvceYfxNtrGqwCzGqZaYwb2mVYfvPw3jhOCuOuXJmzESGvGRJyeW93Lisv6IMdPzp8hE1xLEJLLejRfMDHswSG9/8fW5eYR4oMzQp/G1I5j7z0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749553419; c=relaxed/simple;
	bh=3WMhRl9sUb+KgDfunI34FWoENWljEX+TD2cA4gQpV5w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KH5DCkeOAZ+/N6zq1BSjfiGvdLUoxiudxG7GXuTeek6YOxutLQGrdmQq67wRpvHnL4kGJeRWepUgulOVXWafi6e34UaUlCR/1EOfgXu/7d4xOxGB9Ukcr/jJwidixBn+hJl6gDSFaENB2fOMpAtPcBX8MQmekL+HbRrKYHveHtc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=b6UxFmg3; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=fu8SklUa; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=b6UxFmg3; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=fu8SklUa; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id AF77B211D1;
	Tue, 10 Jun 2025 11:03:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1749553404; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=B6G4IDIDNKFIlIZgpoCkC+PXCI41saXphXc1w6SdcOU=;
	b=b6UxFmg38AbXz4g1qm7BgBI0PAL2NgSHJ5LJkAOX1gZH9xgxn/avIQh/8yAAaIMUYeUjwY
	0x69A7tp1WYJgjd1ORM/lL9K5+90N2ceP3AUOXhMWMD+WBokO/sfyRqMWmVzEbzcYwoYqH
	TI3IiEXJ6fPpX5TXN2ghhyz4GoD+jkE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1749553404;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=B6G4IDIDNKFIlIZgpoCkC+PXCI41saXphXc1w6SdcOU=;
	b=fu8SklUalOzO6Tu2Zdynp4px4puRTCU94T+CuD3dXNIzX/GdTT9YIyCsZkkHC/FRlpQgsk
	zNa8VA46w0gKMcDQ==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=b6UxFmg3;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=fu8SklUa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1749553404; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=B6G4IDIDNKFIlIZgpoCkC+PXCI41saXphXc1w6SdcOU=;
	b=b6UxFmg38AbXz4g1qm7BgBI0PAL2NgSHJ5LJkAOX1gZH9xgxn/avIQh/8yAAaIMUYeUjwY
	0x69A7tp1WYJgjd1ORM/lL9K5+90N2ceP3AUOXhMWMD+WBokO/sfyRqMWmVzEbzcYwoYqH
	TI3IiEXJ6fPpX5TXN2ghhyz4GoD+jkE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1749553404;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=B6G4IDIDNKFIlIZgpoCkC+PXCI41saXphXc1w6SdcOU=;
	b=fu8SklUalOzO6Tu2Zdynp4px4puRTCU94T+CuD3dXNIzX/GdTT9YIyCsZkkHC/FRlpQgsk
	zNa8VA46w0gKMcDQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 5931213964;
	Tue, 10 Jun 2025 11:03:24 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id OKicFPwQSGgOTAAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Tue, 10 Jun 2025 11:03:24 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: deller@gmx.de,
	soci@c64.rulez.org,
	simona@ffwll.ch,
	jayalk@intworks.biz,
	linux@armlinux.org.uk,
	FlorianSchandinat@gmx.de,
	alchark@gmail.com,
	krzk@kernel.org
Cc: linux-fbdev@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-omap@vger.kernel.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 04/14] fbdev/cyber2000fb: Unexport symbols
Date: Tue, 10 Jun 2025 12:56:37 +0200
Message-ID: <20250610105948.384540-5-tzimmermann@suse.de>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250610105948.384540-1-tzimmermann@suse.de>
References: <20250610105948.384540-1-tzimmermann@suse.de>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Queue-Id: AF77B211D1
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FREEMAIL_TO(0.00)[gmx.de,c64.rulez.org,ffwll.ch,intworks.biz,armlinux.org.uk,gmail.com,kernel.org];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	ARC_NA(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	R_RATELIMIT(0.00)[to_ip_from(RLwqwbgho3bgbo9wb3ecq1qfng)];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:mid,suse.de:dkim,suse.de:email];
	FROM_EQ_ENVFROM(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com,gmx.de]
X-Spam-Score: -3.01
X-Spam-Level: 

Fix the compile-time warning

  drivers/video/fbdev/cyber2000fb.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing

The affected symbols are not used outside of their module.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/video/fbdev/cyber2000fb.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/video/fbdev/cyber2000fb.c b/drivers/video/fbdev/cyber2000fb.c
index 986760b90465..fcc565b2d98c 100644
--- a/drivers/video/fbdev/cyber2000fb.c
+++ b/drivers/video/fbdev/cyber2000fb.c
@@ -1089,7 +1089,6 @@ void cyber2000fb_enable_extregs(struct cfb_info *cfb)
 		cyber2000_grphw(EXT_FUNC_CTL, old, cfb);
 	}
 }
-EXPORT_SYMBOL(cyber2000fb_enable_extregs);
 
 /*
  * Disable access to the extended registers
@@ -1109,7 +1108,6 @@ void cyber2000fb_disable_extregs(struct cfb_info *cfb)
 	else
 		cfb->func_use_count -= 1;
 }
-EXPORT_SYMBOL(cyber2000fb_disable_extregs);
 
 /*
  * Attach a capture/tv driver to the core CyberX0X0 driver.
@@ -1135,7 +1133,6 @@ int cyber2000fb_attach(struct cyberpro_info *info, int idx)
 
 	return int_cfb_info != NULL;
 }
-EXPORT_SYMBOL(cyber2000fb_attach);
 
 /*
  * Detach a capture/tv driver from the core CyberX0X0 driver.
@@ -1143,7 +1140,6 @@ EXPORT_SYMBOL(cyber2000fb_attach);
 void cyber2000fb_detach(int idx)
 {
 }
-EXPORT_SYMBOL(cyber2000fb_detach);
 
 #ifdef CONFIG_FB_CYBER2000_DDC
 
-- 
2.49.0


