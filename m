Return-Path: <linux-omap+bounces-5369-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E04E0CFC023
	for <lists+linux-omap@lfdr.de>; Wed, 07 Jan 2026 05:43:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0C595302AFDD
	for <lists+linux-omap@lfdr.de>; Wed,  7 Jan 2026 04:43:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1FEF3258CED;
	Wed,  7 Jan 2026 04:43:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hFj7NtT4"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ED1C22A4EE
	for <linux-omap@vger.kernel.org>; Wed,  7 Jan 2026 04:43:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767760994; cv=none; b=IbggY3FPLXApbfXRhzxaZaDGBLBCvGqULmYf2Svh/gz55IpVXs3gcTP0U8K+uXh5RAJkFZRFmV5S1Obe+BPj5LtPpU4VrTqFaK5UCrG0iKBML2wfBR++XhS78fiozc4muV94YzivYd3wVwG/mhSu06bZl4Rc+fNW4zwA6xJHgQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767760994; c=relaxed/simple;
	bh=e3+WQHyFRW/3v5sP8KdsTaOplFA/7EjOOFOI/hwG3no=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=G4UKUad1BnQaJLlumJuW1/E+wamA+gQDB2+f7e5uDo2T6LEMuls+gVhz81j1fbPjo0JsDAyyxIbroGm++2DJmnVKbtpbJI4RCpBLp36dUHWda6GM9P2jugWz8hdHJMPtJTlpGTdlXB6MywYlxuzf++zNv0TDV3eClJ6JFGX5SFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hFj7NtT4; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-7f216280242so124951b3a.1
        for <linux-omap@vger.kernel.org>; Tue, 06 Jan 2026 20:43:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767760992; x=1768365792; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WslmtEFTWEHvFrP3QiD87NaWkQaTvkUfKeQGZcqLgCc=;
        b=hFj7NtT4gUUxaORGlSp7PTt/QEsGnzEP9MWTabOo0BaG8Zzyyryijnc9DOrmg9PTnB
         o5E4wC/kXrQGdzrdKyPKK/HGZ4bVGoHB02dvX8OP4vIHCd/rzxF6Bnxvgt4vpnjeaN3V
         b1YwB4QvsOOprXVmbjovO0718/SdK/ajo2EA10q6/CzJeHiXfyS4XvSh/5zU6oTa6eOY
         kLK8o0x0DgUxo9ogkPg1M7HnD8IZeusNlvaQlvxpUDGKkEHTLsSTn1ujxfBzMUIG28kE
         2fAqvjw4NDqKL3XVYasuyRwQM2PuMjI+Ulcy+dew3+gZStshQbUkwSI7OR6Zr5eNl1Gc
         Q0ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767760992; x=1768365792;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WslmtEFTWEHvFrP3QiD87NaWkQaTvkUfKeQGZcqLgCc=;
        b=GnD+JOvQ9OeIToBNZoVdgcXTQJZBkKdu5/nE1vmiiAfuoDO3rC8b6GxUnhHL3OSW2h
         zhpT+FMg74rcuMPpnMwOn8ertYz9Xh3ND7A7ePn7cBj1HtGzhFsChKjECZFp5Sw3Wv8p
         0KFGjuVs8OXjziBa9s5ZMi/Tc7n24d+nspDr2zOhliec/U3SCoEFqKBnSliXpFqXMMRq
         a9tn8/DoLg7UVZG5O81Pi2dxcENvuBAwa+KlpmJMkcCFzKONpY5KAsLuEtqsJAnp6fWH
         jHlL8Qf0cxwL9y+WmPmWFzPceQDi+9n29kEBaNy6+1zcURbePH7bgIK71PYA8SR2bXHy
         /3sw==
X-Forwarded-Encrypted: i=1; AJvYcCViCiVnb1nOv3iN3cijctMzFkBNyivwkW/hWNACfwSPOqORZuNwMchf1aUnere+gANFGpteva+1bqlE@vger.kernel.org
X-Gm-Message-State: AOJu0Yym/8BVcBNSNMu8VOekPA4blEhAS2JIyevR/iYW8B7SAucn/jYY
	W0Px8JiWAHAU/y9jrh2mcAWSh8SOZM8uXEl8DN/cDNxPNi6xhXiWkC8C
X-Gm-Gg: AY/fxX6jHSHMyEqpGQsDxvyYcg8d0LcJExvDgsZANpJjoW2tvTmc+Ks8u5tC/X+8i74
	sfta9Hrbs99tAisNGu13JE2vc4Bgu2uwXCOWWMJloncQPoL1ZLAg0XVwHeY9J82ICN+QyP3Fks3
	BSfc/AH5F3hOSCGxuQr+AQd2RONJrOiwPbnwiriFXQOdtmBNSuztt/US7a0MNBzoh6wLjvKYe1J
	K3iSNeuJJMON7w0tQoQzGR8r4wzQRRPTLAZk2XSsFvNUnrpTYpw86BUQIhprWgQ6AJOakbG5mqI
	bOTrpWGAvoGLhLEprsmoI14yPvAu1z50ti4OrjgHO8lJKRLioQE3CcEc5xE3J027E6QY6++3IR8
	ui+LkqSyoZ/rVzZvy1fhGMJlJW5OLbgJZtYosyLznuFIkUrHNowfRhQEPpzMfd0AS3+pcOj9CwR
	D1xnxQNGiO0yBcZZr9H2cMid1Y7hphFOc0bbVnIH3v1Ac=
X-Google-Smtp-Source: AGHT+IHvMYshChHPS/SvCPXJOds/HFiMhuycAJvqKdORLFBZ5x1SeAE0yuJFjXTcwpdgt59hPsI5hw==
X-Received: by 2002:a05:6a20:548d:b0:366:14b0:4b1a with SMTP id adf61e73a8af0-3898eb23fe7mr1504437637.37.1767760992455;
        Tue, 06 Jan 2026 20:43:12 -0800 (PST)
Received: from cmpatel-home.hsd1.or.comcast.net ([2601:1c0:5780:9200:d1c8:9d76:637a:6957])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3c39ef2sm36866225ad.14.2026.01.06.20.43.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jan 2026 20:43:12 -0800 (PST)
From: Chintan Patel <chintanlike@gmail.com>
To: linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-omap@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	tzimmermann@suse.de,
	andy@kernel.org,
	deller@gmx.de,
	gregkh@linuxfoundation.org,
	Chintan Patel <chintanlike@gmail.com>
Subject: [PATCH v4 0/4] fbdev: Make CONFIG_FB_DEVICE optional for drivers
Date: Tue,  6 Jan 2026 20:42:53 -0800
Message-ID: <20260107044258.528624-1-chintanlike@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This series makes CONFIG_FB_DEVICE optional for fbdev drivers that use
it only for sysfs interfaces, addressing Thomas Zimmermann’s TODO to
remove hard FB_DEVICE dependencies.

The series introduces a small helper, dev_of_fbinfo(), which returns
NULL when CONFIG_FB_DEVICE=n. This allows sysfs code paths to be skipped
via runtime checks, avoids #ifdef CONFIG_FB_DEVICE clutter, and keeps
full compile-time syntax checking.

Signed-off-by: Chintan Patel <chintanlike@gmail.com>
---
Changes in v4:
- PTR_IF() was removed and overlay sysfs is now optional via __maybe_unused 
  and #ifdef CONFIG_FB_DEVICE (suggested by Helge Deller)
- Decouple variable definition and assignment in 
  omapfb_remove/create_sysfs (suggested by Andy Shevchenko)
- Added Reviewed-by tags:
  - fb: Add dev_of_fbinfo(): Helge Deller, Andy Shevchenko
  - staging: fbtft: Helge Deller

Changes in v3:
- Use PTR_IF() to conditionally include overlay_sysfs_group in 
  overlay_sysfs_groups(suggested by Andy Shevchenko)
- Decouple variable definition and assignment in 
  fbtft_sysfs_init/exit(suggested by Andy Shevchenko)

Changes in v2:
- Add dev_of_fbinfo() helper (suggested by Helge Deller)
- Replace #ifdef CONFIG_FB_DEVICE blocks with runtime NULL checks
- Switch to fb_dbg() / fb_info() logging (suggested by Thomas Zimmermann)

---

Chintan Patel (4):
  fb: Add dev_of_fbinfo() helper for optional sysfs support
  staging: fbtft: Make FB_DEVICE dependency optional
  fbdev: omapfb: Make FB_DEVICE dependency optional
  fbdev: sh_mobile_lcdc: Make FB_DEVICE dependency optional

 drivers/staging/fbtft/Kconfig                 |  5 ++++-
 drivers/staging/fbtft/fbtft-sysfs.c           | 20 +++++++++++++++----
 drivers/video/fbdev/omap2/omapfb/Kconfig      |  3 ++-
 .../video/fbdev/omap2/omapfb/omapfb-sysfs.c   | 18 +++++++++++++----
 drivers/video/fbdev/sh_mobile_lcdcfb.c        |  5 ++++-
 include/linux/fb.h                            |  9 +++++++++
 6 files changed, 49 insertions(+), 11 deletions(-)

-- 
2.43.0


