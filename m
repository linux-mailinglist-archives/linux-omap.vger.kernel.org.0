Return-Path: <linux-omap+bounces-1006-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CE48288D781
	for <lists+linux-omap@lfdr.de>; Wed, 27 Mar 2024 08:41:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 523C9B21E3E
	for <lists+linux-omap@lfdr.de>; Wed, 27 Mar 2024 07:41:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F9AD2C1BA;
	Wed, 27 Mar 2024 07:40:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=atomide.com header.i=@atomide.com header.b="b7QNdfn7"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail5.25mail.st (mail5.25mail.st [74.50.62.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1CA62C1A2;
	Wed, 27 Mar 2024 07:40:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.50.62.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711525255; cv=none; b=NZZ1vVy4ndnydsGUwfJBqKIPsySk9gduhpp/C2CBxsdNm87XM5LtNU3fsVg8lyu+TXxg/YL/ZulNFGiqgFeklGVKUn/DEv3u5/9cg/Okw7JzPd2vQzxVsbsQrQVtwk0mt5VmQg9n5uyLYN9RsNtSmO8K9EGhTQeQClw2hI0QFYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711525255; c=relaxed/simple;
	bh=4+sCcDHnXH4jF4AJ0JZGAAUvvx547SV73RODj5arrOw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gpIp/qlRUfcVyduBOvbwTPNunv71nIjrrv7NcwRaA26AHUPxq9PukdU5NQVLs2Q9GCmUzq/xjRwroyqaAXLkNI7Bwr6haVX6lmcwiE2q7Jm0SU0O/n/rdJrqW7QleW64sKz5Wp0KRKx6rwBctTTV8CQaxH5nns3zwRvv10ctEDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomide.com; spf=fail smtp.mailfrom=atomide.com; dkim=pass (2048-bit key) header.d=atomide.com header.i=@atomide.com header.b=b7QNdfn7; arc=none smtp.client-ip=74.50.62.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomide.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=atomide.com
Received: from localhost (91-158-86-216.elisa-laajakaista.fi [91.158.86.216])
	by mail5.25mail.st (Postfix) with ESMTPSA id 2A10960434;
	Wed, 27 Mar 2024 07:40:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=atomide.com;
	s=25mailst; t=1711525252;
	bh=4+sCcDHnXH4jF4AJ0JZGAAUvvx547SV73RODj5arrOw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=b7QNdfn7otTnMh5BYPx9qS/jq0c+vhLzMbm0w6L2/19Q075wXmyrvHZFnRtcPtvKZ
	 CP0EPPvi9GF4kBPTVtUIHjSJQhqhhMgUq9cbi0+iqPfACDyKIaZUvUY92SchFOgP+H
	 ApA2h8rMP4IiTayxyaZVOqc8T+jWmUAvc81OhWR58Z6ql+QB8Iw6EZ+9Hl1/bZ3Ol4
	 GplVRX4ui2i4tERsqJY6Cx/nCQZFjwPoli4jpCvcsZlOmGOj5At5TkDlRz15pvIk8l
	 qMqucH0Lkxw7LrEb3COdxY0C+kcQWajo1lDTJs0pW+2f15q8nr7gg3Ea6t8ODpWd+w
	 KVRjlQJ1dLdcg==
From: Tony Lindgren <tony@atomide.com>
To: linux-omap@vger.kernel.org
Cc: =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
	devicetree@vger.kernel.org
Subject: [PATCH 12/12] ARM: dts: dra7: Use clksel binding for CTRL_CORE_SMA_SW_0
Date: Wed, 27 Mar 2024 09:38:56 +0200
Message-ID: <20240327073856.21517-13-tony@atomide.com>
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

On dra76x, most dpll_gmac output clksel clocks are in registers from
CM_CLKSEL_DPLL_GMAC to CM_DIV_H13_DPLL_GMAC. In addition to that, there
are there more clocks in the CTRL_CORE_SMA_SW_0 register.

Let's group the CTRL_CORE_SMA_SW_0 clocks using the clksel binding to
reduce make W=1 dtbs unique_unit_address warnings, and stop using the
custom the ti,bit-shift property in favor of the standard reg property.

Let's also add a comment for the CTRL_CORE_SMA_SW_0 clock that matches the
documentation.

Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 arch/arm/boot/dts/ti/omap/dra76x.dtsi | 63 +++++++++++++++------------
 1 file changed, 36 insertions(+), 27 deletions(-)

diff --git a/arch/arm/boot/dts/ti/omap/dra76x.dtsi b/arch/arm/boot/dts/ti/omap/dra76x.dtsi
--- a/arch/arm/boot/dts/ti/omap/dra76x.dtsi
+++ b/arch/arm/boot/dts/ti/omap/dra76x.dtsi
@@ -84,35 +84,44 @@ csi2_1: port@1 {
 };
 
 &scm_conf_clocks {
-	dpll_gmac_h14x2_ctrl_ck: dpll_gmac_h14x2_ctrl_ck@3fc {
-		#clock-cells = <0>;
-		compatible = "ti,divider-clock";
-		clocks = <&dpll_gmac_x2_ck>;
-		ti,max-div = <63>;
-		reg = <0x03fc>;
-		ti,bit-shift = <20>;
-		ti,latch-bit = <26>;
-		assigned-clocks = <&dpll_gmac_h14x2_ctrl_ck>;
-		assigned-clock-rates = <80000000>;
-	};
-
-	dpll_gmac_h14x2_ctrl_mux_ck: dpll_gmac_h14x2_ctrl_mux_ck@3fc {
-		#clock-cells = <0>;
-		compatible = "ti,mux-clock";
-		clocks = <&dpll_gmac_ck>, <&dpll_gmac_h14x2_ctrl_ck>;
+	/* CTRL_CORE_SMA_SW_0 */
+	clock@3fc {
+		compatible = "ti,clksel";
 		reg = <0x3fc>;
-		ti,bit-shift = <29>;
-		ti,latch-bit = <26>;
-		assigned-clocks = <&dpll_gmac_h14x2_ctrl_mux_ck>;
-		assigned-clock-parents = <&dpll_gmac_h14x2_ctrl_ck>;
-	};
+		#clock-cells = <2>;
+		#address-cells = <1>;
+		#size-cells = <0>;
 
-	mcan_clk: mcan_clk@3fc {
-		#clock-cells = <0>;
-		compatible = "ti,gate-clock";
-		clocks = <&dpll_gmac_h14x2_ctrl_mux_ck>;
-		ti,bit-shift = <27>;
-		reg = <0x3fc>;
+		dpll_gmac_h14x2_ctrl_ck: clock@20 {
+			reg = <20>;
+			clock-output-names = "dpll_gmac_h14x2_ctrl_ck";
+			compatible = "ti,divider-clock";
+			clocks = <&dpll_gmac_x2_ck>;
+			ti,max-div = <63>;
+			ti,latch-bit = <26>;
+			assigned-clocks = <&dpll_gmac_h14x2_ctrl_ck>;
+			assigned-clock-rates = <80000000>;
+			#clock-cells = <0>;
+		};
+
+		mcan_clk: clock@27 {
+			reg = <27>;
+			clock-output-names = "mcan_clk";
+			compatible = "ti,gate-clock";
+			clocks = <&dpll_gmac_h14x2_ctrl_mux_ck>;
+			#clock-cells = <0>;
+		};
+
+		dpll_gmac_h14x2_ctrl_mux_ck: clock@29 {
+			reg = <29>;
+			clock-output-names = "dpll_gmac_h14x2_ctrl_mux_ck";
+			compatible = "ti,mux-clock";
+			clocks = <&dpll_gmac_ck>, <&dpll_gmac_h14x2_ctrl_ck>;
+			ti,latch-bit = <26>;
+			assigned-clocks = <&dpll_gmac_h14x2_ctrl_mux_ck>;
+			assigned-clock-parents = <&dpll_gmac_h14x2_ctrl_ck>;
+			#clock-cells = <0>;
+		};
 	};
 };
 
-- 
2.44.0

