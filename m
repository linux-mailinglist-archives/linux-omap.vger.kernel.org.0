Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 55EF4398DB3
	for <lists+linux-omap@lfdr.de>; Wed,  2 Jun 2021 17:01:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231224AbhFBPDE (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 2 Jun 2021 11:03:04 -0400
Received: from smtp-35-i2.italiaonline.it ([213.209.12.35]:35592 "EHLO
        libero.it" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231200AbhFBPDB (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 2 Jun 2021 11:03:01 -0400
Received: from passgat-Modern-14-A10M.homenet.telecomitalia.it
 ([79.17.119.101])
        by smtp-35.iol.local with ESMTPA
        id oSLqlJ7WDsptioSLwlKAt3; Wed, 02 Jun 2021 17:00:17 +0200
x-libjamoibt: 1601
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=libero.it; s=s2021;
        t=1622646017; bh=3Paw2xB98b+SDuV2alDurkaGEspLbA4rwbMXsFizNMM=;
        h=From;
        b=XL52OEDzF5JK6RAHvxZWFlW9BC7x+mc7rDTg1t8FySneGnXeAJHyIHwhaf4xAlc06
         JsAv/8u0XC2mubmkhUR+Mbl43C4UIRhNIkWH/baZh0gMdOeRxcsDxCh+xGUxYCJlO2
         lJsEEsal0wc6tMf4j7ZENdVIfX6kg9ig60FEaYz/7y17miUe+EkCVBnaL1PoVekyk3
         LoPe8OSkNSb/Lc+h9UPpk6zsvJS9fqkJSJoFdY6e0/yZ7m5T6uBMeRxfvuJJ5XGAzL
         Ct8ttpjz0UFLYhB0rp+FuWjCLpyyMtFlGS2qc0hnUx+U7ACuKN67Bz/vEN70FdQquM
         ZXgPhYTA9ZJ/A==
X-CNFS-Analysis: v=2.4 cv=Bo1Yfab5 c=1 sm=1 tr=0 ts=60b79d01 cx=a_exe
 a=do1bHx4A/kh2kuTIUQHSxQ==:117 a=do1bHx4A/kh2kuTIUQHSxQ==:17 a=2KMo9-giAAAA:8
 a=4mKMOZvguhLedlVR2KsA:9 a=2pGyGSWy5nf2n_rBi4rp:22 a=UeCTMeHK7YUBiLmz_SX7:22
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
Subject: [PATCH v7 3/5] ARM: dts: am33xx-clocks: add spread spectrum support
Date:   Wed,  2 Jun 2021 17:00:06 +0200
Message-Id: <20210602150009.17531-4-dariobin@libero.it>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210602150009.17531-1-dariobin@libero.it>
References: <20210602150009.17531-1-dariobin@libero.it>
X-CMAE-Envelope: MS4xfEYXBI8IRaJ3GqbviqtMSnKF5q/CRspaRjJLBPHxv2afyx+Cjo+vbLF91gCzFnJYo26KilRmBAax+2mCGzPQvZPr51uu+dW7Ve0kvDSmcsXmC0aG9KPw
 qI4WaWl1w7sR7Y1R88/Nn7mHkTxe7rObg9n6gmHCGEbuknhz4G4TeuD8D+Bmg/h9zK2oWhJqNN7emKiUcnnP1a/aaWuIAL16W8TEp9yr+UfwycuszdX3yypb
 EeyOpN4m4h5T0HXA6c+eLJYwn/B2zqsrluoEZBmiqbHjY7CRLI+dO+xmlhM0BL+HNfD/mVzlTQw/gE9THPSbPqR/qVnacFXns6w2tQs8ys1NK44fuwDOkyoW
 mFoSqWWhG36EWHgxjsS0FXZCah+MqhnqOADzMjiQ4qlY2bY2w+wRD0QUp+dMXbomZ7aDIQFw6mRU8TU3CSH1w2fZY5UfEGzi/8uuTybh+1zSuXymV2XGvQxR
 Sc9LGPlTCbZH/wTCS3d6x70GvjsWvdVTYe35LTsNS5qryCkI7cLX2hBgSnTwvRWCbzyHDVl1l8zfzcwRVbrCArTmBRXtT1AIyeuTpB2f32oUO1phGE89ZbuH
 GdM=
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Registers for adjusting the spread spectrum clocking (SSC) have been
added. As reported by the TI spruh73x RM, SSC is supported only for LCD
and MPU PLLs, but the CM_SSC_DELTAMSTEP_DPLL_XXX and
CM_SSC_MODFREQDIV_DPLL_XXX registers, as well as the enable field in the
CM_CLKMODE_DPLL_XXX registers are mapped for all PLLs (CORE, MPU, DDR,
PER, DISP).

Signed-off-by: Dario Binacchi <dariobin@libero.it>
Acked-by: Tony Lindgren <tony@atomide.com>

---

(no changes since v4)

Changes in v4:
- Add SSC registers for CORE, DDR and PER PLLs.
- Update commit message.

Changes in v3:
- Add Tony Lindgren acked tag.

Changes in v2:
- Remove SSC registers from dpll_core_ck@490 node (SSC is not supported)
- Add SSC registers to dpll_mpu_ck@488 node.

 arch/arm/boot/dts/am33xx-clocks.dtsi | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/arm/boot/dts/am33xx-clocks.dtsi b/arch/arm/boot/dts/am33xx-clocks.dtsi
index dced92a8970e..b7b7106f2dee 100644
--- a/arch/arm/boot/dts/am33xx-clocks.dtsi
+++ b/arch/arm/boot/dts/am33xx-clocks.dtsi
@@ -164,7 +164,7 @@
 		#clock-cells = <0>;
 		compatible = "ti,am3-dpll-core-clock";
 		clocks = <&sys_clkin_ck>, <&sys_clkin_ck>;
-		reg = <0x0490>, <0x045c>, <0x0468>;
+		reg = <0x0490>, <0x045c>, <0x0468>, <0x0460>, <0x0464>;
 	};
 
 	dpll_core_x2_ck: dpll_core_x2_ck {
@@ -204,7 +204,7 @@
 		#clock-cells = <0>;
 		compatible = "ti,am3-dpll-clock";
 		clocks = <&sys_clkin_ck>, <&sys_clkin_ck>;
-		reg = <0x0488>, <0x0420>, <0x042c>;
+		reg = <0x0488>, <0x0420>, <0x042c>, <0x0424>, <0x0428>;
 	};
 
 	dpll_mpu_m2_ck: dpll_mpu_m2_ck@4a8 {
@@ -220,7 +220,7 @@
 		#clock-cells = <0>;
 		compatible = "ti,am3-dpll-no-gate-clock";
 		clocks = <&sys_clkin_ck>, <&sys_clkin_ck>;
-		reg = <0x0494>, <0x0434>, <0x0440>;
+		reg = <0x0494>, <0x0434>, <0x0440>, <0x0438>, <0x043c>;
 	};
 
 	dpll_ddr_m2_ck: dpll_ddr_m2_ck@4a0 {
@@ -244,7 +244,7 @@
 		#clock-cells = <0>;
 		compatible = "ti,am3-dpll-no-gate-clock";
 		clocks = <&sys_clkin_ck>, <&sys_clkin_ck>;
-		reg = <0x0498>, <0x0448>, <0x0454>;
+		reg = <0x0498>, <0x0448>, <0x0454>, <0x044c>, <0x0450>;
 	};
 
 	dpll_disp_m2_ck: dpll_disp_m2_ck@4a4 {
@@ -261,7 +261,7 @@
 		#clock-cells = <0>;
 		compatible = "ti,am3-dpll-no-gate-j-type-clock";
 		clocks = <&sys_clkin_ck>, <&sys_clkin_ck>;
-		reg = <0x048c>, <0x0470>, <0x049c>;
+		reg = <0x048c>, <0x0470>, <0x049c>, <0x0474>, <0x0478>;
 	};
 
 	dpll_per_m2_ck: dpll_per_m2_ck@4ac {
-- 
2.17.1

