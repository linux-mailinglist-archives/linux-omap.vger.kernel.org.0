Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 41CA8771F1E
	for <lists+linux-omap@lfdr.de>; Mon,  7 Aug 2023 13:02:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231848AbjHGLCO (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 7 Aug 2023 07:02:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40646 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231824AbjHGLBz (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 7 Aug 2023 07:01:55 -0400
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C0FC21FC7;
        Mon,  7 Aug 2023 04:01:38 -0700 (PDT)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 377B1FBi109330;
        Mon, 7 Aug 2023 06:01:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1691406075;
        bh=uEmzzQ9Lz+qr6w6QXZGu9p4Uzp9Qffwqqc5spxjLN1Y=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=ahTEoKLigxdoYpD+tqRhVs4TAMfgJaexgC3sszeHwIhrXk1Qp4jcGObKWmi3TOxxy
         L4BtTepLgUfVlOaNRYQ2r71LLGpjcNHrE8YD3hqgEoNgWaQv1eMMK0F/q35OwR0xmj
         XfM7RKfmybL7ixxJHMw6g7QntDjxcPGtWwMsXlno=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 377B1FHm085838
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 7 Aug 2023 06:01:15 -0500
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 7
 Aug 2023 06:01:14 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 7 Aug 2023 06:01:14 -0500
Received: from lelv0854.itg.ti.com (lelv0854.itg.ti.com [10.181.64.140])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 377B1Eic089843;
        Mon, 7 Aug 2023 06:01:14 -0500
Received: from localhost (uda0501179.dhcp.ti.com [172.24.227.217])
        by lelv0854.itg.ti.com (8.14.7/8.14.7) with ESMTP id 377B1Eww027896;
        Mon, 7 Aug 2023 06:01:14 -0500
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
Subject: [PATCH v2 3/5] net: ti: icss-iep: Add IEP driver
Date:   Mon, 7 Aug 2023 16:30:46 +0530
Message-ID: <20230807110048.2611456-4-danishanwar@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230807110048.2611456-1-danishanwar@ti.com>
References: <20230807110048.2611456-1-danishanwar@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

From: Roger Quadros <rogerq@ti.com>

Add a driver for Industrial Ethernet Peripheral (IEP) block of PRUSS to
support timestamping of ethernet packets and thus support PTP and PPS
for PRU ethernet ports.

Signed-off-by: Roger Quadros <rogerq@ti.com>
Signed-off-by: Lokesh Vutla <lokeshvutla@ti.com>
Signed-off-by: Murali Karicheri <m-karicheri2@ti.com>
Signed-off-by: Vignesh Raghavendra <vigneshr@ti.com>
Signed-off-by: MD Danish Anwar <danishanwar@ti.com>
---
 drivers/net/ethernet/ti/Kconfig          |  12 +
 drivers/net/ethernet/ti/Makefile         |   1 +
 drivers/net/ethernet/ti/icssg/icss_iep.c | 935 +++++++++++++++++++++++
 drivers/net/ethernet/ti/icssg/icss_iep.h |  38 +
 4 files changed, 986 insertions(+)
 create mode 100644 drivers/net/ethernet/ti/icssg/icss_iep.c
 create mode 100644 drivers/net/ethernet/ti/icssg/icss_iep.h

diff --git a/drivers/net/ethernet/ti/Kconfig b/drivers/net/ethernet/ti/Kconfig
index 63e510b6860f..88b5b1b47779 100644
--- a/drivers/net/ethernet/ti/Kconfig
+++ b/drivers/net/ethernet/ti/Kconfig
@@ -186,6 +186,7 @@ config CPMAC
 config TI_ICSSG_PRUETH
 	tristate "TI Gigabit PRU Ethernet driver"
 	select PHYLIB
+	select TI_ICSS_IEP
 	depends on PRU_REMOTEPROC
 	depends on ARCH_K3 && OF && TI_K3_UDMA_GLUE_LAYER
 	help
@@ -196,4 +197,15 @@ config TI_ICSSG_PRUETH
 	  to support the Ethernet operation. Currently, it supports Ethernet
 	  with 1G and 100M link speed.
 
+config TI_ICSS_IEP
+	tristate "TI PRU ICSS IEP driver"
+	depends on TI_PRUSS
+	default TI_PRUSS
+	help
+	  This driver enables support for the PRU-ICSS Industrial Ethernet
+	  Peripheral within a PRU-ICSS subsystem present on various TI SoCs.
+
+	  To compile this driver as a module, choose M here. The module
+	  will be called icss_iep.
+
 endif # NET_VENDOR_TI
diff --git a/drivers/net/ethernet/ti/Makefile b/drivers/net/ethernet/ti/Makefile
index 9176d79c36e1..34fd7a716ba6 100644
--- a/drivers/net/ethernet/ti/Makefile
+++ b/drivers/net/ethernet/ti/Makefile
@@ -38,3 +38,4 @@ icssg-prueth-y := k3-cppi-desc-pool.o \
 		  icssg/icssg_mii_cfg.o \
 		  icssg/icssg_stats.o \
 		  icssg/icssg_ethtool.o
+obj-$(CONFIG_TI_ICSS_IEP) += icssg/icss_iep.o
diff --git a/drivers/net/ethernet/ti/icssg/icss_iep.c b/drivers/net/ethernet/ti/icssg/icss_iep.c
new file mode 100644
index 000000000000..cc0ee113a2c5
--- /dev/null
+++ b/drivers/net/ethernet/ti/icssg/icss_iep.c
@@ -0,0 +1,935 @@
+// SPDX-License-Identifier: GPL-2.0
+
+/* Texas Instruments ICSSG Industrial Ethernet Peripheral (IEP) Driver
+ *
+ * Copyright (C) 2023 Texas Instruments Incorporated - https://www.ti.com
+ *
+ */
+
+#include <linux/bitops.h>
+#include <linux/clk.h>
+#include <linux/err.h>
+#include <linux/io.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_platform.h>
+#include <linux/platform_device.h>
+#include <linux/timekeeping.h>
+#include <linux/interrupt.h>
+#include <linux/of_irq.h>
+
+#include "icss_iep.h"
+
+#define IEP_MAX_DEF_INC		0xf
+#define IEP_MAX_COMPEN_INC		0xfff
+#define IEP_MAX_COMPEN_COUNT	0xffffff
+
+#define IEP_GLOBAL_CFG_CNT_ENABLE	BIT(0)
+#define IEP_GLOBAL_CFG_DEFAULT_INC_MASK		GENMASK(7, 4)
+#define IEP_GLOBAL_CFG_DEFAULT_INC_SHIFT	4
+#define IEP_GLOBAL_CFG_COMPEN_INC_MASK		GENMASK(19, 8)
+#define IEP_GLOBAL_CFG_COMPEN_INC_SHIFT		8
+
+#define IEP_GLOBAL_STATUS_CNT_OVF	BIT(0)
+
+#define CMP_INDEX(sync)			((sync) + 1)
+#define IEP_CMP_CFG_SHADOW_EN		BIT(17)
+#define IEP_CMP_CFG_CMP0_RST_CNT_EN	BIT(0)
+#define IEP_CMP_CFG_CMP_EN(cmp)		(GENMASK(16, 1) & (1 << ((cmp) + 1)))
+
+#define IEP_CMP_STATUS(cmp)		(1 << (cmp))
+
+#define IEP_SYNC_CTRL_SYNC_EN		BIT(0)
+#define IEP_SYNC_CTRL_SYNC_N_EN(n)	(GENMASK(2, 1) & (BIT(1) << (n)))
+
+#define IEP_MIN_CMP	0
+#define IEP_MAX_CMP	15
+
+#define ICSS_IEP_64BIT_COUNTER_SUPPORT		BIT(0)
+#define ICSS_IEP_SLOW_COMPEN_REG_SUPPORT	BIT(1)
+#define ICSS_IEP_SHADOW_MODE_SUPPORT		BIT(2)
+
+#define LATCH_INDEX(ts_index)			((ts_index) + 6)
+#define IEP_CAP_CFG_CAPNR_1ST_EVENT_EN(n)	BIT(LATCH_INDEX(n))
+#define IEP_CAP_CFG_CAPNF_1ST_EVENT_EN(n)	BIT(LATCH_INDEX(n) + 1)
+#define IEP_CAP_CFG_CAP_ASYNC_EN(n)		BIT(LATCH_INDEX(n) + 10)
+
+enum {
+	ICSS_IEP_GLOBAL_CFG_REG,
+	ICSS_IEP_GLOBAL_STATUS_REG,
+	ICSS_IEP_COMPEN_REG,
+	ICSS_IEP_SLOW_COMPEN_REG,
+	ICSS_IEP_COUNT_REG0,
+	ICSS_IEP_COUNT_REG1,
+	ICSS_IEP_CAPTURE_CFG_REG,
+	ICSS_IEP_CAPTURE_STAT_REG,
+
+	ICSS_IEP_CAP6_RISE_REG0,
+	ICSS_IEP_CAP6_RISE_REG1,
+
+	ICSS_IEP_CAP7_RISE_REG0,
+	ICSS_IEP_CAP7_RISE_REG1,
+
+	ICSS_IEP_CMP_CFG_REG,
+	ICSS_IEP_CMP_STAT_REG,
+	ICSS_IEP_CMP0_REG0,
+	ICSS_IEP_CMP0_REG1,
+	ICSS_IEP_CMP1_REG0,
+	ICSS_IEP_CMP1_REG1,
+
+	ICSS_IEP_CMP8_REG0,
+	ICSS_IEP_CMP8_REG1,
+	ICSS_IEP_SYNC_CTRL_REG,
+	ICSS_IEP_SYNC0_STAT_REG,
+	ICSS_IEP_SYNC1_STAT_REG,
+	ICSS_IEP_SYNC_PWIDTH_REG,
+	ICSS_IEP_SYNC0_PERIOD_REG,
+	ICSS_IEP_SYNC1_DELAY_REG,
+	ICSS_IEP_SYNC_START_REG,
+	ICSS_IEP_MAX_REGS,
+};
+
+/**
+ * struct icss_iep_plat_data - Plat data to handle SoC variants
+ * @config: Regmap configuration data
+ * @reg_offs: register offsets to capture offset differences across SoCs
+ * @flags: Flags to represent IEP properties
+ */
+struct icss_iep_plat_data {
+	struct regmap_config *config;
+	u32 reg_offs[ICSS_IEP_MAX_REGS];
+	u32 flags;
+};
+
+struct icss_iep {
+	struct device *dev;
+	void __iomem *base;
+	const struct icss_iep_plat_data *plat_data;
+	struct regmap *map;
+	struct device_node *client_np;
+	unsigned long refclk_freq;
+	int clk_tick_time;	/* one refclk tick time in ns */
+	struct ptp_clock_info ptp_info;
+	struct ptp_clock *ptp_clock;
+	struct mutex ptp_clk_mutex;	/* PHC access serializer */
+	spinlock_t irq_lock; /* CMP IRQ vs icss_iep_ptp_enable access */
+	u32 def_inc;
+	s16 slow_cmp_inc;
+	u32 slow_cmp_count;
+	const struct icss_iep_clockops *ops;
+	void *clockops_data;
+	u32 cycle_time_ns;
+	u32 perout_enabled;
+	bool pps_enabled;
+	int cap_cmp_irq;
+	u64 period;
+	u32 latch_enable;
+};
+
+static u32 icss_iep_readl(struct icss_iep *iep, int reg)
+{
+	return readl(iep->base + iep->plat_data->reg_offs[reg]);
+}
+
+static void icss_iep_writel(struct icss_iep *iep, int reg, u32 val)
+{
+	return writel(val, iep->base + iep->plat_data->reg_offs[reg]);
+}
+
+/**
+ * icss_iep_get_count_hi() - Get the upper 32 bit IEP counter
+ * @iep: Pointer to structure representing IEP.
+ *
+ * Return: upper 32 bit IEP counter
+ */
+int icss_iep_get_count_hi(struct icss_iep *iep)
+{
+	u32 val = 0;
+
+	if (iep && (iep->plat_data->flags & ICSS_IEP_64BIT_COUNTER_SUPPORT))
+		val = icss_iep_readl(iep, ICSS_IEP_COUNT_REG1);
+
+	return val;
+}
+EXPORT_SYMBOL_GPL(icss_iep_get_count_hi);
+
+/**
+ * icss_iep_get_count_low() - Get the lower 32 bit IEP counter
+ * @iep: Pointer to structure representing IEP.
+ *
+ * Return: lower 32 bit IEP counter
+ */
+int icss_iep_get_count_low(struct icss_iep *iep)
+{
+	u32 val = 0;
+
+	if (iep)
+		val = icss_iep_readl(iep, ICSS_IEP_COUNT_REG0);
+
+	return val;
+}
+EXPORT_SYMBOL_GPL(icss_iep_get_count_low);
+
+/**
+ * icss_iep_get_ptp_clock_idx() - Get PTP clock index using IEP driver
+ * @iep: Pointer to structure representing IEP.
+ *
+ * Return: PTP clock index, -1 if not registered
+ */
+int icss_iep_get_ptp_clock_idx(struct icss_iep *iep)
+{
+	if (!iep || !iep->ptp_clock)
+		return -1;
+	return ptp_clock_index(iep->ptp_clock);
+}
+EXPORT_SYMBOL_GPL(icss_iep_get_ptp_clock_idx);
+
+static void icss_iep_set_counter(struct icss_iep *iep, u64 ns)
+{
+	if (iep->plat_data->flags & ICSS_IEP_64BIT_COUNTER_SUPPORT)
+		icss_iep_writel(iep, ICSS_IEP_COUNT_REG1, upper_32_bits(ns));
+	icss_iep_writel(iep, ICSS_IEP_COUNT_REG0, lower_32_bits(ns));
+}
+
+static void icss_iep_update_to_next_boundary(struct icss_iep *iep, u64 start_ns);
+
+static void icss_iep_settime(struct icss_iep *iep, u64 ns)
+{
+	unsigned long flags;
+
+	if (iep->ops && iep->ops->settime) {
+		iep->ops->settime(iep->clockops_data, ns);
+		return;
+	}
+
+	spin_lock_irqsave(&iep->irq_lock, flags);
+	if (iep->pps_enabled || iep->perout_enabled)
+		icss_iep_writel(iep, ICSS_IEP_SYNC_CTRL_REG, 0);
+
+	icss_iep_set_counter(iep, ns);
+
+	if (iep->pps_enabled || iep->perout_enabled) {
+		icss_iep_update_to_next_boundary(iep, ns);
+		icss_iep_writel(iep, ICSS_IEP_SYNC_CTRL_REG,
+				IEP_SYNC_CTRL_SYNC_N_EN(0) |
+				IEP_SYNC_CTRL_SYNC_EN);
+	}
+	spin_unlock_irqrestore(&iep->irq_lock, flags);
+}
+
+static u64 icss_iep_gettime(struct icss_iep *iep,
+			    struct ptp_system_timestamp *sts)
+{
+	u32 ts_hi = 0, ts_lo;
+	unsigned long flags;
+
+	if (iep->ops && iep->ops->gettime)
+		return iep->ops->gettime(iep->clockops_data);
+
+	/* use local_irq_x() to make it work for both RT/non-RT */
+	local_irq_save(flags);
+
+	/* no need to play with hi-lo, hi is latched when lo is read */
+	ptp_read_system_prets(sts);
+	ts_lo = icss_iep_readl(iep, ICSS_IEP_COUNT_REG0);
+	ptp_read_system_postts(sts);
+	if (iep->plat_data->flags & ICSS_IEP_64BIT_COUNTER_SUPPORT)
+		ts_hi = icss_iep_readl(iep, ICSS_IEP_COUNT_REG1);
+
+	local_irq_restore(flags);
+
+	return (u64)ts_lo | (u64)ts_hi << 32;
+}
+
+static void icss_iep_enable(struct icss_iep *iep)
+{
+	regmap_update_bits(iep->map, ICSS_IEP_GLOBAL_CFG_REG,
+			   IEP_GLOBAL_CFG_CNT_ENABLE,
+			   IEP_GLOBAL_CFG_CNT_ENABLE);
+}
+
+static void icss_iep_disable(struct icss_iep *iep)
+{
+	regmap_update_bits(iep->map, ICSS_IEP_GLOBAL_CFG_REG,
+			   IEP_GLOBAL_CFG_CNT_ENABLE,
+			   0);
+}
+
+static void icss_iep_enable_shadow_mode(struct icss_iep *iep)
+{
+	u32 cycle_time;
+	int cmp;
+
+	cycle_time = iep->cycle_time_ns - iep->def_inc;
+
+	icss_iep_disable(iep);
+
+	/* disable shadow mode */
+	regmap_update_bits(iep->map, ICSS_IEP_CMP_CFG_REG,
+			   IEP_CMP_CFG_SHADOW_EN, 0);
+
+	/* enable shadow mode */
+	regmap_update_bits(iep->map, ICSS_IEP_CMP_CFG_REG,
+			   IEP_CMP_CFG_SHADOW_EN, IEP_CMP_CFG_SHADOW_EN);
+
+	/* clear counters */
+	icss_iep_set_counter(iep, 0);
+
+	/* clear overflow status */
+	regmap_update_bits(iep->map, ICSS_IEP_GLOBAL_STATUS_REG,
+			   IEP_GLOBAL_STATUS_CNT_OVF,
+			   IEP_GLOBAL_STATUS_CNT_OVF);
+
+	/* clear compare status */
+	for (cmp = IEP_MIN_CMP; cmp < IEP_MAX_CMP; cmp++) {
+		regmap_update_bits(iep->map, ICSS_IEP_CMP_STAT_REG,
+				   IEP_CMP_STATUS(cmp), IEP_CMP_STATUS(cmp));
+	}
+
+	/* enable reset counter on CMP0 event */
+	regmap_update_bits(iep->map, ICSS_IEP_CMP_CFG_REG,
+			   IEP_CMP_CFG_CMP0_RST_CNT_EN,
+			   IEP_CMP_CFG_CMP0_RST_CNT_EN);
+	/* enable compare */
+	regmap_update_bits(iep->map, ICSS_IEP_CMP_CFG_REG,
+			   IEP_CMP_CFG_CMP_EN(0),
+			   IEP_CMP_CFG_CMP_EN(0));
+
+	/* set CMP0 value to cycle time */
+	regmap_write(iep->map, ICSS_IEP_CMP0_REG0, cycle_time);
+	if (iep->plat_data->flags & ICSS_IEP_64BIT_COUNTER_SUPPORT)
+		regmap_write(iep->map, ICSS_IEP_CMP0_REG1, cycle_time);
+
+	icss_iep_set_counter(iep, 0);
+	icss_iep_enable(iep);
+}
+
+static void icss_iep_set_default_inc(struct icss_iep *iep, u8 def_inc)
+{
+	regmap_update_bits(iep->map, ICSS_IEP_GLOBAL_CFG_REG,
+			   IEP_GLOBAL_CFG_DEFAULT_INC_MASK,
+			   def_inc << IEP_GLOBAL_CFG_DEFAULT_INC_SHIFT);
+}
+
+static void icss_iep_set_compensation_inc(struct icss_iep *iep, u16 compen_inc)
+{
+	struct device *dev = regmap_get_device(iep->map);
+
+	if (compen_inc > IEP_MAX_COMPEN_INC) {
+		dev_err(dev, "%s: too high compensation inc %d\n",
+			__func__, compen_inc);
+		compen_inc = IEP_MAX_COMPEN_INC;
+	}
+
+	regmap_update_bits(iep->map, ICSS_IEP_GLOBAL_CFG_REG,
+			   IEP_GLOBAL_CFG_COMPEN_INC_MASK,
+			   compen_inc << IEP_GLOBAL_CFG_COMPEN_INC_SHIFT);
+}
+
+static void icss_iep_set_compensation_count(struct icss_iep *iep,
+					    u32 compen_count)
+{
+	struct device *dev = regmap_get_device(iep->map);
+
+	if (compen_count > IEP_MAX_COMPEN_COUNT) {
+		dev_err(dev, "%s: too high compensation count %d\n",
+			__func__, compen_count);
+		compen_count = IEP_MAX_COMPEN_COUNT;
+	}
+
+	regmap_write(iep->map, ICSS_IEP_COMPEN_REG, compen_count);
+}
+
+static void icss_iep_set_slow_compensation_count(struct icss_iep *iep,
+						 u32 compen_count)
+{
+	regmap_write(iep->map, ICSS_IEP_SLOW_COMPEN_REG, compen_count);
+}
+
+/* PTP PHC operations */
+static int icss_iep_ptp_adjfine(struct ptp_clock_info *ptp, long scaled_ppm)
+{
+	struct icss_iep *iep = container_of(ptp, struct icss_iep, ptp_info);
+	s32 ppb = scaled_ppm_to_ppb(scaled_ppm);
+	u32 cyc_count;
+	u16 cmp_inc;
+
+	mutex_lock(&iep->ptp_clk_mutex);
+
+	/* ppb is amount of frequency we want to adjust in 1GHz (billion)
+	 * e.g. 100ppb means we need to speed up clock by 100Hz
+	 * i.e. at end of 1 second (1 billion ns) clock time, we should be
+	 * counting 100 more ns.
+	 * We use IEP slow compensation to achieve continuous freq. adjustment.
+	 * There are 2 parts. Cycle time and adjustment per cycle.
+	 * Simplest case would be 1 sec Cycle time. Then adjustment
+	 * pre cycle would be (def_inc + ppb) value.
+	 * Cycle time will have to be chosen based on how worse the ppb is.
+	 * e.g. smaller the ppb, cycle time has to be large.
+	 * The minimum adjustment we can do is +-1ns per cycle so let's
+	 * reduce the cycle time to get 1ns per cycle adjustment.
+	 *	1ppb = 1sec cycle time & 1ns adjust
+	 *	1000ppb = 1/1000 cycle time & 1ns adjust per cycle
+	 */
+
+	if (iep->cycle_time_ns)
+		iep->slow_cmp_inc = iep->clk_tick_time;	/* 4ns adj per cycle */
+	else
+		iep->slow_cmp_inc = 1;	/* 1ns adjust per cycle */
+
+	if (ppb < 0) {
+		iep->slow_cmp_inc = -iep->slow_cmp_inc;
+		ppb = -ppb;
+	}
+
+	cyc_count = NSEC_PER_SEC;		/* 1s cycle time @1GHz */
+	cyc_count /= ppb;		/* cycle time per ppb */
+
+	/* slow_cmp_count is decremented every clock cycle, e.g. @250MHz */
+	if (!iep->cycle_time_ns)
+		cyc_count /= iep->clk_tick_time;
+	iep->slow_cmp_count = cyc_count;
+
+	/* iep->clk_tick_time is def_inc */
+	cmp_inc = iep->clk_tick_time + iep->slow_cmp_inc;
+	icss_iep_set_compensation_inc(iep, cmp_inc);
+	icss_iep_set_slow_compensation_count(iep, iep->slow_cmp_count);
+
+	mutex_unlock(&iep->ptp_clk_mutex);
+
+	return 0;
+}
+
+static int icss_iep_ptp_adjtime(struct ptp_clock_info *ptp, s64 delta)
+{
+	struct icss_iep *iep = container_of(ptp, struct icss_iep, ptp_info);
+	s64 ns;
+
+	mutex_lock(&iep->ptp_clk_mutex);
+	if (iep->ops && iep->ops->adjtime) {
+		iep->ops->adjtime(iep->clockops_data, delta);
+	} else {
+		ns = icss_iep_gettime(iep, NULL);
+		ns += delta;
+		icss_iep_settime(iep, ns);
+	}
+	mutex_unlock(&iep->ptp_clk_mutex);
+
+	return 0;
+}
+
+static int icss_iep_ptp_gettimeex(struct ptp_clock_info *ptp,
+				  struct timespec64 *ts,
+				  struct ptp_system_timestamp *sts)
+{
+	struct icss_iep *iep = container_of(ptp, struct icss_iep, ptp_info);
+	u64 ns;
+
+	mutex_lock(&iep->ptp_clk_mutex);
+	ns = icss_iep_gettime(iep, sts);
+	*ts = ns_to_timespec64(ns);
+	mutex_unlock(&iep->ptp_clk_mutex);
+
+	return 0;
+}
+
+static int icss_iep_ptp_settime(struct ptp_clock_info *ptp,
+				const struct timespec64 *ts)
+{
+	struct icss_iep *iep = container_of(ptp, struct icss_iep, ptp_info);
+	u64 ns;
+
+	mutex_lock(&iep->ptp_clk_mutex);
+	ns = timespec64_to_ns(ts);
+	icss_iep_settime(iep, ns);
+	mutex_unlock(&iep->ptp_clk_mutex);
+
+	return 0;
+}
+
+static void icss_iep_update_to_next_boundary(struct icss_iep *iep, u64 start_ns)
+{
+	u64 ns, p_ns;
+	u32 offset;
+
+	ns = icss_iep_gettime(iep, NULL);
+	if (start_ns < ns)
+		start_ns = ns;
+	p_ns = iep->period;
+	/* Round up to next period boundary */
+	start_ns += p_ns - 1;
+	offset = do_div(start_ns, p_ns);
+	start_ns = start_ns * p_ns;
+	/* If it is too close to update, shift to next boundary */
+	if (p_ns - offset < 10)
+		start_ns += p_ns;
+
+	regmap_write(iep->map, ICSS_IEP_CMP1_REG0, lower_32_bits(start_ns));
+	if (iep->plat_data->flags & ICSS_IEP_64BIT_COUNTER_SUPPORT)
+		regmap_write(iep->map, ICSS_IEP_CMP1_REG1, upper_32_bits(start_ns));
+}
+
+static int icss_iep_perout_enable_hw(struct icss_iep *iep,
+				     struct ptp_perout_request *req, int on)
+{
+	int ret;
+	u64 cmp;
+
+	if (iep->ops && iep->ops->perout_enable) {
+		ret = iep->ops->perout_enable(iep->clockops_data, req, on, &cmp);
+		if (ret)
+			return ret;
+
+		if (on) {
+			/* Configure CMP */
+			regmap_write(iep->map, ICSS_IEP_CMP1_REG0, lower_32_bits(cmp));
+			if (iep->plat_data->flags & ICSS_IEP_64BIT_COUNTER_SUPPORT)
+				regmap_write(iep->map, ICSS_IEP_CMP1_REG1, upper_32_bits(cmp));
+			/* Configure SYNC, 1ms pulse width */
+			regmap_write(iep->map, ICSS_IEP_SYNC_PWIDTH_REG, 1000000);
+			regmap_write(iep->map, ICSS_IEP_SYNC0_PERIOD_REG, 0);
+			regmap_write(iep->map, ICSS_IEP_SYNC_START_REG, 0);
+			regmap_write(iep->map, ICSS_IEP_SYNC_CTRL_REG, 0); /* one-shot mode */
+			/* Enable CMP 1 */
+			regmap_update_bits(iep->map, ICSS_IEP_CMP_CFG_REG,
+					   IEP_CMP_CFG_CMP_EN(1), IEP_CMP_CFG_CMP_EN(1));
+		} else {
+			/* Disable CMP 1 */
+			regmap_update_bits(iep->map, ICSS_IEP_CMP_CFG_REG,
+					   IEP_CMP_CFG_CMP_EN(1), 0);
+
+			/* clear regs */
+			regmap_write(iep->map, ICSS_IEP_CMP1_REG0, 0);
+			if (iep->plat_data->flags & ICSS_IEP_64BIT_COUNTER_SUPPORT)
+				regmap_write(iep->map, ICSS_IEP_CMP1_REG1, 0);
+		}
+	} else {
+		if (on) {
+			u64 start_ns;
+
+			iep->period = ((u64)req->period.sec * NSEC_PER_SEC) +
+				      req->period.nsec;
+			start_ns = ((u64)req->period.sec * NSEC_PER_SEC)
+				   + req->period.nsec;
+			icss_iep_update_to_next_boundary(iep, start_ns);
+
+			/* Enable Sync in single shot mode  */
+			regmap_write(iep->map, ICSS_IEP_SYNC_CTRL_REG,
+				     IEP_SYNC_CTRL_SYNC_N_EN(0) | IEP_SYNC_CTRL_SYNC_EN);
+			/* Enable CMP 1 */
+			regmap_update_bits(iep->map, ICSS_IEP_CMP_CFG_REG,
+					   IEP_CMP_CFG_CMP_EN(1), IEP_CMP_CFG_CMP_EN(1));
+		} else {
+			/* Disable CMP 1 */
+			regmap_update_bits(iep->map, ICSS_IEP_CMP_CFG_REG,
+					   IEP_CMP_CFG_CMP_EN(1), 0);
+
+			/* clear CMP regs */
+			regmap_write(iep->map, ICSS_IEP_CMP1_REG0, 0);
+			if (iep->plat_data->flags & ICSS_IEP_64BIT_COUNTER_SUPPORT)
+				regmap_write(iep->map, ICSS_IEP_CMP1_REG1, 0);
+
+			/* Disable sync */
+			regmap_write(iep->map, ICSS_IEP_SYNC_CTRL_REG, 0);
+		}
+	}
+
+	return 0;
+}
+
+static int icss_iep_perout_enable(struct icss_iep *iep,
+				  struct ptp_perout_request *req, int on)
+{
+	unsigned long flags;
+	int ret = 0;
+
+	mutex_lock(&iep->ptp_clk_mutex);
+
+	if (iep->pps_enabled) {
+		ret = -EBUSY;
+		goto exit;
+	}
+
+	if (iep->perout_enabled == !!on)
+		goto exit;
+
+	spin_lock_irqsave(&iep->irq_lock, flags);
+	ret = icss_iep_perout_enable_hw(iep, req, on);
+	if (!ret)
+		iep->perout_enabled = !!on;
+	spin_unlock_irqrestore(&iep->irq_lock, flags);
+
+exit:
+	mutex_unlock(&iep->ptp_clk_mutex);
+
+	return ret;
+}
+
+static int icss_iep_pps_enable(struct icss_iep *iep, int on)
+{
+	struct ptp_clock_request rq;
+	struct timespec64 ts;
+	unsigned long flags;
+	int ret = 0;
+	u64 ns;
+
+	mutex_lock(&iep->ptp_clk_mutex);
+
+	if (iep->perout_enabled) {
+		ret = -EBUSY;
+		goto exit;
+	}
+
+	if (iep->pps_enabled == !!on)
+		goto exit;
+
+	spin_lock_irqsave(&iep->irq_lock, flags);
+
+	rq.perout.index = 0;
+	if (on) {
+		ns = icss_iep_gettime(iep, NULL);
+		ts = ns_to_timespec64(ns);
+		rq.perout.period.sec = 1;
+		rq.perout.period.nsec = 0;
+		rq.perout.start.sec = ts.tv_sec + 2;
+		rq.perout.start.nsec = 0;
+		ret = icss_iep_perout_enable_hw(iep, &rq.perout, on);
+	} else {
+		ret = icss_iep_perout_enable_hw(iep, &rq.perout, on);
+	}
+
+	if (!ret)
+		iep->pps_enabled = !!on;
+
+	spin_unlock_irqrestore(&iep->irq_lock, flags);
+
+exit:
+	mutex_unlock(&iep->ptp_clk_mutex);
+
+	return ret;
+}
+
+static int icss_iep_extts_enable(struct icss_iep *iep, u32 index, int on)
+{
+	u32 val, cap, ret = 0;
+
+	mutex_lock(&iep->ptp_clk_mutex);
+
+	if (iep->ops && iep->ops->extts_enable) {
+		ret = iep->ops->extts_enable(iep->clockops_data, index, on);
+		goto exit;
+	}
+
+	if (!!(iep->latch_enable & BIT(index)) == !!on)
+		goto exit;
+
+	regmap_read(iep->map, ICSS_IEP_CAPTURE_CFG_REG, &val);
+	cap = IEP_CAP_CFG_CAP_ASYNC_EN(index) | IEP_CAP_CFG_CAPNR_1ST_EVENT_EN(index);
+	if (on) {
+		val |= cap;
+		iep->latch_enable |= BIT(index);
+	} else {
+		val &= ~cap;
+		iep->latch_enable &= ~BIT(index);
+	}
+	regmap_write(iep->map, ICSS_IEP_CAPTURE_CFG_REG, val);
+
+exit:
+	mutex_unlock(&iep->ptp_clk_mutex);
+
+	return ret;
+}
+
+static int icss_iep_ptp_enable(struct ptp_clock_info *ptp,
+			       struct ptp_clock_request *rq, int on)
+{
+	struct icss_iep *iep = container_of(ptp, struct icss_iep, ptp_info);
+
+	switch (rq->type) {
+	case PTP_CLK_REQ_PEROUT:
+		return icss_iep_perout_enable(iep, &rq->perout, on);
+	case PTP_CLK_REQ_PPS:
+		return icss_iep_pps_enable(iep, on);
+	case PTP_CLK_REQ_EXTTS:
+		return icss_iep_extts_enable(iep, rq->extts.index, on);
+	default:
+		break;
+	}
+
+	return -EOPNOTSUPP;
+}
+
+static struct ptp_clock_info icss_iep_ptp_info = {
+	.owner		= THIS_MODULE,
+	.name		= "ICSS IEP timer",
+	.max_adj	= 10000000,
+	.adjfine	= icss_iep_ptp_adjfine,
+	.adjtime	= icss_iep_ptp_adjtime,
+	.gettimex64	= icss_iep_ptp_gettimeex,
+	.settime64	= icss_iep_ptp_settime,
+	.enable		= icss_iep_ptp_enable,
+};
+
+struct icss_iep *icss_iep_get_idx(struct device_node *np, int idx)
+{
+	struct platform_device *pdev;
+	struct device_node *iep_np;
+	struct icss_iep *iep;
+
+	iep_np = of_parse_phandle(np, "ti,iep", idx);
+	if (!iep_np || !of_device_is_available(iep_np))
+		return ERR_PTR(-ENODEV);
+
+	pdev = of_find_device_by_node(iep_np);
+	of_node_put(iep_np);
+
+	if (!pdev)
+		/* probably IEP not yet probed */
+		return ERR_PTR(-EPROBE_DEFER);
+
+	iep = platform_get_drvdata(pdev);
+	if (!iep)
+		return ERR_PTR(-EPROBE_DEFER);
+
+	device_lock(iep->dev);
+	if (iep->client_np) {
+		device_unlock(iep->dev);
+		dev_err(iep->dev, "IEP is already acquired by %s",
+			iep->client_np->name);
+		return ERR_PTR(-EBUSY);
+	}
+	iep->client_np = np;
+	device_unlock(iep->dev);
+	get_device(iep->dev);
+
+	return iep;
+}
+EXPORT_SYMBOL_GPL(icss_iep_get_idx);
+
+struct icss_iep *icss_iep_get(struct device_node *np)
+{
+	return icss_iep_get_idx(np, 0);
+}
+EXPORT_SYMBOL_GPL(icss_iep_get);
+
+void icss_iep_put(struct icss_iep *iep)
+{
+	device_lock(iep->dev);
+	iep->client_np = NULL;
+	device_unlock(iep->dev);
+	put_device(iep->dev);
+}
+EXPORT_SYMBOL_GPL(icss_iep_put);
+
+int icss_iep_init(struct icss_iep *iep, const struct icss_iep_clockops *clkops,
+		  void *clockops_data, u32 cycle_time_ns)
+{
+	int ret = 0;
+
+	iep->cycle_time_ns = cycle_time_ns;
+	iep->clk_tick_time = iep->def_inc;
+	iep->ops = clkops;
+	iep->clockops_data = clockops_data;
+	icss_iep_set_default_inc(iep, iep->def_inc);
+	icss_iep_set_compensation_inc(iep, iep->def_inc);
+	icss_iep_set_compensation_count(iep, 0);
+	regmap_write(iep->map, ICSS_IEP_SYNC_PWIDTH_REG, iep->refclk_freq / 10); /* 100 ms pulse */
+	regmap_write(iep->map, ICSS_IEP_SYNC0_PERIOD_REG, 0);
+	if (iep->plat_data->flags & ICSS_IEP_SLOW_COMPEN_REG_SUPPORT)
+		icss_iep_set_slow_compensation_count(iep, 0);
+
+	if (!(iep->plat_data->flags & ICSS_IEP_64BIT_COUNTER_SUPPORT) ||
+	    !(iep->plat_data->flags & ICSS_IEP_SLOW_COMPEN_REG_SUPPORT))
+		goto skip_perout;
+
+	if (iep->ops && iep->ops->perout_enable) {
+		iep->ptp_info.n_per_out = 1;
+		iep->ptp_info.pps = 1;
+	}
+
+	if (iep->ops && iep->ops->extts_enable)
+		iep->ptp_info.n_ext_ts = 2;
+
+skip_perout:
+	if (cycle_time_ns)
+		icss_iep_enable_shadow_mode(iep);
+	else
+		icss_iep_enable(iep);
+	icss_iep_settime(iep, ktime_get_real_ns());
+
+	iep->ptp_clock = ptp_clock_register(&iep->ptp_info, iep->dev);
+	if (IS_ERR(iep->ptp_clock)) {
+		ret = PTR_ERR(iep->ptp_clock);
+		iep->ptp_clock = NULL;
+		dev_err(iep->dev, "Failed to register ptp clk %d\n", ret);
+	}
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(icss_iep_init);
+
+int icss_iep_exit(struct icss_iep *iep)
+{
+	if (iep->ptp_clock) {
+		ptp_clock_unregister(iep->ptp_clock);
+		iep->ptp_clock = NULL;
+	}
+	icss_iep_disable(iep);
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(icss_iep_exit);
+
+static const struct of_device_id icss_iep_of_match[];
+
+static int icss_iep_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct icss_iep *iep;
+	struct clk *iep_clk;
+
+	iep = devm_kzalloc(dev, sizeof(*iep), GFP_KERNEL);
+	if (!iep)
+		return -ENOMEM;
+
+	iep->dev = dev;
+	iep->base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(iep->base))
+		return -ENODEV;
+
+	iep_clk = devm_clk_get(dev, NULL);
+	if (IS_ERR(iep_clk))
+		return PTR_ERR(iep_clk);
+
+	iep->refclk_freq = clk_get_rate(iep_clk);
+
+	iep->def_inc = NSEC_PER_SEC / iep->refclk_freq;	/* ns per clock tick */
+	if (iep->def_inc > IEP_MAX_DEF_INC) {
+		dev_err(dev, "Failed to set def_inc %d.  IEP_clock is too slow to be supported\n",
+			iep->def_inc);
+		return -EINVAL;
+	}
+
+	iep->plat_data = of_device_get_match_data(dev);
+	if (!iep->plat_data)
+		return -EINVAL;
+
+	iep->map = devm_regmap_init(dev, NULL, iep, iep->plat_data->config);
+	if (IS_ERR(iep->map)) {
+		dev_err(dev, "Failed to create regmap for IEP %ld\n",
+			PTR_ERR(iep->map));
+		return PTR_ERR(iep->map);
+	}
+
+	iep->ptp_info = icss_iep_ptp_info;
+	mutex_init(&iep->ptp_clk_mutex);
+	spin_lock_init(&iep->irq_lock);
+	dev_set_drvdata(dev, iep);
+	icss_iep_disable(iep);
+
+	return 0;
+}
+
+static bool am654_icss_iep_valid_reg(struct device *dev, unsigned int reg)
+{
+	switch (reg) {
+	case ICSS_IEP_GLOBAL_CFG_REG ... ICSS_IEP_SYNC_START_REG:
+		return true;
+	default:
+		return false;
+	}
+
+	return false;
+}
+
+static int icss_iep_regmap_write(void *context, unsigned int reg,
+				 unsigned int val)
+{
+	struct icss_iep *iep = context;
+
+	writel(val, iep->base + iep->plat_data->reg_offs[reg]);
+
+	return 0;
+}
+
+static int icss_iep_regmap_read(void *context, unsigned int reg,
+				unsigned int *val)
+{
+	struct icss_iep *iep = context;
+
+	*val = readl(iep->base + iep->plat_data->reg_offs[reg]);
+
+	return 0;
+}
+
+static struct regmap_config am654_icss_iep_regmap_config = {
+	.name = "icss iep",
+	.reg_stride = 1,
+	.reg_write = icss_iep_regmap_write,
+	.reg_read = icss_iep_regmap_read,
+	.writeable_reg = am654_icss_iep_valid_reg,
+	.readable_reg = am654_icss_iep_valid_reg,
+	.fast_io = 1,
+};
+
+static const struct icss_iep_plat_data am654_icss_iep_plat_data = {
+	.flags = ICSS_IEP_64BIT_COUNTER_SUPPORT |
+		 ICSS_IEP_SLOW_COMPEN_REG_SUPPORT |
+		 ICSS_IEP_SHADOW_MODE_SUPPORT,
+	.reg_offs = {
+		[ICSS_IEP_GLOBAL_CFG_REG] = 0x00,
+		[ICSS_IEP_COMPEN_REG] = 0x08,
+		[ICSS_IEP_SLOW_COMPEN_REG] = 0x0C,
+		[ICSS_IEP_COUNT_REG0] = 0x10,
+		[ICSS_IEP_COUNT_REG1] = 0x14,
+		[ICSS_IEP_CAPTURE_CFG_REG] = 0x18,
+		[ICSS_IEP_CAPTURE_STAT_REG] = 0x1c,
+
+		[ICSS_IEP_CAP6_RISE_REG0] = 0x50,
+		[ICSS_IEP_CAP6_RISE_REG1] = 0x54,
+
+		[ICSS_IEP_CAP7_RISE_REG0] = 0x60,
+		[ICSS_IEP_CAP7_RISE_REG1] = 0x64,
+
+		[ICSS_IEP_CMP_CFG_REG] = 0x70,
+		[ICSS_IEP_CMP_STAT_REG] = 0x74,
+		[ICSS_IEP_CMP0_REG0] = 0x78,
+		[ICSS_IEP_CMP0_REG1] = 0x7c,
+		[ICSS_IEP_CMP1_REG0] = 0x80,
+		[ICSS_IEP_CMP1_REG1] = 0x84,
+
+		[ICSS_IEP_CMP8_REG0] = 0xc0,
+		[ICSS_IEP_CMP8_REG1] = 0xc4,
+		[ICSS_IEP_SYNC_CTRL_REG] = 0x180,
+		[ICSS_IEP_SYNC0_STAT_REG] = 0x188,
+		[ICSS_IEP_SYNC1_STAT_REG] = 0x18c,
+		[ICSS_IEP_SYNC_PWIDTH_REG] = 0x190,
+		[ICSS_IEP_SYNC0_PERIOD_REG] = 0x194,
+		[ICSS_IEP_SYNC1_DELAY_REG] = 0x198,
+		[ICSS_IEP_SYNC_START_REG] = 0x19c,
+	},
+	.config = &am654_icss_iep_regmap_config,
+};
+
+static const struct of_device_id icss_iep_of_match[] = {
+	{
+		.compatible = "ti,am654-icss-iep",
+		.data = &am654_icss_iep_plat_data,
+	},
+	{},
+};
+MODULE_DEVICE_TABLE(of, icss_iep_of_match);
+
+static struct platform_driver icss_iep_driver = {
+	.driver = {
+		.name = "icss-iep",
+		.of_match_table = of_match_ptr(icss_iep_of_match),
+	},
+	.probe = icss_iep_probe,
+};
+module_platform_driver(icss_iep_driver);
+
+MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION("TI ICSS IEP driver");
+MODULE_AUTHOR("Roger Quadros <rogerq@ti.com>");
+MODULE_AUTHOR("Md Danish Anwar <danishanwar@ti.com>");
diff --git a/drivers/net/ethernet/ti/icssg/icss_iep.h b/drivers/net/ethernet/ti/icssg/icss_iep.h
new file mode 100644
index 000000000000..4f9d4b6bb5d1
--- /dev/null
+++ b/drivers/net/ethernet/ti/icssg/icss_iep.h
@@ -0,0 +1,38 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/* Texas Instruments ICSSG Industrial Ethernet Peripheral (IEP) Driver
+ *
+ * Copyright (C) 2023 Texas Instruments Incorporated - https://www.ti.com/
+ *
+ */
+
+#ifndef __NET_TI_ICSS_IEP_H
+#define __NET_TI_ICSS_IEP_H
+
+#include <linux/mutex.h>
+#include <linux/ptp_clock_kernel.h>
+#include <linux/regmap.h>
+
+struct icss_iep;
+
+/* Firmware specific clock operations */
+struct icss_iep_clockops {
+	void (*settime)(void *clockops_data, u64 ns);
+	void (*adjtime)(void *clockops_data, s64 delta);
+	u64 (*gettime)(void *clockops_data);
+	int (*perout_enable)(void *clockops_data,
+			     struct ptp_perout_request *req, int on,
+			     u64 *cmp);
+	int (*extts_enable)(void *clockops_data, u32 index, int on);
+};
+
+struct icss_iep *icss_iep_get(struct device_node *np);
+struct icss_iep *icss_iep_get_idx(struct device_node *np, int idx);
+void icss_iep_put(struct icss_iep *iep);
+int icss_iep_init(struct icss_iep *iep, const struct icss_iep_clockops *clkops,
+		  void *clockops_data, u32 cycle_time_ns);
+int icss_iep_exit(struct icss_iep *iep);
+int icss_iep_get_count_low(struct icss_iep *iep);
+int icss_iep_get_count_hi(struct icss_iep *iep);
+int icss_iep_get_ptp_clock_idx(struct icss_iep *iep);
+
+#endif /* __NET_TI_ICSS_IEP_H */
-- 
2.34.1

