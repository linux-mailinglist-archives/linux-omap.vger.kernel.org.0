Return-Path: <linux-omap+bounces-557-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id ABDA9852EA0
	for <lists+linux-omap@lfdr.de>; Tue, 13 Feb 2024 12:00:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5DBE4283DFF
	for <lists+linux-omap@lfdr.de>; Tue, 13 Feb 2024 11:00:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9640A2C683;
	Tue, 13 Feb 2024 11:00:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=atomide.com header.i=@atomide.com header.b="Hed3jLvs"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail5.25mail.st (mail5.25mail.st [74.50.62.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A8012BB0B;
	Tue, 13 Feb 2024 11:00:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.50.62.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707822020; cv=none; b=pc6xf28O348Qul/OBn5/X0VsMNyVjJAZ7abVQ7X1OAuxccbxO23ldF4OrWj8Y3xptwDYmIQSKR7ClbNYKOnvK56N5ncuMxzVaNDd/8xsvsb9ubwLXuaSQdcwfwfhSdllJLS+ovD8PGMcoOOOHxYkDq5PMuNNFZGT/Bx6i/5MXI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707822020; c=relaxed/simple;
	bh=/LA3+QZ9M4dtRDoeWF4D9XAL29HHInVeDtss1DWFUtY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nJporJF5GunXKRFFfHrc/11YVHTg3edDxpURlNKe8OEYdD6J/KI/TmF+jz3i7Wt/Ui/QlY9N9kC6WfKQzd4ExwkzXNPxuq7XIsqAhG07IFZkIJwieSZy7ZZ0vfIewCg0ASaqrk+c5KSa5A9dvyn9ixgfVNy1dk18Y+Pj9RuLEfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomide.com; spf=fail smtp.mailfrom=atomide.com; dkim=pass (2048-bit key) header.d=atomide.com header.i=@atomide.com header.b=Hed3jLvs; arc=none smtp.client-ip=74.50.62.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomide.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=atomide.com
Received: from localhost (91-158-86-216.elisa-laajakaista.fi [91.158.86.216])
	by mail5.25mail.st (Postfix) with ESMTPSA id 18B9560857;
	Tue, 13 Feb 2024 10:59:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=atomide.com;
	s=25mailst; t=1707822016;
	bh=/LA3+QZ9M4dtRDoeWF4D9XAL29HHInVeDtss1DWFUtY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Hed3jLvsgXCu1FpKfrzBLJjUFql/p91IDR4h3m/KY46fWaLUvRe8MOahF8H0ULB0Y
	 8Wqw8hzJ8gGycaxDxoRtY2NV5VPNO9MlzjTVIPYDbDEpH9Cstz6+egLxQ6C8OKHG/q
	 YI+WjC7MSCReDimpYcqcszbF5J6tphjRkyWHHyfeSFCeFvFaRbbEghUFO2oux4cyJ+
	 OrfqcWXddOjKN5PbwSjGvj1imK28DVL/AyleA7oRI5UdP5qV8qjb1UF240gOURrluv
	 f8v1xD71UkF4EN22q2McfLx8KedS4wbKwnnQHBHllQu6oYooDOUd2K/tvS+ikmwUrL
	 HBphRgz9zOIUA==
From: Tony Lindgren <tony@atomide.com>
To: =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Tero Kristo <kristo@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Andreas Kemnade <andreas@kemnade.info>,
	linux-omap@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: [PATCH 4/4] ARM: dts: omap3: Update clksel clocks to use reg instead of ti,bit-shift
Date: Tue, 13 Feb 2024 12:56:44 +0200
Message-ID: <20240213105730.5287-5-tony@atomide.com>
X-Mailer: git-send-email 2.43.1
In-Reply-To: <20240213105730.5287-1-tony@atomide.com>
References: <20240213105730.5287-1-tony@atomide.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

For the clksel clocks we are still using the legacy ti,bit-shift property
instead of the standard reg property. We can now use the reg property, so
let's do that for the clksel clocks.

To add the reg property, we switch to use #address-cells = <1>.

For now let's not update the clock-dss-tv-fck as it seems to share the same
register bit as the clock-dss-96m-fck and would introduce more warnings.

Cc: Andreas Kemnade <andreas@kemnade.info>
Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 arch/arm/boot/dts/ti/omap/am35xx-clocks.dtsi  |  18 +-
 .../boot/dts/ti/omap/omap3430es1-clocks.dtsi  |  52 +-
 .../dts/ti/omap/omap34xx-omap36xx-clocks.dtsi |  86 +--
 ...map36xx-am35xx-omap3430es2plus-clocks.dtsi |  28 +-
 .../arm/boot/dts/ti/omap/omap36xx-clocks.dtsi |   7 +-
 .../omap/omap36xx-omap3430es2plus-clocks.dtsi |  46 +-
 .../arm/boot/dts/ti/omap/omap3xxx-clocks.dtsi | 510 +++++++++---------
 7 files changed, 396 insertions(+), 351 deletions(-)

diff --git a/arch/arm/boot/dts/ti/omap/am35xx-clocks.dtsi b/arch/arm/boot/dts/ti/omap/am35xx-clocks.dtsi
--- a/arch/arm/boot/dts/ti/omap/am35xx-clocks.dtsi
+++ b/arch/arm/boot/dts/ti/omap/am35xx-clocks.dtsi
@@ -66,22 +66,23 @@ clock@a10 {
 		compatible = "ti,clksel";
 		reg = <0xa10>;
 		#clock-cells = <2>;
-		#address-cells = <0>;
+		#address-cells = <1>;
+		#size-cells = <0>;
 
-		ipss_ick: clock-ipss-ick {
+		ipss_ick: clock-ipss-ick@4 {
+			reg = <4>;
 			#clock-cells = <0>;
 			compatible = "ti,am35xx-interface-clock";
 			clock-output-names = "ipss_ick";
 			clocks = <&core_l3_ick>;
-			ti,bit-shift = <4>;
 		};
 
-		uart4_ick_am35xx: clock-uart4-ick-am35xx {
+		uart4_ick_am35xx: clock-uart4-ick-am35xx@23 {
+			reg = <23>;
 			#clock-cells = <0>;
 			compatible = "ti,omap3-interface-clock";
 			clock-output-names = "uart4_ick_am35xx";
 			clocks = <&core_l4_ick>;
-			ti,bit-shift = <23>;
 		};
 	};
 
@@ -101,14 +102,15 @@ clock@a00 {
 		compatible = "ti,clksel";
 		reg = <0xa00>;
 		#clock-cells = <2>;
-		#address-cells = <0>;
+		#address-cells = <1>;
+		#size-cells = <0>;
 
-		uart4_fck_am35xx: clock-uart4-fck-am35xx {
+		uart4_fck_am35xx: clock-uart4-fck-am35xx@23 {
+			reg = <23>;
 			#clock-cells = <0>;
 			compatible = "ti,wait-gate-clock";
 			clock-output-names = "uart4_fck_am35xx";
 			clocks = <&core_48m_fck>;
-			ti,bit-shift = <23>;
 		};
 	};
 };
diff --git a/arch/arm/boot/dts/ti/omap/omap3430es1-clocks.dtsi b/arch/arm/boot/dts/ti/omap/omap3430es1-clocks.dtsi
--- a/arch/arm/boot/dts/ti/omap/omap3430es1-clocks.dtsi
+++ b/arch/arm/boot/dts/ti/omap/omap3430es1-clocks.dtsi
@@ -50,30 +50,31 @@ clock@a00 {
 		compatible = "ti,clksel";
 		reg = <0xa00>;
 		#clock-cells = <2>;
-		#address-cells = <0>;
+		#address-cells = <1>;
+		#size-cells = <0>;
 
-		d2d_26m_fck: clock-d2d-26m-fck {
+		d2d_26m_fck: clock-d2d-26m-fck@3 {
+			reg = <3>;
 			#clock-cells = <0>;
 			compatible = "ti,wait-gate-clock";
 			clock-output-names = "d2d_26m_fck";
 			clocks = <&sys_ck>;
-			ti,bit-shift = <3>;
 		};
 
-		fshostusb_fck: clock-fshostusb-fck {
+		fshostusb_fck: clock-fshostusb-fck@5 {
+			reg = <5>;
 			#clock-cells = <0>;
 			compatible = "ti,wait-gate-clock";
 			clock-output-names = "fshostusb_fck";
 			clocks = <&core_48m_fck>;
-			ti,bit-shift = <5>;
 		};
 
-		ssi_ssr_gate_fck_3430es1: clock-ssi-ssr-gate-fck-3430es1 {
+		ssi_ssr_gate_fck_3430es1: clock-ssi-ssr-gate-fck-3430es1@0 {
+			reg = <0>;
 			#clock-cells = <0>;
 			compatible = "ti,composite-no-wait-gate-clock";
 			clock-output-names = "ssi_ssr_gate_fck_3430es1";
 			clocks = <&corex2_fck>;
-			ti,bit-shift = <0>;
 		};
 	};
 
@@ -81,23 +82,24 @@ clock@a40 {
 		compatible = "ti,clksel";
 		reg = <0xa40>;
 		#clock-cells = <2>;
-		#address-cells = <0>;
+		#address-cells = <1>;
+		#size-cells = <0>;
 
-		ssi_ssr_div_fck_3430es1: clock-ssi-ssr-div-fck-3430es1 {
+		ssi_ssr_div_fck_3430es1: clock-ssi-ssr-div-fck-3430es1@8 {
+			reg = <8>;
 			#clock-cells = <0>;
 			compatible = "ti,composite-divider-clock";
 			clock-output-names = "ssi_ssr_div_fck_3430es1";
 			clocks = <&corex2_fck>;
-			ti,bit-shift = <8>;
 			ti,dividers = <0>, <1>, <2>, <3>, <4>, <0>, <6>, <0>, <8>;
 		};
 
-		usb_l4_div_ick: clock-usb-l4-div-ick {
+		usb_l4_div_ick: clock-usb-l4-div-ick@4 {
+			reg = <4>;
 			#clock-cells = <0>;
 			compatible = "ti,composite-divider-clock";
 			clock-output-names = "usb_l4_div_ick";
 			clocks = <&l4_ick>;
-			ti,bit-shift = <4>;
 			ti,max-div = <1>;
 			ti,index-starts-at-one;
 		};
@@ -121,38 +123,39 @@ clock@a10 {
 		compatible = "ti,clksel";
 		reg = <0xa10>;
 		#clock-cells = <2>;
-		#address-cells = <0>;
+		#address-cells = <1>;
+		#size-cells = <0>;
 
-		hsotgusb_ick_3430es1: clock-hsotgusb-ick-3430es1 {
+		hsotgusb_ick_3430es1: clock-hsotgusb-ick-3430es1@4 {
+			reg = <4>;
 			#clock-cells = <0>;
 			compatible = "ti,omap3-no-wait-interface-clock";
 			clock-output-names = "hsotgusb_ick_3430es1";
 			clocks = <&core_l3_ick>;
-			ti,bit-shift = <4>;
 		};
 
-		fac_ick: clock-fac-ick {
+		fac_ick: clock-fac-ick@8 {
+			reg = <8>;
 			#clock-cells = <0>;
 			compatible = "ti,omap3-interface-clock";
 			clock-output-names = "fac_ick";
 			clocks = <&core_l4_ick>;
-			ti,bit-shift = <8>;
 		};
 
-		ssi_ick: clock-ssi-ick-3430es1 {
+		ssi_ick: clock-ssi-ick-3430es1@0 {
+			reg = <0>;
 			#clock-cells = <0>;
 			compatible = "ti,omap3-no-wait-interface-clock";
 			clock-output-names = "ssi_ick_3430es1";
 			clocks = <&ssi_l4_ick>;
-			ti,bit-shift = <0>;
 		};
 
-		usb_l4_gate_ick: clock-usb-l4-gate-ick {
+		usb_l4_gate_ick: clock-usb-l4-gate-ick@5 {
+			reg = <5>;
 			#clock-cells = <0>;
 			compatible = "ti,composite-interface-clock";
 			clock-output-names = "usb_l4_gate_ick";
 			clocks = <&l4_ick>;
-			ti,bit-shift = <5>;
 		};
 	};
 
@@ -174,14 +177,15 @@ clock@e00 {
 		compatible = "ti,clksel";
 		reg = <0xe00>;
 		#clock-cells = <2>;
-		#address-cells = <0>;
+		#address-cells = <1>;
+		#size-cells = <0>;
 
-		dss1_alwon_fck: clock-dss1-alwon-fck-3430es1 {
+		dss1_alwon_fck: clock-dss1-alwon-fck-3430es1@0 {
+			reg = <0>;
 			#clock-cells = <0>;
 			compatible = "ti,gate-clock";
 			clock-output-names = "dss1_alwon_fck_3430es1";
 			clocks = <&dpll4_m4x2_ck>;
-			ti,bit-shift = <0>;
 			ti,set-rate-parent;
 		};
 	};
diff --git a/arch/arm/boot/dts/ti/omap/omap34xx-omap36xx-clocks.dtsi b/arch/arm/boot/dts/ti/omap/omap34xx-omap36xx-clocks.dtsi
--- a/arch/arm/boot/dts/ti/omap/omap34xx-omap36xx-clocks.dtsi
+++ b/arch/arm/boot/dts/ti/omap/omap34xx-omap36xx-clocks.dtsi
@@ -17,46 +17,47 @@ clock@a14 {
 		compatible = "ti,clksel";
 		reg = <0xa14>;
 		#clock-cells = <2>;
-		#address-cells = <0>;
+		#address-cells = <1>;
+		#size-cells = <0>;
 
-		aes1_ick: clock-aes1-ick {
+		aes1_ick: clock-aes1-ick@3 {
+			reg = <3>;
 			#clock-cells = <0>;
 			compatible = "ti,omap3-interface-clock";
 			clock-output-names = "aes1_ick";
 			clocks = <&security_l4_ick2>;
-			ti,bit-shift = <3>;
 		};
 
-		rng_ick: clock-rng-ick {
+		rng_ick: clock-rng-ick@2 {
+			reg = <2>;
 			#clock-cells = <0>;
 			compatible = "ti,omap3-interface-clock";
 			clock-output-names = "rng_ick";
 			clocks = <&security_l4_ick2>;
-			ti,bit-shift = <2>;
 		};
 
-		sha11_ick: clock-sha11-ick {
+		sha11_ick: clock-sha11-ick@1 {
+			reg = <1>;
 			#clock-cells = <0>;
 			compatible = "ti,omap3-interface-clock";
 			clock-output-names = "sha11_ick";
 			clocks = <&security_l4_ick2>;
-			ti,bit-shift = <1>;
 		};
 
-		des1_ick: clock-des1-ick {
+		des1_ick: clock-des1-ick@0 {
+			reg = <0>;
 			#clock-cells = <0>;
 			compatible = "ti,omap3-interface-clock";
 			clock-output-names = "des1_ick";
 			clocks = <&security_l4_ick2>;
-			ti,bit-shift = <0>;
 		};
 
-		pka_ick: clock-pka-ick {
+		pka_ick: clock-pka-ick@4 {
+			reg = <4>;
 			#clock-cells = <0>;
 			compatible = "ti,omap3-interface-clock";
 			clock-output-names = "pka_ick";
 			clocks = <&security_l3_ick>;
-			ti,bit-shift = <4>;
 		};
 	};
 
@@ -65,23 +66,24 @@ clock@f00 {
 		compatible = "ti,clksel";
 		reg = <0xf00>;
 		#clock-cells = <2>;
-		#address-cells = <0>;
+		#address-cells = <1>;
+		#size-cells = <0>;
 
-		cam_mclk: clock-cam-mclk {
+		cam_mclk: clock-cam-mclk@0 {
+			reg = <0>;
 			#clock-cells = <0>;
 			compatible = "ti,gate-clock";
 			clock-output-names = "cam_mclk";
 			clocks = <&dpll4_m5x2_ck>;
-			ti,bit-shift = <0>;
 			ti,set-rate-parent;
 		};
 
-		csi2_96m_fck: clock-csi2-96m-fck {
+		csi2_96m_fck: clock-csi2-96m-fck@1 {
+			reg = <1>;
 			#clock-cells = <0>;
 			compatible = "ti,gate-clock";
 			clock-output-names = "csi2_96m_fck";
 			clocks = <&core_96m_fck>;
-			ti,bit-shift = <1>;
 		};
 	};
 
@@ -105,46 +107,47 @@ clock@a10 {
 		compatible = "ti,clksel";
 		reg = <0xa10>;
 		#clock-cells = <2>;
-		#address-cells = <0>;
+		#address-cells = <1>;
+		#size-cells = <0>;
 
-		icr_ick: clock-icr-ick {
+		icr_ick: clock-icr-ick@29 {
+			reg = <29>;
 			#clock-cells = <0>;
 			compatible = "ti,omap3-interface-clock";
 			clock-output-names = "icr_ick";
 			clocks = <&core_l4_ick>;
-			ti,bit-shift = <29>;
 		};
 
-		des2_ick: clock-des2-ick {
+		des2_ick: clock-des2-ick@26 {
+			reg = <26>;
 			#clock-cells = <0>;
 			compatible = "ti,omap3-interface-clock";
 			clock-output-names = "des2_ick";
 			clocks = <&core_l4_ick>;
-			ti,bit-shift = <26>;
 		};
 
-		mspro_ick: clock-mspro-ick {
+		mspro_ick: clock-mspro-ick@23 {
+			reg = <23>;
 			#clock-cells = <0>;
 			compatible = "ti,omap3-interface-clock";
 			clock-output-names = "mspro_ick";
 			clocks = <&core_l4_ick>;
-			ti,bit-shift = <23>;
 		};
 
-		mailboxes_ick: clock-mailboxes-ick {
+		mailboxes_ick: clock-mailboxes-ick@7 {
+			reg = <7>;
 			#clock-cells = <0>;
 			compatible = "ti,omap3-interface-clock";
 			clock-output-names = "mailboxes_ick";
 			clocks = <&core_l4_ick>;
-			ti,bit-shift = <7>;
 		};
 
-		sad2d_ick: clock-sad2d-ick {
+		sad2d_ick: clock-sad2d-ick@3 {
+			reg = <3>;
 			#clock-cells = <0>;
 			compatible = "ti,omap3-interface-clock";
 			clock-output-names = "sad2d_ick";
 			clocks = <&l3_ick>;
-			ti,bit-shift = <3>;
 		};
 	};
 
@@ -160,22 +163,23 @@ clock@c00 {
 		compatible = "ti,clksel";
 		reg = <0xc00>;
 		#clock-cells = <2>;
-		#address-cells = <0>;
+		#address-cells = <1>;
+		#size-cells = <0>;
 
-		sr1_fck: clock-sr1-fck {
+		sr1_fck: clock-sr1-fck@6 {
+			reg = <6>;
 			#clock-cells = <0>;
 			compatible = "ti,wait-gate-clock";
 			clock-output-names = "sr1_fck";
 			clocks = <&sys_ck>;
-			ti,bit-shift = <6>;
 		};
 
-		sr2_fck: clock-sr2-fck {
+		sr2_fck: clock-sr2-fck@7 {
+			reg = <7>;
 			#clock-cells = <0>;
 			compatible = "ti,wait-gate-clock";
 			clock-output-names = "sr2_fck";
 			clocks = <&sys_ck>;
-			ti,bit-shift = <7>;
 		};
 	};
 
@@ -228,22 +232,23 @@ clock@a00 {
 		compatible = "ti,clksel";
 		reg = <0xa00>;
 		#clock-cells = <2>;
-		#address-cells = <0>;
+		#address-cells = <1>;
+		#size-cells = <0>;
 
-		modem_fck: clock-modem-fck {
+		modem_fck: clock-modem-fck@31 {
+			reg = <31>;
 			#clock-cells = <0>;
 			compatible = "ti,omap3-interface-clock";
 			clock-output-names = "modem_fck";
 			clocks = <&sys_ck>;
-			ti,bit-shift = <31>;
 		};
 
-		mspro_fck: clock-mspro-fck {
+		mspro_fck: clock-mspro-fck@23 {
+			reg = <23>;
 			#clock-cells = <0>;
 			compatible = "ti,wait-gate-clock";
 			clock-output-names = "mspro_fck";
 			clocks = <&core_96m_fck>;
-			ti,bit-shift = <23>;
 		};
 	};
 
@@ -252,14 +257,15 @@ clock@a18 {
 		compatible = "ti,clksel";
 		reg = <0xa18>;
 		#clock-cells = <2>;
-		#address-cells = <0>;
+		#address-cells = <1>;
+		#ssize-cells = <0>;
 
-		mad2d_ick: clock-mad2d-ick {
+		mad2d_ick: clock-mad2d-ick@3 {
+			reg = <3>;
 			#clock-cells = <0>;
 			compatible = "ti,omap3-interface-clock";
 			clock-output-names = "mad2d_ick";
 			clocks = <&l3_ick>;
-			ti,bit-shift = <3>;
 		};
 	};
 
diff --git a/arch/arm/boot/dts/ti/omap/omap36xx-am35xx-omap3430es2plus-clocks.dtsi b/arch/arm/boot/dts/ti/omap/omap36xx-am35xx-omap3430es2plus-clocks.dtsi
--- a/arch/arm/boot/dts/ti/omap/omap36xx-am35xx-omap3430es2plus-clocks.dtsi
+++ b/arch/arm/boot/dts/ti/omap/omap36xx-am35xx-omap3430es2plus-clocks.dtsi
@@ -138,14 +138,15 @@ clock@a18 {
 		compatible = "ti,clksel";
 		reg = <0xa18>;
 		#clock-cells = <2>;
-		#address-cells = <0>;
+		#address-cells = <1>;
+		#size-cells = <0>;
 
-		usbtll_ick: clock-usbtll-ick {
+		usbtll_ick: clock-usbtll-ick@2 {
+			reg = <2>;
 			#clock-cells = <0>;
 			compatible = "ti,omap3-interface-clock";
 			clock-output-names = "usbtll_ick";
 			clocks = <&core_l4_ick>;
-			ti,bit-shift = <2>;
 		};
 	};
 
@@ -153,14 +154,15 @@ clock@a10 {
 		compatible = "ti,clksel";
 		reg = <0xa10>;
 		#clock-cells = <2>;
-		#address-cells = <0>;
+		#address-cells = <1>;
+		#size-cells = <0>;
 
-		mmchs3_ick: clock-mmchs3-ick {
+		mmchs3_ick: clock-mmchs3-ick@30 {
+			reg = <30>;
 			#clock-cells = <0>;
 			compatible = "ti,omap3-interface-clock";
 			clock-output-names = "mmchs3_ick";
 			clocks = <&core_l4_ick>;
-			ti,bit-shift = <30>;
 		};
 	};
 
@@ -168,14 +170,15 @@ clock@a00 {
 		compatible = "ti,clksel";
 		reg = <0xa00>;
 		#clock-cells = <2>;
-		#address-cells = <0>;
+		#address-cells = <1>;
+		#size-cells = <0>;
 
-		mmchs3_fck: clock-mmchs3-fck {
+		mmchs3_fck: clock-mmchs3-fck@30 {
+			reg = <30>;
 			#clock-cells = <0>;
 			compatible = "ti,wait-gate-clock";
 			clock-output-names = "mmchs3_fck";
 			clocks = <&core_96m_fck>;
-			ti,bit-shift = <30>;
 		};
 	};
 
@@ -183,14 +186,15 @@ clock@e00 {
 		compatible = "ti,clksel";
 		reg = <0xe00>;
 		#clock-cells = <2>;
-		#address-cells = <0>;
+		#address-cells = <1>;
+		#size-cells = <0>;
 
-		dss1_alwon_fck: clock-dss1-alwon-fck-3430es2 {
+		dss1_alwon_fck: clock-dss1-alwon-fck-3430es2@0 {
+			reg = <0>;
 			#clock-cells = <0>;
 			compatible = "ti,dss-gate-clock";
 			clock-output-names = "dss1_alwon_fck_3430es2";
 			clocks = <&dpll4_m4x2_ck>;
-			ti,bit-shift = <0>;
 			ti,set-rate-parent;
 		};
 	};
diff --git a/arch/arm/boot/dts/ti/omap/omap36xx-clocks.dtsi b/arch/arm/boot/dts/ti/omap/omap36xx-clocks.dtsi
--- a/arch/arm/boot/dts/ti/omap/omap36xx-clocks.dtsi
+++ b/arch/arm/boot/dts/ti/omap/omap36xx-clocks.dtsi
@@ -62,14 +62,15 @@ clock@1000 {
 		compatible = "ti,clksel";
 		reg = <0x1000>;
 		#clock-cells = <2>;
-		#address-cells = <0>;
+		#address-cells = <1>;
+		#size-cells = <0>;
 
-		uart4_fck: clock-uart4-fck {
+		uart4_fck: clock-uart4-fck@18 {
+			reg = <18>;
 			#clock-cells = <0>;
 			compatible = "ti,wait-gate-clock";
 			clock-output-names = "uart4_fck";
 			clocks = <&per_48m_fck>;
-			ti,bit-shift = <18>;
 		};
 	};
 };
diff --git a/arch/arm/boot/dts/ti/omap/omap36xx-omap3430es2plus-clocks.dtsi b/arch/arm/boot/dts/ti/omap/omap36xx-omap3430es2plus-clocks.dtsi
--- a/arch/arm/boot/dts/ti/omap/omap36xx-omap3430es2plus-clocks.dtsi
+++ b/arch/arm/boot/dts/ti/omap/omap36xx-omap3430es2plus-clocks.dtsi
@@ -9,14 +9,15 @@ clock@a00 {
 		compatible = "ti,clksel";
 		reg = <0xa00>;
 		#clock-cells = <2>;
-		#address-cells = <0>;
+		#address-cells = <1>;
+		#size-cells = <0>;
 
-		ssi_ssr_gate_fck_3430es2: clock-ssi-ssr-gate-fck-3430es2 {
+		ssi_ssr_gate_fck_3430es2: clock-ssi-ssr-gate-fck-3430es2@0 {
+			reg = <0>;
 			#clock-cells = <0>;
 			compatible = "ti,composite-no-wait-gate-clock";
 			clock-output-names = "ssi_ssr_gate_fck_3430es2";
 			clocks = <&corex2_fck>;
-			ti,bit-shift = <0>;
 		};
 	};
 
@@ -24,14 +25,15 @@ clock@a40 {
 		compatible = "ti,clksel";
 		reg = <0xa40>;
 		#clock-cells = <2>;
-		#address-cells = <0>;
+		#address-cells = <1>;
+		#size-cells = <0>;
 
-		ssi_ssr_div_fck_3430es2: clock-ssi-ssr-div-fck-3430es2 {
+		ssi_ssr_div_fck_3430es2: clock-ssi-ssr-div-fck-3430es2@8 {
+			reg = <8>;
 			#clock-cells = <0>;
 			compatible = "ti,composite-divider-clock";
 			clock-output-names = "ssi_ssr_div_fck_3430es2";
 			clocks = <&corex2_fck>;
-			ti,bit-shift = <8>;
 			ti,dividers = <0>, <1>, <2>, <3>, <4>, <0>, <6>, <0>, <8>;
 		};
 	};
@@ -54,22 +56,23 @@ clock@a10 {
 		compatible = "ti,clksel";
 		reg = <0xa10>;
 		#clock-cells = <2>;
-		#address-cells = <0>;
+		#address-cells = <1>;
+		#size-cells = <0>;
 
-		hsotgusb_ick_3430es2: clock-hsotgusb-ick-3430es2 {
+		hsotgusb_ick_3430es2: clock-hsotgusb-ick-3430es2@4 {
+			reg = <4>;
 			#clock-cells = <0>;
 			compatible = "ti,omap3-hsotgusb-interface-clock";
 			clock-output-names = "hsotgusb_ick_3430es2";
 			clocks = <&core_l3_ick>;
-			ti,bit-shift = <4>;
 		};
 
-		ssi_ick: clock-ssi-ick-3430es2 {
+		ssi_ick: clock-ssi-ick-3430es2@0 {
+			reg = <0>;
 			#clock-cells = <0>;
 			compatible = "ti,omap3-ssi-interface-clock";
 			clock-output-names = "ssi_ick_3430es2";
 			clocks = <&ssi_l4_ick>;
-			ti,bit-shift = <0>;
 		};
 	};
 
@@ -85,14 +88,15 @@ clock@c00 {
 		compatible = "ti,clksel";
 		reg = <0xc00>;
 		#clock-cells = <2>;
-		#address-cells = <0>;
+		#address-cells = <1>;
+		#size-cells = <0>;
 
-		usim_gate_fck: clock-usim-gate-fck {
+		usim_gate_fck: clock-usim-gate-fck@9 {
+			reg = <9>;
 			#clock-cells = <0>;
 			compatible = "ti,composite-gate-clock";
 			clock-output-names = "usim_gate_fck";
 			clocks = <&omap_96m_fck>;
-			ti,bit-shift = <9>;
 		};
 	};
 
@@ -172,14 +176,15 @@ clock@c40 {
 		compatible = "ti,clksel";
 		reg = <0xc40>;
 		#clock-cells = <2>;
-		#address-cells = <0>;
+		#address-cells = <1>;
+		#size-cells = <0>;
 
-		usim_mux_fck: clock-usim-mux-fck {
+		usim_mux_fck: clock-usim-mux-fck@3 {
+			reg = <3>;
 			#clock-cells = <0>;
 			compatible = "ti,composite-mux-clock";
 			clock-output-names = "usim_mux_fck";
 			clocks = <&sys_ck>, <&sys_d2_ck>, <&omap_96m_d2_fck>, <&omap_96m_d4_fck>, <&omap_96m_d8_fck>, <&omap_96m_d10_fck>, <&dpll5_m2_d4_ck>, <&dpll5_m2_d8_ck>, <&dpll5_m2_d16_ck>, <&dpll5_m2_d20_ck>;
-			ti,bit-shift = <3>;
 			ti,index-starts-at-one;
 		};
 	};
@@ -194,14 +199,15 @@ clock@c10 {
 		compatible = "ti,clksel";
 		reg = <0xc10>;
 		#clock-cells = <2>;
-		#address-cells = <0>;
+		#address-cells = <1>;
+		#size-cells = <0>;
 
-		usim_ick: clock-usim-ick {
+		usim_ick: clock-usim-ick@9 {
+			reg = <9>;
 			#clock-cells = <0>;
 			compatible = "ti,omap3-interface-clock";
 			clock-output-names = "usim_ick";
 			clocks = <&wkup_l4_ick>;
-			ti,bit-shift = <9>;
 		};
 	};
 };
diff --git a/arch/arm/boot/dts/ti/omap/omap3xxx-clocks.dtsi b/arch/arm/boot/dts/ti/omap/omap3xxx-clocks.dtsi
--- a/arch/arm/boot/dts/ti/omap/omap3xxx-clocks.dtsi
+++ b/arch/arm/boot/dts/ti/omap/omap3xxx-clocks.dtsi
@@ -83,29 +83,31 @@ clock@68 {
 		compatible = "ti,clksel";
 		reg = <0x68>;
 		#clock-cells = <2>;
-		#address-cells = <0>;
+		#address-cells = <1>;
+		#size-cells = <0>;
 
-		mcbsp5_mux_fck: clock-mcbsp5-mux-fck {
+		mcbsp5_mux_fck: clock-mcbsp5-mux-fck@4 {
+			reg = <4>;
 			#clock-cells = <0>;
 			compatible = "ti,composite-mux-clock";
 			clock-output-names = "mcbsp5_mux_fck";
 			clocks = <&core_96m_fck>, <&mcbsp_clks>;
-			ti,bit-shift = <4>;
 		};
 
-		mcbsp3_mux_fck: clock-mcbsp3-mux-fck {
+		mcbsp3_mux_fck: clock-mcbsp3-mux-fck@0 {
+			reg = <0>;
 			#clock-cells = <0>;
 			compatible = "ti,composite-mux-clock";
 			clock-output-names = "mcbsp3_mux_fck";
 			clocks = <&per_96m_fck>, <&mcbsp_clks>;
 		};
 
-		mcbsp4_mux_fck: clock-mcbsp4-mux-fck {
+		mcbsp4_mux_fck: clock-mcbsp4-mux-fck@2 {
+			reg = <2>;
 			#clock-cells = <0>;
 			compatible = "ti,composite-mux-clock";
 			clock-output-names = "mcbsp4_mux_fck";
 			clocks = <&per_96m_fck>, <&mcbsp_clks>;
-			ti,bit-shift = <2>;
 		};
 	};
 
@@ -120,22 +122,23 @@ clock@4 {
 		compatible = "ti,clksel";
 		reg = <0x4>;
 		#clock-cells = <2>;
-		#address-cells = <0>;
+		#address-cells = <1>;
+		#size-cells = <0>;
 
-		mcbsp1_mux_fck: clock-mcbsp1-mux-fck {
+		mcbsp1_mux_fck: clock-mcbsp1-mux-fck@2 {
+			reg = <2>;
 			#clock-cells = <0>;
 			compatible = "ti,composite-mux-clock";
 			clock-output-names = "mcbsp1_mux_fck";
 			clocks = <&core_96m_fck>, <&mcbsp_clks>;
-			ti,bit-shift = <2>;
 		};
 
-		mcbsp2_mux_fck: clock-mcbsp2-mux-fck {
+		mcbsp2_mux_fck: clock-mcbsp2-mux-fck@6 {
+			reg = <6>;
 			#clock-cells = <0>;
 			compatible = "ti,composite-mux-clock";
 			clock-output-names = "mcbsp2_mux_fck";
 			clocks = <&per_96m_fck>, <&mcbsp_clks>;
-			ti,bit-shift = <6>;
 		};
 	};
 
@@ -259,79 +262,81 @@ clock@1140 {
 		compatible = "ti,clksel";
 		reg = <0x1140>;
 		#clock-cells = <2>;
-		#address-cells = <0>;
+		#address-cells = <1>;
+		#size-cells = <0>;
 
-		dpll3_m3_ck: clock-dpll3-m3 {
+		dpll3_m3_ck: clock-dpll3-m3@16 {
+			reg = <16>;
 			#clock-cells = <0>;
 			compatible = "ti,divider-clock";
 			clock-output-names = "dpll3_m3_ck";
 			clocks = <&dpll3_ck>;
-			ti,bit-shift = <16>;
 			ti,max-div = <31>;
 			ti,index-starts-at-one;
 		};
 
-		dpll4_m6_ck: clock-dpll4-m6 {
+		dpll4_m6_ck: clock-dpll4-m6@24 {
+			reg = <24>;
 			#clock-cells = <0>;
 			compatible = "ti,divider-clock";
 			clock-output-names = "dpll4_m6_ck";
 			clocks = <&dpll4_ck>;
-			ti,bit-shift = <24>;
 			ti,max-div = <63>;
 			ti,index-starts-at-one;
 		};
 
-		emu_src_mux_ck: clock-emu-src-mux {
+		emu_src_mux_ck: clock-emu-src-mux@0 {
+			reg = <0>;
 			#clock-cells = <0>;
 			compatible = "ti,mux-clock";
 			clock-output-names = "emu_src_mux_ck";
 			clocks = <&sys_ck>, <&emu_core_alwon_ck>, <&emu_per_alwon_ck>, <&emu_mpu_alwon_ck>;
 		};
 
-		pclk_fck: clock-pclk-fck {
+		pclk_fck: clock-pclk-fck@8 {
+			reg = <8>;
 			#clock-cells = <0>;
 			compatible = "ti,divider-clock";
 			clock-output-names = "pclk_fck";
 			clocks = <&emu_src_ck>;
-			ti,bit-shift = <8>;
 			ti,max-div = <7>;
 			ti,index-starts-at-one;
 		};
 
-		pclkx2_fck: clock-pclkx2-fck {
+		pclkx2_fck: clock-pclkx2-fck@6 {
+			reg = <6>;
 			#clock-cells = <0>;
 			compatible = "ti,divider-clock";
 			clock-output-names = "pclkx2_fck";
 			clocks = <&emu_src_ck>;
-			ti,bit-shift = <6>;
 			ti,max-div = <3>;
 			ti,index-starts-at-one;
 		};
 
-		atclk_fck: clock-atclk-fck {
+		atclk_fck: clock-atclk-fck@4 {
+			reg = <4>;
 			#clock-cells = <0>;
 			compatible = "ti,divider-clock";
 			clock-output-names = "atclk_fck";
 			clocks = <&emu_src_ck>;
-			ti,bit-shift = <4>;
 			ti,max-div = <3>;
 			ti,index-starts-at-one;
 		};
 
-		traceclk_src_fck: clock-traceclk-src-fck {
+		traceclk_src_fck: clock-traceclk-src-fck@2 {
+			reg = <2>;
 			#clock-cells = <0>;
 			compatible = "ti,mux-clock";
 			clock-output-names = "traceclk_src_fck";
 			clocks = <&sys_ck>, <&emu_core_alwon_ck>, <&emu_per_alwon_ck>, <&emu_mpu_alwon_ck>;
-			ti,bit-shift = <2>;
 		};
 
-		traceclk_fck: clock-traceclk-fck {
+		traceclk_fck: clock-traceclk-fck@11 {
+			reg = <11>;
 			#clock-cells = <0>;
 			compatible = "ti,divider-clock";
 			clock-output-names = "traceclk_fck";
 			clocks = <&traceclk_src_fck>;
-			ti,bit-shift = <11>;
 			ti,max-div = <7>;
 			ti,index-starts-at-one;
 		};
@@ -429,40 +434,41 @@ clock@d40 {
 		compatible = "ti,clksel";
 		reg = <0xd40>;
 		#clock-cells = <2>;
-		#address-cells = <0>;
+		#address-cells = <1>;
+		#size-cells = <0>;
 
-		dpll3_m2_ck: clock-dpll3-m2 {
+		dpll3_m2_ck: clock-dpll3-m2@27 {
+			reg = <27>;
 			#clock-cells = <0>;
 			compatible = "ti,divider-clock";
 			clock-output-names = "dpll3_m2_ck";
 			clocks = <&dpll3_ck>;
-			ti,bit-shift = <27>;
 			ti,max-div = <31>;
 			ti,index-starts-at-one;
 		};
 
-		omap_96m_fck: clock-omap-96m-fck {
+		omap_96m_fck: clock-omap-96m-fck@6 {
+			reg = <6>;
 			#clock-cells = <0>;
 			compatible = "ti,mux-clock";
 			clock-output-names = "omap_96m_fck";
 			clocks = <&cm_96m_fck>, <&sys_ck>;
-			ti,bit-shift = <6>;
 		};
 
-		omap_54m_fck: clock-omap-54m-fck {
+		omap_54m_fck: clock-omap-54m-fck@5 {
+			reg = <5>;
 			#clock-cells = <0>;
 			compatible = "ti,mux-clock";
 			clock-output-names = "omap_54m_fck";
 			clocks = <&dpll4_m3x2_ck>, <&sys_altclk>;
-			ti,bit-shift = <5>;
 		};
 
-		omap_48m_fck: clock-omap-48m-fck {
+		omap_48m_fck: clock-omap-48m-fck@3 {
+			reg = <3>;
 			#clock-cells = <0>;
 			compatible = "ti,mux-clock";
 			clock-output-names = "omap_48m_fck";
 			clocks = <&cm_96m_d2_fck>, <&sys_altclk>;
-			ti,bit-shift = <3>;
 		};
 	};
 
@@ -471,19 +477,21 @@ clock@e40 {
 		compatible = "ti,clksel";
 		reg = <0xe40>;
 		#clock-cells = <2>;
-		#address-cells = <0>;
+		#address-cells = <1>;
+		#size-cells = <0>;
 
-		dpll4_m3_ck: clock-dpll4-m3 {
+		dpll4_m3_ck: clock-dpll4-m3@8 {
+			reg = <8>;
 			#clock-cells = <0>;
 			compatible = "ti,divider-clock";
 			clock-output-names = "dpll4_m3_ck";
 			clocks = <&dpll4_ck>;
-			ti,bit-shift = <8>;
 			ti,max-div = <32>;
 			ti,index-starts-at-one;
 		};
 
-		dpll4_m4_ck: clock-dpll4-m4 {
+		dpll4_m4_ck: clock-dpll4-m4@0 {
+			reg = <0>;
 			#clock-cells = <0>;
 			compatible = "ti,divider-clock";
 			clock-output-names = "dpll4_m4_ck";
@@ -603,29 +611,31 @@ clock@d70 {
 		compatible = "ti,clksel";
 		reg = <0xd70>;
 		#clock-cells = <2>;
-		#address-cells = <0>;
+		#address-cells = <1>;
+		#size-cells = <0>;
 
-		clkout2_src_gate_ck: clock-clkout2-src-gate {
+		clkout2_src_gate_ck: clock-clkout2-src-gate@7 {
+			reg = <7>;
 			#clock-cells = <0>;
 			compatible = "ti,composite-no-wait-gate-clock";
 			clock-output-names = "clkout2_src_gate_ck";
 			clocks = <&core_ck>;
-			ti,bit-shift = <7>;
 		};
 
-		clkout2_src_mux_ck: clock-clkout2-src-mux {
+		clkout2_src_mux_ck: clock-clkout2-src-mux@0 {
+			reg = <0>;
 			#clock-cells = <0>;
 			compatible = "ti,composite-mux-clock";
 			clock-output-names = "clkout2_src_mux_ck";
 			clocks = <&core_ck>, <&sys_ck>, <&cm_96m_fck>, <&omap_54m_fck>;
 		};
 
-		sys_clkout2: clock-sys-clkout2 {
+		sys_clkout2: clock-sys-clkout2@3 {
+			reg = <3>;
 			#clock-cells = <0>;
 			compatible = "ti,divider-clock";
 			clock-output-names = "sys_clkout2";
 			clocks = <&clkout2_src_ck>;
-			ti,bit-shift = <3>;
 			ti,max-div = <64>;
 			ti,index-power-of-two;
 		};
@@ -666,9 +676,11 @@ clock@a40 {
 		compatible = "ti,clksel";
 		reg = <0xa40>;
 		#clock-cells = <2>;
-		#address-cells = <0>;
+		#address-cells = <1>;
+		#size-cells = <0>;
 
-		l3_ick: clock-l3-ick {
+		l3_ick: clock-l3-ick@0 {
+			reg = <0>;
 			#clock-cells = <0>;
 			compatible = "ti,divider-clock";
 			clock-output-names = "l3_ick";
@@ -677,30 +689,30 @@ l3_ick: clock-l3-ick {
 			ti,index-starts-at-one;
 		};
 
-		l4_ick: clock-l4-ick {
+		l4_ick: clock-l4-ick@2 {
+			reg = <2>;
 			#clock-cells = <0>;
 			compatible = "ti,divider-clock";
 			clock-output-names = "l4_ick";
 			clocks = <&l3_ick>;
-			ti,bit-shift = <2>;
 			ti,max-div = <3>;
 			ti,index-starts-at-one;
 		};
 
-		gpt10_mux_fck: clock-gpt10-mux-fck {
+		gpt10_mux_fck: clock-gpt10-mux-fck@6 {
+			reg = <6>;
 			#clock-cells = <0>;
 			compatible = "ti,composite-mux-clock";
 			clock-output-names = "gpt10_mux_fck";
 			clocks = <&omap_32k_fck>, <&sys_ck>;
-			ti,bit-shift = <6>;
 		};
 
-		gpt11_mux_fck: clock-gpt11-mux-fck {
+		gpt11_mux_fck: clock-gpt11-mux-fck@7 {
+			reg = <7>;
 			#clock-cells = <0>;
 			compatible = "ti,composite-mux-clock";
 			clock-output-names = "gpt11_mux_fck";
 			clocks = <&omap_32k_fck>, <&sys_ck>;
-			ti,bit-shift = <7>;
 		};
 	};
 
@@ -709,19 +721,21 @@ clock@c40 {
 		compatible = "ti,clksel";
 		reg = <0xc40>;
 		#clock-cells = <2>;
-		#address-cells = <0>;
+		#address-cells = <1>;
+		#size-cells = <0>;
 
-		rm_ick: clock-rm-ick {
+		rm_ick: clock-rm-ick@1 {
+			reg = <1>;
 			#clock-cells = <0>;
 			compatible = "ti,divider-clock";
 			clock-output-names = "rm_ick";
 			clocks = <&l4_ick>;
-			ti,bit-shift = <1>;
 			ti,max-div = <3>;
 			ti,index-starts-at-one;
 		};
 
-		gpt1_mux_fck: clock-gpt1-mux-fck {
+		gpt1_mux_fck: clock-gpt1-mux-fck@0 {
+			reg = <0>;
 			#clock-cells = <0>;
 			compatible = "ti,composite-mux-clock";
 			clock-output-names = "gpt1_mux_fck";
@@ -734,134 +748,135 @@ clock@a00 {
 		compatible = "ti,clksel";
 		reg = <0xa00>;
 		#clock-cells = <2>;
-		#address-cells = <0>;
+		#address-cells = <1>;
+		#size-cells = <0>;
 
-		gpt10_gate_fck: clock-gpt10-gate-fck {
+		gpt10_gate_fck: clock-gpt10-gate-fck@11 {
+			reg = <11>;
 			#clock-cells = <0>;
 			compatible = "ti,composite-gate-clock";
 			clock-output-names = "gpt10_gate_fck";
 			clocks = <&sys_ck>;
-			ti,bit-shift = <11>;
 		};
 
-		gpt11_gate_fck: clock-gpt11-gate-fck {
+		gpt11_gate_fck: clock-gpt11-gate-fck@12 {
+			reg = <12>;
 			#clock-cells = <0>;
 			compatible = "ti,composite-gate-clock";
 			clock-output-names = "gpt11_gate_fck";
 			clocks = <&sys_ck>;
-			ti,bit-shift = <12>;
 		};
 
-		mmchs2_fck: clock-mmchs2-fck {
+		mmchs2_fck: clock-mmchs2-fck@25 {
+			reg = <25>;
 			#clock-cells = <0>;
 			compatible = "ti,wait-gate-clock";
 			clock-output-names = "mmchs2_fck";
 			clocks = <&core_96m_fck>;
-			ti,bit-shift = <25>;
 		};
 
-		mmchs1_fck: clock-mmchs1-fck {
+		mmchs1_fck: clock-mmchs1-fck@24 {
+			reg = <24>;
 			#clock-cells = <0>;
 			compatible = "ti,wait-gate-clock";
 			clock-output-names = "mmchs1_fck";
 			clocks = <&core_96m_fck>;
-			ti,bit-shift = <24>;
 		};
 
-		i2c3_fck: clock-i2c3-fck {
+		i2c3_fck: clock-i2c3-fck@17 {
+			reg = <17>;
 			#clock-cells = <0>;
 			compatible = "ti,wait-gate-clock";
 			clock-output-names = "i2c3_fck";
 			clocks = <&core_96m_fck>;
-			ti,bit-shift = <17>;
 		};
 
-		i2c2_fck: clock-i2c2-fck {
+		i2c2_fck: clock-i2c2-fck@16 {
+			reg = <16>;
 			#clock-cells = <0>;
 			compatible = "ti,wait-gate-clock";
 			clock-output-names = "i2c2_fck";
 			clocks = <&core_96m_fck>;
-			ti,bit-shift = <16>;
 		};
 
-		i2c1_fck: clock-i2c1-fck {
+		i2c1_fck: clock-i2c1-fck@15 {
+			reg = <15>;
 			#clock-cells = <0>;
 			compatible = "ti,wait-gate-clock";
 			clock-output-names = "i2c1_fck";
 			clocks = <&core_96m_fck>;
-			ti,bit-shift = <15>;
 		};
 
-		mcbsp5_gate_fck: clock-mcbsp5-gate-fck {
+		mcbsp5_gate_fck: clock-mcbsp5-gate-fck@10 {
+			reg = <10>;
 			#clock-cells = <0>;
 			compatible = "ti,composite-gate-clock";
 			clock-output-names = "mcbsp5_gate_fck";
 			clocks = <&mcbsp_clks>;
-			ti,bit-shift = <10>;
 		};
 
-		mcbsp1_gate_fck: clock-mcbsp1-gate-fck {
+		mcbsp1_gate_fck: clock-mcbsp1-gate-fck@9 {
+			reg = <9>;
 			#clock-cells = <0>;
 			compatible = "ti,composite-gate-clock";
 			clock-output-names = "mcbsp1_gate_fck";
 			clocks = <&mcbsp_clks>;
-			ti,bit-shift = <9>;
 		};
 
-		mcspi4_fck: clock-mcspi4-fck {
+		mcspi4_fck: clock-mcspi4-fck@21 {
+			reg = <21>;
 			#clock-cells = <0>;
 			compatible = "ti,wait-gate-clock";
 			clock-output-names = "mcspi4_fck";
 			clocks = <&core_48m_fck>;
-			ti,bit-shift = <21>;
 		};
 
-		mcspi3_fck: clock-mcspi3-fck {
+		mcspi3_fck: clock-mcspi3-fck@20 {
+			reg = <20>;
 			#clock-cells = <0>;
 			compatible = "ti,wait-gate-clock";
 			clock-output-names = "mcspi3_fck";
 			clocks = <&core_48m_fck>;
-			ti,bit-shift = <20>;
 		};
 
-		mcspi2_fck: clock-mcspi2-fck {
+		mcspi2_fck: clock-mcspi2-fck@19 {
+			reg = <19>;
 			#clock-cells = <0>;
 			compatible = "ti,wait-gate-clock";
 			clock-output-names = "mcspi2_fck";
 			clocks = <&core_48m_fck>;
-			ti,bit-shift = <19>;
 		};
 
-		mcspi1_fck: clock-mcspi1-fck {
+		mcspi1_fck: clock-mcspi1-fck@18 {
+			reg = <18>;
 			#clock-cells = <0>;
 			compatible = "ti,wait-gate-clock";
 			clock-output-names = "mcspi1_fck";
 			clocks = <&core_48m_fck>;
-			ti,bit-shift = <18>;
 		};
 
-		uart2_fck: clock-uart2-fck {
+		uart2_fck: clock-uart2-fck@14 {
+			reg = <14>;
 			#clock-cells = <0>;
 			compatible = "ti,wait-gate-clock";
 			clock-output-names = "uart2_fck";
 			clocks = <&core_48m_fck>;
-			ti,bit-shift = <14>;
 		};
 
-		uart1_fck: clock-uart1-fck {
+		uart1_fck: clock-uart1-fck@13 {
+			reg = <13>;
 			#clock-cells = <0>;
 			compatible = "ti,wait-gate-clock";
 			clock-output-names = "uart1_fck";
 			clocks = <&core_48m_fck>;
-			ti,bit-shift = <13>;
 		};
 
-		hdq_fck: clock-hdq-fck {
+		hdq_fck: clock-hdq-fck@22 {
+			reg = <22>;
 			#clock-cells = <0>;
 			compatible = "ti,wait-gate-clock";
 			clock-output-names = "hdq_fck";
 			clocks = <&core_12m_fck>;
-			ti,bit-shift = <22>;
 		};
 	};
 
@@ -914,166 +929,167 @@ clock@a10 {
 		compatible = "ti,clksel";
 		reg = <0xa10>;
 		#clock-cells = <2>;
-		#address-cells = <0>;
+		#address-cells = <1>;
+		#size-cells = <0>;
 
-		sdrc_ick: clock-sdrc-ick {
+		sdrc_ick: clock-sdrc-ick@1 {
+			reg = <1>;
 			#clock-cells = <0>;
 			compatible = "ti,wait-gate-clock";
 			clock-output-names = "sdrc_ick";
 			clocks = <&core_l3_ick>;
-			ti,bit-shift = <1>;
 		};
 
-		mmchs2_ick: clock-mmchs2-ick {
+		mmchs2_ick: clock-mmchs2-ick@25 {
+			reg = <25>;
 			#clock-cells = <0>;
 			compatible = "ti,omap3-interface-clock";
 			clock-output-names = "mmchs2_ick";
 			clocks = <&core_l4_ick>;
-			ti,bit-shift = <25>;
 		};
 
-		mmchs1_ick: clock-mmchs1-ick {
+		mmchs1_ick: clock-mmchs1-ick@24 {
+			reg = <24>;
 			#clock-cells = <0>;
 			compatible = "ti,omap3-interface-clock";
 			clock-output-names = "mmchs1_ick";
 			clocks = <&core_l4_ick>;
-			ti,bit-shift = <24>;
 		};
 
-		hdq_ick: clock-hdq-ick {
+		hdq_ick: clock-hdq-ick@22 {
+			reg = <22>;
 			#clock-cells = <0>;
 			compatible = "ti,omap3-interface-clock";
 			clock-output-names = "hdq_ick";
 			clocks = <&core_l4_ick>;
-			ti,bit-shift = <22>;
 		};
 
-		mcspi4_ick: clock-mcspi4-ick {
+		mcspi4_ick: clock-mcspi4-ick@21 {
+			reg = <21>;
 			#clock-cells = <0>;
 			compatible = "ti,omap3-interface-clock";
 			clock-output-names = "mcspi4_ick";
 			clocks = <&core_l4_ick>;
-			ti,bit-shift = <21>;
 		};
 
-		mcspi3_ick: clock-mcspi3-ick {
+		mcspi3_ick: clock-mcspi3-ick@20 {
+			reg = <20>;
 			#clock-cells = <0>;
 			compatible = "ti,omap3-interface-clock";
 			clock-output-names = "mcspi3_ick";
 			clocks = <&core_l4_ick>;
-			ti,bit-shift = <20>;
 		};
 
-		mcspi2_ick: clock-mcspi2-ick {
+		mcspi2_ick: clock-mcspi2-ick@19 {
+			reg = <19>;
 			#clock-cells = <0>;
 			compatible = "ti,omap3-interface-clock";
 			clock-output-names = "mcspi2_ick";
 			clocks = <&core_l4_ick>;
-			ti,bit-shift = <19>;
 		};
 
-		mcspi1_ick: clock-mcspi1-ick {
+		mcspi1_ick: clock-mcspi1-ick@18 {
+			reg = <18>;
 			#clock-cells = <0>;
 			compatible = "ti,omap3-interface-clock";
 			clock-output-names = "mcspi1_ick";
 			clocks = <&core_l4_ick>;
-			ti,bit-shift = <18>;
 		};
 
-		i2c3_ick: clock-i2c3-ick {
+		i2c3_ick: clock-i2c3-ick@17 {
+			reg = <17>;
 			#clock-cells = <0>;
 			compatible = "ti,omap3-interface-clock";
 			clock-output-names = "i2c3_ick";
 			clocks = <&core_l4_ick>;
-			ti,bit-shift = <17>;
 		};
 
-		i2c2_ick: clock-i2c2-ick {
+		i2c2_ick: clock-i2c2-ick@16 {
+			reg = <16>;
 			#clock-cells = <0>;
 			compatible = "ti,omap3-interface-clock";
 			clock-output-names = "i2c2_ick";
 			clocks = <&core_l4_ick>;
-			ti,bit-shift = <16>;
 		};
 
-		i2c1_ick: clock-i2c1-ick {
+		i2c1_ick: clock-i2c1-ick@15 {
+			reg = <15>;
 			#clock-cells = <0>;
 			compatible = "ti,omap3-interface-clock";
 			clock-output-names = "i2c1_ick";
 			clocks = <&core_l4_ick>;
-			ti,bit-shift = <15>;
 		};
 
-		uart2_ick: clock-uart2-ick {
+		uart2_ick: clock-uart2-ick@14 {
+			reg = <14>;
 			#clock-cells = <0>;
 			compatible = "ti,omap3-interface-clock";
 			clock-output-names = "uart2_ick";
 			clocks = <&core_l4_ick>;
-			ti,bit-shift = <14>;
 		};
 
-		uart1_ick: clock-uart1-ick {
+		uart1_ick: clock-uart1-ick@13 {
+			reg = <13>;
 			#clock-cells = <0>;
 			compatible = "ti,omap3-interface-clock";
 			clock-output-names = "uart1_ick";
 			clocks = <&core_l4_ick>;
-			ti,bit-shift = <13>;
 		};
 
-		gpt11_ick: clock-gpt11-ick {
+		gpt11_ick: clock-gpt11-ick@12 {
+			reg = <12>;
 			#clock-cells = <0>;
 			compatible = "ti,omap3-interface-clock";
 			clock-output-names = "gpt11_ick";
 			clocks = <&core_l4_ick>;
-			ti,bit-shift = <12>;
 		};
 
-		gpt10_ick: clock-gpt10-ick {
+		gpt10_ick: clock-gpt10-ick@11 {
+			reg = <11>;
 			#clock-cells = <0>;
 			compatible = "ti,omap3-interface-clock";
 			clock-output-names = "gpt10_ick";
 			clocks = <&core_l4_ick>;
-			ti,bit-shift = <11>;
 		};
 
-		mcbsp5_ick: clock-mcbsp5-ick {
+		mcbsp5_ick: clock-mcbsp5-ick@10 {
+			reg = <10>;
 			#clock-cells = <0>;
 			compatible = "ti,omap3-interface-clock";
 			clock-output-names = "mcbsp5_ick";
 			clocks = <&core_l4_ick>;
-			ti,bit-shift = <10>;
 		};
 
-		mcbsp1_ick: clock-mcbsp1-ick {
+		mcbsp1_ick: clock-mcbsp1-ick@9 {
+			reg = <9>;
 			#clock-cells = <0>;
 			compatible = "ti,omap3-interface-clock";
 			clock-output-names = "mcbsp1_ick";
 			clocks = <&core_l4_ick>;
-			ti,bit-shift = <9>;
 		};
 
-		omapctrl_ick: clock-omapctrl-ick {
+		omapctrl_ick: clock-omapctrl-ick@6 {
+			reg = <6>;
 			#clock-cells = <0>;
 			compatible = "ti,omap3-interface-clock";
 			clock-output-names = "omapctrl_ick";
 			clocks = <&core_l4_ick>;
-			ti,bit-shift = <6>;
 		};
 
-		aes2_ick: clock-aes2-ick {
+		aes2_ick: clock-aes2-ick@28 {
+			reg = <28>;
 			#clock-cells = <0>;
 			compatible = "ti,omap3-interface-clock";
 			clock-output-names = "aes2_ick";
 			clocks = <&core_l4_ick>;
-			ti,bit-shift = <28>;
 		};
 
-		sha12_ick: clock-sha12-ick {
+		sha12_ick: clock-sha12-ick@27 {
+			reg = <27>;
 			#clock-cells = <0>;
 			compatible = "ti,omap3-interface-clock";
 			clock-output-names = "sha12_ick";
 			clocks = <&core_l4_ick>;
-			ti,bit-shift = <27>;
 		};
 	};
 
@@ -1136,30 +1152,31 @@ clock@c00 {
 		compatible = "ti,clksel";
 		reg = <0xc00>;
 		#clock-cells = <2>;
-		#address-cells = <0>;
+		#address-cells = <1>;
+		#size-cells = <0>;
 
-		gpt1_gate_fck: clock-gpt1-gate-fck {
+		gpt1_gate_fck: clock-gpt1-gate-fck@0 {
+			reg = <0>;
 			#clock-cells = <0>;
 			compatible = "ti,composite-gate-clock";
 			clock-output-names = "gpt1_gate_fck";
 			clocks = <&sys_ck>;
-			ti,bit-shift = <0>;
 		};
 
-		gpio1_dbck: clock-gpio1-dbck {
+		gpio1_dbck: clock-gpio1-dbck@3 {
+			reg = <3>;
 			#clock-cells = <0>;
 			compatible = "ti,gate-clock";
 			clock-output-names = "gpio1_dbck";
 			clocks = <&wkup_32k_fck>;
-			ti,bit-shift = <3>;
 		};
 
-		wdt2_fck: clock-wdt2-fck {
+		wdt2_fck: clock-wdt2-fck@5 {
+			reg = <5>;
 			#clock-cells = <0>;
 			compatible = "ti,wait-gate-clock";
 			clock-output-names = "wdt2_fck";
 			clocks = <&wkup_32k_fck>;
-			ti,bit-shift = <5>;
 		};
 	};
 
@@ -1182,54 +1199,55 @@ clock@c10 {
 		compatible = "ti,clksel";
 		reg = <0xc10>;
 		#clock-cells = <2>;
-		#address-cells = <0>;
+		#address-cells = <1>;
+		#size-cells = <0>;
 
-		wdt2_ick: clock-wdt2-ick {
+		wdt2_ick: clock-wdt2-ick@5 {
+			reg = <5>;
 			#clock-cells = <0>;
 			compatible = "ti,omap3-interface-clock";
 			clock-output-names = "wdt2_ick";
 			clocks = <&wkup_l4_ick>;
-			ti,bit-shift = <5>;
 		};
 
-		wdt1_ick: clock-wdt1-ick {
+		wdt1_ick: clock-wdt1-ick@4 {
+			reg = <4>;
 			#clock-cells = <0>;
 			compatible = "ti,omap3-interface-clock";
 			clock-output-names = "wdt1_ick";
 			clocks = <&wkup_l4_ick>;
-			ti,bit-shift = <4>;
 		};
 
-		gpio1_ick: clock-gpio1-ick {
+		gpio1_ick: clock-gpio1-ick@3 {
+			reg = <3>;
 			#clock-cells = <0>;
 			compatible = "ti,omap3-interface-clock";
 			clock-output-names = "gpio1_ick";
 			clocks = <&wkup_l4_ick>;
-			ti,bit-shift = <3>;
 		};
 
-		omap_32ksync_ick: clock-omap-32ksync-ick {
+		omap_32ksync_ick: clock-omap-32ksync-ick@2 {
+			reg = <2>;
 			#clock-cells = <0>;
 			compatible = "ti,omap3-interface-clock";
 			clock-output-names = "omap_32ksync_ick";
 			clocks = <&wkup_l4_ick>;
-			ti,bit-shift = <2>;
 		};
 
-		gpt12_ick: clock-gpt12-ick {
+		gpt12_ick: clock-gpt12-ick@1 {
+			reg = <1>;
 			#clock-cells = <0>;
 			compatible = "ti,omap3-interface-clock";
 			clock-output-names = "gpt12_ick";
 			clocks = <&wkup_l4_ick>;
-			ti,bit-shift = <1>;
 		};
 
-		gpt1_ick: clock-gpt1-ick {
+		gpt1_ick: clock-gpt1-ick@0 {
+			reg = <0>;
 			#clock-cells = <0>;
 			compatible = "ti,omap3-interface-clock";
 			clock-output-names = "gpt1_ick";
 			clocks = <&wkup_l4_ick>;
-			ti,bit-shift = <0>;
 		};
 	};
 
@@ -1254,150 +1272,151 @@ clock@1000 {
 		compatible = "ti,clksel";
 		reg = <0x1000>;
 		#clock-cells = <2>;
-		#address-cells = <0>;
+		#address-cells = <1>;
+		#size-cells = <0>;
 
-		uart3_fck: clock-uart3-fck {
+		uart3_fck: clock-uart3-fck@11 {
+			reg = <11>;
 			#clock-cells = <0>;
 			compatible = "ti,wait-gate-clock";
 			clock-output-names = "uart3_fck";
 			clocks = <&per_48m_fck>;
-			ti,bit-shift = <11>;
 		};
 
-		gpt2_gate_fck: clock-gpt2-gate-fck {
+		gpt2_gate_fck: clock-gpt2-gate-fck@3 {
+			reg = <3>;
 			#clock-cells = <0>;
 			compatible = "ti,composite-gate-clock";
 			clock-output-names = "gpt2_gate_fck";
 			clocks = <&sys_ck>;
-			ti,bit-shift = <3>;
 		};
 
-		gpt3_gate_fck: clock-gpt3-gate-fck {
+		gpt3_gate_fck: clock-gpt3-gate-fck@4 {
+			reg = <4>;
 			#clock-cells = <0>;
 			compatible = "ti,composite-gate-clock";
 			clock-output-names = "gpt3_gate_fck";
 			clocks = <&sys_ck>;
-			ti,bit-shift = <4>;
 		};
 
-		gpt4_gate_fck: clock-gpt4-gate-fck {
+		gpt4_gate_fck: clock-gpt4-gate-fck@5 {
+			reg = <5>;
 			#clock-cells = <0>;
 			compatible = "ti,composite-gate-clock";
 			clock-output-names = "gpt4_gate_fck";
 			clocks = <&sys_ck>;
-			ti,bit-shift = <5>;
 		};
 
-		gpt5_gate_fck: clock-gpt5-gate-fck {
+		gpt5_gate_fck: clock-gpt5-gate-fck@6 {
+			reg = <6>;
 			#clock-cells = <0>;
 			compatible = "ti,composite-gate-clock";
 			clock-output-names = "gpt5_gate_fck";
 			clocks = <&sys_ck>;
-			ti,bit-shift = <6>;
 		};
 
-		gpt6_gate_fck: clock-gpt6-gate-fck {
+		gpt6_gate_fck: clock-gpt6-gate-fck@7 {
+			reg = <7>;
 			#clock-cells = <0>;
 			compatible = "ti,composite-gate-clock";
 			clock-output-names = "gpt6_gate_fck";
 			clocks = <&sys_ck>;
-			ti,bit-shift = <7>;
 		};
 
-		gpt7_gate_fck: clock-gpt7-gate-fck {
+		gpt7_gate_fck: clock-gpt7-gate-fck@8 {
+			reg = <8>;
 			#clock-cells = <0>;
 			compatible = "ti,composite-gate-clock";
 			clock-output-names = "gpt7_gate_fck";
 			clocks = <&sys_ck>;
-			ti,bit-shift = <8>;
 		};
 
-		gpt8_gate_fck: clock-gpt8-gate-fck {
+		gpt8_gate_fck: clock-gpt8-gate-fck@9 {
+			reg = <9>;
 			#clock-cells = <0>;
 			compatible = "ti,composite-gate-clock";
 			clock-output-names = "gpt8_gate_fck";
 			clocks = <&sys_ck>;
-			ti,bit-shift = <9>;
 		};
 
-		gpt9_gate_fck: clock-gpt9-gate-fck {
+		gpt9_gate_fck: clock-gpt9-gate-fck@10 {
+			reg = <10>;
 			#clock-cells = <0>;
 			compatible = "ti,composite-gate-clock";
 			clock-output-names = "gpt9_gate_fck";
 			clocks = <&sys_ck>;
-			ti,bit-shift = <10>;
 		};
 
-		gpio6_dbck: clock-gpio6-dbck {
+		gpio6_dbck: clock-gpio6-dbck@17 {
+			reg = <17>;
 			#clock-cells = <0>;
 			compatible = "ti,gate-clock";
 			clock-output-names = "gpio6_dbck";
 			clocks = <&per_32k_alwon_fck>;
-			ti,bit-shift = <17>;
 		};
 
-		gpio5_dbck: clock-gpio5-dbck {
+		gpio5_dbck: clock-gpio5-dbck@16 {
+			reg = <16>;
 			#clock-cells = <0>;
 			compatible = "ti,gate-clock";
 			clock-output-names = "gpio5_dbck";
 			clocks = <&per_32k_alwon_fck>;
-			ti,bit-shift = <16>;
 		};
 
-		gpio4_dbck: clock-gpio4-dbck {
+		gpio4_dbck: clock-gpio4-dbck@15 {
+			reg = <15>;
 			#clock-cells = <0>;
 			compatible = "ti,gate-clock";
 			clock-output-names = "gpio4_dbck";
 			clocks = <&per_32k_alwon_fck>;
-			ti,bit-shift = <15>;
 		};
 
-		gpio3_dbck: clock-gpio3-dbck {
+		gpio3_dbck: clock-gpio3-dbck@14 {
+			reg = <14>;
 			#clock-cells = <0>;
 			compatible = "ti,gate-clock";
 			clock-output-names = "gpio3_dbck";
 			clocks = <&per_32k_alwon_fck>;
-			ti,bit-shift = <14>;
 		};
 
-		gpio2_dbck: clock-gpio2-dbck {
+		gpio2_dbck: clock-gpio2-dbck@13 {
+			reg = <13>;
 			#clock-cells = <0>;
 			compatible = "ti,gate-clock";
 			clock-output-names = "gpio2_dbck";
 			clocks = <&per_32k_alwon_fck>;
-			ti,bit-shift = <13>;
 		};
 
-		wdt3_fck: clock-wdt3-fck {
+		wdt3_fck: clock-wdt3-fck@12 {
+			reg = <12>;
 			#clock-cells = <0>;
 			compatible = "ti,wait-gate-clock";
 			clock-output-names = "wdt3_fck";
 			clocks = <&per_32k_alwon_fck>;
-			ti,bit-shift = <12>;
 		};
 
-		mcbsp2_gate_fck: clock-mcbsp2-gate-fck {
+		mcbsp2_gate_fck: clock-mcbsp2-gate-fck@0 {
+			reg = <0>;
 			#clock-cells = <0>;
 			compatible = "ti,composite-gate-clock";
 			clock-output-names = "mcbsp2_gate_fck";
 			clocks = <&mcbsp_clks>;
-			ti,bit-shift = <0>;
 		};
 
-		mcbsp3_gate_fck: clock-mcbsp3-gate-fck {
+		mcbsp3_gate_fck: clock-mcbsp3-gate-fck@1 {
+			reg = <1>;
 			#clock-cells = <0>;
 			compatible = "ti,composite-gate-clock";
 			clock-output-names = "mcbsp3_gate_fck";
 			clocks = <&mcbsp_clks>;
-			ti,bit-shift = <1>;
 		};
 
-		mcbsp4_gate_fck: clock-mcbsp4-gate-fck {
+		mcbsp4_gate_fck: clock-mcbsp4-gate-fck@2 {
+			reg = <2>;
 			#clock-cells = <0>;
 			compatible = "ti,composite-gate-clock";
 			clock-output-names = "mcbsp4_gate_fck";
 			clocks = <&mcbsp_clks>;
-			ti,bit-shift = <2>;
 		};
 	};
 
@@ -1406,69 +1425,71 @@ clock@1040 {
 		compatible = "ti,clksel";
 		reg = <0x1040>;
 		#clock-cells = <2>;
-		#address-cells = <0>;
+		#address-cells = <1>;
+		#size-cells = <0>;
 
-		gpt2_mux_fck: clock-gpt2-mux-fck {
+		gpt2_mux_fck: clock-gpt2-mux-fck@0 {
+			reg = <0>;
 			#clock-cells = <0>;
 			compatible = "ti,composite-mux-clock";
 			clock-output-names = "gpt2_mux_fck";
 			clocks = <&omap_32k_fck>, <&sys_ck>;
 		};
 
-		gpt3_mux_fck: clock-gpt3-mux-fck {
+		gpt3_mux_fck: clock-gpt3-mux-fck@1 {
+			reg = <1>;
 			#clock-cells = <0>;
 			compatible = "ti,composite-mux-clock";
 			clock-output-names = "gpt3_mux_fck";
 			clocks = <&omap_32k_fck>, <&sys_ck>;
-			ti,bit-shift = <1>;
 		};
 
-		gpt4_mux_fck: clock-gpt4-mux-fck {
+		gpt4_mux_fck: clock-gpt4-mux-fck@2 {
+			reg = <2>;
 			#clock-cells = <0>;
 			compatible = "ti,composite-mux-clock";
 			clock-output-names = "gpt4_mux_fck";
 			clocks = <&omap_32k_fck>, <&sys_ck>;
-			ti,bit-shift = <2>;
 		};
 
-		gpt5_mux_fck: clock-gpt5-mux-fck {
+		gpt5_mux_fck: clock-gpt5-mux-fck@3 {
+			reg = <3>;
 			#clock-cells = <0>;
 			compatible = "ti,composite-mux-clock";
 			clock-output-names = "gpt5_mux_fck";
 			clocks = <&omap_32k_fck>, <&sys_ck>;
-			ti,bit-shift = <3>;
 		};
 
-		gpt6_mux_fck: clock-gpt6-mux-fck {
+		gpt6_mux_fck: clock-gpt6-mux-fck@4 {
+			reg = <4>;
 			#clock-cells = <0>;
 			compatible = "ti,composite-mux-clock";
 			clock-output-names = "gpt6_mux_fck";
 			clocks = <&omap_32k_fck>, <&sys_ck>;
-			ti,bit-shift = <4>;
 		};
 
-		gpt7_mux_fck: clock-gpt7-mux-fck {
+		gpt7_mux_fck: clock-gpt7-mux-fck@5 {
+			reg = <5>;
 			#clock-cells = <0>;
 			compatible = "ti,composite-mux-clock";
 			clock-output-names = "gpt7_mux_fck";
 			clocks = <&omap_32k_fck>, <&sys_ck>;
-			ti,bit-shift = <5>;
 		};
 
-		gpt8_mux_fck: clock-gpt8-mux-fck {
+		gpt8_mux_fck: clock-gpt8-mux-fck@6 {
+			reg = <6>;
 			#clock-cells = <0>;
 			compatible = "ti,composite-mux-clock";
 			clock-output-names = "gpt8_mux_fck";
 			clocks = <&omap_32k_fck>, <&sys_ck>;
-			ti,bit-shift = <6>;
 		};
 
-		gpt9_mux_fck: clock-gpt9-mux-fck {
+		gpt9_mux_fck: clock-gpt9-mux-fck@7 {
+			reg = <7>;
 			#clock-cells = <0>;
 			compatible = "ti,composite-mux-clock";
 			clock-output-names = "gpt9_mux_fck";
 			clocks = <&omap_32k_fck>, <&sys_ck>;
-			ti,bit-shift = <7>;
 		};
 	};
 
@@ -1541,158 +1562,159 @@ clock@1010 {
 		compatible = "ti,clksel";
 		reg = <0x1010>;
 		#clock-cells = <2>;
-		#address-cells = <0>;
+		#address-cells = <1>;
+		#size-cells = <0>;
 
-		gpio6_ick: clock-gpio6-ick {
+		gpio6_ick: clock-gpio6-ick@17 {
+			reg = <17>;
 			#clock-cells = <0>;
 			compatible = "ti,omap3-interface-clock";
 			clock-output-names = "gpio6_ick";
 			clocks = <&per_l4_ick>;
-			ti,bit-shift = <17>;
 		};
 
-		gpio5_ick: clock-gpio5-ick {
+		gpio5_ick: clock-gpio5-ick@16 {
+			reg = <16>;
 			#clock-cells = <0>;
 			compatible = "ti,omap3-interface-clock";
 			clock-output-names = "gpio5_ick";
 			clocks = <&per_l4_ick>;
-			ti,bit-shift = <16>;
 		};
 
-		gpio4_ick: clock-gpio4-ick {
+		gpio4_ick: clock-gpio4-ick@15 {
+			reg = <15>;
 			#clock-cells = <0>;
 			compatible = "ti,omap3-interface-clock";
 			clock-output-names = "gpio4_ick";
 			clocks = <&per_l4_ick>;
-			ti,bit-shift = <15>;
 		};
 
-		gpio3_ick: clock-gpio3-ick {
+		gpio3_ick: clock-gpio3-ick@14 {
+			reg = <14>;
 			#clock-cells = <0>;
 			compatible = "ti,omap3-interface-clock";
 			clock-output-names = "gpio3_ick";
 			clocks = <&per_l4_ick>;
-			ti,bit-shift = <14>;
 		};
 
-		gpio2_ick: clock-gpio2-ick {
+		gpio2_ick: clock-gpio2-ick@13 {
+			reg = <13>;
 			#clock-cells = <0>;
 			compatible = "ti,omap3-interface-clock";
 			clock-output-names = "gpio2_ick";
 			clocks = <&per_l4_ick>;
-			ti,bit-shift = <13>;
 		};
 
-		wdt3_ick: clock-wdt3-ick {
+		wdt3_ick: clock-wdt3-ick@12 {
+			reg = <12>;
 			#clock-cells = <0>;
 			compatible = "ti,omap3-interface-clock";
 			clock-output-names = "wdt3_ick";
 			clocks = <&per_l4_ick>;
-			ti,bit-shift = <12>;
 		};
 
-		uart3_ick: clock-uart3-ick {
+		uart3_ick: clock-uart3-ick@11 {
+			reg = <11>;
 			#clock-cells = <0>;
 			compatible = "ti,omap3-interface-clock";
 			clock-output-names = "uart3_ick";
 			clocks = <&per_l4_ick>;
-			ti,bit-shift = <11>;
 		};
 
-		uart4_ick: clock-uart4-ick {
+		uart4_ick: clock-uart4-ick@18 {
+			reg = <18>;
 			#clock-cells = <0>;
 			compatible = "ti,omap3-interface-clock";
 			clock-output-names = "uart4_ick";
 			clocks = <&per_l4_ick>;
-			ti,bit-shift = <18>;
 		};
 
-		gpt9_ick: clock-gpt9-ick {
+		gpt9_ick: clock-gpt9-ick@10 {
+			reg = <10>;
 			#clock-cells = <0>;
 			compatible = "ti,omap3-interface-clock";
 			clock-output-names = "gpt9_ick";
 			clocks = <&per_l4_ick>;
-			ti,bit-shift = <10>;
 		};
 
-		gpt8_ick: clock-gpt8-ick {
+		gpt8_ick: clock-gpt8-ick@9 {
+			reg = <9>;
 			#clock-cells = <0>;
 			compatible = "ti,omap3-interface-clock";
 			clock-output-names = "gpt8_ick";
 			clocks = <&per_l4_ick>;
-			ti,bit-shift = <9>;
 		};
 
-		gpt7_ick: clock-gpt7-ick {
+		gpt7_ick: clock-gpt7-ick@8 {
+			reg = <8>;
 			#clock-cells = <0>;
 			compatible = "ti,omap3-interface-clock";
 			clock-output-names = "gpt7_ick";
 			clocks = <&per_l4_ick>;
-			ti,bit-shift = <8>;
 		};
 
-		gpt6_ick: clock-gpt6-ick {
+		gpt6_ick: clock-gpt6-ick@7 {
+			reg = <7>;
 			#clock-cells = <0>;
 			compatible = "ti,omap3-interface-clock";
 			clock-output-names = "gpt6_ick";
 			clocks = <&per_l4_ick>;
-			ti,bit-shift = <7>;
 		};
 
-		gpt5_ick: clock-gpt5-ick {
+		gpt5_ick: clock-gpt5-ick@6 {
+			reg = <6>;
 			#clock-cells = <0>;
 			compatible = "ti,omap3-interface-clock";
 			clock-output-names = "gpt5_ick";
 			clocks = <&per_l4_ick>;
-			ti,bit-shift = <6>;
 		};
 
-		gpt4_ick: clock-gpt4-ick {
+		gpt4_ick: clock-gpt4-ick@5 {
+			reg = <5>;
 			#clock-cells = <0>;
 			compatible = "ti,omap3-interface-clock";
 			clock-output-names = "gpt4_ick";
 			clocks = <&per_l4_ick>;
-			ti,bit-shift = <5>;
 		};
 
-		gpt3_ick: clock-gpt3-ick {
+		gpt3_ick: clock-gpt3-ick@4 {
+			reg = <4>;
 			#clock-cells = <0>;
 			compatible = "ti,omap3-interface-clock";
 			clock-output-names = "gpt3_ick";
 			clocks = <&per_l4_ick>;
-			ti,bit-shift = <4>;
 		};
 
-		gpt2_ick: clock-gpt2-ick {
+		gpt2_ick: clock-gpt2-ick@3 {
+			reg = <3>;
 			#clock-cells = <0>;
 			compatible = "ti,omap3-interface-clock";
 			clock-output-names = "gpt2_ick";
 			clocks = <&per_l4_ick>;
-			ti,bit-shift = <3>;
 		};
 
-		mcbsp2_ick: clock-mcbsp2-ick {
+		mcbsp2_ick: clock-mcbsp2-ick@0 {
+			reg = <0>;
 			#clock-cells = <0>;
 			compatible = "ti,omap3-interface-clock";
 			clock-output-names = "mcbsp2_ick";
 			clocks = <&per_l4_ick>;
-			ti,bit-shift = <0>;
 		};
 
-		mcbsp3_ick: clock-mcbsp3-ick {
+		mcbsp3_ick: clock-mcbsp3-ick@1 {
+			reg = <1>;
 			#clock-cells = <0>;
 			compatible = "ti,omap3-interface-clock";
 			clock-output-names = "mcbsp3_ick";
 			clocks = <&per_l4_ick>;
-			ti,bit-shift = <1>;
 		};
 
-		mcbsp4_ick: clock-mcbsp4-ick {
+		mcbsp4_ick: clock-mcbsp4-ick@2 {
+			reg = <2>;
 			#clock-cells = <0>;
 			compatible = "ti,omap3-interface-clock";
 			clock-output-names = "mcbsp4_ick";
 			clocks = <&per_l4_ick>;
-			ti,bit-shift = <2>;
 		};
 	};
 
-- 
2.43.1

