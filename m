Return-Path: <linux-omap+bounces-1958-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 53F7A9582B1
	for <lists+linux-omap@lfdr.de>; Tue, 20 Aug 2024 11:36:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0ADCF1F2445D
	for <lists+linux-omap@lfdr.de>; Tue, 20 Aug 2024 09:36:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CDA6318DF80;
	Tue, 20 Aug 2024 09:35:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="aRywnqQq";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="TFBJknGR";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="aRywnqQq";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="TFBJknGR"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECF6618C918;
	Tue, 20 Aug 2024 09:35:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724146514; cv=none; b=QkAd3ltszeYjzxyCELMVW0mS83kYU6A1Q2WrABc0wEil0JufHNiTTvAWfWxwE3ByaBe7CQOhOFhpTyfl2RgyTVrRjiAmRWzoKPpg2i+Ix4ly5mgPeIgcqdPepJvptStX1FoTrgjWDxYV181MpFuaCJUzR5GrPHC1zAHxE4aXpSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724146514; c=relaxed/simple;
	bh=/4dihsU/xlFpgnq6lqk5X0nm0Po3VNwUN4YZAAZHEuw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AMNkvCQIkDAbyz1RO9ynHezYtmwlynMgDCZFpu6oBkKE4oqtcyVyitJEjRCulZqxLxSq98MScQQyX4Czt0qviAPoAKZD7uoPiJTIcJvTrx7+Vi0iM06WBkiWyEwbwBg4mjQXjGcpkb6hNUDHlJZ0EB/94k+4BvURZpFyGIpDk40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=aRywnqQq; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=TFBJknGR; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=aRywnqQq; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=TFBJknGR; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 6A861225B6;
	Tue, 20 Aug 2024 09:35:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1724146511; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=17S1lOwBlZ4ZwI5HR27QexSgcKc55keHcjdB1iyt98c=;
	b=aRywnqQqB1mofpGwIGjIZMuNYZMIfLlNsFSrPaHjPyWZIjOStnMAhcCcOCw39DgfJromJr
	X2SKj9AuWroHZ6at3hykRfd6f0BsvPfAY3S8ADWeaEqADk97v9UE75VBI4Wt+Wkk++RFrJ
	IlKxgV5hfJWSZh4E2K+eha4JC7rGopQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1724146511;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=17S1lOwBlZ4ZwI5HR27QexSgcKc55keHcjdB1iyt98c=;
	b=TFBJknGRTk5K1DABWSmpaDZu9AryCZtMvBDccAH4tHoXae/ndh9Vj4HW5A7Q5IsuMvS0oW
	NNY7mxQUsdz/9WAA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1724146511; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=17S1lOwBlZ4ZwI5HR27QexSgcKc55keHcjdB1iyt98c=;
	b=aRywnqQqB1mofpGwIGjIZMuNYZMIfLlNsFSrPaHjPyWZIjOStnMAhcCcOCw39DgfJromJr
	X2SKj9AuWroHZ6at3hykRfd6f0BsvPfAY3S8ADWeaEqADk97v9UE75VBI4Wt+Wkk++RFrJ
	IlKxgV5hfJWSZh4E2K+eha4JC7rGopQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1724146511;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=17S1lOwBlZ4ZwI5HR27QexSgcKc55keHcjdB1iyt98c=;
	b=TFBJknGRTk5K1DABWSmpaDZu9AryCZtMvBDccAH4tHoXae/ndh9Vj4HW5A7Q5IsuMvS0oW
	NNY7mxQUsdz/9WAA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 0202C13770;
	Tue, 20 Aug 2024 09:35:10 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id cCvoOk5jxGa3RAAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Tue, 20 Aug 2024 09:35:10 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: lee@kernel.org,
	daniel.thompson@linaro.org,
	jingoohan1@gmail.com,
	deller@gmx.de,
	bonbons@linux-vserver.org,
	jikos@kernel.org,
	bentiss@kernel.org,
	shc_work@mail.ru,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	shawnguo@kernel.org,
	festevam@gmail.com
Cc: dri-devel@lists.freedesktop.org,
	linux-fbdev@vger.kernel.org,
	linux-omap@vger.kernel.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 28/28] backlight: lcd: Do not include <linux/fb.h> in lcd header
Date: Tue, 20 Aug 2024 11:23:06 +0200
Message-ID: <20240820093452.68270-29-tzimmermann@suse.de>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240820093452.68270-1-tzimmermann@suse.de>
References: <20240820093452.68270-1-tzimmermann@suse.de>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: -2.80
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCPT_COUNT_TWELVE(0.00)[16];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,linaro.org,gmail.com,gmx.de,linux-vserver.org,mail.ru,pengutronix.de];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	R_RATELIMIT(0.00)[to(RLr3u6jgwj9sedc854c38mga),to_ip_from(RL7eb4yoy35resap1sns3bbybe)];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid,suse.de:email];
	FREEMAIL_ENVRCPT(0.00)[gmail.com,gmx.de,mail.ru]
X-Spam-Flag: NO
X-Spam-Level: 

With the excpetion of fb_notifier_callback(), none of the lcd code
uses fbdev; especially the lcd drivers. Remove the include statement
for <linux/fb.h> from the public lcd header.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 include/linux/lcd.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/include/linux/lcd.h b/include/linux/lcd.h
index 59a80b396a71..c3ccdff4519a 100644
--- a/include/linux/lcd.h
+++ b/include/linux/lcd.h
@@ -12,7 +12,6 @@
 #include <linux/device.h>
 #include <linux/mutex.h>
 #include <linux/notifier.h>
-#include <linux/fb.h>
 
 #define LCD_POWER_ON			(0)
 #define LCD_POWER_REDUCED		(1) // deprecated; don't use in new code
-- 
2.46.0


