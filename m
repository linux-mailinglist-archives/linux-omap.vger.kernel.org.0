Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D2A5CEC6C9
	for <lists+linux-omap@lfdr.de>; Fri,  1 Nov 2019 17:31:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727483AbfKAQb0 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 1 Nov 2019 12:31:26 -0400
Received: from muru.com ([72.249.23.125]:40428 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726701AbfKAQb0 (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Fri, 1 Nov 2019 12:31:26 -0400
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 9113A8140;
        Fri,  1 Nov 2019 16:32:01 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        devicetree@vger.kernel.org,
        "H. Nikolaus Schaller" <hns@goldelico.com>,
        Robert Nelson <robertcnelson@gmail.com>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: [PATCH] ARM: dts: Configure sgx for dra7
Date:   Fri,  1 Nov 2019 09:31:23 -0700
Message-Id: <20191101163123.50284-1-tony@atomide.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

I've tested that the interconnect target module enables and idles
just fine when probed with ti-sysc with PM runtime control via sys:

# echo on > $(find /sys -name control | grep \/5600)
# rwmem 0x5600fe00      # OCP Revision
0x5600fe00 = 0x40000000
# echo auto > $(find /sys -name control | grep \/5600)

Cc: "H. Nikolaus Schaller" <hns@goldelico.com>
Cc: Robert Nelson <robertcnelson@gmail.com>
Cc: Tomi Valkeinen <tomi.valkeinen@ti.com>
Signed-off-by: Tony Lindgren <tony@atomide.com>
---

This patch depends on "[PATCH] clk: ti: add clkctrl data dra7 sgx".

---
 arch/arm/boot/dts/dra7.dtsi | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/arm/boot/dts/dra7.dtsi b/arch/arm/boot/dts/dra7.dtsi
--- a/arch/arm/boot/dts/dra7.dtsi
+++ b/arch/arm/boot/dts/dra7.dtsi
@@ -673,6 +673,24 @@
 			status = "disabled";
 		};
 
+		target-module@56000000 {
+			compatible = "ti,sysc-omap4", "ti,sysc";
+			reg = <0x5600fe00 0x4>,
+			      <0x5600fe10 0x4>;
+			reg-names = "rev", "sysc";
+			ti,sysc-midle = <SYSC_IDLE_FORCE>,
+					<SYSC_IDLE_NO>,
+					<SYSC_IDLE_SMART>;
+			ti,sysc-sidle = <SYSC_IDLE_FORCE>,
+					<SYSC_IDLE_NO>,
+					<SYSC_IDLE_SMART>;
+			clocks = <&gpu_clkctrl DRA7_GPU_CLKCTRL 0>;
+			clock-names = "fck";
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges = <0 0x56000000 0x2000000>;
+		};
+
 		crossbar_mpu: crossbar@4a002a48 {
 			compatible = "ti,irq-crossbar";
 			reg = <0x4a002a48 0x130>;
-- 
2.23.0
