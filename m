Return-Path: <linux-omap+bounces-2130-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 67CE996ECCC
	for <lists+linux-omap@lfdr.de>; Fri,  6 Sep 2024 09:55:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1AF8C1F2810A
	for <lists+linux-omap@lfdr.de>; Fri,  6 Sep 2024 07:55:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1B8C156863;
	Fri,  6 Sep 2024 07:54:49 +0000 (UTC)
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1070615278E;
	Fri,  6 Sep 2024 07:54:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725609289; cv=none; b=oznPA4OQrg5Sb/iUre9OxKfTGlezscQjOSmH6I3uVwoiR2V2hgvho727rsHwONJLIj/mzEXwKCXAvSzzm6OnvAjJ3U39Cq5yh4Dnykralq3kFq35UioPjYf1BIhZ/MXVreSJHbb3Mm1jjO6THm3i91KkX3Pz+mThGLcc6h4cRdc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725609289; c=relaxed/simple;
	bh=ouOqBX4vOqq0bQ0kDVumOKbNNZatyVRoTrDsIonZFto=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=d4IaPnitr2xy4hXKxw4/5VgRM3c10MBDHzbv5R64zfwLraqLIeLBOoAvbG1OFUjX8hb14Nsh99iHqc5KFbVwtA9CLAnFqI9sujgA9Nh8Wa2ReaXirJ37gOge+yhk1SOOKLXxIQ+xohfCbC8fNh9Su5gGrLgzt8xjWpKTC9ab5Uc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 715F221AC3;
	Fri,  6 Sep 2024 07:54:46 +0000 (UTC)
Authentication-Results: smtp-out1.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 1315113A7A;
	Fri,  6 Sep 2024 07:54:46 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id QCBWA0a12mbGPAAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Fri, 06 Sep 2024 07:54:46 +0000
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
Subject: [PATCH v2 11/28] backlight: lms283gf05: Use lcd power constants
Date: Fri,  6 Sep 2024 09:52:25 +0200
Message-ID: <20240906075439.98476-12-tzimmermann@suse.de>
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
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Spam-Level: 
X-Spamd-Result: default: False [-4.00 / 50.00];
	REPLY(-4.00)[]
X-Spam-Score: -4.00
X-Spam-Flag: NO
X-Rspamd-Queue-Id: 715F221AC3
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org

Replace FB_BLANK_ constants with their counterparts from the
lcd subsystem. The values are identical, so there's no change
in functionality.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>
---
 drivers/video/backlight/lms283gf05.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/video/backlight/lms283gf05.c b/drivers/video/backlight/lms283gf05.c
index a65490e83d3d..c8b7eeeb333e 100644
--- a/drivers/video/backlight/lms283gf05.c
+++ b/drivers/video/backlight/lms283gf05.c
@@ -126,7 +126,7 @@ static int lms283gf05_power_set(struct lcd_device *ld, int power)
 	struct lms283gf05_state *st = lcd_get_data(ld);
 	struct spi_device *spi = st->spi;
 
-	if (power <= FB_BLANK_NORMAL) {
+	if (power <= LCD_POWER_REDUCED) {
 		if (st->reset)
 			lms283gf05_reset(st->reset);
 		lms283gf05_toggle(spi, disp_initseq, ARRAY_SIZE(disp_initseq));
-- 
2.46.0


