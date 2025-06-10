Return-Path: <linux-omap+bounces-3793-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DCECAAD3466
	for <lists+linux-omap@lfdr.de>; Tue, 10 Jun 2025 13:03:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AE4C93A7504
	for <lists+linux-omap@lfdr.de>; Tue, 10 Jun 2025 11:03:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4BBE747F;
	Tue, 10 Jun 2025 11:03:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="clIjCV9z";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="6h9CJ5bx";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="clIjCV9z";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="6h9CJ5bx"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D2B127E7F4
	for <linux-omap@vger.kernel.org>; Tue, 10 Jun 2025 11:03:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749553424; cv=none; b=iCrVAyOhA2Gfeks45f5KOBGPv38lZnN18wtrcZmtmsNQiPnK61Bp4/cSf3xRE4sefKXOlZcg8LXIuzIVU3wCTe7YpomIipme1YmIc4+LlEjL8zIYf12iHGXDh2jzfWAASNK69vrpjfXLJKPh8c+xcuUfZKCB3xRfK021gpZyNZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749553424; c=relaxed/simple;
	bh=POJRxhYm77G2Ii+bWtaPO8PsqG5IYxcMiWL3dFJy9uA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DDVFm8SKKkkLdgslqhvMY3JVitc/zR1BGJ7yMA5Re+Ttqh/GNJ6w716QLNEc1hujbzyZ98ljLhDjuY5iBb4BHY6yTgn3hburQXMCuN5xf79kZcCHZeonJuZFftSHaBhvPWz7Y1zdUR2vp0AOss8WTbUXXYfEbzO0qi9jcZYqvyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=clIjCV9z; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=6h9CJ5bx; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=clIjCV9z; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=6h9CJ5bx; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 536F21F84C;
	Tue, 10 Jun 2025 11:03:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1749553404; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=boF3GrbYhR1turEXc0J1Q6wFwiRT3ZKVLQz2H+/v6+s=;
	b=clIjCV9zeNOWSpIEC0pSAj9O7ATRW8zbrtUEAqOXzS0HO0CHWgbFqMQcndeJdi6XPdAf80
	O5TbCNmwUPQR1zbhnQ7M1BqcKBeVzb0VTJXZK5puI5i2IZn0REhj9LbNhR03M9Pvb+hEU0
	gWXidNmtGE1hCTBYcf0aj7rirmdzRTs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1749553404;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=boF3GrbYhR1turEXc0J1Q6wFwiRT3ZKVLQz2H+/v6+s=;
	b=6h9CJ5bxLwf5H4KlokjoY3ZJrgWKyxURvfBNTuaCdgIA5M6a/M/D3c7oaASQTN/jWBc5nS
	2z0f9H2l1LdBzmCg==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=clIjCV9z;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=6h9CJ5bx
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1749553404; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=boF3GrbYhR1turEXc0J1Q6wFwiRT3ZKVLQz2H+/v6+s=;
	b=clIjCV9zeNOWSpIEC0pSAj9O7ATRW8zbrtUEAqOXzS0HO0CHWgbFqMQcndeJdi6XPdAf80
	O5TbCNmwUPQR1zbhnQ7M1BqcKBeVzb0VTJXZK5puI5i2IZn0REhj9LbNhR03M9Pvb+hEU0
	gWXidNmtGE1hCTBYcf0aj7rirmdzRTs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1749553404;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=boF3GrbYhR1turEXc0J1Q6wFwiRT3ZKVLQz2H+/v6+s=;
	b=6h9CJ5bxLwf5H4KlokjoY3ZJrgWKyxURvfBNTuaCdgIA5M6a/M/D3c7oaASQTN/jWBc5nS
	2z0f9H2l1LdBzmCg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id F084D13A17;
	Tue, 10 Jun 2025 11:03:23 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id CENiOfsQSGgOTAAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Tue, 10 Jun 2025 11:03:23 +0000
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
Subject: [PATCH 03/14] fbdev/c2p: Include <linux/export.h>
Date: Tue, 10 Jun 2025 12:56:36 +0200
Message-ID: <20250610105948.384540-4-tzimmermann@suse.de>
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
X-Rspamd-Queue-Id: 536F21F84C
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Score: -3.01

Fix the compile-time warnings

  drivers/video/fbdev/c2p_iplan2.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
  drivers/video/fbdev/c2p_planar.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/video/fbdev/c2p_iplan2.c | 1 +
 drivers/video/fbdev/c2p_planar.c | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/video/fbdev/c2p_iplan2.c b/drivers/video/fbdev/c2p_iplan2.c
index cfd2361f24b1..ee4b315d3f40 100644
--- a/drivers/video/fbdev/c2p_iplan2.c
+++ b/drivers/video/fbdev/c2p_iplan2.c
@@ -8,6 +8,7 @@
  *  for more details.
  */
 
+#include <linux/export.h>
 #include <linux/module.h>
 #include <linux/string.h>
 
diff --git a/drivers/video/fbdev/c2p_planar.c b/drivers/video/fbdev/c2p_planar.c
index 819c82a98ac0..236aad5137ef 100644
--- a/drivers/video/fbdev/c2p_planar.c
+++ b/drivers/video/fbdev/c2p_planar.c
@@ -8,6 +8,7 @@
  *  for more details.
  */
 
+#include <linux/export.h>
 #include <linux/module.h>
 #include <linux/string.h>
 
-- 
2.49.0


