Return-Path: <linux-omap+bounces-5547-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 152CBD39CFD
	for <lists+linux-omap@lfdr.de>; Mon, 19 Jan 2026 04:31:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 138963008CBE
	for <lists+linux-omap@lfdr.de>; Mon, 19 Jan 2026 03:31:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF08C28D8F1;
	Mon, 19 Jan 2026 03:30:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PYLXv4AW"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 913A528B407
	for <linux-omap@vger.kernel.org>; Mon, 19 Jan 2026 03:30:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768793458; cv=none; b=R2Ec8FeaWR8gW4PBATLvPEMqerOBcbQYLqPyI10Tx3eq3MAz3S1qitrKMzeWTXor2iUNlGcaXdvNpnKr6YMSiPMTZp2jN3Fp9LrQ/2T9+KNZTCrNHM0oCNe7+PAwMViLs86lL7j2Q2NTgahD9jwCZzYnOsSQ0aqob0riqxesEpk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768793458; c=relaxed/simple;
	bh=S2kYng34pyN/wX/EOplOpxbzEXHZ5N9BsJv+d0hNUBU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fxNAbUWmxqGRhEPRTj4EmnO5fmnHDZ2oNsCLOtiIKji9W9eUthMGl+Ke8W0pGAMFHFP1e5f9gCeoEGG+tH6Df5hmVULPsvmTPK7f4pO332AC51fVDe9yLHu0KNdXyPqFmzn9noNBQgMBsS8hHDD0ExpNoVNUpJ0cC27vWBXQIWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PYLXv4AW; arc=none smtp.client-ip=209.85.222.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-8c6a50c17fdso298385385a.2
        for <linux-omap@vger.kernel.org>; Sun, 18 Jan 2026 19:30:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768793454; x=1769398254; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dfxr03p7S9Rer87uRm31FU2g8xU+t3fSe3azXAHj5IA=;
        b=PYLXv4AWnxww6O3KEhieWpki85vDCR0blYxiX31eRJPcbQKOPxpOXTys74fKn5F3Ld
         gpNYmvzAD+WoCd6Yvv6m4uh+lr+qRgUBcWvUIERmUrNB3dJNgPn7wWnLFmE0DUpC52eg
         fTwE9xIseUX/8KZQGF9CbS7AXykC/ebnPxhohR5ZTWqeX4dyEkRo7o463KAkH4FNNCQ9
         SZEA/AVrmI9TQAgcId7oiQ1UVYIBuNwD4JVPb8GpOoTXvR/e/uOz3uXTyj1SbOQ7Zbtr
         Nfro9QUjWPCTLrKrvG54BA1dknM1hwKcb2OpqbL0ZMgsZ1D3EQWUezWxQzEHeSK+x0Ek
         /G7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768793454; x=1769398254;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dfxr03p7S9Rer87uRm31FU2g8xU+t3fSe3azXAHj5IA=;
        b=MO/xcCsl2V/kRcYlyK/RRSSGHVDk4qM9h22koSPoypckg1ZIxIYMvXfXEXReM8Whw9
         VF+B0D2fV84wXlpq7Bm5zp+Dh+n419gSTr7qBC0rBYWY18Sk4/3ef72F59KyFso+mqr2
         qDf5dMvaQNytTOPbS8scP8iNuljF1Unx3jdBUEpulyG2uppwBYQ/XHWkzOk8CLtRWtIM
         gPQESGgI+hKECeryHH72UU33zUsAyQqQ4soW4IIM4p/5lZEPz+Sm8+rATkw51xZ3TYsx
         zce6PghgqR6dW2UkK/EL2Csek19jBLZn1IogYaoECIJ1SRFDiorfrV+/PsJbfsODV0da
         ZMmQ==
X-Gm-Message-State: AOJu0YxF9FctlBZlyvh8nT9w/QtjSQ6XgqO1URTD4j2/9LP1Ag2aVVhq
	Mx+v6VN4jEBh2LccM8nQZx/ZXrujNjMP5maJMClPL4d2j7jZ6kTt42sc
X-Gm-Gg: AY/fxX6VXR4goifdxPPJeiExNeTXcUjTi8jnC1AEZuwO0vw4b5OgP0Qs/1xCb03oZNO
	ZW0+Z9M22jNLyxOvrjXQ9LM7dAEMJiigfo3cG2wtxLLs0VF2sqa40syiHVJMBqqAG0S+OjZXcAU
	A8pSba08JxUU6fqYRNnIe4DJpKYLHGvp2e6aeq6z0+abU3+p4Ug9pUfOSpkDtvT/DHQ2rFEAlkL
	ryGkpQzV5z2j5LBJizo7dt15hqtzT8jMjYEVhnrZxbnwtnOUZmW/XJ86VfnwbhpnBgSI18X++9I
	wLEO1hSwPsdyTe5YRcJIUDEftGn2m8K+aiS4V+sYurSsZJSZonko1d1frcIUYJv/JLgOA02giUs
	Snkdu1STnJsry4ZSZCCfDiF/uuBfct1jH1TNW2bbfAXCmumGFz13mJKa26KPBj3oHXGuABrhuSQ
	oMP7BMFMMtfLLqCqM7WsAJlRkKiAYgNpuhasFOV6pcCMkH6jyoJjhP4zMwPVToefymQCg=
X-Received: by 2002:a05:620a:29d3:b0:8b2:e513:6419 with SMTP id af79cd13be357-8c6a693b0d2mr1393824685a.48.1768793454390;
        Sun, 18 Jan 2026 19:30:54 -0800 (PST)
Received: from mighty.localdomain (nat-130-245-192-1.resnet.stonybrook.edu. [130.245.192.1])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c6a71ab20dsm724706885a.5.2026.01.18.19.30.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Jan 2026 19:30:53 -0800 (PST)
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
Subject: [PATCH v4 08/10] ARM: dts: ti: omap: samsung-espresso7: Add initial support for Galaxy Tab 2 7.0
Date: Sun, 18 Jan 2026 22:30:33 -0500
Message-ID: <20260119033035.57538-10-bavishimithil@gmail.com>
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

Create a device tree for the 7 inch variants (P3100, P3110, P3113)

Signed-off-by: Mithil Bavishi <bavishimithil@gmail.com>
---
 arch/arm/boot/dts/ti/omap/Makefile            |  1 +
 .../dts/ti/omap/omap4-samsung-espresso7.dts   | 70 +++++++++++++++++++
 2 files changed, 71 insertions(+)
 create mode 100644 arch/arm/boot/dts/ti/omap/omap4-samsung-espresso7.dts

diff --git a/arch/arm/boot/dts/ti/omap/Makefile b/arch/arm/boot/dts/ti/omap/Makefile
index 14e500846..d24f13efd 100644
--- a/arch/arm/boot/dts/ti/omap/Makefile
+++ b/arch/arm/boot/dts/ti/omap/Makefile
@@ -80,6 +80,7 @@ dtb-$(CONFIG_ARCH_OMAP4) += \
 	omap4-sdp-es23plus.dtb \
 	omap4-var-dvk-om44.dtb \
 	omap4-var-stk-om44.dtb \
+	omap4-samsung-espresso7.dtb \
 	omap4-xyboard-mz609.dtb \
 	omap4-xyboard-mz617.dtb
 dtb-$(CONFIG_SOC_AM33XX) += \
diff --git a/arch/arm/boot/dts/ti/omap/omap4-samsung-espresso7.dts b/arch/arm/boot/dts/ti/omap/omap4-samsung-espresso7.dts
new file mode 100644
index 000000000..cae37ff06
--- /dev/null
+++ b/arch/arm/boot/dts/ti/omap/omap4-samsung-espresso7.dts
@@ -0,0 +1,70 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/dts-v1/;
+
+#include "omap4-samsung-espresso-common.dtsi"
+
+/ {
+	model = "Samsung Galaxy Tab 2 (7 inch)";
+	compatible = "samsung,espresso7", "ti,omap4430", "ti,omap4";
+
+	backlight: backlight {
+		compatible = "pwm-backlight";
+		pinctrl-names = "default";
+		pinctrl-0 = <&backlight_pins>;
+		pwms = <&pwm10 0 1200 0>;
+		power-supply = <&reg_lcd>;
+		enable-gpios = <&gpio3 31 GPIO_ACTIVE_HIGH>;
+		brightness-levels = <0 4 8 16 32 64 128 255>;
+		default-brightness-level = <2>;
+	};
+
+	panel {
+		compatible = "samsung,ltn070nl01", "panel-lvds";
+		power-supply = <&reg_lcd>;
+		width-mm = <154>;
+		height-mm = <90>;
+		data-mapping = "vesa-24";
+		backlight = <&backlight>;
+
+		panel-timing {
+			clock-frequency = <47255554>;
+
+			hback-porch = <210>;
+			hactive = <1024>;
+			hfront-porch = <186>;
+			hsync-len = <50>;
+
+			vback-porch = <11>;
+			vactive = <600>;
+			vfront-porch = <24>;
+			vsync-len = <10>;
+
+			hsync-active = <0>;
+			vsync-active = <0>;
+			de-active = <1>;
+			pixelclk-active = <1>;
+			syncclk-active = <0>;
+		};
+
+		port {
+			panel_in: endpoint {
+				remote-endpoint = <&bridge_out>;
+			};
+		};
+	};
+};
+
+&i2c3 {
+	touchscreen@48 {
+		compatible = "melfas,mms136";
+		reg = <0x48>;
+		interrupt-parent = <&gpio2>;
+		interrupts = <14 IRQ_TYPE_EDGE_FALLING>;
+		touchscreen-size-x = <1024>;
+		touchscreen-size-y = <600>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&touch_pins>;
+		avdd-supply = <&reg_touch_ldo_en>;
+		vdd-supply = <&ldo6>;
+	};
+};
-- 
2.43.0


