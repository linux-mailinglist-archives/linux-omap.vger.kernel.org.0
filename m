Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D7ECF2AD4C6
	for <lists+linux-omap@lfdr.de>; Tue, 10 Nov 2020 12:21:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731588AbgKJLVO (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 10 Nov 2020 06:21:14 -0500
Received: from muru.com ([72.249.23.125]:47752 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730986AbgKJLVM (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 10 Nov 2020 06:21:12 -0500
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id EA82581A8;
        Tue, 10 Nov 2020 11:21:14 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     Dave Gerlach <d-gerlach@ti.com>, Faiz Abbas <faiz_abbas@ti.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        Keerthy <j-keerthy@ti.com>, Nishanth Menon <nm@ti.com>,
        Peter Ujfalusi <peter.ujfalusi@ti.com>,
        Roger Quadros <rogerq@ti.com>, Suman Anna <s-anna@ti.com>,
        Tero Kristo <t-kristo@ti.com>, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Santosh Shilimkar <ssantosh@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
        linux-remoteproc@vger.kernel.org
Subject: [PATCH 6/9] soc: ti: omap-prm: Add pm_clk for genpd
Date:   Tue, 10 Nov 2020 13:20:39 +0200
Message-Id: <20201110112042.65489-7-tony@atomide.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201110112042.65489-1-tony@atomide.com>
References: <20201110112042.65489-1-tony@atomide.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

In order to probe l3 and l4 interconnects with simple-pm-bus, we want
genpd to manage the clocks for the interconnects. For interconnect target
modules, we already have ti-sysc manage the clocks so let's skipe managing
clocks for ti-sysc modules.

Cc: Santosh Shilimkar <ssantosh@kernel.org>
Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 drivers/soc/ti/omap_prm.c | 44 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/drivers/soc/ti/omap_prm.c b/drivers/soc/ti/omap_prm.c
--- a/drivers/soc/ti/omap_prm.c
+++ b/drivers/soc/ti/omap_prm.c
@@ -7,6 +7,7 @@
  */
 
 #include <linux/kernel.h>
+#include <linux/clk.h>
 #include <linux/device.h>
 #include <linux/io.h>
 #include <linux/iopoll.h>
@@ -14,6 +15,7 @@
 #include <linux/of.h>
 #include <linux/of_device.h>
 #include <linux/platform_device.h>
+#include <linux/pm_clock.h>
 #include <linux/pm_domain.h>
 #include <linux/reset-controller.h>
 #include <linux/delay.h>
@@ -41,6 +43,7 @@ struct omap_prm_domain {
 	u16 pwrstst;
 	const struct omap_prm_domain_map *cap;
 	u32 pwrstctrl_saved;
+	unsigned int uses_pm_clk:1;
 };
 
 struct omap_rst_map {
@@ -325,6 +328,38 @@ static int omap_prm_domain_power_off(struct generic_pm_domain *domain)
 	return 0;
 }
 
+/*
+ * Note that ti-sysc already manages the module clocks separately so
+ * no need to manage those. Interconnect instances need clocks managed
+ * for simple-pm-bus.
+ */
+static int omap_prm_domain_attach_clock(struct device *dev,
+					struct omap_prm_domain *prmd)
+{
+	struct device_node *np = dev->of_node;
+	int error;
+
+	if (!of_device_is_compatible(np, "simple-pm-bus"))
+		return 0;
+
+	if (!of_property_read_bool(np, "clocks"))
+		return 0;
+
+	error = pm_clk_create(dev);
+	if (error)
+		return error;
+
+	error = of_pm_clk_add_clks(dev);
+	if (error < 0) {
+		pm_clk_destroy(dev);
+		return error;
+	}
+
+	prmd->uses_pm_clk = 1;
+
+	return 0;
+}
+
 static int omap_prm_domain_attach_dev(struct generic_pm_domain *domain,
 				      struct device *dev)
 {
@@ -349,6 +384,10 @@ static int omap_prm_domain_attach_dev(struct generic_pm_domain *domain,
 	genpd_data = dev_gpd_data(dev);
 	genpd_data->data = NULL;
 
+	ret = omap_prm_domain_attach_clock(dev, prmd);
+	if (ret)
+		return ret;
+
 	return 0;
 }
 
@@ -356,7 +395,11 @@ static void omap_prm_domain_detach_dev(struct generic_pm_domain *domain,
 				       struct device *dev)
 {
 	struct generic_pm_domain_data *genpd_data;
+	struct omap_prm_domain *prmd;
 
+	prmd = genpd_to_prm_domain(domain);
+	if (prmd->uses_pm_clk)
+		pm_clk_destroy(dev);
 	genpd_data = dev_gpd_data(dev);
 	genpd_data->data = NULL;
 }
@@ -393,6 +436,7 @@ static int omap_prm_domain_init(struct device *dev, struct omap_prm *prm)
 	prmd->pd.power_off = omap_prm_domain_power_off;
 	prmd->pd.attach_dev = omap_prm_domain_attach_dev;
 	prmd->pd.detach_dev = omap_prm_domain_detach_dev;
+	prmd->pd.flags = GENPD_FLAG_PM_CLK;
 
 	pm_genpd_init(&prmd->pd, NULL, true);
 	error = of_genpd_add_provider_simple(np, &prmd->pd);
-- 
2.29.2
