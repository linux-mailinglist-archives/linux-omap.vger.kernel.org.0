Return-Path: <linux-omap+bounces-2537-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 44CA79B6EA7
	for <lists+linux-omap@lfdr.de>; Wed, 30 Oct 2024 22:19:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C9B1E1F22BFA
	for <lists+linux-omap@lfdr.de>; Wed, 30 Oct 2024 21:19:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E4B4217466;
	Wed, 30 Oct 2024 21:19:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="indP+n7R"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2B75217442;
	Wed, 30 Oct 2024 21:19:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730323150; cv=none; b=bUNfkgBFJskIiWr7WwaRi7BUvvkoI9HV+sWEp6scvKC3vCC492RASfGPRKiJtpNp7i7hSpF/3zcR6as/XHkLZPkOazSoG5nAW8R/0mmd5wn/LTlI5rxZd5JXarhlyZtE/7+3KtCmRsjFlUO+1M2vmS7zJuxC1QZq6F0GSFdpuvw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730323150; c=relaxed/simple;
	bh=ASnQfWhGcfluixKZ+CXRNl9M8Si/EyHIT7+tbfZQ8u8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Tqtrjf9DgrD4dvnWvuheKBg+gx8gd3hYGLI+phoP4sbqc0dombqdXpds1bZlvL4Mbs4unuR9OomVV2ZkhoiU4H1blGLLTm3M6NkpGPufjni8LXK7wyXBx6ItO+MWwhI9S8gSxdIUeFJlN+zXMwSVfpTKussQmcwr5OeksJq5wv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=indP+n7R; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-72061bfec2dso210055b3a.2;
        Wed, 30 Oct 2024 14:19:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730323148; x=1730927948; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M8fpizYtGh9tT80G0XW3N/kAr6EhOPXZluTz4nE7kk0=;
        b=indP+n7RJ3i70GHEen7CtWz14w1pOcXjDg8Eg+0rrdmp/TgWJ60sRAefP/scTl19bI
         6U3ThctCNR2qPnthM55cjgNg5vqnHckiGhRjEXq7WP3U4rL/YiwdAhEVFfBW+0brRvnu
         hNwjd2s2SNgrGvEHr1oAlLEZSMpKAbovJRc3+0+NToKqTNSNwz+0GFEsXp5aNsUX3PU/
         ebv6FRXekzjYslFBL0rHnhKV+Mu7dgA/Clfr0WXjQea0PXKfGF3aP1oYNL5knpnipX8K
         GYqj5WeSHmYb6w+a62iTgE95v0oD6ROreL7OKAfXCETUVpFocUdi3J6qufKlG9Iedo45
         ePmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730323148; x=1730927948;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M8fpizYtGh9tT80G0XW3N/kAr6EhOPXZluTz4nE7kk0=;
        b=pdOu3O63Ycey+TlcdxWSEURdQ3Ij/ctenkE+DMEZKOHFkwpUU5mX8o/EPZCSNoKSGN
         bdSUHWH/DGHrhMZbb2PGx8dvbiktcBqTWdk618juVJVUNLLSa1YjakGVC2jKHKZ2rd9e
         C9Wl/GlB6ZYIxG9CwUj8Wy7cFCDqj5uG0F+lHK3wHHzW+Jh0eUnUC/oVPqptQgukJIPw
         ij9Y96vQUH/g0x/rpGfRdIgDWXx7GEYbyAhBx5bLtJYDwbigLaSQ+bGYMhUi8MG/mjse
         9DRzl5pkgR7Q8Ypx2JHKjq5IcCRSwysIADwvYIn+1kdInCljX/eJ3LdgNYGNcs4cGSG0
         ksYA==
X-Forwarded-Encrypted: i=1; AJvYcCWVDgrlMDg75MYV0WKE2KepOQ5Fv6DxDrTczYLaBkurZrJLpPPB0cO56cvGPtADqM/cj89EJqY39zSYujr3upLP@vger.kernel.org, AJvYcCWkNwjWo4ctRuU/vQucrZwg2n1HsuD+nhc9IhW9iqSu5no8j0Z4pX/ompONWWYoGSyGjlVWTlgR5W5LRHyf@vger.kernel.org, AJvYcCX8/rNp8SKQBb7BhupFruloph0aeSwMH8ef9SnULPAiSAta1juaoKf77qbG5D2eGTQ4P/kVvw7PBvnT@vger.kernel.org
X-Gm-Message-State: AOJu0Yyhm3OQ2m/W4vigojTRhY5iUi0CinB2s7rY7P0PsChdiRekdo5C
	UJR6CNgF7N2NnOvh9nQGUk1eMPNL++UCHkzYZymEXztCWiVbG1jrC/hw4/3h
X-Google-Smtp-Source: AGHT+IERZrIKZyqkFf0FXk4VPc/cWLjvhfAn9G4pfCp7wzVCekNQtBO/FotkJjiOhQnDtFa5mONLfw==
X-Received: by 2002:a05:6a00:13a5:b0:71e:cd0:cc99 with SMTP id d2e1a72fcca58-72062f6143bmr27081997b3a.4.1730323147990;
        Wed, 30 Oct 2024 14:19:07 -0700 (PDT)
Received: from mighty.kangaroo-insen.ts.net ([120.88.183.142])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-720bc1b9daesm78938b3a.10.2024.10.30.14.19.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Oct 2024 14:19:07 -0700 (PDT)
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
Subject: [PATCH v2 4/6] arm/dts: Add initial support for Galaxy Tab 2 7.0
Date: Wed, 30 Oct 2024 21:18:44 +0000
Message-ID: <20241030211847.413-2-bavishimithil@gmail.com>
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

Create a device tree for the 3 inch variants (P3100, P3110, P3113)

Signed-off-by: Mithil Bavishi <bavishimithil@gmail.com>
---
 arch/arm/boot/dts/ti/omap/Makefile            |  1 +
 .../dts/ti/omap/omap4-samsung-espresso7.dts   | 70 +++++++++++++++++++
 2 files changed, 71 insertions(+)
 create mode 100644 arch/arm/boot/dts/ti/omap/omap4-samsung-espresso7.dts

diff --git a/arch/arm/boot/dts/ti/omap/Makefile b/arch/arm/boot/dts/ti/omap/Makefile
index 95c68135d..a5bbf4b34 100644
--- a/arch/arm/boot/dts/ti/omap/Makefile
+++ b/arch/arm/boot/dts/ti/omap/Makefile
@@ -76,6 +76,7 @@ dtb-$(CONFIG_ARCH_OMAP4) += \
 	omap4-panda.dtb \
 	omap4-panda-a4.dtb \
 	omap4-panda-es.dtb \
+	omap4-samsung-espresso7.dtb \
 	omap4-sdp.dtb \
 	omap4-sdp-es23plus.dtb \
 	omap4-var-dvk-om44.dtb \
diff --git a/arch/arm/boot/dts/ti/omap/omap4-samsung-espresso7.dts b/arch/arm/boot/dts/ti/omap/omap4-samsung-espresso7.dts
new file mode 100644
index 000000000..9049d412a
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
+		compatible = "panel-lvds";
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


