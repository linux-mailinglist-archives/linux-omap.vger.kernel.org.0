Return-Path: <linux-omap+bounces-2626-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 47D429C2614
	for <lists+linux-omap@lfdr.de>; Fri,  8 Nov 2024 21:05:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C62F61F231B2
	for <lists+linux-omap@lfdr.de>; Fri,  8 Nov 2024 20:05:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4BCD11C1F30;
	Fri,  8 Nov 2024 20:04:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eYe2O8Gp"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8620F1A9B3C;
	Fri,  8 Nov 2024 20:04:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731096295; cv=none; b=nGBh1Xsv18UXM90QcTO8vR9kF/dPHZeOrYczFtq/vED3ZG39Im4UduBfa2GegfBcfnU4AtYdnXxuHqQGAWf+m4OWPogZ7UQHN3mAqgsiPGqKCS3xux1WUOsTXoLg6gB40QvZnzexyloki2tARO217PhH/h+x2Xg0JzLoGHKgjH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731096295; c=relaxed/simple;
	bh=6ZpIM+9oyyIx1jYE01Y60MmJMVpaOJ66ve5lPeDtg2A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qtIJMlZ3WxuayqgVrsrMe1H3hpEsyWc5Kf54OCcByL6tf7BY3Uv6AfZ5T/wjtO3sfc7qU26qq9GCrQd9fufb/wx/nLiq/f7jXFPA8zBrAvqRP0sOUWG7unxwr25RJieXusIjKSy5YX6eSgr+mtKPbP81qpvohx8XW0s0dHJ0vK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eYe2O8Gp; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-71e70c32cd7so2123130b3a.1;
        Fri, 08 Nov 2024 12:04:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731096293; x=1731701093; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gmzjM0Sz7rMDFT370/VwmwApAVLiN3v20l/4Ptk74eo=;
        b=eYe2O8Gpu+BEiSlftPejgv9o+2dxKjsCgx+2ENx2DvEg6iTcj0iNH4iPh79SyhT8eu
         6nOXHaoYG7SYU7Fb3gVnFoJzXIl1i9xGoN7RiJXjL412c5f9UmdTmI5w+jktQfCUlpzN
         ZwuOkX41uOPvQfDEDXxLLPTklZJ+Mfa08ujOGKOuihY/Hzlg6rs6EgxpdKbi90mytLlv
         ObfVMoukH9rHyUEuHnggWYf7CpRZD0p/Ptx14lVHH0Flq5T6OZHfMFRAAT+F09UBzrYZ
         w5Hh1KRuHy4Cx3MJaMGtidJTJBu0UAxQJ7UX8y/GeKfMnhOqd791sw/gytX2TSZw4LpZ
         CDhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731096293; x=1731701093;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gmzjM0Sz7rMDFT370/VwmwApAVLiN3v20l/4Ptk74eo=;
        b=oIUyewNGfqGDui8zRm3krORQA2mrGHxYw+nA3bcFoyIpi8wKjdhworzXEVhKe3TfrU
         tB5t+xUf15eo3cTWjS6atwzPxt8o3EfazzFay1FHFMVs7Sq9vB4/D72PmSKVxk5gxNtP
         1fGPVcTeuf5AJwI2I80nJqtQcL5X4V4B/ewRSHk2pDQzyjCuQpiOCUFhRunA2W1+iTln
         8cIUb7qOQ+0JS3yXx5LZIXVkvZbdFaj8748cwV/v43YohndzLDkcrMnoMxzMCeWc7qtu
         4Ql2nGkSA2HYjJYscxZ/5dTf9LC33YIqUpXyAl+mewHCvQ1iGfrlueIMIJsPU8Xoyhn6
         Nmtw==
X-Forwarded-Encrypted: i=1; AJvYcCV2SEJq2tydLOPE7s7Tc7tkKLQklBM7JXzyKlP23t3sCdwJ2yExV8l4/F4yW+0veYBcpEvUSxUv7ksfrzuKsq6a@vger.kernel.org, AJvYcCXaeKBCdFG0xIUFuftxNO5L7sNn12TUM31viMpUQkfqAObMi424bqEUSmYnJa7vS16jFqrOJkeYGkwt/dCR@vger.kernel.org, AJvYcCXg/wbLPlnzu7LXihu4cA4dLtlWRkqb2F8piTaXxcxOEfxRpyPE+bT5oMc106XWGaA2EKign7ikfNx6@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6XmxZQ/MDMLc2bavSelT+8+w5vsJ8Sgj1y9aiCvN/3DkuhXad
	bfiv1Y2JeIEyxFu91M0nCwusNXP9cS12PJOWPaSo7os0gvHIHD5I
X-Google-Smtp-Source: AGHT+IHobQL0rpFYvZO7mxaTrYc1Q3VG5GZ1OA9v2Mqn61QPt3k7BNZA4V2BCjbnnehnkYjuGTR4UA==
X-Received: by 2002:a05:6a00:139d:b0:71e:1722:d02c with SMTP id d2e1a72fcca58-72413260a41mr5587460b3a.3.1731096292678;
        Fri, 08 Nov 2024 12:04:52 -0800 (PST)
Received: from mighty.kangaroo-insen.ts.net ([120.88.183.182])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72407a56a30sm4323418b3a.188.2024.11.08.12.04.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Nov 2024 12:04:52 -0800 (PST)
From: Mithil Bavishi <bavishimithil@gmail.com>
To: Aaro Koskinen <aaro.koskinen@iki.fi>,
	Andreas Kemnade <andreas@kemnade.info>,
	Kevin Hilman <khilman@baylibre.com>,
	Roger Quadros <rogerq@kernel.org>,
	Tony Lindgren <tony@atomide.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Jessica Zhang <quic_jesszhan@quicinc.com>,
	Mithil Bavishi <bavishimithil@gmail.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Thierry Reding <thierry.reding@gmail.com>
Cc: linux-omap@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-hardening@vger.kernel.org
Subject: [PATCH v3 00/10] Initial support for Samsung Galaxy Tab 2 series
Date: Fri,  8 Nov 2024 20:04:29 +0000
Message-ID: <20241108200440.7562-1-bavishimithil@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series adds initial support for the Samsung Galaxy Tab 2
(samsung-espresso7/10) series of devices. It adds support for 6 variants
(P3100, P3110, P3113, P5100, P5110, P5113). Downstream categorised them
based on 3G and WiFi, but since they use different panel, touch
controllers, batteries, I decided to categorise them based on screen
size as espresso7 and espresso10.

It adds basic functionality for both the models including panel, drm,
sdcard, touchscreen, mmc, wifi, bluetooth, keys, battery, fuel gauge,
pmic, sensors.

Signed-off-by: Mithil Bavishi <bavishimithil@gmail.com>
---
Changes in v3
- Use device tree from the correct branch
- Fix commit subjects to matching the subsystem
- Add Doestek vendor
- Add compatible for LVDS encoder
- Add compatibles for 7 and 10 inch panels
- Clean up device tree using "make CHECK_DTBS=y"
- Link to v2: https://lore.kernel.org/all/20241030211215.347710-1-bavishimithil@gmail.com/
Changes in v2
- Fix node names in common dtsi to have - instead of _
- Removed import for twl6030.dtsi
- Edited dts to completely use twl6032 nodes
- Fixed typo ldosb -> ldousb
- Link to v1: https://lore.kernel.org/all/20241030194136.297648-1-bavishimithil@gmail.com/

--
Mithil Bavishi (10):
  ARM: dts: twl6032: Add DTS file for TWL6032 PMIC
  dt-bindings: vendor-prefixes: Add Doestek
  dt-bindings: display: bridge: lvds-codec: add doestek,dtc34lm85am
  dt-bindings: display: panel-lvds: Add compatible for Samsung
    LTN070NL01 Panel
  dt-bindings: display: panel-lvds: Add compatible for Samsung
    LTN101AL03 Panel
  ARM: dts: ti: omap: espresso-common: Add common device tree for
    Samsung Galaxy Tab 2 series
  dt-bindings: omap: Add Samsung Galaxy Tab 2 7.0
  ARM: dts: ti: omap: samsung-espresso7: Add initial support for Galaxy
    Tab 2 7.0
  dt-bindings: omap: Add Samsung Galaxy Tab 2 10.1
  ARM: dts: ti: omap: samsung-espresso10: Add initial support for Galaxy
    Tab 2 10.1

 .../devicetree/bindings/arm/ti/omap.yaml      |   2 +
 .../bindings/display/bridge/lvds-codec.yaml   |   1 +
 .../bindings/display/panel/panel-lvds.yaml    |   4 +
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 .../omap/omap4-samsung-espresso-common.dtsi   | 680 ++++++++++++++++++
 .../dts/ti/omap/omap4-samsung-espresso10.dts  | 102 +++
 .../dts/ti/omap/omap4-samsung-espresso7.dts   |  70 ++
 arch/arm/boot/dts/ti/omap/twl6032.dtsi        |  77 ++
 8 files changed, 938 insertions(+)
 create mode 100644 arch/arm/boot/dts/ti/omap/omap4-samsung-espresso-common.dtsi
 create mode 100644 arch/arm/boot/dts/ti/omap/omap4-samsung-espresso10.dts
 create mode 100644 arch/arm/boot/dts/ti/omap/omap4-samsung-espresso7.dts
 create mode 100644 arch/arm/boot/dts/ti/omap/twl6032.dtsi

-- 
2.43.0


