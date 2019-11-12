Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E9F0BF9240
	for <lists+linux-omap@lfdr.de>; Tue, 12 Nov 2019 15:27:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727507AbfKLO0i (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 12 Nov 2019 09:26:38 -0500
Received: from fllv0016.ext.ti.com ([198.47.19.142]:37160 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726497AbfKLO0h (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 12 Nov 2019 09:26:37 -0500
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id xACEQXhu013418;
        Tue, 12 Nov 2019 08:26:33 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1573568793;
        bh=X9B0cbHSFBh6z+++yuvEhMSytocbxnyPPOMKchxLqbc=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=Bh8jzIfRPh0zVawLd6Lz41xrQ+aaqzb1ZzSqwxtCfpuDIsQZu4MjZiniPBbdGyFL3
         adr8UKQu4g4/IfUiZwP1scdCqzLKzLSqm4eAq4/ULPcReLkykdOM7HWbTObvqb/lfB
         ZKwukGkhuhir4CPLwyBtSnjes3gLklbnKU1fP82o=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xACEQXuD014383
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 12 Nov 2019 08:26:33 -0600
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Tue, 12
 Nov 2019 08:26:32 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Tue, 12 Nov 2019 08:26:15 -0600
Received: from uda0869644b.dal.design.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id xACEQUtv040290;
        Tue, 12 Nov 2019 08:26:32 -0600
From:   Benoit Parrot <bparrot@ti.com>
To:     Tony Lindgren <tony@atomide.com>, Tero Kristo <t-kristo@ti.com>
CC:     <linux-omap@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Benoit Parrot <bparrot@ti.com>
Subject: [Patch v2 2/3] ARM: dts: am437x-sk-evm: Add VPFE and OV2659 entries
Date:   Tue, 12 Nov 2019 08:29:28 -0600
Message-ID: <20191112142929.23058-3-bparrot@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191112142929.23058-1-bparrot@ti.com>
References: <20191112142929.23058-1-bparrot@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Add VPFE device nodes entries.
Add OmniVision OV2659 sensor device nodes and linkage.

The sensor clock (xvclk) is sourced from clkout1.
Add clock entries to properly select clkout1 and set its parent
clock to sys_clkin_ck.

Signed-off-by: Benoit Parrot <bparrot@ti.com>
---
 arch/arm/boot/dts/am437x-sk-evm.dts | 27 ++++++++++++++++++++++++++-
 1 file changed, 26 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/am437x-sk-evm.dts b/arch/arm/boot/dts/am437x-sk-evm.dts
index 74eaa6a3b258..25222497f828 100644
--- a/arch/arm/boot/dts/am437x-sk-evm.dts
+++ b/arch/arm/boot/dts/am437x-sk-evm.dts
@@ -272,6 +272,12 @@
 		>;
 	};
 
+	clkout1_pin: pinmux_clkout1_pin {
+		pinctrl-single,pins = <
+			0x270 (PIN_OUTPUT_PULLDOWN | MUX_MODE3)	/* XDMA_EVENT_INTR0/CLKOUT1 */
+		>;
+	};
+
 	cpsw_default: cpsw_default {
 		pinctrl-single,pins = <
 			/* Slave 1 */
@@ -593,6 +599,25 @@
 	pinctrl-0 = <&i2c1_pins>;
 	clock-frequency = <400000>;
 
+	ov2659@30 {
+		compatible = "ovti,ov2659";
+		reg = <0x30>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&clkout1_pin>;
+
+		clocks = <&clkout1_mux_ck>;
+		clock-names = "xvclk";
+		assigned-clocks = <&clkout1_mux_ck>;
+		assigned-clock-parents = <&clkout1_osc_div_ck>;
+
+		port {
+			ov2659_1: endpoint {
+				remote-endpoint = <&vpfe0_ep>;
+				link-frequencies = /bits/ 64 <70000000>;
+			};
+		};
+	};
+
 	edt-ft5306@38 {
 		status = "okay";
 		compatible = "edt,edt-ft5306", "edt,edt-ft5x06";
@@ -877,7 +902,7 @@
 	/* Camera port */
 	port {
 		vpfe0_ep: endpoint {
-			/* remote-endpoint = <&sensor>; add once we have it */
+			remote-endpoint = <&ov2659_1>;
 			ti,am437x-vpfe-interface = <0>;
 			bus-width = <8>;
 			hsync-active = <0>;
-- 
2.17.1

