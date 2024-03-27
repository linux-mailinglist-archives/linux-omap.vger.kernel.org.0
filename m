Return-Path: <linux-omap+bounces-1004-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A088788D77D
	for <lists+linux-omap@lfdr.de>; Wed, 27 Mar 2024 08:40:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 56D541F29377
	for <lists+linux-omap@lfdr.de>; Wed, 27 Mar 2024 07:40:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F16A2C1B4;
	Wed, 27 Mar 2024 07:40:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=atomide.com header.i=@atomide.com header.b="PoA+RZqL"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail5.25mail.st (mail5.25mail.st [74.50.62.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7594322F0F;
	Wed, 27 Mar 2024 07:40:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.50.62.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711525237; cv=none; b=XuNOk6jz4b3NN6XOa2k9ZHBLCVpMRBcSiVwyaVA/7drO1Gaes3Fr3NspzBzMy2uUEWq+Whh1T8NLCU9intt1jRpffsMUJNEKtVlEr2N4eo2WUm1LVedzUxAUTdxfzgsOWafutqKb0WdjgIQxgKP07cFPDG7J0IeUCc68+s7k70s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711525237; c=relaxed/simple;
	bh=ykjgYa0SVJrKS9+BDAp9sif6sKYLhWhxgrBd++fFoQI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kkHi/Dk9gVxBliymr2Infs3HBpFDnSkPrncGBr0FZNqdK/yTqn13UHZqDFRpbn6i7/j98WG1Nt4jzpuLGt2QNvmSCpSV2YJX26r9HskbSbForoq2stsXiTSlya5FFSSDsud8aQIEZaM10w+qjRu8jo+AwFmyKCmHszGgV4wZ5U4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomide.com; spf=fail smtp.mailfrom=atomide.com; dkim=pass (2048-bit key) header.d=atomide.com header.i=@atomide.com header.b=PoA+RZqL; arc=none smtp.client-ip=74.50.62.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomide.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=atomide.com
Received: from localhost (91-158-86-216.elisa-laajakaista.fi [91.158.86.216])
	by mail5.25mail.st (Postfix) with ESMTPSA id 3B38C60434;
	Wed, 27 Mar 2024 07:40:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=atomide.com;
	s=25mailst; t=1711525235;
	bh=ykjgYa0SVJrKS9+BDAp9sif6sKYLhWhxgrBd++fFoQI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=PoA+RZqLM+Op8OEBCmskDiQ2pD/SPrzRdy0cBeXYmgJPQOs129tn8v94y2vDUH4gN
	 1QwDFsAkpgpeva0PmP/meIXE6oOH8zrUonI4fIutraxj0c1hymJX/9+Ix9rkotzkN5
	 uvfrHz/N3BNRr+SjNFc2REkaQwtDljsSn/EZaBlhabmjvqpgwB8vT/0ILXi4nbCIJf
	 Di0rg4HeJM0SwTM59kZoCsBTlMiizEVsxIxFgCJPTDBxFFVQkBZ5KlO7DrpdBkXJ8V
	 vNKi1+HBlvGi80Py3RuDuSlStQLHBXVoGlPGk3LaT7we7AUukxEIwDXNZpv/JuP24R
	 r3L4ZmU+xijBg==
From: Tony Lindgren <tony@atomide.com>
To: linux-omap@vger.kernel.org
Cc: =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
	devicetree@vger.kernel.org
Subject: [PATCH 10/12] ARM: dts: dra7: Use clksel binding for CM_CLKSEL_DPLL_PER
Date: Wed, 27 Mar 2024 09:38:54 +0200
Message-ID: <20240327073856.21517-11-tony@atomide.com>
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
 arch/arm/boot/dts/ti/omap/dra7xx-clocks.dtsi | 22 +++++++++++++-------
 1 file changed, 15 insertions(+), 7 deletions(-)

diff --git a/arch/arm/boot/dts/ti/omap/dra7xx-clocks.dtsi b/arch/arm/boot/dts/ti/omap/dra7xx-clocks.dtsi
--- a/arch/arm/boot/dts/ti/omap/dra7xx-clocks.dtsi
+++ b/arch/arm/boot/dts/ti/omap/dra7xx-clocks.dtsi
@@ -1399,13 +1399,21 @@ apll_pcie_m2_ck: clock-apll-pcie-m2 {
 		clock-div = <1>;
 	};
 
-	dpll_per_byp_mux: clock-dpll-per-byp-mux-23@14c {
-		#clock-cells = <0>;
-		compatible = "ti,mux-clock";
-		clock-output-names = "dpll_per_byp_mux";
-		clocks = <&sys_clkin1>, <&per_dpll_hs_clk_div>;
-		ti,bit-shift = <23>;
-		reg = <0x014c>;
+	/* CM_CLKSEL_DPLL_PER */
+	clock@14c {
+		compatible = "ti,clksel";
+		reg = <0x14c>;
+		#clock-cells = <2>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		dpll_per_byp_mux: clock@23 {
+			reg = <23>;
+			compatible = "ti,mux-clock";
+			clock-output-names = "dpll_per_byp_mux";
+			clocks = <&sys_clkin1>, <&per_dpll_hs_clk_div>;
+			#clock-cells = <0>;
+		};
 	};
 
 	dpll_per_ck: clock@140 {
-- 
2.44.0

