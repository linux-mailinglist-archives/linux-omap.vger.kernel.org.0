Return-Path: <linux-omap+bounces-1003-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A7CEA88D778
	for <lists+linux-omap@lfdr.de>; Wed, 27 Mar 2024 08:40:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5FE9729A0D7
	for <lists+linux-omap@lfdr.de>; Wed, 27 Mar 2024 07:40:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B34902C1B8;
	Wed, 27 Mar 2024 07:40:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=atomide.com header.i=@atomide.com header.b="kd9bJRIr"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail5.25mail.st (mail5.25mail.st [74.50.62.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E0C82C198;
	Wed, 27 Mar 2024 07:40:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.50.62.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711525229; cv=none; b=XCwY79jqqAs4XmVI2tEscOOf+kX3mvGnXIybwbltiuJ9PspQAVgp9YbkOgHCkUnnP8wzb/jgXVr/Oo9CKzsN4fFniNuAEsOp5SXwfZlyBT5HF8GK4nZGVxTeXNUpFUkmzVfljD+aICPqiTw+H5UnfMOBDaQ3ZvX5fNCv9vG8P94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711525229; c=relaxed/simple;
	bh=aUlHtQXOCQeThiv/W7Kda+XL7UgMmEMloTniNlcPRyY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KUS/+DFQ3QFyh0aYxDvQvpH3alAp9pCUawdLuOyrjf5Et5k1JGjNwhl04v3YfKoHMDT6AcdPUDCj2mmpE1fpRurOBQnzf2nXSv9UcrdqLSkEWVMD0dKpbK38r1WyNSslMWjBaCBfmyHwgO/i+7qXvgRUy9Ic8M7MgR95623X6AM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomide.com; spf=fail smtp.mailfrom=atomide.com; dkim=pass (2048-bit key) header.d=atomide.com header.i=@atomide.com header.b=kd9bJRIr; arc=none smtp.client-ip=74.50.62.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomide.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=atomide.com
Received: from localhost (91-158-86-216.elisa-laajakaista.fi [91.158.86.216])
	by mail5.25mail.st (Postfix) with ESMTPSA id C052460434;
	Wed, 27 Mar 2024 07:40:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=atomide.com;
	s=25mailst; t=1711525227;
	bh=aUlHtQXOCQeThiv/W7Kda+XL7UgMmEMloTniNlcPRyY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=kd9bJRIrj5vo1yYrn9sgnHXCrhGHLJk1YM1R55dKHNpqcqvblKVnqlhVYRZQRFYAU
	 GV3Rj/qbhxuEzepPqHd3a7phoAx5mPESkuPhE1d6/VtYRhpSJ6XyL/NNpi6p/GwkMb
	 WN3flDDFe8l7pxzgnnj6vInYSC41ORdIeFFVTzBxcKz8y0MwLOFpAdSZgdJ/Sm9NU5
	 EO9J2bk5Bv7ns3WqLGzcebTfQwVVOKQ7WrmYpCecT27fK/FjA+2X6pbUskPZDXg8rT
	 GOCNGi/2Arwxp/yMtd41Ok5N2sQM1Lo3O+gNwEUYNaMf/M0oqf618D8YI4CJGTr5wn
	 mf1/RLSn4sMSg==
From: Tony Lindgren <tony@atomide.com>
To: linux-omap@vger.kernel.org
Cc: =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
	devicetree@vger.kernel.org
Subject: [PATCH 09/12] ARM: dts: dra7: Use clksel binding for CM_CLKSEL_ABE_PLL_SYS
Date: Wed, 27 Mar 2024 09:38:53 +0200
Message-ID: <20240327073856.21517-10-tony@atomide.com>
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
 arch/arm/boot/dts/ti/omap/dra7xx-clocks.dtsi | 21 ++++++++++++++------
 1 file changed, 15 insertions(+), 6 deletions(-)

diff --git a/arch/arm/boot/dts/ti/omap/dra7xx-clocks.dtsi b/arch/arm/boot/dts/ti/omap/dra7xx-clocks.dtsi
--- a/arch/arm/boot/dts/ti/omap/dra7xx-clocks.dtsi
+++ b/arch/arm/boot/dts/ti/omap/dra7xx-clocks.dtsi
@@ -975,12 +975,21 @@ sys_clkin1: clock-sys-clkin1@110 {
 		ti,index-starts-at-one;
 	};
 
-	abe_dpll_sys_clk_mux: clock-abe-dpll-sys-clk-mux@118 {
-		#clock-cells = <0>;
-		compatible = "ti,mux-clock";
-		clock-output-names = "abe_dpll_sys_clk_mux";
-		clocks = <&sys_clkin1>, <&sys_clkin2>;
-		reg = <0x0118>;
+	/* CM_CLKSEL_ABE_PLL_SYS */
+	clock@118 {
+		compatible = "ti,clksel";
+		reg = <0x118>;
+		#clock-cells = <2>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		abe_dpll_sys_clk_mux: clock@0 {
+			reg = <0>;
+			compatible = "ti,mux-clock";
+			clock-output-names = "abe_dpll_sys_clk_mux";
+			clocks = <&sys_clkin1>, <&sys_clkin2>;
+			#clock-cells = <0>;
+		};
 	};
 
 	abe_dpll_bypass_clk_mux: clock-abe-dpll-bypass-clk-mux@114 {
-- 
2.44.0

