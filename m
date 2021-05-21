Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AA81838CFC2
	for <lists+linux-omap@lfdr.de>; Fri, 21 May 2021 23:19:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229659AbhEUVVL (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 21 May 2021 17:21:11 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:51580 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229583AbhEUVVK (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 21 May 2021 17:21:10 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 14LLJZhv098187;
        Fri, 21 May 2021 16:19:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1621631975;
        bh=9MlnjqVuaPnNiJ3UUwf0/5Tj3Ve3lFRU+tmfVJNmcGA=;
        h=From:To:CC:Subject:Date;
        b=veDZu/u3XmfxI1gQGp+54MIcRalbYPvTR8bpMficUJtsHLg9ifFfETiib8Y7sU0SH
         4ESbi0JfDJ4CVkdwPMnMbSyOh808XnPVDvZTH5+3rerYJ44fxXk8g1/S5bSuXS44tj
         8GVNob43Moo572iVdfwtkrPG7dek7Q7IV0i+Evis=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 14LLJZur098311
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 21 May 2021 16:19:35 -0500
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Fri, 21
 May 2021 16:19:34 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Fri, 21 May 2021 16:19:34 -0500
Received: from fllv0103.dal.design.ti.com (fllv0103.dal.design.ti.com [10.247.120.73])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 14LLJYSN054608;
        Fri, 21 May 2021 16:19:34 -0500
Received: from uda0271916b.dhcp.ti.com (uda0271916b.dhcp.ti.com [128.247.81.224] (may be forged))
        by fllv0103.dal.design.ti.com (8.14.7/8.14.7) with ESMTP id 14LLJYqb008540;
        Fri, 21 May 2021 16:19:34 -0500
From:   Gowtham Tammana <g-tammana@ti.com>
To:     <bcousson@baylibre.com>, <tony@atomide.com>
CC:     <robh+dt@kernel.org>, <linux-omap@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        Nisanth Menon <nm@ti.com>, Gowtham Tammana <g-tammana@ti.com>
Subject: [PATCH] ARM: dts: DRA7x: Fix duplicate USB4 device node
Date:   Fri, 21 May 2021 16:18:51 -0500
Message-ID: <20210521211851.14674-1-g-tammana@ti.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

USB4 device node which is defined in [1] is redefined in here
causing boot failures. Remove the duplicated entry and instead extend it
with child node info through corresponding label reference.

[1]: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/arm/boot/dts/dra7-l4.dtsi#n4132

Signed-off-by: Gowtham Tammana <g-tammana@ti.com>
---
 arch/arm/boot/dts/dra74x.dtsi | 69 +++++++++++++----------------------
 1 file changed, 25 insertions(+), 44 deletions(-)

diff --git a/arch/arm/boot/dts/dra74x.dtsi b/arch/arm/boot/dts/dra74x.dtsi
index e1850d6c841a..6410ddbf0fca 100644
--- a/arch/arm/boot/dts/dra74x.dtsi
+++ b/arch/arm/boot/dts/dra74x.dtsi
@@ -49,50 +49,6 @@ dsp2_system: dsp_system@41500000 {
 			reg = <0x41500000 0x100>;
 		};
 
-		target-module@48940000 {
-			compatible = "ti,sysc-omap4", "ti,sysc";
-			reg = <0x48940000 0x4>,
-			      <0x48940010 0x4>;
-			reg-names = "rev", "sysc";
-			ti,sysc-mask = <SYSC_OMAP4_DMADISABLE>;
-			ti,sysc-midle = <SYSC_IDLE_FORCE>,
-					<SYSC_IDLE_NO>,
-					<SYSC_IDLE_SMART>,
-					<SYSC_IDLE_SMART_WKUP>;
-			ti,sysc-sidle = <SYSC_IDLE_FORCE>,
-					<SYSC_IDLE_NO>,
-					<SYSC_IDLE_SMART>,
-					<SYSC_IDLE_SMART_WKUP>;
-			clocks = <&l3init_clkctrl DRA7_L3INIT_USB_OTG_SS4_CLKCTRL 0>;
-			clock-names = "fck";
-			#address-cells = <1>;
-			#size-cells = <1>;
-			ranges = <0x0 0x48940000 0x20000>;
-
-			omap_dwc3_4: omap_dwc3_4@0 {
-				compatible = "ti,dwc3";
-				reg = <0 0x10000>;
-				interrupts = <GIC_SPI 346 IRQ_TYPE_LEVEL_HIGH>;
-				#address-cells = <1>;
-				#size-cells = <1>;
-				utmi-mode = <2>;
-				ranges;
-				status = "disabled";
-				usb4: usb@10000 {
-					compatible = "snps,dwc3";
-					reg = <0x10000 0x17000>;
-					interrupts = <GIC_SPI 345 IRQ_TYPE_LEVEL_HIGH>,
-						     <GIC_SPI 345 IRQ_TYPE_LEVEL_HIGH>,
-						     <GIC_SPI 346 IRQ_TYPE_LEVEL_HIGH>;
-					interrupt-names = "peripheral",
-							  "host",
-							  "otg";
-					maximum-speed = "high-speed";
-					dr_mode = "otg";
-				};
-			};
-		};
-
 		target-module@41501000 {
 			compatible = "ti,sysc-omap2", "ti,sysc";
 			reg = <0x41501000 0x4>,
@@ -224,3 +180,28 @@ &pcie1_ep {
 &pcie2_rc {
 	compatible = "ti,dra746-pcie-rc", "ti,dra7-pcie";
 };
+
+&usb4_tm {
+	omap_dwc3_4: omap_dwc3_4@0 {
+		compatible = "ti,dwc3";
+		reg = <0 0x10000>;
+		interrupts = <GIC_SPI 346 IRQ_TYPE_LEVEL_HIGH>;
+		#address-cells = <1>;
+		#size-cells = <1>;
+		utmi-mode = <2>;
+		ranges;
+		status = "disabled";
+		usb4: usb@10000 {
+			compatible = "snps,dwc3";
+			reg = <0x10000 0x17000>;
+			interrupts = <GIC_SPI 345 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 345 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 346 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "peripheral",
+					  "host",
+					  "otg";
+			maximum-speed = "high-speed";
+			dr_mode = "otg";
+		};
+	};
+};
-- 
2.31.1

