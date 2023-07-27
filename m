Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1ED5C765265
	for <lists+linux-omap@lfdr.de>; Thu, 27 Jul 2023 13:30:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230411AbjG0Laq (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 27 Jul 2023 07:30:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55586 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230288AbjG0Lak (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 27 Jul 2023 07:30:40 -0400
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F1A8130F5;
        Thu, 27 Jul 2023 04:30:09 -0700 (PDT)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 36RBTFl9119152;
        Thu, 27 Jul 2023 06:29:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1690457355;
        bh=FUSrPTpXMB5ZsJIaJm576aGkForMkFdG3JgE96v3jw4=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=T8cD0DUkBQaDVXmMOc6E3bfKivbcc4Z4XNf9xmcm0xfgydyPOsDxJA6g1RzAewux0
         mmQfRyLPgIbLKd2GnVgtbfvFgFHbTVr1hjmU1qRPn473uG1JQP9JRj7kK/m0si7g/m
         47sO1JObiQza3egwka8bPiMVSAUtdLaLgrUjym4Q=
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 36RBTFW0038850
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 27 Jul 2023 06:29:15 -0500
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 27
 Jul 2023 06:29:14 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 27 Jul 2023 06:29:14 -0500
Received: from lelv0854.itg.ti.com (lelv0854.itg.ti.com [10.181.64.140])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 36RBTEi1094307;
        Thu, 27 Jul 2023 06:29:14 -0500
Received: from localhost (uda0501179.dhcp.ti.com [172.24.227.217])
        by lelv0854.itg.ti.com (8.14.7/8.14.7) with ESMTP id 36RBTDZO001410;
        Thu, 27 Jul 2023 06:29:14 -0500
From:   MD Danish Anwar <danishanwar@ti.com>
To:     Randy Dunlap <rdunlap@infradead.org>,
        Roger Quadros <rogerq@kernel.org>,
        Simon Horman <simon.horman@corigine.com>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Andrew Lunn <andrew@lunn.ch>,
        Richard Cochran <richardcochran@gmail.com>,
        Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Eric Dumazet <edumazet@google.com>,
        "David S. Miller" <davem@davemloft.net>,
        MD Danish Anwar <danishanwar@ti.com>
CC:     <nm@ti.com>, <srk@ti.com>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <netdev@vger.kernel.org>,
        <linux-omap@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH v12 06/10] net: ti: icssg-prueth: Add ICSSG ethernet driver
Date:   Thu, 27 Jul 2023 16:58:23 +0530
Message-ID: <20230727112827.3977534-7-danishanwar@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230727112827.3977534-1-danishanwar@ti.com>
References: <20230727112827.3977534-1-danishanwar@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

From: Roger Quadros <rogerq@ti.com>

This is the Ethernet driver for TI AM654 Silicon rev. 2
with the ICSSG PRU Sub-system running dual-EMAC firmware.

The Programmable Real-time Unit and Industrial Communication Subsystem
Gigabit (PRU_ICSSG) is a low-latency microcontroller subsystem in the TI
SoCs. This subsystem is provided for the use cases like implementation of
custom peripheral interfaces, offloading of tasks from the other
processor cores of the SoC, etc.

Every ICSSG core has two Programmable Real-Time Unit(PRUs),
two auxiliary Real-Time Transfer Unit (RT_PRUs), and
two Transmit Real-Time Transfer Units (TX_PRUs). Each one of these runs
its own firmware. Every ICSSG core has two MII ports connect to these
PRUs and also a MDIO port.

The cores can run different firmwares to support different protocols and
features like switch-dev, timestamping, etc.

It uses System DMA to transfer and receive packets and
shared memory register emulation between the firmware and
driver for control and configuration.

This patch adds support for basic EMAC functionality with 1Gbps
and 100Mbps link speed. 10M and half duplex mode are not supported
currently as they require IEP, the support for which will be added later.
Support for switch-dev, timestamp, etc. will be added later
by subsequent patch series.

Signed-off-by: Roger Quadros <rogerq@ti.com>
Signed-off-by: Vignesh Raghavendra <vigneshr@ti.com>
Signed-off-by: Grygorii Strashko <grygorii.strashko@ti.com>
Reviewed-by: Andrew Lunn <andrew@lunn.ch>
Signed-off-by: MD Danish Anwar <danishanwar@ti.com>
---
 drivers/net/ethernet/ti/Kconfig               |   13 +
 drivers/net/ethernet/ti/Makefile              |    8 +
 .../net/ethernet/ti/icssg/icssg_classifier.c  |   10 +-
 drivers/net/ethernet/ti/icssg/icssg_config.c  |    8 +-
 drivers/net/ethernet/ti/icssg/icssg_mii_cfg.c |   14 +-
 drivers/net/ethernet/ti/icssg/icssg_mii_rt.h  |   14 +-
 drivers/net/ethernet/ti/icssg/icssg_prueth.c  | 1813 +++++++++++++++++
 drivers/net/ethernet/ti/icssg/icssg_prueth.h  |   52 +
 drivers/net/ethernet/ti/icssg/icssg_queues.c  |    4 +-
 9 files changed, 1911 insertions(+), 25 deletions(-)
 create mode 100644 drivers/net/ethernet/ti/icssg/icssg_prueth.c

diff --git a/drivers/net/ethernet/ti/Kconfig b/drivers/net/ethernet/ti/Kconfig
index fce06663e1e1..63e510b6860f 100644
--- a/drivers/net/ethernet/ti/Kconfig
+++ b/drivers/net/ethernet/ti/Kconfig
@@ -183,4 +183,17 @@ config CPMAC
 	help
 	  TI AR7 CPMAC Ethernet support
 
+config TI_ICSSG_PRUETH
+	tristate "TI Gigabit PRU Ethernet driver"
+	select PHYLIB
+	depends on PRU_REMOTEPROC
+	depends on ARCH_K3 && OF && TI_K3_UDMA_GLUE_LAYER
+	help
+	  Support dual Gigabit Ethernet ports over the ICSSG PRU Subsystem.
+	  This subsystem is available starting with the AM65 platform.
+
+	  This driver requires firmware binaries which will run on the PRUs
+	  to support the Ethernet operation. Currently, it supports Ethernet
+	  with 1G and 100M link speed.
+
 endif # NET_VENDOR_TI
diff --git a/drivers/net/ethernet/ti/Makefile b/drivers/net/ethernet/ti/Makefile
index 75f761efbea7..efb050cbb4a8 100644
--- a/drivers/net/ethernet/ti/Makefile
+++ b/drivers/net/ethernet/ti/Makefile
@@ -28,3 +28,11 @@ obj-$(CONFIG_TI_K3_AM65_CPSW_NUSS) += ti-am65-cpsw-nuss.o
 ti-am65-cpsw-nuss-y := am65-cpsw-nuss.o cpsw_sl.o am65-cpsw-ethtool.o cpsw_ale.o k3-cppi-desc-pool.o am65-cpsw-qos.o
 ti-am65-cpsw-nuss-$(CONFIG_TI_K3_AM65_CPSW_SWITCHDEV) += am65-cpsw-switchdev.o
 obj-$(CONFIG_TI_K3_AM65_CPTS) += am65-cpts.o
+
+obj-$(CONFIG_TI_ICSSG_PRUETH) += icssg-prueth.o
+icssg-prueth-y := k3-cppi-desc-pool.o \
+		  icssg/icssg_prueth.o \
+		  icssg/icssg_classifier.o \
+		  icssg/icssg_queues.o \
+		  icssg/icssg_config.o \
+		  icssg/icssg_mii_cfg.o \
diff --git a/drivers/net/ethernet/ti/icssg/icssg_classifier.c b/drivers/net/ethernet/ti/icssg/icssg_classifier.c
index e675a8034574..6df53ab17fbc 100644
--- a/drivers/net/ethernet/ti/icssg/icssg_classifier.c
+++ b/drivers/net/ethernet/ti/icssg/icssg_classifier.c
@@ -274,14 +274,14 @@ static void rx_class_set_or(struct regmap *miig_rt, int slice, int n,
 	regmap_write(miig_rt, offset, data);
 }
 
-void __maybe_unused icssg_class_set_host_mac_addr(struct regmap *miig_rt, const u8 *mac)
+void icssg_class_set_host_mac_addr(struct regmap *miig_rt, const u8 *mac)
 {
 	regmap_write(miig_rt, MAC_INTERFACE_0, (u32)(mac[0] | mac[1] << 8 |
 		     mac[2] << 16 | mac[3] << 24));
 	regmap_write(miig_rt, MAC_INTERFACE_1, (u32)(mac[4] | mac[5] << 8));
 }
 
-void __maybe_unused icssg_class_set_mac_addr(struct regmap *miig_rt, int slice, u8 *mac)
+void icssg_class_set_mac_addr(struct regmap *miig_rt, int slice, u8 *mac)
 {
 	regmap_write(miig_rt, offs[slice].mac0, (u32)(mac[0] | mac[1] << 8 |
 		     mac[2] << 16 | mac[3] << 24));
@@ -289,7 +289,7 @@ void __maybe_unused icssg_class_set_mac_addr(struct regmap *miig_rt, int slice,
 }
 
 /* disable all RX traffic */
-void __maybe_unused icssg_class_disable(struct regmap *miig_rt, int slice)
+void icssg_class_disable(struct regmap *miig_rt, int slice)
 {
 	u32 data, offset;
 	int n;
@@ -331,7 +331,7 @@ void __maybe_unused icssg_class_disable(struct regmap *miig_rt, int slice)
 	regmap_write(miig_rt, offs[slice].rx_class_cfg2, 0);
 }
 
-void __maybe_unused icssg_class_default(struct regmap *miig_rt, int slice, bool allmulti)
+void icssg_class_default(struct regmap *miig_rt, int slice, bool allmulti)
 {
 	u32 data;
 
@@ -356,7 +356,7 @@ void __maybe_unused icssg_class_default(struct regmap *miig_rt, int slice, bool
 }
 
 /* required for SAV check */
-void __maybe_unused icssg_ft1_set_mac_addr(struct regmap *miig_rt, int slice, u8 *mac_addr)
+void icssg_ft1_set_mac_addr(struct regmap *miig_rt, int slice, u8 *mac_addr)
 {
 	const u8 mask_addr[] = { 0, 0, 0, 0, 0, 0, };
 
diff --git a/drivers/net/ethernet/ti/icssg/icssg_config.c b/drivers/net/ethernet/ti/icssg/icssg_config.c
index 2c0b0e03c105..ab648d3efe85 100644
--- a/drivers/net/ethernet/ti/icssg/icssg_config.c
+++ b/drivers/net/ethernet/ti/icssg/icssg_config.c
@@ -198,7 +198,7 @@ static void icssg_miig_queues_init(struct prueth *prueth, int slice)
 	}
 }
 
-void __maybe_unused icssg_config_ipg(struct prueth_emac *emac)
+void icssg_config_ipg(struct prueth_emac *emac)
 {
 	struct prueth *prueth = emac->prueth;
 	int slice = prueth_emac_slice(emac);
@@ -321,7 +321,7 @@ static void icssg_init_emac_mode(struct prueth *prueth)
 	icssg_class_set_host_mac_addr(prueth->miig_rt, mac);
 }
 
-int __maybe_unused icssg_config(struct prueth *prueth, struct prueth_emac *emac, int slice)
+int icssg_config(struct prueth *prueth, struct prueth_emac *emac, int slice)
 {
 	void __iomem *config = emac->dram.va + ICSSG_CONFIG_OFFSET;
 	struct icssg_flow_cfg __iomem *flow_cfg;
@@ -396,7 +396,7 @@ static const struct icssg_r30_cmd emac_r32_bitmask[] = {
 	{{0xffef0000,  EMAC_NONE, 0xffef0000, EMAC_NONE}}	/* VLAN UNWARE*/
 };
 
-int __maybe_unused emac_set_port_state(struct prueth_emac *emac,
+int emac_set_port_state(struct prueth_emac *emac,
 			enum icssg_port_state_cmd cmd)
 {
 	struct icssg_r30_cmd __iomem *p;
@@ -429,7 +429,7 @@ int __maybe_unused emac_set_port_state(struct prueth_emac *emac,
 	return ret;
 }
 
-void __maybe_unused icssg_config_set_speed(struct prueth_emac *emac)
+void icssg_config_set_speed(struct prueth_emac *emac)
 {
 	u8 fw_speed;
 
diff --git a/drivers/net/ethernet/ti/icssg/icssg_mii_cfg.c b/drivers/net/ethernet/ti/icssg/icssg_mii_cfg.c
index 64c3f3262b3d..92718ae40d7e 100644
--- a/drivers/net/ethernet/ti/icssg/icssg_mii_cfg.c
+++ b/drivers/net/ethernet/ti/icssg/icssg_mii_cfg.c
@@ -12,7 +12,7 @@
 #include "icssg_mii_rt.h"
 #include "icssg_prueth.h"
 
-void __maybe_unused icssg_mii_update_ipg(struct regmap *mii_rt, int mii, u32 ipg)
+void icssg_mii_update_ipg(struct regmap *mii_rt, int mii, u32 ipg)
 {
 	u32 val;
 
@@ -25,7 +25,7 @@ void __maybe_unused icssg_mii_update_ipg(struct regmap *mii_rt, int mii, u32 ipg
 	}
 }
 
-void __maybe_unused icssg_mii_update_mtu(struct regmap *mii_rt, int mii, int mtu)
+void icssg_mii_update_mtu(struct regmap *mii_rt, int mii, int mtu)
 {
 	mtu += (ETH_HLEN + ETH_FCS_LEN);
 	if (mii == ICSS_MII0) {
@@ -41,7 +41,7 @@ void __maybe_unused icssg_mii_update_mtu(struct regmap *mii_rt, int mii, int mtu
 	}
 }
 
-void __maybe_unused icssg_update_rgmii_cfg(struct regmap *miig_rt, struct prueth_emac *emac)
+void icssg_update_rgmii_cfg(struct regmap *miig_rt, struct prueth_emac *emac)
 {
 	u32 gig_en_mask, gig_val = 0, full_duplex_mask, full_duplex_val = 0;
 	int slice = prueth_emac_slice(emac);
@@ -67,7 +67,7 @@ void __maybe_unused icssg_update_rgmii_cfg(struct regmap *miig_rt, struct prueth
 			   full_duplex_val);
 }
 
-void __maybe_unused icssg_miig_set_interface_mode(struct regmap *miig_rt, int mii, phy_interface_t phy_if)
+void icssg_miig_set_interface_mode(struct regmap *miig_rt, int mii, phy_interface_t phy_if)
 {
 	u32 val, mask, shift;
 
@@ -83,7 +83,7 @@ void __maybe_unused icssg_miig_set_interface_mode(struct regmap *miig_rt, int mi
 	regmap_read(miig_rt, ICSSG_CFG_OFFSET, &val);
 }
 
-u32 __maybe_unused icssg_rgmii_cfg_get_bitfield(struct regmap *miig_rt, u32 mask, u32 shift)
+u32 icssg_rgmii_cfg_get_bitfield(struct regmap *miig_rt, u32 mask, u32 shift)
 {
 	u32 val;
 
@@ -94,7 +94,7 @@ u32 __maybe_unused icssg_rgmii_cfg_get_bitfield(struct regmap *miig_rt, u32 mask
 	return val;
 }
 
-u32 __maybe_unused icssg_rgmii_get_speed(struct regmap *miig_rt, int mii)
+u32 icssg_rgmii_get_speed(struct regmap *miig_rt, int mii)
 {
 	u32 shift = RGMII_CFG_SPEED_MII0_SHIFT, mask = RGMII_CFG_SPEED_MII0;
 
@@ -106,7 +106,7 @@ u32 __maybe_unused icssg_rgmii_get_speed(struct regmap *miig_rt, int mii)
 	return icssg_rgmii_cfg_get_bitfield(miig_rt, mask, shift);
 }
 
-u32 __maybe_unused icssg_rgmii_get_fullduplex(struct regmap *miig_rt, int mii)
+u32 icssg_rgmii_get_fullduplex(struct regmap *miig_rt, int mii)
 {
 	u32 shift = RGMII_CFG_FULLDUPLEX_MII0_SHIFT;
 	u32 mask = RGMII_CFG_FULLDUPLEX_MII0;
diff --git a/drivers/net/ethernet/ti/icssg/icssg_mii_rt.h b/drivers/net/ethernet/ti/icssg/icssg_mii_rt.h
index 412bbe0ab896..55a59bf5299c 100644
--- a/drivers/net/ethernet/ti/icssg/icssg_mii_rt.h
+++ b/drivers/net/ethernet/ti/icssg/icssg_mii_rt.h
@@ -140,12 +140,12 @@ enum mii_mode {
 struct regmap;
 struct prueth_emac;
 
-void __maybe_unused icssg_mii_update_ipg(struct regmap *mii_rt, int mii, u32 ipg);
-void __maybe_unused icssg_mii_update_mtu(struct regmap *mii_rt, int mii, int mtu);
-void __maybe_unused icssg_update_rgmii_cfg(struct regmap *miig_rt, struct prueth_emac *emac);
-u32 __maybe_unused icssg_rgmii_cfg_get_bitfield(struct regmap *miig_rt, u32 mask, u32 shift);
-u32 __maybe_unused icssg_rgmii_get_speed(struct regmap *miig_rt, int mii);
-u32 __maybe_unused icssg_rgmii_get_fullduplex(struct regmap *miig_rt, int mii);
-void __maybe_unused icssg_miig_set_interface_mode(struct regmap *miig_rt, int mii, phy_interface_t phy_if);
+void icssg_mii_update_ipg(struct regmap *mii_rt, int mii, u32 ipg);
+void icssg_mii_update_mtu(struct regmap *mii_rt, int mii, int mtu);
+void icssg_update_rgmii_cfg(struct regmap *miig_rt, struct prueth_emac *emac);
+u32 icssg_rgmii_cfg_get_bitfield(struct regmap *miig_rt, u32 mask, u32 shift);
+u32 icssg_rgmii_get_speed(struct regmap *miig_rt, int mii);
+u32 icssg_rgmii_get_fullduplex(struct regmap *miig_rt, int mii);
+void icssg_miig_set_interface_mode(struct regmap *miig_rt, int mii, phy_interface_t phy_if);
 
 #endif /* __NET_PRUSS_MII_RT_H__ */
diff --git a/drivers/net/ethernet/ti/icssg/icssg_prueth.c b/drivers/net/ethernet/ti/icssg/icssg_prueth.c
new file mode 100644
index 000000000000..49e21657d876
--- /dev/null
+++ b/drivers/net/ethernet/ti/icssg/icssg_prueth.c
@@ -0,0 +1,1813 @@
+// SPDX-License-Identifier: GPL-2.0
+
+/* Texas Instruments ICSSG Ethernet Driver
+ *
+ * Copyright (C) 2018-2022 Texas Instruments Incorporated - https://www.ti.com/
+ *
+ */
+
+#include <linux/bitops.h>
+#include <linux/clk.h>
+#include <linux/dma-mapping.h>
+#include <linux/dma/ti-cppi5.h>
+#include <linux/etherdevice.h>
+#include <linux/genalloc.h>
+#include <linux/if_vlan.h>
+#include <linux/interrupt.h>
+#include <linux/kernel.h>
+#include <linux/mfd/syscon.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_irq.h>
+#include <linux/of_mdio.h>
+#include <linux/of_net.h>
+#include <linux/of_platform.h>
+#include <linux/phy.h>
+#include <linux/remoteproc/pruss.h>
+#include <linux/regmap.h>
+#include <linux/remoteproc.h>
+
+#include "icssg_prueth.h"
+#include "icssg_mii_rt.h"
+#include "../k3-cppi-desc-pool.h"
+
+#define PRUETH_MODULE_DESCRIPTION "PRUSS ICSSG Ethernet driver"
+
+/* Netif debug messages possible */
+#define PRUETH_EMAC_DEBUG       (NETIF_MSG_DRV | \
+				 NETIF_MSG_PROBE | \
+				 NETIF_MSG_LINK | \
+				 NETIF_MSG_TIMER | \
+				 NETIF_MSG_IFDOWN | \
+				 NETIF_MSG_IFUP | \
+				 NETIF_MSG_RX_ERR | \
+				 NETIF_MSG_TX_ERR | \
+				 NETIF_MSG_TX_QUEUED | \
+				 NETIF_MSG_INTR | \
+				 NETIF_MSG_TX_DONE | \
+				 NETIF_MSG_RX_STATUS | \
+				 NETIF_MSG_PKTDATA | \
+				 NETIF_MSG_HW | \
+				 NETIF_MSG_WOL)
+
+#define prueth_napi_to_emac(napi) container_of(napi, struct prueth_emac, napi_rx)
+
+/* CTRLMMR_ICSSG_RGMII_CTRL register bits */
+#define ICSSG_CTRL_RGMII_ID_MODE                BIT(24)
+
+static void prueth_cleanup_rx_chns(struct prueth_emac *emac,
+				   struct prueth_rx_chn *rx_chn,
+				   int max_rflows)
+{
+	if (rx_chn->desc_pool)
+		k3_cppi_desc_pool_destroy(rx_chn->desc_pool);
+
+	if (rx_chn->rx_chn)
+		k3_udma_glue_release_rx_chn(rx_chn->rx_chn);
+}
+
+static void prueth_cleanup_tx_chns(struct prueth_emac *emac)
+{
+	int i;
+
+	for (i = 0; i < emac->tx_ch_num; i++) {
+		struct prueth_tx_chn *tx_chn = &emac->tx_chns[i];
+
+		if (tx_chn->desc_pool)
+			k3_cppi_desc_pool_destroy(tx_chn->desc_pool);
+
+		if (tx_chn->tx_chn)
+			k3_udma_glue_release_tx_chn(tx_chn->tx_chn);
+
+		/* Assume prueth_cleanup_tx_chns() is called at the
+		 * end after all channel resources are freed
+		 */
+		memset(tx_chn, 0, sizeof(*tx_chn));
+	}
+}
+
+static void prueth_ndev_del_tx_napi(struct prueth_emac *emac, int num)
+{
+	int i;
+
+	for (i = 0; i < num; i++) {
+		struct prueth_tx_chn *tx_chn = &emac->tx_chns[i];
+
+		if (tx_chn->irq)
+			free_irq(tx_chn->irq, tx_chn);
+		netif_napi_del(&tx_chn->napi_tx);
+	}
+}
+
+static void prueth_xmit_free(struct prueth_tx_chn *tx_chn,
+			     struct cppi5_host_desc_t *desc)
+{
+	struct cppi5_host_desc_t *first_desc, *next_desc;
+	dma_addr_t buf_dma, next_desc_dma;
+	u32 buf_dma_len;
+
+	first_desc = desc;
+	next_desc = first_desc;
+
+	cppi5_hdesc_get_obuf(first_desc, &buf_dma, &buf_dma_len);
+	k3_udma_glue_tx_cppi5_to_dma_addr(tx_chn->tx_chn, &buf_dma);
+
+	dma_unmap_single(tx_chn->dma_dev, buf_dma, buf_dma_len,
+			 DMA_TO_DEVICE);
+
+	next_desc_dma = cppi5_hdesc_get_next_hbdesc(first_desc);
+	k3_udma_glue_tx_cppi5_to_dma_addr(tx_chn->tx_chn, &next_desc_dma);
+	while (next_desc_dma) {
+		next_desc = k3_cppi_desc_pool_dma2virt(tx_chn->desc_pool,
+						       next_desc_dma);
+		cppi5_hdesc_get_obuf(next_desc, &buf_dma, &buf_dma_len);
+		k3_udma_glue_tx_cppi5_to_dma_addr(tx_chn->tx_chn, &buf_dma);
+
+		dma_unmap_page(tx_chn->dma_dev, buf_dma, buf_dma_len,
+			       DMA_TO_DEVICE);
+
+		next_desc_dma = cppi5_hdesc_get_next_hbdesc(next_desc);
+		k3_udma_glue_tx_cppi5_to_dma_addr(tx_chn->tx_chn, &next_desc_dma);
+
+		k3_cppi_desc_pool_free(tx_chn->desc_pool, next_desc);
+	}
+
+	k3_cppi_desc_pool_free(tx_chn->desc_pool, first_desc);
+}
+
+static int emac_tx_complete_packets(struct prueth_emac *emac, int chn,
+				    int budget)
+{
+	struct net_device *ndev = emac->ndev;
+	struct cppi5_host_desc_t *desc_tx;
+	struct netdev_queue *netif_txq;
+	struct prueth_tx_chn *tx_chn;
+	unsigned int total_bytes = 0;
+	struct sk_buff *skb;
+	dma_addr_t desc_dma;
+	int res, num_tx = 0;
+	void **swdata;
+
+	tx_chn = &emac->tx_chns[chn];
+
+	while (budget) {
+		res = k3_udma_glue_pop_tx_chn(tx_chn->tx_chn, &desc_dma);
+		if (res == -ENODATA)
+			break;
+
+		/* teardown completion */
+		if (cppi5_desc_is_tdcm(desc_dma)) {
+			if (atomic_dec_and_test(&emac->tdown_cnt))
+				complete(&emac->tdown_complete);
+			break;
+		}
+
+		desc_tx = k3_cppi_desc_pool_dma2virt(tx_chn->desc_pool,
+						     desc_dma);
+		swdata = cppi5_hdesc_get_swdata(desc_tx);
+
+		skb = *(swdata);
+		prueth_xmit_free(tx_chn, desc_tx);
+
+		ndev = skb->dev;
+		ndev->stats.tx_packets++;
+		ndev->stats.tx_bytes += skb->len;
+		total_bytes += skb->len;
+		napi_consume_skb(skb, budget);
+		num_tx++;
+		budget--;
+	}
+
+	if (!num_tx)
+		return 0;
+
+	netif_txq = netdev_get_tx_queue(ndev, chn);
+	netdev_tx_completed_queue(netif_txq, num_tx, total_bytes);
+
+	if (netif_tx_queue_stopped(netif_txq)) {
+		/* If the TX queue was stopped, wake it now
+		 * if we have enough room.
+		 */
+		__netif_tx_lock(netif_txq, smp_processor_id());
+		if (netif_running(ndev) &&
+		    (k3_cppi_desc_pool_avail(tx_chn->desc_pool) >=
+		     MAX_SKB_FRAGS))
+			netif_tx_wake_queue(netif_txq);
+		__netif_tx_unlock(netif_txq);
+	}
+
+	return num_tx;
+}
+
+static int emac_napi_tx_poll(struct napi_struct *napi_tx, int budget)
+{
+	struct prueth_tx_chn *tx_chn = prueth_napi_to_tx_chn(napi_tx);
+	struct prueth_emac *emac = tx_chn->emac;
+	int num_tx_packets;
+
+	num_tx_packets = emac_tx_complete_packets(emac, tx_chn->id, budget);
+
+	if (num_tx_packets < budget) {
+		napi_complete(napi_tx);
+		enable_irq(tx_chn->irq);
+	}
+
+	return num_tx_packets;
+}
+
+static irqreturn_t prueth_tx_irq(int irq, void *dev_id)
+{
+	struct prueth_tx_chn *tx_chn = dev_id;
+
+	disable_irq_nosync(irq);
+	napi_schedule(&tx_chn->napi_tx);
+
+	return IRQ_HANDLED;
+}
+
+static int prueth_ndev_add_tx_napi(struct prueth_emac *emac)
+{
+	struct prueth *prueth = emac->prueth;
+	int i, ret;
+
+	for (i = 0; i < emac->tx_ch_num; i++) {
+		struct prueth_tx_chn *tx_chn = &emac->tx_chns[i];
+
+		netif_napi_add_tx(emac->ndev, &tx_chn->napi_tx, emac_napi_tx_poll);
+		ret = request_irq(tx_chn->irq, prueth_tx_irq,
+				  IRQF_TRIGGER_HIGH, tx_chn->name,
+				  tx_chn);
+		if (ret) {
+			netif_napi_del(&tx_chn->napi_tx);
+			dev_err(prueth->dev, "unable to request TX IRQ %d\n",
+				tx_chn->irq);
+			goto fail;
+		}
+	}
+
+	return 0;
+fail:
+	prueth_ndev_del_tx_napi(emac, i);
+	return ret;
+}
+
+static int prueth_init_tx_chns(struct prueth_emac *emac)
+{
+	static const struct k3_ring_cfg ring_cfg = {
+		.elm_size = K3_RINGACC_RING_ELSIZE_8,
+		.mode = K3_RINGACC_RING_MODE_RING,
+		.flags = 0,
+		.size = PRUETH_MAX_TX_DESC,
+	};
+	struct k3_udma_glue_tx_channel_cfg tx_cfg;
+	struct device *dev = emac->prueth->dev;
+	struct net_device *ndev = emac->ndev;
+	int ret, slice, i;
+	u32 hdesc_size;
+
+	slice = prueth_emac_slice(emac);
+	if (slice < 0)
+		return slice;
+
+	init_completion(&emac->tdown_complete);
+
+	hdesc_size = cppi5_hdesc_calc_size(true, PRUETH_NAV_PS_DATA_SIZE,
+					   PRUETH_NAV_SW_DATA_SIZE);
+	memset(&tx_cfg, 0, sizeof(tx_cfg));
+	tx_cfg.swdata_size = PRUETH_NAV_SW_DATA_SIZE;
+	tx_cfg.tx_cfg = ring_cfg;
+	tx_cfg.txcq_cfg = ring_cfg;
+
+	for (i = 0; i < emac->tx_ch_num; i++) {
+		struct prueth_tx_chn *tx_chn = &emac->tx_chns[i];
+
+		/* To differentiate channels for SLICE0 vs SLICE1 */
+		snprintf(tx_chn->name, sizeof(tx_chn->name),
+			 "tx%d-%d", slice, i);
+
+		tx_chn->emac = emac;
+		tx_chn->id = i;
+		tx_chn->descs_num = PRUETH_MAX_TX_DESC;
+
+		tx_chn->tx_chn =
+			k3_udma_glue_request_tx_chn(dev, tx_chn->name,
+						    &tx_cfg);
+		if (IS_ERR(tx_chn->tx_chn)) {
+			ret = PTR_ERR(tx_chn->tx_chn);
+			tx_chn->tx_chn = NULL;
+			netdev_err(ndev,
+				   "Failed to request tx dma ch: %d\n", ret);
+			goto fail;
+		}
+
+		tx_chn->dma_dev = k3_udma_glue_tx_get_dma_device(tx_chn->tx_chn);
+		tx_chn->desc_pool =
+			k3_cppi_desc_pool_create_name(tx_chn->dma_dev,
+						      tx_chn->descs_num,
+						      hdesc_size,
+						      tx_chn->name);
+		if (IS_ERR(tx_chn->desc_pool)) {
+			ret = PTR_ERR(tx_chn->desc_pool);
+			tx_chn->desc_pool = NULL;
+			netdev_err(ndev, "Failed to create tx pool: %d\n", ret);
+			goto fail;
+		}
+
+		tx_chn->irq = k3_udma_glue_tx_get_irq(tx_chn->tx_chn);
+		if (tx_chn->irq <= 0) {
+			ret = -EINVAL;
+			netdev_err(ndev, "failed to get tx irq\n");
+			goto fail;
+		}
+
+		snprintf(tx_chn->name, sizeof(tx_chn->name), "%s-tx%d",
+			 dev_name(dev), tx_chn->id);
+	}
+
+	return 0;
+
+fail:
+	prueth_cleanup_tx_chns(emac);
+	return ret;
+}
+
+static int prueth_init_rx_chns(struct prueth_emac *emac,
+			       struct prueth_rx_chn *rx_chn,
+			       char *name, u32 max_rflows,
+			       u32 max_desc_num)
+{
+	struct k3_udma_glue_rx_channel_cfg rx_cfg;
+	struct device *dev = emac->prueth->dev;
+	struct net_device *ndev = emac->ndev;
+	u32 fdqring_id, hdesc_size;
+	int i, ret = 0, slice;
+
+	slice = prueth_emac_slice(emac);
+	if (slice < 0)
+		return slice;
+
+	/* To differentiate channels for SLICE0 vs SLICE1 */
+	snprintf(rx_chn->name, sizeof(rx_chn->name), "%s%d", name, slice);
+
+	hdesc_size = cppi5_hdesc_calc_size(true, PRUETH_NAV_PS_DATA_SIZE,
+					   PRUETH_NAV_SW_DATA_SIZE);
+	memset(&rx_cfg, 0, sizeof(rx_cfg));
+	rx_cfg.swdata_size = PRUETH_NAV_SW_DATA_SIZE;
+	rx_cfg.flow_id_num = max_rflows;
+	rx_cfg.flow_id_base = -1; /* udmax will auto select flow id base */
+
+	/* init all flows */
+	rx_chn->dev = dev;
+	rx_chn->descs_num = max_desc_num;
+
+	rx_chn->rx_chn = k3_udma_glue_request_rx_chn(dev, rx_chn->name,
+						     &rx_cfg);
+	if (IS_ERR(rx_chn->rx_chn)) {
+		ret = PTR_ERR(rx_chn->rx_chn);
+		rx_chn->rx_chn = NULL;
+		netdev_err(ndev, "Failed to request rx dma ch: %d\n", ret);
+		goto fail;
+	}
+
+	rx_chn->dma_dev = k3_udma_glue_rx_get_dma_device(rx_chn->rx_chn);
+	rx_chn->desc_pool = k3_cppi_desc_pool_create_name(rx_chn->dma_dev,
+							  rx_chn->descs_num,
+							  hdesc_size,
+							  rx_chn->name);
+	if (IS_ERR(rx_chn->desc_pool)) {
+		ret = PTR_ERR(rx_chn->desc_pool);
+		rx_chn->desc_pool = NULL;
+		netdev_err(ndev, "Failed to create rx pool: %d\n", ret);
+		goto fail;
+	}
+
+	emac->rx_flow_id_base = k3_udma_glue_rx_get_flow_id_base(rx_chn->rx_chn);
+	netdev_dbg(ndev, "flow id base = %d\n", emac->rx_flow_id_base);
+
+	fdqring_id = K3_RINGACC_RING_ID_ANY;
+	for (i = 0; i < rx_cfg.flow_id_num; i++) {
+		struct k3_ring_cfg rxring_cfg = {
+			.elm_size = K3_RINGACC_RING_ELSIZE_8,
+			.mode = K3_RINGACC_RING_MODE_RING,
+			.flags = 0,
+		};
+		struct k3_ring_cfg fdqring_cfg = {
+			.elm_size = K3_RINGACC_RING_ELSIZE_8,
+			.flags = K3_RINGACC_RING_SHARED,
+		};
+		struct k3_udma_glue_rx_flow_cfg rx_flow_cfg = {
+			.rx_cfg = rxring_cfg,
+			.rxfdq_cfg = fdqring_cfg,
+			.ring_rxq_id = K3_RINGACC_RING_ID_ANY,
+			.src_tag_lo_sel =
+				K3_UDMA_GLUE_SRC_TAG_LO_USE_REMOTE_SRC_TAG,
+		};
+
+		rx_flow_cfg.ring_rxfdq0_id = fdqring_id;
+		rx_flow_cfg.rx_cfg.size = max_desc_num;
+		rx_flow_cfg.rxfdq_cfg.size = max_desc_num;
+		rx_flow_cfg.rxfdq_cfg.mode = emac->prueth->pdata.fdqring_mode;
+
+		ret = k3_udma_glue_rx_flow_init(rx_chn->rx_chn,
+						i, &rx_flow_cfg);
+		if (ret) {
+			netdev_err(ndev, "Failed to init rx flow%d %d\n",
+				   i, ret);
+			goto fail;
+		}
+		if (!i)
+			fdqring_id = k3_udma_glue_rx_flow_get_fdq_id(rx_chn->rx_chn,
+								     i);
+		rx_chn->irq[i] = k3_udma_glue_rx_get_irq(rx_chn->rx_chn, i);
+		if (rx_chn->irq[i] <= 0) {
+			ret = rx_chn->irq[i];
+			netdev_err(ndev, "Failed to get rx dma irq");
+			goto fail;
+		}
+	}
+
+	return 0;
+
+fail:
+	prueth_cleanup_rx_chns(emac, rx_chn, max_rflows);
+	return ret;
+}
+
+static int prueth_dma_rx_push(struct prueth_emac *emac,
+			      struct sk_buff *skb,
+			      struct prueth_rx_chn *rx_chn)
+{
+	struct net_device *ndev = emac->ndev;
+	struct cppi5_host_desc_t *desc_rx;
+	u32 pkt_len = skb_tailroom(skb);
+	dma_addr_t desc_dma;
+	dma_addr_t buf_dma;
+	void **swdata;
+
+	desc_rx = k3_cppi_desc_pool_alloc(rx_chn->desc_pool);
+	if (!desc_rx) {
+		netdev_err(ndev, "rx push: failed to allocate descriptor\n");
+		return -ENOMEM;
+	}
+	desc_dma = k3_cppi_desc_pool_virt2dma(rx_chn->desc_pool, desc_rx);
+
+	buf_dma = dma_map_single(rx_chn->dma_dev, skb->data, pkt_len, DMA_FROM_DEVICE);
+	if (unlikely(dma_mapping_error(rx_chn->dma_dev, buf_dma))) {
+		k3_cppi_desc_pool_free(rx_chn->desc_pool, desc_rx);
+		netdev_err(ndev, "rx push: failed to map rx pkt buffer\n");
+		return -EINVAL;
+	}
+
+	cppi5_hdesc_init(desc_rx, CPPI5_INFO0_HDESC_EPIB_PRESENT,
+			 PRUETH_NAV_PS_DATA_SIZE);
+	k3_udma_glue_rx_dma_to_cppi5_addr(rx_chn->rx_chn, &buf_dma);
+	cppi5_hdesc_attach_buf(desc_rx, buf_dma, skb_tailroom(skb), buf_dma, skb_tailroom(skb));
+
+	swdata = cppi5_hdesc_get_swdata(desc_rx);
+	*swdata = skb;
+
+	return k3_udma_glue_push_rx_chn(rx_chn->rx_chn, 0,
+					desc_rx, desc_dma);
+}
+
+static int emac_rx_packet(struct prueth_emac *emac, u32 flow_id)
+{
+	struct prueth_rx_chn *rx_chn = &emac->rx_chns;
+	u32 buf_dma_len, pkt_len, port_id = 0;
+	struct net_device *ndev = emac->ndev;
+	struct cppi5_host_desc_t *desc_rx;
+	struct sk_buff *skb, *new_skb;
+	dma_addr_t desc_dma, buf_dma;
+	void **swdata;
+	int ret;
+
+	ret = k3_udma_glue_pop_rx_chn(rx_chn->rx_chn, flow_id, &desc_dma);
+	if (ret) {
+		if (ret != -ENODATA)
+			netdev_err(ndev, "rx pop: failed: %d\n", ret);
+		return ret;
+	}
+
+	if (cppi5_desc_is_tdcm(desc_dma)) /* Teardown ? */
+		return 0;
+
+	desc_rx = k3_cppi_desc_pool_dma2virt(rx_chn->desc_pool, desc_dma);
+
+	swdata = cppi5_hdesc_get_swdata(desc_rx);
+	skb = *swdata;
+
+	cppi5_hdesc_get_obuf(desc_rx, &buf_dma, &buf_dma_len);
+	k3_udma_glue_rx_cppi5_to_dma_addr(rx_chn->rx_chn, &buf_dma);
+	pkt_len = cppi5_hdesc_get_pktlen(desc_rx);
+	/* firmware adds 4 CRC bytes, strip them */
+	pkt_len -= 4;
+	cppi5_desc_get_tags_ids(&desc_rx->hdr, &port_id, NULL);
+
+	dma_unmap_single(rx_chn->dma_dev, buf_dma, buf_dma_len, DMA_FROM_DEVICE);
+	k3_cppi_desc_pool_free(rx_chn->desc_pool, desc_rx);
+
+	skb->dev = ndev;
+	if (!netif_running(skb->dev)) {
+		dev_kfree_skb_any(skb);
+		return 0;
+	}
+
+	new_skb = netdev_alloc_skb_ip_align(ndev, PRUETH_MAX_PKT_SIZE);
+	/* if allocation fails we drop the packet but push the
+	 * descriptor back to the ring with old skb to prevent a stall
+	 */
+	if (!new_skb) {
+		ndev->stats.rx_dropped++;
+		new_skb = skb;
+	} else {
+		/* send the filled skb up the n/w stack */
+		skb_put(skb, pkt_len);
+		skb->protocol = eth_type_trans(skb, ndev);
+		napi_gro_receive(&emac->napi_rx, skb);
+		ndev->stats.rx_bytes += pkt_len;
+		ndev->stats.rx_packets++;
+	}
+
+	/* queue another RX DMA */
+	ret = prueth_dma_rx_push(emac, new_skb, &emac->rx_chns);
+	if (WARN_ON(ret < 0)) {
+		dev_kfree_skb_any(new_skb);
+		ndev->stats.rx_errors++;
+		ndev->stats.rx_dropped++;
+	}
+
+	return ret;
+}
+
+static void prueth_rx_cleanup(void *data, dma_addr_t desc_dma)
+{
+	struct prueth_rx_chn *rx_chn = data;
+	struct cppi5_host_desc_t *desc_rx;
+	struct sk_buff *skb;
+	dma_addr_t buf_dma;
+	u32 buf_dma_len;
+	void **swdata;
+
+	desc_rx = k3_cppi_desc_pool_dma2virt(rx_chn->desc_pool, desc_dma);
+	swdata = cppi5_hdesc_get_swdata(desc_rx);
+	skb = *swdata;
+	cppi5_hdesc_get_obuf(desc_rx, &buf_dma, &buf_dma_len);
+	k3_udma_glue_rx_cppi5_to_dma_addr(rx_chn->rx_chn, &buf_dma);
+
+	dma_unmap_single(rx_chn->dma_dev, buf_dma, buf_dma_len,
+			 DMA_FROM_DEVICE);
+	k3_cppi_desc_pool_free(rx_chn->desc_pool, desc_rx);
+
+	dev_kfree_skb_any(skb);
+}
+
+/**
+ * emac_ndo_start_xmit - EMAC Transmit function
+ * @skb: SKB pointer
+ * @ndev: EMAC network adapter
+ *
+ * Called by the system to transmit a packet  - we queue the packet in
+ * EMAC hardware transmit queue
+ * Doesn't wait for completion we'll check for TX completion in
+ * emac_tx_complete_packets().
+ *
+ * Return: enum netdev_tx
+ */
+static enum netdev_tx emac_ndo_start_xmit(struct sk_buff *skb, struct net_device *ndev)
+{
+	struct cppi5_host_desc_t *first_desc, *next_desc, *cur_desc;
+	struct prueth_emac *emac = netdev_priv(ndev);
+	struct netdev_queue *netif_txq;
+	struct prueth_tx_chn *tx_chn;
+	dma_addr_t desc_dma, buf_dma;
+	int i, ret = 0, q_idx;
+	void **swdata;
+	u32 pkt_len;
+	u32 *epib;
+
+	pkt_len = skb_headlen(skb);
+	q_idx = skb_get_queue_mapping(skb);
+
+	tx_chn = &emac->tx_chns[q_idx];
+	netif_txq = netdev_get_tx_queue(ndev, q_idx);
+
+	/* Map the linear buffer */
+	buf_dma = dma_map_single(tx_chn->dma_dev, skb->data, pkt_len, DMA_TO_DEVICE);
+	if (dma_mapping_error(tx_chn->dma_dev, buf_dma)) {
+		netdev_err(ndev, "tx: failed to map skb buffer\n");
+		ret = NETDEV_TX_OK;
+		goto drop_stop_q;
+	}
+
+	first_desc = k3_cppi_desc_pool_alloc(tx_chn->desc_pool);
+	if (!first_desc) {
+		netdev_dbg(ndev, "tx: failed to allocate descriptor\n");
+		dma_unmap_single(tx_chn->dma_dev, buf_dma, pkt_len, DMA_TO_DEVICE);
+		ret = NETDEV_TX_BUSY;
+		goto drop_stop_q_busy;
+	}
+
+	cppi5_hdesc_init(first_desc, CPPI5_INFO0_HDESC_EPIB_PRESENT,
+			 PRUETH_NAV_PS_DATA_SIZE);
+	cppi5_hdesc_set_pkttype(first_desc, 0);
+	epib = first_desc->epib;
+	epib[0] = 0;
+	epib[1] = 0;
+
+	/* set dst tag to indicate internal qid at the firmware which is at
+	 * bit8..bit15. bit0..bit7 indicates port num for directed
+	 * packets in case of switch mode operation
+	 */
+	cppi5_desc_set_tags_ids(&first_desc->hdr, 0, (emac->port_id | (q_idx << 8)));
+	k3_udma_glue_tx_dma_to_cppi5_addr(tx_chn->tx_chn, &buf_dma);
+	cppi5_hdesc_attach_buf(first_desc, buf_dma, pkt_len, buf_dma, pkt_len);
+	swdata = cppi5_hdesc_get_swdata(first_desc);
+	*swdata = skb;
+
+	/* Handle the case where skb is fragmented in pages */
+	cur_desc = first_desc;
+	for (i = 0; i < skb_shinfo(skb)->nr_frags; i++) {
+		skb_frag_t *frag = &skb_shinfo(skb)->frags[i];
+		u32 frag_size = skb_frag_size(frag);
+
+		next_desc = k3_cppi_desc_pool_alloc(tx_chn->desc_pool);
+		if (!next_desc) {
+			netdev_err(ndev,
+				   "tx: failed to allocate frag. descriptor\n");
+			ret = NETDEV_TX_OK;
+			goto drop_free_descs;
+		}
+
+		buf_dma = skb_frag_dma_map(tx_chn->dma_dev, frag, 0, frag_size,
+					   DMA_TO_DEVICE);
+		if (dma_mapping_error(tx_chn->dma_dev, buf_dma)) {
+			netdev_err(ndev, "tx: Failed to map skb page\n");
+			k3_cppi_desc_pool_free(tx_chn->desc_pool, next_desc);
+			ret = NETDEV_TX_OK;
+			goto drop_free_descs;
+		}
+
+		cppi5_hdesc_reset_hbdesc(next_desc);
+		k3_udma_glue_tx_dma_to_cppi5_addr(tx_chn->tx_chn, &buf_dma);
+		cppi5_hdesc_attach_buf(next_desc,
+				       buf_dma, frag_size, buf_dma, frag_size);
+
+		desc_dma = k3_cppi_desc_pool_virt2dma(tx_chn->desc_pool,
+						      next_desc);
+		k3_udma_glue_tx_dma_to_cppi5_addr(tx_chn->tx_chn, &desc_dma);
+		cppi5_hdesc_link_hbdesc(cur_desc, desc_dma);
+
+		pkt_len += frag_size;
+		cur_desc = next_desc;
+	}
+	WARN_ON_ONCE(pkt_len != skb->len);
+
+	/* report bql before sending packet */
+	netdev_tx_sent_queue(netif_txq, pkt_len);
+
+	cppi5_hdesc_set_pktlen(first_desc, pkt_len);
+	desc_dma = k3_cppi_desc_pool_virt2dma(tx_chn->desc_pool, first_desc);
+	/* cppi5_desc_dump(first_desc, 64); */
+
+	skb_tx_timestamp(skb);  /* SW timestamp if SKBTX_IN_PROGRESS not set */
+	ret = k3_udma_glue_push_tx_chn(tx_chn->tx_chn, first_desc, desc_dma);
+	if (ret) {
+		netdev_err(ndev, "tx: push failed: %d\n", ret);
+		goto drop_free_descs;
+	}
+
+	if (k3_cppi_desc_pool_avail(tx_chn->desc_pool) < MAX_SKB_FRAGS) {
+		netif_tx_stop_queue(netif_txq);
+		/* Barrier, so that stop_queue visible to other cpus */
+		smp_mb__after_atomic();
+
+		if (k3_cppi_desc_pool_avail(tx_chn->desc_pool) >=
+		    MAX_SKB_FRAGS)
+			netif_tx_wake_queue(netif_txq);
+	}
+
+	return NETDEV_TX_OK;
+
+drop_free_descs:
+	prueth_xmit_free(tx_chn, first_desc);
+drop_stop_q:
+	netif_tx_stop_queue(netif_txq);
+	dev_kfree_skb_any(skb);
+
+	/* error */
+	ndev->stats.tx_dropped++;
+	netdev_err(ndev, "tx: error: %d\n", ret);
+
+	return ret;
+
+drop_stop_q_busy:
+	netif_tx_stop_queue(netif_txq);
+	return NETDEV_TX_BUSY;
+}
+
+static void prueth_tx_cleanup(void *data, dma_addr_t desc_dma)
+{
+	struct prueth_tx_chn *tx_chn = data;
+	struct cppi5_host_desc_t *desc_tx;
+	struct sk_buff *skb;
+	void **swdata;
+
+	desc_tx = k3_cppi_desc_pool_dma2virt(tx_chn->desc_pool, desc_dma);
+	swdata = cppi5_hdesc_get_swdata(desc_tx);
+	skb = *(swdata);
+	prueth_xmit_free(tx_chn, desc_tx);
+
+	dev_kfree_skb_any(skb);
+}
+
+static irqreturn_t prueth_rx_irq(int irq, void *dev_id)
+{
+	struct prueth_emac *emac = dev_id;
+
+	disable_irq_nosync(irq);
+	napi_schedule(&emac->napi_rx);
+
+	return IRQ_HANDLED;
+}
+
+struct icssg_firmwares {
+	char *pru;
+	char *rtu;
+	char *txpru;
+};
+
+static struct icssg_firmwares icssg_emac_firmwares[] = {
+	{
+		.pru = "ti-pruss/am65x-sr2-pru0-prueth-fw.elf",
+		.rtu = "ti-pruss/am65x-sr2-rtu0-prueth-fw.elf",
+		.txpru = "ti-pruss/am65x-sr2-txpru0-prueth-fw.elf",
+	},
+	{
+		.pru = "ti-pruss/am65x-sr2-pru1-prueth-fw.elf",
+		.rtu = "ti-pruss/am65x-sr2-rtu1-prueth-fw.elf",
+		.txpru = "ti-pruss/am65x-sr2-txpru1-prueth-fw.elf",
+	}
+};
+
+static int prueth_emac_start(struct prueth *prueth, struct prueth_emac *emac)
+{
+	struct icssg_firmwares *firmwares;
+	struct device *dev = prueth->dev;
+	int slice, ret;
+
+	firmwares = icssg_emac_firmwares;
+
+	slice = prueth_emac_slice(emac);
+	if (slice < 0) {
+		netdev_err(emac->ndev, "invalid port\n");
+		return -EINVAL;
+	}
+
+	ret = icssg_config(prueth, emac, slice);
+	if (ret)
+		return ret;
+
+	ret = rproc_set_firmware(prueth->pru[slice], firmwares[slice].pru);
+	ret = rproc_boot(prueth->pru[slice]);
+	if (ret) {
+		dev_err(dev, "failed to boot PRU%d: %d\n", slice, ret);
+		return -EINVAL;
+	}
+
+	ret = rproc_set_firmware(prueth->rtu[slice], firmwares[slice].rtu);
+	ret = rproc_boot(prueth->rtu[slice]);
+	if (ret) {
+		dev_err(dev, "failed to boot RTU%d: %d\n", slice, ret);
+		goto halt_pru;
+	}
+
+	ret = rproc_set_firmware(prueth->txpru[slice], firmwares[slice].txpru);
+	ret = rproc_boot(prueth->txpru[slice]);
+	if (ret) {
+		dev_err(dev, "failed to boot TX_PRU%d: %d\n", slice, ret);
+		goto halt_rtu;
+	}
+
+	emac->fw_running = 1;
+	return 0;
+
+halt_rtu:
+	rproc_shutdown(prueth->rtu[slice]);
+
+halt_pru:
+	rproc_shutdown(prueth->pru[slice]);
+
+	return ret;
+}
+
+static void prueth_emac_stop(struct prueth_emac *emac)
+{
+	struct prueth *prueth = emac->prueth;
+	int slice;
+
+	switch (emac->port_id) {
+	case PRUETH_PORT_MII0:
+		slice = ICSS_SLICE0;
+		break;
+	case PRUETH_PORT_MII1:
+		slice = ICSS_SLICE1;
+		break;
+	default:
+		netdev_err(emac->ndev, "invalid port\n");
+		return;
+	}
+
+	emac->fw_running = 0;
+	rproc_shutdown(prueth->txpru[slice]);
+	rproc_shutdown(prueth->rtu[slice]);
+	rproc_shutdown(prueth->pru[slice]);
+}
+
+/* called back by PHY layer if there is change in link state of hw port*/
+static void emac_adjust_link(struct net_device *ndev)
+{
+	struct prueth_emac *emac = netdev_priv(ndev);
+	struct phy_device *phydev = ndev->phydev;
+	struct prueth *prueth = emac->prueth;
+	bool new_state = false;
+	unsigned long flags;
+
+	if (phydev->link) {
+		/* check the mode of operation - full/half duplex */
+		if (phydev->duplex != emac->duplex) {
+			new_state = true;
+			emac->duplex = phydev->duplex;
+		}
+		if (phydev->speed != emac->speed) {
+			new_state = true;
+			emac->speed = phydev->speed;
+		}
+		if (!emac->link) {
+			new_state = true;
+			emac->link = 1;
+		}
+	} else if (emac->link) {
+		new_state = true;
+		emac->link = 0;
+
+		/* f/w should support 100 & 1000 */
+		emac->speed = SPEED_1000;
+
+		/* half duplex may not be supported by f/w */
+		emac->duplex = DUPLEX_FULL;
+	}
+
+	if (new_state) {
+		phy_print_status(phydev);
+
+		/* update RGMII and MII configuration based on PHY negotiated
+		 * values
+		 */
+		if (emac->link) {
+			/* Set the RGMII cfg for gig en and full duplex */
+			icssg_update_rgmii_cfg(prueth->miig_rt, emac);
+
+			/* update the Tx IPG based on 100M/1G speed */
+			spin_lock_irqsave(&emac->lock, flags);
+			icssg_config_ipg(emac);
+			spin_unlock_irqrestore(&emac->lock, flags);
+			icssg_config_set_speed(emac);
+			emac_set_port_state(emac, ICSSG_EMAC_PORT_FORWARD);
+
+		} else {
+			emac_set_port_state(emac, ICSSG_EMAC_PORT_DISABLE);
+		}
+	}
+
+	if (emac->link) {
+		/* reactivate the transmit queue */
+		netif_tx_wake_all_queues(ndev);
+	} else {
+		netif_tx_stop_all_queues(ndev);
+	}
+}
+
+static int emac_napi_rx_poll(struct napi_struct *napi_rx, int budget)
+{
+	struct prueth_emac *emac = prueth_napi_to_emac(napi_rx);
+	int rx_flow = PRUETH_RX_FLOW_DATA;
+	int flow = PRUETH_MAX_RX_FLOWS;
+	int num_rx = 0;
+	int cur_budget;
+	int ret;
+
+	while (flow--) {
+		cur_budget = budget - num_rx;
+
+		while (cur_budget--) {
+			ret = emac_rx_packet(emac, flow);
+			if (ret)
+				break;
+			num_rx++;
+		}
+
+		if (num_rx >= budget)
+			break;
+	}
+
+	if (num_rx < budget && napi_complete_done(napi_rx, num_rx))
+		enable_irq(emac->rx_chns.irq[rx_flow]);
+
+	return num_rx;
+}
+
+static int prueth_prepare_rx_chan(struct prueth_emac *emac,
+				  struct prueth_rx_chn *chn,
+				  int buf_size)
+{
+	struct sk_buff *skb;
+	int i, ret;
+
+	for (i = 0; i < chn->descs_num; i++) {
+		skb = __netdev_alloc_skb_ip_align(NULL, buf_size, GFP_KERNEL);
+		if (!skb)
+			return -ENOMEM;
+
+		ret = prueth_dma_rx_push(emac, skb, chn);
+		if (ret < 0) {
+			netdev_err(emac->ndev,
+				   "cannot submit skb for rx chan %s ret %d\n",
+				   chn->name, ret);
+			kfree_skb(skb);
+			return ret;
+		}
+	}
+
+	return 0;
+}
+
+static void prueth_reset_tx_chan(struct prueth_emac *emac, int ch_num,
+				 bool free_skb)
+{
+	int i;
+
+	for (i = 0; i < ch_num; i++) {
+		if (free_skb)
+			k3_udma_glue_reset_tx_chn(emac->tx_chns[i].tx_chn,
+						  &emac->tx_chns[i],
+						  prueth_tx_cleanup);
+		k3_udma_glue_disable_tx_chn(emac->tx_chns[i].tx_chn);
+	}
+}
+
+static void prueth_reset_rx_chan(struct prueth_rx_chn *chn,
+				 int num_flows, bool disable)
+{
+	int i;
+
+	for (i = 0; i < num_flows; i++)
+		k3_udma_glue_reset_rx_chn(chn->rx_chn, i, chn,
+					  prueth_rx_cleanup, !!i);
+	if (disable)
+		k3_udma_glue_disable_rx_chn(chn->rx_chn);
+}
+
+static int emac_phy_connect(struct prueth_emac *emac)
+{
+	struct prueth *prueth = emac->prueth;
+	struct net_device *ndev = emac->ndev;
+	/* connect PHY */
+	ndev->phydev = of_phy_connect(emac->ndev, emac->phy_node,
+				      &emac_adjust_link, 0,
+				      emac->phy_if);
+	if (!ndev->phydev) {
+		dev_err(prueth->dev, "couldn't connect to phy %s\n",
+			emac->phy_node->full_name);
+		return -ENODEV;
+	}
+
+	/* remove unsupported modes */
+	phy_remove_link_mode(ndev->phydev, ETHTOOL_LINK_MODE_10baseT_Half_BIT);
+	phy_remove_link_mode(ndev->phydev, ETHTOOL_LINK_MODE_10baseT_Full_BIT);
+	phy_remove_link_mode(ndev->phydev, ETHTOOL_LINK_MODE_100baseT_Half_BIT);
+	phy_remove_link_mode(ndev->phydev, ETHTOOL_LINK_MODE_1000baseT_Half_BIT);
+	phy_remove_link_mode(ndev->phydev, ETHTOOL_LINK_MODE_Pause_BIT);
+	phy_remove_link_mode(ndev->phydev, ETHTOOL_LINK_MODE_Asym_Pause_BIT);
+
+	if (emac->phy_if == PHY_INTERFACE_MODE_MII)
+		phy_set_max_speed(ndev->phydev, SPEED_100);
+
+	return 0;
+}
+
+/**
+ * emac_ndo_open - EMAC device open
+ * @ndev: network adapter device
+ *
+ * Called when system wants to start the interface.
+ *
+ * Return: 0 for a successful open, or appropriate error code
+ */
+static int emac_ndo_open(struct net_device *ndev)
+{
+	struct prueth_emac *emac = netdev_priv(ndev);
+	int ret, i, num_data_chn = emac->tx_ch_num;
+	struct prueth *prueth = emac->prueth;
+	int slice = prueth_emac_slice(emac);
+	struct device *dev = prueth->dev;
+	int max_rx_flows;
+	int rx_flow;
+
+	/* clear SMEM and MSMC settings for all slices */
+	if (!prueth->emacs_initialized) {
+		memset_io(prueth->msmcram.va, 0, prueth->msmcram.size);
+		memset_io(prueth->shram.va, 0, ICSSG_CONFIG_OFFSET_SLICE1 * PRUETH_NUM_MACS);
+	}
+
+	/* set h/w MAC as user might have re-configured */
+	ether_addr_copy(emac->mac_addr, ndev->dev_addr);
+
+	icssg_class_set_mac_addr(prueth->miig_rt, slice, emac->mac_addr);
+	icssg_ft1_set_mac_addr(prueth->miig_rt, slice, emac->mac_addr);
+
+	icssg_class_default(prueth->miig_rt, slice, 0);
+
+	/* Notify the stack of the actual queue counts. */
+	ret = netif_set_real_num_tx_queues(ndev, num_data_chn);
+	if (ret) {
+		dev_err(dev, "cannot set real number of tx queues\n");
+		return ret;
+	}
+
+	init_completion(&emac->cmd_complete);
+	ret = prueth_init_tx_chns(emac);
+	if (ret) {
+		dev_err(dev, "failed to init tx channel: %d\n", ret);
+		return ret;
+	}
+
+	max_rx_flows = PRUETH_MAX_RX_FLOWS;
+	ret = prueth_init_rx_chns(emac, &emac->rx_chns, "rx",
+				  max_rx_flows, PRUETH_MAX_RX_DESC);
+	if (ret) {
+		dev_err(dev, "failed to init rx channel: %d\n", ret);
+		goto cleanup_tx;
+	}
+
+	ret = prueth_ndev_add_tx_napi(emac);
+	if (ret)
+		goto cleanup_rx;
+
+	/* we use only the highest priority flow for now i.e. @irq[3] */
+	rx_flow = PRUETH_RX_FLOW_DATA;
+	ret = request_irq(emac->rx_chns.irq[rx_flow], prueth_rx_irq,
+			  IRQF_TRIGGER_HIGH, dev_name(dev), emac);
+	if (ret) {
+		dev_err(dev, "unable to request RX IRQ\n");
+		goto cleanup_napi;
+	}
+
+	/* reset and start PRU firmware */
+	ret = prueth_emac_start(prueth, emac);
+	if (ret)
+		goto free_rx_irq;
+
+	icssg_mii_update_mtu(prueth->mii_rt, slice, ndev->max_mtu);
+
+	/* Prepare RX */
+	ret = prueth_prepare_rx_chan(emac, &emac->rx_chns, PRUETH_MAX_PKT_SIZE);
+	if (ret)
+		goto stop;
+
+	ret = k3_udma_glue_enable_rx_chn(emac->rx_chns.rx_chn);
+	if (ret)
+		goto reset_rx_chn;
+
+	for (i = 0; i < emac->tx_ch_num; i++) {
+		ret = k3_udma_glue_enable_tx_chn(emac->tx_chns[i].tx_chn);
+		if (ret)
+			goto reset_tx_chan;
+	}
+
+	/* Enable NAPI in Tx and Rx direction */
+	for (i = 0; i < emac->tx_ch_num; i++)
+		napi_enable(&emac->tx_chns[i].napi_tx);
+	napi_enable(&emac->napi_rx);
+
+	/* start PHY */
+	phy_start(ndev->phydev);
+
+	prueth->emacs_initialized++;
+
+	return 0;
+
+reset_tx_chan:
+	/* Since interface is not yet up, there is wouldn't be
+	 * any SKB for completion. So set false to free_skb
+	 */
+	prueth_reset_tx_chan(emac, i, false);
+reset_rx_chn:
+	prueth_reset_rx_chan(&emac->rx_chns, max_rx_flows, false);
+stop:
+	prueth_emac_stop(emac);
+free_rx_irq:
+	free_irq(emac->rx_chns.irq[rx_flow], emac);
+cleanup_napi:
+	prueth_ndev_del_tx_napi(emac, emac->tx_ch_num);
+cleanup_rx:
+	prueth_cleanup_rx_chns(emac, &emac->rx_chns, max_rx_flows);
+cleanup_tx:
+	prueth_cleanup_tx_chns(emac);
+
+	return ret;
+}
+
+/**
+ * emac_ndo_stop - EMAC device stop
+ * @ndev: network adapter device
+ *
+ * Called when system wants to stop or down the interface.
+ *
+ * Return: Always 0 (Success)
+ */
+static int emac_ndo_stop(struct net_device *ndev)
+{
+	struct prueth_emac *emac = netdev_priv(ndev);
+	struct prueth *prueth = emac->prueth;
+	int rx_flow = PRUETH_RX_FLOW_DATA;
+	int max_rx_flows;
+	int ret, i;
+
+	/* inform the upper layers. */
+	netif_tx_stop_all_queues(ndev);
+
+	/* block packets from wire */
+	if (ndev->phydev)
+		phy_stop(ndev->phydev);
+
+	icssg_class_disable(prueth->miig_rt, prueth_emac_slice(emac));
+
+	atomic_set(&emac->tdown_cnt, emac->tx_ch_num);
+	/* ensure new tdown_cnt value is visible */
+	smp_mb__after_atomic();
+	/* tear down and disable UDMA channels */
+	reinit_completion(&emac->tdown_complete);
+	for (i = 0; i < emac->tx_ch_num; i++)
+		k3_udma_glue_tdown_tx_chn(emac->tx_chns[i].tx_chn, false);
+
+	ret = wait_for_completion_timeout(&emac->tdown_complete,
+					  msecs_to_jiffies(1000));
+	if (!ret)
+		netdev_err(ndev, "tx teardown timeout\n");
+
+	prueth_reset_tx_chan(emac, emac->tx_ch_num, true);
+	for (i = 0; i < emac->tx_ch_num; i++)
+		napi_disable(&emac->tx_chns[i].napi_tx);
+
+	max_rx_flows = PRUETH_MAX_RX_FLOWS;
+	k3_udma_glue_tdown_rx_chn(emac->rx_chns.rx_chn, true);
+
+	prueth_reset_rx_chan(&emac->rx_chns, max_rx_flows, true);
+
+	napi_disable(&emac->napi_rx);
+
+	cancel_work_sync(&emac->rx_mode_work);
+
+	/* stop PRUs */
+	prueth_emac_stop(emac);
+
+	free_irq(emac->rx_chns.irq[rx_flow], emac);
+	prueth_ndev_del_tx_napi(emac, emac->tx_ch_num);
+	prueth_cleanup_tx_chns(emac);
+
+	prueth_cleanup_rx_chns(emac, &emac->rx_chns, max_rx_flows);
+	prueth_cleanup_tx_chns(emac);
+
+	prueth->emacs_initialized--;
+
+	return 0;
+}
+
+static void emac_ndo_tx_timeout(struct net_device *ndev, unsigned int txqueue)
+{
+	ndev->stats.tx_errors++;
+}
+
+static void emac_ndo_set_rx_mode_work(struct work_struct *work)
+{
+	struct prueth_emac *emac = container_of(work, struct prueth_emac, rx_mode_work);
+	struct net_device *ndev = emac->ndev;
+	bool promisc, allmulti;
+
+	if (!netif_running(ndev))
+		return;
+
+	promisc = ndev->flags & IFF_PROMISC;
+	allmulti = ndev->flags & IFF_ALLMULTI;
+	emac_set_port_state(emac, ICSSG_EMAC_PORT_UC_FLOODING_DISABLE);
+	emac_set_port_state(emac, ICSSG_EMAC_PORT_MC_FLOODING_DISABLE);
+
+	if (promisc) {
+		emac_set_port_state(emac, ICSSG_EMAC_PORT_UC_FLOODING_ENABLE);
+		emac_set_port_state(emac, ICSSG_EMAC_PORT_MC_FLOODING_ENABLE);
+		return;
+	}
+
+	if (allmulti) {
+		emac_set_port_state(emac, ICSSG_EMAC_PORT_MC_FLOODING_ENABLE);
+		return;
+	}
+
+	if (!netdev_mc_empty(ndev)) {
+		emac_set_port_state(emac, ICSSG_EMAC_PORT_MC_FLOODING_ENABLE);
+		return;
+	}
+}
+
+/**
+ * emac_ndo_set_rx_mode - EMAC set receive mode function
+ * @ndev: The EMAC network adapter
+ *
+ * Called when system wants to set the receive mode of the device.
+ *
+ */
+static void emac_ndo_set_rx_mode(struct net_device *ndev)
+{
+	struct prueth_emac *emac = netdev_priv(ndev);
+
+	queue_work(emac->cmd_wq, &emac->rx_mode_work);
+}
+
+static int emac_ndo_ioctl(struct net_device *ndev, struct ifreq *ifr, int cmd)
+{
+	return phy_do_ioctl(ndev, ifr, cmd);
+}
+
+static const struct net_device_ops emac_netdev_ops = {
+	.ndo_open = emac_ndo_open,
+	.ndo_stop = emac_ndo_stop,
+	.ndo_start_xmit = emac_ndo_start_xmit,
+	.ndo_set_mac_address = eth_mac_addr,
+	.ndo_validate_addr = eth_validate_addr,
+	.ndo_tx_timeout = emac_ndo_tx_timeout,
+	.ndo_set_rx_mode = emac_ndo_set_rx_mode,
+	.ndo_eth_ioctl = emac_ndo_ioctl,
+};
+
+/* get emac_port corresponding to eth_node name */
+static int prueth_node_port(struct device_node *eth_node)
+{
+	u32 port_id;
+	int ret;
+
+	ret = of_property_read_u32(eth_node, "reg", &port_id);
+	if (ret)
+		return ret;
+
+	if (port_id == 0)
+		return PRUETH_PORT_MII0;
+	else if (port_id == 1)
+		return PRUETH_PORT_MII1;
+	else
+		return PRUETH_PORT_INVALID;
+}
+
+/* get MAC instance corresponding to eth_node name */
+static int prueth_node_mac(struct device_node *eth_node)
+{
+	u32 port_id;
+	int ret;
+
+	ret = of_property_read_u32(eth_node, "reg", &port_id);
+	if (ret)
+		return ret;
+
+	if (port_id == 0)
+		return PRUETH_MAC0;
+	else if (port_id == 1)
+		return PRUETH_MAC1;
+	else
+		return PRUETH_MAC_INVALID;
+}
+
+static int prueth_netdev_init(struct prueth *prueth,
+			      struct device_node *eth_node)
+{
+	int ret, num_tx_chn = PRUETH_MAX_TX_QUEUES;
+	struct prueth_emac *emac;
+	struct net_device *ndev;
+	enum prueth_port port;
+	enum prueth_mac mac;
+
+	port = prueth_node_port(eth_node);
+	if (port == PRUETH_PORT_INVALID)
+		return -EINVAL;
+
+	mac = prueth_node_mac(eth_node);
+	if (mac == PRUETH_MAC_INVALID)
+		return -EINVAL;
+
+	ndev = alloc_etherdev_mq(sizeof(*emac), num_tx_chn);
+	if (!ndev)
+		return -ENOMEM;
+
+	emac = netdev_priv(ndev);
+	emac->prueth = prueth;
+	emac->ndev = ndev;
+	emac->port_id = port;
+	emac->cmd_wq = create_singlethread_workqueue("icssg_cmd_wq");
+	if (!emac->cmd_wq) {
+		ret = -ENOMEM;
+		goto free_ndev;
+	}
+	INIT_WORK(&emac->rx_mode_work, emac_ndo_set_rx_mode_work);
+
+	ret = pruss_request_mem_region(prueth->pruss,
+				       port == PRUETH_PORT_MII0 ?
+				       PRUSS_MEM_DRAM0 : PRUSS_MEM_DRAM1,
+				       &emac->dram);
+	if (ret) {
+		dev_err(prueth->dev, "unable to get DRAM: %d\n", ret);
+		ret = -ENOMEM;
+		goto free_wq;
+	}
+
+	emac->tx_ch_num = 1;
+
+	SET_NETDEV_DEV(ndev, prueth->dev);
+	spin_lock_init(&emac->lock);
+	mutex_init(&emac->cmd_lock);
+
+	emac->phy_node = of_parse_phandle(eth_node, "phy-handle", 0);
+	if (!emac->phy_node && !of_phy_is_fixed_link(eth_node)) {
+		dev_err(prueth->dev, "couldn't find phy-handle\n");
+		ret = -ENODEV;
+		goto free;
+	} else if (of_phy_is_fixed_link(eth_node)) {
+		ret = of_phy_register_fixed_link(eth_node);
+		if (ret) {
+			ret = dev_err_probe(prueth->dev, ret,
+					    "failed to register fixed-link phy\n");
+			goto free;
+		}
+
+		emac->phy_node = eth_node;
+	}
+
+	ret = of_get_phy_mode(eth_node, &emac->phy_if);
+	if (ret) {
+		dev_err(prueth->dev, "could not get phy-mode property\n");
+		goto free;
+	}
+
+	if (emac->phy_if != PHY_INTERFACE_MODE_MII &&
+	    !phy_interface_mode_is_rgmii(emac->phy_if)) {
+		dev_err(prueth->dev, "PHY mode unsupported %s\n", phy_modes(emac->phy_if));
+		ret = -EINVAL;
+		goto free;
+	}
+
+	/* AM65 SR2.0 has TX Internal delay always enabled by hardware
+	 * and it is not possible to disable TX Internal delay. The below
+	 * switch case block describes how we handle different phy modes
+	 * based on hardware restriction.
+	 */
+	switch (emac->phy_if) {
+	case PHY_INTERFACE_MODE_RGMII_ID:
+		emac->phy_if = PHY_INTERFACE_MODE_RGMII_RXID;
+		break;
+	case PHY_INTERFACE_MODE_RGMII_TXID:
+		emac->phy_if = PHY_INTERFACE_MODE_RGMII;
+		break;
+	case PHY_INTERFACE_MODE_RGMII:
+	case PHY_INTERFACE_MODE_RGMII_RXID:
+		dev_err(prueth->dev, "RGMII mode without TX delay is not supported");
+		ret = -EINVAL;
+		goto free;
+	default:
+		break;
+	}
+
+	/* get mac address from DT and set private and netdev addr */
+	ret = of_get_ethdev_address(eth_node, ndev);
+	if (!is_valid_ether_addr(ndev->dev_addr)) {
+		eth_hw_addr_random(ndev);
+		dev_warn(prueth->dev, "port %d: using random MAC addr: %pM\n",
+			 port, ndev->dev_addr);
+	}
+	ether_addr_copy(emac->mac_addr, ndev->dev_addr);
+
+	ndev->min_mtu = PRUETH_MIN_PKT_SIZE;
+	ndev->max_mtu = PRUETH_MAX_MTU;
+	ndev->netdev_ops = &emac_netdev_ops;
+	ndev->hw_features = NETIF_F_SG;
+	ndev->features = ndev->hw_features;
+
+	netif_napi_add(ndev, &emac->napi_rx, emac_napi_rx_poll);
+	prueth->emac[mac] = emac;
+
+	return 0;
+
+free:
+	pruss_release_mem_region(prueth->pruss, &emac->dram);
+free_wq:
+	destroy_workqueue(emac->cmd_wq);
+free_ndev:
+	emac->ndev = NULL;
+	prueth->emac[mac] = NULL;
+	free_netdev(ndev);
+
+	return ret;
+}
+
+static void prueth_netdev_exit(struct prueth *prueth,
+			       struct device_node *eth_node)
+{
+	struct prueth_emac *emac;
+	enum prueth_mac mac;
+
+	mac = prueth_node_mac(eth_node);
+	if (mac == PRUETH_MAC_INVALID)
+		return;
+
+	emac = prueth->emac[mac];
+	if (!emac)
+		return;
+
+	if (of_phy_is_fixed_link(emac->phy_node))
+		of_phy_deregister_fixed_link(emac->phy_node);
+
+	netif_napi_del(&emac->napi_rx);
+
+	pruss_release_mem_region(prueth->pruss, &emac->dram);
+	destroy_workqueue(emac->cmd_wq);
+	free_netdev(emac->ndev);
+	prueth->emac[mac] = NULL;
+}
+
+static int prueth_get_cores(struct prueth *prueth, int slice)
+{
+	struct device *dev = prueth->dev;
+	enum pruss_pru_id pruss_id;
+	struct device_node *np;
+	int idx = -1, ret;
+
+	np = dev->of_node;
+
+	switch (slice) {
+	case ICSS_SLICE0:
+		idx = 0;
+		break;
+	case ICSS_SLICE1:
+		idx = 3;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	prueth->pru[slice] = pru_rproc_get(np, idx, &pruss_id);
+	if (IS_ERR(prueth->pru[slice])) {
+		ret = PTR_ERR(prueth->pru[slice]);
+		prueth->pru[slice] = NULL;
+		return dev_err_probe(dev, ret, "unable to get PRU%d\n", slice);
+	}
+	prueth->pru_id[slice] = pruss_id;
+
+	idx++;
+	prueth->rtu[slice] = pru_rproc_get(np, idx, NULL);
+	if (IS_ERR(prueth->rtu[slice])) {
+		ret = PTR_ERR(prueth->rtu[slice]);
+		prueth->rtu[slice] = NULL;
+		return dev_err_probe(dev, ret, "unable to get RTU%d\n", slice);
+	}
+
+	idx++;
+	prueth->txpru[slice] = pru_rproc_get(np, idx, NULL);
+	if (IS_ERR(prueth->txpru[slice])) {
+		ret = PTR_ERR(prueth->txpru[slice]);
+		prueth->txpru[slice] = NULL;
+		return dev_err_probe(dev, ret, "unable to get TX_PRU%d\n", slice);
+	}
+
+	return 0;
+}
+
+static void prueth_put_cores(struct prueth *prueth, int slice)
+{
+	if (prueth->txpru[slice])
+		pru_rproc_put(prueth->txpru[slice]);
+
+	if (prueth->rtu[slice])
+		pru_rproc_put(prueth->rtu[slice]);
+
+	if (prueth->pru[slice])
+		pru_rproc_put(prueth->pru[slice]);
+}
+
+static const struct of_device_id prueth_dt_match[];
+
+static int prueth_probe(struct platform_device *pdev)
+{
+	struct device_node *eth_node, *eth_ports_node;
+	struct device_node  *eth0_node = NULL;
+	struct device_node  *eth1_node = NULL;
+	struct genpool_data_align gp_data = {
+		.align = SZ_64K,
+	};
+	const struct of_device_id *match;
+	struct device *dev = &pdev->dev;
+	struct device_node *np;
+	struct prueth *prueth;
+	struct pruss *pruss;
+	u32 msmc_ram_size;
+	int i, ret;
+
+	np = dev->of_node;
+
+	match = of_match_device(prueth_dt_match, dev);
+	if (!match)
+		return -ENODEV;
+
+	prueth = devm_kzalloc(dev, sizeof(*prueth), GFP_KERNEL);
+	if (!prueth)
+		return -ENOMEM;
+
+	dev_set_drvdata(dev, prueth);
+	prueth->pdev = pdev;
+	prueth->pdata = *(const struct prueth_pdata *)match->data;
+
+	prueth->dev = dev;
+	eth_ports_node = of_get_child_by_name(np, "ethernet-ports");
+	if (!eth_ports_node)
+		return -ENOENT;
+
+	for_each_child_of_node(eth_ports_node, eth_node) {
+		u32 reg;
+
+		if (strcmp(eth_node->name, "port"))
+			continue;
+		ret = of_property_read_u32(eth_node, "reg", &reg);
+		if (ret < 0) {
+			dev_err(dev, "%pOF error reading port_id %d\n",
+				eth_node, ret);
+		}
+
+		of_node_get(eth_node);
+
+		if (reg == 0) {
+			eth0_node = eth_node;
+			if (!of_device_is_available(eth0_node)) {
+				of_node_put(eth0_node);
+				eth0_node = NULL;
+			}
+		} else if (reg == 1) {
+			eth1_node = eth_node;
+			if (!of_device_is_available(eth1_node)) {
+				of_node_put(eth1_node);
+				eth1_node = NULL;
+			}
+		} else {
+			dev_err(dev, "port reg should be 0 or 1\n");
+		}
+	}
+
+	of_node_put(eth_ports_node);
+
+	/* At least one node must be present and available else we fail */
+	if (!eth0_node && !eth1_node) {
+		dev_err(dev, "neither port0 nor port1 node available\n");
+		return -ENODEV;
+	}
+
+	if (eth0_node == eth1_node) {
+		dev_err(dev, "port0 and port1 can't have same reg\n");
+		of_node_put(eth0_node);
+		return -ENODEV;
+	}
+
+	prueth->eth_node[PRUETH_MAC0] = eth0_node;
+	prueth->eth_node[PRUETH_MAC1] = eth1_node;
+
+	prueth->miig_rt = syscon_regmap_lookup_by_phandle(np, "ti,mii-g-rt");
+	if (IS_ERR(prueth->miig_rt)) {
+		dev_err(dev, "couldn't get ti,mii-g-rt syscon regmap\n");
+		return -ENODEV;
+	}
+
+	prueth->mii_rt = syscon_regmap_lookup_by_phandle(np, "ti,mii-rt");
+	if (IS_ERR(prueth->mii_rt)) {
+		dev_err(dev, "couldn't get ti,mii-rt syscon regmap\n");
+		return -ENODEV;
+	}
+
+	if (eth0_node) {
+		ret = prueth_get_cores(prueth, ICSS_SLICE0);
+		if (ret)
+			goto put_cores;
+	}
+
+	if (eth1_node) {
+		ret = prueth_get_cores(prueth, ICSS_SLICE1);
+		if (ret)
+			goto put_cores;
+	}
+
+	pruss = pruss_get(eth0_node ?
+			  prueth->pru[ICSS_SLICE0] : prueth->pru[ICSS_SLICE1]);
+	if (IS_ERR(pruss)) {
+		ret = PTR_ERR(pruss);
+		dev_err(dev, "unable to get pruss handle\n");
+		goto put_cores;
+	}
+
+	prueth->pruss = pruss;
+
+	ret = pruss_request_mem_region(pruss, PRUSS_MEM_SHRD_RAM2,
+				       &prueth->shram);
+	if (ret) {
+		dev_err(dev, "unable to get PRUSS SHRD RAM2: %d\n", ret);
+		pruss_put(prueth->pruss);
+	}
+
+	prueth->sram_pool = of_gen_pool_get(np, "sram", 0);
+	if (!prueth->sram_pool) {
+		dev_err(dev, "unable to get SRAM pool\n");
+		ret = -ENODEV;
+
+		goto put_mem;
+	}
+
+	msmc_ram_size = MSMC_RAM_SIZE;
+
+	/* NOTE: FW bug needs buffer base to be 64KB aligned */
+	prueth->msmcram.va =
+		(void __iomem *)gen_pool_alloc_algo(prueth->sram_pool,
+						    msmc_ram_size,
+						    gen_pool_first_fit_align,
+						    &gp_data);
+
+	if (!prueth->msmcram.va) {
+		ret = -ENOMEM;
+		dev_err(dev, "unable to allocate MSMC resource\n");
+		goto put_mem;
+	}
+	prueth->msmcram.pa = gen_pool_virt_to_phys(prueth->sram_pool,
+						   (unsigned long)prueth->msmcram.va);
+	prueth->msmcram.size = msmc_ram_size;
+	memset_io(prueth->msmcram.va, 0, msmc_ram_size);
+	dev_dbg(dev, "sram: pa %llx va %p size %zx\n", prueth->msmcram.pa,
+		prueth->msmcram.va, prueth->msmcram.size);
+
+	/* setup netdev interfaces */
+	if (eth0_node) {
+		ret = prueth_netdev_init(prueth, eth0_node);
+		if (ret) {
+			dev_err_probe(dev, ret, "netdev init %s failed\n",
+				      eth0_node->name);
+			goto netdev_exit;
+		}
+	}
+
+	if (eth1_node) {
+		ret = prueth_netdev_init(prueth, eth1_node);
+		if (ret) {
+			dev_err_probe(dev, ret, "netdev init %s failed\n",
+				      eth1_node->name);
+			goto netdev_exit;
+		}
+	}
+
+	/* register the network devices */
+	if (eth0_node) {
+		ret = register_netdev(prueth->emac[PRUETH_MAC0]->ndev);
+		if (ret) {
+			dev_err(dev, "can't register netdev for port MII0");
+			goto netdev_exit;
+		}
+
+		prueth->registered_netdevs[PRUETH_MAC0] = prueth->emac[PRUETH_MAC0]->ndev;
+
+		emac_phy_connect(prueth->emac[PRUETH_MAC0]);
+		phy_attached_info(prueth->emac[PRUETH_MAC0]->ndev->phydev);
+	}
+
+	if (eth1_node) {
+		ret = register_netdev(prueth->emac[PRUETH_MAC1]->ndev);
+		if (ret) {
+			dev_err(dev, "can't register netdev for port MII1");
+			goto netdev_unregister;
+		}
+
+		prueth->registered_netdevs[PRUETH_MAC1] = prueth->emac[PRUETH_MAC1]->ndev;
+		emac_phy_connect(prueth->emac[PRUETH_MAC1]);
+		phy_attached_info(prueth->emac[PRUETH_MAC1]->ndev->phydev);
+	}
+
+	dev_info(dev, "TI PRU ethernet driver initialized: %s EMAC mode\n",
+		 (!eth0_node || !eth1_node) ? "single" : "dual");
+
+	if (eth1_node)
+		of_node_put(eth1_node);
+	if (eth0_node)
+		of_node_put(eth0_node);
+	return 0;
+
+netdev_unregister:
+	for (i = 0; i < PRUETH_NUM_MACS; i++) {
+		if (!prueth->registered_netdevs[i])
+			continue;
+		if (prueth->emac[i]->ndev->phydev) {
+			phy_disconnect(prueth->emac[i]->ndev->phydev);
+			prueth->emac[i]->ndev->phydev = NULL;
+		}
+		unregister_netdev(prueth->registered_netdevs[i]);
+	}
+
+netdev_exit:
+	for (i = 0; i < PRUETH_NUM_MACS; i++) {
+		eth_node = prueth->eth_node[i];
+		if (!eth_node)
+			continue;
+
+		prueth_netdev_exit(prueth, eth_node);
+	}
+
+	gen_pool_free(prueth->sram_pool,
+		      (unsigned long)prueth->msmcram.va, msmc_ram_size);
+
+put_mem:
+	pruss_release_mem_region(prueth->pruss, &prueth->shram);
+	pruss_put(prueth->pruss);
+
+put_cores:
+	if (eth1_node) {
+		prueth_put_cores(prueth, ICSS_SLICE1);
+		of_node_put(eth1_node);
+	}
+
+	if (eth0_node) {
+		prueth_put_cores(prueth, ICSS_SLICE0);
+		of_node_put(eth0_node);
+	}
+
+	return ret;
+}
+
+static void prueth_remove(struct platform_device *pdev)
+{
+	struct prueth *prueth = platform_get_drvdata(pdev);
+	struct device_node *eth_node;
+	int i;
+
+	for (i = 0; i < PRUETH_NUM_MACS; i++) {
+		if (!prueth->registered_netdevs[i])
+			continue;
+		phy_stop(prueth->emac[i]->ndev->phydev);
+		phy_disconnect(prueth->emac[i]->ndev->phydev);
+		prueth->emac[i]->ndev->phydev = NULL;
+		unregister_netdev(prueth->registered_netdevs[i]);
+	}
+
+	for (i = 0; i < PRUETH_NUM_MACS; i++) {
+		eth_node = prueth->eth_node[i];
+		if (!eth_node)
+			continue;
+
+		prueth_netdev_exit(prueth, eth_node);
+	}
+
+	gen_pool_free(prueth->sram_pool,
+		      (unsigned long)prueth->msmcram.va,
+		      MSMC_RAM_SIZE);
+
+	pruss_release_mem_region(prueth->pruss, &prueth->shram);
+
+	pruss_put(prueth->pruss);
+
+	if (prueth->eth_node[PRUETH_MAC1])
+		prueth_put_cores(prueth, ICSS_SLICE1);
+
+	if (prueth->eth_node[PRUETH_MAC0])
+		prueth_put_cores(prueth, ICSS_SLICE0);
+}
+
+static const struct prueth_pdata am654_icssg_pdata = {
+	.fdqring_mode = K3_RINGACC_RING_MODE_MESSAGE,
+	.quirk_10m_link_issue = 1,
+};
+
+static const struct of_device_id prueth_dt_match[] = {
+	{ .compatible = "ti,am654-icssg-prueth", .data = &am654_icssg_pdata },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, prueth_dt_match);
+
+static struct platform_driver prueth_driver = {
+	.probe = prueth_probe,
+	.remove_new = prueth_remove,
+	.driver = {
+		.name = "icssg-prueth",
+		.of_match_table = prueth_dt_match,
+	},
+};
+module_platform_driver(prueth_driver);
+
+MODULE_AUTHOR("Roger Quadros <rogerq@ti.com>");
+MODULE_AUTHOR("Md Danish Anwar <danishanwar@ti.com>");
+MODULE_DESCRIPTION("PRUSS ICSSG Ethernet Driver");
+MODULE_LICENSE("GPL");
diff --git a/drivers/net/ethernet/ti/icssg/icssg_prueth.h b/drivers/net/ethernet/ti/icssg/icssg_prueth.h
index 8512f19a9b4d..69d1c9ee8e43 100644
--- a/drivers/net/ethernet/ti/icssg/icssg_prueth.h
+++ b/drivers/net/ethernet/ti/icssg/icssg_prueth.h
@@ -34,13 +34,42 @@
 
 #include <net/devlink.h>
 
+#include "icssg_config.h"
 #include "icssg_switch_map.h"
 
+#define PRUETH_MAX_MTU          (2000 - ETH_HLEN - ETH_FCS_LEN)
+#define PRUETH_MIN_PKT_SIZE     (VLAN_ETH_ZLEN)
+#define PRUETH_MAX_PKT_SIZE     (PRUETH_MAX_MTU + ETH_HLEN + ETH_FCS_LEN)
+
 #define ICSS_SLICE0	0
 #define ICSS_SLICE1	1
 
+#define ICSS_FW_PRU	0
+#define ICSS_FW_RTU	1
+
 #define ICSSG_MAX_RFLOWS	8	/* per slice */
 
+/* Firmware status codes */
+#define ICSS_HS_FW_READY 0x55555555
+#define ICSS_HS_FW_DEAD 0xDEAD0000	/* lower 16 bits contain error code */
+
+/* Firmware command codes */
+#define ICSS_HS_CMD_BUSY 0x40000000
+#define ICSS_HS_CMD_DONE 0x80000000
+#define ICSS_HS_CMD_CANCEL 0x10000000
+
+/* Firmware commands */
+#define ICSS_CMD_SPAD 0x20
+#define ICSS_CMD_RXTX 0x10
+#define ICSS_CMD_ADD_FDB 0x1
+#define ICSS_CMD_DEL_FDB 0x2
+#define ICSS_CMD_SET_RUN 0x4
+#define ICSS_CMD_GET_FDB_SLOT 0x5
+#define ICSS_CMD_ENABLE_VLAN 0x5
+#define ICSS_CMD_DISABLE_VLAN 0x6
+#define ICSS_CMD_ADD_FILTER 0x7
+#define ICSS_CMD_ADD_MAC 0x8
+
 /* In switch mode there are 3 real ports i.e. 3 mac addrs.
  * however Linux sees only the host side port. The other 2 ports
  * are the switch ports.
@@ -181,6 +210,18 @@ struct prueth {
 	int emacs_initialized;
 };
 
+/* Classifier helpers */
+void icssg_class_set_mac_addr(struct regmap *miig_rt, int slice, u8 *mac);
+void icssg_class_set_host_mac_addr(struct regmap *miig_rt, const u8 *mac);
+void icssg_class_disable(struct regmap *miig_rt, int slice);
+void icssg_class_default(struct regmap *miig_rt, int slice, bool allmulti);
+void icssg_ft1_set_mac_addr(struct regmap *miig_rt, int slice, u8 *mac_addr);
+
+/* Buffer queue helpers */
+int icssg_queue_pop(struct prueth *prueth, u8 queue);
+void icssg_queue_push(struct prueth *prueth, int queue, u16 addr);
+u32 icssg_queue_level(struct prueth *prueth, int queue);
+
 /* get PRUSS SLICE number from prueth_emac */
 static inline int prueth_emac_slice(struct prueth_emac *emac)
 {
@@ -194,4 +235,15 @@ static inline int prueth_emac_slice(struct prueth_emac *emac)
 	}
 }
 
+/* config helpers */
+void icssg_config_ipg(struct prueth_emac *emac);
+int icssg_config(struct prueth *prueth, struct prueth_emac *emac,
+		 int slice);
+int emac_set_port_state(struct prueth_emac *emac,
+			enum icssg_port_state_cmd state);
+void icssg_config_set_speed(struct prueth_emac *emac);
+
+#define prueth_napi_to_tx_chn(pnapi) \
+	container_of(pnapi, struct prueth_tx_chn, napi_tx)
+
 #endif /* __NET_TI_ICSSG_PRUETH_H */
diff --git a/drivers/net/ethernet/ti/icssg/icssg_queues.c b/drivers/net/ethernet/ti/icssg/icssg_queues.c
index 2e3f7db43db7..1c2b92dbcb59 100644
--- a/drivers/net/ethernet/ti/icssg/icssg_queues.c
+++ b/drivers/net/ethernet/ti/icssg/icssg_queues.c
@@ -13,7 +13,7 @@
 #define ICSSG_QUEUE_CNT_OFFSET		0xe40
 #define	ICSSG_QUEUE_RESET_OFFSET	0xf40
 
-int __maybe_unused icssg_queue_pop(struct prueth *prueth, u8 queue)
+int icssg_queue_pop(struct prueth *prueth, u8 queue)
 {
 	u32 val, cnt;
 
@@ -29,7 +29,7 @@ int __maybe_unused icssg_queue_pop(struct prueth *prueth, u8 queue)
 	return val;
 }
 
-void __maybe_unused icssg_queue_push(struct prueth *prueth, int queue, u16 addr)
+void icssg_queue_push(struct prueth *prueth, int queue, u16 addr)
 {
 	if (queue >= ICSSG_QUEUES_MAX)
 		return;
-- 
2.34.1

