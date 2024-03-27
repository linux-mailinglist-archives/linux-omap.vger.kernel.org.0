Return-Path: <linux-omap+bounces-1000-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 48D2288D772
	for <lists+linux-omap@lfdr.de>; Wed, 27 Mar 2024 08:40:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 029F0299F67
	for <lists+linux-omap@lfdr.de>; Wed, 27 Mar 2024 07:40:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52E982C6AD;
	Wed, 27 Mar 2024 07:40:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=atomide.com header.i=@atomide.com header.b="ddK80o53"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail5.25mail.st (mail5.25mail.st [74.50.62.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B024E2C68B;
	Wed, 27 Mar 2024 07:40:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.50.62.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711525204; cv=none; b=X+wBg/kfyd0JfsKKvX4iGK7moPMLh8QwOOH8vSFjErvVe6IZrQ+kuB1oVPrNNBemimSyau3/yNclt/Gh30XL+2hAdd8SgPdHPEudfo1nMKCxVnQcy8eUVHtIlI69WRhfCdsHGBCthmPKUBGiR3hzfjWlN8GBHXJFPg+HduM8znY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711525204; c=relaxed/simple;
	bh=7AQuuTsw1/EMENBQ+1nba3hXM7xjQOc+Gpmg0SSJ8rw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZSsbA5976LVpV6RR0coq4Sp8HHJdHaiaekWITaEkKW+79H+qA+WibzGVSZalwl2M9VrEl2cqZcPSA7N/fCs+WQdlf8pIFnJz1nwOUXi42t9ZBRqTXDecab41eHUZJalGvaKnCMP4TAtoPIkpoQV8Grs0vHq+rgrxGOL1oM+0ELw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomide.com; spf=fail smtp.mailfrom=atomide.com; dkim=pass (2048-bit key) header.d=atomide.com header.i=@atomide.com header.b=ddK80o53; arc=none smtp.client-ip=74.50.62.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomide.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=atomide.com
Received: from localhost (91-158-86-216.elisa-laajakaista.fi [91.158.86.216])
	by mail5.25mail.st (Postfix) with ESMTPSA id 54F3660545;
	Wed, 27 Mar 2024 07:39:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=atomide.com;
	s=25mailst; t=1711525201;
	bh=7AQuuTsw1/EMENBQ+1nba3hXM7xjQOc+Gpmg0SSJ8rw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ddK80o532it9V0UYjCJkjI4RzAtfyHoFTY/OM/Yta5fSR5xYtO0g3g8tVksvdsgoG
	 VejgGwKFCx/yZOaXZTjdoSmUiUQpjOF7NfSOcH1VKo5tgZRzgfHH8p4QykRWa822Gk
	 qbRazv2pKC2g41FzfPZEtHrKXONC1GBNneGWoqpOMDMvNQar8QXPhD7NgncJHvW2TL
	 r+D9fTqiOiA9yFZPiYbWUY09zxlcSlgPQywPEVmlNC/Nh6i8i40lGaJVyKiVKnIV3X
	 S4YLTgc5BQM0o6Ey8LxlmuATAz86EXxQqvqb6oUSDNppACAFKKNfew7MlG0s/9+39t
	 UfTMf5FlVgtjQ==
From: Tony Lindgren <tony@atomide.com>
To: linux-omap@vger.kernel.org
Cc: =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
	devicetree@vger.kernel.org
Subject: [PATCH 06/12] ARM: dts: dra7: Use clksel binding for CM_CLKSEL_DPLL_GMAC
Date: Wed, 27 Mar 2024 09:38:50 +0200
Message-ID: <20240327073856.21517-7-tony@atomide.com>
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
@@ -575,13 +575,21 @@ dpll_ddr_m2_ck: clock-dpll-ddr-m2-8@220 {
 		ti,invert-autoidle-bit;
 	};
 
-	dpll_gmac_byp_mux: clock-dpll-gmac-byp-mux-23@2b4 {
-		#clock-cells = <0>;
-		compatible = "ti,mux-clock";
-		clock-output-names = "dpll_gmac_byp_mux";
-		clocks = <&sys_clkin1>, <&dpll_abe_m3x2_ck>;
-		ti,bit-shift = <23>;
-		reg = <0x02b4>;
+	/* CM_CLKSEL_DPLL_GMAC */
+	clock@2b4 {
+		compatible = "ti,clksel";
+		reg = <0x2b4>;
+		#clock-cells = <2>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		dpll_gmac_byp_mux: clock@23 {
+			reg = <23>;
+			compatible = "ti,mux-clock";
+			clock-output-names = "dpll_gmac_byp_mux";
+			clocks = <&sys_clkin1>, <&dpll_abe_m3x2_ck>;
+			#clock-cells = <0>;
+		};
 	};
 
 	dpll_gmac_ck: clock@2a8 {
-- 
2.44.0

