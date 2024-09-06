Return-Path: <linux-omap+bounces-2127-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id ED5FB96ECBE
	for <lists+linux-omap@lfdr.de>; Fri,  6 Sep 2024 09:55:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ACCD8288A85
	for <lists+linux-omap@lfdr.de>; Fri,  6 Sep 2024 07:55:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9446E155C8C;
	Fri,  6 Sep 2024 07:54:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="xMlkTNQp";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="q9InRhO1";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="xMlkTNQp";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="q9InRhO1"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF1731552ED;
	Fri,  6 Sep 2024 07:54:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725609288; cv=none; b=BT1be5Styf2ikRKjkIDxJVF0v1EtqpfpsDWrPeEZzrbLpp3Z3RPcIA2UNb5mTjd6dxZrIpW81M1zHhMXIZzZ+55KlSjY/Vs70U9kLTSmLyFnewFxmqKxSF+f7T+zwSogspXU5MYDvevSORI5GusUh+BCaIbRF12O6UVa0jMC1Xo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725609288; c=relaxed/simple;
	bh=91FZNpsuw5tmlsCwHMiEEGRvN7GyC+VMouSppWeWjOU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MoCbnRvjiPiDZwsIatFArZB7v1UAkXTH1ieHBkwDxSaGqL70z1PEpGe8ahnfvQm8Dftj0nIAJG8OBo/Qcqul4Mi3IgToVVFfhe5Ohzn9QLFVA/RQYHbnveoPSTkqChZI2imcyYWSKb6IgOiuN34kEp6oEotWsVH4WCf1JjJf16E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=xMlkTNQp; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=q9InRhO1; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=xMlkTNQp; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=q9InRhO1; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 3742D1F8A6;
	Fri,  6 Sep 2024 07:54:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1725609285; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tS+2o0E6JjM3kSJbLNOX2zdRGM8g91XqQ/87oBMRnww=;
	b=xMlkTNQpFGIK+5lpBhTG6JpKmuuwcSm4BqOFSBRUf7l2eJjQoyxHZnoSAviSZfe8cIBg8y
	GCiKap/BKpfXbMFc8Hw6FqFrk6EZJ4Yed2kme1auR3BU/WtpZV6W0s3hsVI4ft6IsDEYvR
	jhnXLLUjsd6a+S6xD7nz9AtWlPW5Irs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1725609285;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tS+2o0E6JjM3kSJbLNOX2zdRGM8g91XqQ/87oBMRnww=;
	b=q9InRhO1YZ7JVGAGsxkGKlb98dTadGF75MXB+wGOBhcbjvkdZ+GwhiOgToBEjbpUql2lwN
	rSmMZbqWS+iQfvDQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1725609285; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tS+2o0E6JjM3kSJbLNOX2zdRGM8g91XqQ/87oBMRnww=;
	b=xMlkTNQpFGIK+5lpBhTG6JpKmuuwcSm4BqOFSBRUf7l2eJjQoyxHZnoSAviSZfe8cIBg8y
	GCiKap/BKpfXbMFc8Hw6FqFrk6EZJ4Yed2kme1auR3BU/WtpZV6W0s3hsVI4ft6IsDEYvR
	jhnXLLUjsd6a+S6xD7nz9AtWlPW5Irs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1725609285;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tS+2o0E6JjM3kSJbLNOX2zdRGM8g91XqQ/87oBMRnww=;
	b=q9InRhO1YZ7JVGAGsxkGKlb98dTadGF75MXB+wGOBhcbjvkdZ+GwhiOgToBEjbpUql2lwN
	rSmMZbqWS+iQfvDQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id BE4D6136A8;
	Fri,  6 Sep 2024 07:54:44 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id mA0yLUS12mbGPAAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Fri, 06 Sep 2024 07:54:44 +0000
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
Subject: [PATCH v2 08/28] backlight: jornada720_lcd: Include <linux/io.h> for IOMEM() macro
Date: Fri,  6 Sep 2024 09:52:22 +0200
Message-ID: <20240906075439.98476-9-tzimmermann@suse.de>
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
	BAYES_HAM(-3.00)[100.00%];
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

Avoids the proxy include via <linux/fb.h>.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>
---
 drivers/video/backlight/jornada720_lcd.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/video/backlight/jornada720_lcd.c b/drivers/video/backlight/jornada720_lcd.c
index 5c64fa61e810..73278f6ace64 100644
--- a/drivers/video/backlight/jornada720_lcd.c
+++ b/drivers/video/backlight/jornada720_lcd.c
@@ -7,6 +7,7 @@
 
 #include <linux/device.h>
 #include <linux/fb.h>
+#include <linux/io.h>
 #include <linux/kernel.h>
 #include <linux/lcd.h>
 #include <linux/module.h>
-- 
2.46.0


