Return-Path: <linux-omap+bounces-2533-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EC2F9B6E81
	for <lists+linux-omap@lfdr.de>; Wed, 30 Oct 2024 22:12:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5DE18282DE6
	for <lists+linux-omap@lfdr.de>; Wed, 30 Oct 2024 21:12:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1E18215023;
	Wed, 30 Oct 2024 21:12:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PtYfCOE3"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8E4D1F4700;
	Wed, 30 Oct 2024 21:12:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730322750; cv=none; b=kqrQP2FCNr8YTm8VpvuPou8MqZAJl1k6eUi3g764Yk839uvvizmJIutJJAhlx/icrPHeb5dTxsE97+C+97pr6Z4gcyYGU8RF3h8lsYr4d+PhDAOjXsyEM1AzUtlGa9vxDUVjCGfos7DPoky1eFq2+lhdgzfEKHPHe8UA8ffLbdw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730322750; c=relaxed/simple;
	bh=hE2jqzSIkXU9SaRX+9UGIcCc9URpgf+MHopZnPpw474=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hQoX3GE9Sq2Z9xoBglcmUIYEkslWAdMM99UcZ0KGNTr0GrF/dMrDZdgpv2dsyEGT1+vJCtj4kwGT9EmpWhfp7uOKhiTTn/vvOld+uBHJIAFU/lY9QIcglB7LsTiroUUAlJ+PdtHQxzvjh55qWemRixIroCQ56rkN8qH+cvRytsY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PtYfCOE3; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-2e2e87153a3so190574a91.3;
        Wed, 30 Oct 2024 14:12:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730322746; x=1730927546; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MCHLvmuPoVYwH/lSBuarWcWQUHiVQ/6pbokdDowdJwI=;
        b=PtYfCOE3oL/SDxTm2v+Xb/BaWxMdTl/on2dDA/H3ZQriGLFxxL1JkxKzPrUHOLXNsR
         B91YUBk4zrcvRgvRWL+pX061OyLwAZXdmXSkyY6onUWpaH2SdIbiXOznahTy8FNhVEoW
         4OrDurtxCsP2Qlp5jDikRwrkBqyhwiGJ5aTCEh2o8uCeLISu/TAPsifuKLjqOi5Ynmdg
         VqdJTJ8dVcYTwFajhUi16YDpInvtIUuiYBuaj9s6simAsdq11jo929fEUrSJPMR2ilTk
         QFg+0vLo0Zfe6mlc1pQD1HZcBifJJRr7V1kaDfcEsW5hqVBHxaziXfGKeMSMykcO2vim
         7Lfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730322746; x=1730927546;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MCHLvmuPoVYwH/lSBuarWcWQUHiVQ/6pbokdDowdJwI=;
        b=RU9MNcJPLTMbwwIBJga/ogwqIe3USw/SFzxR34eYNRNj9pjEln88FWXlHbTUmFzPRz
         HPZOaT2WpNvjHgkQZ3sg1mZyIG2lTHDhDyFYr+hxYFqznztbt4DgDj1w1I4E5YlrR2bj
         65RzvfO92xfQpVK5Hmjr5s6q10OZUat9jV+gTr2wShKOwTfrhPCB6y3M8dhuiiDErXjo
         RfyW6L4InKoxF+TiKi7rU2RbJvtkonZp3+PzRZ2Y+na4VdEvWeFE0/scK55OEc0qq9ok
         gtjsx8FTvSfZi6UlD0kgHB/9k6UajRUW+L8iul843KT2TX4Eb3rvNBgG3awwTSZ/xn+9
         KDCw==
X-Forwarded-Encrypted: i=1; AJvYcCUMss3UX+oSiQ7ZDvkI44JPRSBuzDdQfCqXhyHXLPOSbp4tUpYUPF8ovmXoFivfqPtIPOw7HOgM76CM@vger.kernel.org, AJvYcCV/ZZ+y572REoEpCOs0DZR6eBN76gu3t92zY2Dsuwh7XaoffSMMIrrRzXzxcWC13DUKhJkI3p4v4lpn5rI2@vger.kernel.org, AJvYcCV2c2pJPExVI4g2xvLCJVDhAGy+lbXn4GqRVSASk/SqZHx5+W0SlhOaw7jUpGKhU/+JATcg7343jHREx/rIHAkH@vger.kernel.org
X-Gm-Message-State: AOJu0YzLuC+6hkf2yyGfvvhf9V51+nptFpg7RpSq0JTWKmM6OuqvXdiv
	k5o57b9dW7X7hcSAj7I50/n0VgsNqSLV0+daWjO9l7YQSDTOAtuJQjaKpAeQFGo=
X-Google-Smtp-Source: AGHT+IG56HxVH243nmvIR10PABZD1bPWI5WnMGZPbwZX8G8Rz79w1viPqbwn4AgjpOSyXU3dlPQpuA==
X-Received: by 2002:a17:90a:8a05:b0:2e5:5e95:b389 with SMTP id 98e67ed59e1d1-2e8f11baca9mr17537376a91.35.1730322745828;
        Wed, 30 Oct 2024 14:12:25 -0700 (PDT)
Received: from mighty.kangaroo-insen.ts.net ([120.88.183.142])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e92fa0ed5esm2406800a91.2.2024.10.30.14.12.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Oct 2024 14:12:25 -0700 (PDT)
From: Mithil Bavishi <bavishimithil@gmail.com>
To: Aaro Koskinen <aaro.koskinen@iki.fi>,
	Andreas Kemnade <andreas@kemnade.info>,
	Kevin Hilman <khilman@baylibre.com>,
	Roger Quadros <rogerq@kernel.org>,
	Tony Lindgren <tony@atomide.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-omap@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org
Subject: [PATCH v2 0/6] Initial support for Samsung Galaxy Tab 2 series
Date: Wed, 30 Oct 2024 21:12:09 +0000
Message-ID: <20241030211215.347710-1-bavishimithil@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series adds initial support for the Samsung Galaxy Tab 2
(samsung-espresso*) series of devices. It adds support for 6 variants
(P3100, P3110, P3113, P5100, P5110, P5113). Downstream categorised them
based on 3G and WiFi, but since they use different panel, touch
controllers, batteries, I decided to categorise them based on screen
size as espresso7 and espresso10.

It adds basic functionality for both the models including panel, drm,
sdcard, touchscreen, mmc, wifi, bluetooth, keys, battery, fuel gauge,
pmic, sensors.

Signed-off-by: Mithil Bavishi <bavishimithil@gmail.com>
---
Changes in v2
- Fix node names in common dtsi to have - instead of _
- Removed import for twl6030.dtsi
- Edited dts to completely use twl6032 nodes
- Fixed typo ldosb -> ldousb
- Link to v1: https://lore.kernel.org/all/20241030194136.297648-1-bavishimithil@gmail.com/

--
Mithil Bavishi (6):
  ARM: dts: twl6032: Add DTS file for TWL6032 PMIC
  arm/dts: Add common device tree for Samsung Galaxy Tab 2 series
  dt-bindings: omap: Add Samaung Galaxy Tab 2 7.0
  arm/dts: Add initial support for Galaxy Tab 2 7.0
  dt-bindings: omap: Add Samaung Galaxy Tab 2 10.1
  arm/dts: Add initial support for Galaxy Tab 2 10.1

 .../devicetree/bindings/arm/ti/omap.yaml      |   2 +
 arch/arm/boot/dts/ti/omap/Makefile            |   2 +
 .../omap/omap4-samsung-espresso-common.dtsi   | 690 ++++++++++++++++++
 .../dts/ti/omap/omap4-samsung-espresso10.dts  | 102 +++
 .../dts/ti/omap/omap4-samsung-espresso7.dts   |  70 ++
 arch/arm/boot/dts/ti/omap/twl6032.dtsi        |  81 ++
 6 files changed, 947 insertions(+)
 create mode 100644 arch/arm/boot/dts/ti/omap/omap4-samsung-espresso-common.dtsi
 create mode 100644 arch/arm/boot/dts/ti/omap/omap4-samsung-espresso10.dts
 create mode 100644 arch/arm/boot/dts/ti/omap/omap4-samsung-espresso7.dts
 create mode 100644 arch/arm/boot/dts/ti/omap/twl6032.dtsi

-- 
2.43.0


