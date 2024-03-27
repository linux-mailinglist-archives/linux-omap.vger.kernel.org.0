Return-Path: <linux-omap+bounces-1002-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B347F88D776
	for <lists+linux-omap@lfdr.de>; Wed, 27 Mar 2024 08:40:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E58711C23E1A
	for <lists+linux-omap@lfdr.de>; Wed, 27 Mar 2024 07:40:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 433902C1BA;
	Wed, 27 Mar 2024 07:40:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=atomide.com header.i=@atomide.com header.b="lIWKkWrk"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail5.25mail.st (mail5.25mail.st [74.50.62.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3AA82C190;
	Wed, 27 Mar 2024 07:40:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.50.62.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711525220; cv=none; b=ZMxtljGWiNUkJGfySbXiEk60dGTXQSsMXCNkF21nEP11tBRT/glXjYNKThLScGMs57P7A7QVZQnRDRQE2dBy2HezPEXgu6inu13etarGJqJ7LeuPBgvfSgVYNbSO7zRlGd/oy7hqUX5rtEubWesxm6cGHQ5icaP4fdBN/1aKeKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711525220; c=relaxed/simple;
	bh=9Jfqynt/vTQY6ql67GtyOuF0Q20WQsGtOCKWOQ/IVlU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RhHiFPyO4O2JtaMfPIW2dOZEZkQb3ZR4z8fno0ozdj2mOrepFK1ttG52XORDEZpgUOfP0CCz9noGWdM24Hk+JXdOE/blnC07VadoEOJvwmbA0EeEWt45Avq5xlauPRlsFabEIvZrgj5f9dI5Ws7YrCESwpsgjZ6q9inC5Nz3tV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomide.com; spf=fail smtp.mailfrom=atomide.com; dkim=pass (2048-bit key) header.d=atomide.com header.i=@atomide.com header.b=lIWKkWrk; arc=none smtp.client-ip=74.50.62.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomide.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=atomide.com
Received: from localhost (91-158-86-216.elisa-laajakaista.fi [91.158.86.216])
	by mail5.25mail.st (Postfix) with ESMTPSA id 4C36360434;
	Wed, 27 Mar 2024 07:40:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=atomide.com;
	s=25mailst; t=1711525218;
	bh=9Jfqynt/vTQY6ql67GtyOuF0Q20WQsGtOCKWOQ/IVlU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=lIWKkWrky2DPbPWWj9DnqmIbm1MeJtrHhMMgEmPQ8M23aylal+eZlcH7MUZ0UA3Ec
	 i0KxsrjONacszFfJa3KEB9KmAy/+aBq2Ug2Drv0mq36LTtUzLeF8+uaRtlTv06QuUL
	 2+CgjIyhUWGKQuoSmxsRO0nLjodirMB7z9IDXteTPYx2Tsg2eMOZFytj1lz7OzruDm
	 DXqdlQjDuwD3RkK9yN4S6fHfvG+reoqXe/t2TNwapgeJN9sK3UBpFsl779MuS0O6Ns
	 eyjcp+m8LumLXW9r0SDviBrmCLJ2F2WEreuELKLfaSYHCAD2u5W4bdvaEwzruBDd2G
	 LXuWKVnlMw1CQ==
From: Tony Lindgren <tony@atomide.com>
To: linux-omap@vger.kernel.org
Cc: =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
	devicetree@vger.kernel.org
Subject: [PATCH 08/12] ARM: dts: dra7: Use clksel binding for CM_CLKSEL_CORE
Date: Wed, 27 Mar 2024 09:38:52 +0200
Message-ID: <20240327073856.21517-9-tony@atomide.com>
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
 arch/arm/boot/dts/ti/omap/dra7xx-clocks.dtsi | 26 +++++++++++++-------
 1 file changed, 17 insertions(+), 9 deletions(-)

diff --git a/arch/arm/boot/dts/ti/omap/dra7xx-clocks.dtsi b/arch/arm/boot/dts/ti/omap/dra7xx-clocks.dtsi
--- a/arch/arm/boot/dts/ti/omap/dra7xx-clocks.dtsi
+++ b/arch/arm/boot/dts/ti/omap/dra7xx-clocks.dtsi
@@ -894,15 +894,23 @@ hdmi_div_clk: clock-hdmi-div {
 		clock-div = <1>;
 	};
 
-	l3_iclk_div: clock-l3-iclk-div-4@100 {
-		#clock-cells = <0>;
-		compatible = "ti,divider-clock";
-		clock-output-names = "l3_iclk_div";
-		ti,max-div = <2>;
-		ti,bit-shift = <4>;
-		reg = <0x0100>;
-		clocks = <&dpll_core_h12x2_ck>;
-		ti,index-power-of-two;
+	/* CM_CLKSEL_CORE */
+	clock@100 {
+		compatible = "ti,clksel";
+		reg = <0x100>;
+		#clock-cells = <2>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		l3_iclk_div: clock@4 {
+			reg = <4>;
+			compatible = "ti,divider-clock";
+			clock-output-names = "l3_iclk_div";
+			ti,max-div = <2>;
+			clocks = <&dpll_core_h12x2_ck>;
+			ti,index-power-of-two;
+			#clock-cells = <0>;
+		};
 	};
 
 	l4_root_clk_div: clock-l4-root-clk-div {
-- 
2.44.0

