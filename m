Return-Path: <linux-omap+bounces-1938-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5349A958289
	for <lists+linux-omap@lfdr.de>; Tue, 20 Aug 2024 11:35:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F0C151F241B4
	for <lists+linux-omap@lfdr.de>; Tue, 20 Aug 2024 09:35:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2FBEB18CBF5;
	Tue, 20 Aug 2024 09:35:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="0LFYL42A";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="1lt4Ib6M";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="0LFYL42A";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="1lt4Ib6M"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34A1C18C348;
	Tue, 20 Aug 2024 09:35:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724146506; cv=none; b=UKRci/SLfukP1kyxp95NT7jAwTYPveEslHbZGVDcV95jqyt+pxXnow1wPdYmZLB+WVxpfzqzzgxTLtf192pusbbHkceawiJ7FH1yoMobPenO+0Wk/Ty04vTV6wuEWXuu+lbskRmZwXwIU8bxozN5TQ1XIJ9fUM6bTVckEcOErs8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724146506; c=relaxed/simple;
	bh=I6H5qPfuHX3+llqg+7c+q1Vtpf9vbBr1YkjJcM2ahDw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cU3Fc7SrOSIlCmUexcHYaV6Mo/wDr6meuhws4B97P2dEJZK7WriE4SwCaF2rCqnh22LhSWjfPqZxKJzuCQsYZ+sX8nSJ1yugFJ93ApzzcMnjopsOGyM/CkfJpQSMgrpLqTWczxiTA4oSlU5nSWDaCv3ro4Ku7IqoGXCe5YuCTxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=0LFYL42A; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=1lt4Ib6M; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=0LFYL42A; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=1lt4Ib6M; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 81F691FFCB;
	Tue, 20 Aug 2024 09:35:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1724146503; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=51r7acza8wHc05J64PIX5ANoj2cb6ZBtIfWBALg7ASc=;
	b=0LFYL42AwZL7KdMpoSzY9fYkah3lJjaRpu+xqAi5h3JR+xi1SoNDnOG3T5LPhzZWKUyeoG
	e5RHUW5RDGYLZksTPLv2M+WG39OgxmU2r9660r5+WXoehg10SA686ScHVTjCpbglwqTyNY
	Nj+79NK4OiILKZGpHuPnlcUlFgipBTw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1724146503;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=51r7acza8wHc05J64PIX5ANoj2cb6ZBtIfWBALg7ASc=;
	b=1lt4Ib6MgG7IhcFnRR851TWdCxIo6xsx8oNfjvO1/Ky/9XKB4NylESlLOBVmdfPk0IuEcg
	VYZK6Km4sQWBy6Dg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1724146503; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=51r7acza8wHc05J64PIX5ANoj2cb6ZBtIfWBALg7ASc=;
	b=0LFYL42AwZL7KdMpoSzY9fYkah3lJjaRpu+xqAi5h3JR+xi1SoNDnOG3T5LPhzZWKUyeoG
	e5RHUW5RDGYLZksTPLv2M+WG39OgxmU2r9660r5+WXoehg10SA686ScHVTjCpbglwqTyNY
	Nj+79NK4OiILKZGpHuPnlcUlFgipBTw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1724146503;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=51r7acza8wHc05J64PIX5ANoj2cb6ZBtIfWBALg7ASc=;
	b=1lt4Ib6MgG7IhcFnRR851TWdCxIo6xsx8oNfjvO1/Ky/9XKB4NylESlLOBVmdfPk0IuEcg
	VYZK6Km4sQWBy6Dg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 2218213AFE;
	Tue, 20 Aug 2024 09:35:03 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id yNUjB0djxGa3RAAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Tue, 20 Aug 2024 09:35:03 +0000
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
Subject: [PATCH 09/28] backlight: jornada720_lcd: Use lcd power constants
Date: Tue, 20 Aug 2024 11:22:47 +0200
Message-ID: <20240820093452.68270-10-tzimmermann@suse.de>
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
	R_RATELIMIT(0.00)[to_ip_from(RL7eb4yoy35resap1sns3bbybe)];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FREEMAIL_ENVRCPT(0.00)[gmail.com,gmx.de,mail.ru]
X-Spam-Score: -2.80
X-Spam-Flag: NO

Replace FB_BLANK_ constants with their counterparts from the
lcd subsystem. The values are identical, so there's no change
in functionality.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/video/backlight/jornada720_lcd.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/video/backlight/jornada720_lcd.c b/drivers/video/backlight/jornada720_lcd.c
index 73278f6ace64..31a52dee9060 100644
--- a/drivers/video/backlight/jornada720_lcd.c
+++ b/drivers/video/backlight/jornada720_lcd.c
@@ -6,7 +6,6 @@
  */
 
 #include <linux/device.h>
-#include <linux/fb.h>
 #include <linux/io.h>
 #include <linux/kernel.h>
 #include <linux/lcd.h>
@@ -24,14 +23,14 @@
 
 static int jornada_lcd_get_power(struct lcd_device *ld)
 {
-	return PPSR & PPC_LDD2 ? FB_BLANK_UNBLANK : FB_BLANK_POWERDOWN;
+	return PPSR & PPC_LDD2 ? LCD_POWER_ON : LCD_POWER_OFF;
 }
 
 static int jornada_lcd_get_contrast(struct lcd_device *ld)
 {
 	int ret;
 
-	if (jornada_lcd_get_power(ld) != FB_BLANK_UNBLANK)
+	if (jornada_lcd_get_power(ld) != LCD_POWER_ON)
 		return 0;
 
 	jornada_ssp_start();
@@ -72,7 +71,7 @@ static int jornada_lcd_set_contrast(struct lcd_device *ld, int value)
 
 static int jornada_lcd_set_power(struct lcd_device *ld, int power)
 {
-	if (power != FB_BLANK_UNBLANK) {
+	if (power != LCD_POWER_ON) {
 		PPSR &= ~PPC_LDD2;
 		PPDR |= PPC_LDD2;
 	} else {
@@ -107,7 +106,7 @@ static int jornada_lcd_probe(struct platform_device *pdev)
 
 	/* lets set our default values */
 	jornada_lcd_set_contrast(lcd_device, LCD_DEF_CONTRAST);
-	jornada_lcd_set_power(lcd_device, FB_BLANK_UNBLANK);
+	jornada_lcd_set_power(lcd_device, LCD_POWER_ON);
 	/* give it some time to startup */
 	msleep(100);
 
-- 
2.46.0


