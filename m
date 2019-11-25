Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 73730108E8B
	for <lists+linux-omap@lfdr.de>; Mon, 25 Nov 2019 14:11:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727420AbfKYNLV (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 25 Nov 2019 08:11:21 -0500
Received: from fllv0015.ext.ti.com ([198.47.19.141]:38464 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727026AbfKYNLV (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 25 Nov 2019 08:11:21 -0500
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id xAPDBCI8126062;
        Mon, 25 Nov 2019 07:11:12 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1574687472;
        bh=agMY92W2bwaR6RtyoJZToavWwnkd24a1j8kvLzHdN3Y=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=pT7b1L03JH3AL788c+iiy6tBVoFRR49sN1ehmL6lcnh80MWtecUc+Zv0CUT41EAZE
         tf3d1178t0Hj0rNwzYHXu/BFgIrfBGhpL9xA1A5Hfv/6oWdQ4CQnwkkoLvdXnSBecu
         IGfAwj30f+8z9hcXQk7q9stngeSRUkOFgEekagHY=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xAPDBCFv070827
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 25 Nov 2019 07:11:12 -0600
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Mon, 25
 Nov 2019 07:11:12 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Mon, 25 Nov 2019 07:11:12 -0600
Received: from deskari.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id xAPDB7rl113038;
        Mon, 25 Nov 2019 07:11:10 -0600
From:   Tomi Valkeinen <tomi.valkeinen@ti.com>
To:     <linux-omap@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <tony@atomide.com>
CC:     <robh+dt@kernel.org>, <mark.rutland@arm.com>,
        <dri-devel@lists.freedesktop.org>, Jyri Sarha <jsarha@ti.com>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: [PATCH 2/4] ARM: dts: am437x-epos-evm: add HDMI support
Date:   Mon, 25 Nov 2019 15:10:58 +0200
Message-ID: <20191125131100.9839-2-tomi.valkeinen@ti.com>
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

From: Jyri Sarha <jsarha@ti.com>

Add HDMI support for AM43x EPOS EVM. The HDMI uses SiI9022 HDMI
encoder for audio and display, and it is mutually exclusive with the
LCD and analogue audio. The choice between LCD + analogue audio and
HDMI + HDMI-audio is made by booting either with am43x-epos-evm.dtb or
am43x-epos-evm-hdmi.dtb.

Signed-off-by: Jyri Sarha <jsarha@ti.com>
Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
---
 arch/arm/boot/dts/Makefile                |   1 +
 arch/arm/boot/dts/am43x-epos-evm-hdmi.dts | 120 ++++++++++++++++++++++
 2 files changed, 121 insertions(+)
 create mode 100644 arch/arm/boot/dts/am43x-epos-evm-hdmi.dts

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index 612149069180..43ba465596ad 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -777,6 +777,7 @@ dtb-$(CONFIG_ARCH_OMAP4) += \
 	omap4-var-stk-om44.dtb
 dtb-$(CONFIG_SOC_AM43XX) += \
 	am43x-epos-evm.dtb \
+	am43x-epos-evm-hdmi.dtb \
 	am437x-cm-t43.dtb \
 	am437x-gp-evm.dtb \
 	am437x-gp-evm-hdmi.dtb \
diff --git a/arch/arm/boot/dts/am43x-epos-evm-hdmi.dts b/arch/arm/boot/dts/am43x-epos-evm-hdmi.dts
new file mode 100644
index 000000000000..314e9e8c513c
--- /dev/null
+++ b/arch/arm/boot/dts/am43x-epos-evm-hdmi.dts
@@ -0,0 +1,120 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2019 Texas Instruments Incorporated - http://www.ti.com/
+ */
+
+/* AM437x EPOS EVM with HDMI output */
+
+#include "am43x-epos-evm.dts"
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
+&tlv320aic3111 {
+	status = "disabled";
+};
+
+&am43xx_pinmux {
+	sii9022_pins: sii9022_pins {
+		pinctrl-single,pins = <
+			AM4372_IOPAD(0x848, PIN_INPUT | MUX_MODE7)	/* gpmc_a2.gpio1_18 */
+		>;
+	};
+};
+
+&i2c2 {
+	sii9022: sii9022@3b {
+		#sound-dai-cells = <0>;
+		compatible = "sil,sii9022";
+		reg = <0x3b>;
+
+		interrupt-parent = <&gpio1>;
+		interrupts = <18 IRQ_TYPE_LEVEL_LOW>;
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
+/* Override SelLCDorHDMI from am437x-epos-evm.dts to select HDMI */
+&gpio2 {
+	p1 {
+		output-low;
+	};
+};
-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

