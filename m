Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 66191478A7E
	for <lists+linux-omap@lfdr.de>; Fri, 17 Dec 2021 12:56:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235749AbhLQL4K (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 17 Dec 2021 06:56:10 -0500
Received: from muru.com ([72.249.23.125]:39430 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231258AbhLQL4K (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Fri, 17 Dec 2021 06:56:10 -0500
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 88EE880FB;
        Fri, 17 Dec 2021 11:56:51 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        devicetree@vger.kernel.org, Tero Kristo <kristo@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org
Subject: [PATCH 2/2] ARM: dts: Don't use legacy clock defines for dra7 clkctrl
Date:   Fri, 17 Dec 2021 13:55:59 +0200
Message-Id: <20211217115559.15352-2-tony@atomide.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211217115559.15352-1-tony@atomide.com>
References: <20211217115559.15352-1-tony@atomide.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Looks like we are still using legacy clock defines for dra7. We want to
stop using these as it prevents dropping the legacy clocks. Note that
this is just a cosmetic fix.

Cc: Tero Kristo <kristo@kernel.org>
Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 arch/arm/boot/dts/dra7.dtsi | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/arch/arm/boot/dts/dra7.dtsi b/arch/arm/boot/dts/dra7.dtsi
--- a/arch/arm/boot/dts/dra7.dtsi
+++ b/arch/arm/boot/dts/dra7.dtsi
@@ -160,7 +160,7 @@ l4_per1: interconnect@48000000 {
 		target-module@48210000 {
 			compatible = "ti,sysc-omap4-simple", "ti,sysc";
 			power-domains = <&prm_mpu>;
-			clocks = <&mpu_clkctrl DRA7_MPU_CLKCTRL 0>;
+			clocks = <&mpu_clkctrl DRA7_MPU_MPU_CLKCTRL 0>;
 			clock-names = "fck";
 			#address-cells = <1>;
 			#size-cells = <1>;
@@ -875,10 +875,10 @@ target-module@58000000 {
 			      <0x58000014 4>;
 			reg-names = "rev", "syss";
 			ti,syss-mask = <1>;
-			clocks = <&dss_clkctrl DRA7_DSS_CORE_CLKCTRL 0>,
-				 <&dss_clkctrl DRA7_DSS_CORE_CLKCTRL 9>,
-				 <&dss_clkctrl DRA7_DSS_CORE_CLKCTRL 10>,
-				 <&dss_clkctrl DRA7_DSS_CORE_CLKCTRL 11>;
+			clocks = <&dss_clkctrl DRA7_DSS_DSS_CORE_CLKCTRL 0>,
+				 <&dss_clkctrl DRA7_DSS_DSS_CORE_CLKCTRL 9>,
+				 <&dss_clkctrl DRA7_DSS_DSS_CORE_CLKCTRL 10>,
+				 <&dss_clkctrl DRA7_DSS_DSS_CORE_CLKCTRL 11>;
 			clock-names = "fck", "hdmi_clk", "sys_clk", "tv_clk";
 			#address-cells = <1>;
 			#size-cells = <1>;
@@ -912,7 +912,7 @@ SYSC_OMAP2_ENAWAKEUP |
 							 SYSC_OMAP2_SOFTRESET |
 							 SYSC_OMAP2_AUTOIDLE)>;
 					ti,syss-mask = <1>;
-					clocks = <&dss_clkctrl DRA7_DSS_CORE_CLKCTRL 8>;
+					clocks = <&dss_clkctrl DRA7_DSS_DSS_CORE_CLKCTRL 8>;
 					clock-names = "fck";
 					#address-cells = <1>;
 					#size-cells = <1>;
@@ -939,8 +939,8 @@ target-module@40000 {
 							<SYSC_IDLE_SMART>,
 							<SYSC_IDLE_SMART_WKUP>;
 					ti,sysc-mask = <(SYSC_OMAP4_SOFTRESET)>;
-					clocks = <&dss_clkctrl DRA7_DSS_CORE_CLKCTRL 9>,
-						 <&dss_clkctrl DRA7_DSS_CORE_CLKCTRL 8>;
+					clocks = <&dss_clkctrl DRA7_DSS_DSS_CORE_CLKCTRL 9>,
+						 <&dss_clkctrl DRA7_DSS_DSS_CORE_CLKCTRL 8>;
 					clock-names = "fck", "dss_clk";
 					#address-cells = <1>;
 					#size-cells = <1>;
@@ -979,7 +979,7 @@ bb2d: gpu@0 {
 				compatible = "vivante,gc";
 				reg = <0x0 0x700>;
 				interrupts = <GIC_SPI 120 IRQ_TYPE_LEVEL_HIGH>;
-				clocks = <&dss_clkctrl DRA7_BB2D_CLKCTRL 0>;
+				clocks = <&dss_clkctrl DRA7_DSS_BB2D_CLKCTRL 0>;
 				clock-names = "core";
 			};
 		};
@@ -1333,7 +1333,7 @@ &timer1_target {
 	ti,no-reset-on-init;
 	ti,no-idle;
 	timer@0 {
-		assigned-clocks = <&wkupaon_clkctrl DRA7_TIMER1_CLKCTRL 24>;
+		assigned-clocks = <&wkupaon_clkctrl DRA7_WKUPAON_TIMER1_CLKCTRL 24>;
 		assigned-clock-parents = <&sys_32k_ck>;
 	};
 };
-- 
2.34.1
