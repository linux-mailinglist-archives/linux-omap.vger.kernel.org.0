Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8E8E85F9150
	for <lists+linux-omap@lfdr.de>; Mon, 10 Oct 2022 00:31:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232467AbiJIWbI (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sun, 9 Oct 2022 18:31:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40308 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232586AbiJIW3z (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sun, 9 Oct 2022 18:29:55 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7928A3BC63;
        Sun,  9 Oct 2022 15:19:32 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 45CFA60C27;
        Sun,  9 Oct 2022 22:19:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48997C433C1;
        Sun,  9 Oct 2022 22:19:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1665353969;
        bh=8gOo3oW9vbMwVC1phBvluh+2GsFug/dUKDy82yK4Na4=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Q1UfCM9Pd9sSYE+waKIONzxwr8KcAGKLW0JT8nCehgp4Ykp2LmE1u7dOjQiUXNL4Q
         leptgiTLqzhE2lyG9NvuwAPE/oJq8E7RqlsOoideeXTzlEqKb0VvQw5JxfpKM1hhSS
         Z3GgPhYnFt07XWNffAaNZ4RRzXmg+MrFTVY/MlRoAUVuNkByLKScnnRfvGKX6O/tNa
         2JeGN0fylqTxiVumK0g9LhypzwVGtJDA1jdOvQ1X/EOsGM9tHSscsrwscpF0peHAP2
         E52ekeKKKh12dftSw7J8bZDDF57SLWsQ82m+6S7ACQC/NIQRZYKz+MBrU40wZZfz/+
         mcmFu//yWWGlA==
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Ravi Gunasekaran <r-gunasekaran@ti.com>,
        kernel test robot <lkp@intel.com>,
        Andrew Lunn <andrew@lunn.ch>,
        "David S . Miller" <davem@davemloft.net>,
        Sasha Levin <sashal@kernel.org>, edumazet@google.com,
        kuba@kernel.org, pabeni@redhat.com, gustavoars@kernel.org,
        chi.minghao@zte.com.cn, linux-omap@vger.kernel.org,
        netdev@vger.kernel.org
Subject: [PATCH AUTOSEL 5.15 05/46] net: ethernet: ti: davinci_mdio: Add workaround for errata i2329
Date:   Sun,  9 Oct 2022 18:18:30 -0400
Message-Id: <20221009221912.1217372-5-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221009221912.1217372-1-sashal@kernel.org>
References: <20221009221912.1217372-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

From: Ravi Gunasekaran <r-gunasekaran@ti.com>

[ Upstream commit d04807b80691c6041ca8e3dcf1870d1bf1082c22 ]

On the CPSW and ICSS peripherals, there is a possibility that the MDIO
interface returns corrupt data on MDIO reads or writes incorrect data
on MDIO writes. There is also a possibility for the MDIO interface to
become unavailable until the next peripheral reset.

The workaround is to configure the MDIO in manual mode and disable the
MDIO state machine and emulate the MDIO protocol by reading and writing
appropriate fields in MDIO_MANUAL_IF_REG register of the MDIO controller
to manipulate the MDIO clock and data pins.

More details about the errata i2329 and the workaround is available in:
https://www.ti.com/lit/er/sprz487a/sprz487a.pdf

Add implementation to disable MDIO state machine, configure MDIO in manual
mode and achieve MDIO read and writes via MDIO Bitbanging

Signed-off-by: Ravi Gunasekaran <r-gunasekaran@ti.com>
Reported-by: kernel test robot <lkp@intel.com>
Reviewed-by: Andrew Lunn <andrew@lunn.ch>
Signed-off-by: David S. Miller <davem@davemloft.net>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/net/ethernet/ti/davinci_mdio.c | 242 +++++++++++++++++++++++--
 1 file changed, 231 insertions(+), 11 deletions(-)

diff --git a/drivers/net/ethernet/ti/davinci_mdio.c b/drivers/net/ethernet/ti/davinci_mdio.c
index a4efd5e35158..995633e1ec5e 100644
--- a/drivers/net/ethernet/ti/davinci_mdio.c
+++ b/drivers/net/ethernet/ti/davinci_mdio.c
@@ -26,6 +26,8 @@
 #include <linux/of_device.h>
 #include <linux/of_mdio.h>
 #include <linux/pinctrl/consumer.h>
+#include <linux/mdio-bitbang.h>
+#include <linux/sys_soc.h>
 
 /*
  * This timeout definition is a worst-case ultra defensive measure against
@@ -41,6 +43,7 @@
 
 struct davinci_mdio_of_param {
 	int autosuspend_delay_ms;
+	bool manual_mode;
 };
 
 struct davinci_mdio_regs {
@@ -49,6 +52,15 @@ struct davinci_mdio_regs {
 #define CONTROL_IDLE		BIT(31)
 #define CONTROL_ENABLE		BIT(30)
 #define CONTROL_MAX_DIV		(0xffff)
+#define CONTROL_CLKDIV		GENMASK(15, 0)
+
+#define MDIO_MAN_MDCLK_O	BIT(2)
+#define MDIO_MAN_OE		BIT(1)
+#define MDIO_MAN_PIN		BIT(0)
+#define MDIO_MANUALMODE		BIT(31)
+
+#define MDIO_PIN               0
+
 
 	u32	alive;
 	u32	link;
@@ -59,7 +71,9 @@ struct davinci_mdio_regs {
 	u32	userintmasked;
 	u32	userintmaskset;
 	u32	userintmaskclr;
-	u32	__reserved_1[20];
+	u32	manualif;
+	u32	poll;
+	u32	__reserved_1[18];
 
 	struct {
 		u32	access;
@@ -79,6 +93,7 @@ static const struct mdio_platform_data default_pdata = {
 
 struct davinci_mdio_data {
 	struct mdio_platform_data pdata;
+	struct mdiobb_ctrl bb_ctrl;
 	struct davinci_mdio_regs __iomem *regs;
 	struct clk	*clk;
 	struct device	*dev;
@@ -90,6 +105,7 @@ struct davinci_mdio_data {
 	 */
 	bool		skip_scan;
 	u32		clk_div;
+	bool		manual_mode;
 };
 
 static void davinci_mdio_init_clk(struct davinci_mdio_data *data)
@@ -128,9 +144,122 @@ static void davinci_mdio_enable(struct davinci_mdio_data *data)
 	writel(data->clk_div | CONTROL_ENABLE, &data->regs->control);
 }
 
-static int davinci_mdio_reset(struct mii_bus *bus)
+static void davinci_mdio_disable(struct davinci_mdio_data *data)
+{
+	u32 reg;
+
+	/* Disable MDIO state machine */
+	reg = readl(&data->regs->control);
+
+	reg &= ~CONTROL_CLKDIV;
+	reg |= data->clk_div;
+
+	reg &= ~CONTROL_ENABLE;
+	writel(reg, &data->regs->control);
+}
+
+static void davinci_mdio_enable_manual_mode(struct davinci_mdio_data *data)
+{
+	u32 reg;
+	/* set manual mode */
+	reg = readl(&data->regs->poll);
+	reg |= MDIO_MANUALMODE;
+	writel(reg, &data->regs->poll);
+}
+
+static void davinci_set_mdc(struct mdiobb_ctrl *ctrl, int level)
+{
+	struct davinci_mdio_data *data;
+	u32 reg;
+
+	data = container_of(ctrl, struct davinci_mdio_data, bb_ctrl);
+	reg = readl(&data->regs->manualif);
+
+	if (level)
+		reg |= MDIO_MAN_MDCLK_O;
+	else
+		reg &= ~MDIO_MAN_MDCLK_O;
+
+	writel(reg, &data->regs->manualif);
+}
+
+static void davinci_set_mdio_dir(struct mdiobb_ctrl *ctrl, int output)
+{
+	struct davinci_mdio_data *data;
+	u32 reg;
+
+	data = container_of(ctrl, struct davinci_mdio_data, bb_ctrl);
+	reg = readl(&data->regs->manualif);
+
+	if (output)
+		reg |= MDIO_MAN_OE;
+	else
+		reg &= ~MDIO_MAN_OE;
+
+	writel(reg, &data->regs->manualif);
+}
+
+static void  davinci_set_mdio_data(struct mdiobb_ctrl *ctrl, int value)
+{
+	struct davinci_mdio_data *data;
+	u32 reg;
+
+	data = container_of(ctrl, struct davinci_mdio_data, bb_ctrl);
+	reg = readl(&data->regs->manualif);
+
+	if (value)
+		reg |= MDIO_MAN_PIN;
+	else
+		reg &= ~MDIO_MAN_PIN;
+
+	writel(reg, &data->regs->manualif);
+}
+
+static int davinci_get_mdio_data(struct mdiobb_ctrl *ctrl)
+{
+	struct davinci_mdio_data *data;
+	unsigned long reg;
+
+	data = container_of(ctrl, struct davinci_mdio_data, bb_ctrl);
+	reg = readl(&data->regs->manualif);
+	return test_bit(MDIO_PIN, &reg);
+}
+
+static int davinci_mdiobb_read(struct mii_bus *bus, int phy, int reg)
+{
+	int ret;
+
+	ret = pm_runtime_resume_and_get(bus->parent);
+	if (ret < 0)
+		return ret;
+
+	ret = mdiobb_read(bus, phy, reg);
+
+	pm_runtime_mark_last_busy(bus->parent);
+	pm_runtime_put_autosuspend(bus->parent);
+
+	return ret;
+}
+
+static int davinci_mdiobb_write(struct mii_bus *bus, int phy, int reg,
+				u16 val)
+{
+	int ret;
+
+	ret = pm_runtime_resume_and_get(bus->parent);
+	if (ret < 0)
+		return ret;
+
+	ret = mdiobb_write(bus, phy, reg, val);
+
+	pm_runtime_mark_last_busy(bus->parent);
+	pm_runtime_put_autosuspend(bus->parent);
+
+	return ret;
+}
+
+static int davinci_mdio_common_reset(struct davinci_mdio_data *data)
 {
-	struct davinci_mdio_data *data = bus->priv;
 	u32 phy_mask, ver;
 	int ret;
 
@@ -140,6 +269,11 @@ static int davinci_mdio_reset(struct mii_bus *bus)
 		return ret;
 	}
 
+	if (data->manual_mode) {
+		davinci_mdio_disable(data);
+		davinci_mdio_enable_manual_mode(data);
+	}
+
 	/* wait for scan logic to settle */
 	msleep(PHY_MAX_ADDR * data->access_time);
 
@@ -173,6 +307,23 @@ static int davinci_mdio_reset(struct mii_bus *bus)
 	return 0;
 }
 
+static int davinci_mdio_reset(struct mii_bus *bus)
+{
+	struct davinci_mdio_data *data = bus->priv;
+
+	return davinci_mdio_common_reset(data);
+}
+
+static int davinci_mdiobb_reset(struct mii_bus *bus)
+{
+	struct mdiobb_ctrl *ctrl = bus->priv;
+	struct davinci_mdio_data *data;
+
+	data = container_of(ctrl, struct davinci_mdio_data, bb_ctrl);
+
+	return davinci_mdio_common_reset(data);
+}
+
 /* wait until hardware is ready for another user access */
 static inline int wait_for_user_access(struct davinci_mdio_data *data)
 {
@@ -324,6 +475,28 @@ static int davinci_mdio_probe_dt(struct mdio_platform_data *data,
 	return 0;
 }
 
+struct k3_mdio_soc_data {
+	bool manual_mode;
+};
+
+static const struct k3_mdio_soc_data am65_mdio_soc_data = {
+	.manual_mode = true,
+};
+
+static const struct soc_device_attribute k3_mdio_socinfo[] = {
+	{ .family = "AM62X", .revision = "SR1.0", .data = &am65_mdio_soc_data },
+	{ .family = "AM64X", .revision = "SR1.0", .data = &am65_mdio_soc_data },
+	{ .family = "AM64X", .revision = "SR2.0", .data = &am65_mdio_soc_data },
+	{ .family = "AM65X", .revision = "SR1.0", .data = &am65_mdio_soc_data },
+	{ .family = "AM65X", .revision = "SR2.0", .data = &am65_mdio_soc_data },
+	{ .family = "J7200", .revision = "SR1.0", .data = &am65_mdio_soc_data },
+	{ .family = "J7200", .revision = "SR2.0", .data = &am65_mdio_soc_data },
+	{ .family = "J721E", .revision = "SR1.0", .data = &am65_mdio_soc_data },
+	{ .family = "J721E", .revision = "SR2.0", .data = &am65_mdio_soc_data },
+	{ .family = "J721S2", .revision = "SR1.0", .data = &am65_mdio_soc_data},
+	{ /* sentinel */ },
+};
+
 #if IS_ENABLED(CONFIG_OF)
 static const struct davinci_mdio_of_param of_cpsw_mdio_data = {
 	.autosuspend_delay_ms = 100,
@@ -337,6 +510,14 @@ static const struct of_device_id davinci_mdio_of_mtable[] = {
 MODULE_DEVICE_TABLE(of, davinci_mdio_of_mtable);
 #endif
 
+static const struct mdiobb_ops davinci_mdiobb_ops = {
+	.owner = THIS_MODULE,
+	.set_mdc = davinci_set_mdc,
+	.set_mdio_dir = davinci_set_mdio_dir,
+	.set_mdio_data = davinci_set_mdio_data,
+	.get_mdio_data = davinci_get_mdio_data,
+};
+
 static int davinci_mdio_probe(struct platform_device *pdev)
 {
 	struct mdio_platform_data *pdata = dev_get_platdata(&pdev->dev);
@@ -351,7 +532,26 @@ static int davinci_mdio_probe(struct platform_device *pdev)
 	if (!data)
 		return -ENOMEM;
 
-	data->bus = devm_mdiobus_alloc(dev);
+	data->manual_mode = false;
+	data->bb_ctrl.ops = &davinci_mdiobb_ops;
+
+	if (IS_ENABLED(CONFIG_OF) && dev->of_node) {
+		const struct soc_device_attribute *soc_match_data;
+
+		soc_match_data = soc_device_match(k3_mdio_socinfo);
+		if (soc_match_data && soc_match_data->data) {
+			const struct k3_mdio_soc_data *socdata =
+						soc_match_data->data;
+
+			data->manual_mode = socdata->manual_mode;
+		}
+	}
+
+	if (data->manual_mode)
+		data->bus = alloc_mdio_bitbang(&data->bb_ctrl);
+	else
+		data->bus = devm_mdiobus_alloc(dev);
+
 	if (!data->bus) {
 		dev_err(dev, "failed to alloc mii bus\n");
 		return -ENOMEM;
@@ -377,11 +577,20 @@ static int davinci_mdio_probe(struct platform_device *pdev)
 	}
 
 	data->bus->name		= dev_name(dev);
-	data->bus->read		= davinci_mdio_read;
-	data->bus->write	= davinci_mdio_write;
-	data->bus->reset	= davinci_mdio_reset;
+
+	if (data->manual_mode) {
+		data->bus->read		= davinci_mdiobb_read;
+		data->bus->write	= davinci_mdiobb_write;
+		data->bus->reset	= davinci_mdiobb_reset;
+
+		dev_info(dev, "Configuring MDIO in manual mode\n");
+	} else {
+		data->bus->read		= davinci_mdio_read;
+		data->bus->write	= davinci_mdio_write;
+		data->bus->reset	= davinci_mdio_reset;
+		data->bus->priv		= data;
+	}
 	data->bus->parent	= dev;
-	data->bus->priv		= data;
 
 	data->clk = devm_clk_get(dev, "fck");
 	if (IS_ERR(data->clk)) {
@@ -439,9 +648,13 @@ static int davinci_mdio_remove(struct platform_device *pdev)
 {
 	struct davinci_mdio_data *data = platform_get_drvdata(pdev);
 
-	if (data->bus)
+	if (data->bus) {
 		mdiobus_unregister(data->bus);
 
+		if (data->manual_mode)
+			free_mdio_bitbang(data->bus);
+	}
+
 	pm_runtime_dont_use_autosuspend(&pdev->dev);
 	pm_runtime_disable(&pdev->dev);
 
@@ -458,7 +671,9 @@ static int davinci_mdio_runtime_suspend(struct device *dev)
 	ctrl = readl(&data->regs->control);
 	ctrl &= ~CONTROL_ENABLE;
 	writel(ctrl, &data->regs->control);
-	wait_for_idle(data);
+
+	if (!data->manual_mode)
+		wait_for_idle(data);
 
 	return 0;
 }
@@ -467,7 +682,12 @@ static int davinci_mdio_runtime_resume(struct device *dev)
 {
 	struct davinci_mdio_data *data = dev_get_drvdata(dev);
 
-	davinci_mdio_enable(data);
+	if (data->manual_mode) {
+		davinci_mdio_disable(data);
+		davinci_mdio_enable_manual_mode(data);
+	} else {
+		davinci_mdio_enable(data);
+	}
 	return 0;
 }
 #endif
-- 
2.35.1

