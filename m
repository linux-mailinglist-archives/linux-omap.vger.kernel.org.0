Return-Path: <linux-omap+bounces-1942-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 57DC8958290
	for <lists+linux-omap@lfdr.de>; Tue, 20 Aug 2024 11:36:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 141412830A9
	for <lists+linux-omap@lfdr.de>; Tue, 20 Aug 2024 09:36:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72CEF18C909;
	Tue, 20 Aug 2024 09:35:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ynlRHsHN";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="WTWXPg/O";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ynlRHsHN";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="WTWXPg/O"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9577518C903;
	Tue, 20 Aug 2024 09:35:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724146508; cv=none; b=WpAUc6b3ab/O647rywFqaejfw9+wYu6EjAH5L+5/axlMYzIChvPc6aJNWNpPCYJJ0rl9FMBz9jBZkvgVnrSyLLvvCZ5uSWCCaeBpTSowV71XmJxhcNNkwSGTYDh+8toI+Ftx/GBe0ytsVjlYTAsapEIHJ669xDNdWnY/lqSvDj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724146508; c=relaxed/simple;
	bh=cCL6aw27bRYYv+cSuFS2d/QuzdT5Ik+AYktCg9+qS1s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mLq+gCAewrRxHMgMpQ1c0kaYGgupy+S749LAwih+O5YBzDzR/yd552S91puNi+SdHH0SDut0GX36dDhVL6G0KFANFLuIKzBM0kg/odfldAiup0TzALnGA7QFzkP0vN2JHMlseSbhCMVXC/UPZPl5TlUFa905I/nkocqTs62Ds7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ynlRHsHN; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=WTWXPg/O; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ynlRHsHN; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=WTWXPg/O; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id BD78F1FFCE;
	Tue, 20 Aug 2024 09:35:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1724146504; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ylXcg7hQpl9B7BPpMQT1PSLnP6o/skM5SNbFc5bA958=;
	b=ynlRHsHN0HPD9UMGIyWdgUkqxCa+Qxx+UeYjpMj8TO+iKlW+GcPgtd1KJpkyVAgjNJ533+
	JR8ad0mffWFGfI0z/xkDdrtepdi4rDULbfHawB2LVNtp633UkHGmLfcz9uM6o4TWpPRI6P
	dwXBnO5l7GyHGCkWNoie5zfbYYNwr/8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1724146504;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ylXcg7hQpl9B7BPpMQT1PSLnP6o/skM5SNbFc5bA958=;
	b=WTWXPg/O7K/DMbyagfhGLckqXX+HfEcvvVyqiLbOORg5MLb+Y0ce7+nN+uh5EHZDJ4SVyY
	PUf8sY7UmHIhU0Dg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1724146504; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ylXcg7hQpl9B7BPpMQT1PSLnP6o/skM5SNbFc5bA958=;
	b=ynlRHsHN0HPD9UMGIyWdgUkqxCa+Qxx+UeYjpMj8TO+iKlW+GcPgtd1KJpkyVAgjNJ533+
	JR8ad0mffWFGfI0z/xkDdrtepdi4rDULbfHawB2LVNtp633UkHGmLfcz9uM6o4TWpPRI6P
	dwXBnO5l7GyHGCkWNoie5zfbYYNwr/8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1724146504;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ylXcg7hQpl9B7BPpMQT1PSLnP6o/skM5SNbFc5bA958=;
	b=WTWXPg/O7K/DMbyagfhGLckqXX+HfEcvvVyqiLbOORg5MLb+Y0ce7+nN+uh5EHZDJ4SVyY
	PUf8sY7UmHIhU0Dg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 5600A13770;
	Tue, 20 Aug 2024 09:35:04 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id SNPLE0hjxGa3RAAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Tue, 20 Aug 2024 09:35:04 +0000
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
Subject: [PATCH 12/28] backlight: lms501kf03: Remove unnecessary include of <linux/backlight.h>
Date: Tue, 20 Aug 2024 11:22:50 +0200
Message-ID: <20240820093452.68270-13-tzimmermann@suse.de>
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
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid,suse.de:email];
	FREEMAIL_TO(0.00)[kernel.org,linaro.org,gmail.com,gmx.de,linux-vserver.org,mail.ru,pengutronix.de];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	R_RATELIMIT(0.00)[to_ip_from(RL7eb4yoy35resap1sns3bbybe)];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FREEMAIL_ENVRCPT(0.00)[gmail.com,gmx.de,mail.ru]
X-Spam-Flag: NO
X-Spam-Level: 

This lcd driver is independent from the backlight code.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/video/backlight/lms501kf03.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/video/backlight/lms501kf03.c b/drivers/video/backlight/lms501kf03.c
index 8aebe0af3391..e051e6b6036e 100644
--- a/drivers/video/backlight/lms501kf03.c
+++ b/drivers/video/backlight/lms501kf03.c
@@ -6,7 +6,6 @@
  * Author: Jingoo Han  <jg1.han@samsung.com>
  */
 
-#include <linux/backlight.h>
 #include <linux/delay.h>
 #include <linux/fb.h>
 #include <linux/lcd.h>
-- 
2.46.0


