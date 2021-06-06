Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CFDF439D169
	for <lists+linux-omap@lfdr.de>; Sun,  6 Jun 2021 22:23:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230231AbhFFUZW (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sun, 6 Jun 2021 16:25:22 -0400
Received: from smtp-35-i2.italiaonline.it ([213.209.12.35]:41567 "EHLO
        libero.it" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230233AbhFFUZV (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Sun, 6 Jun 2021 16:25:21 -0400
Received: from passgat-Modern-14-A10M.homenet.telecomitalia.it
 ([79.17.119.101])
        by smtp-35.iol.local with ESMTPA
        id pzIbl3WgQsptipzIwlrvWA; Sun, 06 Jun 2021 22:23:31 +0200
x-libjamoibt: 1601
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=libero.it; s=s2021;
        t=1623011011; bh=U7JzdCOLhubdapRB+n/j4Q+w7ZfRRrpW+Q5IRnQz5xw=;
        h=From;
        b=QsPF7m6FrYBl8qSo9HRUZVrEHnBdmPzj5GuK95mg1NF7YmN0XnGCUHzoLQDU2ioMH
         yU5ixa1KbiHA0x0A8AajmKbBOhPU00QJDqQ0jyDc79swM2gEbKUPPdG6THHXzPfUgo
         p9LpUTnBPRusfNS7KJJ7AKpQZFCr7UOGEOV/D8MXm2xZnM/FoeC4qzPMCZ2aW5m/NS
         ykFAp39/kzP3F8ipBCAJZdLy3ZPRtCrvL0TKZ634pWWonmG1wnigrlAc3/smAUxXAC
         Rvb2IG9Fi1BmQTbAAPg/wpE9Zh++c4+jw/xaBpQbZNyrAY1eCrY3yvGtGdC400uUg5
         J532zA7TSoHEQ==
X-CNFS-Analysis: v=2.4 cv=Bo1Yfab5 c=1 sm=1 tr=0 ts=60bd2ec3 cx=a_exe
 a=do1bHx4A/kh2kuTIUQHSxQ==:117 a=do1bHx4A/kh2kuTIUQHSxQ==:17 a=2KMo9-giAAAA:8
 a=2OX5x-OEy5pyK2UBO5QA:9 a=2pGyGSWy5nf2n_rBi4rp:22 a=UeCTMeHK7YUBiLmz_SX7:22
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
Subject: [RESEND PATCH v7 4/5] ARM: dts: am43xx-clocks: add spread spectrum support
Date:   Sun,  6 Jun 2021 22:22:52 +0200
Message-Id: <20210606202253.31649-5-dariobin@libero.it>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210606202253.31649-1-dariobin@libero.it>
References: <20210606202253.31649-1-dariobin@libero.it>
X-CMAE-Envelope: MS4xfPyspAKfdUGEueRhdjslJy1juqaeSj/rCbkuJQR0o+ZWBwm71JoP5e60ho7jKjB+wZ7FuIniQnVNnqsx7062+pMxs0HCsTmVVJCjeDc1jp2FeHxcCAYq
 fA1CMpjZzPWViwFINgiDpGt+guijAL7qbZ31gIfAgvjWGiXtCqOY9WyiGgeermFhovxpOv3AlrYBtcBa1pNJDC5Rw0ayjCoa6Pvbwa/ent2ZyoK4F0jaFD1Z
 nHBw5eRTFGb/kVMN9rtIbMOcslThF1C2u/ZQEW49NelIC4IEd7ajNYQ5xZj9OCrkrBPchJsMP/GWv64hb68Cx8Bd5KeNBpMf43oCSUfOWPnggAacsmhXKKwg
 d94r271xItR/u6FhcZe34CdF5zGEMFspj/JCbtYx7OPnmVNa4PbqGuwvQiCnyMbjYedRn8c24Y16zeRzu3RmQ9dTlKeYL4fJmFl12DfgV20OjPmi7SEtGJqT
 P/cDYM3+n0cyawtEdNUdMv6I0G/GpFWfOfjUtdtw3258VQ1Vq3Dql+WtWAEErIlsIUDPHn60uNGgUoVqmuhel78hbaIWrmgkHBr9sS84MTML8QAne2o2boid
 skgvqTFv3yPulzD9zAJwn/YcyuOJzuzTgimqeyPClhmvIg==
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

