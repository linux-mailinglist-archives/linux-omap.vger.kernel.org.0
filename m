Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C93E4330F94
	for <lists+linux-omap@lfdr.de>; Mon,  8 Mar 2021 14:39:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229797AbhCHNjY (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 8 Mar 2021 08:39:24 -0500
Received: from muru.com ([72.249.23.125]:40860 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230439AbhCHNjQ (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 8 Mar 2021 08:39:16 -0500
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 1E45B8117;
        Mon,  8 Mar 2021 13:39:57 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        devicetree@vger.kernel.org
Subject: [PATCH 03/12] ARM: dts: Configure interconnect target module for omap4 dmm
Date:   Mon,  8 Mar 2021 15:39:01 +0200
Message-Id: <20210308133910.12454-4-tony@atomide.com>
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

Let's also use GIC_SPI and IRQ_TYPE_LEVEL_HIGH defines while at it.

Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 arch/arm/boot/dts/omap4.dtsi | 21 +++++++++++++++++----
 1 file changed, 17 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/omap4.dtsi b/arch/arm/boot/dts/omap4.dtsi
--- a/arch/arm/boot/dts/omap4.dtsi
+++ b/arch/arm/boot/dts/omap4.dtsi
@@ -262,11 +262,24 @@ target-module@4012c000 {
 			/* No child device binding or driver in mainline */
 		};
 
-		dmm@4e000000 {
-			compatible = "ti,omap4-dmm";
-			reg = <0x4e000000 0x800>;
-			interrupts = <0 113 0x4>;
+		target-module@4e000000 {
+			compatible = "ti,sysc-omap2", "ti,sysc";
 			ti,hwmods = "dmm";
+			reg = <0x4e000000 0x4>,
+			      <0x4e000010 0x4>;
+			reg-names = "rev", "sysc";
+			ti,sysc-sidle = <SYSC_IDLE_FORCE>,
+					<SYSC_IDLE_NO>,
+					<SYSC_IDLE_SMART>;
+			ranges = <0x0 0x4e000000 0x2000000>;
+			#size-cells = <1>;
+			#address-cells = <1>;
+
+			dmm@0 {
+				compatible = "ti,omap4-dmm";
+				reg = <0 0x800>;
+				interrupts = <GIC_SPI 113 IRQ_TYPE_LEVEL_HIGH>;
+			};
 		};
 
 		emif1: emif@4c000000 {
-- 
2.30.1
