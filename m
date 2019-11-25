Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EC181108E8D
	for <lists+linux-omap@lfdr.de>; Mon, 25 Nov 2019 14:11:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727026AbfKYNLV (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 25 Nov 2019 08:11:21 -0500
Received: from lelv0142.ext.ti.com ([198.47.23.249]:45790 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725823AbfKYNLV (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 25 Nov 2019 08:11:21 -0500
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id xAPDBFJK027628;
        Mon, 25 Nov 2019 07:11:15 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1574687475;
        bh=HLyUGkQcTk4X5+NEK1dNs6pfu56MCJ/7tTgfWWwUJFg=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=aIR/PgJCG2ihazg8uoli5c1ohRYege4QTb4CznVWi05lo3YjQx2BRzOODVyOH5WgP
         yyJkXIs9Ft64I5aPX3WhYpnConX2GPM2euaI5PlxMtKBHsLxaUI1616HILb1Gn8pe3
         uEPJj6llwzFJPuJ05o8lZMU45WVxLzTgL7AOsP8o=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xAPDBESQ078281
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 25 Nov 2019 07:11:15 -0600
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Mon, 25
 Nov 2019 07:11:14 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Mon, 25 Nov 2019 07:11:14 -0600
Received: from deskari.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id xAPDB7rm113038;
        Mon, 25 Nov 2019 07:11:12 -0600
From:   Tomi Valkeinen <tomi.valkeinen@ti.com>
To:     <linux-omap@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <tony@atomide.com>
CC:     <robh+dt@kernel.org>, <mark.rutland@arm.com>,
        <dri-devel@lists.freedesktop.org>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: [PATCH 3/4] ARM: dts: dra76-evm: add HDMI output
Date:   Mon, 25 Nov 2019 15:10:59 +0200
Message-ID: <20191125131100.9839-3-tomi.valkeinen@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191125131100.9839-1-tomi.valkeinen@ti.com>
References: <20191125131100.9839-1-tomi.valkeinen@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Add DRA76 EVM HDMI output for the base board.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
---
 arch/arm/boot/dts/dra76-evm.dts | 66 +++++++++++++++++++++++++++++++++
 1 file changed, 66 insertions(+)

diff --git a/arch/arm/boot/dts/dra76-evm.dts b/arch/arm/boot/dts/dra76-evm.dts
index 1fb6f13fb5e2..86a3e79909a8 100644
--- a/arch/arm/boot/dts/dra76-evm.dts
+++ b/arch/arm/boot/dts/dra76-evm.dts
@@ -13,6 +13,13 @@
 	model = "TI DRA762 EVM";
 	compatible = "ti,dra76-evm", "ti,dra762", "ti,dra7";
 
+	aliases {
+		display0 = &hdmi0;
+
+		sound0 = &sound0;
+		sound1 = &hdmi;
+	};
+
 	memory@0 {
 		device_type = "memory";
 		reg = <0x0 0x80000000 0x0 0x80000000>;
@@ -116,6 +123,48 @@
 		regulator-min-microvolt = <1800000>;
 		regulator-max-microvolt = <1800000>;
 	};
+
+	hdmi0: connector {
+		compatible = "hdmi-connector";
+		label = "hdmi";
+
+		type = "a";
+
+		port {
+			hdmi_connector_in: endpoint {
+				remote-endpoint = <&tpd12s015_out>;
+			};
+		};
+	};
+
+	tpd12s015: encoder {
+		compatible = "ti,tpd12s015";
+
+		gpios = <&gpio7 30 GPIO_ACTIVE_HIGH>,   /* gpio7_30, CT CP HPD */
+			<&gpio7 31 GPIO_ACTIVE_HIGH>,   /* gpio7_31, LS OE */
+			<&gpio7 12 GPIO_ACTIVE_HIGH>;   /* gpio7_12/sp1_cs2, HPD */
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+
+				tpd12s015_in: endpoint {
+					remote-endpoint = <&hdmi_out>;
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+
+				tpd12s015_out: endpoint {
+					remote-endpoint = <&hdmi_connector_in>;
+				};
+			};
+		};
+	};
 };
 
 &i2c1 {
@@ -411,6 +460,23 @@
 	phy-supply = <&ldo3_reg>;
 };
 
+&dss {
+	status = "ok";
+	vdda_video-supply = <&ldo5_reg>;
+};
+
+&hdmi {
+	status = "ok";
+
+	vdda-supply = <&ldo1_reg>;
+
+	port {
+		hdmi_out: endpoint {
+			remote-endpoint = <&tpd12s015_in>;
+		};
+	};
+};
+
 &qspi {
 	spi-max-frequency = <96000000>;
 	m25p80@0 {
-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

