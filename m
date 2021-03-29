Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6CA5A34D575
	for <lists+linux-omap@lfdr.de>; Mon, 29 Mar 2021 18:51:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230495AbhC2QvN (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 29 Mar 2021 12:51:13 -0400
Received: from smtp-17-i2.italiaonline.it ([213.209.12.17]:51490 "EHLO
        libero.it" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230323AbhC2Qup (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 29 Mar 2021 12:50:45 -0400
Received: from passgat-Modern-14-A10M.homenet.telecomitalia.it
 ([87.20.116.197])
        by smtp-17.iol.local with ESMTPA
        id Quy8lKyqctpGHQuyIliOli; Mon, 29 Mar 2021 18:42:34 +0200
x-libjamoibt: 1601
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=libero.it; s=s2021;
        t=1617036154; bh=CrKShqEBNERCGbMjDPhba4sclJ+Oc3QI/7X+s8tPzg8=;
        h=From;
        b=DL6HiJxE/Kw4hwO+ZJSbUxNXrze1Oa6v35dm8Jvvi82zv5Z1glA7Z7eXk9awrkSf7
         8xFsn3CC96XicAPm1732eUJCAb7C5Fa7bInWSL7tM8Fsmu+CuYUcQs8oGEIiCZch1M
         yDOReAV0a67vyZR+6HA4eBx1ya2MM+QmZffBjHBpSnvUqCezbLyO9pKEBejSVEEaTJ
         8Wd3T0qY7YXwkycYWKMgZLC81hvTS46LNT0CSN55/8tsVzpnAtu7LNKMq7zQQKxoMK
         2vAO9ZVegx24GqYPEx3LTwjRxDh9gOcWxMux+r01lY+Ja06ihBbNSUmhwdob4CSCV1
         SBA3oCBkvP7iw==
X-CNFS-Analysis: v=2.4 cv=Q7IXX66a c=1 sm=1 tr=0 ts=6062037a cx=a_exe
 a=AVqmXbCQpuNSdJmApS5GbQ==:117 a=AVqmXbCQpuNSdJmApS5GbQ==:17 a=2KMo9-giAAAA:8
 a=jCmRPZ0w5czJu0AXxT0A:9 a=2pGyGSWy5nf2n_rBi4rp:22 a=UeCTMeHK7YUBiLmz_SX7:22
 a=fCgQI5UlmZDRPDxm0A3o:22 a=pHzHmUro8NiASowvMSCR:22 a=xoEH_sTeL_Rfw54TyV31:22
From:   Dario Binacchi <dariobin@libero.it>
To:     linux-kernel@vger.kernel.org
Cc:     Grygorii Strashko <grygorii.strashko@ti.com>,
        Dario Binacchi <dariobin@libero.it>,
        =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Tony Lindgren <tony@atomide.com>, devicetree@vger.kernel.org,
        linux-omap@vger.kernel.org
Subject: [PATCH v3 3/4] ARM: dts: am33xx-clocks: add spread spectrum support
Date:   Mon, 29 Mar 2021 18:42:20 +0200
Message-Id: <20210329164222.26794-4-dariobin@libero.it>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210329164222.26794-1-dariobin@libero.it>
References: <20210329164222.26794-1-dariobin@libero.it>
X-CMAE-Envelope: MS4xfOR5sfuN7CDFFUQ88TsfF0HHMJBZaMkZQKbATvMx0SfTeVaDp7fVsaCecIeyLBX8/d+G1bstcZDBADy2NQJIrQIptnGEweg1OqaE4mJjica+kR8FyFLb
 /AmZxcJHouBpWLUiZ5mUizeJOATj8KKHjfr3K3UHGLz2FiulZO3rJmbARCXty3Gx0Hq1EGoK23EhhXdjWuKubVdCF3PL4Z2h+up08N3uSNzotfvXWbN1YsYB
 Yv2DyW6geKfO8IwFL/eaAd4EnZ057kJzisqZkqLMT5iETMhWynGAA3Gc5gzvimZwki9mtYbCZ+M+CUf+CiaSj0x8tYzp22TmK7NvBiPWJ2Mmj7DZf20JOVAd
 LLltkryBzP/gagF2hI4j/Rn3KgO00TkkcbkTT0y4P5DIfBcbgg1yZqVFrRWbH/pet6mc1mtn15g7Y6PMyu8SEkVeD9zrtJGtwtSgQ+FfPl++ixbeWo2YFSCI
 padWBKiLpifWKLGw
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Registers for adjusting the spread spectrum clocking (SSC) have been
added. As reported by the TI spruh73x RM, SSC is supported only for
LCD and MPU PLLs.

Signed-off-by: Dario Binacchi <dariobin@libero.it>
Acked-by: Tony Lindgren <tony@atomide.com>

---

Changes in v3:
- Add Tony Lindgren acked tag.

Changes in v2:
- Remove SSC registers from dpll_core_ck@490 node (SSC is not supported)
- Add SSC registers to dpll_mpu_ck@488 node.

 arch/arm/boot/dts/am33xx-clocks.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/am33xx-clocks.dtsi b/arch/arm/boot/dts/am33xx-clocks.dtsi
index dced92a8970e..a02e0b1229a4 100644
--- a/arch/arm/boot/dts/am33xx-clocks.dtsi
+++ b/arch/arm/boot/dts/am33xx-clocks.dtsi
@@ -204,7 +204,7 @@
 		#clock-cells = <0>;
 		compatible = "ti,am3-dpll-clock";
 		clocks = <&sys_clkin_ck>, <&sys_clkin_ck>;
-		reg = <0x0488>, <0x0420>, <0x042c>;
+		reg = <0x0488>, <0x0420>, <0x042c>, <0x0424>, <0x0428>;
 	};
 
 	dpll_mpu_m2_ck: dpll_mpu_m2_ck@4a8 {
@@ -244,7 +244,7 @@
 		#clock-cells = <0>;
 		compatible = "ti,am3-dpll-no-gate-clock";
 		clocks = <&sys_clkin_ck>, <&sys_clkin_ck>;
-		reg = <0x0498>, <0x0448>, <0x0454>;
+		reg = <0x0498>, <0x0448>, <0x0454>, <0x044c>, <0x0450>;
 	};
 
 	dpll_disp_m2_ck: dpll_disp_m2_ck@4a4 {
-- 
2.17.1

