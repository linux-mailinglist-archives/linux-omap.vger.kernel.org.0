Return-Path: <linux-omap+bounces-2539-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D78CB9B6EAB
	for <lists+linux-omap@lfdr.de>; Wed, 30 Oct 2024 22:19:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 395DC1C21A4A
	for <lists+linux-omap@lfdr.de>; Wed, 30 Oct 2024 21:19:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49A7321767E;
	Wed, 30 Oct 2024 21:19:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gQEqgKM2"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE268215C61;
	Wed, 30 Oct 2024 21:19:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730323161; cv=none; b=mIDzb91hpRNgu2nJi2CKO5jsgXAoTprU/V2YbgfwJOU4fheRVH527zqKo3nSbYnJEyZ3+JmS8mt3U/+zwSzBg2l7dM3Pix7Cp62AdC2pqIBTc8ghz9dp7UCb2Fu8OTiyBl+LAC7pC0Erxb8IrpiWHv6RmkPaz7QP/mkWw0vBUUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730323161; c=relaxed/simple;
	bh=wTU/dJPivbOsFpYSDPK48cktY0i2mPAvoAVqYXnzhDY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DN1gria8hqGKNq+xDErHMMFB1TfAn07C2wMREgudyK5vfpTPXPkqn/ztrBHBpUehMigDCqxPrrknMMAHBatB+WrwWB5u1WhjbLr3OWSiDkU0pVxkDN7ZMgExUA+lSLsuuxhjneYd2+YwfMLF79KRd7tskIeM75h9zjlCdOcFrPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gQEqgKM2; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-72097a5ca74so190360b3a.3;
        Wed, 30 Oct 2024 14:19:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730323157; x=1730927957; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=29WwabJL8OSNwQM5FZX4f7CZzZMK6XUSOfSBdSOfIyY=;
        b=gQEqgKM2SViCYucHPrW/NCAROJFX93skSclFZK+/CS0suw+7hSmTeheu+3s2m+uN3i
         B6kOsBeG2F9Rf6pnCZYB9RyWMjlfNOpDHkONK02JOERwcdtoe5kOaFs6Egs9ZM01oqRV
         vBHSy5IOutzXOXxtq09LGoI+iZPk6dhRQhfvn1TNKnr2abJgd/02LhLyvN6K53nS3oTk
         XaM7ZYLHs+Kk9FYFmy2AQH0v5LjVfxrPv4SC4IHhyy3LCpbREwk0OqdRwt1xGROYNS4D
         F/vn0Wpk26wjDHsF9l2da1jvpH12+NyN0kJI6wG3wNOJS3p5L4/Iv6ioymVURQc7frjQ
         lAfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730323157; x=1730927957;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=29WwabJL8OSNwQM5FZX4f7CZzZMK6XUSOfSBdSOfIyY=;
        b=tCOBuBKvi/hr+hxXTFmUaQ20AGLvwk2m47QYZqFlh/iCQgHaztpE3Kh3Pd5z/N9JLR
         9gEDu4WPpGqVLvQzTqTzED5bDNJDl8eSLX8ZyrgPuuBsF/yPBHfRB1jot8TCh0O+Y01k
         YIlPXrcyNdBHXi+6L8E9zbqjRzLKneSh8RTklTFHmbuPEIFANYuQx95EczFiSYtM+L2i
         f66iwwW6r1XQI0G4vpVf0COrmgtfzETBdnBPCd3QAVDTE2uxFplyp31LSxJnsSXG1x/6
         lEENlsJwjsuz57ZcDEwfvxAeKSecjsVOBDOXG9ASpkpI84Idm6VaQWIWdMLSg6uDNeYU
         Rkug==
X-Forwarded-Encrypted: i=1; AJvYcCURaTyasmS4vJLHRsiHTG4ztJtqY2V3VjRjVJl7lblvZd6G6UclBVEwjjh9NNi8waGw4EWY1I1LcVVMK1/LAwn3@vger.kernel.org, AJvYcCWazx0OKpZlYfmptLyHv3DE8ApFOD4/e6+y8w9lzo0BrVzBr/pX24ZV53y306s94NIR9eNeoy1i4+h7@vger.kernel.org, AJvYcCX5QlM3I1tpAwEffmNRvepv3WekH+3x9zNxRHbqsTv22nCO7DOWbDtTL52CT/xY6XsQCEXaDAQ0cKenuP3w@vger.kernel.org
X-Gm-Message-State: AOJu0YxTaBHm9RtJC4EotgHHAJkTDz2b1wQd6Wfhw0GKReY2IRVRj7TM
	Tob3vz+iTNytavlAf1Q05ai+uTwy7kr+XELzXWXGlcr70gLUsnYTbp+Z+wCs
X-Google-Smtp-Source: AGHT+IFT4Am1MAl5bfca5QJYxfGmgsNKER9x5AvUn4LGgFOdPHwuv8u9KQ0lml7dbE4H3gK6J1u1tw==
X-Received: by 2002:a05:6a00:8cf:b0:71e:452:13dc with SMTP id d2e1a72fcca58-72062fb8754mr22918677b3a.13.1730323157095;
        Wed, 30 Oct 2024 14:19:17 -0700 (PDT)
Received: from mighty.kangaroo-insen.ts.net ([120.88.183.142])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-720bc1b9daesm78938b3a.10.2024.10.30.14.19.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Oct 2024 14:19:16 -0700 (PDT)
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
Subject: [PATCH v2 6/6] arm/dts: Add initial support for Galaxy Tab 2 10.1
Date: Wed, 30 Oct 2024 21:18:46 +0000
Message-ID: <20241030211847.413-4-bavishimithil@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241030211847.413-1-bavishimithil@gmail.com>
References: <20241030211847.413-1-bavishimithil@gmail.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Create a device tree for the 10 inch variants (P5100, P5110, P5113)

Signed-off-by: Mithil Bavishi <bavishimithil@gmail.com>
---
 arch/arm/boot/dts/ti/omap/Makefile            |   1 +
 .../dts/ti/omap/omap4-samsung-espresso10.dts  | 102 ++++++++++++++++++
 2 files changed, 103 insertions(+)
 create mode 100644 arch/arm/boot/dts/ti/omap/omap4-samsung-espresso10.dts

diff --git a/arch/arm/boot/dts/ti/omap/Makefile b/arch/arm/boot/dts/ti/omap/Makefile
index a5bbf4b34..576a059de 100644
--- a/arch/arm/boot/dts/ti/omap/Makefile
+++ b/arch/arm/boot/dts/ti/omap/Makefile
@@ -77,6 +77,7 @@ dtb-$(CONFIG_ARCH_OMAP4) += \
 	omap4-panda-a4.dtb \
 	omap4-panda-es.dtb \
 	omap4-samsung-espresso7.dtb \
+	omap4-samsung-espresso10.dtb \
 	omap4-sdp.dtb \
 	omap4-sdp-es23plus.dtb \
 	omap4-var-dvk-om44.dtb \
diff --git a/arch/arm/boot/dts/ti/omap/omap4-samsung-espresso10.dts b/arch/arm/boot/dts/ti/omap/omap4-samsung-espresso10.dts
new file mode 100644
index 000000000..d0e240cf0
--- /dev/null
+++ b/arch/arm/boot/dts/ti/omap/omap4-samsung-espresso10.dts
@@ -0,0 +1,102 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/dts-v1/;
+
+#include "omap4-samsung-espresso-common.dtsi"
+#include <dt-bindings/power/summit,smb347-charger.h>
+/ {
+	model = "Samsung Galaxy Tab 2 (10 inch)";
+	compatible = "samsung,espresso10", "ti,omap4430", "ti,omap4";
+
+	i2c-gpio-5 {
+		smb347: charger@6 {
+			compatible = "summit,smb347";
+			reg = <0x6>; // 0x0C >> 1
+			iterrupt-parent = <&gpio2>;
+			interrupts = <0 IRQ_TYPE_EDGE_BOTH>;
+
+			summit,enable-usb-charging;
+			summit,enable-charge-control = <SMB3XX_CHG_ENABLE_SW>;
+			summit,chip-temperature-threshold-celsius = <120>;
+			summit,usb-current-limit-microamp = <1800000>;
+		};
+	};
+
+	backlight: backlight {
+		compatible = "pwm-backlight";
+		pinctrl-names = "default";
+		pinctrl-0 = <&backlight_pins>;
+		pwms = <&pwm10 0 1600 0>;
+		power-supply = <&reg_lcd>;
+		enable-gpios = <&gpio3 31 GPIO_ACTIVE_HIGH>;
+		brightness-levels = <0 4 8 16 32 64 128 255>;
+		default-brightness-level = <7>;
+	};
+
+	panel {
+		compatible = "panel-lvds";
+		power-supply = <&reg_lcd>;
+		width-mm = <223>;
+		height-mm = <125>;
+		data-mapping = "jeida-24";
+		backlight = <&backlight>;
+
+		panel-timing {
+			clock-frequency = <69818000>;
+
+			hback-porch = <64>;
+			hactive = <1280>;
+			hfront-porch = <16>;
+			hsync-len = <48>;
+
+			vback-porch = <11>;
+			vactive = <800>;
+			vfront-porch = <16>;
+			vsync-len = <3>;
+
+			hsync-active = <0>;
+			vsync-active = <0>;
+			de-active = <1>;
+			pixelclk-active = <1>;
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
+	touchscreen: synaptics-rmi4-i2c@20 {
+		compatible = "syna,rmi4-i2c";
+		reg = <0x20>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		interrupt-parent = <&gpio2>;
+		interrupts = <14 IRQ_TYPE_EDGE_FALLING>;
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&touch_pins>;
+
+		avdd-supply = <&reg_touch_ldo_en>;
+		vdd-supply = <&ldo6>;
+
+		syna,reset-delay-ms = <200>;
+		syna,startup-delay-ms = <200>;
+
+		touchscreen-size-x = <1279>;
+		touchscreen-size-y = <799>;
+
+		rmi4-f01@1 {
+			reg = <0x01>;
+			syna,nosleep-mode = <1>;
+		};
+
+		rmi4-f11@11 {
+			reg = <0x11>;
+			syna,sensor-type = <1>;
+		};
+	};
+};
-- 
2.43.0


