Return-Path: <linux-omap+bounces-5225-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D2D6CCE936
	for <lists+linux-omap@lfdr.de>; Fri, 19 Dec 2025 06:45:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 41302308793F
	for <lists+linux-omap@lfdr.de>; Fri, 19 Dec 2025 05:43:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76E4D2D323D;
	Fri, 19 Dec 2025 05:43:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Op5ML9dW"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C985F26F2AF
	for <linux-omap@vger.kernel.org>; Fri, 19 Dec 2025 05:43:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766123021; cv=none; b=lVBU5VZYBmau5HKiteXGyeAuj9/yNgFevzcg68KSx/jilG0FjRbO6X07igHVviPI6vH6yGYVX+cKcrcQvwob5NlxqInYgXwX2AQkXLgBCSs81YlL8YC0wvHqfPB+nt4ndaBUWY7+JrsquklMjf3jlYpC7rgrsI+ALiKtj+DSTwk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766123021; c=relaxed/simple;
	bh=olchUGNmj+A+qnIzj2ct7pmV079cgkWTHEnd61K24Mw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=htqx6n5bg0huHCPFWpMweCfauzwXrEzD55skIDluvmQIUhQrIMD0pZgUlrUpQP0UK5SsfIUS2n3DZLrHYpL2UYqLWBG3d55TY+rjYQ3eZqoM/4hGjEUROvraoaDnSC8WgrwajKJHMGbe7xlV6FMJfWCRBJgzrQFSFi7m5KXeiCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Op5ML9dW; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-29efd139227so17831585ad.1
        for <linux-omap@vger.kernel.org>; Thu, 18 Dec 2025 21:43:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766123019; x=1766727819; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sEjpRHuoUQuSNfpUTp6o9J/plYbBOC8VgnoTelGo6Ag=;
        b=Op5ML9dWJhyTMibNWfF3eiFnzIpILBuwxYZ75fJTT4DahmXkt4RmOhuGaz7coymmWn
         1htSQY/VXmn+InWd+n6WVu67BAN+6spc4DA+9g4GEWNCI/2OWLlUvneg5IBWSzhnTlUn
         aOcnN0hefYPQxZ6F9vBH7+5OKhJgu/jfr/KYcagE/U3jIh5t0BLdwvatpT8BYWRk5gsy
         QzPQ8qaQe14dx+3BSBkXd6dx/JC5SSIJGkCcdjHhTMtAWLtjxrsq8oU2+VNiE6tAXxgE
         xxRFFtYGZ2rlPyGJxEMjQuuNsNUEdI69glbgRgOeQr/e+AKtg0iLzL0xaduaDBrvwlVN
         vuMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766123019; x=1766727819;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sEjpRHuoUQuSNfpUTp6o9J/plYbBOC8VgnoTelGo6Ag=;
        b=o70pDST4pRNNqkkDrZNGtMUhoV4Xrhv74bYeLFlaoyeNm3onmdIa2wb7JgyhR29Bd/
         tZ0Uc+9uaNdcWZamLcZoKgRZuzoOScOK1exR1YDC2zy92mHGgXhn43GXO5VI1WGh0rad
         LipLl3aNJ/+c0EUulMaFdQcyUiXUi1zx90mEB3i7EGetnI342EgDcGsGMIpdxu3Ziixm
         h3NOSfdANVqF8vwQYlFJG8vPENbdeffjAg0RIg1HR0SGiX3ibZH70zeNOdTc5L1CK1LJ
         bQ8ZMvUvQvbF9SKK42L3PIWugQvJW8Ig6JaPiUrWxpj4Vri1ygEe5d5KSz+gKbl4/sy9
         a9mQ==
X-Forwarded-Encrypted: i=1; AJvYcCXuhmYPqqczhCypoBns/Jl5c+95CGwAbpQ76QK/z4iVmKzfrE+Gs+xpqT5qnIm4Gp6rctF5E0LnBFoG@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5epcR8/ByurBgkpdwM8bg4Tfs4rDSLaoJWefLPTjdDQUazfOH
	8Brp2ItGZN8dzbApw9VSrru7+gt46j7J5SfqC2GPGZYUcQWH+GpaBfBR
X-Gm-Gg: AY/fxX4P3EwR9btnceLsznp+r5O31mH67Qtq2I1zKjkZzguSNsg8eXCKf24TFDWHfJC
	ZVUG+rFoGWkc3oxKL+bR9BH3JSMPxqWYLHH1izZk+OgZKyQ1v2Btx8EvShehX5Un707tPhYm8Cn
	RKc/03kwltkVLELnxNgRgn8LUPlPKE7TjIprn2LUVk/0aPX0vWRtDgmPo1GOTb4HbyUgb6/qLY7
	smy6F+OQrC2uWUVuyP3ymVPiywXxiqFfAui35Lg+BNaY5nBVFn9SV45DUwQp3ap1+on1Bf3ClzB
	0Y+bC1Q4+f5DgKOM1wuPGS19cVKdcuDWjfU21WbTfpgZD0d4uAN1VhiX7rA9rw1uoszX4e0RuZG
	97DtC8gnrAgnyaC3WcCW2hW2FkwAH5vwfscP4nCpE63C17gnLKOWjzOytNlG1iqMDXJ8uZAj9hn
	K2piBXGaPelCBs9btCR1MgqTRrhhBZXK+Ndz6HU1idmrU=
X-Google-Smtp-Source: AGHT+IHctISdxJ6hWwW5bBx0NwJSgL9qDkTNsgriPOBWh2QM/6lUZdbbSRVd/mE4FUYhXiJRoQ1jPw==
X-Received: by 2002:a17:903:2301:b0:294:f6b4:9a42 with SMTP id d9443c01a7336-2a2f21fad06mr14413895ad.9.1766123018955;
        Thu, 18 Dec 2025 21:43:38 -0800 (PST)
Received: from cmpatel-home.hsd1.or.comcast.net ([2601:1c0:5780:9200:5160:2cad:cf88:afa5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3da7dabsm9878955ad.25.2025.12.18.21.43.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Dec 2025 21:43:38 -0800 (PST)
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
Subject: [PATCH v2 0/4] fbdev: Make CONFIG_FB_DEVICE optional for drivers
Date: Thu, 18 Dec 2025 21:43:15 -0800
Message-ID: <20251219054320.447281-1-chintanlike@gmail.com>
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

Changes in v2:
Add dev_of_fbinfo() helper (suggested by Geert Uytterhoeven)
Replace #ifdef CONFIG_FB_DEVICE blocks with runtime NULL checks
Switch to fb_dbg() / fb_info() logging (suggested by Thomas Zimmermann)

Chintan Patel (4):
  fb: Add dev_of_fbinfo() helper for optional sysfs support
  staging: fbtft: Make FB_DEVICE dependency optional
  fbdev: omapfb: Make FB_DEVICE dependency optional
  fbdev: sh_mobile_lcdc: Make FB_DEVICE dependency optional

 drivers/staging/fbtft/Kconfig                  |  5 ++++-
 drivers/staging/fbtft/fbtft-sysfs.c            | 18 ++++++++++++++----
 drivers/video/fbdev/omap2/omapfb/Kconfig       |  3 ++-
 .../video/fbdev/omap2/omapfb/omapfb-sysfs.c    | 16 ++++++++++++----
 drivers/video/fbdev/sh_mobile_lcdcfb.c         |  9 +++++++++
 include/linux/fb.h                             |  9 +++++++++
 6 files changed, 50 insertions(+), 10 deletions(-)

-- 
2.43.0


