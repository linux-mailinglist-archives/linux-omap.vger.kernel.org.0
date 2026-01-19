Return-Path: <linux-omap+bounces-5550-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B0BFD39D31
	for <lists+linux-omap@lfdr.de>; Mon, 19 Jan 2026 04:42:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 319963026B36
	for <lists+linux-omap@lfdr.de>; Mon, 19 Jan 2026 03:40:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EBCF32C0F7A;
	Mon, 19 Jan 2026 03:40:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mmzItjhy"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49E9829D269
	for <linux-omap@vger.kernel.org>; Mon, 19 Jan 2026 03:40:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768794038; cv=none; b=GtWMaSulL/ge2mRz9l/69InCVsQ9sip8TdKGh9iZeEVHL2LJy+SfQh6yl7Y1H/2Nq+zphOcWfVMjNOHGw5x6vH3EwORQgYRjOY/JH6fESE3wm3QxwrqhosNC5fPeTAqMvilr9upxwJKJ5Yws0NGuulK9eRqQ3ckyFFzaKOKA2HA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768794038; c=relaxed/simple;
	bh=XPqSO6ltsflLuii08AxfHx9bR9Jyu12AqRI7lojBLBI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=o2JOQxho1bRRnw0UfFjfahYzuYz3H89cANgakJit1wXEF/08ZfQdcZQgo+qUlPhRmLODAYfWht3Byp2FUFhwEZJVUA3hYh6lQioApCvPLHh7ZkTauXheX8fdSHD03JCwV34mX0mGqOAHXuxMx0otkcjk3AdyNJJRZN0tAay7kWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mmzItjhy; arc=none smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-502a407dabaso22858461cf.0
        for <linux-omap@vger.kernel.org>; Sun, 18 Jan 2026 19:40:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768794030; x=1769398830; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KcbVa3268lyqxBGM305ylj+tBhZM3T/QjOKg0r4LL34=;
        b=mmzItjhyvmkqKzGaYgzWNYWCzDTF/QT3z8KZJD1EE5SbcusbqABMG+r1FY1Hqotvqq
         54V6hmnGKPbUjUcUe3FctA6lnvgP5SqpAXeNULrN1gUqnOXA9yn0Yw4uAw9+wlNTfh4y
         p37k16sk7Q0zwxkzUSPBXeCbqBJ/tmpgdDPz97dcGh/7TGnCiAwZ5AV3lm7kdp/eHhv8
         4Ip2QpZ0trZqIG59ex4WNV4nt/7hrLKVs6nGO03lgJ7PTYgLbMU2x5o18k68hg0pzvTb
         NG5HWGWc8FpIkf/7jo6rxfuoj9aWiZs7oGc1xS9dp0IRuScuyCCTQFeYe4K3dS7XV282
         DJqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768794030; x=1769398830;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KcbVa3268lyqxBGM305ylj+tBhZM3T/QjOKg0r4LL34=;
        b=Dx0SP8Wn5TVffYgoQifbuQwVt4v62B4Es0Hq/4QN81ApJYqw3n05fruELpMAIRogwI
         0VFc6dULmICTNwV5u0kTzy9BoMKW0V7/+F/T2qv+vTM27RRrEPwQ6rngrWb9tS0S4ATe
         37EcCk5YAVqmMEvoutNVD7rXqy+6MYYHtEJddeq5ff8iGzj6JUchJzKzspTyhig4eC/m
         MlNL7Bn9BRnxInYfD15uL2KbNByzompRCpMgGiK6+2Ht4ThpQlzKxq/s2MQVHxFqU7d9
         F6kkVhL4GUg7JPtgCOKc8wZo+J6sgr2HREfFIpVVM4wdJVMXa1WGH5tSCowiM2Dgy+EX
         4fOQ==
X-Gm-Message-State: AOJu0Yy0Av4CSNo4MmWIwAEdUC/lTxOS+vXJ70DTIHB+asgNRa3Nx/7m
	SHTAbVnoGYHKhQoZzDk0nKWCdyq3wC1K/J9Uq6Kd+gXNawX1hsSWgP+L
X-Gm-Gg: AY/fxX7NZZ2lKE4lyz81swAD2zTUk4tjnbPH6QDNagHtav+dAC8kQejZ0vQBWlwab/B
	nTEtX2FNsZrs5edRqyWlpo86PwwKKZmJFKTrBYqWaCOH4gvL+HxQAInRI3VgIXE/0J3KOQJt0Ec
	lT+Sp+OOEulakhwmQI1Qc94aHfZSALd/D7YYD0wlH9OqBPMgSof7Z8LeEQipdam0Si/HijmcLB6
	s3MhVuKhy1/NHRW0MVGw58B3J9ruhnScbQ3qB21cbIc7o0NsmW+l+Sz6fERXYh0Go18ZOURUknI
	s4tRG5bcxkG5iLgAz9qor97GjcnGsc5GK7RwW8Xczn6A4QFGfM8PKeGIT/EMF7mqy/ZwXKlNoz8
	c3xG9MCHgBu1GoQ3G0VRA98tfHeteQCrcdCmOG5ijD9O9GQdN8G1VfGb/UoP/J9gs+0F82KY7ho
	fBAhPKlDsiI2uEA/5GMogfrr6I4gWA4dlSoKEVBZbiQ/wk3APaQchlnPoZEOiWDT3jRCM=
X-Received: by 2002:ac8:5d05:0:b0:502:9f86:ca31 with SMTP id d75a77b69052e-502a16b3652mr167438321cf.52.1768794030529;
        Sun, 18 Jan 2026 19:40:30 -0800 (PST)
Received: from mighty.localdomain (nat-130-245-192-1.resnet.stonybrook.edu. [130.245.192.1])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-502a1f1b872sm64030801cf.31.2026.01.18.19.40.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Jan 2026 19:40:30 -0800 (PST)
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
Subject: 
Date: Sun, 18 Jan 2026 22:40:24 -0500
Message-ID: <20260119034025.58091-1-bavishimithil@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Subject: [PATCH v4 00/10] Initial support for Samsung Galaxy Tab 2 series

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

 .../devicetree/bindings/arm/ti/omap.yaml      |   2 +
 .../bindings/display/bridge/lvds-codec.yaml   |   1 +
 .../bindings/display/panel/panel-lvds.yaml    |   4 +
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 arch/arm/boot/dts/ti/omap/Makefile            |   2 +
 .../omap/omap4-samsung-espresso-common.dtsi   | 762 ++++++++++++++++++
 .../dts/ti/omap/omap4-samsung-espresso10.dts  | 104 +++
 .../dts/ti/omap/omap4-samsung-espresso7.dts   |  70 ++
 arch/arm/boot/dts/ti/omap/twl6032.dtsi        |  77 ++
 9 files changed, 1024 insertions(+)
 create mode 100644 arch/arm/boot/dts/ti/omap/omap4-samsung-espresso-common.dtsi
 create mode 100644 arch/arm/boot/dts/ti/omap/omap4-samsung-espresso10.dts
 create mode 100644 arch/arm/boot/dts/ti/omap/omap4-samsung-espresso7.dts
 create mode 100644 arch/arm/boot/dts/ti/omap/twl6032.dtsi

-- 
2.43.0


