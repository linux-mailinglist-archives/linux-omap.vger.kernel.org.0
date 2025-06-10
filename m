Return-Path: <linux-omap+bounces-3803-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C689AD3480
	for <lists+linux-omap@lfdr.de>; Tue, 10 Jun 2025 13:04:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 08DA41678E6
	for <lists+linux-omap@lfdr.de>; Tue, 10 Jun 2025 11:04:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC79F28DF31;
	Tue, 10 Jun 2025 11:04:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="AkV71N7U";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="hHznZY2l";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="AkV71N7U";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="hHznZY2l"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1FA228DF2B
	for <linux-omap@vger.kernel.org>; Tue, 10 Jun 2025 11:04:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749553454; cv=none; b=qNe+cGl7dhYEuVkydA217Zdn7rCN8LfXHvUBVdqxiRmCJfp8AQfjLp1xXXy4mVt7sbp87RQPUzF1fAWyDkxCavKj4gJ0wg798KdG0zlIPJnHjS2VWVgwgbKM7YKDrWACowc+VAZhOPtp/EFfTKi9pHHby7Sq7kSggaAfkn6/RzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749553454; c=relaxed/simple;
	bh=pPRm8cyM5DRYswxfweJKY4SnscvJAMF4AuLF+/bVdhE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HK+oct/FCyp/heaE9qfG+paQPjXAcmRWxCqzOJ1fvXDCHdMzAIJCIHcDlc8kJvqQ9yazO7l4RVG3AcqRpBG1tpntO/VHe7lsc7oc9jATf1KcExbv2DfzHsUpQEtQNAs1ji/Gh0rMA6TP2+lGo2jrgQWTTaYRXkEiLwm535vAUZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=AkV71N7U; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=hHznZY2l; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=AkV71N7U; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=hHznZY2l; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 6DB291F854;
	Tue, 10 Jun 2025 11:03:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1749553408; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8EYVnThvVOrlaLXHuHW82UGnJKwNNBPF2t2gEkPuHSc=;
	b=AkV71N7U2kXRSVXo2IIgdz9iXnK3NxgxkX6ztVdUGt+hfUAp6da3IQOk6HveYG+R6zppVE
	BMWXDic2Ntx5BRTzLdA3JbJ6izGdCq81wtIB+YaaUGlY7k3ea/ErpUPSAi7weH9qMmdc1t
	/Y7E8onxgvUSizzoaXZZYz8hxLA/XFI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1749553408;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8EYVnThvVOrlaLXHuHW82UGnJKwNNBPF2t2gEkPuHSc=;
	b=hHznZY2lAWGl1jQ89gm2s0aMx0zik3cZ97MXQfwaodNRIw7aRcG6dKop3Q6HP+9sa7o5Jk
	N0HiLQJQRqDtNCCA==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=AkV71N7U;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=hHznZY2l
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1749553408; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8EYVnThvVOrlaLXHuHW82UGnJKwNNBPF2t2gEkPuHSc=;
	b=AkV71N7U2kXRSVXo2IIgdz9iXnK3NxgxkX6ztVdUGt+hfUAp6da3IQOk6HveYG+R6zppVE
	BMWXDic2Ntx5BRTzLdA3JbJ6izGdCq81wtIB+YaaUGlY7k3ea/ErpUPSAi7weH9qMmdc1t
	/Y7E8onxgvUSizzoaXZZYz8hxLA/XFI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1749553408;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8EYVnThvVOrlaLXHuHW82UGnJKwNNBPF2t2gEkPuHSc=;
	b=hHznZY2lAWGl1jQ89gm2s0aMx0zik3cZ97MXQfwaodNRIw7aRcG6dKop3Q6HP+9sa7o5Jk
	N0HiLQJQRqDtNCCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 0992E13A17;
	Tue, 10 Jun 2025 11:03:28 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id KP0pAQARSGgOTAAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Tue, 10 Jun 2025 11:03:28 +0000
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
Subject: [PATCH 14/14] fbdev/viafb: Do not include <linux/export.h>
Date: Tue, 10 Jun 2025 12:56:47 +0200
Message-ID: <20250610105948.384540-15-tzimmermann@suse.de>
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
	BAYES_HAM(-3.00)[99.99%];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:dkim,suse.de:mid,suse.de:email];
	FROM_EQ_ENVFROM(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com,gmx.de]
X-Spam-Level: 
X-Spam-Flag: NO
X-Rspamd-Queue-Id: 6DB291F854
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Score: -3.01

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


