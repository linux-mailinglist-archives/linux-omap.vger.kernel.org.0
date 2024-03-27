Return-Path: <linux-omap+bounces-995-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A6E9788D762
	for <lists+linux-omap@lfdr.de>; Wed, 27 Mar 2024 08:39:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 28077B21FFB
	for <lists+linux-omap@lfdr.de>; Wed, 27 Mar 2024 07:39:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 954622C1A6;
	Wed, 27 Mar 2024 07:39:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=atomide.com header.i=@atomide.com header.b="h4dK2TuC"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail5.25mail.st (mail5.25mail.st [74.50.62.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A32351849;
	Wed, 27 Mar 2024 07:39:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.50.62.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711525162; cv=none; b=mvr2K21dh69QQD+U0vimT4NV6GMZWX+rlCAxIubuecC/NzegVdwWRnB1zdxgqSrBYEjJb4z6FCVW/5t1hC+QhdMJ/n/Zw/XLMWC7ac8sDkik9ZPuJOrFVtJR5Edjr2U47+WA7vVsU05SrsIKeZIbJ22OQqxP5zmHCsYVaVlX81k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711525162; c=relaxed/simple;
	bh=p7oSvqr2kvyF+6/oqQ3sMHPOSyc1KdnwxbSjwmu3WXg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YpfwuCvPLVCKiCdu1HdRGaSes4ZhIsq7qpFKzdZMB7SvEQaObWT34YxyO9gNetEH/+wgS6wOgfU8CsufMywFxnCJk20EB+ec6iSCwgYjJttV472sNA6A1yPUUqvRpMmD04gC0db1Rx3ndgBrZoQQtkMbW5C1A6547nN83iigMdI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomide.com; spf=fail smtp.mailfrom=atomide.com; dkim=pass (2048-bit key) header.d=atomide.com header.i=@atomide.com header.b=h4dK2TuC; arc=none smtp.client-ip=74.50.62.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomide.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=atomide.com
Received: from localhost (91-158-86-216.elisa-laajakaista.fi [91.158.86.216])
	by mail5.25mail.st (Postfix) with ESMTPSA id E6EF560545;
	Wed, 27 Mar 2024 07:39:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=atomide.com;
	s=25mailst; t=1711525159;
	bh=p7oSvqr2kvyF+6/oqQ3sMHPOSyc1KdnwxbSjwmu3WXg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=h4dK2TuCz0U6aorLp6aXLWoM5rXrdAUdOfPsXUafUtRtJ+j0+vvdxNvqMDCgCp5qA
	 NYfhXEhAaAWa5hUZcAw0CVYGcg/16x0niGPivIFW6Mqc977c+gJjW7PAqYm+H9iRWj
	 u7huj6PwaYJB2BE5A0yNMk64gyaDHMUAQ1JcB0e3+0CBXpNf1m16NZCijxZC9Xs0Lr
	 2YvULYh24sPONRTttLNn8oDS7KXF68cra7j1tssa+Bcr2sdiRyy3EG6pJh731BqWqJ
	 75K46Bi1lULeVNdAmugo6lEFbL5C3Tv+YurrdFvFxCPNnUf1Lv9Dl1WgIsErwGNOkZ
	 pvWvbRCAGB/LQ==
From: Tony Lindgren <tony@atomide.com>
To: linux-omap@vger.kernel.org
Cc: =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
	devicetree@vger.kernel.org
Subject: [PATCH 01/12] ARM: dts: dra7: Use clksel binding for CM_CLKSEL_DPLL_CORE
Date: Wed, 27 Mar 2024 09:38:45 +0200
Message-ID: <20240327073856.21517-2-tony@atomide.com>
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
@@ -285,13 +285,21 @@ dpll_abe_m3x2_ck: clock-dpll-abe-m3x2-8@1f4 {
 		ti,invert-autoidle-bit;
 	};
 
-	dpll_core_byp_mux: clock-dpll-core-byp-mux-23@12c {
-		#clock-cells = <0>;
-		compatible = "ti,mux-clock";
-		clock-output-names = "dpll_core_byp_mux";
-		clocks = <&sys_clkin1>, <&dpll_abe_m3x2_ck>;
-		ti,bit-shift = <23>;
-		reg = <0x012c>;
+	/* CM_CLKSEL_DPLL_CORE */
+	clock@12c {
+		compatible = "ti,clksel";
+		reg = <0x12c>;
+		#clock-cells = <2>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		dpll_core_byp_mux: clock@23 {
+			reg = <23>;
+			compatible = "ti,mux-clock";
+			clock-output-names = "dpll_core_byp_mux";
+			clocks = <&sys_clkin1>, <&dpll_abe_m3x2_ck>;
+			#clock-cells = <0>;
+		};
 	};
 
 	dpll_core_ck: clock@120 {
-- 
2.44.0

