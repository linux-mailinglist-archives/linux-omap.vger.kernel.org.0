Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1AC0E352001
	for <lists+linux-omap@lfdr.de>; Thu,  1 Apr 2021 21:38:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235386AbhDATix (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 1 Apr 2021 15:38:53 -0400
Received: from smtp-17-i2.italiaonline.it ([213.209.12.17]:57076 "EHLO
        libero.it" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S235343AbhDATix (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 1 Apr 2021 15:38:53 -0400
Received: from passgat-Modern-14-A10M.homenet.telecomitalia.it
 ([87.20.116.197])
        by smtp-17.iol.local with ESMTPA
        id S38SlkFJgtpGHS38Zly35q; Thu, 01 Apr 2021 21:37:52 +0200
x-libjamoibt: 1601
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=libero.it; s=s2021;
        t=1617305872; bh=qOs8UQ0N2YG/FC/XTKaIbBPrPBb+knu4tZ9+Ttf9OAI=;
        h=From;
        b=p08rAinRu/ePIZork31J7uHozVi2cIt7BwRCZnDs3pZzStru3ODiqNW3HHJqDhTym
         0PTBZn7BOfopaoIs5hPMQW7ir+HC/0W/euyzVJzL3lqjMWo2wRfPufiKt6lmFvwcmM
         g2jmdlPkeGhfzKkvN65UYi2wNDHoKWZoM3qGDiDKA9Le53b4Q2TpyMr1CS8SFbF5u0
         8U4KvONeVknGQcFc7M8iybzkO6gR1V9WLDesCFKrcLx2a4OZhuSiVknNRvGTvDO4s7
         eysG/eEB4NXJwIt44I+5eZkk8nCsiaqrbbXm4B8FKlHPPsf8K381aOWGdSs9yUDcsi
         2w9hYhC19Sw0g==
X-CNFS-Analysis: v=2.4 cv=Q7IXX66a c=1 sm=1 tr=0 ts=60662110 cx=a_exe
 a=AVqmXbCQpuNSdJmApS5GbQ==:117 a=AVqmXbCQpuNSdJmApS5GbQ==:17 a=2KMo9-giAAAA:8
 a=4mKMOZvguhLedlVR2KsA:9 a=2pGyGSWy5nf2n_rBi4rp:22 a=UeCTMeHK7YUBiLmz_SX7:22
 a=pHzHmUro8NiASowvMSCR:22 a=xoEH_sTeL_Rfw54TyV31:22
From:   Dario Binacchi <dariobin@libero.it>
To:     linux-kernel@vger.kernel.org
Cc:     Grygorii Strashko <grygorii.strashko@ti.com>,
        Dario Binacchi <dariobin@libero.it>,
        =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Tony Lindgren <tony@atomide.com>, devicetree@vger.kernel.org,
        linux-omap@vger.kernel.org
Subject: [PATCH v4 3/5] ARM: dts: am33xx-clocks: add spread spectrum support
Date:   Thu,  1 Apr 2021 21:37:39 +0200
Message-Id: <20210401193741.24639-4-dariobin@libero.it>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210401193741.24639-1-dariobin@libero.it>
References: <20210401193741.24639-1-dariobin@libero.it>
X-CMAE-Envelope: MS4xfPYtP5YGMi3g0ZQoO0gS6DLWX6tZ4HR38Hcc9oUC1Al0ronS0NYwLxsl9jw8DheUnm3qQ4r8w0SIlriXZ7Tnv9pouGOUuiEwUPfTs2NEfhA2HdSTIAYN
 uPEIVPUxgxJ4FHO7URkA7AqBTxS/XEBnVrJQ7JSbyryMIaODRI8EB8ayC84daTgy3DWE/1D6zGtZs2lL8Q6Sw2BnyrOoT3UKJ7vgMQtqv9IkAwPkb3TwVhLh
 DqpfjukPTvqLRTlJzZNCx36XsBId9FbGTqHCopuw9cHWQNqtDhe8cG1d2xX1hRJC9DppNtibrvCBXqOI839RLrFPYMWd/seggXHmxhJVFfzckgK4atGRjc4X
 +FdAuhYJlVeXQLe1NDka2RQVz0EJoe048jF+vRQJFpToVGpTrW9OFtcJJ0YTXQK0mHoExwUEmgQTTgBVa2vf1gqF2VAxYaqWstVz/sEJ5tzEn9Bv35hegxak
 nxdrppN/SGjxe7fZ
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

