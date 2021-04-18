Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F3A5336363B
	for <lists+linux-omap@lfdr.de>; Sun, 18 Apr 2021 16:58:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232029AbhDRO6g (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sun, 18 Apr 2021 10:58:36 -0400
Received: from smtp-35-i2.italiaonline.it ([213.209.12.35]:38830 "EHLO
        libero.it" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231689AbhDRO6g (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Sun, 18 Apr 2021 10:58:36 -0400
Received: from passgat-Modern-14-A10M.homenet.telecomitalia.it
 ([95.244.94.151])
        by smtp-35.iol.local with ESMTPA
        id Y8r3lCRdYpK9wY8rDla5Wd; Sun, 18 Apr 2021 16:57:07 +0200
x-libjamoibt: 1601
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=libero.it; s=s2021;
        t=1618757827; bh=3Paw2xB98b+SDuV2alDurkaGEspLbA4rwbMXsFizNMM=;
        h=From;
        b=rNqy7iAu9lFYAm/emdfUujH4Fc3Q8qJ7Pa27TYxZe0a51UJXy56M0RyqPw0Yuj0mM
         rmaPIDl6Pg8l/uCKpR2CeaHKhZEaf6LJS0IWxdelCpTf8zs+JfTmtFT4FGfWkhjy8a
         FfliNwoyvQKwPgdiuPZMajATIgIsVTlDSavnxl1wXuovKTDdF0q8a9E4CO9Ctaeiqc
         YF41KyaLEf4u7gZRYDL8de9TCVhh6SeJomDLZcKVi0k94eElAFD13BENsdyfezgh/+
         uZKoka3lPZHRDgjBuLnJCbJhtG6Qu2iclDlNWfWxr0N+zNnGY0xC7Uz823/+pEXQ7F
         eupnDmhY0GOPg==
X-CNFS-Analysis: v=2.4 cv=A9ipg4aG c=1 sm=1 tr=0 ts=607c48c3 cx=a_exe
 a=ugxisoNCKEotYwafST++Mw==:117 a=ugxisoNCKEotYwafST++Mw==:17 a=2KMo9-giAAAA:8
 a=4mKMOZvguhLedlVR2KsA:9 a=2pGyGSWy5nf2n_rBi4rp:22 a=UeCTMeHK7YUBiLmz_SX7:22
 a=pHzHmUro8NiASowvMSCR:22 a=xoEH_sTeL_Rfw54TyV31:22
From:   Dario Binacchi <dariobin@libero.it>
To:     linux-kernel@vger.kernel.org
Cc:     Dario Binacchi <dariobin@libero.it>,
        Tero Kristo <kristo@kernel.org>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Tony Lindgren <tony@atomide.com>, devicetree@vger.kernel.org,
        linux-omap@vger.kernel.org
Subject: [PATCH v5 3/5] ARM: dts: am33xx-clocks: add spread spectrum support
Date:   Sun, 18 Apr 2021 16:56:53 +0200
Message-Id: <20210418145655.10415-4-dariobin@libero.it>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210418145655.10415-1-dariobin@libero.it>
References: <20210418145655.10415-1-dariobin@libero.it>
X-CMAE-Envelope: MS4xfCc/eL8KPvanqo4c66nGxCaSMb1fJqL16U04ooYl6EE9xkSXXnlxZfVZvE851n15GRrslKkdwQxT/KAJIJ5A5eSXtuFYeaCZmh95jJI3rnOcaP9AYvZY
 Dir4KfjFzv+JjLWeWywRs8V3a5ZH813DKQJhFOTieyD192vLD0HVEWYPAsWv6q80kJbloDrNiMivVtEhO7UdCtxqDYhImbnevu/lKW7NCbo9FWO2IGWCI9lh
 9vc6ED47bCvoO7qHmlTn5M8FoXUJYnq+xd8eIA73n6OGk5uxcUSa6TrSpX7MwNsMNmxKfOgVBNU4jUqJ/uNwVc+ssAjgrDVmHwh7e19cRIr/XEbgNL5J2RNC
 H4Y+povisxRU04T/tHnNZSrS7PuwY18GDRon45jzHyriR/HNlHli4KQx7BxWSYKLT3dDRj0b3E59PCkynwBCA2ct+UMlvvpvhiaFZr+QbODeulFpDnYFBjFW
 eO+VPrCkpnlrWACK2m0yuwIqElIYdGERO96DMw==
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

