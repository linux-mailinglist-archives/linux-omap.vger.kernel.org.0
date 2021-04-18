Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7D333363633
	for <lists+linux-omap@lfdr.de>; Sun, 18 Apr 2021 16:57:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230028AbhDRO5i (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sun, 18 Apr 2021 10:57:38 -0400
Received: from smtp-35.italiaonline.it ([213.209.10.35]:56586 "EHLO libero.it"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230470AbhDRO5g (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Sun, 18 Apr 2021 10:57:36 -0400
Received: from passgat-Modern-14-A10M.homenet.telecomitalia.it
 ([95.244.94.151])
        by smtp-35.iol.local with ESMTPA
        id Y8r3lCRdYpK9wY8rDla5Wr; Sun, 18 Apr 2021 16:57:08 +0200
x-libjamoibt: 1601
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=libero.it; s=s2021;
        t=1618757828; bh=PPTo8GvjIIsaEKU5B1TIF8N7cm5fuyUf7SEXiLKXv5E=;
        h=From;
        b=M2ijvZZSZQT/v6PbbF/gar4n99oDleH/vJy90ywfkzYOZDldg1JGJ3C6qvxEaE0++
         QMFhKHecisqt3vWqp0012NSl8ju48t88H7N3i1psdRvwkkjgCwgwC2WfWREOEUWsx3
         m97LlplDbCA71bqw5hYjFSXdyXwPehvu+4GfL+dEpdhNc9Au+3a00FwHBVop2lrJQk
         UnNsfj4rSHV0/xe3LCYwJF+u71xW8yh8Mh/Y9bUP9UH0w68fDoBLeSJeui9uQm178a
         yyQIfV6Kf0rijYZDZGM+JkZ5tOQHmApKVkBK7lau3ggJOQAgVnKOAcu7g/h9zJw8nz
         0MnwRPKYxV5/A==
X-CNFS-Analysis: v=2.4 cv=A9ipg4aG c=1 sm=1 tr=0 ts=607c48c4 cx=a_exe
 a=ugxisoNCKEotYwafST++Mw==:117 a=ugxisoNCKEotYwafST++Mw==:17
 a=2OX5x-OEy5pyK2UBO5QA:9
From:   Dario Binacchi <dariobin@libero.it>
To:     linux-kernel@vger.kernel.org
Cc:     Dario Binacchi <dariobin@libero.it>,
        Tero Kristo <kristo@kernel.org>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Tony Lindgren <tony@atomide.com>, devicetree@vger.kernel.org,
        linux-omap@vger.kernel.org
Subject: [PATCH v5 4/5] ARM: dts: am43xx-clocks: add spread spectrum support
Date:   Sun, 18 Apr 2021 16:56:54 +0200
Message-Id: <20210418145655.10415-5-dariobin@libero.it>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210418145655.10415-1-dariobin@libero.it>
References: <20210418145655.10415-1-dariobin@libero.it>
X-CMAE-Envelope: MS4xfEEDn3jitYUQGbECNbNKfE4AK0GKfoesZKzqjpXT9CKmPBYOCHHkKYqW9TUuAnkjV3+TqTFTaz1+7FuYK0OL1zzpIf+Adf05KNVuv5//iErIudu/qogs
 ZMSMzCeRM238bMKWDhjYXRV7tBKa4j+BmtjUz0KGu5s4VYUI8lf1Qs+74HXw+kbRef4CrA3z7zTGG1Mw+Fp2sfHZlciH4n3redz+zni9+tlJy5N+wtthJe5i
 p7awBDxeJ8tAyquot8JoFme3+z/uvoeQ61fBSoUrDhwKax2ZAQaI98k8nkBp3hrVv14b/LQngxxqpMAXe5n0+5jgQOlWlzc5s9CUrsbON03Gk0ijYlm0x1FV
 n9khWmAxnZoAuBNHB0wp13bdryStLdwl6b/tHekkQEXLLwtHWLu4QFbBrK9aGDXvEz8U65bdKeseHQ3ItfmPvWLmoCx5CEX68R7M/2JvqzaXhNSPpt3zZUkz
 hFejMdyoGCSfnDKpPjfJFrB42G4jVHEn7eJvQg==
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

