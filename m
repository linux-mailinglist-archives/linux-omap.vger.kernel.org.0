Return-Path: <linux-omap+bounces-2134-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D91996ECD6
	for <lists+linux-omap@lfdr.de>; Fri,  6 Sep 2024 09:55:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 165C0288E68
	for <lists+linux-omap@lfdr.de>; Fri,  6 Sep 2024 07:55:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D490156C5E;
	Fri,  6 Sep 2024 07:54:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Z83A8UDM";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="nHHLlCTy";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Z83A8UDM";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="nHHLlCTy"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFAEB156864;
	Fri,  6 Sep 2024 07:54:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725609291; cv=none; b=D+CtduFDotQAnuWPMPF7SVXGE5eLeAyVP4zeXpJ5yG+LJ/8ehIJQIui4DWOUKv4osQgeH8uhHe2xbRsUnCDMOuitvm7wBPvODMFwk+hFCde/nKmAPIUnYP7lo0dA7LJs6B3M9rigsMGae5Rb/6Jd3r5SNVG3mKzwbfyFAfjZ2i0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725609291; c=relaxed/simple;
	bh=VYuHOCDLRJ453vjxmALy0ijTiVL+u4ZR3ibG7kIp8Fk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bfICzQvx6dx/qguwcXk61TiUp6sGhZC9aE2dozd/WUamMc4Gq7OEi4RVlVejPMJNIdUnE7lumS3aDfot9YQU9SnVK9uazwWmmf4L5B2HNS8Jgmh+Oa0v3qOEbgVzKPaCkqvAlwBrZHLKjSJr8CB4gzChFLyB7uwronrmGPDIHYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Z83A8UDM; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=nHHLlCTy; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Z83A8UDM; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=nHHLlCTy; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 20CF71F897;
	Fri,  6 Sep 2024 07:54:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1725609288; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=l++ywP0V2zIm23yb1Kx1TAmyZrDniAsdSNm4Wj0iVlw=;
	b=Z83A8UDMoP5cc1hH0nz9xruO0BgN31o6sD66JA1Oe82LUcEdC5kBpUqw/Nig3xm9x5Wo1H
	I/ZhkAuXnovSTTfaCZlnxGtOSoYivBTqW/RF56i/N8GLhxC0qg1rMZFrNx9W0U1vf5ZH1p
	eXQNMBVvLTwLlanmMW7akSP5MBVon2g=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1725609288;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=l++ywP0V2zIm23yb1Kx1TAmyZrDniAsdSNm4Wj0iVlw=;
	b=nHHLlCTyCHFrUASaP0u6AC8j6IDyKr6A1KJOPalogpRYBZbX76zHFbhYe9m4jz4EduTpGE
	SWEFc0I9uYgVg9Cg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1725609288; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=l++ywP0V2zIm23yb1Kx1TAmyZrDniAsdSNm4Wj0iVlw=;
	b=Z83A8UDMoP5cc1hH0nz9xruO0BgN31o6sD66JA1Oe82LUcEdC5kBpUqw/Nig3xm9x5Wo1H
	I/ZhkAuXnovSTTfaCZlnxGtOSoYivBTqW/RF56i/N8GLhxC0qg1rMZFrNx9W0U1vf5ZH1p
	eXQNMBVvLTwLlanmMW7akSP5MBVon2g=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1725609288;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=l++ywP0V2zIm23yb1Kx1TAmyZrDniAsdSNm4Wj0iVlw=;
	b=nHHLlCTyCHFrUASaP0u6AC8j6IDyKr6A1KJOPalogpRYBZbX76zHFbhYe9m4jz4EduTpGE
	SWEFc0I9uYgVg9Cg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id BC220136A8;
	Fri,  6 Sep 2024 07:54:47 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id qFSGLEe12mbGPAAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Fri, 06 Sep 2024 07:54:47 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: lee@kernel.org,
	daniel.thompson@linaro.org,
	jingoohan1@gmail.com,
	deller@gmx.de,
	bonbons@linux-vserver.org,
	jikos@kernel.org,
	bentiss@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	shawnguo@kernel.org,
	festevam@gmail.com
Cc: dri-devel@lists.freedesktop.org,
	linux-fbdev@vger.kernel.org,
	linux-omap@vger.kernel.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v2 15/28] backlight: otm3225a: Use lcd power constants
Date: Fri,  6 Sep 2024 09:52:29 +0200
Message-ID: <20240906075439.98476-16-tzimmermann@suse.de>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240906075439.98476-1-tzimmermann@suse.de>
References: <20240906075439.98476-1-tzimmermann@suse.de>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: -6.80
X-Spamd-Result: default: False [-6.80 / 50.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,linaro.org,gmail.com,gmx.de,linux-vserver.org,pengutronix.de];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	R_RATELIMIT(0.00)[to_ip_from(RL7eb4yoy35resap1sns3bbybe)];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FREEMAIL_ENVRCPT(0.00)[gmail.com,gmx.de]
X-Spam-Flag: NO
X-Spam-Level: 

Replace FB_BLANK_ constants with their counterparts from the
lcd subsystem. The values are identical, so there's no change
in functionality.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>
---
 drivers/video/backlight/otm3225a.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/video/backlight/otm3225a.c b/drivers/video/backlight/otm3225a.c
index efe52fa08b07..5c6575f23ea8 100644
--- a/drivers/video/backlight/otm3225a.c
+++ b/drivers/video/backlight/otm3225a.c
@@ -189,7 +189,7 @@ static int otm3225a_set_power(struct lcd_device *ld, int power)
 	if (power == dd->power)
 		return 0;
 
-	if (power > FB_BLANK_UNBLANK)
+	if (power > LCD_POWER_ON)
 		otm3225a_write(dd->spi, display_off, ARRAY_SIZE(display_off));
 	else
 		otm3225a_write(dd->spi, display_on, ARRAY_SIZE(display_on));
-- 
2.46.0


