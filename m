Return-Path: <linux-omap+bounces-1939-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D77D995828C
	for <lists+linux-omap@lfdr.de>; Tue, 20 Aug 2024 11:36:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 94B3628204D
	for <lists+linux-omap@lfdr.de>; Tue, 20 Aug 2024 09:35:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F5DB18CBFE;
	Tue, 20 Aug 2024 09:35:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="1ohjI5pi";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="lRGDdloL";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="1ohjI5pi";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="lRGDdloL"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBD0E18C324;
	Tue, 20 Aug 2024 09:35:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724146507; cv=none; b=sIFLXoMkkKkCdcVdelDCOVUAuK6LI+cw27TMtdfPtmd/Xgo0uIGoFZ84NqUSiTloi9dsO/876XODWpdssNNaVJLer8eGpntVP9FBqv+jt0VkJupxOH7vntiDm0hsx2JGeAGd1ctu8DCSwjX4Sj1vnL7y9KBuxSvvbHfBg42Ahqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724146507; c=relaxed/simple;
	bh=yh4aVLCRXBVEwAKEww3sQVXtItNOblCjVBhWK1cXGSg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qaDdaP0hgigRiqqtXlkCrPuHATeMPR+enBI4I5syEDncVQmKw8IhLUGiuPHPV616FrdUEa6WuqTZjWVzFHWC39r03SU9du4EpUUZmBAFW7Q0/8qqpvZCRLw+bhCOVT27KL2NrqD1DHyCIQdb5ISto1ec65DwcGrGRlLlVWAklk4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=1ohjI5pi; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=lRGDdloL; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=1ohjI5pi; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=lRGDdloL; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 1C915225A0;
	Tue, 20 Aug 2024 09:35:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1724146503; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9VBuhFWDmP89amXM5eVckHRfabPXS0JZBp6E7kbYxIw=;
	b=1ohjI5piOBDtuKQvJLBkhYrpP4S2XY6H0VxmS8Owpx0sO3KmozavL5CflWMWB/dCcr80IU
	0miFQrvOMYfvL4T93PvqMaDvxGgyqx2t8d4VRuUfaDD1Z8Lex4+A9zif2iOFgSK39CvVQT
	Xjwsno4t9OuCgetulJz77hwtT7envtU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1724146503;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9VBuhFWDmP89amXM5eVckHRfabPXS0JZBp6E7kbYxIw=;
	b=lRGDdloL5LfjeNbVAxOKNojd9gAli/IOTQotlwTA6YN7CiJANMgfecm4v4/R5huKkm1Z6c
	fEVfP+GKGQKOu5BQ==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=1ohjI5pi;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=lRGDdloL
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1724146503; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9VBuhFWDmP89amXM5eVckHRfabPXS0JZBp6E7kbYxIw=;
	b=1ohjI5piOBDtuKQvJLBkhYrpP4S2XY6H0VxmS8Owpx0sO3KmozavL5CflWMWB/dCcr80IU
	0miFQrvOMYfvL4T93PvqMaDvxGgyqx2t8d4VRuUfaDD1Z8Lex4+A9zif2iOFgSK39CvVQT
	Xjwsno4t9OuCgetulJz77hwtT7envtU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1724146503;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9VBuhFWDmP89amXM5eVckHRfabPXS0JZBp6E7kbYxIw=;
	b=lRGDdloL5LfjeNbVAxOKNojd9gAli/IOTQotlwTA6YN7CiJANMgfecm4v4/R5huKkm1Z6c
	fEVfP+GKGQKOu5BQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A45D313770;
	Tue, 20 Aug 2024 09:35:02 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id ONvjJkZjxGa3RAAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Tue, 20 Aug 2024 09:35:02 +0000
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
Subject: [PATCH 08/28] backlight: jornada720_lcd: Include <linux/io.h> for IOMEM() macro
Date: Tue, 20 Aug 2024 11:22:46 +0200
Message-ID: <20240820093452.68270-9-tzimmermann@suse.de>
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
X-Rspamd-Queue-Id: 1C915225A0
X-Spam-Score: -3.01
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	FREEMAIL_TO(0.00)[kernel.org,linaro.org,gmail.com,gmx.de,linux-vserver.org,mail.ru,pengutronix.de];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCPT_COUNT_TWELVE(0.00)[16];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:dkim,suse.de:mid,suse.de:email];
	FROM_EQ_ENVFROM(0.00)[];
	R_RATELIMIT(0.00)[to_ip_from(RLk469idygq4891mojaqehp6ty)];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	TO_DN_SOME(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com,gmx.de,mail.ru]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO
X-Spam-Level: 

Avoids the proxy include via <linux/fb.h>.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
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


