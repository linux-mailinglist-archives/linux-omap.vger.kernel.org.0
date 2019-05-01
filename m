Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 435BD10EA4
	for <lists+linux-omap@lfdr.de>; Wed,  1 May 2019 23:42:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726194AbfEAVlu (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 1 May 2019 17:41:50 -0400
Received: from muru.com ([72.249.23.125]:47922 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726139AbfEAVlu (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 1 May 2019 17:41:50 -0400
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id A87F48198;
        Wed,  1 May 2019 21:42:06 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     Dave Gerlach <d-gerlach@ti.com>, Faiz Abbas <faiz_abbas@ti.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Keerthy <j-keerthy@ti.com>, Nishanth Menon <nm@ti.com>,
        Peter Ujfalusi <peter.ujfalusi@ti.com>,
        Roger Quadros <rogerq@ti.com>, Suman Anna <s-anna@ti.com>,
        Tero Kristo <t-kristo@ti.com>, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Subject: [PATCH 2/2] bus: ti-sysc: Handle devices with no control registers
Date:   Wed,  1 May 2019 14:41:29 -0700
Message-Id: <20190501214129.12572-3-tony@atomide.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190501214129.12572-1-tony@atomide.com>
References: <20190501214129.12572-1-tony@atomide.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Some interconnect target modules have no module control registers at
all, such as d_can on am335x and am437x.

The d_can register offset at 0 is CTL register with 0x401 as the default
value. I guess I mistook the 0x401 value for a revision register as the
value happens to look similar to what the revision registers typically
have for other modules.

To handle modules with no control registers, we need to improve the
ti-sysc driver a bit to bail out with errors on no control registers,
and then we can remove the bogus revision registers for d_can.

Cc: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 arch/arm/boot/dts/am33xx-l4.dtsi |  4 ----
 arch/arm/boot/dts/am437x-l4.dtsi |  4 ----
 drivers/bus/ti-sysc.c            | 23 +++++++++++------------
 3 files changed, 11 insertions(+), 20 deletions(-)

diff --git a/arch/arm/boot/dts/am33xx-l4.dtsi b/arch/arm/boot/dts/am33xx-l4.dtsi
--- a/arch/arm/boot/dts/am33xx-l4.dtsi
+++ b/arch/arm/boot/dts/am33xx-l4.dtsi
@@ -1759,8 +1759,6 @@
 		target-module@cc000 {			/* 0x481cc000, ap 60 46.0 */
 			compatible = "ti,sysc-omap4", "ti,sysc";
 			ti,hwmods = "d_can0";
-			reg = <0xcc000 0x4>;
-			reg-names = "rev";
 			/* Domains (P, C): per_pwrdm, l4ls_clkdm */
 			clocks = <&l4ls_clkctrl AM3_L4LS_D_CAN0_CLKCTRL 0>,
 				 <&dcan0_fck>;
@@ -1783,8 +1781,6 @@
 		target-module@d0000 {			/* 0x481d0000, ap 62 42.0 */
 			compatible = "ti,sysc-omap4", "ti,sysc";
 			ti,hwmods = "d_can1";
-			reg = <0xd0000 0x4>;
-			reg-names = "rev";
 			/* Domains (P, C): per_pwrdm, l4ls_clkdm */
 			clocks = <&l4ls_clkctrl AM3_L4LS_D_CAN1_CLKCTRL 0>,
 				 <&dcan1_fck>;
diff --git a/arch/arm/boot/dts/am437x-l4.dtsi b/arch/arm/boot/dts/am437x-l4.dtsi
--- a/arch/arm/boot/dts/am437x-l4.dtsi
+++ b/arch/arm/boot/dts/am437x-l4.dtsi
@@ -1575,8 +1575,6 @@
 		target-module@cc000 {			/* 0x481cc000, ap 50 46.0 */
 			compatible = "ti,sysc-omap4", "ti,sysc";
 			ti,hwmods = "d_can0";
-			reg = <0xcc000 0x4>;
-			reg-names = "rev";
 			/* Domains (P, C): per_pwrdm, l4ls_clkdm */
 			clocks = <&l4ls_clkctrl AM4_L4LS_D_CAN0_CLKCTRL 0>;
 			clock-names = "fck";
@@ -1596,8 +1594,6 @@
 		target-module@d0000 {			/* 0x481d0000, ap 52 3a.0 */
 			compatible = "ti,sysc-omap4", "ti,sysc";
 			ti,hwmods = "d_can1";
-			reg = <0xd0000 0x4>;
-			reg-names = "rev";
 			/* Domains (P, C): per_pwrdm, l4ls_clkdm */
 			clocks = <&l4ls_clkctrl AM4_L4LS_D_CAN1_CLKCTRL 0>;
 			clock-names = "fck";
diff --git a/drivers/bus/ti-sysc.c b/drivers/bus/ti-sysc.c
--- a/drivers/bus/ti-sysc.c
+++ b/drivers/bus/ti-sysc.c
@@ -660,12 +660,6 @@ static int sysc_check_registers(struct sysc *ddata)
 		nr_regs++;
 	}
 
-	if (nr_regs < 1) {
-		dev_err(ddata->dev, "missing registers\n");
-
-		return -EINVAL;
-	}
-
 	if (nr_matches > nr_regs) {
 		dev_err(ddata->dev, "overlapping registers: (%i/%i)",
 			nr_regs, nr_matches);
@@ -691,12 +685,18 @@ static int sysc_ioremap(struct sysc *ddata)
 {
 	int size;
 
-	size = max3(ddata->offsets[SYSC_REVISION],
-		    ddata->offsets[SYSC_SYSCONFIG],
-		    ddata->offsets[SYSC_SYSSTATUS]);
+	if (ddata->offsets[SYSC_REVISION] < 0 &&
+	    ddata->offsets[SYSC_SYSCONFIG] < 0 &&
+	    ddata->offsets[SYSC_SYSSTATUS] < 0) {
+		size = ddata->module_size;
+	} else {
+		size = max3(ddata->offsets[SYSC_REVISION],
+			    ddata->offsets[SYSC_SYSCONFIG],
+			    ddata->offsets[SYSC_SYSSTATUS]);
 
-	if (size < 0 || (size + sizeof(u32)) > ddata->module_size)
-		return -EINVAL;
+		if ((size + sizeof(u32)) > ddata->module_size)
+			return -EINVAL;
+	}
 
 	ddata->module_va = devm_ioremap(ddata->dev,
 					ddata->module_pa,
@@ -1128,7 +1128,6 @@ static const struct sysc_revision_quirk sysc_revision_quirks[] = {
 	SYSC_QUIRK("cpgmac", 0, 0x1200, 0x1208, 0x1204, 0x4edb1902,
 		   0xffff00f0, 0),
 	SYSC_QUIRK("dcan", 0, 0, -1, -1, 0xffffffff, 0xffffffff, 0),
-	SYSC_QUIRK("dcan", 0, 0, -1, -1, 0x00001401, 0xffffffff, 0),
 	SYSC_QUIRK("dmic", 0, 0, 0x10, -1, 0x50010000, 0xffffffff, 0),
 	SYSC_QUIRK("dwc3", 0, 0, 0x10, -1, 0x500a0200, 0xffffffff, 0),
 	SYSC_QUIRK("epwmss", 0, 0, 0x4, -1, 0x47400001, 0xffffffff, 0),
-- 
2.21.0
