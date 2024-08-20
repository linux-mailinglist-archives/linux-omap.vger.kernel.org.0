Return-Path: <linux-omap+bounces-1956-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 71C689582AF
	for <lists+linux-omap@lfdr.de>; Tue, 20 Aug 2024 11:36:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2AA1F28597A
	for <lists+linux-omap@lfdr.de>; Tue, 20 Aug 2024 09:36:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6F7418DF7D;
	Tue, 20 Aug 2024 09:35:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="SfevEho4";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="HqJVtlhl";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="D50kxF66";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="7OReGM9g"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 357F618DF64;
	Tue, 20 Aug 2024 09:35:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724146514; cv=none; b=UxQ1cMB/PhNcrQShUuL5fvDUwDyVecUhXGmtnAeJgzUVB/StUk6mpeigy7uZi5riSTLh9uPzdcwiWNK9EfpJTYJkapqzV4Ow6CVU2E9iTyER1ElEynXlis9cmn+vaJAupU3ayYTbmRcZ6BuErpTN7RbhU18MdbqEZ0jYgzWpeRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724146514; c=relaxed/simple;
	bh=txu9/PSJ5v9C4p8JHaR5jD0e7aO0Nbnj5iopHPsaW5k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Owr7o+vh1INNg89++/8M3hX4WkPv/wn4AWDa6kmqrhvVZL7PmhJLcsv7z4TH4ds88WuV+TJRgAFxm4n6uqEq+9vzW44/JqtUjNvHCEwXqhP25bDuXAYG/zmyI0RnUrVwwzFvfP95is0wipm3x6bzR9giDWa6kOl2ukI2bXkCqAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=SfevEho4; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=HqJVtlhl; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=D50kxF66; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=7OReGM9g; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 49AAB225B1;
	Tue, 20 Aug 2024 09:35:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1724146510; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VpG2TZF6xnwmW4yKSVKM8wu//ThgCXdqU0N3OrIkZjs=;
	b=SfevEho4RhY30Ogb/UxdpHUfufeUG/zooxyS2kgYx4TB5QRBCez3DalNCCjiiHcG/Z21WI
	f/mYu3ZXvdq+qZZswST4XXunBtwFI1DBBkf0rVFKqLBWDPfZCOn2ofNexXZ39KiJcg0/dP
	8savuj5uRl6XZEpAaAXNgyH3NK8i6aI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1724146510;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VpG2TZF6xnwmW4yKSVKM8wu//ThgCXdqU0N3OrIkZjs=;
	b=HqJVtlhllsrOzMxYMHtMwM633QSGnvHgTZ78E8rRTlr/JOQKXVuk+D+H3UnXTs1N8yzDT4
	7y3MH2xPfBZI7uCA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1724146509; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VpG2TZF6xnwmW4yKSVKM8wu//ThgCXdqU0N3OrIkZjs=;
	b=D50kxF66cthK0W/9Vao+RiQPZLq/rcXF1UkbqVZo65Ml0hJgMyARZ6m/Rl2fQkU2CG7L+/
	EvcqrXkNXUcInF0IazgQJ/N3jXoitRR0LCGljN62Werq0ndQxM2aXYZGkMMW3eh7gLuOmJ
	jOfbToProX4nKh+bArwFdHyBT7IYAYg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1724146509;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VpG2TZF6xnwmW4yKSVKM8wu//ThgCXdqU0N3OrIkZjs=;
	b=7OReGM9gLvrmYTmjH5DRAtHXYBb0o3/Q8/z7Xa40fRvhLo1ZjQ5aiLQp+z1NgtU/Ufx8so
	Z4a3f8YzJtCVr3BA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id E1C4C13AFE;
	Tue, 20 Aug 2024 09:35:08 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id YJrtNUxjxGa3RAAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Tue, 20 Aug 2024 09:35:08 +0000
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
Subject: [PATCH 23/28] fbdev: imxfb: Use lcd power constants
Date: Tue, 20 Aug 2024 11:23:01 +0200
Message-ID: <20240820093452.68270-24-tzimmermann@suse.de>
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
X-Spam-Level: 
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
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
	RCPT_COUNT_TWELVE(0.00)[16];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:email,suse.de:mid];
	FREEMAIL_TO(0.00)[kernel.org,linaro.org,gmail.com,gmx.de,linux-vserver.org,mail.ru,pengutronix.de];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	R_RATELIMIT(0.00)[to_ip_from(RL7eb4yoy35resap1sns3bbybe),to(RLr3u6jgwj9sedc854c38mga)];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FREEMAIL_ENVRCPT(0.00)[gmail.com,gmx.de,mail.ru]
X-Spam-Score: -2.80
X-Spam-Flag: NO

Replace FB_BLANK_ constants with their counterparts from the
lcd subsystem. The values are identical, so there's no change
in functionality.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/video/fbdev/imxfb.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/video/fbdev/imxfb.c b/drivers/video/fbdev/imxfb.c
index 88c117f29f7f..97466e0c5877 100644
--- a/drivers/video/fbdev/imxfb.c
+++ b/drivers/video/fbdev/imxfb.c
@@ -814,9 +814,9 @@ static int imxfb_lcd_get_power(struct lcd_device *lcddev)
 
 	if (!IS_ERR(fbi->lcd_pwr) &&
 	    !regulator_is_enabled(fbi->lcd_pwr))
-		return FB_BLANK_POWERDOWN;
+		return LCD_POWER_OFF;
 
-	return FB_BLANK_UNBLANK;
+	return LCD_POWER_ON;
 }
 
 static int imxfb_regulator_set(struct imxfb_info *fbi, int enable)
@@ -842,7 +842,7 @@ static int imxfb_lcd_set_power(struct lcd_device *lcddev, int power)
 	struct imxfb_info *fbi = dev_get_drvdata(&lcddev->dev);
 
 	if (!IS_ERR(fbi->lcd_pwr))
-		return imxfb_regulator_set(fbi, power == FB_BLANK_UNBLANK);
+		return imxfb_regulator_set(fbi, power == LCD_POWER_ON);
 
 	return 0;
 }
-- 
2.46.0


