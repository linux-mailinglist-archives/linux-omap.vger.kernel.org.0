Return-Path: <linux-omap+bounces-1817-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D44F942EAB
	for <lists+linux-omap@lfdr.de>; Wed, 31 Jul 2024 14:36:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 816A91C2081B
	for <lists+linux-omap@lfdr.de>; Wed, 31 Jul 2024 12:36:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A34B1B013C;
	Wed, 31 Jul 2024 12:35:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="mmN4Yh/k";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="vsUeDmCE";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="mmN4Yh/k";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="vsUeDmCE"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09C0B1AED46;
	Wed, 31 Jul 2024 12:35:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722429339; cv=none; b=Uzd4b2yqDI1bEUU4qW5jDg5IwcK15pavv9aQeQXBEOkZoBJt8I2rVWuHTAhq6dqQ1/u+seBgbkG8XQZRa0tM/9ul5uOTx9hTP3ycCChUhGyKbO+3IJOOBEr7XaFI1Bd9YUS7etjKiTSmbdXIa5QZ5UcgPxZkKxCfA9UrbhJr5W4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722429339; c=relaxed/simple;
	bh=ukpxQXSYDkc1ACZBIUdyI4e8sf3Ya2W6ayLHGwFAd4M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HG1t+WcOFo6MVYl7xA+4rsYlhtKZ9UJHD2/sBEJ3iUYsf8hIr3Nt22nEFcm6fnCWrEcL23a5fau0MJSGnoFeJ6H2sdSbcUG2eZPosG56G8+vu9JnH8e98cYNjMfG6xGxggQUejfVIHQi66b3l51/ThK7lpVO2gWnyeQHcg0juTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=mmN4Yh/k; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=vsUeDmCE; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=mmN4Yh/k; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=vsUeDmCE; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id E80C321B1B;
	Wed, 31 Jul 2024 12:35:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1722429306; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zc9nJhKTizoTXPGtuht3nktFTrniChSObo107zV4LkQ=;
	b=mmN4Yh/k3NSPWWEbqlFMIyg+7BnTGoxAdz4jqZw9enwE7r4x6pGc++JR0UFBEgRF1IO3O9
	S0fIObqnvwcjm/b9+wCR8atyP+h8i0aWn9ZnhgVC3p2pI0UMpfGV43thPeYACp50hQAcIz
	IqCWphlmpzZ/nmXfdK4lg/gWumAnoVY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1722429306;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zc9nJhKTizoTXPGtuht3nktFTrniChSObo107zV4LkQ=;
	b=vsUeDmCEEbBPvCADe7g6l/NEUTocw/rQjoScBB5+o1pUx0+uLNjvgCquyDkNjB+PXYubpZ
	ZZ/L2Iaur6PENiAg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1722429306; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zc9nJhKTizoTXPGtuht3nktFTrniChSObo107zV4LkQ=;
	b=mmN4Yh/k3NSPWWEbqlFMIyg+7BnTGoxAdz4jqZw9enwE7r4x6pGc++JR0UFBEgRF1IO3O9
	S0fIObqnvwcjm/b9+wCR8atyP+h8i0aWn9ZnhgVC3p2pI0UMpfGV43thPeYACp50hQAcIz
	IqCWphlmpzZ/nmXfdK4lg/gWumAnoVY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1722429306;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zc9nJhKTizoTXPGtuht3nktFTrniChSObo107zV4LkQ=;
	b=vsUeDmCEEbBPvCADe7g6l/NEUTocw/rQjoScBB5+o1pUx0+uLNjvgCquyDkNjB+PXYubpZ
	ZZ/L2Iaur6PENiAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id B845D13297;
	Wed, 31 Jul 2024 12:35:06 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 0DqrK3ovqmYiUQAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Wed, 31 Jul 2024 12:35:06 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: deller@gmx.de
Cc: linux-fbdev@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-omap@vger.kernel.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 6/9] fbdev: omapfb: Use backlight power constants
Date: Wed, 31 Jul 2024 14:33:47 +0200
Message-ID: <20240731123502.1145082-7-tzimmermann@suse.de>
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
X-Spamd-Result: default: False [0.40 / 50.00];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	MIME_GOOD(-0.10)[text/plain];
	FREEMAIL_TO(0.00)[gmx.de];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,imap1.dmz-prg2.suse.org:helo];
	RCVD_COUNT_TWO(0.00)[2];
	FREEMAIL_ENVRCPT(0.00)[gmx.de]
X-Spam-Flag: NO
X-Spam-Score: 0.40

Replace FB_BLANK_ constants with their counterparts from the
backlight subsystem. The values are identical, so there's no
change in functionality or semantics.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Helge Deller <deller@gmx.de>
---
 drivers/video/fbdev/omap2/omapfb/displays/panel-dsi-cm.c      | 4 ++--
 .../video/fbdev/omap2/omapfb/displays/panel-sony-acx565akm.c  | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/video/fbdev/omap2/omapfb/displays/panel-dsi-cm.c b/drivers/video/fbdev/omap2/omapfb/displays/panel-dsi-cm.c
index 274bdf7b3b45..35ed1b2db993 100644
--- a/drivers/video/fbdev/omap2/omapfb/displays/panel-dsi-cm.c
+++ b/drivers/video/fbdev/omap2/omapfb/displays/panel-dsi-cm.c
@@ -1215,7 +1215,7 @@ static int dsicm_probe(struct platform_device *pdev)
 
 		ddata->bldev = bldev;
 
-		bldev->props.power = FB_BLANK_UNBLANK;
+		bldev->props.power = BACKLIGHT_POWER_ON;
 		bldev->props.brightness = 255;
 
 		dsicm_bl_update_status(bldev);
@@ -1253,7 +1253,7 @@ static void dsicm_remove(struct platform_device *pdev)
 
 	bldev = ddata->bldev;
 	if (bldev != NULL) {
-		bldev->props.power = FB_BLANK_POWERDOWN;
+		bldev->props.power = BACKLIGHT_POWER_OFF;
 		dsicm_bl_update_status(bldev);
 		backlight_device_unregister(bldev);
 	}
diff --git a/drivers/video/fbdev/omap2/omapfb/displays/panel-sony-acx565akm.c b/drivers/video/fbdev/omap2/omapfb/displays/panel-sony-acx565akm.c
index 71d2e015960c..e0747a90dc50 100644
--- a/drivers/video/fbdev/omap2/omapfb/displays/panel-sony-acx565akm.c
+++ b/drivers/video/fbdev/omap2/omapfb/displays/panel-sony-acx565akm.c
@@ -753,7 +753,7 @@ static int acx565akm_probe(struct spi_device *spi)
 	}
 
 	memset(&props, 0, sizeof(props));
-	props.power = FB_BLANK_UNBLANK;
+	props.power = BACKLIGHT_POWER_ON;
 	props.type = BACKLIGHT_RAW;
 
 	bldev = backlight_device_register("acx565akm", &ddata->spi->dev,
-- 
2.45.2


