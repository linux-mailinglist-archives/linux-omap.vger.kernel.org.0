Return-Path: <linux-omap+bounces-1063-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F42588FE16
	for <lists+linux-omap@lfdr.de>; Thu, 28 Mar 2024 12:31:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 390321C25AE3
	for <lists+linux-omap@lfdr.de>; Thu, 28 Mar 2024 11:31:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA05A7E117;
	Thu, 28 Mar 2024 11:31:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=atomide.com header.i=@atomide.com header.b="TfA3MHa3"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail5.25mail.st (mail5.25mail.st [74.50.62.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A51E7E108;
	Thu, 28 Mar 2024 11:31:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.50.62.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711625511; cv=none; b=FO9wfaoqb2cCFol6MsJE6bbElpxbZ1V2oqB/ISm6lvyHgXJkcc0qdTjQuKk1oxUjr1HcaP5YS/ttRcQzLjtNBsEF38azgXHm3TgpeWqStO1fi/XyhI+y2gwgEtYfMKGoVLwCUkewCRmywLFTQABqnkEuRQWaFMCaRfZtVmfk/BE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711625511; c=relaxed/simple;
	bh=JL9EIgLkHE+REejUbSd8Zbt9nI5lJr4jPR8QemXjNjA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pK7iKQsgo3bj2jNxvZVgJF7K8IV5lpMB3CRJf1m+URblx3EEoF7so1M2ljxnF22FaJCHZLPiUM3Gn8pc+3DIjBzrj17oHoISKPWrkWg/hW9aZ+kanfr1cd39CvHdyJMYDEmqz+91urdOM5O/WqkMktV2KsbNmWF+g5GycEJIvSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomide.com; spf=fail smtp.mailfrom=atomide.com; dkim=pass (2048-bit key) header.d=atomide.com header.i=@atomide.com header.b=TfA3MHa3; arc=none smtp.client-ip=74.50.62.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomide.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=atomide.com
Received: from localhost (91-158-86-216.elisa-laajakaista.fi [91.158.86.216])
	by mail5.25mail.st (Postfix) with ESMTPSA id E49F06054A;
	Thu, 28 Mar 2024 11:31:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=atomide.com;
	s=25mailst; t=1711625502;
	bh=JL9EIgLkHE+REejUbSd8Zbt9nI5lJr4jPR8QemXjNjA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TfA3MHa3iC5CQ3ybvtxZMOuy1bgODYl1JZuErkI5s1b75rgTRV5tquNCTah8xYtEQ
	 lxfZO/0dJ+xyD3HSg3/NEo8af4xYBijiWWBBmik9766wCjtuCD5hTXbhYN+V9VV5Ow
	 cSVDyl/I1Yy8h+erBU+LZjZaQckrU2YMfSQ6/JxLHqlY1JecFpz0hHvk+ZZNX+7V0+
	 RFqj/jMaaec3WwBvtVYA1Nw0ZWTrFUcDocrp6DTqhpUdl+gPJ6HnCksJLvU9Xk7vBD
	 UTWgWVLoQJfIT99yXCT5Vta+cc8iApfXtSHaI1wJVHgH4h7Pk6mHGvqBf7PzU+zjSy
	 FDLIyvq54cNRQ==
Date: Thu, 28 Mar 2024 13:31:33 +0200
From: Tony Lindgren <tony@atomide.com>
To: linux-omap@vger.kernel.org
Cc: =?utf-8?Q?Beno=C3=AEt?= Cousson <bcousson@baylibre.com>,
	devicetree@vger.kernel.org
Subject: Re: [PATCH 00/12] Use clksel for more clocks for dra7
Message-ID: <20240328113133.GG5132@atomide.com>
References: <20240327073856.21517-1-tony@atomide.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240327073856.21517-1-tony@atomide.com>

* Tony Lindgren <tony@atomide.com> [240327 09:39]:
> The DPLL output clocks are problematic at this point as the
> clock driver makes assumptions based on no reg property in
> _register_dpll_x2() for the ti,omap4-dpll-x2-clock. After
> the driver issues are solved, the DPLL output related clocks
> can also use the clksel binding.

Actually the driver needs changes only for clocks where there's no
reg entry. For the clocks with a reg entry like dpll_per m2 outputs,
the following seems to work based on light testing.

Regards,

Tony

8< -----------------
diff --git a/arch/arm/boot/dts/ti/omap/dra7xx-clocks.dtsi b/arch/arm/boot/dts/ti/omap/dra7xx-clocks.dtsi
--- a/arch/arm/boot/dts/ti/omap/dra7xx-clocks.dtsi
+++ b/arch/arm/boot/dts/ti/omap/dra7xx-clocks.dtsi
@@ -1425,6 +1425,7 @@ dpll_per_byp_mux: clock@23 {
 		};
 	};
 
+	/* CM_CLKSEL_DPLL_PER */
 	dpll_per_ck: clock@140 {
 		#clock-cells = <0>;
 		compatible = "ti,omap4-dpll-clock";
@@ -1433,16 +1434,43 @@ dpll_per_ck: clock@140 {
 		reg = <0x0140>, <0x0144>, <0x014c>, <0x0148>;
 	};
 
-	dpll_per_m2_ck: clock-dpll-per-m2-8@150 {
-		#clock-cells = <0>;
-		compatible = "ti,divider-clock";
-		clock-output-names = "dpll_per_m2_ck";
-		clocks = <&dpll_per_ck>;
-		ti,max-div = <31>;
-		ti,autoidle-shift = <8>;
-		reg = <0x0150>;
-		ti,index-starts-at-one;
-		ti,invert-autoidle-bit;
+	/* CM_DIV_M2_DPLL_PER */
+	clock@150 {
+		compatible = "ti,clksel";
+		reg = <0x150>;
+		#clock-cells = <2>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		dpll_per_m2x2_ck: clock@0 {
+			reg = <0>;
+			#clock-cells = <0>;
+			compatible = "ti,divider-clock";
+			clock-output-names = "dpll_per_m2x2_ck";
+			clocks = <&dpll_per_x2_ck>;
+			ti,max-div = <31>;
+			ti,autoidle-shift = <8>;
+			ti,index-starts-at-one;
+			ti,invert-autoidle-bit;
+		};
+
+		dpll_per_m2_ck: clock@8 {
+			compatible = "fixed-factor-clock";
+			reg = <8>;
+			#clock-cells = <0>;
+			clocks = <&dpll_per_m2x2_ck>;
+			clock-mult = <1>;
+			clock-div = <2>;
+			clock-output-names = "dpll_per_m2_ck";
+		};
+
+		dpll_per_x2_ck: clock@10 {
+			reg = <10>;
+			#clock-cells = <0>;
+			compatible = "ti,omap4-dpll-x2-clock";
+			clock-output-names = "dpll_per_x2_ck";
+			clocks = <&dpll_per_ck>;
+		};
 	};
 
 	func_96m_aon_dclk_div: clock-func-96m-aon-dclk-div {
@@ -1503,13 +1531,6 @@ dpll_pcie_ref_m2_ck: clock-dpll-pcie-ref-m2-8@210 {
 		ti,invert-autoidle-bit;
 	};
 
-	dpll_per_x2_ck: clock-dpll-per-x2 {
-		#clock-cells = <0>;
-		compatible = "ti,omap4-dpll-x2-clock";
-		clock-output-names = "dpll_per_x2_ck";
-		clocks = <&dpll_per_ck>;
-	};
-
 	dpll_per_h11x2_ck: clock-dpll-per-h11x2-8@158 {
 		#clock-cells = <0>;
 		compatible = "ti,divider-clock";
@@ -1558,18 +1579,6 @@ dpll_per_h14x2_ck: clock-dpll-per-h14x2-8@164 {
 		ti,invert-autoidle-bit;
 	};
 
-	dpll_per_m2x2_ck: clock-dpll-per-m2x2-8@150 {
-		#clock-cells = <0>;
-		compatible = "ti,divider-clock";
-		clock-output-names = "dpll_per_m2x2_ck";
-		clocks = <&dpll_per_x2_ck>;
-		ti,max-div = <31>;
-		ti,autoidle-shift = <8>;
-		reg = <0x0150>;
-		ti,index-starts-at-one;
-		ti,invert-autoidle-bit;
-	};
-
 	dpll_usb_clkdcoldo: clock-dpll-usb-clkdcoldo {
 		#clock-cells = <0>;
 		compatible = "fixed-factor-clock";
-- 
2.44.0

