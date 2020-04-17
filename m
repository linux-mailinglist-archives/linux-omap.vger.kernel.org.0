Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BFA551ADC30
	for <lists+linux-omap@lfdr.de>; Fri, 17 Apr 2020 13:31:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730246AbgDQLap (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 17 Apr 2020 07:30:45 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:38010 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730236AbgDQLap (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 17 Apr 2020 07:30:45 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 03HBUecs123691;
        Fri, 17 Apr 2020 06:30:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1587123040;
        bh=wiRay/WueHQYiNnlT8xNUSvOJc16AOt8Hp1NKq0uCY0=;
        h=From:To:CC:Subject:Date;
        b=H50wcT4FycYlSx+fVzLSPCU85XQmFBo9Tbb0dtRefiEAaeqqXCxxCShuWMUIiiiNQ
         zKhXKd4pEIcFQIL+mSAEHJiv6V4Nj+hauGcxetS68C3fSVr3pLoKDSNpypRz6hN1WC
         cHRGexOov75QQqMSDq+ZXDIp5rh6m1AFl+xlsQzQ=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 03HBUeWZ116672
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 17 Apr 2020 06:30:40 -0500
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Fri, 17
 Apr 2020 06:30:39 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Fri, 17 Apr 2020 06:30:39 -0500
Received: from deskari.lan (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 03HBUb1k007821;
        Fri, 17 Apr 2020 06:30:38 -0500
From:   Tomi Valkeinen <tomi.valkeinen@ti.com>
To:     =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        Tony Lindgren <tony@atomide.com>,
        Rob Herring <robh+dt@kernel.org>, <linux-omap@vger.kernel.org>,
        <devicetree@vger.kernel.org>
CC:     Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: [PATCH] ARM: dts: am57xx-idk-common: add tc358778 bridge
Date:   Fri, 17 Apr 2020 14:30:20 +0300
Message-ID: <20200417113020.23786-1-tomi.valkeinen@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

AM5 IDK boards have TC358778 DPI-to-DSI bridge. Two different DSI panel
models are used with the AM5 IDKs, and these panels are added with DT
overlays. The AM5 IDKs can also be used without any panel.

Add TC358778 data to the am57xx-idk-common.dtsi, but set the status to
disabled.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
---
 arch/arm/boot/dts/am57xx-idk-common.dtsi | 58 ++++++++++++++++++++++++
 1 file changed, 58 insertions(+)

diff --git a/arch/arm/boot/dts/am57xx-idk-common.dtsi b/arch/arm/boot/dts/am57xx-idk-common.dtsi
index aa5e55f98179..8ec71342f289 100644
--- a/arch/arm/boot/dts/am57xx-idk-common.dtsi
+++ b/arch/arm/boot/dts/am57xx-idk-common.dtsi
@@ -35,6 +35,16 @@
 		regulator-boot-on;
 	};
 
+	v1_2d: fixedregulator-v1_2d {
+		compatible = "regulator-fixed";
+		regulator-name = "V1_2D";
+		vin-supply = <&vmain>;
+		regulator-min-microvolt = <1200000>;
+		regulator-max-microvolt = <1200000>;
+		regulator-always-on;
+		regulator-boot-on;
+	};
+
 	vtt_fixed: fixedregulator-vtt {
 		/* TPS51200 */
 		compatible = "regulator-fixed";
@@ -139,6 +149,12 @@
 			};
 		};
 	};
+
+	src_clk_x1: src_clk_x1 {
+		#clock-cells = <0>;
+		compatible = "fixed-clock";
+		clock-frequency = <20000000>;
+	};
 };
 
 &dra7_pmx_core {
@@ -378,6 +394,32 @@
 		gpio-controller;
 		#gpio-cells = <2>;
 	};
+
+	dsi_bridge: tc358778@e {
+		compatible = "toshiba,tc358778", "toshiba,tc358768";
+		reg = <0xe>;
+		status = "disabled";
+
+		clocks = <&src_clk_x1>;
+		clock-names = "refclk";
+
+		vddc-supply = <&v1_2d>;
+		vddmipi-supply = <&v1_2d>;
+		vddio-supply = <&v3_3d>;
+
+		dsi_bridge_ports: ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+				rgb_in: endpoint {
+					remote-endpoint = <&dpi_out>;
+					data-lines = <24>;
+				};
+			};
+		};
+	};
 };
 
 &mcspi3 {
@@ -543,4 +585,20 @@
 
 &dss {
 	status = "okay";
+
+	vdda_video-supply = <&ldoln_reg>;
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@0 {
+			reg = <0>;
+
+			dpi_out: endpoint {
+				remote-endpoint = <&rgb_in>;
+				data-lines = <24>;
+			};
+		};
+	};
 };
-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

