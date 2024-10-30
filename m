Return-Path: <linux-omap+bounces-2528-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AB7E99B6D02
	for <lists+linux-omap@lfdr.de>; Wed, 30 Oct 2024 20:42:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6BA78282663
	for <lists+linux-omap@lfdr.de>; Wed, 30 Oct 2024 19:42:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B662C1F4738;
	Wed, 30 Oct 2024 19:42:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WpYTJ1x0"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6709C1EC016;
	Wed, 30 Oct 2024 19:42:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730317327; cv=none; b=cqH2abH5zSipxdVoCBQiDvjuuYczDcR0M1v4T7l74ii5pGTZCrKnAc1BLRnOkZZHysAa7d0PxqFL9pl7naRwSAIvG4OlPmWwuHkXWxUSo21Ji3YjHWYvFptqfigyXeqbO9EbnhlcnIZ80B7t5SoNIYDacFn1cyYPy3fsHCfhavM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730317327; c=relaxed/simple;
	bh=nNB6ViXWbWeqUxx3BYePaMTFx2WPOHtN3KBMbC8bLOQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IeYjr+DzNSYbUMaU7q4ska0l5xLqWl7WxQ1l1szAsWoKDg2+3je04JL4kn09ubhdvMjGRD1ZEc9ttHY2ia/AdEGUR0CvrAWCZTB5jZY+OpkmGnnxZD4dg/yv1b65t/TPy3DeMfhOijb77wU89n6R298PUskX16ROyL58yBeKmkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WpYTJ1x0; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-720b173a9ebso157469b3a.0;
        Wed, 30 Oct 2024 12:42:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730317325; x=1730922125; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5ZnxMxZ2ydRZyNJhBjiB37HobtxTo8sezt3QKcDThbY=;
        b=WpYTJ1x0UHkZbuaPxGMzEgEEAKkbqxcvkKdzx/2J/CRZQXTJxew/7LpQxhAnmKPtVF
         wfhbUIiz9V5ycBw84Kb8qb8QpZB2ky/oZfWdmPnFFUHED19BljzO/3AIgc19jcgxUJhl
         eLCor+pUJyNG0RXvcVFISxPaQmOIBe9Vq/qp19EzYH4u46Uo5lPwkxaDMeKTiPROC/uC
         B8W9I/XoKKkQx3ekDYOnG0CTSQIbNHzvsqmb4J/N2fGLvcC8N9cdLPinljqPzlYH5CmK
         BJ+VtRUY72LsMJqXEnFPs5GV3XzhK2JyGbwsWpeStvYwE5k526327iPEdtJ3NWDUB7TO
         rytw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730317325; x=1730922125;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5ZnxMxZ2ydRZyNJhBjiB37HobtxTo8sezt3QKcDThbY=;
        b=rA4U5idOqPnIgDJpDSII7tGQmVu75qupGM7d4ghQ3+o9mtCwqXg+t4fc+UPlGJWcuV
         C9i+yni4R6GLKNK/iHBAhM92OEV9goWZHdgjvFRuucffpQ3U6HKjH227K69GMRZ0eO2b
         Nu2aZ8I86XJDzBagTl+3LReqymrdyyD3bY5ykn1AAP130TnePttSSwoyniFMT22SRbz/
         1fAPHgASlr8KgUxcN1JozFPKqA1wGURirxzLzlYMQrZmWyBE9ItGjr0/P6Yy8ttgLm6a
         TXtAuII5/g0p9e3JT7nY26/uaoGZDDkOR627yM3Ab81dtRwfi3WU0x5lznpC9kwfvkZs
         0gmQ==
X-Forwarded-Encrypted: i=1; AJvYcCUf1qwCCHEfagkt8dJpERl6avxVkac1hL8k9rlykBw3fCoPLoac8c2OFjwP463EhdZJQ9PXtnVrPKEc8J71@vger.kernel.org, AJvYcCV3CfkTtnycB083G0MEbam1f6CDh3U7BMvTviF/Mp1Sk6WnySgHXmN9f3u4GAfnDeBox4CjegYBGMtN@vger.kernel.org, AJvYcCVeXeQxbEQ2BjkobcBby4HcF+YiVYutYcmCcXVajTO1LDOyIZHcitBAx4fAzXqGmwjka2l5nk73RtUawFcYvAww@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4E1o8qygc8+8HEo/lc9E+B4errtsfRfcATy7Vkgph9MP6dS+6
	vvGJoPsixjBQS+2k5VMmSQXXSQ6JzQdhjAT8XJ9gnSX/NT845xAb
X-Google-Smtp-Source: AGHT+IH0QekuvHU51cxdN1F7qbKOFyhvHuY6RVatfv0TZ7kOWM1RFR4GPy9h1mQkS/JD+E1gLouy0Q==
X-Received: by 2002:a05:6a00:148f:b0:71e:4296:2e with SMTP id d2e1a72fcca58-720b9c942damr688663b3a.11.1730317324518;
        Wed, 30 Oct 2024 12:42:04 -0700 (PDT)
Received: from mighty.kangaroo-insen.ts.net ([120.88.183.142])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7edc8495cabsm9661839a12.0.2024.10.30.12.42.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Oct 2024 12:42:04 -0700 (PDT)
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
Subject: [PATCH v1 4/6] arm/dts: Add initial support for Galaxy Tab 2 7.0
Date: Wed, 30 Oct 2024 19:41:34 +0000
Message-ID: <20241030194136.297648-5-bavishimithil@gmail.com>
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
index 000000000..1aa18261f
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
+		vdd-supply = <&vcxio>;
+	};
+};
-- 
2.43.0


