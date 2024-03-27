Return-Path: <linux-omap+bounces-996-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 52C4288D764
	for <lists+linux-omap@lfdr.de>; Wed, 27 Mar 2024 08:39:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 83A021C237AE
	for <lists+linux-omap@lfdr.de>; Wed, 27 Mar 2024 07:39:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C07332C1A4;
	Wed, 27 Mar 2024 07:39:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=atomide.com header.i=@atomide.com header.b="sWwKpWDa"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail5.25mail.st (mail5.25mail.st [74.50.62.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE3201849;
	Wed, 27 Mar 2024 07:39:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.50.62.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711525170; cv=none; b=BVTS1dXwmBLvVIh9nm5ZgcqU+zmkpFhNY9N/mujMc1MZmpht/GIXVyez4qZtkUePjTfyrX+weFmVHIy0IoejT0KNTHUDpigf+sOUi6mw73p7kkOafzxzDlrmpWdyto0+FgKQMtMgTnHMB5Swsg5T4/BG3gUapDgXaIqw+4pQMn4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711525170; c=relaxed/simple;
	bh=RVddhQizgv/WLmJYSDiWKcWjwoT+k78bBjIiz7hqBfQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qBpIJedDo58n4DGON+jseTJ66IaLTKpH9qezBDSWW8u8DnM4ZiSe6S3+d7e7BEqmp9hVS8WRlvKqlCkpwuKlmB9+izkMYqjawKWrB2/651F2u2bjL/7v3pGHwGbFA+kS8jdVLvjafdT6HXVBnK79jaCFdE1Lb6fJPvNtZ+525zk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomide.com; spf=fail smtp.mailfrom=atomide.com; dkim=pass (2048-bit key) header.d=atomide.com header.i=@atomide.com header.b=sWwKpWDa; arc=none smtp.client-ip=74.50.62.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomide.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=atomide.com
Received: from localhost (91-158-86-216.elisa-laajakaista.fi [91.158.86.216])
	by mail5.25mail.st (Postfix) with ESMTPSA id 67BE560434;
	Wed, 27 Mar 2024 07:39:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=atomide.com;
	s=25mailst; t=1711525168;
	bh=RVddhQizgv/WLmJYSDiWKcWjwoT+k78bBjIiz7hqBfQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=sWwKpWDaTtLKtCceVRYGvZSFcIczZ8JimNIrQJN4cwrmluqg/V68HriI6vX/MQdg1
	 1lbK+42/4v2a7K7ffW64+Hqf6I11dNghwiJSMKGbL7FJ2TrvJgphI8FWlyyT71IiPq
	 Pnf1ATEdms56GUyIAYNb3YV/5Aa1B4mxo4dbETf3gpuD8gdeK1ZOaw16rsbey6u9y9
	 IzNjWFS03tqWnrezJeQWueAByL+bW/fTfi192j6phXq/EOi9Qb5/s6mNNbNWN89zOE
	 RvV02JkbV+AzFlf7MUhFyi1/QcbsM4Q6b+li1gayb82IHIKPvApBbDrhkJQP1ksjKK
	 1rsmDcL/BlDJA==
From: Tony Lindgren <tony@atomide.com>
To: linux-omap@vger.kernel.org
Cc: =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
	devicetree@vger.kernel.org
Subject: [PATCH 02/12] ARM: dts: dra7: Use clksel binding for CM_CLKSEL_DPLL_DSP
Date: Wed, 27 Mar 2024 09:38:46 +0200
Message-ID: <20240327073856.21517-3-tony@atomide.com>
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
@@ -376,13 +376,21 @@ dsp_dpll_hs_clk_div: clock-dsp-dpll-hs-clk-div {
 		clock-div = <1>;
 	};
 
-	dpll_dsp_byp_mux: clock-dpll-dsp-byp-mux-23@240 {
-		#clock-cells = <0>;
-		compatible = "ti,mux-clock";
-		clock-output-names = "dpll_dsp_byp_mux";
-		clocks = <&sys_clkin1>, <&dsp_dpll_hs_clk_div>;
-		ti,bit-shift = <23>;
-		reg = <0x0240>;
+	/* CM_CLKSEL_DPLL_DSP */
+	clock@240 {
+		compatible = "ti,clksel";
+		reg = <0x240>;
+		#clock-cells = <2>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		dpll_dsp_byp_mux: clock@23 {
+			reg = <23>;
+			compatible = "ti,mux-clock";
+			clock-output-names = "dpll_dsp_byp_mux";
+			clocks = <&sys_clkin1>, <&dsp_dpll_hs_clk_div>;
+			#clock-cells = <0>;
+		};
 	};
 
 	dpll_dsp_ck: clock@234 {
-- 
2.44.0

