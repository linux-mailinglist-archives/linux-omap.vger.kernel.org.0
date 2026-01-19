Return-Path: <linux-omap+bounces-5551-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id DDB41D39D91
	for <lists+linux-omap@lfdr.de>; Mon, 19 Jan 2026 06:04:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5449E3006AAB
	for <lists+linux-omap@lfdr.de>; Mon, 19 Jan 2026 05:04:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C26F1267731;
	Mon, 19 Jan 2026 05:04:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kFIDMiNk"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D7971C3F36
	for <linux-omap@vger.kernel.org>; Mon, 19 Jan 2026 05:04:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768799078; cv=none; b=HDJvPFP4Dg9OytnFlFaaU2NflCapFkyfw14mCAuBZjWtxU9snKX1hyMLXxFAcZCTh5G43/im6VMwcUt+R6qpFaepOrtYJ1xrXGBrX1h5MErQPwK95VJ/im3WJJPiNQZy6+DP/7eYfy5raT9zxfsuUEbjvuKIKSh1HF4m5Q/A2oc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768799078; c=relaxed/simple;
	bh=XPqSO6ltsflLuii08AxfHx9bR9Jyu12AqRI7lojBLBI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QtI0ki0mEL4tVoM3YKveJP5Pj56STG8AEwLphyNkd0ZskJ8c7Qzb5yaPEIcxEdEl7Dih89v0RstDjKgkhrrw7635W+bh8Zm/WxCJFrRH1x0E7upjs+Qt9oPBnFfmbWW27GYIETkoXvEz+5VjKpS1utc/k5zv5M2JGx4qnsHje8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kFIDMiNk; arc=none smtp.client-ip=209.85.219.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-88a367a1dbbso64913686d6.0
        for <linux-omap@vger.kernel.org>; Sun, 18 Jan 2026 21:04:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768799076; x=1769403876; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KcbVa3268lyqxBGM305ylj+tBhZM3T/QjOKg0r4LL34=;
        b=kFIDMiNkAWMTfes52fOu5Rptf3eB1I1urspRtOoR1fZbzPXT4NZzMYO9aVFNWJydvp
         NAdQ3QF36sa7naqbGQrVYrHjr/+KusRZ/xIihBDnvYZKhX9rVw/vUM6OZHhROfGXc4FU
         o6j0Cs0vaeWsssSuYKm8dIq0EUyff5zKtfby1vBzQ3ynoUa1zlqb8DkzsU/+21uF9xsO
         sD9R+3sziNbRt4ssp6jYNWXCE89mzNRc2Qq/FsJ8+cTYcQimyzvqzxuut4IlWo2Hq2H/
         vOjY/d9/+8k9Hq+vpFD50GikAb/St/1jNvCq/Sb1i5R+r06MeTNxbL86ctFCqxqs1JOu
         Kg8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768799076; x=1769403876;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KcbVa3268lyqxBGM305ylj+tBhZM3T/QjOKg0r4LL34=;
        b=bXyfxD9iGifW2XoqG8fSGhmDh3h3Cq3B9AAlpVSkdbwM6Fo0FxpVhh31Kf+KB1ZDG1
         06OWEjnVlHsuUkVHlxumYGHOTNIutuNhpQewMtqzaXdXdyMJNlPJIovl0XNHM9cUH1YY
         Z/EpQpvladkAjMKgMBmqjOEC0fnJQ7BZlA+a0UlPJfA+HCzuXY9ufHV4shtetXCjiOWP
         HodYm/xfUUne8ZBxram2GNQ9yikqZro4xeANU3BBp9IBzVqOBBnG6VwEMStmJ1VfaVzJ
         deZhg3lE1kjZvT8SbtlkMpK04bUI/GDUGdlwBSwCq0CYtd6HzDmbfXSAc+aNid7Y5TbC
         TZ1w==
X-Gm-Message-State: AOJu0YzBHHam6NJ4JYIm9w3Mfg3axWNoBzW5e/n/NPv4W1s+awm0ggvb
	Z10O9YbK2EP8Icuj5HnZpKK/wJVP9l15f8I35e+1Ff/jKHDEtf/JTyKDKXukhQ==
X-Gm-Gg: AY/fxX5CH/LkWCRhFTbemy+G6MxeHaAVSg89b9ZNqlkF1U60RAHvzGs0OJ8fIwSj0St
	VWJTSPtR+uP4+rfIQIpHEw6qShrTxDhcbmrfzwuNvVLQdtE/pPWR/OhOYSdLiN0BWPvO001LLbD
	DxPeOL/YYDq7OBii0TRV6bVkAZGLz3f79YtJXV9J9KF5m/7dmIxXmSvqLIB9Gf9+jtAZDsmvcYP
	FdvhyUW9Yl6MOTPlXnWYiiS1GWpo9Kk8HluHZGnruF00b3u90AWZJ7kFDGyxt1JYzno/yhJB/5w
	GD0B3masYr0Oewe8G7FFnwHTJiubbOqJuFH65y03wBHynhYZ6kCLL+chjorOkADDH+z9ByL2MOj
	qt7KRi/VZ8oxnb5sHIYfMBT/kUyt4fNw43GdZQc1ezo7k6fwqdTIEVbvMo7shck3OJXm4qp4Gyt
	WiEjEVwVuOl6a4Ektt6tYLKoLAOMRHqkAK6LZrKY4osBCU6EXJfdtWQI5Gc6gFiubAz+k=
X-Received: by 2002:a05:620a:4490:b0:8c5:c9a0:ac28 with SMTP id af79cd13be357-8c6a68ea37dmr1331140285a.21.1768793442571;
        Sun, 18 Jan 2026 19:30:42 -0800 (PST)
Received: from mighty.localdomain (nat-130-245-192-1.resnet.stonybrook.edu. [130.245.192.1])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c6a71ab20dsm724706885a.5.2026.01.18.19.30.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Jan 2026 19:30:42 -0800 (PST)
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
Date: Sun, 18 Jan 2026 22:30:25 -0500
Message-ID: <20260119033035.57538-2-bavishimithil@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260119033035.57538-1-bavishimithil@gmail.com>
References: <20260119033035.57538-1-bavishimithil@gmail.com>
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


