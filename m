Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E5D35F9229
	for <lists+linux-omap@lfdr.de>; Tue, 12 Nov 2019 15:25:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727645AbfKLOZH (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 12 Nov 2019 09:25:07 -0500
Received: from fllv0016.ext.ti.com ([198.47.19.142]:36972 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727634AbfKLOZG (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 12 Nov 2019 09:25:06 -0500
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id xACEP1wi013049;
        Tue, 12 Nov 2019 08:25:01 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1573568701;
        bh=kmOZWVEMhKzo/QTuspC9t3Ss9Ad6WJBXTCpbjCFCsoo=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=gfKsLvAfeqz7yd6aaw6BiJ3W9jv7rkHDun6LbosNvTUtOK21NWlyv8GX/sDjXsFlB
         oseFNO05tUR7yFCa4VBtCzSRkgtWzoqMYKQ4gtERdq6UiUak1+d5UaLR0amtaUOtvc
         LOL42DqP1zms1XdEwgYbKwC48x44PSaVYpquMh9U=
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xACEP1dj116080
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 12 Nov 2019 08:25:01 -0600
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Tue, 12
 Nov 2019 08:24:43 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Tue, 12 Nov 2019 08:24:43 -0600
Received: from uda0869644b.dal.design.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id xACEOrBk036029;
        Tue, 12 Nov 2019 08:25:01 -0600
From:   Benoit Parrot <bparrot@ti.com>
To:     Tony Lindgren <tony@atomide.com>, Tero Kristo <t-kristo@ti.com>
CC:     <linux-omap@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Benoit Parrot <bparrot@ti.com>
Subject: [Patch v3 05/10] ARM: dts: DRA72: Add CAL dtsi node
Date:   Tue, 12 Nov 2019 08:27:48 -0600
Message-ID: <20191112142753.22976-6-bparrot@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191112142753.22976-1-bparrot@ti.com>
References: <20191112142753.22976-1-bparrot@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

This patch adds the required dtsi node to support the Camera
Adaptation Layer (CAL) for the DRA72 family of devices.

Signed-off-by: Benoit Parrot <bparrot@ti.com>
---
 arch/arm/boot/dts/dra72x.dtsi | 43 +++++++++++++++++++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/arch/arm/boot/dts/dra72x.dtsi b/arch/arm/boot/dts/dra72x.dtsi
index f5762709c853..726e46ae887d 100644
--- a/arch/arm/boot/dts/dra72x.dtsi
+++ b/arch/arm/boot/dts/dra72x.dtsi
@@ -17,6 +17,49 @@
 	};
 };
 
+&l4_per2 {
+	target-module@5b000 {			/* 0x4845b000, ap 59 46.0 */
+		compatible = "ti,sysc-omap4", "ti,sysc";
+		reg = <0x5b000 0x4>,
+		      <0x5b010 0x4>;
+		reg-names = "rev", "sysc";
+		ti,sysc-midle = <SYSC_IDLE_FORCE>,
+				<SYSC_IDLE_NO>;
+		ti,sysc-sidle = <SYSC_IDLE_FORCE>,
+				<SYSC_IDLE_NO>;
+		clocks = <&cam_clkctrl DRA7_CAM_VIP2_CLKCTRL 0>;
+		clock-names = "fck";
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges = <0x0 0x5b000 0x1000>;
+
+		cal: cal@0 {
+			compatible = "ti,dra72-cal";
+			reg = <0x0000 0x400>,
+			      <0x0800 0x40>,
+			      <0x0900 0x40>;
+			reg-names = "cal_top",
+				    "cal_rx_core0",
+				    "cal_rx_core1";
+			interrupts = <GIC_SPI 119 IRQ_TYPE_LEVEL_HIGH>;
+			ti,camerrx-control = <&scm_conf 0xE94>;
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				csi2_0: port@0 {
+					reg = <0>;
+				};
+				csi2_1: port@1 {
+					reg = <1>;
+				};
+			};
+		};
+	};
+};
+
 &dss {
 	reg = <0x58000000 0x80>,
 	      <0x58004054 0x4>,
-- 
2.17.1

