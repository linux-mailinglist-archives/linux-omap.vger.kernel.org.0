Return-Path: <linux-omap+bounces-3802-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E5E08AD347F
	for <lists+linux-omap@lfdr.de>; Tue, 10 Jun 2025 13:04:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 32CE03A412A
	for <lists+linux-omap@lfdr.de>; Tue, 10 Jun 2025 11:04:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B784028DF2F;
	Tue, 10 Jun 2025 11:04:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="PdOg65E2";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Bf3OmkPm";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="PdOg65E2";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Bf3OmkPm"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFF0628DF28
	for <linux-omap@vger.kernel.org>; Tue, 10 Jun 2025 11:04:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749553451; cv=none; b=lntV4JQY9T8/8p+ie4PMo8C71XFJ7287IOWgo3X0UnFlu7E3RZZtkMIlYCPoD6gCKkqpJfk2I0LYhUxa5SbjQ/goL/QBDEhENzBMUgvM0vZL+ftwzowCVBdoES6TZ/EaUS6IJ5UMCXbdTAx4OGTZWka6Om1zjFHvKfnUNtCVxQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749553451; c=relaxed/simple;
	bh=/B91AWo+47+kFGXsv3mcdyvGCuavtkg5GNVlLffZcuM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pHZCvxFjeMMwfr04rBXq+XbDvk2PflN2ALn8qIKG8wsdpKX8hJi/SaVAYME7bSpvnIpkh7MotC54UMntlkDtWcOMj7wA6NSaBNUf57HsmCg8VVkZV8pP5GUOjU+wdXk3yd3cQrJGYI5ub16++tFDcM/G2wzsAvLg8HSYYBUx+/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=PdOg65E2; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Bf3OmkPm; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=PdOg65E2; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Bf3OmkPm; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 038ED2198C;
	Tue, 10 Jun 2025 11:03:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1749553408; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JKsMCH8vqsgb/X1UO2C5sYRtlsRUXIWG+npT2KI6GUc=;
	b=PdOg65E2MSUCuPpQn9Q9b3cdGoOKAuctHvkVjTyO7/wsQFmKP4nltRhHaBgcSHK0iDo6OS
	IoYq6XKX+9GaLb9+G5CpSlHbp/TDESBGsatt/KvBaE9+Va+FQk+R+wYFlvUyzx+VPVch+M
	ANqWFs1VUiJNUivN9W2cOUQGPZ/h0VY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1749553408;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JKsMCH8vqsgb/X1UO2C5sYRtlsRUXIWG+npT2KI6GUc=;
	b=Bf3OmkPmPa46KUe8EL8dFBbhc9VMoMshw3dOB4/+t81cIUTh3yejFHJYdHmzEThY2PwlSE
	zZNQHhrMDpKEurDw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1749553408; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JKsMCH8vqsgb/X1UO2C5sYRtlsRUXIWG+npT2KI6GUc=;
	b=PdOg65E2MSUCuPpQn9Q9b3cdGoOKAuctHvkVjTyO7/wsQFmKP4nltRhHaBgcSHK0iDo6OS
	IoYq6XKX+9GaLb9+G5CpSlHbp/TDESBGsatt/KvBaE9+Va+FQk+R+wYFlvUyzx+VPVch+M
	ANqWFs1VUiJNUivN9W2cOUQGPZ/h0VY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1749553408;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JKsMCH8vqsgb/X1UO2C5sYRtlsRUXIWG+npT2KI6GUc=;
	b=Bf3OmkPmPa46KUe8EL8dFBbhc9VMoMshw3dOB4/+t81cIUTh3yejFHJYdHmzEThY2PwlSE
	zZNQHhrMDpKEurDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 9E72613964;
	Tue, 10 Jun 2025 11:03:27 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id sI1MJf8QSGgOTAAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Tue, 10 Jun 2025 11:03:27 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: deller@gmx.de,
	soci@c64.rulez.org,
	simona@ffwll.ch,
	jayalk@intworks.biz,
	linux@armlinux.org.uk,
	FlorianSchandinat@gmx.de,
	alchark@gmail.com,
	krzk@kernel.org
Cc: linux-fbdev@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-omap@vger.kernel.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 13/14] fbdev/viafb: Include <linux/export.h>
Date: Tue, 10 Jun 2025 12:56:46 +0200
Message-ID: <20250610105948.384540-14-tzimmermann@suse.de>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250610105948.384540-1-tzimmermann@suse.de>
References: <20250610105948.384540-1-tzimmermann@suse.de>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
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
	RCPT_COUNT_TWELVE(0.00)[13];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid,suse.de:email];
	FREEMAIL_TO(0.00)[gmx.de,c64.rulez.org,ffwll.ch,intworks.biz,armlinux.org.uk,gmail.com,kernel.org];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	R_RATELIMIT(0.00)[to_ip_from(RLeer19tzumyaughgdh7h6uhe9)];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FREEMAIL_ENVRCPT(0.00)[gmail.com,gmx.de]
X-Spam-Level: 

Fix the compile-time warnings

  drivers/video/fbdev/via/via-core.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
  drivers/video/fbdev/via/via_i2c.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/video/fbdev/via/via-core.c | 1 +
 drivers/video/fbdev/via/via_i2c.c  | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/video/fbdev/via/via-core.c b/drivers/video/fbdev/via/via-core.c
index 908524a74a38..a8d4a3e2c65e 100644
--- a/drivers/video/fbdev/via/via-core.c
+++ b/drivers/video/fbdev/via/via-core.c
@@ -9,6 +9,7 @@
  * Core code for the Via multifunction framebuffer device.
  */
 #include <linux/aperture.h>
+#include <linux/export.h>
 #include <linux/via-core.h>
 #include <linux/via_i2c.h>
 #include "via-gpio.h"
diff --git a/drivers/video/fbdev/via/via_i2c.c b/drivers/video/fbdev/via/via_i2c.c
index cdbd7a9b8817..42c378425586 100644
--- a/drivers/video/fbdev/via/via_i2c.c
+++ b/drivers/video/fbdev/via/via_i2c.c
@@ -7,6 +7,7 @@
 
 #include <linux/platform_device.h>
 #include <linux/delay.h>
+#include <linux/export.h>
 #include <linux/spinlock.h>
 #include <linux/module.h>
 #include <linux/via-core.h>
-- 
2.49.0


