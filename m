Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9DCB5DF776
	for <lists+linux-omap@lfdr.de>; Mon, 21 Oct 2019 23:30:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729869AbfJUVaR (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 21 Oct 2019 17:30:17 -0400
Received: from muru.com ([72.249.23.125]:38780 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727264AbfJUVaR (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 21 Oct 2019 17:30:17 -0400
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 1874C810A;
        Mon, 21 Oct 2019 21:30:51 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        devicetree@vger.kernel.org, Bin Liu <b-liu@ti.com>,
        Keerthy <j-keerthy@ti.com>
Subject: [PATCH 1/3] ARM: dts: Probe am335x musb with ti-sysc
Date:   Mon, 21 Oct 2019 14:30:09 -0700
Message-Id: <20191021213011.29110-2-tony@atomide.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191021213011.29110-1-tony@atomide.com>
References: <20191021213011.29110-1-tony@atomide.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

We can now probe musb with ti-sysc interconnect driver and dts data
with the following changes:

1. Swap the old ti,am33xx-usb compatible wrapper to generic ti-sysc
   driver. This means later on we can also remove the old wrapper driver
   drivers/usb/musb/musb_am335x.c

2. Update the child nodes to use the ranges provided by ti-sysc

3. Drop unneeded status = "enabled" tinkering for SoC internal devices.
   This allows us to remove some useless board specific boilerplate code
   in the following patches

Cc: Bin Liu <b-liu@ti.com>
Cc: Keerthy <j-keerthy@ti.com>
Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 arch/arm/boot/dts/am33xx-l4.dtsi |  7 ++++
 arch/arm/boot/dts/am33xx.dtsi    | 66 ++++++++++++++++----------------
 2 files changed, 39 insertions(+), 34 deletions(-)

diff --git a/arch/arm/boot/dts/am33xx-l4.dtsi b/arch/arm/boot/dts/am33xx-l4.dtsi
--- a/arch/arm/boot/dts/am33xx-l4.dtsi
+++ b/arch/arm/boot/dts/am33xx-l4.dtsi
@@ -303,6 +303,13 @@
 					};
 				};
 
+				usb_ctrl_mod: control@620 {
+					compatible = "ti,am335x-usb-ctrl-module";
+					reg = <0x620 0x10>,
+					      <0x648 0x4>;
+					reg-names = "phy_ctrl", "wakeup";
+				};
+
 				wkup_m3_ipc: wkup_m3_ipc@1324 {
 					compatible = "ti,am3352-wkup-m3-ipc";
 					reg = <0x1324 0x24>;
diff --git a/arch/arm/boot/dts/am33xx.dtsi b/arch/arm/boot/dts/am33xx.dtsi
--- a/arch/arm/boot/dts/am33xx.dtsi
+++ b/arch/arm/boot/dts/am33xx.dtsi
@@ -262,37 +262,38 @@
 			};
 		};
 
-		usb: usb@47400000 {
-			compatible = "ti,am33xx-usb";
-			reg = <0x47400000 0x1000>;
-			ranges;
+		usb: target-module@47400000 {
+			compatible = "ti,sysc-omap4", "ti,sysc";
+			reg = <0x47400000 0x4>,
+			      <0x47400010 0x4>;
+			reg-names = "rev", "sysc";
+			ti,sysc-mask = <(SYSC_OMAP4_FREEEMU |
+					 SYSC_OMAP2_SOFTRESET)>;
+			ti,sysc-midle = <SYSC_IDLE_FORCE>,
+					<SYSC_IDLE_NO>,
+					<SYSC_IDLE_SMART>;
+			ti,sysc-sidle = <SYSC_IDLE_FORCE>,
+					<SYSC_IDLE_NO>,
+					<SYSC_IDLE_SMART>,
+					<SYSC_IDLE_SMART_WKUP>;
+			clocks = <&l3s_clkctrl AM3_L3S_USB_OTG_HS_CLKCTRL 0>;
+			clock-names = "fck";
 			#address-cells = <1>;
 			#size-cells = <1>;
-			ti,hwmods = "usb_otg_hs";
-			status = "disabled";
-
-			usb_ctrl_mod: control@44e10620 {
-				compatible = "ti,am335x-usb-ctrl-module";
-				reg = <0x44e10620 0x10
-					0x44e10648 0x4>;
-				reg-names = "phy_ctrl", "wakeup";
-				status = "disabled";
-			};
+			ranges = <0x0 0x47400000 0x5000>;
 
-			usb0_phy: usb-phy@47401300 {
+			usb0_phy: usb-phy@1300 {
 				compatible = "ti,am335x-usb-phy";
-				reg = <0x47401300 0x100>;
+				reg = <0x1300 0x100>;
 				reg-names = "phy";
-				status = "disabled";
 				ti,ctrl_mod = <&usb_ctrl_mod>;
 				#phy-cells = <0>;
 			};
 
-			usb0: usb@47401000 {
+			usb0: usb@1400 {
 				compatible = "ti,musb-am33xx";
-				status = "disabled";
-				reg = <0x47401400 0x400
-					0x47401000 0x200>;
+				reg = <0x1400 0x400>,
+				      <0x1000 0x200>;
 				reg-names = "mc", "control";
 
 				interrupts = <18>;
@@ -328,20 +329,18 @@
 					"tx14", "tx15";
 			};
 
-			usb1_phy: usb-phy@47401b00 {
+			usb1_phy: usb-phy@1b00 {
 				compatible = "ti,am335x-usb-phy";
-				reg = <0x47401b00 0x100>;
+				reg = <0x1b00 0x100>;
 				reg-names = "phy";
-				status = "disabled";
 				ti,ctrl_mod = <&usb_ctrl_mod>;
 				#phy-cells = <0>;
 			};
 
-			usb1: usb@47401800 {
+			usb1: usb@1800 {
 				compatible = "ti,musb-am33xx";
-				status = "disabled";
-				reg = <0x47401c00 0x400
-					0x47401800 0x200>;
+				reg = <0x1c00 0x400>,
+				      <0x1800 0x200>;
 				reg-names = "mc", "control";
 				interrupts = <19>;
 				interrupt-names = "mc";
@@ -376,19 +375,18 @@
 					"tx14", "tx15";
 			};
 
-			cppi41dma: dma-controller@47402000 {
+			cppi41dma: dma-controller@2000 {
 				compatible = "ti,am3359-cppi41";
-				reg =  <0x47400000 0x1000
-					0x47402000 0x1000
-					0x47403000 0x1000
-					0x47404000 0x4000>;
+				reg =  <0x0000 0x1000>,
+				       <0x2000 0x1000>,
+				       <0x3000 0x1000>,
+				       <0x4000 0x4000>;
 				reg-names = "glue", "controller", "scheduler", "queuemgr";
 				interrupts = <17>;
 				interrupt-names = "glue";
 				#dma-cells = <2>;
 				#dma-channels = <30>;
 				#dma-requests = <256>;
-				status = "disabled";
 			};
 		};
 
-- 
2.23.0
