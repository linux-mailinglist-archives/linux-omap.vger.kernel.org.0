Return-Path: <linux-omap+bounces-3833-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B756AD6A73
	for <lists+linux-omap@lfdr.de>; Thu, 12 Jun 2025 10:22:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 600B51BC2432
	for <lists+linux-omap@lfdr.de>; Thu, 12 Jun 2025 08:22:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6AD361A23B6;
	Thu, 12 Jun 2025 08:21:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="EwsimSqV";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="QgeKHOak";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="EwsimSqV";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="QgeKHOak"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 244B920C031
	for <linux-omap@vger.kernel.org>; Thu, 12 Jun 2025 08:21:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749716489; cv=none; b=FfjBjStnbexqK4oKA8JHDOYLPr+id/tY2PvewE3kMjJ+o/ixEoQk8f4kszWauiAsRLHJIjpvyP89laZAP8auReHhAHM5jSkT+Kl39tJVs7ttuQyeNGdQoX+ZsOY/+n+2ESxiEx0lzVfbssEPhX2pM3mNrmb3CDTwdG2KmMEMvsE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749716489; c=relaxed/simple;
	bh=HhMWkZgeUU6ximox08pHEHKNF2/4cYro4ilTc6eE55o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=No0LNLCXuYh+Rc524kutTFIQUMuBrKvozPv/uKc1QNkupLpmX8b9/jkp9EyMDvy3sV88P1WqAjx6aKJTt3eevuPeMDnYJ5Nedjp1KA8LAwXkXCgAGViIaToO2E1p10Xofa2O0gDwR3y3VHugZS6g2S4MV0ZV+3wPdpGscllSNUg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=EwsimSqV; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=QgeKHOak; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=EwsimSqV; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=QgeKHOak; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 2C749218C8;
	Thu, 12 Jun 2025 08:21:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1749716485; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=fCzFfffWtIgd7GHztd47USg1t8uP8FHiNx37CO14Y2I=;
	b=EwsimSqVJs5oTS3/ydvhs8gd2ycUWQmnurw0+Dr6sXHq2V9ZLCm/BezZPZw68Rz8C1B8mj
	+Xus4zbxWGQ1ypDfo3NGdJPXYyidwrGap8teYX6GF3obHt4gTNfmtVMd+Q1UQdPwvxVCsq
	04jUMDz/H1nfBaK+BCjWoAkO7hEviVs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1749716485;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=fCzFfffWtIgd7GHztd47USg1t8uP8FHiNx37CO14Y2I=;
	b=QgeKHOakgujO9GnmtIogAyf8jzAVy+O/8OG038t3Ox5PthzU8bPVp548V/GcpM46doRbQW
	aLPgjea8hQ0cVuCQ==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=EwsimSqV;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=QgeKHOak
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1749716485; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=fCzFfffWtIgd7GHztd47USg1t8uP8FHiNx37CO14Y2I=;
	b=EwsimSqVJs5oTS3/ydvhs8gd2ycUWQmnurw0+Dr6sXHq2V9ZLCm/BezZPZw68Rz8C1B8mj
	+Xus4zbxWGQ1ypDfo3NGdJPXYyidwrGap8teYX6GF3obHt4gTNfmtVMd+Q1UQdPwvxVCsq
	04jUMDz/H1nfBaK+BCjWoAkO7hEviVs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1749716485;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=fCzFfffWtIgd7GHztd47USg1t8uP8FHiNx37CO14Y2I=;
	b=QgeKHOakgujO9GnmtIogAyf8jzAVy+O/8OG038t3Ox5PthzU8bPVp548V/GcpM46doRbQW
	aLPgjea8hQ0cVuCQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id CB80E132D8;
	Thu, 12 Jun 2025 08:21:24 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id qgZKMASOSmgILAAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Thu, 12 Jun 2025 08:21:24 +0000
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
Subject: [PATCH v2 00/14] fbdev: Fix warnings related to including <linux/export.h>
Date: Thu, 12 Jun 2025 10:16:23 +0200
Message-ID: <20250612081738.197826-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FREEMAIL_TO(0.00)[gmx.de,c64.rulez.org,ffwll.ch,armlinux.org.uk,gmail.com,kernel.org];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RCPT_COUNT_TWELVE(0.00)[12];
	ARC_NA(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:dkim,suse.de:mid];
	FROM_EQ_ENVFROM(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com,gmx.de]
X-Spam-Level: 
X-Spam-Flag: NO
X-Rspamd-Queue-Id: 2C749218C8
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Score: -3.01

Some source files in fbdev do not include <linux/export.h> properly;
others do when they don't have to. The build scripts warn about these
cases.

Clean up to fix the related warnings. While at it, also fix trailing
whitespaces in the affected files.

v2:
- remove unused functions (Helge)

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
 drivers/video/fbdev/cyber2000fb.c             | 36 -----------
 drivers/video/fbdev/cyber2000fb.h             |  2 -
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
 drivers/video/fbdev/pxafb.c                   | 17 +----
 drivers/video/fbdev/sbuslib.c                 |  1 +
 drivers/video/fbdev/sis/sis.h                 |  2 -
 drivers/video/fbdev/sis/sis_main.c            | 25 --------
 drivers/video/fbdev/via/via-core.c            |  1 +
 drivers/video/fbdev/via/via-gpio.c            |  1 -
 drivers/video/fbdev/via/via_i2c.c             |  1 +
 drivers/video/fbdev/wmt_ge_rops.c             |  1 +
 include/linux/platform_data/video-pxafb.h     |  1 -
 include/video/sisfb.h                         |  6 --
 55 files changed, 134 insertions(+), 168 deletions(-)

-- 
2.49.0


