Return-Path: <linux-omap+bounces-998-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C071B88D76B
	for <lists+linux-omap@lfdr.de>; Wed, 27 Mar 2024 08:39:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7A3F5299C95
	for <lists+linux-omap@lfdr.de>; Wed, 27 Mar 2024 07:39:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5595C2C1BA;
	Wed, 27 Mar 2024 07:39:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=atomide.com header.i=@atomide.com header.b="EKklZF7g"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail5.25mail.st (mail5.25mail.st [74.50.62.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FBEE1849;
	Wed, 27 Mar 2024 07:39:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.50.62.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711525188; cv=none; b=GhNKkTnOrXkyuxDUKG/QYaiC+1b2HiZnrEHfCJvk93hHBwbf7AuYExxvtjp8198g6TBCfUUtF9gpNChj499bqqFnHwgxgDzpg+J6KW7dA3rrsMYGnkwjNgpn+gJ1qE5OwmDHGuCgLvEYy4U1gAkyWvsOrdE+6SHVrPhVFNNAciw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711525188; c=relaxed/simple;
	bh=0vm7r8k+U1jf17gDBnC33X98JGptcfNl8PyC1/N+wAg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WrzQiaQw5gmT5XlagxWGpxRu6pHCJiX/S5zGqD5W5bkl0JPQyvto4Ct6SxWWI51eO5zCm4dlaRAMqEM3+yPQnUG0BJKmCZWt0ZinpqlvGi0tUE83leKvFLA/0UCyms5h1oFbr9bDGrzf2MNjjDLUCERP8Xa0Bk/3VihwKUKRXig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomide.com; spf=fail smtp.mailfrom=atomide.com; dkim=pass (2048-bit key) header.d=atomide.com header.i=@atomide.com header.b=EKklZF7g; arc=none smtp.client-ip=74.50.62.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomide.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=atomide.com
Received: from localhost (91-158-86-216.elisa-laajakaista.fi [91.158.86.216])
	by mail5.25mail.st (Postfix) with ESMTPSA id 5EE1C60545;
	Wed, 27 Mar 2024 07:39:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=atomide.com;
	s=25mailst; t=1711525184;
	bh=0vm7r8k+U1jf17gDBnC33X98JGptcfNl8PyC1/N+wAg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=EKklZF7gkPQJ9qZ9G0CTwgnjw9V45Z8FnytgjZ3YZN7JhV1VlAjKUhlHHa2toMHOu
	 npj3KBnfns6qP9siQUBwqgQIzHbHVFCuYG+BWk124vTZL6s6H2fsdsu+YnQ175fu6r
	 vbkZKopgd2xTIB+6IxETSSKwSt8+/OBSr5tde7doB9HJP8sq7lMi904Ra3ncuFpeuo
	 vQoQsNnSBkGs+T6WMFBvp6D+twQjuICd6qB5dPRCKrs339Xrau/CY1lQ9tnuDl6jvw
	 dRvVDOQNV5WdK4dumBWfRZz4dl7WvdN0AnO2rctnT2hLVPCfbvMxL0xAASLE61As6y
	 2XEB0MDyUAQiA==
From: Tony Lindgren <tony@atomide.com>
To: linux-omap@vger.kernel.org
Cc: =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
	devicetree@vger.kernel.org
Subject: [PATCH 04/12] ARM: dts: dra7: Use clksel binding for CM_CLKSEL_DPLL_GPU
Date: Wed, 27 Mar 2024 09:38:48 +0200
Message-ID: <20240327073856.21517-5-tony@atomide.com>
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
@@ -476,13 +476,21 @@ iva_dclk: clock-iva-dclk {
 		clock-div = <1>;
 	};
 
-	dpll_gpu_byp_mux: clock-dpll-gpu-byp-mux-23@2e4 {
-		#clock-cells = <0>;
-		compatible = "ti,mux-clock";
-		clock-output-names = "dpll_gpu_byp_mux";
-		clocks = <&sys_clkin1>, <&dpll_abe_m3x2_ck>;
-		ti,bit-shift = <23>;
-		reg = <0x02e4>;
+	/* CM_CLKSEL_DPLL_GPU */
+	clock@2e4 {
+		compatible = "ti,clksel";
+		reg = <0x2e4>;
+		#clock-cells = <2>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		dpll_gpu_byp_mux: clock@23 {
+			reg = <23>;
+			compatible = "ti,mux-clock";
+			clock-output-names = "dpll_gpu_byp_mux";
+			clocks = <&sys_clkin1>, <&dpll_abe_m3x2_ck>;
+			#clock-cells = <0>;
+		};
 	};
 
 	dpll_gpu_ck: clock@2d8 {
-- 
2.44.0

