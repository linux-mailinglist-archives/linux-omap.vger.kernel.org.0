Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4A9E37A2F32
	for <lists+linux-omap@lfdr.de>; Sat, 16 Sep 2023 12:06:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239013AbjIPKF5 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sat, 16 Sep 2023 06:05:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56468 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238948AbjIPKFe (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sat, 16 Sep 2023 06:05:34 -0400
Received: from mail.andi.de1.cc (mail.andi.de1.cc [IPv6:2a02:c205:3004:2154::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7EF62CDA;
        Sat, 16 Sep 2023 03:05:27 -0700 (PDT)
Received: from p200300ccff1003001a3da2fffebfd33a.dip0.t-ipconnect.de ([2003:cc:ff10:300:1a3d:a2ff:febf:d33a] helo=aktux)
        by mail.andi.de1.cc with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <andreas@kemnade.info>)
        id 1qhSB0-003pjT-W4; Sat, 16 Sep 2023 12:05:22 +0200
Received: from andi by aktux with local (Exim 4.96)
        (envelope-from <andreas@kemnade.info>)
        id 1qhSB0-006vKz-0r;
        Sat, 16 Sep 2023 12:05:22 +0200
From:   Andreas Kemnade <andreas@kemnade.info>
To:     dmitry.torokhov@gmail.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        lee@kernel.org, bcousson@baylibre.com, tony@atomide.com,
        mturquette@baylibre.com, sboyd@kernel.org, andreas@kemnade.info,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-clk@vger.kernel.org
Subject: [PATCH v4 4/5] clk: twl: add clock driver for TWL6032
Date:   Sat, 16 Sep 2023 12:05:14 +0200
Message-Id: <20230916100515.1650336-5-andreas@kemnade.info>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230916100515.1650336-1-andreas@kemnade.info>
References: <20230916100515.1650336-1-andreas@kemnade.info>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

The TWL6032 has some clock outputs which are controlled like
fixed-voltage regulators, in some drivers for these chips
found in the wild, just the regulator api is abused for controlling
them, so simply use something similar to the regulator functions.
Due to a lack of hardware available for testing, leave out the
TWL6030-specific part of those functions.

Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
---
 drivers/clk/Kconfig   |   9 ++
 drivers/clk/Makefile  |   1 +
 drivers/clk/clk-twl.c | 197 ++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 207 insertions(+)
 create mode 100644 drivers/clk/clk-twl.c

diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
index c30099866174d..3944f081ebade 100644
--- a/drivers/clk/Kconfig
+++ b/drivers/clk/Kconfig
@@ -277,6 +277,15 @@ config COMMON_CLK_S2MPS11
 	  clock. These multi-function devices have two (S2MPS14) or three
 	  (S2MPS11, S5M8767) fixed-rate oscillators, clocked at 32KHz each.
 
+config CLK_TWL
+	tristate "Clock driver for the TWL PMIC family"
+	depends on TWL4030_CORE
+	help
+	  Enable support for controlling the clock resources on TWL family
+	  PMICs. These devices have some 32K clock outputs which can be
+	  controlled by software. For now, only the TWL6032 clocks are
+	  supported.
+
 config CLK_TWL6040
 	tristate "External McPDM functional clock from twl6040"
 	depends on TWL6040_CORE
diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
index 18969cbd4bb1e..86e46adcb619c 100644
--- a/drivers/clk/Makefile
+++ b/drivers/clk/Makefile
@@ -72,6 +72,7 @@ obj-$(CONFIG_COMMON_CLK_STM32H7)	+= clk-stm32h7.o
 obj-$(CONFIG_COMMON_CLK_STM32MP157)	+= clk-stm32mp1.o
 obj-$(CONFIG_COMMON_CLK_TPS68470)      += clk-tps68470.o
 obj-$(CONFIG_CLK_TWL6040)		+= clk-twl6040.o
+obj-$(CONFIG_CLK_TWL)			+= clk-twl.o
 obj-$(CONFIG_ARCH_VT8500)		+= clk-vt8500.o
 obj-$(CONFIG_COMMON_CLK_RS9_PCIE)	+= clk-renesas-pcie.o
 obj-$(CONFIG_COMMON_CLK_SI521XX)	+= clk-si521xx.o
diff --git a/drivers/clk/clk-twl.c b/drivers/clk/clk-twl.c
new file mode 100644
index 0000000000000..eab9d3c8ed8ae
--- /dev/null
+++ b/drivers/clk/clk-twl.c
@@ -0,0 +1,197 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Clock driver for twl device.
+ *
+ * inspired by the driver for the Palmas device
+ */
+
+#include <linux/clk-provider.h>
+#include <linux/mfd/twl.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/slab.h>
+
+#define VREG_STATE              2
+#define TWL6030_CFG_STATE_OFF   0x00
+#define TWL6030_CFG_STATE_ON    0x01
+#define TWL6030_CFG_STATE_MASK  0x03
+
+struct twl_clock_info {
+	struct device *dev;
+	u8 base;
+	struct clk_hw hw;
+};
+
+static inline int
+twlclk_read(struct twl_clock_info *info, unsigned int slave_subgp,
+	    unsigned int offset)
+{
+	u8 value;
+	int status;
+
+	status = twl_i2c_read_u8(slave_subgp, &value,
+				 info->base + offset);
+	return (status < 0) ? status : value;
+}
+
+static inline int
+twlclk_write(struct twl_clock_info *info, unsigned int slave_subgp,
+	     unsigned int offset, u8 value)
+{
+	return twl_i2c_write_u8(slave_subgp, value,
+				info->base + offset);
+}
+
+static inline struct twl_clock_info *to_twl_clks_info(struct clk_hw *hw)
+{
+	return container_of(hw, struct twl_clock_info, hw);
+}
+
+static unsigned long twl_clks_recalc_rate(struct clk_hw *hw,
+					  unsigned long parent_rate)
+{
+	return 32768;
+}
+
+static int twl6032_clks_prepare(struct clk_hw *hw)
+{
+	struct twl_clock_info *cinfo = to_twl_clks_info(hw);
+	int ret;
+
+	ret = twlclk_write(cinfo, TWL_MODULE_PM_RECEIVER, VREG_STATE,
+			   TWL6030_CFG_STATE_ON);
+	if (ret < 0)
+		dev_err(cinfo->dev, "clk prepare failed\n");
+
+	return ret;
+}
+
+static void twl6032_clks_unprepare(struct clk_hw *hw)
+{
+	struct twl_clock_info *cinfo = to_twl_clks_info(hw);
+	int ret;
+
+	ret = twlclk_write(cinfo, TWL_MODULE_PM_RECEIVER, VREG_STATE,
+			   TWL6030_CFG_STATE_OFF);
+	if (ret < 0)
+		dev_err(cinfo->dev, "clk unprepare failed\n");
+}
+
+static int twl6032_clks_is_prepared(struct clk_hw *hw)
+{
+	struct twl_clock_info *cinfo = to_twl_clks_info(hw);
+	int val;
+
+	val = twlclk_read(cinfo, TWL_MODULE_PM_RECEIVER, VREG_STATE);
+	if (val < 0) {
+		dev_err(cinfo->dev, "clk read failed\n");
+		return val;
+	}
+
+	val &= TWL6030_CFG_STATE_MASK;
+
+	return val == TWL6030_CFG_STATE_ON;
+}
+
+static const struct clk_ops twl6032_clks_ops = {
+	.prepare	= twl6032_clks_prepare,
+	.unprepare	= twl6032_clks_unprepare,
+	.is_prepared	= twl6032_clks_is_prepared,
+	.recalc_rate	= twl_clks_recalc_rate,
+};
+
+struct twl_clks_data {
+	struct clk_init_data init;
+	u8 base;
+};
+
+static const struct twl_clks_data twl6032_clks[] = {
+	{
+		.init = {
+			.name = "clk32kg",
+			.ops = &twl6032_clks_ops,
+			.flags = CLK_IGNORE_UNUSED,
+		},
+		.base = 0x8C,
+	},
+	{
+		.init = {
+			.name = "clk32kaudio",
+			.ops = &twl6032_clks_ops,
+			.flags = CLK_IGNORE_UNUSED,
+		},
+		.base = 0x8F,
+	},
+	{
+		/* sentinel */
+	}
+};
+
+static int twl_clks_probe(struct platform_device *pdev)
+{
+	struct clk_hw_onecell_data *clk_data;
+	const struct twl_clks_data *hw_data;
+
+	struct twl_clock_info *cinfo;
+	int ret;
+	int i;
+	int count;
+
+	hw_data = twl6032_clks;
+	for (count = 0; hw_data[count].init.name; count++)
+		;
+
+	clk_data = devm_kzalloc(&pdev->dev,
+				struct_size(clk_data, hws, count),
+				GFP_KERNEL);
+	if (!clk_data)
+		return -ENOMEM;
+
+	clk_data->num = count;
+	cinfo = devm_kcalloc(&pdev->dev, count, sizeof(*cinfo), GFP_KERNEL);
+	if (!cinfo)
+		return -ENOMEM;
+
+	for (i = 0; i < count; i++) {
+		cinfo[i].base = hw_data[i].base;
+		cinfo[i].dev = &pdev->dev;
+		cinfo[i].hw.init = &hw_data[i].init;
+		ret = devm_clk_hw_register(&pdev->dev, &cinfo[i].hw);
+		if (ret) {
+			return dev_err_probe(&pdev->dev, ret,
+					     "Fail to register clock %s\n",
+					     hw_data[i].init.name);
+		}
+		clk_data->hws[i] = &cinfo[i].hw;
+	}
+
+	ret = devm_of_clk_add_hw_provider(&pdev->dev,
+					  of_clk_hw_onecell_get, clk_data);
+	if (ret < 0)
+		return dev_err_probe(&pdev->dev, ret,
+				     "Fail to add clock driver\n");
+
+	return 0;
+}
+
+static const struct platform_device_id twl_clks_id[] = {
+	{
+		.name = "twl6032-clk",
+	}, {
+		/* sentinel */
+	}
+};
+MODULE_DEVICE_TABLE(platform, twl_clks_id);
+
+static struct platform_driver twl_clks_driver = {
+	.driver = {
+		.name = "twl-clk",
+	},
+	.probe = twl_clks_probe,
+	.id_table = twl_clks_id,
+};
+
+module_platform_driver(twl_clks_driver);
+
+MODULE_DESCRIPTION("Clock driver for TWL Series Devices");
+MODULE_LICENSE("GPL");
-- 
2.39.2

