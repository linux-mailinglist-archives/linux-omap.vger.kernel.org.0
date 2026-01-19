Return-Path: <linux-omap+bounces-5552-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 84F20D39D95
	for <lists+linux-omap@lfdr.de>; Mon, 19 Jan 2026 06:05:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9A24F3008FAB
	for <lists+linux-omap@lfdr.de>; Mon, 19 Jan 2026 05:05:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2CAD326E6E1;
	Mon, 19 Jan 2026 05:05:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q1iHx/1D"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 881571C3F36
	for <linux-omap@vger.kernel.org>; Mon, 19 Jan 2026 05:05:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768799102; cv=none; b=leAhjNPjNSFHvlyIDGaKIow6i5wEvJA7Wev1mPCbexAbZYSVRW+PgjfCu3V9clQ1X6Io6LuhCY6Tzo8rb9fQ98lWmwo11/K+sMSU/V2U4xDo6J6ANGgfHCQs4ZbXROi2hnydIaFbbs7w4q727mpESHvtcujke8WMJggnMt3R7Mk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768799102; c=relaxed/simple;
	bh=Kth4TdY7BKRrFKvA30wZ10JzAU9o9teCxEq+81T6jOI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mZGSBYS+zkWUqPxITJqewVZNbpNKoz15cLwSIKtOPV5C6iDBGYqwNBNMrtmMFVclmtAZ3SDfoQfLgnAflZWQPE054fZQfmWtfCNfiwuEABH0+W308vsvFOZbNhfCppuMTvyp+drYPrgr2LFY7AJgOaFMUaX/qRYT7Vl44TOzZAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q1iHx/1D; arc=none smtp.client-ip=209.85.222.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-8c538d17816so527984385a.0
        for <linux-omap@vger.kernel.org>; Sun, 18 Jan 2026 21:05:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768799100; x=1769403900; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=knOhHJnYgS3NfXJV6CmNIci8LqgQNdPXN9K0tc0/Z54=;
        b=Q1iHx/1Dl2V/ox4sqCaBLI8Ct2jHVu4zNzB3itTdnn7iYzNIl1ivdLvUkNNK4m2CVg
         e58iUzBUGmjmixk4gVFlZHdH1Z9VBdPQecVYmyZd1SGhTBVqvJVI4fGVl7Nln77CyMhM
         xCVuUaoYJ8pyAYd4R9JNGdypg5tA0EAW+WVmxQnatVl3fqlTxHLMjkMHFfCfXfcFVEd7
         aPz7UW6wlEdVgpPvts2L6BoVFOiuKKeUFNoFH+Rzj87/ie6D/Qx/guPtRyiPZn9/XIN2
         ujY7oQfFFEs/FjfUD6KxW4SwxN22/JVpJnmzb/cA4jzgjYb/IJvXAVdAnzXGblGbfaaf
         Hoig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768799100; x=1769403900;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=knOhHJnYgS3NfXJV6CmNIci8LqgQNdPXN9K0tc0/Z54=;
        b=fK5eAhB9/3VbdVxCvU3zFM+3oaq/bQJ3zNQlykgsih3kl6Mt2aU5Th2s/1ikIPkOgc
         EfnyesMRCcvBhKF/HhMQ51zEZzZ67RewyeW93a7XVYlzAv75Mpab0m7QWSHtMcBsKvCA
         sLU/jv5MKjo/wcnor+Mzp3RjqKZfQxLchHP+Gwq+7gFyjAECsmgsK1Gl65QurBrL/yQs
         P31PW0w0TlXsAVR/L15bJ2C7oSE+bXJsDQXfri3ThnC2Q/dzjvKrNi71DpBM9VgxdpJ5
         FicktFtUPKTsid1T3Vvc5DEXz4em9uOe7kIG9O+vjcwcEEX3oUjeK8nFefoSHBB7yl0/
         OS5A==
X-Gm-Message-State: AOJu0YyGBTC9sbGYRJCAADsn1VWiQxov9l/dNIUg05Jg7sOXJpwrRBoO
	BsCDdLQ/xxY0iTk/YA3e2q75+XyEsUtRZwKM7qCYCC3YQ3EvRE0LVS8LiR/Ezg==
X-Gm-Gg: AY/fxX7bSwLLutZKgz220HlQnr0Bb3M5sbUMxiZuSBUaJTOHroY5W62unTQ9ZtF6oHm
	OzbD3bnkBKaQz7RxtkZf0n3v64ETuSsksgsnSXx7E+0QyUeynLt+6w3Gf9+COc7iZ1RF9Z0qyr9
	VNZRtW/hpf6QoB3rnQMeJUyUr1n042uyiabFcUMe/Q7Jc1yITeGJMTDQthgZ8OYQxf5QLFGq6/Z
	c8DfVv6YRWkR9hQZp62qEuppZcQE77WAASF7HoEA684J4TbmxsSnkugux+ZJk1mxRdX/b9yIGiS
	z6h3g9zTlXVK1vALNiykAYdv+RkZa3azbtfiw+TDne+RmrBnXuXzYhiMkhUXX2NDMmWPH8joP5n
	iusjkFvE1cEFKHTSCA43DVAM/MlE4SVgOi0HdWcwBd7BF9y1hJ7B4m8E7SsWV6BXv/G+Vx95fVp
	wBpx0oYEaM+dPryVkw3F3iGgOQmshLVIZgQxr3ylkxym/d48Rg6DgKkIVZw0MsDzPmjCU=
X-Received: by 2002:a05:620a:178a:b0:8b1:1585:2252 with SMTP id af79cd13be357-8c6a68d35f7mr1336428085a.1.1768793440895;
        Sun, 18 Jan 2026 19:30:40 -0800 (PST)
Received: from mighty.localdomain (nat-130-245-192-1.resnet.stonybrook.edu. [130.245.192.1])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c6a71ab20dsm724706885a.5.2026.01.18.19.30.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Jan 2026 19:30:40 -0800 (PST)
From: Mithil Bavishi <bavishimithil@gmail.com>
To: aaro.koskinen@iki.fi,
	andreas@kemnade.info,
	khilman@baylibre.com,
	rogerq@kernel.org,
	tony@atomide.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	neil.armstrong@linaro.org,
	rfoss@kernel.org,
	laurent.pinchart@ideasonboard.com,
	jonas@kwiboo.se,
	jernej.skrabec@gmail.com,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	quic_jesszhan@quicinc.com,
	bavishimithil@gmail.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	thierry.reding@gmail.com
Cc: linux-omap@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-hardening@vger.kernel.org
Subject: [PATCH v4 00/10] Initial support for Samsung Galaxy Tab 2 series
Date: Sun, 18 Jan 2026 22:30:24 -0500
Message-ID: <20260119033035.57538-1-bavishimithil@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mithil <bavishimithil@gmail.com>

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
Changes in v4
- Fixed syntax in doestek vendor
- Changed - to _ in node names
- Removed address/size-cells in chosen
- Added pinmux for i2c-gpio5,6,7, irled
- Allow sdcard to poweroff (reg_espresso_external)
- Changed power to key-power
- Order alphabetically in omap4_pmx_wkup and omap4_pmx_core
- Use generic node names
- Added TODO for future nodes
- Fix touchscreen values in espresso7 and espresso10
- Add dts to Makefile
- Commit message length under 75
- Link to v3: https://lore.kernel.org/linux-omap/20241108200440.7562-1-bavishimithil@gmail.com/
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

 .../devicetree/bindings/arm/ti/omap.yaml      |    2 +
 .../bindings/display/bridge/lvds-codec.yaml   |    1 +
 .../bindings/display/panel/panel-lvds.yaml    |    4 +
 .../devicetree/bindings/vendor-prefixes.yaml  |    2 +
 arch/arm/boot/dts/ti/omap/Makefile            |    2 +
 .../omap/omap4-samsung-espresso-common.dtsi   |  762 ++
 .../dts/ti/omap/omap4-samsung-espresso10.dts  |  104 +
 .../dts/ti/omap/omap4-samsung-espresso7.dts   |   70 +
 arch/arm/boot/dts/ti/omap/twl6032.dtsi        |   77 +
 arch/arm/configs/espresso_defconfig           | 7506 +++++++++++++++++
 10 files changed, 8530 insertions(+)
 create mode 100644 arch/arm/boot/dts/ti/omap/omap4-samsung-espresso-common.dtsi
 create mode 100644 arch/arm/boot/dts/ti/omap/omap4-samsung-espresso10.dts
 create mode 100644 arch/arm/boot/dts/ti/omap/omap4-samsung-espresso7.dts
 create mode 100644 arch/arm/boot/dts/ti/omap/twl6032.dtsi
 create mode 100644 arch/arm/configs/espresso_defconfig

-- 
2.43.0


