Return-Path: <linux-omap+bounces-3847-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A2D4AD6A8E
	for <lists+linux-omap@lfdr.de>; Thu, 12 Jun 2025 10:22:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3A80F1BC0416
	for <lists+linux-omap@lfdr.de>; Thu, 12 Jun 2025 08:23:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD38E1B0F0A;
	Thu, 12 Jun 2025 08:22:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="EIciN5H7";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="XpTFWKZu";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="EIciN5H7";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="XpTFWKZu"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEB1F221F1A
	for <linux-omap@vger.kernel.org>; Thu, 12 Jun 2025 08:22:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749716552; cv=none; b=bggJMGAv+jt9h6tg5jLcXs635Zt74zjHNluGzA95Ur1GGwPtvkkKIPMjIeqMpaGbLY8ELnErzVlBd4j7yBGrQ+xsgCGJbLkaMGVdlf5dn/vns3XrZvYriQD5SY9drATkCCD3a7/hkoRsqa3bqGs/GCErW8kfjZ8DsAnLWn66Qbs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749716552; c=relaxed/simple;
	bh=pPRm8cyM5DRYswxfweJKY4SnscvJAMF4AuLF+/bVdhE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=H0qCJfqfz/zLr8aY5GSCCDqhed8WIxXJFtX5cXYG0lfUsVPJDnyB00Xm8iaX6sMVHuMjEyOZC7JZo71u4oojZ7PK6I0dIQnGnidsyUB5pAWH52EmfS8UlSkUdsaXUxzT+uPFEKrfCL5I6R4uxMaipVQuFXrG1sWqH1/vXLmsE4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=EIciN5H7; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=XpTFWKZu; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=EIciN5H7; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=XpTFWKZu; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 832591F850;
	Thu, 12 Jun 2025 08:21:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1749716490; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8EYVnThvVOrlaLXHuHW82UGnJKwNNBPF2t2gEkPuHSc=;
	b=EIciN5H7NseDH0Ao7Zq6TqJ9DNmdt2JfUXzDb3YiIqyuLMZcZJHfjGDD6LgdZfDOqkyRAO
	M+IAoSxWwc3Gk0uZcXAMudsxUlwqbjcsHjFIFHZCsYkaZIjQhdrp9JAgtm14TFh57E0Yfm
	k1nP4wygM7zETtf5JlXLXNWOrbr/WFE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1749716490;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8EYVnThvVOrlaLXHuHW82UGnJKwNNBPF2t2gEkPuHSc=;
	b=XpTFWKZuQsUgd8engH8+/gYg0OymhBEZj5JD8M65FAGWkQMxeQ09WtCRzXlIfhpPstSUUS
	+O1VLyDuSBDv9UCw==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=EIciN5H7;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=XpTFWKZu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1749716490; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8EYVnThvVOrlaLXHuHW82UGnJKwNNBPF2t2gEkPuHSc=;
	b=EIciN5H7NseDH0Ao7Zq6TqJ9DNmdt2JfUXzDb3YiIqyuLMZcZJHfjGDD6LgdZfDOqkyRAO
	M+IAoSxWwc3Gk0uZcXAMudsxUlwqbjcsHjFIFHZCsYkaZIjQhdrp9JAgtm14TFh57E0Yfm
	k1nP4wygM7zETtf5JlXLXNWOrbr/WFE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1749716490;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8EYVnThvVOrlaLXHuHW82UGnJKwNNBPF2t2gEkPuHSc=;
	b=XpTFWKZuQsUgd8engH8+/gYg0OymhBEZj5JD8M65FAGWkQMxeQ09WtCRzXlIfhpPstSUUS
	+O1VLyDuSBDv9UCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 228DD132D8;
	Thu, 12 Jun 2025 08:21:30 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 8AUNBwqOSmgILAAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Thu, 12 Jun 2025 08:21:30 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: deller@gmx.de,
	soci@c64.rulez.org,
	simona@ffwll.ch,
	linux@armlinux.org.uk,
	FlorianSchandinat@gmx.de,
	alchark@gmail.com,
	krzk@kernel.org
Cc: linux-fbdev@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-omap@vger.kernel.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v2 14/14] fbdev/viafb: Do not include <linux/export.h>
Date: Thu, 12 Jun 2025 10:16:37 +0200
Message-ID: <20250612081738.197826-15-tzimmermann@suse.de>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250612081738.197826-1-tzimmermann@suse.de>
References: <20250612081738.197826-1-tzimmermann@suse.de>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 832591F850
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
	FREEMAIL_TO(0.00)[gmx.de,c64.rulez.org,ffwll.ch,armlinux.org.uk,gmail.com,kernel.org];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCPT_COUNT_TWELVE(0.00)[12];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:dkim,suse.de:email,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
	FROM_EQ_ENVFROM(0.00)[];
	R_RATELIMIT(0.00)[to_ip_from(RLwqwbgho3bgbo9wb3ecq1qfng)];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	TO_DN_SOME(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com,gmx.de]
X-Spam-Score: -3.01
X-Spam-Level: 

Fix the compile-time warning

  drivers/video/fbdev/via/via-gpio.c: warning: EXPORT_SYMBOL() is not used, but #include <linux/export.h> is present

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/video/fbdev/via/via-gpio.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/video/fbdev/via/via-gpio.c b/drivers/video/fbdev/via/via-gpio.c
index 27226a8f3f42..72302384bf77 100644
--- a/drivers/video/fbdev/via/via-gpio.c
+++ b/drivers/video/fbdev/via/via-gpio.c
@@ -10,7 +10,6 @@
 #include <linux/gpio/machine.h>
 #include <linux/platform_device.h>
 #include <linux/via-core.h>
-#include <linux/export.h>
 #include "via-gpio.h"
 
 /*
-- 
2.49.0


