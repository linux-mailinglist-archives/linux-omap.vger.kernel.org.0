Return-Path: <linux-omap+bounces-1815-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EA1D9942EA0
	for <lists+linux-omap@lfdr.de>; Wed, 31 Jul 2024 14:35:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9AC9828C087
	for <lists+linux-omap@lfdr.de>; Wed, 31 Jul 2024 12:35:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9ED51B1428;
	Wed, 31 Jul 2024 12:35:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="BU59HBNI";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="dSQa3CFW";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="BU59HBNI";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="dSQa3CFW"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 846C61B012E;
	Wed, 31 Jul 2024 12:35:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722429313; cv=none; b=GbL0s9sEqcUdwpsJL6caNnhPKIXVY82do1bGriErR2c/HSYFAJg3MNv1XvCkqKBMVQ9Pu2et8raONrQx69XTKmwBRd6zUOcMV6MbEofBGTFqHqRmYq+VDnzEmq+4rvpKMNupdmNjzcgrodaBvXXZ38mNsZRXxBELFDhNnzBkArs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722429313; c=relaxed/simple;
	bh=GukjMaHqku3EIpjCO+4g2pwTjbbFdjRQTijc0JnwzxM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Jpi97aT2WZtlDoGQSysWC0Bm/x3MTTmoQSIMfUYwnqKlrWVpbK8iHAiWIDHI+jwIHJAi8NfAOkkdKDOug1FB+LQZNZW6mnI/lO49fi1rlfa6nzXBLOE90ZmgD2bo2nQM699Av1ecdmAhBcePMmc3+H+Gqd807CGo5w6l3ABBWfI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=BU59HBNI; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=dSQa3CFW; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=BU59HBNI; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=dSQa3CFW; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 94EC71F82F;
	Wed, 31 Jul 2024 12:35:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1722429305; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=9gF6UC7GyZES1sywXW1iqfz+JjY6OfayYy0kTi8bYSQ=;
	b=BU59HBNIDNXWVCguaR4/NHuA4jI/Thi7zv04Z09PhPLx0stsaKVL4vDyUfS9Y4Q5694xIf
	yG96i7fJ4F3yTnNW9m+egYTCBucpYX+m+nGGEsF/HHNhYda9KqVRt8cdreojV8EStlb7Cu
	CMGA4wwuX2ZAO+QaByK/NuFyNhyuIRc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1722429305;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=9gF6UC7GyZES1sywXW1iqfz+JjY6OfayYy0kTi8bYSQ=;
	b=dSQa3CFWWZT4kXd2ZVc+LP5emjTzF9h9g/WODYhFHgEOvOaIKyvWrAELxgtbT5GdvlKhYy
	wfNIkA7lewpNUABw==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=BU59HBNI;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=dSQa3CFW
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1722429305; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=9gF6UC7GyZES1sywXW1iqfz+JjY6OfayYy0kTi8bYSQ=;
	b=BU59HBNIDNXWVCguaR4/NHuA4jI/Thi7zv04Z09PhPLx0stsaKVL4vDyUfS9Y4Q5694xIf
	yG96i7fJ4F3yTnNW9m+egYTCBucpYX+m+nGGEsF/HHNhYda9KqVRt8cdreojV8EStlb7Cu
	CMGA4wwuX2ZAO+QaByK/NuFyNhyuIRc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1722429305;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=9gF6UC7GyZES1sywXW1iqfz+JjY6OfayYy0kTi8bYSQ=;
	b=dSQa3CFWWZT4kXd2ZVc+LP5emjTzF9h9g/WODYhFHgEOvOaIKyvWrAELxgtbT5GdvlKhYy
	wfNIkA7lewpNUABw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 5393313297;
	Wed, 31 Jul 2024 12:35:05 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id do+LEnkvqmYiUQAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Wed, 31 Jul 2024 12:35:05 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: deller@gmx.de
Cc: linux-fbdev@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-omap@vger.kernel.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 0/9] fbdev: Use backlight power constants
Date: Wed, 31 Jul 2024 14:33:41 +0200
Message-ID: <20240731123502.1145082-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-1.81 / 50.00];
	DWL_DNSWL_MED(-2.00)[suse.de:dkim];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FREEMAIL_TO(0.00)[gmx.de];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
	DKIM_TRACE(0.00)[suse.de:+];
	FREEMAIL_ENVRCPT(0.00)[gmx.de]
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spam-Score: -1.81
X-Rspamd-Queue-Id: 94EC71F82F

Commit a1cacb8a8e70 ("backlight: Add BACKLIGHT_POWER_ constants for
power states") introduced dedicated constants for backlight power states.
Convert fbdev drivers to the new constants.

The new constants replace the fbdev constants. This is part of a larger
effort to make kernel subsystems more independent from fbdev code and
headers.

Thomas Zimmermann (9):
  fbdev: atmel_lcdfb: Use backlight power constants
  fbdev: aty128fb: Use backlight power constants
  fbdev: atyfb: Use backlight power constants
  fbdev: chipsfb: Use backlight power constants
  fbdev: nvidiafb: Use backlight power constants
  fbdev: omapfb: Use backlight power constants
  fbdev: radeonfb: Use backlight power constants
  fbdev: rivafb: Use backlight power constants
  fbdev: sh_mobile_lcdc_fb: Use backlight power constants

 drivers/video/fbdev/atmel_lcdfb.c                           | 4 ++--
 drivers/video/fbdev/aty/aty128fb.c                          | 6 +++---
 drivers/video/fbdev/aty/atyfb_base.c                        | 2 +-
 drivers/video/fbdev/aty/radeon_backlight.c                  | 2 +-
 drivers/video/fbdev/chipsfb.c                               | 2 +-
 drivers/video/fbdev/nvidia/nv_backlight.c                   | 2 +-
 drivers/video/fbdev/omap2/omapfb/displays/panel-dsi-cm.c    | 4 ++--
 .../fbdev/omap2/omapfb/displays/panel-sony-acx565akm.c      | 2 +-
 drivers/video/fbdev/riva/fbdev.c                            | 2 +-
 drivers/video/fbdev/sh_mobile_lcdcfb.c                      | 6 +++---
 10 files changed, 16 insertions(+), 16 deletions(-)

-- 
2.45.2


