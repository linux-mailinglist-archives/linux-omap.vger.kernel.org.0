Return-Path: <linux-omap+bounces-3795-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EC5EAD346D
	for <lists+linux-omap@lfdr.de>; Tue, 10 Jun 2025 13:03:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 34A497A4B81
	for <lists+linux-omap@lfdr.de>; Tue, 10 Jun 2025 11:02:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C21728DF07;
	Tue, 10 Jun 2025 11:03:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="rkqXLz9V";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="uTYF42+G";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="rkqXLz9V";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="uTYF42+G"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 113B327E7F4
	for <linux-omap@vger.kernel.org>; Tue, 10 Jun 2025 11:03:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749553430; cv=none; b=daCeZBAJeWkvOecF8hOp9FCUk8OKX9pQ3FvDsvr0njYumzsdR9J9cYo0LziS3i63MqwN6Q2NeQSG/Zo+3+Cf6BkuIAsTjyVyJBPSmIYcOkkRC0wGTHz3JGdL2Xiu7wmAI9/XmgiNzNHV0bDQuNpdND+nJ97TixNWFSQEmdcx4CU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749553430; c=relaxed/simple;
	bh=rMEnjPnvapjfZiE47bZ4aaXQQZkS1dbvdAgjAWe8Qek=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QJy5V1HH2LyBvNOkXw/Kw5Y+VPqpqDc8oqV5ugP7USc/iebBU9ly3IyNA1VnnoGZf0g3g/1Tp//7IJjwSZjVnZwaZQhTOWJyNXBzxkjX/xteH9m0WUNyqPlBfX/gM3TxwGRhU1BD1opKQ05FpnCfCluvHUN0sx2JKdvXrLlV5+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=rkqXLz9V; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=uTYF42+G; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=rkqXLz9V; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=uTYF42+G; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 2068D1F850;
	Tue, 10 Jun 2025 11:03:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1749553406; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=K1Jj3eY0WmQc7qvx6vdw2IPsmgQPX/Ti18eweGsKxXc=;
	b=rkqXLz9VHAoyxwFzPTu/37yMFoBW3nwNOkS1Lj4P1euzdqcaxjynIuiXp2NdB+0qjkXY6s
	3VAhXba1lzcA7o0j6/FJnR9Q0nb0jEAjrzW2CJ70OU3b0mri8048a+zj/rJIYnKtapm64D
	EmoSS68hVEBo2Gs5xLmv5uxPiBgJZT4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1749553406;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=K1Jj3eY0WmQc7qvx6vdw2IPsmgQPX/Ti18eweGsKxXc=;
	b=uTYF42+GSXMx0YzoNk7FRPApu+UJIVMLFmppyXbLOUPKWBOfr95QzwWfgv6R0IbFihBkoZ
	F2eR6PbMOzxHt1AA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1749553406; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=K1Jj3eY0WmQc7qvx6vdw2IPsmgQPX/Ti18eweGsKxXc=;
	b=rkqXLz9VHAoyxwFzPTu/37yMFoBW3nwNOkS1Lj4P1euzdqcaxjynIuiXp2NdB+0qjkXY6s
	3VAhXba1lzcA7o0j6/FJnR9Q0nb0jEAjrzW2CJ70OU3b0mri8048a+zj/rJIYnKtapm64D
	EmoSS68hVEBo2Gs5xLmv5uxPiBgJZT4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1749553406;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=K1Jj3eY0WmQc7qvx6vdw2IPsmgQPX/Ti18eweGsKxXc=;
	b=uTYF42+GSXMx0YzoNk7FRPApu+UJIVMLFmppyXbLOUPKWBOfr95QzwWfgv6R0IbFihBkoZ
	F2eR6PbMOzxHt1AA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id C417513A69;
	Tue, 10 Jun 2025 11:03:25 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id EDW0Lv0QSGgOTAAAD6G6ig
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
Subject: [PATCH 08/14] fbdev/omap2: Include <linux/export.h>
Date: Tue, 10 Jun 2025 12:56:41 +0200
Message-ID: <20250610105948.384540-9-tzimmermann@suse.de>
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
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid,suse.de:email,ti.com:email];
	FREEMAIL_TO(0.00)[gmx.de,c64.rulez.org,ffwll.ch,intworks.biz,armlinux.org.uk,gmail.com,kernel.org];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	TO_DN_SOME(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FREEMAIL_ENVRCPT(0.00)[gmail.com,gmx.de]
X-Spam-Level: 

Fix the compile-time warnings

  drivers/video/fbdev/omap2/omapfb/dss/apply.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
  drivers/video/fbdev/omap2/omapfb/dss/core.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
  drivers/video/fbdev/omap2/omapfb/dss/dispc-compat.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
  drivers/video/fbdev/omap2/omapfb/dss/display.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
  drivers/video/fbdev/omap2/omapfb/dss/dss-of.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
  drivers/video/fbdev/omap2/omapfb/dss/dss_features.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
  drivers/video/fbdev/omap2/omapfb/dss/manager.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
  drivers/video/fbdev/omap2/omapfb/dss/output.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
  drivers/video/fbdev/omap2/omapfb/dss/overlay.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
  drivers/video/fbdev/omap2/omapfb/dss/venc.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
  drivers/video/fbdev/omap2/omapfb/vrfb.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/video/fbdev/omap2/omapfb/dss/apply.c        | 1 +
 drivers/video/fbdev/omap2/omapfb/dss/core.c         | 1 +
 drivers/video/fbdev/omap2/omapfb/dss/dispc-compat.c | 1 +
 drivers/video/fbdev/omap2/omapfb/dss/display.c      | 1 +
 drivers/video/fbdev/omap2/omapfb/dss/dss-of.c       | 1 +
 drivers/video/fbdev/omap2/omapfb/dss/dss_features.c | 1 +
 drivers/video/fbdev/omap2/omapfb/dss/manager.c      | 1 +
 drivers/video/fbdev/omap2/omapfb/dss/output.c       | 1 +
 drivers/video/fbdev/omap2/omapfb/dss/overlay.c      | 1 +
 drivers/video/fbdev/omap2/omapfb/dss/venc.c         | 1 +
 drivers/video/fbdev/omap2/omapfb/vrfb.c             | 1 +
 11 files changed, 11 insertions(+)

diff --git a/drivers/video/fbdev/omap2/omapfb/dss/apply.c b/drivers/video/fbdev/omap2/omapfb/dss/apply.c
index acca991c7540..39947e569a54 100644
--- a/drivers/video/fbdev/omap2/omapfb/dss/apply.c
+++ b/drivers/video/fbdev/omap2/omapfb/dss/apply.c
@@ -6,6 +6,7 @@
 
 #define DSS_SUBSYS_NAME "APPLY"
 
+#include <linux/export.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/slab.h>
diff --git a/drivers/video/fbdev/omap2/omapfb/dss/core.c b/drivers/video/fbdev/omap2/omapfb/dss/core.c
index 55b640f2f245..02ea41f6c8f4 100644
--- a/drivers/video/fbdev/omap2/omapfb/dss/core.c
+++ b/drivers/video/fbdev/omap2/omapfb/dss/core.c
@@ -15,6 +15,7 @@
 #include <linux/module.h>
 #include <linux/clk.h>
 #include <linux/err.h>
+#include <linux/export.h>
 #include <linux/platform_device.h>
 #include <linux/seq_file.h>
 #include <linux/debugfs.h>
diff --git a/drivers/video/fbdev/omap2/omapfb/dss/dispc-compat.c b/drivers/video/fbdev/omap2/omapfb/dss/dispc-compat.c
index cc2ad787d493..7831c6a2eedb 100644
--- a/drivers/video/fbdev/omap2/omapfb/dss/dispc-compat.c
+++ b/drivers/video/fbdev/omap2/omapfb/dss/dispc-compat.c
@@ -6,6 +6,7 @@
 
 #define DSS_SUBSYS_NAME "APPLY"
 
+#include <linux/export.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/slab.h>
diff --git a/drivers/video/fbdev/omap2/omapfb/dss/display.c b/drivers/video/fbdev/omap2/omapfb/dss/display.c
index f91db94c9905..16543425bd84 100644
--- a/drivers/video/fbdev/omap2/omapfb/dss/display.c
+++ b/drivers/video/fbdev/omap2/omapfb/dss/display.c
@@ -11,6 +11,7 @@
 
 #define DSS_SUBSYS_NAME "DISPLAY"
 
+#include <linux/export.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/jiffies.h>
diff --git a/drivers/video/fbdev/omap2/omapfb/dss/dss-of.c b/drivers/video/fbdev/omap2/omapfb/dss/dss-of.c
index 7c636db79882..f90a8eff7259 100644
--- a/drivers/video/fbdev/omap2/omapfb/dss/dss-of.c
+++ b/drivers/video/fbdev/omap2/omapfb/dss/dss-of.c
@@ -6,6 +6,7 @@
 
 #include <linux/device.h>
 #include <linux/err.h>
+#include <linux/export.h>
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/of_graph.h>
diff --git a/drivers/video/fbdev/omap2/omapfb/dss/dss_features.c b/drivers/video/fbdev/omap2/omapfb/dss/dss_features.c
index 62c2d48d9e09..38be57ba8c28 100644
--- a/drivers/video/fbdev/omap2/omapfb/dss/dss_features.c
+++ b/drivers/video/fbdev/omap2/omapfb/dss/dss_features.c
@@ -6,6 +6,7 @@
  * Author: Archit Taneja <archit@ti.com>
  */
 
+#include <linux/export.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/types.h>
diff --git a/drivers/video/fbdev/omap2/omapfb/dss/manager.c b/drivers/video/fbdev/omap2/omapfb/dss/manager.c
index 2c2da35345d0..c59e5689d6cc 100644
--- a/drivers/video/fbdev/omap2/omapfb/dss/manager.c
+++ b/drivers/video/fbdev/omap2/omapfb/dss/manager.c
@@ -11,6 +11,7 @@
 
 #define DSS_SUBSYS_NAME "MANAGER"
 
+#include <linux/export.h>
 #include <linux/kernel.h>
 #include <linux/slab.h>
 #include <linux/module.h>
diff --git a/drivers/video/fbdev/omap2/omapfb/dss/output.c b/drivers/video/fbdev/omap2/omapfb/dss/output.c
index 4e2992a0ce50..48cbfb75443f 100644
--- a/drivers/video/fbdev/omap2/omapfb/dss/output.c
+++ b/drivers/video/fbdev/omap2/omapfb/dss/output.c
@@ -4,6 +4,7 @@
  * Author: Archit Taneja <archit@ti.com>
  */
 
+#include <linux/export.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
diff --git a/drivers/video/fbdev/omap2/omapfb/dss/overlay.c b/drivers/video/fbdev/omap2/omapfb/dss/overlay.c
index 8c8e627da13d..bbbdc233ee61 100644
--- a/drivers/video/fbdev/omap2/omapfb/dss/overlay.c
+++ b/drivers/video/fbdev/omap2/omapfb/dss/overlay.c
@@ -14,6 +14,7 @@
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/err.h>
+#include <linux/export.h>
 #include <linux/sysfs.h>
 #include <linux/platform_device.h>
 #include <linux/delay.h>
diff --git a/drivers/video/fbdev/omap2/omapfb/dss/venc.c b/drivers/video/fbdev/omap2/omapfb/dss/venc.c
index f99dda9e55a5..ed283029ad95 100644
--- a/drivers/video/fbdev/omap2/omapfb/dss/venc.c
+++ b/drivers/video/fbdev/omap2/omapfb/dss/venc.c
@@ -14,6 +14,7 @@
 #include <linux/module.h>
 #include <linux/clk.h>
 #include <linux/err.h>
+#include <linux/export.h>
 #include <linux/io.h>
 #include <linux/mutex.h>
 #include <linux/completion.h>
diff --git a/drivers/video/fbdev/omap2/omapfb/vrfb.c b/drivers/video/fbdev/omap2/omapfb/vrfb.c
index 568e6e1eca62..675482cde519 100644
--- a/drivers/video/fbdev/omap2/omapfb/vrfb.c
+++ b/drivers/video/fbdev/omap2/omapfb/vrfb.c
@@ -9,6 +9,7 @@
 /*#define DEBUG*/
 
 #include <linux/err.h>
+#include <linux/export.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/ioport.h>
-- 
2.49.0


