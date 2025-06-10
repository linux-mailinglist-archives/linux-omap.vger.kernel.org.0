Return-Path: <linux-omap+bounces-3796-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E53BDAD346E
	for <lists+linux-omap@lfdr.de>; Tue, 10 Jun 2025 13:03:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9ABDE162C8F
	for <lists+linux-omap@lfdr.de>; Tue, 10 Jun 2025 11:03:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2604D27E7F4;
	Tue, 10 Jun 2025 11:03:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="B3KSYvNd";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="BUJ5llpr";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="B3KSYvNd";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="BUJ5llpr"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 519E028C020
	for <linux-omap@vger.kernel.org>; Tue, 10 Jun 2025 11:03:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749553433; cv=none; b=hdZWG5yfIiPK06I+QA2+dUVq4kE6kTmVCazg/tfFGY5UydPdkxyHDUNfv5L8Xu6x+p5x+jYZ0E02cIdKLtYxI5fOjd+v4NJCr1DlyVgwbP9vtR3Nj4Gn5jwK+hbXuWwCCHknc3ZcEWvh431yaYOYpCl4nNSIcYTPgSvnIKPTaa8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749553433; c=relaxed/simple;
	bh=CgzHyltbSzUcWcd/4TvTkhYDGHhzKVLEmlg3Zd0F7bU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=srrzKng+jmpYuUsJIaYZnsOLDnr2j9PzrwxtGPx2noliO0U+uRnnRxvVdSjGu+4CL9tDgYo7X1TRSz4HbfzzMbjlaaH6WbX5XIcCXrZpN8DvM/jHTk9rM8mYEA6zmVzMRVgOHfU4u+xpiOOD64gh7lh9Kbqy75TEhk3aJgLiwi4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=B3KSYvNd; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=BUJ5llpr; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=B3KSYvNd; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=BUJ5llpr; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id CD3E621985;
	Tue, 10 Jun 2025 11:03:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1749553405; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=j940PINsvf8aqFjDQMA64fidO94Z+Dsnzl47FpNAEaY=;
	b=B3KSYvNd80gaFlQhuS94RTgAr0deXmINN4hs24Uiwhf/SGToZaN06RNi/BGY+Y9kGZBBqn
	s7ARBvyl51tALZSeM5ChU0R03rBoIKXob9yV7P4pdQh6j8+ISCJmo6eK+fJPbIfXNo6o1B
	Ltdaf1UQg8QizNggZEIux9cBwLfWIBw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1749553405;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=j940PINsvf8aqFjDQMA64fidO94Z+Dsnzl47FpNAEaY=;
	b=BUJ5llprMJglqELmD8rb8X0utIAdbUPsALFkb6I+1/3/3dHDCr6qv40fgK/V5P1rebg5p8
	d7xdsUBdaxbPTCAg==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=B3KSYvNd;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=BUJ5llpr
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1749553405; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=j940PINsvf8aqFjDQMA64fidO94Z+Dsnzl47FpNAEaY=;
	b=B3KSYvNd80gaFlQhuS94RTgAr0deXmINN4hs24Uiwhf/SGToZaN06RNi/BGY+Y9kGZBBqn
	s7ARBvyl51tALZSeM5ChU0R03rBoIKXob9yV7P4pdQh6j8+ISCJmo6eK+fJPbIfXNo6o1B
	Ltdaf1UQg8QizNggZEIux9cBwLfWIBw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1749553405;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=j940PINsvf8aqFjDQMA64fidO94Z+Dsnzl47FpNAEaY=;
	b=BUJ5llprMJglqELmD8rb8X0utIAdbUPsALFkb6I+1/3/3dHDCr6qv40fgK/V5P1rebg5p8
	d7xdsUBdaxbPTCAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 6F0BD13A17;
	Tue, 10 Jun 2025 11:03:25 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id aGfGGf0QSGgOTAAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Tue, 10 Jun 2025 11:03:25 +0000
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
Subject: [PATCH 07/14] fbdev/omap: Include <linux/export.h>
Date: Tue, 10 Jun 2025 12:56:40 +0200
Message-ID: <20250610105948.384540-8-tzimmermann@suse.de>
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
X-Rspamd-Queue-Id: CD3E621985
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Score: -3.01

Fix the compile-time warnings

  drivers/video/fbdev/omap/lcd_dma.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
  drivers/video/fbdev/omap/lcdc.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
  drivers/video/fbdev/omap/omapfb_main.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/video/fbdev/omap/lcd_dma.c     | 1 +
 drivers/video/fbdev/omap/lcdc.c        | 2 ++
 drivers/video/fbdev/omap/omapfb_main.c | 2 ++
 3 files changed, 5 insertions(+)

diff --git a/drivers/video/fbdev/omap/lcd_dma.c b/drivers/video/fbdev/omap/lcd_dma.c
index 0da23c57e475..56300be71c57 100644
--- a/drivers/video/fbdev/omap/lcd_dma.c
+++ b/drivers/video/fbdev/omap/lcd_dma.c
@@ -18,6 +18,7 @@
  * Support functions for the OMAP internal DMA channels.
  */
 
+#include <linux/export.h>
 #include <linux/module.h>
 #include <linux/spinlock.h>
 #include <linux/interrupt.h>
diff --git a/drivers/video/fbdev/omap/lcdc.c b/drivers/video/fbdev/omap/lcdc.c
index abb8b11464e8..53ca58ec5eed 100644
--- a/drivers/video/fbdev/omap/lcdc.c
+++ b/drivers/video/fbdev/omap/lcdc.c
@@ -5,8 +5,10 @@
  * Copyright (C) 2004 Nokia Corporation
  * Author: Imre Deak <imre.deak@nokia.com>
  */
+
 #include <linux/module.h>
 #include <linux/device.h>
+#include <linux/export.h>
 #include <linux/interrupt.h>
 #include <linux/spinlock.h>
 #include <linux/err.h>
diff --git a/drivers/video/fbdev/omap/omapfb_main.c b/drivers/video/fbdev/omap/omapfb_main.c
index 2682b20d184a..106d21e74738 100644
--- a/drivers/video/fbdev/omap/omapfb_main.c
+++ b/drivers/video/fbdev/omap/omapfb_main.c
@@ -11,6 +11,8 @@
  *   Dirk Behme <dirk.behme@de.bosch.com>  - changes for 2.6 kernel API
  *   Texas Instruments                     - H3 support
  */
+
+#include <linux/export.h>
 #include <linux/platform_device.h>
 #include <linux/mm.h>
 #include <linux/slab.h>
-- 
2.49.0


