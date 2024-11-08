Return-Path: <linux-omap+bounces-2634-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B0F8F9C2633
	for <lists+linux-omap@lfdr.de>; Fri,  8 Nov 2024 21:07:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3FCDB1F2285D
	for <lists+linux-omap@lfdr.de>; Fri,  8 Nov 2024 20:07:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE3211C1F24;
	Fri,  8 Nov 2024 20:05:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JEXWr62m"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2569120DD40;
	Fri,  8 Nov 2024 20:05:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731096359; cv=none; b=YnrTNMNq0rkoRsxVTtriWJ3deYKqyHfghk0va4m7AcFJK6qJ6KMAswAcZyX+7RN08fLS8yQ72lYtbQsvjKsk9T/GoguQWu7TCYLZwCPn6yf7t+IE6ob5ib0wbzwMruPP2VUzjyiUbqnTkUetSH5tN83vvanpEfwzzOe2O+KUD1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731096359; c=relaxed/simple;
	bh=BwbyZLKTPDpJy3+FTN3EYYNw+5ylyyGLfpuHSbYjs6c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Vz6RLOGHWMONPRknNr3lya6GXqtG7l+hFjKDsOsvK4cSEO9/4nNR8uS15/g7gS7FXvXED22yWhnYc7mtljQXihnDcerpS1j0XcGvlzdby0Le5qfvg+8TrL1ldw5vlllgLmXGuM7oIhvhW+NLItTCUq0oDtGikjIAqBiAzMCo5Po=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JEXWr62m; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-71e5130832aso2075909b3a.0;
        Fri, 08 Nov 2024 12:05:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731096357; x=1731701157; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JgiTsskyfRZ9Ja75xsEEkSONh3g+5soO7swRS9wzZqs=;
        b=JEXWr62mMaob78itLE/QXsXGTcVV3CUPCyh7VZZsp91e+sPveLhBRCqWFnqT/cl9fm
         xBUcqsGWJER+UgUvGrnfjSEtFd2xX61MtThcaud/tZVYYbUuTObrksFvC42ZtqKt7MQT
         Zzj+ghpfY165Ox4B/slWrWWb5a2fDtY4ZCkDeL77b8+hilVdhGHQzh1WDtPsEfO5GVyG
         RdNekc15Jk72rAI9GE3WwsAhClZPS7DXUAyy0EKvcHmZXUPaJB6expYTuyaqIJ8Znhgy
         6eeFdIohF85nbJZmVwBl/93Nh0xrNVEOcdyQ51d0vseszoDuzddr5leJX5ButZ8kWgWz
         Q0lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731096357; x=1731701157;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JgiTsskyfRZ9Ja75xsEEkSONh3g+5soO7swRS9wzZqs=;
        b=WwhMh2gT7Vy+1WI8ACfZ1TiuX0+xm6lvoFnwkIzx0SI7YEIv/aDcS0I7hYEn71uT1J
         i0WOGh1if5DWamv9kwvtpSklHAhlNrNFwGRanXbdFYc6lusAQzBKipkFg3Pq0y1ca7Z0
         W2LrVselDmRa/Vjf4HBdIQafR3eMbv73kA4z7Gyz3BZPOQr+61YsjL8Y/OE7x5Teh0mj
         41UYV7CEk1w+zelP8osn2rvowYB0zVufXFFjPvotLQVgoJpSo7+yXL1QWRsNSWudVIJY
         dW89Dxif5cHtInmEoOMTY1xI2Hxovg7lHYiv2niKMe4NDF5T7Q2xFm440+UgWf+EkdSj
         gcZA==
X-Forwarded-Encrypted: i=1; AJvYcCVv5DtiapRCfZKjCeZlLf/LgnWQmeohrt1TQIqcvtTAccFd2fvPtm54Js+SdRN2vLsV5gQOR14qozrT@vger.kernel.org, AJvYcCXQ3lEsWp1CDdz8P9fXLDSAjUS1S9JWuUIczfTDoeUvi4QEJoDyZrKqS9m+/ln1YFVfutLU+x9C78Fxc1af@vger.kernel.org, AJvYcCXpjrwEOyXSsCeawKACZxWAkg0laXbsFRz3a460VCwdnw7RH9H09kSvSSG7TH/mg9OcZmXrGcnPTYc6VGWLPOZj@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8ZuzyOTK9KotVwdUMtZDvhGgKM91ZQ4cM8mwcchwurv8QcDWO
	3F9QkIP5QximSzoAmOL8sb7aVN//g7mvQ67MOgk8Ag8x4MfxK4Uh
X-Google-Smtp-Source: AGHT+IGjDk/AgzVKM2Soq57Du52rPokk3kN+KOkNGWWZXeIgPxQKurnk5CoHUPdkdAuW1IwIY/ZWhA==
X-Received: by 2002:a05:6a00:1744:b0:71d:f64d:ec60 with SMTP id d2e1a72fcca58-72413297242mr6023442b3a.7.1731096357381;
        Fri, 08 Nov 2024 12:05:57 -0800 (PST)
Received: from mighty.kangaroo-insen.ts.net ([120.88.183.182])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72407a56a30sm4323418b3a.188.2024.11.08.12.05.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Nov 2024 12:05:56 -0800 (PST)
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
Subject: [PATCH v3 08/10] ARM: dts: ti: omap: samsung-espresso7: Add initial support for Galaxy Tab 2 7.0
Date: Fri,  8 Nov 2024 20:04:37 +0000
Message-ID: <20241108200440.7562-9-bavishimithil@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241108200440.7562-1-bavishimithil@gmail.com>
References: <20241108200440.7562-1-bavishimithil@gmail.com>
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
 .../dts/ti/omap/omap4-samsung-espresso7.dts   | 70 +++++++++++++++++++
 1 file changed, 70 insertions(+)
 create mode 100644 arch/arm/boot/dts/ti/omap/omap4-samsung-espresso7.dts

diff --git a/arch/arm/boot/dts/ti/omap/omap4-samsung-espresso7.dts b/arch/arm/boot/dts/ti/omap/omap4-samsung-espresso7.dts
new file mode 100644
index 000000000..be3d7a82f
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
+		touchscreen-size-x = <1023>;
+		touchscreen-size-y = <599>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&touch_pins>;
+		avdd-supply = <&reg_touch_ldo_en>;
+		vdd-supply = <&ldo6>;
+	};
+};
-- 
2.43.0


