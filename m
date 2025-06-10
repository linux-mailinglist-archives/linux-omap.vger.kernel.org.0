Return-Path: <linux-omap+bounces-3789-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FFA9AD3457
	for <lists+linux-omap@lfdr.de>; Tue, 10 Jun 2025 13:03:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1B217162E55
	for <lists+linux-omap@lfdr.de>; Tue, 10 Jun 2025 11:03:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EDFBA28DF0A;
	Tue, 10 Jun 2025 11:03:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="dNxzJShp";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="/4ndFyI7";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="dNxzJShp";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="/4ndFyI7"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81D7828C004
	for <linux-omap@vger.kernel.org>; Tue, 10 Jun 2025 11:03:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749553412; cv=none; b=M6CqMIfrDfyEOsmyfsK8KE/SwFfm1VeLMKlbxpD2HIRkY2epNi4Nv5EcDIrFZXFS2z3jlirUeGblu+ti60sssN4U4dK7k9xUI83Oh2ltNYz6QlQFLw1RQxlRH12J6dtJZWeuHLM77HwUBhgRdidJ7uzHmusEK2v6gIw617/RDno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749553412; c=relaxed/simple;
	bh=6Q4xBezM2TQDsVWWki+9hlTZO/nio/0J1uPNA4T+1p0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FBX78oOqsRN1Z54oxO5p0zl2TUJHcjA5bPCS5kZVU0aVpiARvmcrqzqLWXUVzsE2rypx/xnTnBoLE9DTC5HLez7uiO+BjiFLBxErk3STGg+81Zx0CImF9yx51pyAki2bzycQ+3JqS5U7Ivm8FCIjsjnsgJCD7UVASP6XB/D9Zt4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=dNxzJShp; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=/4ndFyI7; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=dNxzJShp; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=/4ndFyI7; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 2E99D1F848;
	Tue, 10 Jun 2025 11:03:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1749553403; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=JBBa1CNqwIJKfOnOIWpEbn0xaM85120pWePKC5roVMI=;
	b=dNxzJShpIEYWmLE4CdcGR2HSN5SZ9moOGdQtUCo8isxyeaqAr3ebOkV66v8SyR+V/uxvPO
	7jAxqVqlV4fycMH3kc0PQIoxoONPlsoUVymdlfpInkrWHsEI8k2WkjqcsCDxFN7dnIApCP
	rucaLILT5BhQaHk18B+VA2YFX4ZSHNw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1749553403;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=JBBa1CNqwIJKfOnOIWpEbn0xaM85120pWePKC5roVMI=;
	b=/4ndFyI78v71NKYLyklrybB6ZG0OmkxJHyI1SadiM7OmzOQjqRQX3oqlNbbQ3fKun3EkOo
	sZcWLG6SfKASmyCA==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=dNxzJShp;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="/4ndFyI7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1749553403; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=JBBa1CNqwIJKfOnOIWpEbn0xaM85120pWePKC5roVMI=;
	b=dNxzJShpIEYWmLE4CdcGR2HSN5SZ9moOGdQtUCo8isxyeaqAr3ebOkV66v8SyR+V/uxvPO
	7jAxqVqlV4fycMH3kc0PQIoxoONPlsoUVymdlfpInkrWHsEI8k2WkjqcsCDxFN7dnIApCP
	rucaLILT5BhQaHk18B+VA2YFX4ZSHNw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1749553403;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=JBBa1CNqwIJKfOnOIWpEbn0xaM85120pWePKC5roVMI=;
	b=/4ndFyI78v71NKYLyklrybB6ZG0OmkxJHyI1SadiM7OmzOQjqRQX3oqlNbbQ3fKun3EkOo
	sZcWLG6SfKASmyCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id CA8CA13964;
	Tue, 10 Jun 2025 11:03:22 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id AA8pL/oQSGgOTAAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Tue, 10 Jun 2025 11:03:22 +0000
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
Subject: [PATCH 00/14] fbdev: Fix warnings related to including <linux/export.h>
Date: Tue, 10 Jun 2025 12:56:33 +0200
Message-ID: <20250610105948.384540-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 2E99D1F848
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FREEMAIL_TO(0.00)[gmx.de,c64.rulez.org,ffwll.ch,intworks.biz,armlinux.org.uk,gmail.com,kernel.org];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	ARC_NA(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
	FROM_EQ_ENVFROM(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com,gmx.de]
X-Spam-Score: -3.01
X-Spam-Level: 

Some source files in fbdev do not include <linux/export.h> properly;
others do when they don't have to. The build scripts warn about these
cases.

Clean up to fix the related warnings. While at it, also fix trailing
whitespaces in the affected files.

Thomas Zimmermann (14):
  fbdev: Remove trailing whitespaces
  fbdev: Include <linux/export.h>
  fbdev/c2p: Include <linux/export.h>
  fbdev/cyber2000fb: Unexport symbols
  fbdev/matroxfb: Remove trailing whitespaces
  fbdev/matroxfb: Include <linux/export.h>
  fbdev/omap: Include <linux/export.h>
  fbdev/omap2: Include <linux/export.h>
  fbdev/omap2: Do not include <linux/export.h>
  fbdev/mb862xx: Do not include <linux/export.h>
  fbdev/pxafb: Unexport symbol
  fbdev/sisfb: Unexport symbols
  fbdev/viafb: Include <linux/export.h>
  fbdev/viafb: Do not include <linux/export.h>

 drivers/video/fbdev/c2p_iplan2.c              |  1 +
 drivers/video/fbdev/c2p_planar.c              |  1 +
 drivers/video/fbdev/core/cfbcopyarea.c        |  2 +
 drivers/video/fbdev/core/cfbfillrect.c        |  2 +
 drivers/video/fbdev/core/cfbimgblt.c          |  2 +
 drivers/video/fbdev/core/fb_ddc.c             |  1 +
 drivers/video/fbdev/core/fb_defio.c           |  1 +
 drivers/video/fbdev/core/fb_io_fops.c         |  1 +
 drivers/video/fbdev/core/fb_sys_fops.c        |  2 +
 drivers/video/fbdev/core/fbcmap.c             |  1 +
 drivers/video/fbdev/core/fbcon.c              |  1 +
 drivers/video/fbdev/core/fbmon.c              |  2 +
 drivers/video/fbdev/core/modedb.c             |  1 +
 drivers/video/fbdev/core/svgalib.c            |  1 +
 drivers/video/fbdev/core/syscopyarea.c        |  2 +
 drivers/video/fbdev/core/sysfillrect.c        |  2 +
 drivers/video/fbdev/core/sysimgblt.c          |  2 +
 drivers/video/fbdev/cyber2000fb.c             |  4 --
 drivers/video/fbdev/macmodes.c                |  3 +-
 drivers/video/fbdev/matrox/g450_pll.c         | 26 ++++----
 drivers/video/fbdev/matrox/matroxfb_DAC1064.c | 47 +++++++-------
 drivers/video/fbdev/matrox/matroxfb_Ti3026.c  |  1 +
 drivers/video/fbdev/matrox/matroxfb_accel.c   |  2 +
 drivers/video/fbdev/matrox/matroxfb_base.c    |  1 +
 drivers/video/fbdev/matrox/matroxfb_g450.c    | 62 ++++++++++---------
 drivers/video/fbdev/matrox/matroxfb_misc.c    | 21 ++++---
 drivers/video/fbdev/mb862xx/mb862xx-i2c.c     |  1 -
 drivers/video/fbdev/omap/lcd_dma.c            |  1 +
 drivers/video/fbdev/omap/lcdc.c               |  2 +
 drivers/video/fbdev/omap/omapfb_main.c        |  2 +
 drivers/video/fbdev/omap2/omapfb/dss/apply.c  |  1 +
 drivers/video/fbdev/omap2/omapfb/dss/core.c   |  1 +
 .../fbdev/omap2/omapfb/dss/dispc-compat.c     |  1 +
 .../video/fbdev/omap2/omapfb/dss/display.c    |  1 +
 drivers/video/fbdev/omap2/omapfb/dss/dpi.c    |  1 -
 drivers/video/fbdev/omap2/omapfb/dss/dss-of.c |  1 +
 .../fbdev/omap2/omapfb/dss/dss_features.c     |  1 +
 .../video/fbdev/omap2/omapfb/dss/manager.c    |  1 +
 drivers/video/fbdev/omap2/omapfb/dss/output.c |  1 +
 .../video/fbdev/omap2/omapfb/dss/overlay.c    |  1 +
 drivers/video/fbdev/omap2/omapfb/dss/sdi.c    |  1 -
 drivers/video/fbdev/omap2/omapfb/dss/venc.c   |  1 +
 .../video/fbdev/omap2/omapfb/omapfb-ioctl.c   |  1 -
 drivers/video/fbdev/omap2/omapfb/vrfb.c       |  1 +
 drivers/video/fbdev/pxafb.c                   |  1 -
 drivers/video/fbdev/sbuslib.c                 |  1 +
 drivers/video/fbdev/sis/sis_main.c            |  9 ---
 drivers/video/fbdev/via/via-core.c            |  1 +
 drivers/video/fbdev/via/via-gpio.c            |  1 -
 drivers/video/fbdev/via/via_i2c.c             |  1 +
 drivers/video/fbdev/wmt_ge_rops.c             |  1 +
 51 files changed, 132 insertions(+), 95 deletions(-)

-- 
2.49.0


