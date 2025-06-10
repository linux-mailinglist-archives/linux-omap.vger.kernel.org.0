Return-Path: <linux-omap+bounces-3801-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id EA1B6AD347C
	for <lists+linux-omap@lfdr.de>; Tue, 10 Jun 2025 13:04:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9DC597A8B13
	for <lists+linux-omap@lfdr.de>; Tue, 10 Jun 2025 11:03:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D76528DF27;
	Tue, 10 Jun 2025 11:04:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="xbIEjGB6";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="bKyK4SVa";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="xbIEjGB6";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="bKyK4SVa"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4572428DF23
	for <linux-omap@vger.kernel.org>; Tue, 10 Jun 2025 11:04:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749553448; cv=none; b=KnuIIrbgEISj2PRbPT8CkQw88+pGb9KaweqFFLUbUpvtBIKQvSSueUNuhxheyVbIFGc234CrSgsACJP3ETGVDKOYUaVIcyR42sRJJPHS8prPWX2vKfCgMIr6M9zaiwtLgm5H5M61sIIiyA3xrQQtoeLdCDEbgP90a7LAMYrJrjQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749553448; c=relaxed/simple;
	bh=hujwpsAgch1jXZN1KsDkSuYEIVNwR/wCMJUAAl+eMIg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=A7rnwmXRAYOv2O/AvYTYmxqLXlEMzEpdqqZrL6/Crxcnwo53KvXmlBdKwFQxYUWKI9FRjF+JAmcdFRtfibWOnCIFCAoELun8AlPezpUyonttVSkwhOKdIpEHp0YT2o2/mV8Z/pJN5gR5hMGpiO1vxxzfU9CuKYVfAHrhVr6p8ks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=xbIEjGB6; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=bKyK4SVa; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=xbIEjGB6; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=bKyK4SVa; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 403491F853;
	Tue, 10 Jun 2025 11:03:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1749553407; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HQrBboQKoR8l/o8fqLHmJsBUh/av2OtMnTxFprIgbxs=;
	b=xbIEjGB63FT3g63XLr6UDMokNuAXE0wwmR6/8EjPeKeUqRgiEj9QTSqtzwpAemaEvL+Kxn
	iJwLH6JT5o9A29R4wkEixMPhVNLFZCOuOLVX6hwHzbgA5NTL6LafLJ0wic8Dtwk2NJVp7z
	+76VFPCOuf4D5CgYLYB/QBBq8FjyjXA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1749553407;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HQrBboQKoR8l/o8fqLHmJsBUh/av2OtMnTxFprIgbxs=;
	b=bKyK4SVa5wjaPVvvK7MOLQCCVojuYkqJanPDjp6mDzgXkQlFYfyAuFL1y5uJI9J8m7LsXq
	YSigO45Pe8dRLMBA==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=xbIEjGB6;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=bKyK4SVa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1749553407; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HQrBboQKoR8l/o8fqLHmJsBUh/av2OtMnTxFprIgbxs=;
	b=xbIEjGB63FT3g63XLr6UDMokNuAXE0wwmR6/8EjPeKeUqRgiEj9QTSqtzwpAemaEvL+Kxn
	iJwLH6JT5o9A29R4wkEixMPhVNLFZCOuOLVX6hwHzbgA5NTL6LafLJ0wic8Dtwk2NJVp7z
	+76VFPCOuf4D5CgYLYB/QBBq8FjyjXA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1749553407;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HQrBboQKoR8l/o8fqLHmJsBUh/av2OtMnTxFprIgbxs=;
	b=bKyK4SVa5wjaPVvvK7MOLQCCVojuYkqJanPDjp6mDzgXkQlFYfyAuFL1y5uJI9J8m7LsXq
	YSigO45Pe8dRLMBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id DBC6A13964;
	Tue, 10 Jun 2025 11:03:26 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 6I97NP4QSGgOTAAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Tue, 10 Jun 2025 11:03:26 +0000
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
Subject: [PATCH 11/14] fbdev/pxafb: Unexport symbol
Date: Tue, 10 Jun 2025 12:56:44 +0200
Message-ID: <20250610105948.384540-12-tzimmermann@suse.de>
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,suse.de:email,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	FROM_EQ_ENVFROM(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com,gmx.de]
X-Spam-Level: 
X-Spam-Flag: NO
X-Rspamd-Queue-Id: 403491F853
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Score: -3.01

Fix the compile-time warning

  drivers/video/fbdev/pxafb.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing

The affected symbol is not used outside of its module.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/video/fbdev/pxafb.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/video/fbdev/pxafb.c b/drivers/video/fbdev/pxafb.c
index ee6da5084242..f15310bf94cf 100644
--- a/drivers/video/fbdev/pxafb.c
+++ b/drivers/video/fbdev/pxafb.c
@@ -1058,7 +1058,6 @@ unsigned long pxafb_get_hsync_time(struct device *dev)
 
 	return fbi->hsync_time;
 }
-EXPORT_SYMBOL(pxafb_get_hsync_time);
 
 static int setup_frame_dma(struct pxafb_info *fbi, int dma, int pal,
 			   unsigned long start, size_t size)
-- 
2.49.0


