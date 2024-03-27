Return-Path: <linux-omap+bounces-1001-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CA94D88D774
	for <lists+linux-omap@lfdr.de>; Wed, 27 Mar 2024 08:40:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6BF8F1F29191
	for <lists+linux-omap@lfdr.de>; Wed, 27 Mar 2024 07:40:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8F9F2C1AA;
	Wed, 27 Mar 2024 07:40:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=atomide.com header.i=@atomide.com header.b="oyrAWmr2"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail5.25mail.st (mail5.25mail.st [74.50.62.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E0AB2C190;
	Wed, 27 Mar 2024 07:40:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.50.62.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711525212; cv=none; b=qmjmg5jYv5kzXW2cxxbYmLUwbHnU5MpAp1auCzzbXzcCc3TQAzpfGxhosPmIIMZktZtJRXOVsQYinvWqF12aGWvCxaWp7BPwBEOUQXJ6RdUZX6Elx4ypUr721GPpnWIXhGeVV8r8Bmo0l9LC6s0B9oGj8V928hLGzzGOsWMwkB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711525212; c=relaxed/simple;
	bh=Eb8gEuCkT6T45P3JljkYPw5r51CsBFn7LgQZTOmP5e0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hun/KB5vM/l0EZyQLqbGsdaLYil99/VL4P9Yiaes2LIsfP0IFHFGY1JFFZv9vvd26cS3VrUs7x5tdCfMDRWCPuql4bqf8zelRN7GAGbtgpLk5DEaGXs99pjeDy972WY8m25CzH4VFXLxRXmDuDDpPh4x5b3BCB8kZRsYx5ToIfI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomide.com; spf=fail smtp.mailfrom=atomide.com; dkim=pass (2048-bit key) header.d=atomide.com header.i=@atomide.com header.b=oyrAWmr2; arc=none smtp.client-ip=74.50.62.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomide.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=atomide.com
Received: from localhost (91-158-86-216.elisa-laajakaista.fi [91.158.86.216])
	by mail5.25mail.st (Postfix) with ESMTPSA id CDBCF60434;
	Wed, 27 Mar 2024 07:40:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=atomide.com;
	s=25mailst; t=1711525210;
	bh=Eb8gEuCkT6T45P3JljkYPw5r51CsBFn7LgQZTOmP5e0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=oyrAWmr2MAvlEbPcz8iLyp8uZMruEBRpszO3zLHG3plrjZu1jgYoE2Q8bJXoy/SOK
	 OOWuFuWMDnw/2CZctDBmrxP28cJ30epjJnACMk+yWtVQ47kN5z97CvAY0wgC5D/n2l
	 6DWOxRmzo6nuL2XM1in5q6PGpYWfglNZT7rfryvaFoi8ZfqPrSCU7//aUSToVobzkZ
	 +daeZ1llPws2J2KlTvyuhO+RYcosWoxieBaeQi9yKmGjxZRuWoIT+2vne86lfZIya+
	 l6Hv1/Wkugf+G6K5/Ei734Q4ar3yXjkauBWKvTwGEtgQmjwUa59D3+6JPCGHq0ObyS
	 wcns1YCFQLHWQ==
From: Tony Lindgren <tony@atomide.com>
To: linux-omap@vger.kernel.org
Cc: =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
	devicetree@vger.kernel.org
Subject: [PATCH 07/12] ARM: dts: dra7: Use clksel binding for CM_CLKSEL_DPLL_EVE
Date: Wed, 27 Mar 2024 09:38:51 +0200
Message-ID: <20240327073856.21517-8-tony@atomide.com>
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
@@ -666,13 +666,21 @@ eve_dpll_hs_clk_div: clock-eve-dpll-hs-clk-div {
 		clock-div = <1>;
 	};
 
-	dpll_eve_byp_mux: clock-dpll-eve-byp-mux-23@290 {
-		#clock-cells = <0>;
-		compatible = "ti,mux-clock";
-		clock-output-names = "dpll_eve_byp_mux";
-		clocks = <&sys_clkin1>, <&eve_dpll_hs_clk_div>;
-		ti,bit-shift = <23>;
-		reg = <0x0290>;
+	/* CM_CLKSEL_DPLL_EVE */
+	clock@290 {
+		compatible = "ti,clksel";
+		reg = <0x290>;
+		#clock-cells = <2>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		dpll_eve_byp_mux: clock@23 {
+			reg = <23>;
+			compatible = "ti,mux-clock";
+			clock-output-names = "dpll_eve_byp_mux";
+			clocks = <&sys_clkin1>, <&eve_dpll_hs_clk_div>;
+			#clock-cells = <0>;
+		};
 	};
 
 	dpll_eve_ck: clock@284 {
-- 
2.44.0

