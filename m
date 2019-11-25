Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3950B108E91
	for <lists+linux-omap@lfdr.de>; Mon, 25 Nov 2019 14:11:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727602AbfKYNLW (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 25 Nov 2019 08:11:22 -0500
Received: from fllv0016.ext.ti.com ([198.47.19.142]:47472 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725823AbfKYNLW (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 25 Nov 2019 08:11:22 -0500
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id xAPDBGGw109597;
        Mon, 25 Nov 2019 07:11:17 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1574687477;
        bh=hbZE26zge3K89kExbsBcxPuC5nohmi4Ux2aykhezHaw=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=It3k/tsO/eXRNu3D6grUmLFVsmObHbTRFCRAnI/ztmdb+hHRAK7sZopgUDDE946mQ
         f0UvEdhhmtgpRFEm/TQKcXmvjku28wkydWyt6wVR5cpDwHea6L6FIxgYb/GeUiFTGZ
         UKETNs9IDiszxrzNbB7fVQr+FvSAwkrjZ8meVJW0=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xAPDBGtU024160
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 25 Nov 2019 07:11:16 -0600
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Mon, 25
 Nov 2019 07:11:16 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Mon, 25 Nov 2019 07:11:16 -0600
Received: from deskari.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id xAPDB7rn113038;
        Mon, 25 Nov 2019 07:11:14 -0600
From:   Tomi Valkeinen <tomi.valkeinen@ti.com>
To:     <linux-omap@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <tony@atomide.com>
CC:     <robh+dt@kernel.org>, <mark.rutland@arm.com>,
        <dri-devel@lists.freedesktop.org>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: [PATCH 4/4] ARM: dts: am57xx-idk-common: add HDMI to the common dtsi
Date:   Mon, 25 Nov 2019 15:11:00 +0200
Message-ID: <20191125131100.9839-4-tomi.valkeinen@ti.com>
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

AM571x/AM572x/AM574x IDK base boards have HDMI output. Add DT nodes to
am57xx-idk-common.dtsi to enable HDMI.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
---
 arch/arm/boot/dts/am57xx-idk-common.dtsi | 59 ++++++++++++++++++++++++
 1 file changed, 59 insertions(+)

diff --git a/arch/arm/boot/dts/am57xx-idk-common.dtsi b/arch/arm/boot/dts/am57xx-idk-common.dtsi
index 423855a2a2d6..a9c8f2859aea 100644
--- a/arch/arm/boot/dts/am57xx-idk-common.dtsi
+++ b/arch/arm/boot/dts/am57xx-idk-common.dtsi
@@ -9,6 +9,7 @@
 	aliases {
 		rtc0 = &tps659038_rtc;
 		rtc1 = &rtc;
+		display0 = &hdmi0;
 	};
 
 	chosen {
@@ -96,6 +97,48 @@
 			default-state = "off";
 		};
 	};
+
+	hdmi0: connector@0 {
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
+	tpd12s015: encoder@0 {
+		compatible = "ti,tpd12s016", "ti,tpd12s015";
+
+		gpios = <0>, /* optional CT_CP_HPD */
+			<0>, /* optional LS_OE */
+			<&gpio7 12 GPIO_ACTIVE_HIGH>;	/* HPD */
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+
+				tpd12s015_in: endpoint@0 {
+					remote-endpoint = <&hdmi_out>;
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+
+				tpd12s015_out: endpoint@0 {
+					remote-endpoint = <&hdmi_connector_in>;
+				};
+			};
+		};
+	};
 };
 
 &dra7_pmx_core {
@@ -490,3 +533,19 @@
 &cpu0 {
 	vdd-supply = <&smps12_reg>;
 };
+
+&hdmi {
+	status = "okay";
+
+	vdda-supply = <&ldo4_reg>;
+
+	port {
+		hdmi_out: endpoint {
+			remote-endpoint = <&tpd12s015_in>;
+		};
+	};
+};
+
+&dss {
+	status = "okay";
+};
-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

