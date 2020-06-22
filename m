Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7A112203CFA
	for <lists+linux-omap@lfdr.de>; Mon, 22 Jun 2020 18:47:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729899AbgFVQrG (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 22 Jun 2020 12:47:06 -0400
Received: from muru.com ([72.249.23.125]:58668 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729842AbgFVQrF (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 22 Jun 2020 12:47:05 -0400
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 5536D8181;
        Mon, 22 Jun 2020 16:47:55 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     "Andrew F . Davis" <afd@ti.com>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        Suman Anna <s-anna@ti.com>, Tero Kristo <t-kristo@ti.com>,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org
Subject: [PATCH 2/6] soc: ti: omap-prm: Add basic power domain support
Date:   Mon, 22 Jun 2020 09:46:48 -0700
Message-Id: <20200622164652.12054-3-tony@atomide.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200622164652.12054-1-tony@atomide.com>
References: <20200622164652.12054-1-tony@atomide.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

The PRM controller has currently only support for resets while the power
domains are still handled in the platform code.

Let's add basic power domain support to enable and disable a PRM
controlled power domain if configured in the devicetree. This can be
used for various hardware accelerators, and interconnect instances.

Further support can be added later on as needed for runtime configuration
based on domain-idle-states.

Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 arch/arm/mach-omap2/Kconfig |   1 +
 drivers/soc/ti/omap_prm.c   | 228 +++++++++++++++++++++++++++++++++++-
 2 files changed, 228 insertions(+), 1 deletion(-)

diff --git a/arch/arm/mach-omap2/Kconfig b/arch/arm/mach-omap2/Kconfig
--- a/arch/arm/mach-omap2/Kconfig
+++ b/arch/arm/mach-omap2/Kconfig
@@ -7,6 +7,7 @@ config ARCH_OMAP2
 	depends on ARCH_MULTI_V6
 	select ARCH_OMAP2PLUS
 	select CPU_V6
+	select PM_GENERIC_DOMAINS if PM
 	select SOC_HAS_OMAP2_SDRC
 
 config ARCH_OMAP3
diff --git a/drivers/soc/ti/omap_prm.c b/drivers/soc/ti/omap_prm.c
--- a/drivers/soc/ti/omap_prm.c
+++ b/drivers/soc/ti/omap_prm.c
@@ -10,14 +10,39 @@
 #include <linux/device.h>
 #include <linux/io.h>
 #include <linux/iopoll.h>
+#include <linux/module.h>
 #include <linux/of.h>
 #include <linux/of_device.h>
 #include <linux/platform_device.h>
+#include <linux/pm_domain.h>
 #include <linux/reset-controller.h>
 #include <linux/delay.h>
 
 #include <linux/platform_data/ti-prm.h>
 
+enum omap_prm_domain_mode {
+	OMAP_PRMD_OFF,
+	OMAP_PRMD_RETENTION,
+	OMAP_PRMD_ON_INACTIVE,
+	OMAP_PRMD_ON_ACTIVE,
+};
+
+struct omap_prm_domain_map {
+	unsigned int usable_modes;	/* Mask of hardware supported modes */
+	unsigned long statechange:1;	/* Optional low-power state change */
+	unsigned long logicretstate:1;	/* Optional logic off mode */
+};
+
+struct omap_prm_domain {
+	struct device *dev;
+	struct omap_prm *prm;
+	struct generic_pm_domain pd;
+	u16 pwrstctrl;
+	u16 pwrstst;
+	const struct omap_prm_domain_map *cap;
+	u32 pwrstctrl_saved;
+};
+
 struct omap_rst_map {
 	s8 rst;
 	s8 st;
@@ -27,6 +52,9 @@ struct omap_prm_data {
 	u32 base;
 	const char *name;
 	const char *clkdm_name;
+	u16 pwrstctrl;
+	u16 pwrstst;
+	const struct omap_prm_domain_map *dmap;
 	u16 rstctrl;
 	u16 rstst;
 	const struct omap_rst_map *rstmap;
@@ -36,6 +64,7 @@ struct omap_prm_data {
 struct omap_prm {
 	const struct omap_prm_data *data;
 	void __iomem *base;
+	struct omap_prm_domain *prmd;
 };
 
 struct omap_reset_data {
@@ -47,6 +76,7 @@ struct omap_reset_data {
 	struct device *dev;
 };
 
+#define genpd_to_prm_domain(gpd) container_of(gpd, struct omap_prm_domain, pd)
 #define to_omap_reset_data(p) container_of((p), struct omap_reset_data, rcdev)
 
 #define OMAP_MAX_RESETS		8
@@ -58,6 +88,13 @@ struct omap_reset_data {
 
 #define OMAP_PRM_HAS_RESETS	(OMAP_PRM_HAS_RSTCTRL | OMAP_PRM_HAS_RSTST)
 
+#define PRM_STATE_MAX_WAIT	10000
+#define PRM_LOGICRETSTATE	BIT(2)
+#define PRM_LOWPOWERSTATECHANGE	BIT(4)
+#define PRM_POWERSTATE_MASK	OMAP_PRMD_ON_ACTIVE
+
+#define PRM_ST_INTRANSITION	BIT(20)
+
 static const struct omap_rst_map rst_map_0[] = {
 	{ .rst = 0, .st = 0 },
 	{ .rst = -1 },
@@ -151,6 +188,180 @@ static const struct of_device_id omap_prm_id_table[] = {
 	{ },
 };
 
+#ifdef DEBUG
+static void omap_prm_domain_show_state(struct omap_prm_domain *prmd,
+				       const char *desc)
+{
+	dev_dbg(prmd->dev, "%s %s: %08x/%08x\n",
+		prmd->pd.name, desc,
+		readl_relaxed(prmd->prm->base + prmd->pwrstctrl),
+		readl_relaxed(prmd->prm->base + prmd->pwrstst));
+}
+#else
+static inline void omap_prm_domain_show_state(struct omap_prm_domain *prmd,
+					      const char *desc)
+{
+}
+#endif
+
+static int omap_prm_domain_power_on(struct generic_pm_domain *domain)
+{
+	struct omap_prm_domain *prmd;
+	int ret;
+	u32 v;
+
+	prmd = genpd_to_prm_domain(domain);
+	if (!prmd->cap)
+		return 0;
+
+	omap_prm_domain_show_state(prmd, "on: previous state");
+
+	if (prmd->pwrstctrl_saved)
+		v = prmd->pwrstctrl_saved;
+	else
+		v = readl_relaxed(prmd->prm->base + prmd->pwrstctrl);
+
+	writel_relaxed(v | OMAP_PRMD_ON_ACTIVE,
+		       prmd->prm->base + prmd->pwrstctrl);
+
+	/* wait for the transition bit to get cleared */
+	ret = readl_relaxed_poll_timeout(prmd->prm->base + prmd->pwrstst,
+					 v, !(v & PRM_ST_INTRANSITION), 1,
+					 PRM_STATE_MAX_WAIT);
+	if (ret)
+		dev_err(prmd->dev, "%s: %s timed out\n",
+			prmd->pd.name, __func__);
+
+	omap_prm_domain_show_state(prmd, "on: new state");
+
+	return ret;
+}
+
+/* No need to check for holes in the mask for the lowest mode */
+static int omap_prm_domain_find_lowest(struct omap_prm_domain *prmd)
+{
+	return __ffs(prmd->cap->usable_modes);
+}
+
+static int omap_prm_domain_power_off(struct generic_pm_domain *domain)
+{
+	struct omap_prm_domain *prmd;
+	int ret;
+	u32 v;
+
+	prmd = genpd_to_prm_domain(domain);
+	if (!prmd->cap)
+		return 0;
+
+	omap_prm_domain_show_state(prmd, "off: previous state");
+
+	v = readl_relaxed(prmd->prm->base + prmd->pwrstctrl);
+	prmd->pwrstctrl_saved = v;
+
+	v &= ~PRM_POWERSTATE_MASK;
+	v |= omap_prm_domain_find_lowest(prmd);
+
+	if (prmd->cap->statechange)
+		v |= PRM_LOWPOWERSTATECHANGE;
+	if (prmd->cap->logicretstate)
+		v &= ~PRM_LOGICRETSTATE;
+	else
+		v |= PRM_LOGICRETSTATE;
+
+	writel_relaxed(v, prmd->prm->base + prmd->pwrstctrl);
+
+	/* wait for the transition bit to get cleared */
+	ret = readl_relaxed_poll_timeout(prmd->prm->base + prmd->pwrstst,
+					 v, !(v & PRM_ST_INTRANSITION), 1,
+					 PRM_STATE_MAX_WAIT);
+	if (ret)
+		dev_warn(prmd->dev, "%s: %s timed out\n",
+			 __func__, prmd->pd.name);
+
+	omap_prm_domain_show_state(prmd, "off: new state");
+
+	return 0;
+}
+
+static int omap_prm_domain_attach_dev(struct generic_pm_domain *domain,
+				      struct device *dev)
+{
+	struct generic_pm_domain_data *genpd_data;
+	struct of_phandle_args pd_args;
+	struct omap_prm_domain *prmd;
+	struct device_node *np;
+	int ret;
+
+	prmd = genpd_to_prm_domain(domain);
+	np = dev->of_node;
+
+	ret = of_parse_phandle_with_args(np, "power-domains",
+					 "#power-domain-cells", 0, &pd_args);
+	if (ret < 0)
+		return ret;
+
+	if (pd_args.args_count != 0)
+		dev_warn(dev, "%s: unusupported #power-domain-cells: %i\n",
+			 prmd->pd.name, pd_args.args_count);
+
+	genpd_data = dev_gpd_data(dev);
+	genpd_data->data = NULL;
+
+	return 0;
+}
+
+static void omap_prm_domain_detach_dev(struct generic_pm_domain *domain,
+				       struct device *dev)
+{
+	struct generic_pm_domain_data *genpd_data;
+
+	genpd_data = dev_gpd_data(dev);
+	genpd_data->data = NULL;
+}
+
+static int omap_prm_domain_init(struct device *dev, struct omap_prm *prm)
+{
+	struct omap_prm_domain *prmd;
+	struct device_node *np = dev->of_node;
+	const struct omap_prm_data *data;
+	const char *name;
+	int error;
+
+	if (!of_find_property(dev->of_node, "#power-domain-cells", NULL))
+		return 0;
+
+	of_node_put(dev->of_node);
+
+	prmd = devm_kzalloc(dev, sizeof(*prmd), GFP_KERNEL);
+	if (!prmd)
+		return -ENOMEM;
+
+	data = prm->data;
+	name = devm_kasprintf(dev, GFP_KERNEL, "prm_%s",
+			      data->name);
+
+	prmd->dev = dev;
+	prmd->prm = prm;
+	prmd->cap = prmd->prm->data->dmap;
+	prmd->pwrstctrl = prmd->prm->data->pwrstctrl;
+	prmd->pwrstst = prmd->prm->data->pwrstst;
+
+	prmd->pd.name = name;
+	prmd->pd.power_on = omap_prm_domain_power_on;
+	prmd->pd.power_off = omap_prm_domain_power_off;
+	prmd->pd.attach_dev = omap_prm_domain_attach_dev;
+	prmd->pd.detach_dev = omap_prm_domain_detach_dev;
+
+	pm_genpd_init(&prmd->pd, NULL, true);
+	error = of_genpd_add_provider_simple(np, &prmd->pd);
+	if (error)
+		pm_genpd_remove(&prmd->pd);
+	else
+		prm->prmd = prmd;
+
+	return error;
+}
+
 static bool _is_valid_reset(struct omap_reset_data *reset, unsigned long id)
 {
 	if (reset->mask & BIT(id))
@@ -351,6 +562,7 @@ static int omap_prm_probe(struct platform_device *pdev)
 	const struct omap_prm_data *data;
 	struct omap_prm *prm;
 	const struct of_device_id *match;
+	int ret;
 
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	if (!res)
@@ -378,7 +590,21 @@ static int omap_prm_probe(struct platform_device *pdev)
 	if (IS_ERR(prm->base))
 		return PTR_ERR(prm->base);
 
-	return omap_prm_reset_init(pdev, prm);
+	ret = omap_prm_domain_init(&pdev->dev, prm);
+	if (ret)
+		return ret;
+
+	ret = omap_prm_reset_init(pdev, prm);
+	if (ret)
+		goto err_domain;
+
+	return 0;
+
+err_domain:
+	of_genpd_del_provider(pdev->dev.of_node);
+	pm_genpd_remove(&prm->prmd->pd);
+
+	return ret;
 }
 
 static struct platform_driver omap_prm_driver = {
-- 
2.27.0
