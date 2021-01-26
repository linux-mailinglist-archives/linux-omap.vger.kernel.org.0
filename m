Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5691E303D46
	for <lists+linux-omap@lfdr.de>; Tue, 26 Jan 2021 13:42:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391853AbhAZMly (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 26 Jan 2021 07:41:54 -0500
Received: from muru.com ([72.249.23.125]:53452 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2391862AbhAZMlp (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 26 Jan 2021 07:41:45 -0500
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 91B4C85C7;
        Tue, 26 Jan 2021 12:40:36 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        devicetree@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        linux-pci@vger.kernel.org
Subject: [PATCH 09/15] ARM: dts: Configure interconnect target module for dra7 dmm
Date:   Tue, 26 Jan 2021 14:39:58 +0200
Message-Id: <20210126124004.52550-10-tony@atomide.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210126124004.52550-1-tony@atomide.com>
References: <20210126124004.52550-1-tony@atomide.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

We can now probe devices with device tree only configuration using
ti-sysc interconnect target module driver. Let's configure the
module, but keep the legacy "ti,hwmods" peroperty to avoid new boot
time warnings. The legacy property will be removed in later patches
together with the legacy platform data.

Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 arch/arm/boot/dts/dra7.dtsi | 21 +++++++++++++++++----
 1 file changed, 17 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/dra7.dtsi b/arch/arm/boot/dts/dra7.dtsi
--- a/arch/arm/boot/dts/dra7.dtsi
+++ b/arch/arm/boot/dts/dra7.dtsi
@@ -465,11 +465,24 @@ edma_tptc1: dma@0 {
 			};
 		};
 
-		dmm@4e000000 {
-			compatible = "ti,omap5-dmm";
-			reg = <0x4e000000 0x800>;
-			interrupts = <GIC_SPI 108 IRQ_TYPE_LEVEL_HIGH>;
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
+				compatible = "ti,omap5-dmm";
+				reg = <0x4e000000 0x800>;
+				interrupts = <GIC_SPI 108 IRQ_TYPE_LEVEL_HIGH>;
+			};
 		};
 
 		ipu1: ipu@58820000 {
-- 
2.30.0
