Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0A0F3108E8A
	for <lists+linux-omap@lfdr.de>; Mon, 25 Nov 2019 14:11:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727208AbfKYNLU (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 25 Nov 2019 08:11:20 -0500
Received: from fllv0015.ext.ti.com ([198.47.19.141]:38454 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725823AbfKYNLU (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 25 Nov 2019 08:11:20 -0500
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id xAPDBBCc126044;
        Mon, 25 Nov 2019 07:11:11 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1574687471;
        bh=/brRrE34NIQuy6Eaoa29ZOs7K/pstknRZIZTGEFZBIA=;
        h=From:To:CC:Subject:Date;
        b=FFozQXDrca5FwzxDkFzhSZOkAson+KgPA52fGPgZY270Sdho3c9nRBLu8eeHqrRPU
         vcYQl4h9wn6rmfXKKh7pzGEaHoiTVEM8Tx5p98O/O2oi9I1bQ8xNK+KXtTexelOYyg
         KXT9Y2rUdNiIYEkx1OWKjqK2mSFbAVjLAcBSXd68=
Received: from DFLE106.ent.ti.com (dfle106.ent.ti.com [10.64.6.27])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xAPDBBl5024060
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 25 Nov 2019 07:11:11 -0600
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Mon, 25
 Nov 2019 07:11:10 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Mon, 25 Nov 2019 07:11:10 -0600
Received: from deskari.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id xAPDB7rk113038;
        Mon, 25 Nov 2019 07:11:08 -0600
From:   Tomi Valkeinen <tomi.valkeinen@ti.com>
To:     <linux-omap@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <tony@atomide.com>
CC:     <robh+dt@kernel.org>, <mark.rutland@arm.com>,
        <dri-devel@lists.freedesktop.org>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: [PATCH 1/4] ARM: dts: am437x-gp-evm: add HDMI support
Date:   Mon, 25 Nov 2019 15:10:57 +0200
Message-ID: <20191125131100.9839-1-tomi.valkeinen@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Add HDMI support for AM437x GP EVM. The HDMI uses SiI9022 HDMI encoder,
and is mutually exclusive with the LCD. The choice between LCD and HDMI
is made by booting either with am437x-gp-evm.dtb or
am437x-gp-evm-hdmi.dtb.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
---
 arch/arm/boot/dts/Makefile               |   1 +
 arch/arm/boot/dts/am437x-gp-evm-hdmi.dts | 112 +++++++++++++++++++++++
 2 files changed, 113 insertions(+)
 create mode 100644 arch/arm/boot/dts/am437x-gp-evm-hdmi.dts

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index b21b3a64641a..612149069180 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -779,6 +779,7 @@ dtb-$(CONFIG_SOC_AM43XX) += \
 	am43x-epos-evm.dtb \
 	am437x-cm-t43.dtb \
 	am437x-gp-evm.dtb \
+	am437x-gp-evm-hdmi.dtb \
 	am437x-idk-evm.dtb \
 	am437x-sbc-t43.dtb \
 	am437x-sk-evm.dtb
diff --git a/arch/arm/boot/dts/am437x-gp-evm-hdmi.dts b/arch/arm/boot/dts/am437x-gp-evm-hdmi.dts
new file mode 100644
index 000000000000..580a1e3e0dcd
--- /dev/null
+++ b/arch/arm/boot/dts/am437x-gp-evm-hdmi.dts
@@ -0,0 +1,112 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2019 Texas Instruments Incorporated - http://www.ti.com/
+ */
+
+/* AM437x GP EVM with HDMI output */
+
+#include "am437x-gp-evm.dts"
+
+/delete-node/ &lcd0;
+
+/ {
+	aliases {
+		display0 = &hdmi;
+	};
+
+	hdmi: connector {
+		compatible = "hdmi-connector";
+		label = "hdmi";
+
+		type = "b";
+
+		port {
+			hdmi_connector_in: endpoint {
+				remote-endpoint = <&sii9022_out>;
+			};
+		};
+	};
+
+	sound@1 {
+		compatible = "simple-audio-card";
+		simple-audio-card,name = "HDMI";
+		simple-audio-card,format = "i2s";
+		simple-audio-card,bitclock-master = <&hdmi_dailink_master>;
+		simple-audio-card,frame-master = <&hdmi_dailink_master>;
+		hdmi_dailink_master: simple-audio-card,cpu {
+			sound-dai = <&mcasp1>;
+			system-clock-frequency = <24000000>;
+			system-clock-direction-out;
+		};
+
+		simple-audio-card,codec {
+			sound-dai = <&sii9022>;
+		};
+	};
+
+	sii9022_mclk: sii9022_mclk {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <12000000>;
+	};
+};
+
+&lcd_bl {
+	status = "disabled";
+};
+
+&sound0 {
+	status = "disabled";
+};
+
+&tlv320aic3106 {
+	status = "disabled";
+};
+
+&i2c1 {
+	sii9022: sii9022@3b {
+		#sound-dai-cells = <0>;
+		compatible = "sil,sii9022";
+		reg = <0x3b>;
+
+		interrupt-parent = <&gpio3>;
+		interrupts = <24 IRQ_TYPE_LEVEL_LOW>;
+
+		sil,i2s-data-lanes = < 0 >;
+		clocks = <&sii9022_mclk>;
+		clock-names = "mclk";
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+
+				sii9022_in: endpoint {
+					remote-endpoint = <&dpi_out>;
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+
+				sii9022_out: endpoint {
+					remote-endpoint = <&hdmi_connector_in>;
+				};
+			};
+		};
+	};
+};
+
+&dpi_out {
+	remote-endpoint = <&sii9022_in>;
+	data-lines = <24>;
+};
+
+/* Override SelLCDorHDMI from am437x-gp-evm.dts to select HDMI */
+&gpio5 {
+	p8 {
+		output-low;
+	};
+};
-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

