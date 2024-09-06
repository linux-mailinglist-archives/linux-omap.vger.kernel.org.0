Return-Path: <linux-omap+bounces-2147-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D13696ECF1
	for <lists+linux-omap@lfdr.de>; Fri,  6 Sep 2024 09:55:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C91E41C232E0
	for <lists+linux-omap@lfdr.de>; Fri,  6 Sep 2024 07:55:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9346C15747D;
	Fri,  6 Sep 2024 07:55:01 +0000 (UTC)
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEEB7157A59;
	Fri,  6 Sep 2024 07:54:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725609301; cv=none; b=hRBZIaWCwFokaQLWk3PS1ImM2LfaKoox0mbYLHlowHy5eSw/A8/QX8v7EFe5SUVe5zwDFQYRNfrc9yFjC+jc5KpZb9cuGLbACQZTQuZ+MuTmwJcCHzeNaL3gcVReEwXO/qak0r3UpUyWG1oD4Z8va95ZkCTGKV4Bq1DVtq9iRdI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725609301; c=relaxed/simple;
	bh=Qgm5dGgpTUy7HM4Jy6jRrolCk58zdz25SqgoIn5fQKg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=infh+pc6bmOYfeYy8hLRb7/XK3n5MhYLYW8L7DN9XyxwEg/tipbE62/4zJx9OYbwZpBGL00YKUPyIvFQ/bHJptoSZWaWpxKunrTF2OJFIrEVKBEdDoNFti6Jm0+dbCJojZS8Bo7GKiJQj20sACeXOjpBICTe0wtB3idQQgDqWow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 5994F1F8A6;
	Fri,  6 Sep 2024 07:54:57 +0000 (UTC)
Authentication-Results: smtp-out2.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id EC85113A7A;
	Fri,  6 Sep 2024 07:54:56 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id UEh6OFC12mbGPAAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Fri, 06 Sep 2024 07:54:56 +0000
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
Subject: [PATCH v2 28/28] backlight: lcd: Do not include <linux/fb.h> in lcd header
Date: Fri,  6 Sep 2024 09:52:42 +0200
Message-ID: <20240906075439.98476-29-tzimmermann@suse.de>
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
X-Spamd-Result: default: False [-4.00 / 50.00];
	REPLY(-4.00)[]
X-Spam-Flag: NO
X-Spam-Score: -4.00
X-Rspamd-Queue-Id: 5994F1F8A6
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Level: 

With the exception of fb_notifier_callback(), none of the lcd code
uses fbdev; especially not the lcd drivers. Remove the include
statement for <linux/fb.h> from the public lcd header.

v2:
- fix typos in commit description

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>
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


