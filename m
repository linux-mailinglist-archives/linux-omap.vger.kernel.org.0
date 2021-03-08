Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C57D0330FA0
	for <lists+linux-omap@lfdr.de>; Mon,  8 Mar 2021 14:40:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229650AbhCHNj1 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 8 Mar 2021 08:39:27 -0500
Received: from muru.com ([72.249.23.125]:40868 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230486AbhCHNjS (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 8 Mar 2021 08:39:18 -0500
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 5F1538117;
        Mon,  8 Mar 2021 13:40:00 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        devicetree@vger.kernel.org
Subject: [PATCH 05/12] ARM: dts: Configure interconnect target module for omap4 debugss
Date:   Mon,  8 Mar 2021 15:39:03 +0200
Message-Id: <20210308133910.12454-6-tony@atomide.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210308133910.12454-1-tony@atomide.com>
References: <20210308133910.12454-1-tony@atomide.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

We can now probe devices with device tree only configuration using
ti-sysc interconnect target module driver. Let's configure the
module, but keep the legacy "ti,hwmods" property to avoid new boot
time warnings. The legacy property will be removed in later patches
together with the legacy platform data.

Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 arch/arm/boot/dts/omap4.dtsi    | 32 +++++++++++++++++++++-----------
 arch/arm/boot/dts/omap4460.dtsi | 13 ++++++-------
 2 files changed, 27 insertions(+), 18 deletions(-)

diff --git a/arch/arm/boot/dts/omap4.dtsi b/arch/arm/boot/dts/omap4.dtsi
--- a/arch/arm/boot/dts/omap4.dtsi
+++ b/arch/arm/boot/dts/omap4.dtsi
@@ -58,17 +58,6 @@ cpu@1 {
 		};
 	};
 
-	/*
-	 * Note that 4430 needs cross trigger interface (CTI) supported
-	 * before we can configure the interrupts. This means sampling
-	 * events are not supported for pmu. Note that 4460 does not use
-	 * CTI, see also 4460.dtsi.
-	 */
-	pmu {
-		compatible = "arm,cortex-a9-pmu";
-		ti,hwmods = "debugss";
-	};
-
 	gic: interrupt-controller@48241000 {
 		compatible = "arm,cortex-a9-gic";
 		interrupt-controller;
@@ -213,6 +202,27 @@ target-module@52000000 {
 			/* No child device binding, driver in staging */
 		};
 
+		/*
+		 * Note that 4430 needs cross trigger interface (CTI) supported
+		 * before we can configure the interrupts. This means sampling
+		 * events are not supported for pmu. Note that 4460 does not use
+		 * CTI, see also 4460.dtsi.
+		 */
+		target-module@54000000 {
+			compatible = "ti,sysc-omap4-simple", "ti,sysc";
+			ti,hwmods = "debugss";
+			power-domains = <&prm_emu>;
+			clocks = <&emu_sys_clkctrl OMAP4_DEBUGSS_CLKCTRL 0>;
+			clock-names = "fck";
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges = <0x0 0x54000000 0x1000000>;
+
+			pmu: pmu {
+				compatible = "arm,cortex-a9-pmu";
+			};
+		};
+
 		target-module@55082000 {
 			compatible = "ti,sysc-omap2", "ti,sysc";
 			reg = <0x55082000 0x4>,
diff --git a/arch/arm/boot/dts/omap4460.dtsi b/arch/arm/boot/dts/omap4460.dtsi
--- a/arch/arm/boot/dts/omap4460.dtsi
+++ b/arch/arm/boot/dts/omap4460.dtsi
@@ -26,13 +26,6 @@ cpu0: cpu@0 {
 		};
 	};
 
-	pmu {
-		compatible = "arm,cortex-a9-pmu";
-		interrupts = <GIC_SPI 54 IRQ_TYPE_LEVEL_HIGH>,
-			     <GIC_SPI 55 IRQ_TYPE_LEVEL_HIGH>;
-		ti,hwmods = "debugss";
-	};
-
 	thermal-zones {
 		#include "omap4-cpu-thermal.dtsi"
 	};
@@ -128,4 +121,10 @@ &l4_cfg_target_0 {
 		 <0x00030000 0x00030000 0x00010000>;
 };
 
+&pmu {
+	compatible = "arm,cortex-a9-pmu";
+	interrupts = <GIC_SPI 54 IRQ_TYPE_LEVEL_HIGH>,
+		     <GIC_SPI 55 IRQ_TYPE_LEVEL_HIGH>;
+};
+
 /include/ "omap446x-clocks.dtsi"
-- 
2.30.1
