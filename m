Return-Path: <linux-omap+bounces-3838-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C852AD6A7C
	for <lists+linux-omap@lfdr.de>; Thu, 12 Jun 2025 10:22:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 157F8189D8AB
	for <lists+linux-omap@lfdr.de>; Thu, 12 Jun 2025 08:22:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CFDFC223708;
	Thu, 12 Jun 2025 08:21:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="QKG4HyYH";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="1odK2eCW";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="QKG4HyYH";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="1odK2eCW"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1FE6223322
	for <linux-omap@vger.kernel.org>; Thu, 12 Jun 2025 08:21:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749716503; cv=none; b=XvaauU0Eh1RdjqJl0sTXAh/nBfNol4rM812sGJlyYDfadorVhyriMwXP5CKO4f+4FgW9Rx2I/ddU1xisCtruF5cTARWIwu0DAQGaipRgGn2iIO+KRuOZQ6o6SIxsSyL6vQ/0vHVjmXbXrK+Ey4YETZaw5RI0OWD2wY4lIVfSokM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749716503; c=relaxed/simple;
	bh=lj9Bcd+prPmsi7YfACDLmEGLpTpCzWkqE88Ze+lcjPY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ecdvgJkr93HGZN9DB643wX1eJIEqEXnNHKFtVq/xeWt5+QbQDwB35beuGRC7qDVkd+yCXKP6v3zR3v0CCUvd12Rr/fHO2VTZqs29efPixzEGpeBF3yfq4S3OraQbw3tt07ljlP9P40K0ngF+UZeWcXQ5V2HxDpRIJ7de1KkTE00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=QKG4HyYH; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=1odK2eCW; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=QKG4HyYH; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=1odK2eCW; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 71D6B218FC;
	Thu, 12 Jun 2025 08:21:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1749716487; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=G/L860iFSRWtDQn8ireYrc3Cye0vTyizniIYlymGiLU=;
	b=QKG4HyYH1Oi3zSDwB0196c9Kp+qDzcGdzcc3rHOCQL0A+mPOXmC0059Lc6RjxizFof8J6y
	V43uRp4qUvs2K3IES5cbl7Z5u2p1AA1znqwIIxtHU4Et9TkBn/NWTnIAO9DKViSMDTt3M3
	f1jir0NlRFCegsS9lPg7qZsHcj3iSWk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1749716487;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=G/L860iFSRWtDQn8ireYrc3Cye0vTyizniIYlymGiLU=;
	b=1odK2eCW3Wun/wlpQaQJx2lHf3/sEYHhLAMtqsi3IotmLTfqrHiZe0WxxJ1ela/E4qC7q+
	OZNybidr1hLFNrAw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1749716487; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=G/L860iFSRWtDQn8ireYrc3Cye0vTyizniIYlymGiLU=;
	b=QKG4HyYH1Oi3zSDwB0196c9Kp+qDzcGdzcc3rHOCQL0A+mPOXmC0059Lc6RjxizFof8J6y
	V43uRp4qUvs2K3IES5cbl7Z5u2p1AA1znqwIIxtHU4Et9TkBn/NWTnIAO9DKViSMDTt3M3
	f1jir0NlRFCegsS9lPg7qZsHcj3iSWk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1749716487;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=G/L860iFSRWtDQn8ireYrc3Cye0vTyizniIYlymGiLU=;
	b=1odK2eCW3Wun/wlpQaQJx2lHf3/sEYHhLAMtqsi3IotmLTfqrHiZe0WxxJ1ela/E4qC7q+
	OZNybidr1hLFNrAw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 1F984132D8;
	Thu, 12 Jun 2025 08:21:27 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id kMlyBgeOSmgILAAAD6G6ig
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
Subject: [PATCH v2 06/14] fbdev/matroxfb: Include <linux/export.h>
Date: Thu, 12 Jun 2025 10:16:29 +0200
Message-ID: <20250612081738.197826-7-tzimmermann@suse.de>
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
X-Spam-Flag: NO
X-Spam-Score: -2.80
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid,suse.de:email];
	FREEMAIL_TO(0.00)[gmx.de,c64.rulez.org,ffwll.ch,armlinux.org.uk,gmail.com,kernel.org];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	R_RATELIMIT(0.00)[to_ip_from(RLeer19tzumyaughgdh7h6uhe9)];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FREEMAIL_ENVRCPT(0.00)[gmail.com,gmx.de]
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
Reviewed-by: Helge Deller <deller@gmx.de>
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


