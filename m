Return-Path: <linux-omap+bounces-3837-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 70ED5AD6A79
	for <lists+linux-omap@lfdr.de>; Thu, 12 Jun 2025 10:22:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3F7F51BC0850
	for <lists+linux-omap@lfdr.de>; Thu, 12 Jun 2025 08:22:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5471921CA14;
	Thu, 12 Jun 2025 08:21:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="am8tzd0q";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="5sJBuITO";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="am8tzd0q";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="5sJBuITO"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C01D222581
	for <linux-omap@vger.kernel.org>; Thu, 12 Jun 2025 08:21:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749716501; cv=none; b=QYi5a8Lw8q0siDeEfXUXEWvZYyJSrjZAXrWqE/6ky52nJlELkZXed4sovr8Se0tYgnpJgM+aVUiy7U78oLZXgQuQXFV7ROUY4JnxtrYs/GzIEunxP19s8hW+abvz1p3041Zuya+ZlBsz8FsLjs+9wFa4zJ+mi0wCh6Z0b8be+6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749716501; c=relaxed/simple;
	bh=ZFrtDpkOLl5NPZmS6W5QDzDxqKzfPE52eDWNqVmkDZg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ERD/tPYs6P3+PikKh5C73N7UallQReVtnh2sJuUG5+HnkOipMT1zPR4bu1Wk5YjVxF9gBZUyampE0K5SETaEdvT0YcgQKxDcTUDj7ZjGhUhbUi5SYIRXheM3Y95KVsRZA55gH13pKRwCvpF4Bfm8hxptIvQ/YioG+juCLcEeBuc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=am8tzd0q; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=5sJBuITO; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=am8tzd0q; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=5sJBuITO; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 54DF01F7EC;
	Thu, 12 Jun 2025 08:21:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1749716486; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CMbLJupS5OSTa8U/8vbg4Z1Ks0Ank3I8G7D8geSAtv8=;
	b=am8tzd0qbejFWyneBMVIjMmmk6jb6Zn7Luf7K/oe+jflha+VeB2yX1WsfrgzmGfJ5OQS2b
	a9ATkzs74vuXpxY+X/lsuX8dSNL2JWVmL1FbYRQ7r2oli30Yc14HxRCgomhCLm1eoQuEXV
	qjpdG7+hu2nXLDR7cyhGWJAcG6AMl1A=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1749716486;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CMbLJupS5OSTa8U/8vbg4Z1Ks0Ank3I8G7D8geSAtv8=;
	b=5sJBuITOmizzL61ZX9azTl1jzzTG5hZvyF1oUPShF6EdIDxWOaiIaqQVw5qGD2iKcCFCbw
	/+adl1gTe2+6DpCA==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=am8tzd0q;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=5sJBuITO
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1749716486; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CMbLJupS5OSTa8U/8vbg4Z1Ks0Ank3I8G7D8geSAtv8=;
	b=am8tzd0qbejFWyneBMVIjMmmk6jb6Zn7Luf7K/oe+jflha+VeB2yX1WsfrgzmGfJ5OQS2b
	a9ATkzs74vuXpxY+X/lsuX8dSNL2JWVmL1FbYRQ7r2oli30Yc14HxRCgomhCLm1eoQuEXV
	qjpdG7+hu2nXLDR7cyhGWJAcG6AMl1A=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1749716486;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CMbLJupS5OSTa8U/8vbg4Z1Ks0Ank3I8G7D8geSAtv8=;
	b=5sJBuITOmizzL61ZX9azTl1jzzTG5hZvyF1oUPShF6EdIDxWOaiIaqQVw5qGD2iKcCFCbw
	/+adl1gTe2+6DpCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 017C913A6D;
	Thu, 12 Jun 2025 08:21:25 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id UPKlOgWOSmgILAAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Thu, 12 Jun 2025 08:21:25 +0000
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
Subject: [PATCH v2 03/14] fbdev/c2p: Include <linux/export.h>
Date: Thu, 12 Jun 2025 10:16:26 +0200
Message-ID: <20250612081738.197826-4-tzimmermann@suse.de>
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,suse.de:email,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	FROM_EQ_ENVFROM(0.00)[];
	R_RATELIMIT(0.00)[to_ip_from(RLwqwbgho3bgbo9wb3ecq1qfng)];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	TO_DN_SOME(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com,gmx.de]
X-Spam-Level: 
X-Spam-Flag: NO
X-Rspamd-Queue-Id: 54DF01F7EC
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Score: -3.01

Fix the compile-time warnings

  drivers/video/fbdev/c2p_iplan2.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
  drivers/video/fbdev/c2p_planar.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Helge Deller <deller@gmx.de>
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


