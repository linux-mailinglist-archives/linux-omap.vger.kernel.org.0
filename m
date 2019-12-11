Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7A6D911ACEB
	for <lists+linux-omap@lfdr.de>; Wed, 11 Dec 2019 15:04:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729941AbfLKOED (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 11 Dec 2019 09:04:03 -0500
Received: from lelv0143.ext.ti.com ([198.47.23.248]:44806 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729118AbfLKOED (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 11 Dec 2019 09:04:03 -0500
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id xBBE40gj113989;
        Wed, 11 Dec 2019 08:04:00 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1576073040;
        bh=X9B0cbHSFBh6z+++yuvEhMSytocbxnyPPOMKchxLqbc=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=NKVNemM5CsjL3BRzXptZb3PasR/QVO/VAqNNJsEn9UCWrVnwQ5cIx+M+7gBaThsdt
         zmDtkyBL1qYQtSvwbVeyT9EONp5/TPY6j4ZiwPaUVKygnA8flmth/fdOs38n7NZeDM
         Ypmefl+slfI1q5bNIcI76JQSO8txWoMkpG4hR+Xk=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xBBE40IH095707
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 11 Dec 2019 08:04:00 -0600
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Wed, 11
 Dec 2019 08:03:59 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Wed, 11 Dec 2019 08:03:59 -0600
Received: from uda0869644b.dal.design.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id xBBE3wcn086061;
        Wed, 11 Dec 2019 08:03:59 -0600
From:   Benoit Parrot <bparrot@ti.com>
To:     Tony Lindgren <tony@atomide.com>, Tero Kristo <t-kristo@ti.com>,
        <linux-omap@vger.kernel.org>, <linux-clk@vger.kernel.org>
CC:     Rob Herring <robh+dt@kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Benoit Parrot <bparrot@ti.com>
Subject: [Patch v3 2/3] ARM: dts: am437x-sk-evm: Add VPFE and OV2659 entries
Date:   Wed, 11 Dec 2019 08:07:19 -0600
Message-ID: <20191211140720.10539-3-bparrot@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191211140720.10539-1-bparrot@ti.com>
References: <20191211140720.10539-1-bparrot@ti.com>
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

