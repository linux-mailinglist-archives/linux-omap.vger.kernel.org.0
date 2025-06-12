Return-Path: <linux-omap+bounces-3843-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1925BAD6A86
	for <lists+linux-omap@lfdr.de>; Thu, 12 Jun 2025 10:22:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 34FAB166742
	for <lists+linux-omap@lfdr.de>; Thu, 12 Jun 2025 08:22:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4DE8C2147EA;
	Thu, 12 Jun 2025 08:22:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="o0t8Jr4Y";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Zcb5eQ53";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="o0t8Jr4Y";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Zcb5eQ53"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62E1C218593
	for <linux-omap@vger.kernel.org>; Thu, 12 Jun 2025 08:22:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749716527; cv=none; b=s3EITEwJMdrmDsveD1N54TRDqk+/bnRsVuggkGNmp3xrgH7C2CJLGvevvAQX2u37HysrCHLDs635+24EPH7Mu5smssj0KY4mDkWf9mmPRkoY6LHoEjDDiqiDQMjCjjqxx6d59pH28UP+SdY6h3a3XLq1DxHP5D++VLvmHwyesqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749716527; c=relaxed/simple;
	bh=yan4UjctUjQOBR9LYhj20RO4TsCKHSxIa2QcqHtgBzc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SiGSrYlkAzM+MtW0GWLMucrXxSTteXQpLwcYNgASabd6YjJo24Sk1685fCOXwWxhbzi/h+K4IX9XjVzcwI7NCN/XqzZcvN5D9p6qgjtAR7l0zNETBuOjSzPldS2OycqnXbjDA0i9MW0OXd1mHUOqvOn/o9mIwvIiuMy+YEZykkY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=o0t8Jr4Y; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Zcb5eQ53; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=o0t8Jr4Y; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Zcb5eQ53; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 8E6AC1F84A;
	Thu, 12 Jun 2025 08:21:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1749716488; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=G3FyHIoikmcz/gU+8T29N/Q9anRoC0fTRgVb+97m9RA=;
	b=o0t8Jr4YgLD3HoipyEKmfELq+7ylqu46Ex0aZWOCu9HcVgH53AYrxIonLXhg7y7JE4ubuJ
	CgvtGX+TePQ9Okgfo6YXySA+zn4UcoH2ib/aWGPDOAKMWx5At13RwnzaecmhMY3GoGbX0d
	Q8DVtGOYFJJXYASGTdn/NkILHX6kIpU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1749716488;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=G3FyHIoikmcz/gU+8T29N/Q9anRoC0fTRgVb+97m9RA=;
	b=Zcb5eQ53Nb3CvOd8G90WZpPJTiSWB46y5XU9R8epFhGtIGfR+f8XrYGZ+Q7xDxjv8nSS2X
	kH5ht8pC90I+y/Bw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1749716488; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=G3FyHIoikmcz/gU+8T29N/Q9anRoC0fTRgVb+97m9RA=;
	b=o0t8Jr4YgLD3HoipyEKmfELq+7ylqu46Ex0aZWOCu9HcVgH53AYrxIonLXhg7y7JE4ubuJ
	CgvtGX+TePQ9Okgfo6YXySA+zn4UcoH2ib/aWGPDOAKMWx5At13RwnzaecmhMY3GoGbX0d
	Q8DVtGOYFJJXYASGTdn/NkILHX6kIpU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1749716488;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=G3FyHIoikmcz/gU+8T29N/Q9anRoC0fTRgVb+97m9RA=;
	b=Zcb5eQ53Nb3CvOd8G90WZpPJTiSWB46y5XU9R8epFhGtIGfR+f8XrYGZ+Q7xDxjv8nSS2X
	kH5ht8pC90I+y/Bw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 38F3313A6D;
	Thu, 12 Jun 2025 08:21:28 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 0M2RDAiOSmgILAAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Thu, 12 Jun 2025 08:21:28 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: deller@gmx.de,
	soci@c64.rulez.org,
	simona@ffwll.ch,
	linux@armlinux.org.uk,
	FlorianSchandinat@gmx.de,
	alchark@gmail.com,
	krzk@kernel.org
Cc: linux-fbdev@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-omap@vger.kernel.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v2 09/14] fbdev/omap2: Do not include <linux/export.h>
Date: Thu, 12 Jun 2025 10:16:32 +0200
Message-ID: <20250612081738.197826-10-tzimmermann@suse.de>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250612081738.197826-1-tzimmermann@suse.de>
References: <20250612081738.197826-1-tzimmermann@suse.de>
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
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid,suse.de:email];
	FREEMAIL_TO(0.00)[gmx.de,c64.rulez.org,ffwll.ch,armlinux.org.uk,gmail.com,kernel.org];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	R_RATELIMIT(0.00)[to_ip_from(RLeer19tzumyaughgdh7h6uhe9)];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FREEMAIL_ENVRCPT(0.00)[gmail.com,gmx.de]
X-Spam-Level: 

Fix the compile-time warnings

  drivers/video/fbdev/omap2/omapfb/dss/dpi.c: warning: EXPORT_SYMBOL() is not used, but #include <linux/export.h> is present
  drivers/video/fbdev/omap2/omapfb/dss/sdi.c: warning: EXPORT_SYMBOL() is not used, but #include <linux/export.h> is present
  drivers/video/fbdev/omap2/omapfb/omapfb-ioctl.c: warning: EXPORT_SYMBOL() is not used, but #include <linux/export.h> is present

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/video/fbdev/omap2/omapfb/dss/dpi.c      | 1 -
 drivers/video/fbdev/omap2/omapfb/dss/sdi.c      | 1 -
 drivers/video/fbdev/omap2/omapfb/omapfb-ioctl.c | 1 -
 3 files changed, 3 deletions(-)

diff --git a/drivers/video/fbdev/omap2/omapfb/dss/dpi.c b/drivers/video/fbdev/omap2/omapfb/dss/dpi.c
index 86ed4c077c30..ad8ae1727966 100644
--- a/drivers/video/fbdev/omap2/omapfb/dss/dpi.c
+++ b/drivers/video/fbdev/omap2/omapfb/dss/dpi.c
@@ -13,7 +13,6 @@
 
 #include <linux/kernel.h>
 #include <linux/delay.h>
-#include <linux/export.h>
 #include <linux/err.h>
 #include <linux/errno.h>
 #include <linux/platform_device.h>
diff --git a/drivers/video/fbdev/omap2/omapfb/dss/sdi.c b/drivers/video/fbdev/omap2/omapfb/dss/sdi.c
index 2d3e5d4467c5..68e569ec0f83 100644
--- a/drivers/video/fbdev/omap2/omapfb/dss/sdi.c
+++ b/drivers/video/fbdev/omap2/omapfb/dss/sdi.c
@@ -12,7 +12,6 @@
 #include <linux/delay.h>
 #include <linux/err.h>
 #include <linux/regulator/consumer.h>
-#include <linux/export.h>
 #include <linux/platform_device.h>
 #include <linux/string.h>
 #include <linux/of.h>
diff --git a/drivers/video/fbdev/omap2/omapfb/omapfb-ioctl.c b/drivers/video/fbdev/omap2/omapfb/omapfb-ioctl.c
index ea8c88aa4477..152dbeaa6451 100644
--- a/drivers/video/fbdev/omap2/omapfb/omapfb-ioctl.c
+++ b/drivers/video/fbdev/omap2/omapfb/omapfb-ioctl.c
@@ -16,7 +16,6 @@
 #include <linux/mm.h>
 #include <linux/omapfb.h>
 #include <linux/vmalloc.h>
-#include <linux/export.h>
 #include <linux/sizes.h>
 
 #include <video/omapfb_dss.h>
-- 
2.49.0


