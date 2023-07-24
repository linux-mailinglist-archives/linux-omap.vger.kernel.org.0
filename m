Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2CB5175F4FE
	for <lists+linux-omap@lfdr.de>; Mon, 24 Jul 2023 13:30:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230509AbjGXLab (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 24 Jul 2023 07:30:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50394 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231159AbjGXLa1 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 24 Jul 2023 07:30:27 -0400
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5E1BCE5A;
        Mon, 24 Jul 2023 04:30:22 -0700 (PDT)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 36OBTtRU071915;
        Mon, 24 Jul 2023 06:29:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1690198195;
        bh=KoQEYdIiuWiLZc/w9h9+YBPWc/bYnvRy0HkKH/MX3HQ=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=Lb+OnWnISFnvSgYYegYsWbEv7kI2Lvm4EgKdDuK8tCGsDQH0VubStR6JRWFMVR2yh
         onW4EjTAI9TQeP1a82SZVTTnYgBtG0SyFbUUl/EklyDC78Q2pYsfPOqOtpCqDmhtkI
         qvwukP4IHw1YMs8EONeuCyPrQmgH8ok7bySQBl9M=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 36OBTtvS047686
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 24 Jul 2023 06:29:55 -0500
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 24
 Jul 2023 06:29:55 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 24 Jul 2023 06:29:55 -0500
Received: from fllv0122.itg.ti.com (fllv0122.itg.ti.com [10.247.120.72])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 36OBTtqb074845;
        Mon, 24 Jul 2023 06:29:55 -0500
Received: from localhost (uda0501179.dhcp.ti.com [172.24.227.217])
        by fllv0122.itg.ti.com (8.14.7/8.14.7) with ESMTP id 36OBTsxR007479;
        Mon, 24 Jul 2023 06:29:55 -0500
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
Subject: [PATCH v11 02/10] net: ti: icssg-prueth: Add mii helper apis and macros
Date:   Mon, 24 Jul 2023 16:59:26 +0530
Message-ID: <20230724112934.2637802-3-danishanwar@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230724112934.2637802-1-danishanwar@ti.com>
References: <20230724112934.2637802-1-danishanwar@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Add MII helper APIs and MACROs. These APIs and MACROs will be later used
by ICSSG Ethernet driver. Also introduce icssg_prueth.h which has
definition of prueth related structures.

Signed-off-by: MD Danish Anwar <danishanwar@ti.com>
Reviewed-by: Andrew Lunn <andrew@lunn.ch>
---
 drivers/net/ethernet/ti/icssg_mii_cfg.c | 120 +++++++++++++++
 drivers/net/ethernet/ti/icssg_mii_rt.h  | 151 ++++++++++++++++++
 drivers/net/ethernet/ti/icssg_prueth.h  | 197 ++++++++++++++++++++++++
 3 files changed, 468 insertions(+)
 create mode 100644 drivers/net/ethernet/ti/icssg_mii_cfg.c
 create mode 100644 drivers/net/ethernet/ti/icssg_mii_rt.h
 create mode 100644 drivers/net/ethernet/ti/icssg_prueth.h

diff --git a/drivers/net/ethernet/ti/icssg_mii_cfg.c b/drivers/net/ethernet/ti/icssg_mii_cfg.c
new file mode 100644
index 000000000000..92718ae40d7e
--- /dev/null
+++ b/drivers/net/ethernet/ti/icssg_mii_cfg.c
@@ -0,0 +1,120 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Texas Instruments ICSSG Ethernet Driver
+ *
+ * Copyright (C) 2018-2022 Texas Instruments Incorporated - https://www.ti.com/
+ *
+ */
+
+#include <linux/etherdevice.h>
+#include <linux/regmap.h>
+#include <linux/types.h>
+
+#include "icssg_mii_rt.h"
+#include "icssg_prueth.h"
+
+void icssg_mii_update_ipg(struct regmap *mii_rt, int mii, u32 ipg)
+{
+	u32 val;
+
+	if (mii == ICSS_MII0) {
+		regmap_write(mii_rt, PRUSS_MII_RT_TX_IPG0, ipg);
+	} else {
+		regmap_read(mii_rt, PRUSS_MII_RT_TX_IPG0, &val);
+		regmap_write(mii_rt, PRUSS_MII_RT_TX_IPG1, ipg);
+		regmap_write(mii_rt, PRUSS_MII_RT_TX_IPG0, val);
+	}
+}
+
+void icssg_mii_update_mtu(struct regmap *mii_rt, int mii, int mtu)
+{
+	mtu += (ETH_HLEN + ETH_FCS_LEN);
+	if (mii == ICSS_MII0) {
+		regmap_update_bits(mii_rt,
+				   PRUSS_MII_RT_RX_FRMS0,
+				   PRUSS_MII_RT_RX_FRMS_MAX_FRM_MASK,
+				   (mtu - 1) << PRUSS_MII_RT_RX_FRMS_MAX_FRM_SHIFT);
+	} else {
+		regmap_update_bits(mii_rt,
+				   PRUSS_MII_RT_RX_FRMS1,
+				   PRUSS_MII_RT_RX_FRMS_MAX_FRM_MASK,
+				   (mtu - 1) << PRUSS_MII_RT_RX_FRMS_MAX_FRM_SHIFT);
+	}
+}
+
+void icssg_update_rgmii_cfg(struct regmap *miig_rt, struct prueth_emac *emac)
+{
+	u32 gig_en_mask, gig_val = 0, full_duplex_mask, full_duplex_val = 0;
+	int slice = prueth_emac_slice(emac);
+	u32 inband_en_mask, inband_val = 0;
+
+	gig_en_mask = (slice == ICSS_MII0) ? RGMII_CFG_GIG_EN_MII0 :
+					RGMII_CFG_GIG_EN_MII1;
+	if (emac->speed == SPEED_1000)
+		gig_val = gig_en_mask;
+	regmap_update_bits(miig_rt, RGMII_CFG_OFFSET, gig_en_mask, gig_val);
+
+	inband_en_mask = (slice == ICSS_MII0) ? RGMII_CFG_INBAND_EN_MII0 :
+					RGMII_CFG_INBAND_EN_MII1;
+	if (emac->speed == SPEED_10 && phy_interface_mode_is_rgmii(emac->phy_if))
+		inband_val = inband_en_mask;
+	regmap_update_bits(miig_rt, RGMII_CFG_OFFSET, inband_en_mask, inband_val);
+
+	full_duplex_mask = (slice == ICSS_MII0) ? RGMII_CFG_FULL_DUPLEX_MII0 :
+					   RGMII_CFG_FULL_DUPLEX_MII1;
+	if (emac->duplex == DUPLEX_FULL)
+		full_duplex_val = full_duplex_mask;
+	regmap_update_bits(miig_rt, RGMII_CFG_OFFSET, full_duplex_mask,
+			   full_duplex_val);
+}
+
+void icssg_miig_set_interface_mode(struct regmap *miig_rt, int mii, phy_interface_t phy_if)
+{
+	u32 val, mask, shift;
+
+	mask = mii == ICSS_MII0 ? ICSSG_CFG_MII0_MODE : ICSSG_CFG_MII1_MODE;
+	shift =  mii == ICSS_MII0 ? ICSSG_CFG_MII0_MODE_SHIFT : ICSSG_CFG_MII1_MODE_SHIFT;
+
+	val = MII_MODE_RGMII;
+	if (phy_if == PHY_INTERFACE_MODE_MII)
+		val = MII_MODE_MII;
+
+	val <<= shift;
+	regmap_update_bits(miig_rt, ICSSG_CFG_OFFSET, mask, val);
+	regmap_read(miig_rt, ICSSG_CFG_OFFSET, &val);
+}
+
+u32 icssg_rgmii_cfg_get_bitfield(struct regmap *miig_rt, u32 mask, u32 shift)
+{
+	u32 val;
+
+	regmap_read(miig_rt, RGMII_CFG_OFFSET, &val);
+	val &= mask;
+	val >>= shift;
+
+	return val;
+}
+
+u32 icssg_rgmii_get_speed(struct regmap *miig_rt, int mii)
+{
+	u32 shift = RGMII_CFG_SPEED_MII0_SHIFT, mask = RGMII_CFG_SPEED_MII0;
+
+	if (mii == ICSS_MII1) {
+		shift = RGMII_CFG_SPEED_MII1_SHIFT;
+		mask = RGMII_CFG_SPEED_MII1;
+	}
+
+	return icssg_rgmii_cfg_get_bitfield(miig_rt, mask, shift);
+}
+
+u32 icssg_rgmii_get_fullduplex(struct regmap *miig_rt, int mii)
+{
+	u32 shift = RGMII_CFG_FULLDUPLEX_MII0_SHIFT;
+	u32 mask = RGMII_CFG_FULLDUPLEX_MII0;
+
+	if (mii == ICSS_MII1) {
+		shift = RGMII_CFG_FULLDUPLEX_MII1_SHIFT;
+		mask = RGMII_CFG_FULLDUPLEX_MII1;
+	}
+
+	return icssg_rgmii_cfg_get_bitfield(miig_rt, mask, shift);
+}
diff --git a/drivers/net/ethernet/ti/icssg_mii_rt.h b/drivers/net/ethernet/ti/icssg_mii_rt.h
new file mode 100644
index 000000000000..55a59bf5299c
--- /dev/null
+++ b/drivers/net/ethernet/ti/icssg_mii_rt.h
@@ -0,0 +1,151 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+/* PRU-ICSS MII_RT register definitions
+ *
+ * Copyright (C) 2015-2022 Texas Instruments Incorporated - https://www.ti.com
+ */
+
+#ifndef __NET_PRUSS_MII_RT_H__
+#define __NET_PRUSS_MII_RT_H__
+
+#include <linux/if_ether.h>
+#include <linux/phy.h>
+
+/* PRUSS_MII_RT Registers */
+#define PRUSS_MII_RT_RXCFG0		0x0
+#define PRUSS_MII_RT_RXCFG1		0x4
+#define PRUSS_MII_RT_TXCFG0		0x10
+#define PRUSS_MII_RT_TXCFG1		0x14
+#define PRUSS_MII_RT_TX_CRC0		0x20
+#define PRUSS_MII_RT_TX_CRC1		0x24
+#define PRUSS_MII_RT_TX_IPG0		0x30
+#define PRUSS_MII_RT_TX_IPG1		0x34
+#define PRUSS_MII_RT_PRS0		0x38
+#define PRUSS_MII_RT_PRS1		0x3c
+#define PRUSS_MII_RT_RX_FRMS0		0x40
+#define PRUSS_MII_RT_RX_FRMS1		0x44
+#define PRUSS_MII_RT_RX_PCNT0		0x48
+#define PRUSS_MII_RT_RX_PCNT1		0x4c
+#define PRUSS_MII_RT_RX_ERR0		0x50
+#define PRUSS_MII_RT_RX_ERR1		0x54
+
+/* PRUSS_MII_RT_RXCFG0/1 bits */
+#define PRUSS_MII_RT_RXCFG_RX_ENABLE		BIT(0)
+#define PRUSS_MII_RT_RXCFG_RX_DATA_RDY_MODE_DIS	BIT(1)
+#define PRUSS_MII_RT_RXCFG_RX_CUT_PREAMBLE	BIT(2)
+#define PRUSS_MII_RT_RXCFG_RX_MUX_SEL		BIT(3)
+#define PRUSS_MII_RT_RXCFG_RX_L2_EN		BIT(4)
+#define PRUSS_MII_RT_RXCFG_RX_BYTE_SWAP		BIT(5)
+#define PRUSS_MII_RT_RXCFG_RX_AUTO_FWD_PRE	BIT(6)
+#define PRUSS_MII_RT_RXCFG_RX_L2_EOF_SCLR_DIS	BIT(9)
+
+/* PRUSS_MII_RT_TXCFG0/1 bits */
+#define PRUSS_MII_RT_TXCFG_TX_ENABLE		BIT(0)
+#define PRUSS_MII_RT_TXCFG_TX_AUTO_PREAMBLE	BIT(1)
+#define PRUSS_MII_RT_TXCFG_TX_EN_MODE		BIT(2)
+#define PRUSS_MII_RT_TXCFG_TX_BYTE_SWAP		BIT(3)
+#define PRUSS_MII_RT_TXCFG_TX_MUX_SEL		BIT(8)
+#define PRUSS_MII_RT_TXCFG_PRE_TX_AUTO_SEQUENCE	BIT(9)
+#define PRUSS_MII_RT_TXCFG_PRE_TX_AUTO_ESC_ERR	BIT(10)
+#define PRUSS_MII_RT_TXCFG_TX_32_MODE_EN	BIT(11)
+#define PRUSS_MII_RT_TXCFG_TX_IPG_WIRE_CLK_EN	BIT(12)	/* SR2.0 onwards */
+
+#define PRUSS_MII_RT_TXCFG_TX_START_DELAY_SHIFT	16
+#define PRUSS_MII_RT_TXCFG_TX_START_DELAY_MASK	GENMASK(25, 16)
+
+#define PRUSS_MII_RT_TXCFG_TX_CLK_DELAY_SHIFT	28
+#define PRUSS_MII_RT_TXCFG_TX_CLK_DELAY_MASK	GENMASK(30, 28)
+
+/* PRUSS_MII_RT_TX_IPG0/1 bits */
+#define PRUSS_MII_RT_TX_IPG_IPG_SHIFT	0
+#define PRUSS_MII_RT_TX_IPG_IPG_MASK	GENMASK(9, 0)
+
+/* PRUSS_MII_RT_PRS0/1 bits */
+#define PRUSS_MII_RT_PRS_COL	BIT(0)
+#define PRUSS_MII_RT_PRS_CRS	BIT(1)
+
+/* PRUSS_MII_RT_RX_FRMS0/1 bits */
+#define PRUSS_MII_RT_RX_FRMS_MIN_FRM_SHIFT	0
+#define PRUSS_MII_RT_RX_FRMS_MIN_FRM_MASK	GENMASK(15, 0)
+
+#define PRUSS_MII_RT_RX_FRMS_MAX_FRM_SHIFT	16
+#define PRUSS_MII_RT_RX_FRMS_MAX_FRM_MASK	GENMASK(31, 16)
+
+/* Min/Max in MII_RT_RX_FRMS */
+/* For EMAC and Switch */
+#define PRUSS_MII_RT_RX_FRMS_MAX	(VLAN_ETH_FRAME_LEN + ETH_FCS_LEN)
+#define PRUSS_MII_RT_RX_FRMS_MIN_FRM	(64)
+
+/* for HSR and PRP */
+#define PRUSS_MII_RT_RX_FRMS_MAX_FRM_LRE	(PRUSS_MII_RT_RX_FRMS_MAX + \
+						 ICSS_LRE_TAG_RCT_SIZE)
+/* PRUSS_MII_RT_RX_PCNT0/1 bits */
+#define PRUSS_MII_RT_RX_PCNT_MIN_PCNT_SHIFT	0
+#define PRUSS_MII_RT_RX_PCNT_MIN_PCNT_MASK	GENMASK(3, 0)
+
+#define PRUSS_MII_RT_RX_PCNT_MAX_PCNT_SHIFT	4
+#define PRUSS_MII_RT_RX_PCNT_MAX_PCNT_MASK	GENMASK(7, 4)
+
+/* PRUSS_MII_RT_RX_ERR0/1 bits */
+#define PRUSS_MII_RT_RX_ERR_MIN_PCNT_ERR	BIT(0)
+#define PRUSS_MII_RT_RX_ERR_MAX_PCNT_ERR	BIT(1)
+#define PRUSS_MII_RT_RX_ERR_MIN_FRM_ERR		BIT(2)
+#define PRUSS_MII_RT_RX_ERR_MAX_FRM_ERR		BIT(3)
+
+#define ICSSG_CFG_OFFSET	0
+#define RGMII_CFG_OFFSET	4
+
+/* Constant to choose between MII0 and MII1 */
+#define ICSS_MII0	0
+#define ICSS_MII1	1
+
+/* ICSSG_CFG Register bits */
+#define ICSSG_CFG_SGMII_MODE	BIT(16)
+#define ICSSG_CFG_TX_PRU_EN	BIT(11)
+#define ICSSG_CFG_RX_SFD_TX_SOF_EN	BIT(10)
+#define ICSSG_CFG_RTU_PRU_PSI_SHARE_EN	BIT(9)
+#define ICSSG_CFG_IEP1_TX_EN	BIT(8)
+#define ICSSG_CFG_MII1_MODE	GENMASK(6, 5)
+#define ICSSG_CFG_MII1_MODE_SHIFT	5
+#define ICSSG_CFG_MII0_MODE	GENMASK(4, 3)
+#define ICSSG_CFG_MII0_MODE_SHIFT	3
+#define ICSSG_CFG_RX_L2_G_EN	BIT(2)
+#define ICSSG_CFG_TX_L2_EN	BIT(1)
+#define ICSSG_CFG_TX_L1_EN	BIT(0)
+
+enum mii_mode {
+	MII_MODE_MII = 0,
+	MII_MODE_RGMII
+};
+
+/* RGMII CFG Register bits */
+#define RGMII_CFG_INBAND_EN_MII0	BIT(16)
+#define RGMII_CFG_GIG_EN_MII0	BIT(17)
+#define RGMII_CFG_INBAND_EN_MII1	BIT(20)
+#define RGMII_CFG_GIG_EN_MII1	BIT(21)
+#define RGMII_CFG_FULL_DUPLEX_MII0	BIT(18)
+#define RGMII_CFG_FULL_DUPLEX_MII1	BIT(22)
+#define RGMII_CFG_SPEED_MII0	GENMASK(2, 1)
+#define RGMII_CFG_SPEED_MII1	GENMASK(6, 5)
+#define RGMII_CFG_SPEED_MII0_SHIFT	1
+#define RGMII_CFG_SPEED_MII1_SHIFT	5
+#define RGMII_CFG_FULLDUPLEX_MII0	BIT(3)
+#define RGMII_CFG_FULLDUPLEX_MII1	BIT(7)
+#define RGMII_CFG_FULLDUPLEX_MII0_SHIFT	3
+#define RGMII_CFG_FULLDUPLEX_MII1_SHIFT	7
+#define RGMII_CFG_SPEED_10M	0
+#define RGMII_CFG_SPEED_100M	1
+#define RGMII_CFG_SPEED_1G	2
+
+struct regmap;
+struct prueth_emac;
+
+void icssg_mii_update_ipg(struct regmap *mii_rt, int mii, u32 ipg);
+void icssg_mii_update_mtu(struct regmap *mii_rt, int mii, int mtu);
+void icssg_update_rgmii_cfg(struct regmap *miig_rt, struct prueth_emac *emac);
+u32 icssg_rgmii_cfg_get_bitfield(struct regmap *miig_rt, u32 mask, u32 shift);
+u32 icssg_rgmii_get_speed(struct regmap *miig_rt, int mii);
+u32 icssg_rgmii_get_fullduplex(struct regmap *miig_rt, int mii);
+void icssg_miig_set_interface_mode(struct regmap *miig_rt, int mii, phy_interface_t phy_if);
+
+#endif /* __NET_PRUSS_MII_RT_H__ */
diff --git a/drivers/net/ethernet/ti/icssg_prueth.h b/drivers/net/ethernet/ti/icssg_prueth.h
new file mode 100644
index 000000000000..8512f19a9b4d
--- /dev/null
+++ b/drivers/net/ethernet/ti/icssg_prueth.h
@@ -0,0 +1,197 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/* Texas Instruments ICSSG Ethernet driver
+ *
+ * Copyright (C) 2018-2022 Texas Instruments Incorporated - https://www.ti.com/
+ *
+ */
+
+#ifndef __NET_TI_ICSSG_PRUETH_H
+#define __NET_TI_ICSSG_PRUETH_H
+
+#include <linux/etherdevice.h>
+#include <linux/genalloc.h>
+#include <linux/if_vlan.h>
+#include <linux/interrupt.h>
+#include <linux/kernel.h>
+#include <linux/mfd/syscon.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/net_tstamp.h>
+#include <linux/of.h>
+#include <linux/of_irq.h>
+#include <linux/of_mdio.h>
+#include <linux/of_net.h>
+#include <linux/of_platform.h>
+#include <linux/phy.h>
+#include <linux/remoteproc/pruss.h>
+#include <linux/pruss_driver.h>
+#include <linux/ptp_clock_kernel.h>
+#include <linux/remoteproc.h>
+
+#include <linux/dma-mapping.h>
+#include <linux/dma/ti-cppi5.h>
+#include <linux/dma/k3-udma-glue.h>
+
+#include <net/devlink.h>
+
+#include "icssg_switch_map.h"
+
+#define ICSS_SLICE0	0
+#define ICSS_SLICE1	1
+
+#define ICSSG_MAX_RFLOWS	8	/* per slice */
+
+/* In switch mode there are 3 real ports i.e. 3 mac addrs.
+ * however Linux sees only the host side port. The other 2 ports
+ * are the switch ports.
+ * In emac mode there are 2 real ports i.e. 2 mac addrs.
+ * Linux sees both the ports.
+ */
+enum prueth_port {
+	PRUETH_PORT_HOST = 0,	/* host side port */
+	PRUETH_PORT_MII0,	/* physical port RG/SG MII 0 */
+	PRUETH_PORT_MII1,	/* physical port RG/SG MII 1 */
+	PRUETH_PORT_INVALID,	/* Invalid prueth port */
+};
+
+enum prueth_mac {
+	PRUETH_MAC0 = 0,
+	PRUETH_MAC1,
+	PRUETH_NUM_MACS,
+	PRUETH_MAC_INVALID,
+};
+
+struct prueth_tx_chn {
+	struct device *dma_dev;
+	struct napi_struct napi_tx;
+	struct k3_cppi_desc_pool *desc_pool;
+	struct k3_udma_glue_tx_channel *tx_chn;
+	struct prueth_emac *emac;
+	u32 id;
+	u32 descs_num;
+	unsigned int irq;
+	char name[32];
+};
+
+struct prueth_rx_chn {
+	struct device *dev;
+	struct device *dma_dev;
+	struct k3_cppi_desc_pool *desc_pool;
+	struct k3_udma_glue_rx_channel *rx_chn;
+	u32 descs_num;
+	unsigned int irq[ICSSG_MAX_RFLOWS];	/* separate irq per flow */
+	char name[32];
+};
+
+/* There are 4 Tx DMA channels, but the highest priority is CH3 (thread 3)
+ * and lower three are lower priority channels or threads.
+ */
+#define PRUETH_MAX_TX_QUEUES	4
+
+/* data for each emac port */
+struct prueth_emac {
+	bool fw_running;
+	struct prueth *prueth;
+	struct net_device *ndev;
+	u8 mac_addr[6];
+	struct napi_struct napi_rx;
+	u32 msg_enable;
+
+	int link;
+	int speed;
+	int duplex;
+
+	const char *phy_id;
+	struct device_node *phy_node;
+	phy_interface_t phy_if;
+	enum prueth_port port_id;
+
+	/* DMA related */
+	struct prueth_tx_chn tx_chns[PRUETH_MAX_TX_QUEUES];
+	struct completion tdown_complete;
+	atomic_t tdown_cnt;
+	struct prueth_rx_chn rx_chns;
+	int rx_flow_id_base;
+	int tx_ch_num;
+
+	spinlock_t lock;	/* serialize access */
+
+	unsigned long state;
+	struct completion cmd_complete;
+	/* Mutex to serialize access to firmware command interface */
+	struct mutex cmd_lock;
+	struct work_struct rx_mode_work;
+	struct workqueue_struct	*cmd_wq;
+
+	struct pruss_mem_region dram;
+};
+
+/**
+ * struct prueth_pdata - PRUeth platform data
+ * @fdqring_mode: Free desc queue mode
+ * @quirk_10m_link_issue: 10M link detect errata
+ */
+struct prueth_pdata {
+	enum k3_ring_mode fdqring_mode;
+	u32	quirk_10m_link_issue:1;
+};
+
+/**
+ * struct prueth - PRUeth structure
+ * @dev: device
+ * @pruss: pruss handle
+ * @pru: rproc instances of PRUs
+ * @rtu: rproc instances of RTUs
+ * @txpru: rproc instances of TX_PRUs
+ * @shram: PRUSS shared RAM region
+ * @sram_pool: MSMC RAM pool for buffers
+ * @msmcram: MSMC RAM region
+ * @eth_node: DT node for the port
+ * @emac: private EMAC data structure
+ * @registered_netdevs: list of registered netdevs
+ * @miig_rt: regmap to mii_g_rt block
+ * @mii_rt: regmap to mii_rt block
+ * @pru_id: ID for each of the PRUs
+ * @pdev: pointer to ICSSG platform device
+ * @pdata: pointer to platform data for ICSSG driver
+ * @icssg_hwcmdseq: seq counter or HWQ messages
+ * @emacs_initialized: num of EMACs/ext ports that are up/running
+ */
+struct prueth {
+	struct device *dev;
+	struct pruss *pruss;
+	struct rproc *pru[PRUSS_NUM_PRUS];
+	struct rproc *rtu[PRUSS_NUM_PRUS];
+	struct rproc *txpru[PRUSS_NUM_PRUS];
+	struct pruss_mem_region shram;
+	struct gen_pool *sram_pool;
+	struct pruss_mem_region msmcram;
+
+	struct device_node *eth_node[PRUETH_NUM_MACS];
+	struct prueth_emac *emac[PRUETH_NUM_MACS];
+	struct net_device *registered_netdevs[PRUETH_NUM_MACS];
+	struct regmap *miig_rt;
+	struct regmap *mii_rt;
+
+	enum pruss_pru_id pru_id[PRUSS_NUM_PRUS];
+	struct platform_device *pdev;
+	struct prueth_pdata pdata;
+	u8 icssg_hwcmdseq;
+
+	int emacs_initialized;
+};
+
+/* get PRUSS SLICE number from prueth_emac */
+static inline int prueth_emac_slice(struct prueth_emac *emac)
+{
+	switch (emac->port_id) {
+	case PRUETH_PORT_MII0:
+		return ICSS_SLICE0;
+	case PRUETH_PORT_MII1:
+		return ICSS_SLICE1;
+	default:
+		return -EINVAL;
+	}
+}
+
+#endif /* __NET_TI_ICSSG_PRUETH_H */
-- 
2.34.1

