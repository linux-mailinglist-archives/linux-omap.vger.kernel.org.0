Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E2ADB3311C7
	for <lists+linux-omap@lfdr.de>; Mon,  8 Mar 2021 16:12:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231532AbhCHPMA (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 8 Mar 2021 10:12:00 -0500
Received: from muru.com ([72.249.23.125]:40992 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231295AbhCHPLw (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 8 Mar 2021 10:11:52 -0500
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 120168117;
        Mon,  8 Mar 2021 15:12:33 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        devicetree@vger.kernel.org
Subject: [PATCH 03/11] ARM: dts: Configure interconnect target module for omap5 mpu
Date:   Mon,  8 Mar 2021 17:11:35 +0200
Message-Id: <20210308151143.27793-4-tony@atomide.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210308151143.27793-1-tony@atomide.com>
References: <20210308151143.27793-1-tony@atomide.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

We can now probe devices with device tree only configuration using
ti-sysc interconnect target module driver.

Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 arch/arm/boot/dts/omap5.dtsi | 28 +++++++++++++++-------------
 1 file changed, 15 insertions(+), 13 deletions(-)

diff --git a/arch/arm/boot/dts/omap5.dtsi b/arch/arm/boot/dts/omap5.dtsi
--- a/arch/arm/boot/dts/omap5.dtsi
+++ b/arch/arm/boot/dts/omap5.dtsi
@@ -125,19 +125,6 @@ wakeupgen: interrupt-controller@48281000 {
 		interrupt-parent = <&gic>;
 	};
 
-	/*
-	 * The soc node represents the soc top level view. It is used for IPs
-	 * that are not memory mapped in the MPU view or for the MPU itself.
-	 */
-	soc {
-		compatible = "ti,omap-infra";
-		mpu {
-			compatible = "ti,omap4-mpu";
-			ti,hwmods = "mpu";
-			sram = <&ocmcram>;
-		};
-	};
-
 	/*
 	 * XXX: Use a flat representation of the OMAP3 interconnect.
 	 * The real OMAP interconnect network is quite complex.
@@ -167,6 +154,21 @@ l4_cfg: interconnect@4a000000 {
 		l4_per: interconnect@48000000 {
 		};
 
+		target-module@48210000 {
+			compatible = "ti,sysc-omap4-simple", "ti,sysc";
+			power-domains = <&prm_mpu>;
+			clocks = <&mpu_clkctrl OMAP5_MPU_CLKCTRL 0>;
+			clock-names = "fck";
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges = <0 0x48210000 0x1f0000>;
+
+			mpu {
+				compatible = "ti,omap4-mpu";
+				sram = <&ocmcram>;
+			};
+		};
+
 		l4_abe: interconnect@40100000 {
 		};
 
-- 
2.30.1
