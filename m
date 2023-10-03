Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 154FB7B66DF
	for <lists+linux-omap@lfdr.de>; Tue,  3 Oct 2023 12:56:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239743AbjJCK4n (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 3 Oct 2023 06:56:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33508 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239713AbjJCK4m (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 3 Oct 2023 06:56:42 -0400
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 603E6E6;
        Tue,  3 Oct 2023 03:56:37 -0700 (PDT)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 393Au89G046551;
        Tue, 3 Oct 2023 05:56:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1696330568;
        bh=GCGM9DcDv989WAbM0BV5ScxtDmg1pS0IZOH8hU4x1g8=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=mTJ26IP9ft9WKqt0XcC7PkYKYnXWiX130Diq/VbyLDb3Nj5CtVg6gHOCT/AEdVog/
         FpffjemrPM7sODRJfByHxKy9HU7w38QuUd1BIKeKnGBk+SfV14GpdRk5K30in4XTcT
         aREBrQ8mClEKMKj/bsLBM/lbbU00hIf5JrS11C5U=
Received: from DLEE110.ent.ti.com (dlee110.ent.ti.com [157.170.170.21])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 393Au8K0127906
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 3 Oct 2023 05:56:08 -0500
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 3
 Oct 2023 05:56:08 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 3 Oct 2023 05:56:08 -0500
Received: from fllv0122.itg.ti.com (fllv0122.itg.ti.com [10.247.120.72])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 393Au8Ld123255;
        Tue, 3 Oct 2023 05:56:08 -0500
Received: from localhost (danish-tpc.dhcp.ti.com [10.24.69.199])
        by fllv0122.itg.ti.com (8.14.7/8.14.7) with ESMTP id 393Au7vK007916;
        Tue, 3 Oct 2023 05:56:07 -0500
From:   MD Danish Anwar <danishanwar@ti.com>
To:     Vignesh Raghavendra <vigneshr@ti.com>, Nishanth Menon <nm@ti.com>
CC:     Peng Fan <peng.fan@nxp.com>, Udit Kumar <u-kumar1@ti.com>,
        =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= 
        <nfraprado@collabora.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Bjorn Andersson <quic_bjorande@quicinc.com>,
        Will Deacon <will@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        Tero Kristo <kristo@kernel.org>, <linux-omap@vger.kernel.org>,
        <srk@ti.com>, <r-gunasekaran@ti.com>,
        MD Danish Anwar <danishanwar@ti.com>
Subject: [PATCH v4 3/4] arm64: dts: ti: k3-am654-idk: Add ICSSG Ethernet ports
Date:   Tue, 3 Oct 2023 16:25:38 +0530
Message-ID: <20231003105539.1698436-4-danishanwar@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231003105539.1698436-1-danishanwar@ti.com>
References: <20231003105539.1698436-1-danishanwar@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

The IDK application board has 4 Gigabit Ethernet ports.

This patch adds support for the 4 Gigabit Ethernet ports
which are provided by ICSSG0 and ICSSG1.
The IEP0 SYNC_OUT0 pins are used for PPS out on the IDK card.

Signed-off-by: MD Danish Anwar <danishanwar@ti.com>
---
 arch/arm64/boot/dts/ti/Makefile          |   2 +
 arch/arm64/boot/dts/ti/k3-am654-idk.dtso | 296 +++++++++++++++++++++++
 2 files changed, 298 insertions(+)
 create mode 100644 arch/arm64/boot/dts/ti/k3-am654-idk.dtso

diff --git a/arch/arm64/boot/dts/ti/Makefile b/arch/arm64/boot/dts/ti/Makefile
index 8f5c9515777e..7f2d6099b2f4 100644
--- a/arch/arm64/boot/dts/ti/Makefile
+++ b/arch/arm64/boot/dts/ti/Makefile
@@ -44,6 +44,7 @@ dtb-$(CONFIG_ARCH_K3) += k3-am642-tqma64xxl-mbax4xxl-wlan.dtb
 # Boards with AM65x SoC
 k3-am654-base-board-dtbs := k3-am654-common-board.dtb k3-am654-icssg2.dtbo
 k3-am654-gp-evm-dtbs := k3-am654-base-board.dtb k3-am654-base-board-rocktech-rk101-panel.dtbo
+k3-am654-idk-dtbs := k3-am654-base-board.dtb k3-am654-idk.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-am6528-iot2050-basic.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-am6528-iot2050-basic-pg2.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-am6548-iot2050-advanced.dtb
@@ -52,6 +53,7 @@ dtb-$(CONFIG_ARCH_K3) += k3-am6548-iot2050-advanced-pg2.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-am654-common-board.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-am654-base-board.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-am654-gp-evm.dtb
+dtb-$(CONFIG_ARCH_K3) += k3-am654-idk.dtb
 
 # Boards with J7200 SoC
 k3-j7200-evm-dtbs := k3-j7200-common-proc-board.dtb k3-j7200-evm-quad-port-eth-exp.dtbo
diff --git a/arch/arm64/boot/dts/ti/k3-am654-idk.dtso b/arch/arm64/boot/dts/ti/k3-am654-idk.dtso
new file mode 100644
index 000000000000..150428dfce6f
--- /dev/null
+++ b/arch/arm64/boot/dts/ti/k3-am654-idk.dtso
@@ -0,0 +1,296 @@
+// SPDX-License-Identifier: GPL-2.0
+/**
+ * DT overlay for IDK application board on AM654 EVM
+ *
+ * Copyright (C) 2018-2023 Texas Instruments Incorporated - https://www.ti.com/
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/net/ti-dp83867.h>
+#include "k3-pinctrl.h"
+
+&{/} {
+	aliases {
+		ethernet3 = "/icssg0-eth/ethernet-ports/port@0";
+		ethernet4 = "/icssg0-eth/ethernet-ports/port@1";
+		ethernet5 = "/icssg1-eth/ethernet-ports/port@0";
+		ethernet6 = "/icssg1-eth/ethernet-ports/port@1";
+	};
+
+	/* Ethernet node on PRU-ICSSG0 */
+	icssg0_eth: icssg0-eth {
+		compatible = "ti,am654-icssg-prueth";
+		pinctrl-names = "default";
+		pinctrl-0 = <&icssg0_rgmii_pins_default>;
+		sram = <&msmc_ram>;
+		ti,prus = <&pru0_0>, <&rtu0_0>, <&tx_pru0_0>, <&pru0_1>, <&rtu0_1>, <&tx_pru0_1>;
+		firmware-name = "ti-pruss/am65x-sr2-pru0-prueth-fw.elf",
+				"ti-pruss/am65x-sr2-rtu0-prueth-fw.elf",
+				"ti-pruss/am65x-sr2-txpru0-prueth-fw.elf",
+				"ti-pruss/am65x-sr2-pru1-prueth-fw.elf",
+				"ti-pruss/am65x-sr2-rtu1-prueth-fw.elf",
+				"ti-pruss/am65x-sr2-txpru1-prueth-fw.elf";
+
+		ti,pruss-gp-mux-sel = <2>,	/* MII mode */
+				      <2>,
+				      <2>,
+				      <2>,	/* MII mode */
+				      <2>,
+				      <2>;
+
+		ti,mii-g-rt = <&icssg0_mii_g_rt>;
+		ti,mii-rt = <&icssg0_mii_rt>;
+		ti,iep = <&icssg0_iep0>,  <&icssg0_iep1>;
+
+		interrupt-parent = <&icssg0_intc>;
+		interrupts = <24 0 2>, <25 1 3>;
+		interrupt-names = "tx_ts0", "tx_ts1";
+
+		dmas = <&main_udmap 0xc100>, /* egress slice 0 */
+		       <&main_udmap 0xc101>, /* egress slice 0 */
+		       <&main_udmap 0xc102>, /* egress slice 0 */
+		       <&main_udmap 0xc103>, /* egress slice 0 */
+		       <&main_udmap 0xc104>, /* egress slice 1 */
+		       <&main_udmap 0xc105>, /* egress slice 1 */
+		       <&main_udmap 0xc106>, /* egress slice 1 */
+		       <&main_udmap 0xc107>, /* egress slice 1 */
+
+		       <&main_udmap 0x4100>, /* ingress slice 0 */
+		       <&main_udmap 0x4101>, /* ingress slice 1 */
+		       <&main_udmap 0x4102>, /* mgmnt rsp slice 0 */
+		       <&main_udmap 0x4103>; /* mgmnt rsp slice 1 */
+		dma-names = "tx0-0", "tx0-1", "tx0-2", "tx0-3",
+			    "tx1-0", "tx1-1", "tx1-2", "tx1-3",
+			    "rx0", "rx1";
+
+		ethernet-ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			icssg0_emac0: port@0 {
+				reg = <0>;
+				phy-handle = <&icssg0_phy0>;
+				phy-mode = "rgmii-id";
+				ti,syscon-rgmii-delay = <&scm_conf 0x4100>;
+				/* Filled in by bootloader */
+				local-mac-address = [00 00 00 00 00 00];
+			};
+			icssg0_emac1: port@1 {
+				reg = <1>;
+				phy-handle = <&icssg0_phy1>;
+				phy-mode = "rgmii-id";
+				ti,syscon-rgmii-delay = <&scm_conf 0x4104>;
+				/* Filled in by bootloader */
+				local-mac-address = [00 00 00 00 00 00];
+			};
+		};
+	};
+
+	/* Ethernet node on PRU-ICSSG1 */
+	icssg1_eth: icssg1-eth {
+		compatible = "ti,am654-icssg-prueth";
+		pinctrl-names = "default";
+		pinctrl-0 = <&icssg1_rgmii_pins_default>;
+		sram = <&msmc_ram>;
+		ti,prus = <&pru1_0>, <&rtu1_0>, <&tx_pru1_0>, <&pru1_1>, <&rtu1_1>, <&tx_pru1_1>;
+		firmware-name = "ti-pruss/am65x-sr2-pru0-prueth-fw.elf",
+				"ti-pruss/am65x-sr2-rtu0-prueth-fw.elf",
+				"ti-pruss/am65x-sr2-txpru0-prueth-fw.elf",
+				"ti-pruss/am65x-sr2-pru1-prueth-fw.elf",
+				"ti-pruss/am65x-sr2-rtu1-prueth-fw.elf",
+				"ti-pruss/am65x-sr2-txpru1-prueth-fw.elf";
+
+		ti,pruss-gp-mux-sel = <2>,	/* MII mode */
+				      <2>,
+				      <2>,
+				      <2>,	/* MII mode */
+				      <2>,
+				      <2>;
+
+		ti,mii-g-rt = <&icssg1_mii_g_rt>;
+		ti,mii-rt = <&icssg1_mii_rt>;
+		ti,iep = <&icssg1_iep0>,  <&icssg1_iep1>;
+
+		interrupt-parent = <&icssg1_intc>;
+		interrupts = <24 0 2>, <25 1 3>;
+		interrupt-names = "tx_ts0", "tx_ts1";
+
+		dmas = <&main_udmap 0xc200>, /* egress slice 0 */
+		       <&main_udmap 0xc201>, /* egress slice 0 */
+		       <&main_udmap 0xc202>, /* egress slice 0 */
+		       <&main_udmap 0xc203>, /* egress slice 0 */
+		       <&main_udmap 0xc204>, /* egress slice 1 */
+		       <&main_udmap 0xc205>, /* egress slice 1 */
+		       <&main_udmap 0xc206>, /* egress slice 1 */
+		       <&main_udmap 0xc207>, /* egress slice 1 */
+
+		       <&main_udmap 0x4200>, /* ingress slice 0 */
+		       <&main_udmap 0x4201>, /* ingress slice 1 */
+		       <&main_udmap 0x4202>, /* mgmnt rsp slice 0 */
+		       <&main_udmap 0x4203>; /* mgmnt rsp slice 1 */
+		dma-names = "tx0-0", "tx0-1", "tx0-2", "tx0-3",
+			    "tx1-0", "tx1-1", "tx1-2", "tx1-3",
+			    "rx0", "rx1";
+
+		ethernet-ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			icssg1_emac0: port@0 {
+				reg = <0>;
+				phy-handle = <&icssg1_phy0>;
+				phy-mode = "rgmii-id";
+				ti,syscon-rgmii-delay = <&scm_conf 0x4110>;
+				/* Filled in by bootloader */
+				local-mac-address = [00 00 00 00 00 00];
+			};
+			icssg1_emac1: port@1 {
+				reg = <1>;
+				phy-handle = <&icssg1_phy1>;
+				phy-mode = "rgmii-id";
+				ti,syscon-rgmii-delay = <&scm_conf 0x4114>;
+				/* Filled in by bootloader */
+				local-mac-address = [00 00 00 00 00 00];
+			};
+		};
+	};
+};
+
+&main_pmx0 {
+
+	icssg0_mdio_pins_default: icssg0-mdio-default-pins {
+		pinctrl-single,pins = <
+			AM65X_IOPAD(0x0294, PIN_INPUT, 0) /* (AE26) PRG0_MDIO0_MDIO */
+			AM65X_IOPAD(0x0298, PIN_OUTPUT, 0) /* (AE28) PRG0_MDIO0_MDC */
+		>;
+	};
+
+	icssg0_rgmii_pins_default: icssg0-rgmii-default-pins {
+		pinctrl-single,pins = <
+			AM65X_IOPAD(0x0244, PIN_INPUT, 2) /* (AB28) PRG0_PRU1_GPO0.PRG0_RGMII2_RD0 */
+			AM65X_IOPAD(0x0248, PIN_INPUT, 2) /* (AC28) PRG0_PRU1_GPO1.PRG0_RGMII2_RD1 */
+			AM65X_IOPAD(0x024c, PIN_INPUT, 2) /* (AC27) PRG0_PRU1_GPO2.PRG0_RGMII2_RD2 */
+			AM65X_IOPAD(0x0250, PIN_INPUT, 2) /* (AB26) PRG0_PRU1_GPO3.PRG0_RGMII2_RD3 */
+			AM65X_IOPAD(0x0274, PIN_OUTPUT, 2) /* (AC25) PRG0_PRU1_GPO12.PRG0_RGMII2_TD0 */
+			AM65X_IOPAD(0x0278, PIN_OUTPUT, 2) /* (AD25) PRG0_PRU1_GPO13.PRG0_RGMII2_TD1 */
+			AM65X_IOPAD(0x027c, PIN_OUTPUT, 2) /* (AD24) PRG0_PRU1_GPO14.PRG0_RGMII2_TD2 */
+			AM65X_IOPAD(0x0280, PIN_OUTPUT, 2) /* (AE27) PRG0_PRU1_GPO15.PRG0_RGMII2_TD3 */
+			AM65X_IOPAD(0x0284, PIN_INPUT, 2) /* (AC24) PRG0_PRU1_GPO16.PRG0_RGMII2_TXC */
+			AM65X_IOPAD(0x0270, PIN_OUTPUT, 2) /* (AB24) PRG0_PRU1_GPO11.PRG0_RGMII2_TX_CTL */
+			AM65X_IOPAD(0x025c, PIN_INPUT, 2) /* (AB27) PRG0_PRU1_GPO6.PRG0_RGMII2_RXC */
+			AM65X_IOPAD(0x0254, PIN_INPUT, 2) /* (AA25) PRG0_PRU1_GPO4.PRG0_RGMII2_RX_CTL */
+
+			AM65X_IOPAD(0x01f4, PIN_INPUT, 2) /* (V24) PRG0_PRU0_GPO0.PRG0_RGMII1_RD0 */
+			AM65X_IOPAD(0x01f8, PIN_INPUT, 2) /* (W25) PRG0_PRU0_GPO1.PRG0_RGMII1_RD1 */
+			AM65X_IOPAD(0x01fc, PIN_INPUT, 2) /* (W24) PRG0_PRU0_GPO2.PRG0_RGMII1_RD2 */
+			AM65X_IOPAD(0x0200, PIN_INPUT, 2) /* (AA27) PRG0_PRU0_GPO3.PRG0_RGMII1_RD3 */
+			AM65X_IOPAD(0x0224, PIN_OUTPUT, 2) /* (AD27) PRG0_PRU0_GPO12.PRG0_RGMII1_TD0 */
+			AM65X_IOPAD(0x0228, PIN_OUTPUT, 2) /* (AC26) PRG0_PRU0_GPO13.PRG0_RGMII1_TD1 */
+			AM65X_IOPAD(0x022c, PIN_OUTPUT, 2) /* (AD26) PRG0_PRU0_GPO14.PRG0_RGMII1_TD2 */
+			AM65X_IOPAD(0x0230, PIN_OUTPUT, 2) /* (AA24) PRG0_PRU0_GPO15.PRG0_RGMII1_TD3 */
+			AM65X_IOPAD(0x0234, PIN_INPUT, 2) /* (AD28) PRG0_PRU0_GPO16.PRG0_RGMII1_TXC */
+			AM65X_IOPAD(0x0220, PIN_OUTPUT, 2) /* (AB25) PRG0_PRU0_GPO11.PRG0_RGMII1_TX_CTL */
+			AM65X_IOPAD(0x020c, PIN_INPUT, 2) /* (Y25) PRG0_PRU0_GPO6.PRG0_RGMII1_RXC */
+			AM65X_IOPAD(0x0204, PIN_INPUT, 2) /* (Y24) PRG0_PRU0_GPO4.PRG0_RGMII1_RX_CTL */
+		>;
+	};
+
+	icssg0_iep0_pins_default: icssg0-iep0-default-pins {
+		pinctrl-single,pins = <
+			AM65X_IOPAD(0x0240, PIN_INPUT, 2) /* (U24) PRG0_PRU0_GPO19.PRG0_IEP0_EDC_SYNC_OUT0 */
+		>;
+	};
+
+	icssg1_mdio_pins_default: icssg1-mdio-default-pins {
+		pinctrl-single,pins = <
+			AM65X_IOPAD(0x0180, PIN_INPUT, 0) /* (AD18) PRG1_MDIO0_MDIO */
+			AM65X_IOPAD(0x0184, PIN_OUTPUT, 0) /* (AH18) PRG1_MDIO0_MDC */
+		>;
+	};
+
+	icssg1_rgmii_pins_default: icssg1-rgmii-default-pins {
+		pinctrl-single,pins = <
+			AM65X_IOPAD(0x0130, PIN_INPUT, 2) /* (AH24) PRG1_PRU1_GPO0.PRG1_RGMII2_RD0 */
+			AM65X_IOPAD(0x0134, PIN_INPUT, 2) /* (AH23) PRG1_PRU1_GPO1.PRG1_RGMII2_RD1 */
+			AM65X_IOPAD(0x0138, PIN_INPUT, 2) /* (AG21) PRG1_PRU1_GPO2.PRG1_RGMII2_RD2 */
+			AM65X_IOPAD(0x013c, PIN_INPUT, 2) /* (AH22) PRG1_PRU1_GPO3.PRG1_RGMII2_RD3 */
+			AM65X_IOPAD(0x0160, PIN_OUTPUT, 2) /* (AE20) PRG1_PRU1_GPO12.PRG1_RGMII2_TD0 */
+			AM65X_IOPAD(0x0164, PIN_OUTPUT, 2) /* (AF19) PRG1_PRU1_GPO13.PRG1_RGMII2_TD1 */
+			AM65X_IOPAD(0x0168, PIN_OUTPUT, 2) /* (AH19) PRG1_PRU1_GPO14.PRG1_RGMII2_TD2 */
+			AM65X_IOPAD(0x016c, PIN_OUTPUT, 2) /* (AG19) PRG1_PRU1_GPO15.PRG1_RGMII2_TD3 */
+			AM65X_IOPAD(0x0170, PIN_INPUT, 2) /* (AE19) PRG1_PRU1_GPO16.PRG1_RGMII2_TXC */
+			AM65X_IOPAD(0x015c, PIN_OUTPUT, 2) /* (AC20) PRG1_PRU1_GPO11.PRG1_RGMII2_TX_CTL */
+			AM65X_IOPAD(0x0148, PIN_INPUT, 2) /* (AG22) PRG1_PRU1_GPO6.PRG1_RGMII2_RXC */
+			AM65X_IOPAD(0x0140, PIN_INPUT, 2) /* (AE21) PRG1_PRU1_GPO4.PRG1_RGMII2_RX_CTL */
+
+			AM65X_IOPAD(0x00e0, PIN_INPUT, 2) /* (AE22) PRG1_PRU0_GPO0.PRG1_RGMII1_RD0 */
+			AM65X_IOPAD(0x00e4, PIN_INPUT, 2) /* (AG24) PRG1_PRU0_GPO1.PRG1_RGMII1_RD1 */
+			AM65X_IOPAD(0x00e8, PIN_INPUT, 2) /* (AF23) PRG1_PRU0_GPO2.PRG1_RGMII1_RD2 */
+			AM65X_IOPAD(0x00ec, PIN_INPUT, 2) /* (AD21) PRG1_PRU0_GPO3.PRG1_RGMII1_RD3 */
+			AM65X_IOPAD(0x0110, PIN_OUTPUT, 2) /* (AH20) PRG1_PRU0_GPO12.PRG1_RGMII1_TD0 */
+			AM65X_IOPAD(0x0114, PIN_OUTPUT, 2) /* (AH21) PRG1_PRU0_GPO13.PRG1_RGMII1_TD1 */
+			AM65X_IOPAD(0x0118, PIN_OUTPUT, 2) /* (AG20) PRG1_PRU0_GPO14.PRG1_RGMII1_TD2 */
+			AM65X_IOPAD(0x011c, PIN_OUTPUT, 2) /* (AD19) PRG1_PRU0_GPO15.PRG1_RGMII1_TD3 */
+			AM65X_IOPAD(0x0120, PIN_INPUT, 2) /* (AD20) PRG1_PRU0_GPO16.PRG1_RGMII1_TXC */
+			AM65X_IOPAD(0x010c, PIN_OUTPUT, 2) /* (AF21) PRG1_PRU0_GPO11.PRG1_RGMII1_TX_CTL */
+			AM65X_IOPAD(0x00f8, PIN_INPUT, 2) /* (AF22) PRG1_PRU0_GPO6.PRG1_RGMII1_RXC */
+			AM65X_IOPAD(0x00f0, PIN_INPUT, 2) /* (AG23) PRG1_PRU0_GPO4.PRG1_RGMII1_RX_CTL */
+		>;
+	};
+
+	icssg1_iep0_pins_default: icssg1-iep0-default-pins {
+		pinctrl-single,pins = <
+			AM65X_IOPAD(0x012c, PIN_INPUT, 2) /* (AG26) PRG1_PRU0_GPO19.PRG1_IEP0_EDC_SYNC_OUT0 */
+		>;
+	};
+};
+
+&icssg0_mdio {
+	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <&icssg0_mdio_pins_default>;
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	icssg0_phy0: ethernet-phy@0 {
+		reg = <0>;
+		ti,rx-internal-delay = <DP83867_RGMIIDCTL_2_00_NS>;
+		ti,fifo-depth = <DP83867_PHYCR_FIFO_DEPTH_4_B_NIB>;
+	};
+
+	icssg0_phy1: ethernet-phy@3 {
+		reg = <3>;
+		ti,rx-internal-delay = <DP83867_RGMIIDCTL_2_00_NS>;
+		ti,fifo-depth = <DP83867_PHYCR_FIFO_DEPTH_4_B_NIB>;
+	};
+};
+
+&icssg0_iep0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&icssg0_iep0_pins_default>;
+};
+
+&icssg1_mdio {
+	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <&icssg1_mdio_pins_default>;
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	icssg1_phy0: ethernet-phy@0 {
+		reg = <0>;
+		ti,rx-internal-delay = <DP83867_RGMIIDCTL_2_00_NS>;
+		ti,fifo-depth = <DP83867_PHYCR_FIFO_DEPTH_4_B_NIB>;
+	};
+
+	icssg1_phy1: ethernet-phy@3 {
+		reg = <3>;
+		ti,rx-internal-delay = <DP83867_RGMIIDCTL_2_00_NS>;
+		ti,fifo-depth = <DP83867_PHYCR_FIFO_DEPTH_4_B_NIB>;
+	};
+};
+
+&icssg1_iep0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&icssg1_iep0_pins_default>;
+};
-- 
2.34.1

