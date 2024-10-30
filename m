Return-Path: <linux-omap+bounces-2530-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B3D39B6D08
	for <lists+linux-omap@lfdr.de>; Wed, 30 Oct 2024 20:43:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2DD731C20B29
	for <lists+linux-omap@lfdr.de>; Wed, 30 Oct 2024 19:43:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 874C821502B;
	Wed, 30 Oct 2024 19:42:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="covp3PUV"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B4AB215010;
	Wed, 30 Oct 2024 19:42:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730317336; cv=none; b=GvczbfOmVD2o4a8Qo6UwkrTnUFtiRpIje7Rel+3iiERj2dxcLk/Dy6OErRY3pKsJlaKOs6rF6rIc4BX75KCxcPGCLs7XB/I9WwM6jveX80Q2MkRJ91ioIGKlplBw2MtdWQc2MNkzFW+TDDybbYLqFbdIxjZdkmO7H52dGr8SWnc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730317336; c=relaxed/simple;
	bh=oBPCzUY26BxZoDtjqdlImdRYlvQIrMQFMccQpfP/gHE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=W5SwmDyGGlYJ2cFdFHsRW5kKdCJnYXykXhKgMxq/U2X4fHrzpquGcsH30i5D3lornuUuUF+3FNLX9aUqs7aMPICeAXQ4fE0u9XH2Ypcf6/qEmyjAKu3EewqPg19OdmArDsbzUWbr3Cz7Aen38sGSiV8DboPBv54tzdPKK4PLn7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=covp3PUV; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-71e983487a1so141883b3a.2;
        Wed, 30 Oct 2024 12:42:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730317333; x=1730922133; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=en2zNFTs0cWjZaCeymxYV+ZMbz2+AnDSeuS+py13v5Q=;
        b=covp3PUVb1N61RzAQMgMqUmpF2ccAfZcHABkLUhSffDO/69xkWlaG5tFUitRKJr3tH
         KoDgOe+HMKnf9gkrwyStAZcTUMZ/pRgm+7l66JNaPdOqXN3tXRwWtAE3SSuP2eylz9ga
         GM0Q62icCbffWdSezpKHOQL1m01rZlP+JBeiNe7x46V+OaTpjzZcOoVGUH9lZ4A4NJzM
         SK6Jg1e9b4oek5AWeRUIy3VZrvK2ugJ9gBw8gwRJF+k8wnQQrUBlPeiNcUWyqPhoapIx
         WGeIDyTyIuALjQGLA4q1nfdrYWmT4UcNVO3ZPJxt2Eiz6YxtNFKW8N53xnn6HPxiNi9t
         GBsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730317333; x=1730922133;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=en2zNFTs0cWjZaCeymxYV+ZMbz2+AnDSeuS+py13v5Q=;
        b=Q6xkxLgZTP4BEv1omyoB817n8dk83KQPF7Uhg+mj5NP+/Sdphlmyt47ilQHxcdhz0a
         8V91otEGWmUfvOET1AF3m9cdDJYxoGZ2If2X47NIqg8rJQbYXjiEUqsAhGu2VApW4nKQ
         Q74p3D5kCjlpo3iIfSusZuNqReyHqmESz8TuHNhxUquX8Rwi4mkavbzo19g4B4E9SqQN
         8OIejG6gXTHjwWW959ZeOiHpjNTdlTYLYxI4Q4wVlzhSh+VWsHNousZaV8lzzgJ2dmqz
         ls5iXtmMZqFnLZQtSwNG8HCR3kI9djziEOp/L2WENJ75QghcIHSs1pBobApwMEWNaqqS
         DpJA==
X-Forwarded-Encrypted: i=1; AJvYcCUu8ko8gp3O1y9S6rnhjW6jX3WwQILVnMW8teHjNloFG3CeJau0oYo+cEfKxXPokNaXwDUwW/KGANCFxPjb@vger.kernel.org, AJvYcCV4acj3/fJJEYcN084sD9vStXTAlCODMRk+FXGu/Gj3h2XZi0jqUvuGd47hkthkI70za1xF6xNRdt88Ci1GCvL8@vger.kernel.org, AJvYcCXAVAE5ZdLRhseTN4tB5TM1u3SipzwN7LaTquiPkXahQBejIpF9/cuu6yoS6L6YpjOVAUUlSoXOSjzZ@vger.kernel.org
X-Gm-Message-State: AOJu0YxBlVVNIPo496JcPWi+TAaVczJBsFJzeltq2tiBZTlsgyXu65do
	Q+gSuKRUn7W7KKYtNFPvvcWds2bzbIZQQ5nJN4iukd4vKzaM72Ut
X-Google-Smtp-Source: AGHT+IFsA6fTzRreOO77OCCxSIVEJVvEaK4ZavzYCXlWT3ASn6aRHtxIh7Q2mPZYFnY97LHyeE/QDw==
X-Received: by 2002:a05:6a00:3d56:b0:71e:5d1d:1aaf with SMTP id d2e1a72fcca58-720b9de1421mr1125963b3a.23.1730317333430;
        Wed, 30 Oct 2024 12:42:13 -0700 (PDT)
Received: from mighty.kangaroo-insen.ts.net ([120.88.183.142])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7edc8495cabsm9661839a12.0.2024.10.30.12.42.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Oct 2024 12:42:12 -0700 (PDT)
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
Subject: [PATCH v1 6/6] arm/dts: Add initial support for Galaxy Tab 2 10.1
Date: Wed, 30 Oct 2024 19:41:36 +0000
Message-ID: <20241030194136.297648-7-bavishimithil@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241030194136.297648-1-bavishimithil@gmail.com>
References: <20241030194136.297648-1-bavishimithil@gmail.com>
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
index 000000000..c7f99cd65
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
+		vdd-supply = <&vcxio>;
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


