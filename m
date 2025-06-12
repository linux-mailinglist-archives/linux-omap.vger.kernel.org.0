Return-Path: <linux-omap+bounces-3841-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E842EAD6A82
	for <lists+linux-omap@lfdr.de>; Thu, 12 Jun 2025 10:22:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9833D16B18B
	for <lists+linux-omap@lfdr.de>; Thu, 12 Jun 2025 08:22:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0D01223DD7;
	Thu, 12 Jun 2025 08:21:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="rRWCgG1k";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="MKlVCGQF";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="OLOYMeZS";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="saqtFco4"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5CBC223322
	for <linux-omap@vger.kernel.org>; Thu, 12 Jun 2025 08:21:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749716514; cv=none; b=XOFgWkru9FTG1K0qsOg8Rr3DXQvC/NS8DZA819EhjqUu+0qSztDw1MO2UqhzCX/m7B/q0y+gx4O23M8J4z4ksApbBF55RYz0FCSY0Y1reCgaa7nQPtdITAxBfjRgTEk8AZxlnT+gdWCxBKfTQTH9Ykcq4O6AI/8x4hCGtNu3zag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749716514; c=relaxed/simple;
	bh=SEJ9JSUCEmcSoutVqtwxTSXRCk5jBIAhebiSSPv7Pes=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Wzh85f2+ulmk8U33oH3ZHJiskcK8PBoA777T9WxqsRHimR9iL6aA2E2d1qdhLbZPPIaXqjquk1k4gpDp3oXHLHuQvNjebvwMk6ActxLLB3dg1YhH526mq4Sh0eCntuo6Qg5gT8YebaeznJM+RR00O0Oa+yRtzih6iShnvjNUOKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=rRWCgG1k; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=MKlVCGQF; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=OLOYMeZS; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=saqtFco4; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id CBD951F7F7;
	Thu, 12 Jun 2025 08:21:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1749716488; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HQtbLooWD0IS8Erk61ZXXM9iNuyvVJnqbzSvTXqzcuc=;
	b=rRWCgG1kPW/N9hv2Ke6vojRcJmEyzaqMh/5OThGY6Re6jM1JcvqbCDBJJyjth+fyFfsIp0
	kvqqXqI/x+YRcWlSMd/pemOyvRKaMig0slFGx/ha0A1qHgCnoNI9QAXO2pboX9Unaj9uw3
	hWt+xhqsCIdjyf4qFySIubxHHoJBtvc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1749716488;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HQtbLooWD0IS8Erk61ZXXM9iNuyvVJnqbzSvTXqzcuc=;
	b=MKlVCGQFGIpzEQ6zdfShBpCtdcvPielJVYbpuu0+Fd/z4DRkFz7hYvcEJC9w+3FE/jQqI6
	FGfXOv7Qic7hzWDQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1749716487; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HQtbLooWD0IS8Erk61ZXXM9iNuyvVJnqbzSvTXqzcuc=;
	b=OLOYMeZS7hdxlTb8ypR5hJNklg2CItzZ4Ruh8dsKpwh9iIDM4bcbPTgBRA4aGRCaYsm1sw
	93nhsLmD9l0yZUkOyd9XldOYHTeUWnSsdRlkmKkwPBcx3StSNiDpvIv8/umeEc2s0kVBbQ
	uo3OyGlJk0JvO6Yf0n9S8vfmNMVKbcc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1749716487;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HQtbLooWD0IS8Erk61ZXXM9iNuyvVJnqbzSvTXqzcuc=;
	b=saqtFco46VSC3EVgqLJ6rbz2fQce9FGcPk2zUMO6a4QnfHYaJ4uS+3a+l3nSeCp31mg2Qb
	kKtJojz3W8yApVCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 78D7F13A6D;
	Thu, 12 Jun 2025 08:21:27 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 8NQoHAeOSmgILAAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Thu, 12 Jun 2025 08:21:27 +0000
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
Subject: [PATCH v2 07/14] fbdev/omap: Include <linux/export.h>
Date: Thu, 12 Jun 2025 10:16:30 +0200
Message-ID: <20250612081738.197826-8-tzimmermann@suse.de>
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
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:email,suse.de:mid];
	FREEMAIL_TO(0.00)[gmx.de,c64.rulez.org,ffwll.ch,armlinux.org.uk,gmail.com,kernel.org];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	R_RATELIMIT(0.00)[to_ip_from(RLeer19tzumyaughgdh7h6uhe9)];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FREEMAIL_ENVRCPT(0.00)[gmail.com,gmx.de]
X-Spam-Level: 
X-Spam-Flag: NO
X-Spam-Score: -2.80

Fix the compile-time warnings

  drivers/video/fbdev/omap/lcd_dma.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
  drivers/video/fbdev/omap/lcdc.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
  drivers/video/fbdev/omap/omapfb_main.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Helge Deller <deller@gmx.de>
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


