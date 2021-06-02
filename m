Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EFF0A398DA7
	for <lists+linux-omap@lfdr.de>; Wed,  2 Jun 2021 17:00:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231765AbhFBPCE (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 2 Jun 2021 11:02:04 -0400
Received: from smtp-35.italiaonline.it ([213.209.10.35]:56259 "EHLO libero.it"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231707AbhFBPCD (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 2 Jun 2021 11:02:03 -0400
Received: from passgat-Modern-14-A10M.homenet.telecomitalia.it
 ([79.17.119.101])
        by smtp-35.iol.local with ESMTPA
        id oSLqlJ7WDsptioSLxlKAtt; Wed, 02 Jun 2021 17:00:18 +0200
x-libjamoibt: 1601
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=libero.it; s=s2021;
        t=1622646018; bh=U7JzdCOLhubdapRB+n/j4Q+w7ZfRRrpW+Q5IRnQz5xw=;
        h=From;
        b=y9xotFvUP387QROPgrhEKW+PwL7FWTO3RLRIcDN/igSZXnf3cw8tnLsxtwLVmETGZ
         AvkMNH4L1J4IgnVyrh9yi9P/NC3F21yjC+SwCYUHGmxXZAgcJnnjNyIDPa3dTS3vou
         uRv53XTwPcHT2ZZ3UwaGn52jRMUHsBYMd+zMy09tNTlbY5weIu1yXUHNMV4GR2Mqte
         FjBEm/kMT1OQG2M4clAiwkmW096WPAuH2WnI92rkNQo4loXr2WaQw313LkeNuCvuID
         8GzfeejnialOAkwxN5WBF8WA+yFxjGcQvvG05+Re687tzRivk8P9eD0YgVavd1VXP5
         MZ7mCLTKiug4Q==
X-CNFS-Analysis: v=2.4 cv=Bo1Yfab5 c=1 sm=1 tr=0 ts=60b79d02 cx=a_exe
 a=do1bHx4A/kh2kuTIUQHSxQ==:117 a=do1bHx4A/kh2kuTIUQHSxQ==:17 a=2KMo9-giAAAA:8
 a=2OX5x-OEy5pyK2UBO5QA:9 a=2pGyGSWy5nf2n_rBi4rp:22 a=UeCTMeHK7YUBiLmz_SX7:22
 a=pHzHmUro8NiASowvMSCR:22 a=xoEH_sTeL_Rfw54TyV31:22
From:   Dario Binacchi <dariobin@libero.it>
To:     linux-kernel@vger.kernel.org
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Tony Lindgren <tony@atomide.com>,
        =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        Dario Binacchi <dariobin@libero.it>,
        Tero Kristo <kristo@kernel.org>,
        Lee Jones <lee.jones@linaro.org>,
        Rob Herring <robh@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-omap@vger.kernel.org
Subject: [PATCH v7 4/5] ARM: dts: am43xx-clocks: add spread spectrum support
Date:   Wed,  2 Jun 2021 17:00:07 +0200
Message-Id: <20210602150009.17531-5-dariobin@libero.it>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210602150009.17531-1-dariobin@libero.it>
References: <20210602150009.17531-1-dariobin@libero.it>
X-CMAE-Envelope: MS4xfCYVATIKSNsN+szvlFYb/YLzouBNOgkXXGssk+f9PIf5UV5B1EnyWEFItzYaEgQMBx3qorXZV9yTLxVpS6Qu+Plks0pfFGXTqOw3VQaYwcK24JvDiWnT
 TcuYPt2ZFvmkBz6gMTLrh4zMlH4ueZ2FC0UClHQdqXQiND4co9q3MM1sWBXn0joPjDcjSBteUfs1ug1SY4wtb1UpCsHZbAEg34zHTrekwBIjqYCKJZfjLtlP
 t2fYKy74Gm6wrN3u0IRbh0KD09uS9McNHOLr0Lyp38qOIhc0+CGriNnI6Hyg4TkXkry5s4knc3RTQcA7VJH7iCgdWbMmxDxFWYPVyCW50Fjvxb1s+rSJCyAS
 TMMF2enXD2GpK/NhTQvGd+tdq+T9ejB43mFfnNTMIqopwatsrisJQzqJZ+CJj6Wc0WNc6VhmHj2aNo7TWoce6FipXB5UZaMzE+7rCxpnSRuSC4M6WpU94YdX
 stAJJ7NDv2NDZpYIHLkR62BaOHOSD+Zyro2NTIMNiClN0O9Kf2UHXfEIWpHmdT18s7IH9ANUcz7+eUoDAffYsgg1Di9IHS7xGF7L9YPlWYsyNqQK2RRx1J5l
 zT8=
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Registers for adjusting the spread spectrum clocking (SSC) have been
added. As reported by the TI spruhl7x RM, SSC is supported only for LCD
and MPU PLLs, but the PRCM_CM_SSC_DELTAMSTEP_DPLL_XXX and
PRCM_CM_SSC_MODFREQDIV_DPLL_XXX registers, as well as the enable field
in the PRCM_CM_CLKMODE_DPLL_XXX registers are mapped for all PLLs (CORE,
MPU, DDR, PER, DISP, EXTDEV).

Signed-off-by: Dario Binacchi <dariobin@libero.it>
Acked-by: Tony Lindgren <tony@atomide.com>

---

Changes in v7:
- Add Tony Lindgren acked tag.

 arch/arm/boot/dts/am43xx-clocks.dtsi | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm/boot/dts/am43xx-clocks.dtsi b/arch/arm/boot/dts/am43xx-clocks.dtsi
index c726cd8dbdf1..314fc5975acb 100644
--- a/arch/arm/boot/dts/am43xx-clocks.dtsi
+++ b/arch/arm/boot/dts/am43xx-clocks.dtsi
@@ -204,7 +204,7 @@
 		#clock-cells = <0>;
 		compatible = "ti,am3-dpll-core-clock";
 		clocks = <&sys_clkin_ck>, <&sys_clkin_ck>;
-		reg = <0x2d20>, <0x2d24>, <0x2d2c>;
+		reg = <0x2d20>, <0x2d24>, <0x2d2c>, <0x2d48>, <0x2d4c>;
 	};
 
 	dpll_core_x2_ck: dpll_core_x2_ck {
@@ -250,7 +250,7 @@
 		#clock-cells = <0>;
 		compatible = "ti,am3-dpll-clock";
 		clocks = <&sys_clkin_ck>, <&sys_clkin_ck>;
-		reg = <0x2d60>, <0x2d64>, <0x2d6c>;
+		reg = <0x2d60>, <0x2d64>, <0x2d6c>, <0x2d88>, <0x2d8c>;
 	};
 
 	dpll_mpu_m2_ck: dpll_mpu_m2_ck@2d70 {
@@ -276,7 +276,7 @@
 		#clock-cells = <0>;
 		compatible = "ti,am3-dpll-clock";
 		clocks = <&sys_clkin_ck>, <&sys_clkin_ck>;
-		reg = <0x2da0>, <0x2da4>, <0x2dac>;
+		reg = <0x2da0>, <0x2da4>, <0x2dac>, <0x2dc8>, <0x2dcc>;
 	};
 
 	dpll_ddr_m2_ck: dpll_ddr_m2_ck@2db0 {
@@ -294,7 +294,7 @@
 		#clock-cells = <0>;
 		compatible = "ti,am3-dpll-clock";
 		clocks = <&sys_clkin_ck>, <&sys_clkin_ck>;
-		reg = <0x2e20>, <0x2e24>, <0x2e2c>;
+		reg = <0x2e20>, <0x2e24>, <0x2e2c>, <0x2e48>, <0x2e4c>;
 	};
 
 	dpll_disp_m2_ck: dpll_disp_m2_ck@2e30 {
@@ -313,7 +313,7 @@
 		#clock-cells = <0>;
 		compatible = "ti,am3-dpll-j-type-clock";
 		clocks = <&sys_clkin_ck>, <&sys_clkin_ck>;
-		reg = <0x2de0>, <0x2de4>, <0x2dec>;
+		reg = <0x2de0>, <0x2de4>, <0x2dec>, <0x2e08>, <0x2e0c>;
 	};
 
 	dpll_per_m2_ck: dpll_per_m2_ck@2df0 {
@@ -557,7 +557,7 @@
 		#clock-cells = <0>;
 		compatible = "ti,am3-dpll-clock";
 		clocks = <&sys_clkin_ck>, <&sys_clkin_ck>;
-		reg = <0x2e60>, <0x2e64>, <0x2e6c>;
+		reg = <0x2e60>, <0x2e64>, <0x2e6c>, <0x2e88>, <0x2e8c>;
 	};
 
 	dpll_extdev_m2_ck: dpll_extdev_m2_ck@2e70 {
-- 
2.17.1

