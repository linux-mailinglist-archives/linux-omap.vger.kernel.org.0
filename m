Return-Path: <linux-omap+bounces-2636-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CB079C263C
	for <lists+linux-omap@lfdr.de>; Fri,  8 Nov 2024 21:08:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B3F4EB2360F
	for <lists+linux-omap@lfdr.de>; Fri,  8 Nov 2024 20:08:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 219341C3316;
	Fri,  8 Nov 2024 20:06:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mbl23+1r"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47C831F26CC;
	Fri,  8 Nov 2024 20:06:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731096374; cv=none; b=W4D/ht0wmr4Tm2DblcBJsZTvCyUK8Vs3sg1JnOp8wC6Vc9YQdib57in52d4dObNXLlMeDoR1fedI6ensrtD9Zqwh5pICjDjVsea5bLsVx4DyKMSaLYre74+LRNdWgYWzSZKifFPXiiZUrkmFzSxXl6swj/8FrMHaQebsskjBL9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731096374; c=relaxed/simple;
	bh=NzdEgMADxOb7swHOQ+PPR8bxpBS6jH60Rb6WdCmK4cw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EqTDQocPOFMe5RTQMNFbU07TEUJBs1CP9qaBygvPpV6qNFS6ojQQNfoRlGwp4LG6VN1GUGNoBZ0pzn083nCtY8aKbNSf3PW9/o8RdGY7hkpyAF6xyp6G21mrlDV6XJg8YracJS0HUamXlbaAQPWtxVZWBvaot0LCgja+2ZM0Bl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mbl23+1r; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-72410cc7be9so1772380b3a.0;
        Fri, 08 Nov 2024 12:06:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731096373; x=1731701173; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e+pxJEv6PwGkDmgf7vlb0xaf/TsB7THqnGutHjf9Yl8=;
        b=mbl23+1rw+8ijRg5ZKBNHyk4kRRUijcsq8mBDLT4Me5pPrah/mkbyUJX8Bwl4f5tG6
         FaHFymLG2eKzH8V0sqpn7uuToLfYCbpoRQJRLo3XRwlklb2zNDnvioEZwTAInaL9Sdoq
         s3S9GUlaiN3b4wcmncB9L83RqjlzTwv8cePXCbUyij1p4N0hPT8i7th01bPrVC7qWIqM
         Kbly6hN+xpClxIoXk0RxajeyE2u1SbDCMXuWYzhQtmM+a2vrCF7IbCKTVwhIJC2bUOx+
         PrJKpbUhdhrio42f6NT/gqSvePZZjXFmAWUiiVPmrerCCknexIHB1JLuTmtHuvKRkr7h
         N+Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731096373; x=1731701173;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e+pxJEv6PwGkDmgf7vlb0xaf/TsB7THqnGutHjf9Yl8=;
        b=Kt5DS1k0JIxjni36AnXjGdr87QdhXeHP1gDAaPMDXizql2hif4kiCeC1adt2hGoaVk
         kiH5Cl+k7+RxTxmGaoqKDXbzTe0Aqm8gEC4hscGHZOTTiyOpOlwfPoQWofZX/yidfF0p
         KUqJEG9xf7oee7wA6M5hMLfK8pYszRzVpMGwB7ZJ7il1sOZGtY61A8p1M7/xO/aHMx1y
         vHzyHUjjaGdcZwf50+gERjFdpuGTiHYNsiPCw7zjTwiUHE4Br72fBOUSJfzkqhKfZbh3
         VGaIMYQtAj6T9LhFjLMbl+fTQQClmDOnY38JipA4O54r5kqhqRJYQnjG8+8S0uMBzbkM
         uz5Q==
X-Forwarded-Encrypted: i=1; AJvYcCUoST+l0cYnaON8JO8BVN/hz8AU2dil/HDdTI8AVRv6PUtMO+c+4aP5JeYyJUpg9Fh6Ev3PvvgJziDkKtqTnAhB@vger.kernel.org, AJvYcCXFUMcQvlSHONfnhJjzJkDvGxWCAUyMdsHC/MBqmlhmF98vgz3ZjHWkICKV+c244RLpNx+/fDx54InfDlM5@vger.kernel.org, AJvYcCXPfCBvoJI4zJm+fCWrHMMZrtdK9oA01e4S2aTfAvRn+mrHIPY+LX4uQks6vCLMB5u/PfqNCL3n5ZT5@vger.kernel.org
X-Gm-Message-State: AOJu0Yx57qAHbPoNYY18fxyMvueJ3of8FCgCpP46ilV4Ns1IrqusNDeu
	Hdo/uKLFqarkOmzOI/LNjNA/Zw05G29ob9HbG7hdFVAM318oWwi8
X-Google-Smtp-Source: AGHT+IFwHvYMTTEotxw6SwVshq1ogJkCQXDcpNbNEFSr+fROy51ZN1A2AXf0NpMGBrlyOm6+qYerlg==
X-Received: by 2002:a05:6a20:7faa:b0:1d0:2531:b2b9 with SMTP id adf61e73a8af0-1dc22b00bd8mr5826318637.36.1731096372599;
        Fri, 08 Nov 2024 12:06:12 -0800 (PST)
Received: from mighty.kangaroo-insen.ts.net ([120.88.183.182])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72407a56a30sm4323418b3a.188.2024.11.08.12.06.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Nov 2024 12:06:12 -0800 (PST)
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
Subject: [PATCH v3 10/10] ARM: dts: ti: omap: samsung-espresso10: Add initial support for Galaxy Tab 2 10.1
Date: Fri,  8 Nov 2024 20:04:39 +0000
Message-ID: <20241108200440.7562-11-bavishimithil@gmail.com>
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

Create a device tree for the 10 inch variants (P5100, P5110, P5113)

Signed-off-by: Mithil Bavishi <bavishimithil@gmail.com>
---
 .../dts/ti/omap/omap4-samsung-espresso10.dts  | 102 ++++++++++++++++++
 1 file changed, 102 insertions(+)
 create mode 100644 arch/arm/boot/dts/ti/omap/omap4-samsung-espresso10.dts

diff --git a/arch/arm/boot/dts/ti/omap/omap4-samsung-espresso10.dts b/arch/arm/boot/dts/ti/omap/omap4-samsung-espresso10.dts
new file mode 100644
index 000000000..70bbef468
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
+			interrupt-parent = <&gpio2>;
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
+		compatible = "samsung,ltn101al03", "panel-lvds";
+		power-supply = <&reg_lcd>;
+		width-mm = <223>;
+		height-mm = <125>;
+		data-mapping = "vesa-24";
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


