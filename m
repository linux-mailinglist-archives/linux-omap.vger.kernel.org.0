Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A0E8739D166
	for <lists+linux-omap@lfdr.de>; Sun,  6 Jun 2021 22:23:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230214AbhFFUZU (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sun, 6 Jun 2021 16:25:20 -0400
Received: from smtp-35-i2.italiaonline.it ([213.209.12.35]:41567 "EHLO
        libero.it" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230191AbhFFUZU (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Sun, 6 Jun 2021 16:25:20 -0400
Received: from passgat-Modern-14-A10M.homenet.telecomitalia.it
 ([79.17.119.101])
        by smtp-35.iol.local with ESMTPA
        id pzIbl3WgQsptipzIulrvVd; Sun, 06 Jun 2021 22:23:28 +0200
x-libjamoibt: 1601
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=libero.it; s=s2021;
        t=1623011009; bh=3Paw2xB98b+SDuV2alDurkaGEspLbA4rwbMXsFizNMM=;
        h=From;
        b=MdSby0OgzZI5R5rXDCmOyMCtVq1iEgeHEjS1UOhR1iSFX/kOJ85/cUVLvrKye1jGL
         skdgKw+UL1RerYBPUNQUmOcHQZePL1DlBcp0Ku25vFEgTjzFgOnEFRjl25GPmTlAko
         zWFc63srSNxsBRwqX9na+3J/bR/WdObDZdzdNLdWaGM+RomekYXbgeSrCwaAw+iE98
         Sf6SmU/VhauWjovGUumb+PFboeetrBIBFgsTJG3Jwto61VexaSzA2ARWpwwoH0nlWS
         LJ8lwy+FailDXScZ4DzrfXUs7oObn4OgRyWBQJgB3uipSmYhER+5DiOUJhX9RGqnPY
         8crm4zPSE3p5w==
X-CNFS-Analysis: v=2.4 cv=Bo1Yfab5 c=1 sm=1 tr=0 ts=60bd2ec1 cx=a_exe
 a=do1bHx4A/kh2kuTIUQHSxQ==:117 a=do1bHx4A/kh2kuTIUQHSxQ==:17 a=2KMo9-giAAAA:8
 a=4mKMOZvguhLedlVR2KsA:9 a=2pGyGSWy5nf2n_rBi4rp:22 a=UeCTMeHK7YUBiLmz_SX7:22
 a=pHzHmUro8NiASowvMSCR:22 a=xoEH_sTeL_Rfw54TyV31:22
From:   Dario Binacchi <dariobin@libero.it>
To:     linux-clk@vger.kernel.org
Cc:     Rob Herring <robh@kernel.org>, Tony Lindgren <tony@atomide.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Dario Binacchi <dariobin@libero.it>,
        linux-omap@vger.kernel.org, Lee Jones <lee.jones@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        Tero Kristo <kristo@kernel.org>, linux-kernel@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
Subject: [RESEND PATCH v7 3/5] ARM: dts: am33xx-clocks: add spread spectrum support
Date:   Sun,  6 Jun 2021 22:22:51 +0200
Message-Id: <20210606202253.31649-4-dariobin@libero.it>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210606202253.31649-1-dariobin@libero.it>
References: <20210606202253.31649-1-dariobin@libero.it>
X-CMAE-Envelope: MS4xfPwvY5xQFVV4/pzDgB8TnoF1NY4djZ+r16IqcsiOrdU26J1fCCkm7cr65HAyWCd9TWWyjkTFbwXgbcNbIPnJ7UY+VLfesw4POPV3YZs3+pxogzq5Lp+k
 CNws7TcylyThBUyTr3rg4GWDbgk0X7TXwzJsDBUzIBRd7hdWyV1KK/8GiUJzmeVH+fchPqzBlOxW5rwPqhLpAlp0/1WfQdw0xyRabUlsuB0yy13aHcEFKf+t
 hcu9wfFn20PFcg48yVowfPgUoKJRAe7Hngsjy3cs+61P+00W/JnyxoTzVoo1IMW9iGKBV3OFNmG7XrdW4cSEt74EfavXWiJ/sLhtF/etjJ06nWsgDWgUb1zL
 Fhj8LWiXgWqgfCo5qNCjiTcO89er9CyPQwhOhY229WERxaAuOdNfnjU9yuvCexLNv9muy/+P+mTTuQ8+CtX/GE/Txz9juLojhGqzodIPK/vyp4cljZkv/LEY
 p0LxsOqMknTTa1CSDlof4W/rnNd6HGpQFr9V5afccpw3WQV/L/5kZLk5eSIgCbuAwJ/k+GPrjOuFtqgySYIwe8K0dK4hsBfuw835Np8ccOJeP0POTPxFY+dk
 HELEigWJnshZg7XkRgvMc/E2Meu4FoMkm+zIkeuFIqhUrA==
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

