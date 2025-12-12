Return-Path: <linux-omap+bounces-5192-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 991D8CB9CA2
	for <lists+linux-omap@lfdr.de>; Fri, 12 Dec 2025 21:35:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 56E9030D47E9
	for <lists+linux-omap@lfdr.de>; Fri, 12 Dec 2025 20:33:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3ACB2F0C73;
	Fri, 12 Dec 2025 20:33:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="byJ0gm1z"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 321DE2DA74D;
	Fri, 12 Dec 2025 20:33:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765571591; cv=none; b=H9eyRgMV7G7b3yS4hueBlhh9/vsGLgRmQqlIMeYrF0UqfDm6DM45f5U05Vrk+Wr1/654RmyELXQZxImby+Z6eBfdFiVIEquQaKGIAXkAUKXh9Uzhl6izNDiZNNj+rImNLRRdcZLIJ8zE7YGkbYaxGzpE2RtaFNTrXWNUbMQKbAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765571591; c=relaxed/simple;
	bh=o8hAXqSLsFNLTNnaxITpEtVjUkdb0GutzQPnxZvns68=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Ceaeide/+nArvXbqG6DaSlreZpALNXoOElzqVH4Nvda3AfjRYVZG8o6zFJGAbuTGH2cYwKncTPVpFZB0Fb62IJGypyaGmkQcu238+D1v2XOKDDxNnJ22gkY7RlrX03PazDffjIW5PcmQ88jXCsOpEbbNi+8P8OjwYHDqmneiozQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=byJ0gm1z; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93E2BC4AF09;
	Fri, 12 Dec 2025 20:33:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765571590;
	bh=o8hAXqSLsFNLTNnaxITpEtVjUkdb0GutzQPnxZvns68=;
	h=From:To:Cc:Subject:Date:From;
	b=byJ0gm1zcXYHNofdWwUkJ4b7+mmB0nZruoo/5K2vNv0sSCNb5oMb6RWNXq5E2iqqo
	 2KodYnPDOOIcFeChjKTK+i6YB0VQGupoXQc00bOlOkJFFZJgvOkKsCW2BLaVpnMsuw
	 peBBws4RQm6O1DSdNsqvPd5vv7hHPPZ6i5GnQmydXRs3Vi1a/R14U8cUvfxuyuidt0
	 dVnGVGevWDWiCzsUUA57qjCGAc9ouWBtMCFHAzumKxD9FWpmjOJqPSOTkjlgnbbIkR
	 PW70Db59scVLLpujAmuOzdBULppGEyrQWmkPZVmoiqnek9jxqq9LKXQsSoVvaztMY6
	 RZq5hzb/1zD9w==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Aaro Koskinen <aaro.koskinen@iki.fi>,
	Andreas Kemnade <andreas@kemnade.info>,
	Kevin Hilman <khilman@baylibre.com>,
	Roger Quadros <rogerq@kernel.org>,
	Tony Lindgren <tony@atomide.com>
Cc: linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-omap@vger.kernel.org
Subject: [PATCH] ARM: dts: ti: Drop unused .dtsi
Date: Fri, 12 Dec 2025 14:32:12 -0600
Message-ID: <20251212203226.458694-6-robh@kernel.org>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

These .dtsi files are not included anywhere in the tree and can't be
tested.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 arch/arm/boot/dts/ti/omap/am3703.dtsi         |  14 --
 arch/arm/boot/dts/ti/omap/am3715.dtsi         |  10 -
 .../boot/dts/ti/omap/omap3430es1-clocks.dtsi  | 237 ------------------
 3 files changed, 261 deletions(-)
 delete mode 100644 arch/arm/boot/dts/ti/omap/am3703.dtsi
 delete mode 100644 arch/arm/boot/dts/ti/omap/am3715.dtsi
 delete mode 100644 arch/arm/boot/dts/ti/omap/omap3430es1-clocks.dtsi

diff --git a/arch/arm/boot/dts/ti/omap/am3703.dtsi b/arch/arm/boot/dts/ti/omap/am3703.dtsi
deleted file mode 100644
index 2b994ae790c9..000000000000
--- a/arch/arm/boot/dts/ti/omap/am3703.dtsi
+++ /dev/null
@@ -1,14 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-only
-/*
- * Copyright (C) 2020 André Hentschel <nerv@dawncrow.de>
- */
-
-#include "omap36xx.dtsi"
-
-&iva {
-	status = "disabled";
-};
-
-&sgx_module {
-	status = "disabled";
-};
diff --git a/arch/arm/boot/dts/ti/omap/am3715.dtsi b/arch/arm/boot/dts/ti/omap/am3715.dtsi
deleted file mode 100644
index ab328e8c0bd8..000000000000
--- a/arch/arm/boot/dts/ti/omap/am3715.dtsi
+++ /dev/null
@@ -1,10 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-only
-/*
- * Copyright (C) 2020 André Hentschel <nerv@dawncrow.de>
- */
-
-#include "omap36xx.dtsi"
-
-&iva {
-	status = "disabled";
-};
diff --git a/arch/arm/boot/dts/ti/omap/omap3430es1-clocks.dtsi b/arch/arm/boot/dts/ti/omap/omap3430es1-clocks.dtsi
deleted file mode 100644
index 6e754d265f18..000000000000
--- a/arch/arm/boot/dts/ti/omap/omap3430es1-clocks.dtsi
+++ /dev/null
@@ -1,237 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-only
-/*
- * Device Tree Source for OMAP3430 ES1 clock data
- *
- * Copyright (C) 2013 Texas Instruments, Inc.
- */
-&cm_clocks {
-	gfx_l3_ck: gfx_l3_ck@b10 {
-		#clock-cells = <0>;
-		compatible = "ti,wait-gate-clock";
-		clocks = <&l3_ick>;
-		reg = <0x0b10>;
-		ti,bit-shift = <0>;
-	};
-
-	gfx_l3_fck: gfx_l3_fck@b40 {
-		#clock-cells = <0>;
-		compatible = "ti,divider-clock";
-		clocks = <&l3_ick>;
-		ti,max-div = <7>;
-		reg = <0x0b40>;
-		ti,index-starts-at-one;
-	};
-
-	gfx_l3_ick: gfx_l3_ick {
-		#clock-cells = <0>;
-		compatible = "fixed-factor-clock";
-		clocks = <&gfx_l3_ck>;
-		clock-mult = <1>;
-		clock-div = <1>;
-	};
-
-	gfx_cg1_ck: gfx_cg1_ck@b00 {
-		#clock-cells = <0>;
-		compatible = "ti,wait-gate-clock";
-		clocks = <&gfx_l3_fck>;
-		reg = <0x0b00>;
-		ti,bit-shift = <1>;
-	};
-
-	gfx_cg2_ck: gfx_cg2_ck@b00 {
-		#clock-cells = <0>;
-		compatible = "ti,wait-gate-clock";
-		clocks = <&gfx_l3_fck>;
-		reg = <0x0b00>;
-		ti,bit-shift = <2>;
-	};
-
-	clock@a00 {
-		compatible = "ti,clksel";
-		reg = <0xa00>;
-		#clock-cells = <2>;
-		#address-cells = <1>;
-		#size-cells = <0>;
-
-		d2d_26m_fck: clock-d2d-26m-fck@3 {
-			reg = <3>;
-			#clock-cells = <0>;
-			compatible = "ti,wait-gate-clock";
-			clock-output-names = "d2d_26m_fck";
-			clocks = <&sys_ck>;
-		};
-
-		fshostusb_fck: clock-fshostusb-fck@5 {
-			reg = <5>;
-			#clock-cells = <0>;
-			compatible = "ti,wait-gate-clock";
-			clock-output-names = "fshostusb_fck";
-			clocks = <&core_48m_fck>;
-		};
-
-		ssi_ssr_gate_fck_3430es1: clock-ssi-ssr-gate-fck-3430es1@0 {
-			reg = <0>;
-			#clock-cells = <0>;
-			compatible = "ti,composite-no-wait-gate-clock";
-			clock-output-names = "ssi_ssr_gate_fck_3430es1";
-			clocks = <&corex2_fck>;
-		};
-	};
-
-	clock@a40 {
-		compatible = "ti,clksel";
-		reg = <0xa40>;
-		#clock-cells = <2>;
-		#address-cells = <1>;
-		#size-cells = <0>;
-
-		ssi_ssr_div_fck_3430es1: clock-ssi-ssr-div-fck-3430es1@8 {
-			reg = <8>;
-			#clock-cells = <0>;
-			compatible = "ti,composite-divider-clock";
-			clock-output-names = "ssi_ssr_div_fck_3430es1";
-			clocks = <&corex2_fck>;
-			ti,dividers = <0>, <1>, <2>, <3>, <4>, <0>, <6>, <0>, <8>;
-		};
-
-		usb_l4_div_ick: clock-usb-l4-div-ick@4 {
-			reg = <4>;
-			#clock-cells = <0>;
-			compatible = "ti,composite-divider-clock";
-			clock-output-names = "usb_l4_div_ick";
-			clocks = <&l4_ick>;
-			ti,max-div = <1>;
-			ti,index-starts-at-one;
-		};
-	};
-
-	ssi_ssr_fck: ssi_ssr_fck_3430es1 {
-		#clock-cells = <0>;
-		compatible = "ti,composite-clock";
-		clocks = <&ssi_ssr_gate_fck_3430es1>, <&ssi_ssr_div_fck_3430es1>;
-	};
-
-	ssi_sst_fck: ssi_sst_fck_3430es1 {
-		#clock-cells = <0>;
-		compatible = "fixed-factor-clock";
-		clocks = <&ssi_ssr_fck>;
-		clock-mult = <1>;
-		clock-div = <2>;
-	};
-
-	clock@a10 {
-		compatible = "ti,clksel";
-		reg = <0xa10>;
-		#clock-cells = <2>;
-		#address-cells = <1>;
-		#size-cells = <0>;
-
-		hsotgusb_ick_3430es1: clock-hsotgusb-ick-3430es1@4 {
-			reg = <4>;
-			#clock-cells = <0>;
-			compatible = "ti,omap3-no-wait-interface-clock";
-			clock-output-names = "hsotgusb_ick_3430es1";
-			clocks = <&core_l3_ick>;
-		};
-
-		fac_ick: clock-fac-ick@8 {
-			reg = <8>;
-			#clock-cells = <0>;
-			compatible = "ti,omap3-interface-clock";
-			clock-output-names = "fac_ick";
-			clocks = <&core_l4_ick>;
-		};
-
-		ssi_ick: clock-ssi-ick-3430es1@0 {
-			reg = <0>;
-			#clock-cells = <0>;
-			compatible = "ti,omap3-no-wait-interface-clock";
-			clock-output-names = "ssi_ick_3430es1";
-			clocks = <&ssi_l4_ick>;
-		};
-
-		usb_l4_gate_ick: clock-usb-l4-gate-ick@5 {
-			reg = <5>;
-			#clock-cells = <0>;
-			compatible = "ti,composite-interface-clock";
-			clock-output-names = "usb_l4_gate_ick";
-			clocks = <&l4_ick>;
-		};
-	};
-
-	ssi_l4_ick: ssi_l4_ick {
-		#clock-cells = <0>;
-		compatible = "fixed-factor-clock";
-		clocks = <&l4_ick>;
-		clock-mult = <1>;
-		clock-div = <1>;
-	};
-
-	usb_l4_ick: usb_l4_ick {
-		#clock-cells = <0>;
-		compatible = "ti,composite-clock";
-		clocks = <&usb_l4_gate_ick>, <&usb_l4_div_ick>;
-	};
-
-	clock@e00 {
-		compatible = "ti,clksel";
-		reg = <0xe00>;
-		#clock-cells = <2>;
-		#address-cells = <1>;
-		#size-cells = <0>;
-
-		dss1_alwon_fck: clock-dss1-alwon-fck-3430es1@0 {
-			reg = <0>;
-			#clock-cells = <0>;
-			compatible = "ti,gate-clock";
-			clock-output-names = "dss1_alwon_fck_3430es1";
-			clocks = <&dpll4_m4x2_ck>;
-			ti,set-rate-parent;
-		};
-	};
-
-	dss_ick: dss_ick_3430es1@e10 {
-		#clock-cells = <0>;
-		compatible = "ti,omap3-no-wait-interface-clock";
-		clocks = <&l4_ick>;
-		reg = <0x0e10>;
-		ti,bit-shift = <0>;
-	};
-};
-
-&cm_clockdomains {
-	core_l3_clkdm: core_l3_clkdm {
-		compatible = "ti,clockdomain";
-		clocks = <&sdrc_ick>, <&hsotgusb_ick_3430es1>;
-	};
-
-	gfx_3430es1_clkdm: gfx_3430es1_clkdm {
-		compatible = "ti,clockdomain";
-		clocks = <&gfx_l3_ck>, <&gfx_cg1_ck>, <&gfx_cg2_ck>;
-	};
-
-	dss_clkdm: dss_clkdm {
-		compatible = "ti,clockdomain";
-		clocks = <&dss_tv_fck>, <&dss_96m_fck>, <&dss2_alwon_fck>,
-			 <&dss1_alwon_fck>, <&dss_ick>;
-	};
-
-	d2d_clkdm: d2d_clkdm {
-		compatible = "ti,clockdomain";
-		clocks = <&d2d_26m_fck>;
-	};
-
-	core_l4_clkdm: core_l4_clkdm {
-		compatible = "ti,clockdomain";
-		clocks = <&mmchs2_fck>, <&mmchs1_fck>, <&i2c3_fck>, <&i2c2_fck>,
-			 <&i2c1_fck>, <&mcspi4_fck>, <&mcspi3_fck>,
-			 <&mcspi2_fck>, <&mcspi1_fck>, <&uart2_fck>,
-			 <&uart1_fck>, <&hdq_fck>, <&mmchs2_ick>, <&mmchs1_ick>,
-			 <&hdq_ick>, <&mcspi4_ick>, <&mcspi3_ick>,
-			 <&mcspi2_ick>, <&mcspi1_ick>, <&i2c3_ick>, <&i2c2_ick>,
-			 <&i2c1_ick>, <&uart2_ick>, <&uart1_ick>, <&gpt11_ick>,
-			 <&gpt10_ick>, <&mcbsp5_ick>, <&mcbsp1_ick>,
-			 <&omapctrl_ick>, <&aes2_ick>, <&sha12_ick>,
-			 <&fshostusb_fck>, <&fac_ick>, <&ssi_ick>;
-	};
-};
-- 
2.51.0


