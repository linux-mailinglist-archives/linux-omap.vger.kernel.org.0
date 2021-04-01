Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6C7FE351FEE
	for <lists+linux-omap@lfdr.de>; Thu,  1 Apr 2021 21:38:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234646AbhDAThy (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 1 Apr 2021 15:37:54 -0400
Received: from smtp-17.italiaonline.it ([213.209.10.17]:50670 "EHLO libero.it"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S234663AbhDAThy (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 1 Apr 2021 15:37:54 -0400
Received: from passgat-Modern-14-A10M.homenet.telecomitalia.it
 ([87.20.116.197])
        by smtp-17.iol.local with ESMTPA
        id S38SlkFJgtpGHS38aly35z; Thu, 01 Apr 2021 21:37:52 +0200
x-libjamoibt: 1601
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=libero.it; s=s2021;
        t=1617305872; bh=PPTo8GvjIIsaEKU5B1TIF8N7cm5fuyUf7SEXiLKXv5E=;
        h=From;
        b=TJxV+jegUHc5eLgKL/DfXVav+CokGdOwC+xRA0gY3+dQ3Qe6g5/d6E6Lo4S32BzZH
         kBPGUaJ5gkQFC64qbAufGqBb4qbB6rX/ZCi2hyAQO1HcMhSOmsxKAGti0WIXpKPX+s
         6iHDjNaCQPg8bZqfdDEpU32swqaglhFf3j42xuW5L6F6h8maOvH3wu8EQlIUEVDnaj
         NpV/56TO0TT3IFh0hsGjM3tpKf1KPqbCGYwoT9ZjJlCDmebwEj4Bo17lClPrzs44yE
         rM/BryDBlbJhOPiYC8/BWMIn+M77tNxRD8+6I/102jFLfJAgqtI9iL38ivBL/lA4yW
         TrI2v6ksyS5QQ==
X-CNFS-Analysis: v=2.4 cv=Q7IXX66a c=1 sm=1 tr=0 ts=60662110 cx=a_exe
 a=AVqmXbCQpuNSdJmApS5GbQ==:117 a=AVqmXbCQpuNSdJmApS5GbQ==:17
 a=2OX5x-OEy5pyK2UBO5QA:9
From:   Dario Binacchi <dariobin@libero.it>
To:     linux-kernel@vger.kernel.org
Cc:     Grygorii Strashko <grygorii.strashko@ti.com>,
        Dario Binacchi <dariobin@libero.it>,
        =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Tony Lindgren <tony@atomide.com>, devicetree@vger.kernel.org,
        linux-omap@vger.kernel.org
Subject: [PATCH v4 4/5] ARM: dts: am43xx-clocks: add spread spectrum support
Date:   Thu,  1 Apr 2021 21:37:40 +0200
Message-Id: <20210401193741.24639-5-dariobin@libero.it>
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
added. As reported by the TI spruhl7x RM, SSC is supported only for LCD
and MPU PLLs, but the PRCM_CM_SSC_DELTAMSTEP_DPLL_XXX and
PRCM_CM_SSC_MODFREQDIV_DPLL_XXX registers, as well as the enable field
in the PRCM_CM_CLKMODE_DPLL_XXX registers are mapped for all PLLs (CORE,
MPU, DDR, PER, DISP, EXTDEV).

Signed-off-by: Dario Binacchi <dariobin@libero.it>
---

(no changes since v1)

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

