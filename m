Return-Path: <linux-omap+bounces-5548-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B86BD39D00
	for <lists+linux-omap@lfdr.de>; Mon, 19 Jan 2026 04:31:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 12B33300E42D
	for <lists+linux-omap@lfdr.de>; Mon, 19 Jan 2026 03:31:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CED102DBF5E;
	Mon, 19 Jan 2026 03:30:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZZlfJ7sO"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 028552DC79A
	for <linux-omap@vger.kernel.org>; Mon, 19 Jan 2026 03:30:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768793459; cv=none; b=HB5p3uLSDYuUpN3pvkEq6CYdz7oAUwv1Dy2S15WlQ9NqQ6h570/TMs7SuPagv7dkHeSyrLYc0uslK8SOkuvRbQgJi4M4i0ny9BH+Urg+YDzQt9PvNi/hSUBvsrw6OzkemSIILvdi2dyfNFTZGU183PQjQuZecPGwvSn5Nkg/ZoI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768793459; c=relaxed/simple;
	bh=AUhhKwGaM9grtdftiWmb9K3MniiTndfrY7S51xLJzEI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=phrV9wteJ4o/ASVZ6n+GLBrdUI2JdUTbHat118IXr/TQBrsAm/ZC/11CXPFOAZzSDw5cMqYGizWBJ9/yIn9UfWWOhWRfsC/DlYNIgiAR6UgHHbjlhoHhnyCXf8l2C/4EcQjGBrWLTh5Kp8rd/a/C6LPxr7jeIwozt/3uVIn8eW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZZlfJ7sO; arc=none smtp.client-ip=209.85.222.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-8c537a42b53so615045685a.0
        for <linux-omap@vger.kernel.org>; Sun, 18 Jan 2026 19:30:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768793457; x=1769398257; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=meO53koivOwOs9Bd8q7AbA+V+PS952tTGxoKR0dH/Dg=;
        b=ZZlfJ7sOSEFqGSF1Kyr3ijh9eb0GCktn9NRL1CSlN2Zp5Drc5Y/g8VhPFGtnpNvHpo
         rbURYOb0cFkleCiG1KfSQDzZoolj94yBxqjEwjoVWTNsiPKhVFYBi+NbTwNdaNF8Fu4Q
         +Zs40B6MW7NgzIgn1/N5CLcsrGvS9sUFP0YqGmxf3MYEV3htw7c9WmEZYZFKb8aASDYZ
         rZHBZFOOldZ6LVcmlIQ1eOdlV+sYl5u9XKSNx/1lCXl4VH5XU84Qb2I8t7f0zsEulTTv
         +LuP7D5zpk0dxAbwkPl87rXPqkVg5yzfqKEhEQXueZD9Qtwptli4datdvXabDMa/xlxU
         +MEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768793457; x=1769398257;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=meO53koivOwOs9Bd8q7AbA+V+PS952tTGxoKR0dH/Dg=;
        b=NkBr8o6y2WeKBQ5xT9oifdev1WOBXXzNjhSnlc7VPd0VG+uUFo3zQ/EOkaeHQhVxeD
         MOHolnfSiAO5SAP/UI3SVRoQXsBxXXpKhKAGcM4kooi+/CSkIVcwWzH3X8+xWMAyIoiC
         ybBmqmTkgBQtmbMxDFgwlbxDiDTO9H6HGdmjoQfyYSXKYMYzcUeH9Hwtos+QvM5fLW02
         PQ2zgWXkK2eDm8MjDijxRvlAgGbOpuoNRiZ/NJsglFJeGusbbQM97iupVmJiERpTLUaC
         MP+kMrUup8q1eqgSFUBwG3IonmW0LtMa+3vmu6It513HEh3aYVIBJlwf8Pq1RmSl4XdZ
         k6xA==
X-Gm-Message-State: AOJu0YyY5QZUE2Iojk+SCXUpWOdGr8xFQgKOpJNxbHM4qytLQjqJxo8D
	XPs72kRYZencamlF7sAhwbXsdbK8QJ1XNCM+xtk+bz//G1lHxyFT3kRa
X-Gm-Gg: AY/fxX5HwMCMxj4kaUJ+cgbJX6c3On8NSAoc8zaySLHPIhNjQtsqW+YgFlbD+7r2X+C
	nXOFMsSk8cywPQ9IrU4m+G0MAdH/SzXKEL7Mi4PavtIbJv07qzYIN+W0ASsKmZLKCmaMWarBv1a
	4dAuXkx60/BKwCr6ih2NlxFSTC+8rIRGkDcmZ6208PcYhnYpxBbLVShtjk0HRgz4X0Td9SutMS0
	4ZT0iT3nx1IQeUjZHSytuUjoOKkqWiim/lc+y2l0M+ONDyM4Um7jo+Djz7chhlL6eD8AwNSboKo
	tniz5c1gz70XZXL4YWl9kH9w+ucRuQ6URyMQniiQkqwc++4kQ1GMwlqUBxpXL425DmKkaTEey88
	qB/DeaxLi6mD0c8lP6t1t9Pr5Nnnw9aPbcn8CGh8SwyH1GF0ZD0LVzGlH3orAYU8wL1EEANTg5E
	vDUKCs8btKIgHFCRSB5YY5ZniCd2nSToggfcTdi90snINt5p8447e1hKBm8WFNlvVvazw=
X-Received: by 2002:a05:620a:6910:b0:8b2:ea5a:4146 with SMTP id af79cd13be357-8c6a6979f69mr1231120785a.89.1768793456999;
        Sun, 18 Jan 2026 19:30:56 -0800 (PST)
Received: from mighty.localdomain (nat-130-245-192-1.resnet.stonybrook.edu. [130.245.192.1])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c6a71ab20dsm724706885a.5.2026.01.18.19.30.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Jan 2026 19:30:56 -0800 (PST)
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
Subject: [PATCH v4 10/10] ARM: dts: ti: omap: samsung-espresso10: Add initial support for Galaxy Tab 2 10.1
Date: Sun, 18 Jan 2026 22:30:35 -0500
Message-ID: <20260119033035.57538-12-bavishimithil@gmail.com>
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

Create a device tree for the 10 inch variants (P5100, P5110, P5113)

Signed-off-by: Mithil Bavishi <bavishimithil@gmail.com>
---
 arch/arm/boot/dts/ti/omap/Makefile            |   1 +
 .../dts/ti/omap/omap4-samsung-espresso10.dts  | 104 ++++++++++++++++++
 2 files changed, 105 insertions(+)
 create mode 100644 arch/arm/boot/dts/ti/omap/omap4-samsung-espresso10.dts

diff --git a/arch/arm/boot/dts/ti/omap/Makefile b/arch/arm/boot/dts/ti/omap/Makefile
index d24f13efd..140ac39b3 100644
--- a/arch/arm/boot/dts/ti/omap/Makefile
+++ b/arch/arm/boot/dts/ti/omap/Makefile
@@ -81,6 +81,7 @@ dtb-$(CONFIG_ARCH_OMAP4) += \
 	omap4-var-dvk-om44.dtb \
 	omap4-var-stk-om44.dtb \
 	omap4-samsung-espresso7.dtb \
+	omap4-samsung-espresso10.dtb \
 	omap4-xyboard-mz609.dtb \
 	omap4-xyboard-mz617.dtb
 dtb-$(CONFIG_SOC_AM33XX) += \
diff --git a/arch/arm/boot/dts/ti/omap/omap4-samsung-espresso10.dts b/arch/arm/boot/dts/ti/omap/omap4-samsung-espresso10.dts
new file mode 100644
index 000000000..5c00d67ac
--- /dev/null
+++ b/arch/arm/boot/dts/ti/omap/omap4-samsung-espresso10.dts
@@ -0,0 +1,104 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/dts-v1/;
+
+#include "omap4-samsung-espresso-common.dtsi"
+#include <dt-bindings/power/summit,smb347-charger.h>
+/ {
+	model = "Samsung Galaxy Tab 2 (10 inch)";
+	compatible = "samsung,espresso10", "ti,omap4430", "ti,omap4";
+
+	i2c-gpio5 {
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
+	touchscreen@20 {
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
+		//avdd-supply = <&reg_touch_ldo_en>;
+		vdd-supply = <&ldo6>;
+
+		syna,reset-delay-ms = <200>;
+		syna,startup-delay-ms = <200>;
+
+		touchscreen-size-x = <1280>;
+		touchscreen-size-y = <800>;
+
+		rmi4-f01@1 {
+			reg = <0x01>;
+			syna,nosleep-mode = <1>;
+		};
+
+		rmi4-f11@11 {
+			reg = <0x11>;
+			touchscreen-size-x = <1280>;
+			touchscreen-size-y = <800>;
+			syna,sensor-type = <1>;
+		};
+	};
+};
-- 
2.43.0


