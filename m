Return-Path: <linux-omap+bounces-1812-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B47AF942E9C
	for <lists+linux-omap@lfdr.de>; Wed, 31 Jul 2024 14:35:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 34005B23797
	for <lists+linux-omap@lfdr.de>; Wed, 31 Jul 2024 12:35:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0625A1B140A;
	Wed, 31 Jul 2024 12:35:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="O8uKgjGd";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Hz3slqku";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="O8uKgjGd";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Hz3slqku"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 111CB1AED22;
	Wed, 31 Jul 2024 12:35:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722429311; cv=none; b=iqsCvleRtVvtHgWN4ghUAbgWRxTfT7P7z/r1TPt2Nbqs7LuLwwCrWhpjUObSJuhNg54NYFrt37tNX/mxSqy4KgsixDihmvhEjgY67viHEO1Lim6y1hTDbAZxhb+6fS1A0lfZCzMNKHNtSYlL2D4uRrOYLzxWL+2m4yDq+/C4CEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722429311; c=relaxed/simple;
	bh=s4UhAQ0AVOEUdOuRsU+Ekr2cP1eK7VIpSJy6QtoOHQ8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=l9D9t8aPVR7CD5TMJih+BGt4f5UVskPzP4VtVtE0Ud1kxQa2zkaEpEHCV2JZjH9TH2xnQq4Dl5axFlVD5EGUFrSZvRu+kuUxgCF9f8tjV2bw65EtiDSmny/PF9hTpSVUIjgHVWQpEDdXPwLPuzJInDGUJkBUMAYjuDutgkh89G4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=O8uKgjGd; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Hz3slqku; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=O8uKgjGd; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Hz3slqku; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 693A821B39;
	Wed, 31 Jul 2024 12:35:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1722429307; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=w9/nWl/KNut5v7r+JInN6Zxmgngat7AGU3elpa5TuVQ=;
	b=O8uKgjGdCOCCpxp1jbHG3gRuA5pcRoXUDrEN0PP98KYYQ4hW4bv1czs/OBThcVVPZtvNUN
	NiLu8alxPS0AQw4FX1tNk7ecZ2AJVJem4wOEF2zA9pOF/IrPi64KXPneW4XFvGDQFAD2xT
	MO7eAWUxOdVLlc9GL/88UseRlsze5eU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1722429307;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=w9/nWl/KNut5v7r+JInN6Zxmgngat7AGU3elpa5TuVQ=;
	b=Hz3slqkuxZ/xrcj+44JVay/E6i0g+h8UsK33ZC2l/OdlEesTU8oYJG4vKHq0ntA7t/2ift
	KZaNF6j7ELc5V3Bg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1722429307; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=w9/nWl/KNut5v7r+JInN6Zxmgngat7AGU3elpa5TuVQ=;
	b=O8uKgjGdCOCCpxp1jbHG3gRuA5pcRoXUDrEN0PP98KYYQ4hW4bv1czs/OBThcVVPZtvNUN
	NiLu8alxPS0AQw4FX1tNk7ecZ2AJVJem4wOEF2zA9pOF/IrPi64KXPneW4XFvGDQFAD2xT
	MO7eAWUxOdVLlc9GL/88UseRlsze5eU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1722429307;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=w9/nWl/KNut5v7r+JInN6Zxmgngat7AGU3elpa5TuVQ=;
	b=Hz3slqkuxZ/xrcj+44JVay/E6i0g+h8UsK33ZC2l/OdlEesTU8oYJG4vKHq0ntA7t/2ift
	KZaNF6j7ELc5V3Bg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 3535013297;
	Wed, 31 Jul 2024 12:35:07 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id UC+nC3svqmYiUQAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Wed, 31 Jul 2024 12:35:07 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: deller@gmx.de
Cc: linux-fbdev@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-omap@vger.kernel.org,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Antonino Daplas <adaplas@gmail.com>
Subject: [PATCH 8/9] fbdev: rivafb: Use backlight power constants
Date: Wed, 31 Jul 2024 14:33:49 +0200
Message-ID: <20240731123502.1145082-9-tzimmermann@suse.de>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240731123502.1145082-1-tzimmermann@suse.de>
References: <20240731123502.1145082-1-tzimmermann@suse.de>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [-2.60 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	MIME_GOOD(-0.10)[text/plain];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,imap1.dmz-prg2.suse.org:helo];
	RCVD_TLS_ALL(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.freedesktop.org,lists.infradead.org,suse.de,gmail.com];
	FREEMAIL_TO(0.00)[gmx.de];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCPT_COUNT_SEVEN(0.00)[7];
	TO_DN_SOME(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FREEMAIL_ENVRCPT(0.00)[gmail.com,gmx.de]
X-Spam-Flag: NO
X-Spam-Score: -2.60

Replace FB_BLANK_ constants with their counterparts from the
backlight subsystem. The values are identical, so there's no
change in functionality or semantics.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Antonino Daplas <adaplas@gmail.com>
Cc: Helge Deller <deller@gmx.de>
---
 drivers/video/fbdev/riva/fbdev.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/video/fbdev/riva/fbdev.c b/drivers/video/fbdev/riva/fbdev.c
index 237db738af13..1e377b2ec089 100644
--- a/drivers/video/fbdev/riva/fbdev.c
+++ b/drivers/video/fbdev/riva/fbdev.c
@@ -347,7 +347,7 @@ static void riva_bl_init(struct riva_par *par)
 		FB_BACKLIGHT_MAX);
 
 	bd->props.brightness = bd->props.max_brightness;
-	bd->props.power = FB_BLANK_UNBLANK;
+	bd->props.power = BACKLIGHT_POWER_ON;
 	backlight_update_status(bd);
 
 	printk("riva: Backlight initialized (%s)\n", name);
-- 
2.45.2


