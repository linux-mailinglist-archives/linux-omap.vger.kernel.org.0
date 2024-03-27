Return-Path: <linux-omap+bounces-999-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2037988D76E
	for <lists+linux-omap@lfdr.de>; Wed, 27 Mar 2024 08:40:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 93A7BB21F5D
	for <lists+linux-omap@lfdr.de>; Wed, 27 Mar 2024 07:39:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8477C2C1AD;
	Wed, 27 Mar 2024 07:39:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=atomide.com header.i=@atomide.com header.b="dVwjANfO"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail5.25mail.st (mail5.25mail.st [74.50.62.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3068B28E39;
	Wed, 27 Mar 2024 07:39:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.50.62.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711525196; cv=none; b=na43lPTrBcWMj+/CCVxPBp22tvRbGSxZdXb61mjinCDwotWxdY91x+T93wrizQ+TVwwp4lBtPJPaKxCkWpClq6SMy4dZpcH7QHxQ//beeRwCXjbbVNxPcm3XRWtSLU9vnWd3lMy9afdUm6g2So/D8xAyth7nZpNPLsHVNID/CG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711525196; c=relaxed/simple;
	bh=Jet7RLRxd1qTotD/j9in0bUbuuC6kwZ/NH8QeqM99sQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GuoV+Hd/lSBzeXbOtUsQOsDfXZNFbYYggHoW8BUmVgzoQaactlasED76XWpeHoBJEFVUf74GMAEVwbzakNr+ewkDLZCLvHncAbu0qDt6ssHHKOOsGnlQvn7AsQ2/6nz2HUV1C24fe6A/lxr6pJxyG65yQnUzv4UPHGSnYVSy3qA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomide.com; spf=fail smtp.mailfrom=atomide.com; dkim=pass (2048-bit key) header.d=atomide.com header.i=@atomide.com header.b=dVwjANfO; arc=none smtp.client-ip=74.50.62.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomide.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=atomide.com
Received: from localhost (91-158-86-216.elisa-laajakaista.fi [91.158.86.216])
	by mail5.25mail.st (Postfix) with ESMTPSA id D2DEF60434;
	Wed, 27 Mar 2024 07:39:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=atomide.com;
	s=25mailst; t=1711525193;
	bh=Jet7RLRxd1qTotD/j9in0bUbuuC6kwZ/NH8QeqM99sQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=dVwjANfO+cEUmJ4Od+Op6idzhE1vRkggibSupnvHbQFtLol2QP/Q62KaqA8eAZrzh
	 P+N9mJhroR6LN9+y79JsqWFFbT+3YY/CPiW3oWzlFP7sIZaQdPKxeXu2X9Np2l8joL
	 47M0X3rdZZBlS84F8gxl4lXe+0OJeVl5X6EocCbfzwtS9Hu8CvA1YWNMwP13HIoCRV
	 QNqaxbWHjxirjB//TKsHS5npLwn2oghLOecMXfcfByBof85uSQ6pI8neu8pEkx0SRM
	 HsyhPMytU0ayQw0navizYWbBi9efnULdHHlo8uEQT174ybSbwpx+xgUbwt01InZWpo
	 ocO1dfpZbs8+g==
From: Tony Lindgren <tony@atomide.com>
To: linux-omap@vger.kernel.org
Cc: =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
	devicetree@vger.kernel.org
Subject: [PATCH 05/12] ARM: dts: dra7: Use clksel binding for CM_CLKSEL_DPLL_DRR
Date: Wed, 27 Mar 2024 09:38:49 +0200
Message-ID: <20240327073856.21517-6-tony@atomide.com>
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
@@ -538,13 +538,21 @@ core_dpll_out_dclk_div: clock-core-dpll-out-dclk-div {
 		clock-div = <1>;
 	};
 
-	dpll_ddr_byp_mux: clock-dpll-ddr-byp-mux-23@21c {
-		#clock-cells = <0>;
-		compatible = "ti,mux-clock";
-		clock-output-names = "dpll_ddr_byp_mux";
-		clocks = <&sys_clkin1>, <&dpll_abe_m3x2_ck>;
-		ti,bit-shift = <23>;
-		reg = <0x021c>;
+	/* CM_CLKSEL_DPLL_DDR */
+	clock@21c {
+		compatible = "ti,clksel";
+		reg = <0x21c>;
+		#clock-cells = <2>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		dpll_ddr_byp_mux: clock@23 {
+			reg = <23>;
+			compatible = "ti,mux-clock";
+			clock-output-names = "dpll_ddr_byp_mux";
+			clocks = <&sys_clkin1>, <&dpll_abe_m3x2_ck>;
+			#clock-cells = <0>;
+		};
 	};
 
 	dpll_ddr_ck: clock@210 {
-- 
2.44.0

