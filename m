Return-Path: <linux-omap+bounces-5284-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EA851CE8B6B
	for <lists+linux-omap@lfdr.de>; Tue, 30 Dec 2025 06:29:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B89343013EBD
	for <lists+linux-omap@lfdr.de>; Tue, 30 Dec 2025 05:29:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 605412D594F;
	Tue, 30 Dec 2025 05:29:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h4HrvkuK"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98BEE27FB34
	for <linux-omap@vger.kernel.org>; Tue, 30 Dec 2025 05:29:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767072544; cv=none; b=N4YVuHpfq/k+hQXmFcZjhdHGvXdxPfmRtv4cEdn0o/q1TnP6DJ324UFGYDU8Hx7B8U/d9XCb4OZXKzJ40cAp/VP+Sebo3vsMWOBOMlwGhY2ttKIo4mcgkV809CSBJUqZrONaOQuzx6peddKMwsiwg0FVdKfxR2/jzz+jIriapxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767072544; c=relaxed/simple;
	bh=9ea4jF6P3TyrXMCdcTje93kbQRCfpteLO1tsmpVJYR4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=mHk0tHVn0S8vrJNGWETaRJe3ZQOshZz0Iqv21IxateFKW2czQ0rR7tDEHDqa4FUkWm0zkBZfNZfUCYa+vEXK511DiWSJSDpgk/89jtUwmv+iaORYUzo41QEIRg2FVxM73iSymA1u7GMriQYtl60q2QE45hWe9gF1RDoMDz20970=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h4HrvkuK; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2a07fac8aa1so103237635ad.1
        for <linux-omap@vger.kernel.org>; Mon, 29 Dec 2025 21:29:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767072542; x=1767677342; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Dj6McVGjym7Yb0fc3OqJWPUYkxg//XdJSHr/RV+rzYI=;
        b=h4HrvkuKxfZRPTt/l9xyyhLsw6ivBR+T/1Ua45ETohAKYsBH1o5QJ9qWEGUQnVYXBh
         MBoeRyRnG3vtssaKP0Omm6CaJk4TSjPUEjMEj8rPxk3NzjoQrDov6RZOziRAmsKjNKSW
         w7DZTtOaOd7LljTzHh5CSyXxpgVw2xOJykFngSW0nqValknqoqxkUFGEakyYN2pvnzF2
         o5+u00gBXS4EZTHpn3hnds8BG6DvGL/5Ky6x37Aadko8Df+GMEmTDIm7KbeJ+rRjfaLq
         p5URxILtpgJzbxGamCBwIqD2gMopOwwD7fYGCekcS3RGjixGw9z4veRRY9DpQWpx4zKT
         +6Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767072542; x=1767677342;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Dj6McVGjym7Yb0fc3OqJWPUYkxg//XdJSHr/RV+rzYI=;
        b=ZYW1ejyFo6qOHp5xWtosXt0Ko6pr2AMCTOHVjlyxu14fT1XhN+sOYyd5MDAU16Lz7L
         zLwxkjQJ64kZpl44p+aadVgxZ+6/2+8pw9crDi9gCnh7TNNdA+RjzefvsZvBx5iX54+S
         ZGXbTLUfUUjm/M57HewoSejJCFLqosRTROoTUUHasSzehUbSCw1Ihc11tpCis1sD+QlN
         LYAfUNeeIF3AtBipEflEsoT1/Ai/+5Wi5m10/7dRDcWwgz68PBGn48Wrlg5TQWmDrBEO
         0tDF+Cbjwlp0hzhWUY+OOZWJYMKPSPHvLlZ4prw8QS4Xr/2pfilD7wJWnwGkB6Yyl+41
         CXQQ==
X-Forwarded-Encrypted: i=1; AJvYcCVw+nsg3elZY4LVf1W1HVshM9qqINNdUTDu9X2qLl67WHwQ1HMChkpTVU+l1O7OLPLLriuw43e1w0lR@vger.kernel.org
X-Gm-Message-State: AOJu0YzRBJRpdNEerC63EjzQkBGkkL06tnJpZCZtxwnDfjO4nzf8A64A
	QTgY0nLfWrbNRAffZmE0D4UWoOjPSYrafnGuSuruk3ijGJ1xkNt0USLn
X-Gm-Gg: AY/fxX79kY7BMQ4strYQ2auCsJg2nX2KS8Mz8ma2FsPbgehzbWfp4JCEI2AoCbh5gWK
	nvfzQzENX9s/cFRGlERwL6OQGIa2nOsYEQQnATQy8Tsuq61hk7+bC/XVqHdjESpCgWvaSwo3ic8
	O9YqxruvGNiA59V9US61TyJCcKVyqSxHxda0dO2SQGFXZFS1rPaHVMCbG/lpRiDoDWBNp6fePPx
	QWXMWNDe1t7GBlWdhWStvJoGNqarm8USWadOHKawH1TarhORx5Ig+pQy8PZrux3WYocckHxAjeZ
	oiTU9bwWmzCpc+uZ8xZvsY1ByOUPR93fKItkUW4yw24lQLkKhjuA7cvbr8TQjLzN7KqcJU687OU
	0E++Q2txkNDgyZNwNGA4ilD6u5jR6n1cUBYLg0ix3SpBTno81ijHKRxtmr/LKqf3t04yQDcMpNt
	p+CxaO5ylFd6TqtbHPj9pgCogpiSiaiUSIRpecmw4fFw==
X-Google-Smtp-Source: AGHT+IHwTfpQdWaiGQID80ROPYBWipLKNMwbumSR5a0iV81jvx/Y/dNBzJjvj9L9pMYVwYJAGCLB/w==
X-Received: by 2002:a17:902:e785:b0:2a0:acf1:ad0f with SMTP id d9443c01a7336-2a2f22024e0mr275687215ad.12.1767072541794;
        Mon, 29 Dec 2025 21:29:01 -0800 (PST)
Received: from cmpatel-home.hsd1.or.comcast.net ([2601:1c0:5780:9200:f7a0:c2f:d915:faf0])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3c8286esm289290375ad.33.2025.12.29.21.29.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Dec 2025 21:29:01 -0800 (PST)
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
Subject: [PATCH v3 0/4] fbdev: Make CONFIG_FB_DEVICE optional for drivers
Date: Mon, 29 Dec 2025 21:28:18 -0800
Message-ID: <20251230052827.4676-1-chintanlike@gmail.com>
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
Changes in v3:
- Use PTR_IF() to conditionally include overlay_sysfs_group in 
  overlay_sysfs_groups
- Decouple variable definition and assignment in fbtft_sysfs_init/exit

Changes in v2:
- Add dev_of_fbinfo() helper (suggested by Geert Uytterhoeven)
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
 .../video/fbdev/omap2/omapfb/omapfb-sysfs.c   | 16 +++++++++++----
 drivers/video/fbdev/sh_mobile_lcdcfb.c        | 12 ++++++++++-
 include/linux/fb.h                            |  9 +++++++++
 6 files changed, 54 insertions(+), 11 deletions(-)

-- 
2.43.0


