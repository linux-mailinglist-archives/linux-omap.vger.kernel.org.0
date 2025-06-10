Return-Path: <linux-omap+bounces-3798-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B980AD3476
	for <lists+linux-omap@lfdr.de>; Tue, 10 Jun 2025 13:04:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CAC447A6097
	for <lists+linux-omap@lfdr.de>; Tue, 10 Jun 2025 11:02:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E3BE28DF12;
	Tue, 10 Jun 2025 11:03:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="FaZpN5p2";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="fzzZr+qP";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="FaZpN5p2";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="fzzZr+qP"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2FAC747F
	for <linux-omap@vger.kernel.org>; Tue, 10 Jun 2025 11:03:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749553439; cv=none; b=cd7KngjhmgI3XAz58Ty34/DRpNe7YA9/XuxagLn0AzL0G0BMGhhZTJkFVFKagnnE7Mz3V5qLnvKqNjwplBQkopT1TNQb1SvLjw52gqWPc5LNtt2CjLNMgYrzDYINIxvx9pNjJLmfmT6MpXDTGtGrNi7Aqs7eGi5jL4V+kIRxFlA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749553439; c=relaxed/simple;
	bh=S3NDPFvnJmlOy+yNSyT9CO8zALqdkA+CgCrwNZiJdZ8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=n0Lj9Mgs29P4yK841g7hAUoOH0HZaRyvEy1c86Gr1aVQR8DHx7eLRdUEALbrL81udntDLhuwJA7KCpR+C7FidEZMavBQ+G23GSoRcJOtfMGvoMMUE858mmJ6bcKWxfQd9o/0ZsDa1VGLsRcdluXh1nzBD7M8AWK0k/kYHQatvXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=FaZpN5p2; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=fzzZr+qP; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=FaZpN5p2; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=fzzZr+qP; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id D62FB21989;
	Tue, 10 Jun 2025 11:03:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1749553406; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QFF/VDCaBeJg0xRNuB1Q3WCLsI36V6WPpnd2AkwWVQg=;
	b=FaZpN5p2EBoh1HOdRYBZk8H0QrAJmtbhO4mzvutaUcFk/LZor2fTclWwnJsIyAEGcjXIrF
	4p8jVzr/xZp/lnL9uwRYlWrdaQc7Z/vJ63pvlzfiPgRfeg63DPp+KD8kMx3a3yuqZFVWSa
	qyewHdkhjUl/mUZavG+e3EmZPBGdXew=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1749553406;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QFF/VDCaBeJg0xRNuB1Q3WCLsI36V6WPpnd2AkwWVQg=;
	b=fzzZr+qPGyTOPOIxqNfg7JmKDRaqBFFYlm+7g7TNZ51DAZCHsl5iG8O0PmXXWAFdnzxmWJ
	opGcszwpvXCNmPDQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1749553406; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QFF/VDCaBeJg0xRNuB1Q3WCLsI36V6WPpnd2AkwWVQg=;
	b=FaZpN5p2EBoh1HOdRYBZk8H0QrAJmtbhO4mzvutaUcFk/LZor2fTclWwnJsIyAEGcjXIrF
	4p8jVzr/xZp/lnL9uwRYlWrdaQc7Z/vJ63pvlzfiPgRfeg63DPp+KD8kMx3a3yuqZFVWSa
	qyewHdkhjUl/mUZavG+e3EmZPBGdXew=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1749553406;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QFF/VDCaBeJg0xRNuB1Q3WCLsI36V6WPpnd2AkwWVQg=;
	b=fzzZr+qPGyTOPOIxqNfg7JmKDRaqBFFYlm+7g7TNZ51DAZCHsl5iG8O0PmXXWAFdnzxmWJ
	opGcszwpvXCNmPDQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 7929F13A69;
	Tue, 10 Jun 2025 11:03:26 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id cARqHP4QSGgOTAAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Tue, 10 Jun 2025 11:03:26 +0000
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
Subject: [PATCH 10/14] fbdev/mb862xx: Do not include <linux/export.h>
Date: Tue, 10 Jun 2025 12:56:43 +0200
Message-ID: <20250610105948.384540-11-tzimmermann@suse.de>
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

  drivers/video/fbdev/mb862xx/mb862xx-i2c.c: warning: EXPORT_SYMBOL() is not used, but #include <linux/export.h> is present

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/video/fbdev/mb862xx/mb862xx-i2c.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/video/fbdev/mb862xx/mb862xx-i2c.c b/drivers/video/fbdev/mb862xx/mb862xx-i2c.c
index ffdb1597d303..08b7f19a67a5 100644
--- a/drivers/video/fbdev/mb862xx/mb862xx-i2c.c
+++ b/drivers/video/fbdev/mb862xx/mb862xx-i2c.c
@@ -9,7 +9,6 @@
 #include <linux/i2c.h>
 #include <linux/io.h>
 #include <linux/delay.h>
-#include <linux/export.h>
 
 #include "mb862xxfb.h"
 #include "mb862xx_reg.h"
-- 
2.49.0


