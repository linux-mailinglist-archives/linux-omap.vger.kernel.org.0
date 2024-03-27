Return-Path: <linux-omap+bounces-1005-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2589B88D77F
	for <lists+linux-omap@lfdr.de>; Wed, 27 Mar 2024 08:40:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D2D4829A1F2
	for <lists+linux-omap@lfdr.de>; Wed, 27 Mar 2024 07:40:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3CA12C693;
	Wed, 27 Mar 2024 07:40:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=atomide.com header.i=@atomide.com header.b="bvs0p463"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail5.25mail.st (mail5.25mail.st [74.50.62.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00A052C1B8;
	Wed, 27 Mar 2024 07:40:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.50.62.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711525246; cv=none; b=kj/LoIUJx4YVhJy1LdP6oiHIRtFUX0erkaBbcWhxSIswGgj3XopXa82J/Jqbb8TwtxLlqsrW5L88tvAArPVmtf/OfJlOASXboo5MAfs3YGn1s5L/aNKDCiFXQCA/+dEd0zrtS4bW59xf4SK5tbW2V2Txj/EnWPcXaffngcwlscs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711525246; c=relaxed/simple;
	bh=TiqVjopTLcQRE9vxBn8ZXHd2djE90eW2hHA4eK2iM00=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=upNjSI7jKl2tx0jMqkmqXNojOIQzbd2EC2fWD7cQ4fvbcA8G4rgqvJeK7jD4ojgQrVajGcwZsShLROSCwma8gaowJwOUY3Qc3xt6AIWf9nR/KkCHFzedHD3vC7067COJhNSyrQE48sMaYaFfVfRQHrRHXg2KpMjPWzop6ab23Q8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomide.com; spf=fail smtp.mailfrom=atomide.com; dkim=pass (2048-bit key) header.d=atomide.com header.i=@atomide.com header.b=bvs0p463; arc=none smtp.client-ip=74.50.62.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomide.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=atomide.com
Received: from localhost (91-158-86-216.elisa-laajakaista.fi [91.158.86.216])
	by mail5.25mail.st (Postfix) with ESMTPSA id ACFE060434;
	Wed, 27 Mar 2024 07:40:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=atomide.com;
	s=25mailst; t=1711525244;
	bh=TiqVjopTLcQRE9vxBn8ZXHd2djE90eW2hHA4eK2iM00=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=bvs0p463W9QsMs3VGQDiMp1CbuexN9QklrRtH2bUZtAkUgjZTTGvAvBYUktfcQAfo
	 jbKaKCSWbVVQNK3x35vP62gqFt/hfrA+jILMyr1EaIcJCkFKukug1lxE2Qkm9IA6VW
	 mvSkbDnebxDaRHUtz7PsW7VD5bsoovNI9Um9p7pTE6YNP06BTeYFD0OlXTx5xZl7mJ
	 rKPEILoqGreOh1dupUyAMRQ5793KZbou4P8CfXNMUdYI6DWZbkLv3qidXw+k/Zy+Pi
	 JNIbV5JYFYy3jcMk1lEqWvviLbMKjqeZUpKp8fND7pnzFbSPQ+9LUXWuJPvc7AGj7c
	 3XmHNIUUlYh8Q==
From: Tony Lindgren <tony@atomide.com>
To: linux-omap@vger.kernel.org
Cc: =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
	devicetree@vger.kernel.org
Subject: [PATCH 11/12] ARM: dts: dra7: Use clksel binding for CM_CLKSEL_DPLL_USB
Date: Wed, 27 Mar 2024 09:38:55 +0200
Message-ID: <20240327073856.21517-12-tony@atomide.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240327073856.21517-1-tony@atomide.com>
References: <20240327073856.21517-1-tony@atomide.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

With the clkcsel binding we can drop the custom ti,bit-shift devicetree
property in favor of the standard reg property and reduce the number of
clocks to update for the make W-1 dtbs warnings.

Let's also add a comment for the clocksel clock that matches the
documentation.

Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 arch/arm/boot/dts/ti/omap/dra7xx-clocks.dtsi | 47 +++++++++++++-------
 1 file changed, 32 insertions(+), 15 deletions(-)

diff --git a/arch/arm/boot/dts/ti/omap/dra7xx-clocks.dtsi b/arch/arm/boot/dts/ti/omap/dra7xx-clocks.dtsi
--- a/arch/arm/boot/dts/ti/omap/dra7xx-clocks.dtsi
+++ b/arch/arm/boot/dts/ti/omap/dra7xx-clocks.dtsi
@@ -1091,14 +1091,23 @@ per_abe_x1_dclk_div: clock-per-abe-x1-dclk-div@1bc {
 		ti,index-power-of-two;
 	};
 
-	dsp_gclk_div: clock-dsp-gclk-div@18c {
-		#clock-cells = <0>;
-		compatible = "ti,divider-clock";
-		clock-output-names = "dsp_gclk_div";
-		clocks = <&dpll_dsp_m2_ck>;
-		ti,max-div = <64>;
-		reg = <0x018c>;
-		ti,index-power-of-two;
+	/* CM_CLKSEL_DPLL_USB */
+	clock@18c {
+		compatible = "ti,clksel";
+		reg = <0x18c>;
+		#clock-cells = <2>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		dsp_gclk_div: clock@0 {
+			reg = <0>;
+			compatible = "ti,divider-clock";
+			clock-output-names = "dsp_gclk_div";
+			clocks = <&dpll_dsp_m2_ck>;
+			ti,max-div = <64>;
+			ti,index-power-of-two;
+			#clock-cells = <0>;
+		};
 	};
 
 	gpu_dclk: clock-gpu-dclk@1a0 {
@@ -1445,13 +1454,21 @@ func_96m_aon_dclk_div: clock-func-96m-aon-dclk-div {
 		clock-div = <1>;
 	};
 
-	dpll_usb_byp_mux: clock-dpll-usb-byp-mux-23@18c {
-		#clock-cells = <0>;
-		compatible = "ti,mux-clock";
-		clock-output-names = "dpll_usb_byp_mux";
-		clocks = <&sys_clkin1>, <&usb_dpll_hs_clk_div>;
-		ti,bit-shift = <23>;
-		reg = <0x018c>;
+	/* CM_CLKSEL_DPLL_USB */
+	clock@18c {
+		compatible = "ti,clksel";
+		reg = <0x18c>;
+		#clock-cells = <2>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		dpll_usb_byp_mux: clock@23 {
+			reg = <23>;
+			compatible = "ti,mux-clock";
+			clock-output-names = "dpll_usb_byp_mux";
+			clocks = <&sys_clkin1>, <&usb_dpll_hs_clk_div>;
+			#clock-cells = <0>;
+		};
 	};
 
 	dpll_usb_ck: clock@180 {
-- 
2.44.0

