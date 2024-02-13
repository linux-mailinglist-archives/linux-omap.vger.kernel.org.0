Return-Path: <linux-omap+bounces-556-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F5F6852E94
	for <lists+linux-omap@lfdr.de>; Tue, 13 Feb 2024 11:59:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C79D7283E7C
	for <lists+linux-omap@lfdr.de>; Tue, 13 Feb 2024 10:59:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 230FF2BB14;
	Tue, 13 Feb 2024 10:59:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=atomide.com header.i=@atomide.com header.b="lbdDunKG"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail5.25mail.st (mail5.25mail.st [74.50.62.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 614F52AE71;
	Tue, 13 Feb 2024 10:59:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.50.62.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707821985; cv=none; b=VHOEOvV6IrenAP5VK1yJl4wb9L6VP7nSjOh4I9si5csrZhIixKVEe10MFtHIxP+pMxMDh6MTXAhbm3cgQJai+aO+ReYVEnigmpLhmQjlnCHoKHxFjr8e6BMlVRuosykHcrViWWJspRyzoBqKEgQEDcZKHR6jjp8rLFRcFQqjGzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707821985; c=relaxed/simple;
	bh=SxGTUeQ8oJsMnUzjd5kVdNBHdwqE1Lkj1Z5EHPavGyU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nF+8T0Ofh/X4apr5PUNT5eFoTrddv3RqXZFDJsCOTVNK8XnJ4/e9P+Yi4v4+O2JoHbOp+wyXQSevMrgujpUNDw+YdoeLkUw9yvMgmoVWVD/zQF8nL5yi9iD3ZDdf7BegWYHiwByXR3pv89XGQ7RmYB8D2hH+nqZYxy9dWKW2NiI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomide.com; spf=fail smtp.mailfrom=atomide.com; dkim=pass (2048-bit key) header.d=atomide.com header.i=@atomide.com header.b=lbdDunKG; arc=none smtp.client-ip=74.50.62.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomide.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=atomide.com
Received: from localhost (91-158-86-216.elisa-laajakaista.fi [91.158.86.216])
	by mail5.25mail.st (Postfix) with ESMTPSA id B3A5D6058D;
	Tue, 13 Feb 2024 10:59:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=atomide.com;
	s=25mailst; t=1707821983;
	bh=SxGTUeQ8oJsMnUzjd5kVdNBHdwqE1Lkj1Z5EHPavGyU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=lbdDunKGI0WpElNHuyAchxgCSApRDDYS9VuIag98dLoKI5DhG1CJ0HLiIXUyZ++jS
	 ZtfLLrWH+cEZdsY1AD0+Ym6aa30TV9hBNm7el80NUi+UDV6z80nm40PGy9rlP7t87I
	 JK9RheupT1x9ZasPo0p7Viy1BMeVr6SKAQxrROchW3ZIsuXFe5VrR1tmIOR21XD5kh
	 nNOB3NPiWX12DoQdOImI1IGNWzQAziS74wITQrMpICUyCcgfutzV7FfOnIy/pmYOQT
	 38CiUvq8xZzcIRLJmcRDbFvkaNtzgVcdYGYXfOz6zjlDmLMitDUzqDwJLZIR5kEGTp
	 DrysyHSzfkldg==
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
Subject: [PATCH 3/4] ARM: dts: am3: Update clksel clocks to use reg instead of ti,bit-shift
Date: Tue, 13 Feb 2024 12:56:43 +0200
Message-ID: <20240213105730.5287-4-tony@atomide.com>
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

Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 arch/arm/boot/dts/ti/omap/am33xx-clocks.dtsi | 39 +++++++++++---------
 1 file changed, 22 insertions(+), 17 deletions(-)

diff --git a/arch/arm/boot/dts/ti/omap/am33xx-clocks.dtsi b/arch/arm/boot/dts/ti/omap/am33xx-clocks.dtsi
--- a/arch/arm/boot/dts/ti/omap/am33xx-clocks.dtsi
+++ b/arch/arm/boot/dts/ti/omap/am33xx-clocks.dtsi
@@ -108,30 +108,31 @@ clock@664 {
 		compatible = "ti,clksel";
 		reg = <0x664>;
 		#clock-cells = <2>;
-		#address-cells = <0>;
+		#address-cells = <1>;
+		#size-cells = <0>;
 
-		ehrpwm0_tbclk: clock-ehrpwm0-tbclk {
+		ehrpwm0_tbclk: clock-ehrpwm0-tbclk@0 {
+			reg = <0>;
 			#clock-cells = <0>;
 			compatible = "ti,gate-clock";
 			clock-output-names = "ehrpwm0_tbclk";
 			clocks = <&l4ls_gclk>;
-			ti,bit-shift = <0>;
 		};
 
-		ehrpwm1_tbclk: clock-ehrpwm1-tbclk {
+		ehrpwm1_tbclk: clock-ehrpwm1-tbclk@1 {
+			reg = <1>;
 			#clock-cells = <0>;
 			compatible = "ti,gate-clock";
 			clock-output-names = "ehrpwm1_tbclk";
 			clocks = <&l4ls_gclk>;
-			ti,bit-shift = <1>;
 		};
 
-		ehrpwm2_tbclk: clock-ehrpwm2-tbclk {
+		ehrpwm2_tbclk: clock-ehrpwm2-tbclk@2 {
+			reg = <2>;
 			#clock-cells = <0>;
 			compatible = "ti,gate-clock";
 			clock-output-names = "ehrpwm2_tbclk";
 			clocks = <&l4ls_gclk>;
-			ti,bit-shift = <2>;
 		};
 	};
 };
@@ -566,17 +567,19 @@ clock@52c {
 		compatible = "ti,clksel";
 		reg = <0x52c>;
 		#clock-cells = <2>;
-		#address-cells = <0>;
+		#address-cells = <1>;
+		#size-cells = <0>;
 
-		gfx_fclk_clksel_ck: clock-gfx-fclk-clksel {
+		gfx_fclk_clksel_ck: clock-gfx-fclk-clksel@1 {
+			reg = <1>;
 			#clock-cells = <0>;
 			compatible = "ti,mux-clock";
 			clock-output-names = "gfx_fclk_clksel_ck";
 			clocks = <&dpll_core_m4_ck>, <&dpll_per_m2_ck>;
-			ti,bit-shift = <1>;
 		};
 
-		gfx_fck_div_ck: clock-gfx-fck-div {
+		gfx_fck_div_ck: clock-gfx-fck-div@0 {
+			reg = <0>;
 			#clock-cells = <0>;
 			compatible = "ti,divider-clock";
 			clock-output-names = "gfx_fck_div_ck";
@@ -589,30 +592,32 @@ clock@700 {
 		compatible = "ti,clksel";
 		reg = <0x700>;
 		#clock-cells = <2>;
-		#address-cells = <0>;
+		#address-cells = <1>;
+		#size-cells = <0>;
 
-		sysclkout_pre_ck: clock-sysclkout-pre {
+		sysclkout_pre_ck: clock-sysclkout-pre@0 {
+			reg = <0>;
 			#clock-cells = <0>;
 			compatible = "ti,mux-clock";
 			clock-output-names = "sysclkout_pre_ck";
 			clocks = <&clk_32768_ck>, <&l3_gclk>, <&dpll_ddr_m2_ck>, <&dpll_per_m2_ck>, <&lcd_gclk>;
 		};
 
-		clkout2_div_ck: clock-clkout2-div {
+		clkout2_div_ck: clock-clkout2-div@3 {
+			reg = <3>;
 			#clock-cells = <0>;
 			compatible = "ti,divider-clock";
 			clock-output-names = "clkout2_div_ck";
 			clocks = <&sysclkout_pre_ck>;
-			ti,bit-shift = <3>;
 			ti,max-div = <8>;
 		};
 
-		clkout2_ck: clock-clkout2 {
+		clkout2_ck: clock-clkout2@7 {
+			reg = <7>;
 			#clock-cells = <0>;
 			compatible = "ti,gate-clock";
 			clock-output-names = "clkout2_ck";
 			clocks = <&clkout2_div_ck>;
-			ti,bit-shift = <7>;
 		};
 	};
 };
-- 
2.43.1

