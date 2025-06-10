Return-Path: <linux-omap+bounces-3800-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E3EACAD347B
	for <lists+linux-omap@lfdr.de>; Tue, 10 Jun 2025 13:04:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3FEC71740B4
	for <lists+linux-omap@lfdr.de>; Tue, 10 Jun 2025 11:04:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7CA0728DF0F;
	Tue, 10 Jun 2025 11:04:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="PoAQ/kJI";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="FMALhC3K";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="PoAQ/kJI";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="FMALhC3K"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD48228DF26
	for <linux-omap@vger.kernel.org>; Tue, 10 Jun 2025 11:04:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749553445; cv=none; b=N5XOqA2GqWkk7skq2FGmv6OjVnBwyBRV5ZxGekhpYDGBhKj/nJJchdlJIlRS+3bNYTwoBiLvBg9BXto/SSdVia2osZjTmcZpSE5dSB6097KXhpu31OElyKoLzwhDEZvsKWL2NPGmYKXcx6qXHh4TNE5S+BQNOfVYgpPyiRCnsUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749553445; c=relaxed/simple;
	bh=gOEHRnZ6b1ojT27BocAEzItajeOWrDP2e/2aiHyL4nU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FQ88rmCNwr6zHuS1hChYW8GegwuWSHW+ymizqt13UuGiNjESzmbbo2eeECpLQ1OjjvzLpjKD5GpP+DyDDaYhyQRR6pH/oNVSL5RW7YH8pH6P1a48KQ91UPIeQGwRQsdq4FxY+2CDpvZpLPALyjPv5KQMRAeKyPS4GKuUBhqyD28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=PoAQ/kJI; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=FMALhC3K; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=PoAQ/kJI; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=FMALhC3K; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 9700D2198A;
	Tue, 10 Jun 2025 11:03:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1749553407; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EhafJbyslwbwFa/xMJnHWTnTndj7P/FfqHKQHZkLJ/s=;
	b=PoAQ/kJISkgAsO2n8UpEUiOnq1x0Ah4F9e8nhBJzh34xqOY+70MDaZT6N4YjFfUaI1dEop
	SWu4xYTflEqajoJblIGdNJc2nPnMSf0fhNd1e2lMdyhwPWYb7mfEfaFbBvbMZtbh5d1853
	zKvbMd+M2CNh610VZDy5BBFB4rhBrK8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1749553407;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EhafJbyslwbwFa/xMJnHWTnTndj7P/FfqHKQHZkLJ/s=;
	b=FMALhC3KJfL2IayFNPBOeGXAlSChQWkCjxBuX8Jp0Z0Ct8F+5PZXzpdZ6l/kKz14HtG8Wc
	D4dgfeFskIP4zUCw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1749553407; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EhafJbyslwbwFa/xMJnHWTnTndj7P/FfqHKQHZkLJ/s=;
	b=PoAQ/kJISkgAsO2n8UpEUiOnq1x0Ah4F9e8nhBJzh34xqOY+70MDaZT6N4YjFfUaI1dEop
	SWu4xYTflEqajoJblIGdNJc2nPnMSf0fhNd1e2lMdyhwPWYb7mfEfaFbBvbMZtbh5d1853
	zKvbMd+M2CNh610VZDy5BBFB4rhBrK8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1749553407;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EhafJbyslwbwFa/xMJnHWTnTndj7P/FfqHKQHZkLJ/s=;
	b=FMALhC3KJfL2IayFNPBOeGXAlSChQWkCjxBuX8Jp0Z0Ct8F+5PZXzpdZ6l/kKz14HtG8Wc
	D4dgfeFskIP4zUCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 46A2A13A17;
	Tue, 10 Jun 2025 11:03:27 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 6DXrD/8QSGgOTAAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Tue, 10 Jun 2025 11:03:27 +0000
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
Subject: [PATCH 12/14] fbdev/sisfb: Unexport symbols
Date: Tue, 10 Jun 2025 12:56:45 +0200
Message-ID: <20250610105948.384540-13-tzimmermann@suse.de>
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
X-Spam-Flag: NO
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
	RCPT_COUNT_TWELVE(0.00)[13];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:email,imap1.dmz-prg2.suse.org:helo];
	FREEMAIL_TO(0.00)[gmx.de,c64.rulez.org,ffwll.ch,intworks.biz,armlinux.org.uk,gmail.com,kernel.org];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	R_RATELIMIT(0.00)[to_ip_from(RLeer19tzumyaughgdh7h6uhe9)];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FREEMAIL_ENVRCPT(0.00)[gmail.com,gmx.de]
X-Spam-Level: 

Fix the compile-time warning

  drivers/video/fbdev/sis/sis_main.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing

The affected symbols are not used outside of their module.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/video/fbdev/sis/sis_main.c | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/drivers/video/fbdev/sis/sis_main.c b/drivers/video/fbdev/sis/sis_main.c
index 75033e6be15a..1802d109d8f2 100644
--- a/drivers/video/fbdev/sis/sis_main.c
+++ b/drivers/video/fbdev/sis/sis_main.c
@@ -6832,12 +6832,3 @@ MODULE_PARM_DESC(videoram,
 #endif
 
 #endif 	   /*  /MODULE  */
-
-/* _GPL only for new symbols. */
-EXPORT_SYMBOL(sis_malloc);
-EXPORT_SYMBOL(sis_free);
-EXPORT_SYMBOL_GPL(sis_malloc_new);
-EXPORT_SYMBOL_GPL(sis_free_new);
-
-
-
-- 
2.49.0


