Return-Path: <linux-omap+bounces-3797-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A1503AD3470
	for <lists+linux-omap@lfdr.de>; Tue, 10 Jun 2025 13:04:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5C0521645F5
	for <lists+linux-omap@lfdr.de>; Tue, 10 Jun 2025 11:04:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B575828DEF7;
	Tue, 10 Jun 2025 11:03:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ogUjPPze";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="HPJpGtzv";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ogUjPPze";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="HPJpGtzv"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6A08747F
	for <linux-omap@vger.kernel.org>; Tue, 10 Jun 2025 11:03:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749553436; cv=none; b=Y73i5DY/lHHFZ5McT6p+jZ6BAiPOTqE0z+U8guLnA5+ok6BLtjqMzPXCOiMDphoerCAQK7IUirrfWkbWEjfGuY5zQOLp2XHMQFIOJGA0pTHd7XORkjvbhvtRDSb445N1fgA8LHFWvo1/nEi0R8sY/wLIdCfKMIcPckmQQ36KFoQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749553436; c=relaxed/simple;
	bh=LXR5HYrABMbzGrhuzGE9thvFScYBiu7OZNPxhWbEndk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cvvzaycsrvYVVXdnyxYXVDAvMR4TqGT77//wfw73SbPX30bYm7T7iBr/BmtVE6HHmDxf+iXWM/8mOjI1xcCnWXbRh6vzR4dgDPtKklRm3UHSy8YMQRfevLL3e27cXm3XznVEnMcc+HTPpnULa5Gc2dv17AtKq3uF0hjs4bNsW/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ogUjPPze; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=HPJpGtzv; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ogUjPPze; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=HPJpGtzv; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 692311F84E;
	Tue, 10 Jun 2025 11:03:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1749553405; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RJJLStwv8ji0UKm0Ycz6TVP9E3mx4uyR7lDZzwUIdpY=;
	b=ogUjPPzezETnF5Oa1e+3NoH2OG5+D3niEXEQ74dcF4hBetqd0iuWJFb2OzIYOifom9QiQ/
	DTGK9wMhnHbXE7WKeEhj0EL1pKW7+A84NbOnzYDyySkGm/XDAe/Kthhq1zXSTl9uKXANKT
	AHM7Q4a8o1EfUfY3xg5As1WcFDGnp3I=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1749553405;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RJJLStwv8ji0UKm0Ycz6TVP9E3mx4uyR7lDZzwUIdpY=;
	b=HPJpGtzvYslAF4xn5c2qlj0lru6+/tSKVrc75LQlhK1ka1TRTCDUMGexuzgkVprifUsoi3
	1E4kHN0dF/KrsXCA==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=ogUjPPze;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=HPJpGtzv
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1749553405; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RJJLStwv8ji0UKm0Ycz6TVP9E3mx4uyR7lDZzwUIdpY=;
	b=ogUjPPzezETnF5Oa1e+3NoH2OG5+D3niEXEQ74dcF4hBetqd0iuWJFb2OzIYOifom9QiQ/
	DTGK9wMhnHbXE7WKeEhj0EL1pKW7+A84NbOnzYDyySkGm/XDAe/Kthhq1zXSTl9uKXANKT
	AHM7Q4a8o1EfUfY3xg5As1WcFDGnp3I=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1749553405;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RJJLStwv8ji0UKm0Ycz6TVP9E3mx4uyR7lDZzwUIdpY=;
	b=HPJpGtzvYslAF4xn5c2qlj0lru6+/tSKVrc75LQlhK1ka1TRTCDUMGexuzgkVprifUsoi3
	1E4kHN0dF/KrsXCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 17ADF13964;
	Tue, 10 Jun 2025 11:03:25 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id mHqEBP0QSGgOTAAAD6G6ig
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
Subject: [PATCH 06/14] fbdev/matroxfb: Include <linux/export.h>
Date: Tue, 10 Jun 2025 12:56:39 +0200
Message-ID: <20250610105948.384540-7-tzimmermann@suse.de>
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
X-Rspamd-Queue-Id: 692311F84E
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:dkim,suse.de:email,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
	FROM_EQ_ENVFROM(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com,gmx.de]
X-Spam-Score: -3.01
X-Spam-Level: 

Fix the compile-time warnings

  drivers/video/fbdev/matrox/g450_pll.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
  drivers/video/fbdev/matrox/matroxfb_DAC1064.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
  drivers/video/fbdev/matrox/matroxfb_Ti3026.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
  drivers/video/fbdev/matrox/matroxfb_accel.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
  drivers/video/fbdev/matrox/matroxfb_base.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
  drivers/video/fbdev/matrox/matroxfb_g450.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
  drivers/video/fbdev/matrox/matroxfb_misc.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/video/fbdev/matrox/g450_pll.c         | 2 ++
 drivers/video/fbdev/matrox/matroxfb_DAC1064.c | 1 +
 drivers/video/fbdev/matrox/matroxfb_Ti3026.c  | 1 +
 drivers/video/fbdev/matrox/matroxfb_accel.c   | 2 ++
 drivers/video/fbdev/matrox/matroxfb_base.c    | 1 +
 drivers/video/fbdev/matrox/matroxfb_g450.c    | 2 ++
 drivers/video/fbdev/matrox/matroxfb_misc.c    | 1 +
 7 files changed, 10 insertions(+)

diff --git a/drivers/video/fbdev/matrox/g450_pll.c b/drivers/video/fbdev/matrox/g450_pll.c
index 96996efc9288..e2c1478aa47f 100644
--- a/drivers/video/fbdev/matrox/g450_pll.c
+++ b/drivers/video/fbdev/matrox/g450_pll.c
@@ -14,6 +14,8 @@
  *
  */
 
+#include <linux/export.h>
+
 #include "g450_pll.h"
 #include "matroxfb_DAC1064.h"
 
diff --git a/drivers/video/fbdev/matrox/matroxfb_DAC1064.c b/drivers/video/fbdev/matrox/matroxfb_DAC1064.c
index 99bdcb52ef4b..9a893b70ab19 100644
--- a/drivers/video/fbdev/matrox/matroxfb_DAC1064.c
+++ b/drivers/video/fbdev/matrox/matroxfb_DAC1064.c
@@ -13,6 +13,7 @@
  *
  */
 
+#include <linux/export.h>
 
 #include "matroxfb_DAC1064.h"
 #include "matroxfb_misc.h"
diff --git a/drivers/video/fbdev/matrox/matroxfb_Ti3026.c b/drivers/video/fbdev/matrox/matroxfb_Ti3026.c
index f53b8066e8a5..4eb636cd1f89 100644
--- a/drivers/video/fbdev/matrox/matroxfb_Ti3026.c
+++ b/drivers/video/fbdev/matrox/matroxfb_Ti3026.c
@@ -79,6 +79,7 @@
  *
  */
 
+#include <linux/export.h>
 
 #include "matroxfb_Ti3026.h"
 #include "matroxfb_misc.h"
diff --git a/drivers/video/fbdev/matrox/matroxfb_accel.c b/drivers/video/fbdev/matrox/matroxfb_accel.c
index 52e15dc6f45b..2670db392da2 100644
--- a/drivers/video/fbdev/matrox/matroxfb_accel.c
+++ b/drivers/video/fbdev/matrox/matroxfb_accel.c
@@ -77,6 +77,8 @@
  *
  */
 
+#include <linux/export.h>
+
 #include "matroxfb_accel.h"
 #include "matroxfb_DAC1064.h"
 #include "matroxfb_Ti3026.h"
diff --git a/drivers/video/fbdev/matrox/matroxfb_base.c b/drivers/video/fbdev/matrox/matroxfb_base.c
index 81603ce05a22..5be0cdcd7c71 100644
--- a/drivers/video/fbdev/matrox/matroxfb_base.c
+++ b/drivers/video/fbdev/matrox/matroxfb_base.c
@@ -101,6 +101,7 @@
  */
 
 #include <linux/aperture.h>
+#include <linux/export.h>
 #include <linux/version.h>
 
 #include "matroxfb_base.h"
diff --git a/drivers/video/fbdev/matrox/matroxfb_g450.c b/drivers/video/fbdev/matrox/matroxfb_g450.c
index 86fe757d7761..800c05b70ee3 100644
--- a/drivers/video/fbdev/matrox/matroxfb_g450.c
+++ b/drivers/video/fbdev/matrox/matroxfb_g450.c
@@ -13,6 +13,8 @@
  *
  */
 
+#include <linux/export.h>
+
 #include "matroxfb_base.h"
 #include "matroxfb_misc.h"
 #include "matroxfb_DAC1064.h"
diff --git a/drivers/video/fbdev/matrox/matroxfb_misc.c b/drivers/video/fbdev/matrox/matroxfb_misc.c
index 3fe99214c116..2c5f0099532b 100644
--- a/drivers/video/fbdev/matrox/matroxfb_misc.c
+++ b/drivers/video/fbdev/matrox/matroxfb_misc.c
@@ -85,6 +85,7 @@
  *
  */
 
+#include <linux/export.h>
 
 #include "matroxfb_misc.h"
 #include <linux/interrupt.h>
-- 
2.49.0


