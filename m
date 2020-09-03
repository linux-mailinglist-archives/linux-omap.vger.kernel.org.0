Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A5C9025C8E4
	for <lists+linux-omap@lfdr.de>; Thu,  3 Sep 2020 20:42:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729243AbgICSmN (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 3 Sep 2020 14:42:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46910 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729238AbgICSmI (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 3 Sep 2020 14:42:08 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD6D6C061249
        for <linux-omap@vger.kernel.org>; Thu,  3 Sep 2020 11:42:07 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id y4so4952671ljk.8
        for <linux-omap@vger.kernel.org>; Thu, 03 Sep 2020 11:42:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=EQQn6igoQHhSsSJgk3MRYdysLU2N7iqRMh2t7mrUk/Q=;
        b=UT95ePuD13m75NO/W9khoVNyz1Bk4SxqcWz7iSOKZx9QNNVGoCbTyvtAdXRFLV3DKq
         YhOZvzHHIl0ZvoJ3TGbYXBbaOgZMyO5g+wUfNXXP/bpv8aYzKbymEHsaCvNaotVHBIT3
         vePRYgHSbSBOVBs/s0BIM8N4mWecU9YML+6Eu5fdN/saOFY78A9zbGjWumNEnfFS9hBT
         kHH56JUZG5W/lm5Vo6GdAPNps2gkIyE4wxD6h8YIne8iwC/czBkvHtuzBs9goVho9yr0
         66fF6EAFdKqsk2/S3jDpf/fSj4hEEmCHqHtVMqaoqScKiejPCoBOzxt65JICO/Q9o5aC
         7cQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=EQQn6igoQHhSsSJgk3MRYdysLU2N7iqRMh2t7mrUk/Q=;
        b=QLEtJcYwTKAj3KpGlm5JKTgrnjZG926ZFBf+ZWXmZiqN1AX+lrN6XmY/i0OHMCGGyA
         0rnsHqW/MpOn9dTCssAmh3p/cfi8Ie8HpPL3bBX9luxbkcypWwIqXuXtRkX1iMKJVQUv
         VVeLcgS3kchySwYI/TYrBZrRXiZuP5e2Ub0C9770LAzQAQZPLkvUqdSuNMjzv1XBFg58
         n3zRCqHRPCOL2PC/LSqO3KJ+AyKM+T88m017GCMXc792EDHb5q6Et/whO9IWx8QvaXoH
         hkFTnEN9D5y6P5H9vlfeNuA1S0OfPsR667yp7UX8yLbkbKSlvyvOHLlsCqhNjIGtLALo
         DJEA==
X-Gm-Message-State: AOAM5335eqnyWEG3UpzJaRfEJHkUFh5CV813D69sI2tl6DyZ7cBc2DqI
        JkwbczrN9DqG1o9Onlca1pDjpg==
X-Google-Smtp-Source: ABdhPJwmw3nysxvMyHWXPDIXc3n+qUG5Z1d8sIuYTbksNyOheeqBhqUszk7QYMBlKgByQ6XUlfWgWw==
X-Received: by 2002:a2e:99c6:: with SMTP id l6mr1844843ljj.454.1599158525953;
        Thu, 03 Sep 2020 11:42:05 -0700 (PDT)
Received: from gilgamesh.semihalf.com (193-106-246-138.noc.fibertech.net.pl. [193.106.246.138])
        by smtp.gmail.com with ESMTPSA id r8sm754854lfm.42.2020.09.03.11.42.04
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 03 Sep 2020 11:42:05 -0700 (PDT)
From:   Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>
To:     ssantosh@kernel.org, s-anna@ti.com
Cc:     grzegorz.jaszczyk@linaro.org, santosh.shilimkar@oracle.com,
        robh+dt@kernel.org, lee.jones@linaro.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        praneeth@ti.com, tony@atomide.com, Roger Quadros <rogerq@ti.com>
Subject: [PATCH 2/2] soc: ti: pruss: support CORECLK_MUX and IEPCLK_MUX
Date:   Thu,  3 Sep 2020 20:41:41 +0200
Message-Id: <1599158501-8302-3-git-send-email-grzegorz.jaszczyk@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1599158501-8302-1-git-send-email-grzegorz.jaszczyk@linaro.org>
References: <1599158501-8302-1-git-send-email-grzegorz.jaszczyk@linaro.org>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

The IEPCLK_MUX is present on all SoCs whereas the CORECLK_MUX is present
only on AM65x SoCs and J721E. Add support for both these CLK muxes.

This allows the clock rates and clock parents for these to be controlled
through DT leveraging the clk infrastructure for configuring the default
parents and rates.

Signed-off-by: Roger Quadros <rogerq@ti.com>
Signed-off-by: Suman Anna <s-anna@ti.com>
Signed-off-by: Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>
---
 drivers/soc/ti/pruss.c       | 184 +++++++++++++++++++++++++++++++++++++++++--
 include/linux/pruss_driver.h |   6 ++
 2 files changed, 183 insertions(+), 7 deletions(-)

diff --git a/drivers/soc/ti/pruss.c b/drivers/soc/ti/pruss.c
index 37df543..cc0b4ad 100644
--- a/drivers/soc/ti/pruss.c
+++ b/drivers/soc/ti/pruss.c
@@ -8,6 +8,7 @@
  *	Andrew F. Davis <afd@ti.com>
  */
 
+#include <linux/clk-provider.h>
 #include <linux/dma-mapping.h>
 #include <linux/io.h>
 #include <linux/mfd/syscon.h>
@@ -16,13 +17,150 @@
 #include <linux/of_device.h>
 #include <linux/pm_runtime.h>
 #include <linux/pruss_driver.h>
+#include <linux/regmap.h>
+#include <linux/slab.h>
 
 /**
  * struct pruss_private_data - PRUSS driver private data
  * @has_no_sharedram: flag to indicate the absence of PRUSS Shared Data RAM
+ * @has_core_mux_clock: flag to indicate the presence of PRUSS core clock
  */
 struct pruss_private_data {
 	bool has_no_sharedram;
+	bool has_core_mux_clock;
+};
+
+static void pruss_of_free_clk_provider(void *data)
+{
+	struct device_node *clk_mux_np = data;
+
+	of_clk_del_provider(clk_mux_np);
+	of_node_put(clk_mux_np);
+}
+
+static int pruss_clk_mux_setup(struct pruss *pruss, struct clk *clk_mux,
+			       char *mux_name, struct device_node *clks_np)
+{
+	struct device_node *clk_mux_np;
+	struct device *dev = pruss->dev;
+	char *clk_mux_name;
+	unsigned int num_parents;
+	const char **parent_names;
+	void __iomem *reg;
+	u32 reg_offset;
+	int ret;
+
+	clk_mux_np = of_get_child_by_name(clks_np, mux_name);
+	if (!clk_mux_np) {
+		dev_err(dev, "%pOF is missing its '%s' node\n", clks_np,
+			mux_name);
+		return -ENODEV;
+	}
+
+	num_parents = of_clk_get_parent_count(clk_mux_np);
+	if (num_parents < 1) {
+		dev_err(dev, "mux-clock %pOF must have parents\n", clk_mux_np);
+		ret = -EINVAL;
+		goto put_clk_mux_np;
+	}
+
+	parent_names = devm_kcalloc(dev, sizeof(*parent_names), num_parents,
+				    GFP_KERNEL);
+	if (!parent_names) {
+		ret = -ENOMEM;
+		goto put_clk_mux_np;
+	}
+
+	of_clk_parent_fill(clk_mux_np, parent_names, num_parents);
+
+	clk_mux_name = devm_kasprintf(dev, GFP_KERNEL, "%s.%pOFn",
+				      dev_name(dev), clk_mux_np);
+	if (!clk_mux_name) {
+		ret = -ENOMEM;
+		goto put_clk_mux_np;
+	}
+
+	ret = of_property_read_u32(clk_mux_np, "reg", &reg_offset);
+	if (ret)
+		goto put_clk_mux_np;
+
+	reg = pruss->cfg_base + reg_offset;
+
+	clk_mux = clk_register_mux(NULL, clk_mux_name, parent_names,
+				   num_parents, 0, reg, 0, 1, 0, NULL);
+	if (IS_ERR(clk_mux)) {
+		ret = PTR_ERR(clk_mux);
+		goto put_clk_mux_np;
+	}
+
+	ret = devm_add_action_or_reset(dev, (void(*)(void *))clk_unregister_mux,
+				       clk_mux);
+	if (ret) {
+		dev_err(dev, "failed to add clkmux unregister action %d", ret);
+		goto put_clk_mux_np;
+	}
+
+	ret = of_clk_add_provider(clk_mux_np, of_clk_src_simple_get, clk_mux);
+	if (ret)
+		goto put_clk_mux_np;
+
+	ret = devm_add_action_or_reset(dev, pruss_of_free_clk_provider,
+				       clk_mux_np);
+	if (ret) {
+		dev_err(dev, "failed to add clkmux free action %d", ret);
+		goto put_clk_mux_np;
+	}
+
+	return 0;
+
+put_clk_mux_np:
+	of_node_put(clk_mux_np);
+	return ret;
+}
+
+static int pruss_clk_init(struct pruss *pruss, struct device_node *cfg_node)
+{
+	const struct pruss_private_data *data;
+	struct device_node *clks_np;
+	struct device *dev = pruss->dev;
+	int ret = 0;
+
+	data = of_device_get_match_data(dev);
+	if (IS_ERR(data))
+		return -ENODEV;
+
+	clks_np = of_get_child_by_name(cfg_node, "clocks");
+	if (!clks_np) {
+		dev_err(dev, "%pOF is missing its 'clocks' node\n", clks_np);
+		return -ENODEV;
+	}
+
+	if (data && data->has_core_mux_clock) {
+		ret = pruss_clk_mux_setup(pruss, pruss->core_clk_mux,
+					  "coreclk-mux", clks_np);
+		if (ret) {
+			dev_err(dev, "failed to setup coreclk-mux\n");
+			goto put_clks_node;
+		}
+	}
+
+	ret = pruss_clk_mux_setup(pruss, pruss->iep_clk_mux, "iepclk-mux",
+				  clks_np);
+	if (ret) {
+		dev_err(dev, "failed to setup iepclk-mux\n");
+		goto put_clks_node;
+	}
+
+put_clks_node:
+	of_node_put(clks_np);
+
+	return ret;
+}
+
+static struct regmap_config regmap_conf = {
+	.reg_bits = 32,
+	.val_bits = 32,
+	.reg_stride = 4,
 };
 
 static int pruss_probe(struct platform_device *pdev)
@@ -114,21 +252,49 @@ static int pruss_probe(struct platform_device *pdev)
 		goto rpm_put;
 	}
 
-	pruss->cfg_regmap = syscon_node_to_regmap(child);
-	of_node_put(child);
+	if (of_address_to_resource(child, 0, &res)) {
+		ret = -ENOMEM;
+		goto node_put;
+	}
+
+	pruss->cfg_base = devm_ioremap(dev, res.start, resource_size(&res));
+	if (!pruss->cfg_base) {
+		ret = -ENOMEM;
+		goto node_put;
+	}
+
+	regmap_conf.name = kasprintf(GFP_KERNEL, "%pOFn@%llx", child,
+				     (u64)res.start);
+	regmap_conf.max_register = resource_size(&res) - 4;
+
+	pruss->cfg_regmap = devm_regmap_init_mmio(dev, pruss->cfg_base,
+						  &regmap_conf);
+	kfree(regmap_conf.name);
 	if (IS_ERR(pruss->cfg_regmap)) {
-		ret = -ENODEV;
-		goto rpm_put;
+		dev_err(dev, "regmap_init_mmio failed for cfg, ret = %ld\n",
+			PTR_ERR(pruss->cfg_regmap));
+		ret = PTR_ERR(pruss->cfg_regmap);
+		goto node_put;
+	}
+
+	ret = pruss_clk_init(pruss, child);
+	if (ret) {
+		dev_err(dev, "failed to setup coreclk-mux\n");
+		goto node_put;
 	}
 
 	ret = devm_of_platform_populate(dev);
 	if (ret) {
 		dev_err(dev, "failed to register child devices\n");
-		goto rpm_put;
+		goto node_put;
 	}
 
+	of_node_put(child);
+
 	return 0;
 
+node_put:
+	of_node_put(child);
 rpm_put:
 	pm_runtime_put_sync(dev);
 rpm_disable:
@@ -157,14 +323,18 @@ static const struct pruss_private_data am437x_pruss0_data = {
 	.has_no_sharedram = true,
 };
 
+static const struct pruss_private_data am65x_j721e_pruss_data = {
+	.has_core_mux_clock = true,
+};
+
 static const struct of_device_id pruss_of_match[] = {
 	{ .compatible = "ti,am3356-pruss" },
 	{ .compatible = "ti,am4376-pruss0", .data = &am437x_pruss0_data, },
 	{ .compatible = "ti,am4376-pruss1", .data = &am437x_pruss1_data, },
 	{ .compatible = "ti,am5728-pruss" },
 	{ .compatible = "ti,k2g-pruss" },
-	{ .compatible = "ti,am654-icssg" },
-	{ .compatible = "ti,j721e-icssg" },
+	{ .compatible = "ti,am654-icssg", .data = &am65x_j721e_pruss_data, },
+	{ .compatible = "ti,j721e-icssg", .data = &am65x_j721e_pruss_data, },
 	{},
 };
 MODULE_DEVICE_TABLE(of, pruss_of_match);
diff --git a/include/linux/pruss_driver.h b/include/linux/pruss_driver.h
index 0701fe1..ecfded3 100644
--- a/include/linux/pruss_driver.h
+++ b/include/linux/pruss_driver.h
@@ -36,13 +36,19 @@ struct pruss_mem_region {
 /**
  * struct pruss - PRUSS parent structure
  * @dev: pruss device pointer
+ * @cfg_base: base iomap for CFG region
  * @cfg_regmap: regmap for config region
  * @mem_regions: data for each of the PRUSS memory regions
+ * @core_clk_mux: clk handle for PRUSS CORE_CLK_MUX
+ * @iep_clk_mux: clk handle for PRUSS IEP_CLK_MUX
  */
 struct pruss {
 	struct device *dev;
+	void __iomem *cfg_base;
 	struct regmap *cfg_regmap;
 	struct pruss_mem_region mem_regions[PRUSS_MEM_MAX];
+	struct clk *core_clk_mux;
+	struct clk *iep_clk_mux;
 };
 
 #endif	/* _PRUSS_DRIVER_H_ */
-- 
2.7.4

