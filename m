Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AC2302BF33
	for <lists+linux-omap@lfdr.de>; Tue, 28 May 2019 08:24:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726866AbfE1GYX (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 28 May 2019 02:24:23 -0400
Received: from muru.com ([72.249.23.125]:51356 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725904AbfE1GYX (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 28 May 2019 02:24:23 -0400
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 24E8A8123;
        Tue, 28 May 2019 06:24:40 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     Dave Gerlach <d-gerlach@ti.com>, Faiz Abbas <faiz_abbas@ti.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Keerthy <j-keerthy@ti.com>, Nishanth Menon <nm@ti.com>,
        Peter Ujfalusi <peter.ujfalusi@ti.com>,
        Roger Quadros <rogerq@ti.com>, Suman Anna <s-anna@ti.com>,
        Tero Kristo <t-kristo@ti.com>, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org
Subject: [PATCH 01/13] bus: ti-sysc: Add support for missing clockdomain handling
Date:   Mon, 27 May 2019 23:24:02 -0700
Message-Id: <20190528062414.27192-2-tony@atomide.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190528062414.27192-1-tony@atomide.com>
References: <20190528062414.27192-1-tony@atomide.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

We need to let ti-sysc driver manage clockdomain autoidle for the
duration of of reset, enable and idle. And we need to do it before we
enable the clock and after we disable it. Currently we are still
relying on platform callbacks indirectly managing clockdomain autoidle.
But I noticed that for device tree only probed drivers it now happens
only after we enabling the clocks and before we disable the clocks,
while it should be the other way around. So far I have not noticed
any issues with this though.

Let's add new ti_sysc_clkdm_deny_idle() and ti_sysc_clkdm_allow_idle()
functions for ti-sysc driver to use to manage clockdomains directly via
platform data callbacks. Note that we can implement the clockdomain
functions in pdata-quirks.c as for probing devices without "ti,hwmods"
custom property we don't need to use the other platform data callbacks.

Let's do this in one patch as there's is still an unlikely chance we
may need to apply this as a fix for v5.2 for dropping legacy platform
data for some devices. We also do have the option of adding back the
platform data if needed in case of trouble.

Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 arch/arm/mach-omap2/omap_hwmod.c      |  39 +-------
 arch/arm/mach-omap2/pdata-quirks.c    |  60 ++++++++++++
 drivers/bus/ti-sysc.c                 | 127 ++++++++++++++++++++------
 include/linux/platform_data/ti-sysc.h |   8 ++
 4 files changed, 174 insertions(+), 60 deletions(-)

diff --git a/arch/arm/mach-omap2/omap_hwmod.c b/arch/arm/mach-omap2/omap_hwmod.c
--- a/arch/arm/mach-omap2/omap_hwmod.c
+++ b/arch/arm/mach-omap2/omap_hwmod.c
@@ -3445,6 +3445,7 @@ static int omap_hwmod_check_module(struct device *dev,
  * @dev: struct device
  * @oh: module
  * @sysc_fields: sysc register bits
+ * @clockdomain: clockdomain
  * @rev_offs: revision register offset
  * @sysc_offs: sysconfig register offset
  * @syss_offs: sysstatus register offset
@@ -3456,6 +3457,7 @@ static int omap_hwmod_check_module(struct device *dev,
 static int omap_hwmod_allocate_module(struct device *dev, struct omap_hwmod *oh,
 				      const struct ti_sysc_module_data *data,
 				      struct sysc_regbits *sysc_fields,
+				      struct clockdomain *clkdm,
 				      s32 rev_offs, s32 sysc_offs,
 				      s32 syss_offs, u32 sysc_flags,
 				      u32 idlemodes)
@@ -3463,8 +3465,6 @@ static int omap_hwmod_allocate_module(struct device *dev, struct omap_hwmod *oh,
 	struct omap_hwmod_class_sysconfig *sysc;
 	struct omap_hwmod_class *class = NULL;
 	struct omap_hwmod_ocp_if *oi = NULL;
-	struct clockdomain *clkdm = NULL;
-	struct clk *clk = NULL;
 	void __iomem *regs = NULL;
 	unsigned long flags;
 
@@ -3511,36 +3511,6 @@ static int omap_hwmod_allocate_module(struct device *dev, struct omap_hwmod *oh,
 		oi->user = OCP_USER_MPU | OCP_USER_SDMA;
 	}
 
-	if (!oh->_clk) {
-		struct clk_hw_omap *hwclk;
-
-		clk = of_clk_get_by_name(dev->of_node, "fck");
-		if (!IS_ERR(clk))
-			clk_prepare(clk);
-		else
-			clk = NULL;
-
-		/*
-		 * Populate clockdomain based on dts clock. It is needed for
-		 * clkdm_deny_idle() and clkdm_allow_idle() until we have have
-		 * interconnect driver and reset driver capable of blocking
-		 * clockdomain idle during reset, enable and idle.
-		 */
-		if (clk) {
-			hwclk = to_clk_hw_omap(__clk_get_hw(clk));
-			if (hwclk && hwclk->clkdm_name)
-				clkdm = clkdm_lookup(hwclk->clkdm_name);
-		}
-
-		/*
-		 * Note that we assume interconnect driver manages the clocks
-		 * and do not need to populate oh->_clk for dynamically
-		 * allocated modules.
-		 */
-		clk_unprepare(clk);
-		clk_put(clk);
-	}
-
 	spin_lock_irqsave(&oh->_lock, flags);
 	if (regs)
 		oh->_mpu_rt_va = regs;
@@ -3626,7 +3596,7 @@ int omap_hwmod_init_module(struct device *dev,
 	u32 sysc_flags, idlemodes;
 	int error;
 
-	if (!dev || !data)
+	if (!dev || !data || !data->name || !cookie)
 		return -EINVAL;
 
 	oh = _lookup(data->name);
@@ -3697,7 +3667,8 @@ int omap_hwmod_init_module(struct device *dev,
 		return error;
 
 	return omap_hwmod_allocate_module(dev, oh, data, sysc_fields,
-					  rev_offs, sysc_offs, syss_offs,
+					  cookie->clkdm, rev_offs,
+					  sysc_offs, syss_offs,
 					  sysc_flags, idlemodes);
 }
 
diff --git a/arch/arm/mach-omap2/pdata-quirks.c b/arch/arm/mach-omap2/pdata-quirks.c
--- a/arch/arm/mach-omap2/pdata-quirks.c
+++ b/arch/arm/mach-omap2/pdata-quirks.c
@@ -29,6 +29,7 @@
 #include <linux/platform_data/wkup_m3.h>
 #include <linux/platform_data/asoc-ti-mcbsp.h>
 
+#include "clockdomain.h"
 #include "common.h"
 #include "common-board-devices.h"
 #include "control.h"
@@ -463,6 +464,62 @@ static void __init dra7x_evm_mmc_quirk(void)
 }
 #endif
 
+static struct clockdomain *ti_sysc_find_one_clockdomain(struct clk *clk)
+{
+	struct clockdomain *clkdm = NULL;
+	struct clk_hw_omap *hwclk;
+
+	hwclk = to_clk_hw_omap(__clk_get_hw(clk));
+	if (hwclk && hwclk->clkdm_name)
+		clkdm = clkdm_lookup(hwclk->clkdm_name);
+
+	return clkdm;
+}
+
+/**
+ * ti_sysc_clkdm_init - find clockdomain based on clock
+ * @fck: device functional clock
+ * @ick: device interface clock
+ * @dev: struct device
+ *
+ * Populate clockdomain based on clock. It is needed for
+ * clkdm_deny_idle() and clkdm_allow_idle() for blocking clockdomain
+ * clockdomain idle during reset, enable and idle.
+ *
+ * Note that we assume interconnect driver manages the clocks
+ * and do not need to populate oh->_clk for dynamically
+ * allocated modules.
+ */
+static int ti_sysc_clkdm_init(struct device *dev,
+			      struct clk *fck, struct clk *ick,
+			      struct ti_sysc_cookie *cookie)
+{
+	if (fck)
+		cookie->clkdm = ti_sysc_find_one_clockdomain(fck);
+	if (cookie->clkdm)
+		return 0;
+	if (ick)
+		cookie->clkdm = ti_sysc_find_one_clockdomain(ick);
+	if (cookie->clkdm)
+		return 0;
+
+	return -ENODEV;
+}
+
+static void ti_sysc_clkdm_deny_idle(struct device *dev,
+				    const struct ti_sysc_cookie *cookie)
+{
+	if (cookie->clkdm)
+		clkdm_deny_idle(cookie->clkdm);
+}
+
+static void ti_sysc_clkdm_allow_idle(struct device *dev,
+				     const struct ti_sysc_cookie *cookie)
+{
+	if (cookie->clkdm)
+		clkdm_allow_idle(cookie->clkdm);
+}
+
 static int ti_sysc_enable_module(struct device *dev,
 				 const struct ti_sysc_cookie *cookie)
 {
@@ -494,6 +551,9 @@ static struct of_dev_auxdata omap_auxdata_lookup[];
 
 static struct ti_sysc_platform_data ti_sysc_pdata = {
 	.auxdata = omap_auxdata_lookup,
+	.init_clockdomain = ti_sysc_clkdm_init,
+	.clkdm_deny_idle = ti_sysc_clkdm_deny_idle,
+	.clkdm_allow_idle = ti_sysc_clkdm_allow_idle,
 	.init_module = omap_hwmod_init_module,
 	.enable_module = ti_sysc_enable_module,
 	.idle_module = ti_sysc_idle_module,
diff --git a/drivers/bus/ti-sysc.c b/drivers/bus/ti-sysc.c
--- a/drivers/bus/ti-sysc.c
+++ b/drivers/bus/ti-sysc.c
@@ -422,6 +422,30 @@ static void sysc_disable_opt_clocks(struct sysc *ddata)
 	}
 }
 
+static void sysc_clkdm_deny_idle(struct sysc *ddata)
+{
+	struct ti_sysc_platform_data *pdata;
+
+	if (ddata->legacy_mode)
+		return;
+
+	pdata = dev_get_platdata(ddata->dev);
+	if (pdata && pdata->clkdm_deny_idle)
+		pdata->clkdm_deny_idle(ddata->dev, &ddata->cookie);
+}
+
+static void sysc_clkdm_allow_idle(struct sysc *ddata)
+{
+	struct ti_sysc_platform_data *pdata;
+
+	if (ddata->legacy_mode)
+		return;
+
+	pdata = dev_get_platdata(ddata->dev);
+	if (pdata && pdata->clkdm_allow_idle)
+		pdata->clkdm_allow_idle(ddata->dev, &ddata->cookie);
+}
+
 /**
  * sysc_init_resets - init rstctrl reset line if configured
  * @ddata: device driver data
@@ -795,6 +819,7 @@ static void sysc_show_registers(struct sysc *ddata)
 
 #define SYSC_IDLE_MASK	(SYSC_NR_IDLEMODES - 1)
 
+/* Caller needs to manage sysc_clkdm_deny_idle() and sysc_clkdm_allow_idle() */
 static int sysc_enable_module(struct device *dev)
 {
 	struct sysc *ddata;
@@ -805,11 +830,6 @@ static int sysc_enable_module(struct device *dev)
 	if (ddata->offsets[SYSC_SYSCONFIG] == -ENODEV)
 		return 0;
 
-	/*
-	 * TODO: Need to prevent clockdomain autoidle?
-	 * See clkdm_deny_idle() in arch/mach-omap2/omap_hwmod.c
-	 */
-
 	regbits = ddata->cap->regbits;
 	reg = sysc_read(ddata, ddata->offsets[SYSC_SYSCONFIG]);
 
@@ -861,6 +881,7 @@ static int sysc_best_idle_mode(u32 idlemodes, u32 *best_mode)
 	return 0;
 }
 
+/* Caller needs to manage sysc_clkdm_deny_idle() and sysc_clkdm_allow_idle() */
 static int sysc_disable_module(struct device *dev)
 {
 	struct sysc *ddata;
@@ -872,11 +893,6 @@ static int sysc_disable_module(struct device *dev)
 	if (ddata->offsets[SYSC_SYSCONFIG] == -ENODEV)
 		return 0;
 
-	/*
-	 * TODO: Need to prevent clockdomain autoidle?
-	 * See clkdm_deny_idle() in arch/mach-omap2/omap_hwmod.c
-	 */
-
 	regbits = ddata->cap->regbits;
 	reg = sysc_read(ddata, ddata->offsets[SYSC_SYSCONFIG]);
 
@@ -966,14 +982,16 @@ static int __maybe_unused sysc_runtime_suspend(struct device *dev)
 	if (!ddata->enabled)
 		return 0;
 
+	sysc_clkdm_deny_idle(ddata);
+
 	if (ddata->legacy_mode) {
 		error = sysc_runtime_suspend_legacy(dev, ddata);
 		if (error)
-			return error;
+			goto err_allow_idle;
 	} else {
 		error = sysc_disable_module(dev);
 		if (error)
-			return error;
+			goto err_allow_idle;
 	}
 
 	sysc_disable_main_clocks(ddata);
@@ -983,6 +1001,9 @@ static int __maybe_unused sysc_runtime_suspend(struct device *dev)
 
 	ddata->enabled = false;
 
+err_allow_idle:
+	sysc_clkdm_allow_idle(ddata);
+
 	return error;
 }
 
@@ -996,10 +1017,12 @@ static int __maybe_unused sysc_runtime_resume(struct device *dev)
 	if (ddata->enabled)
 		return 0;
 
+	sysc_clkdm_deny_idle(ddata);
+
 	if (sysc_opt_clks_needed(ddata)) {
 		error = sysc_enable_opt_clocks(ddata);
 		if (error)
-			return error;
+			goto err_allow_idle;
 	}
 
 	error = sysc_enable_main_clocks(ddata);
@@ -1018,6 +1041,8 @@ static int __maybe_unused sysc_runtime_resume(struct device *dev)
 
 	ddata->enabled = true;
 
+	sysc_clkdm_allow_idle(ddata);
+
 	return 0;
 
 err_main_clocks:
@@ -1025,6 +1050,8 @@ static int __maybe_unused sysc_runtime_resume(struct device *dev)
 err_opt_clocks:
 	if (sysc_opt_clks_needed(ddata))
 		sysc_disable_opt_clocks(ddata);
+err_allow_idle:
+	sysc_clkdm_allow_idle(ddata);
 
 	return error;
 }
@@ -1246,6 +1273,33 @@ static void sysc_init_revision_quirks(struct sysc *ddata)
 	}
 }
 
+static int sysc_clockdomain_init(struct sysc *ddata)
+{
+	struct ti_sysc_platform_data *pdata = dev_get_platdata(ddata->dev);
+	struct clk *fck = NULL, *ick = NULL;
+	int error;
+
+	if (!pdata || !pdata->init_clockdomain)
+		return 0;
+
+	switch (ddata->nr_clocks) {
+	case 2:
+		ick = ddata->clocks[SYSC_ICK];
+		/* fallthrough */
+	case 1:
+		fck = ddata->clocks[SYSC_FCK];
+		break;
+	case 0:
+		return 0;
+	}
+
+	error = pdata->init_clockdomain(ddata->dev, fck, ick, &ddata->cookie);
+	if (!error || error == -ENODEV)
+		return 0;
+
+	return error;
+}
+
 /*
  * Note that pdata->init_module() typically does a reset first. After
  * pdata->init_module() is done, PM runtime can be used for the interconnect
@@ -1256,7 +1310,7 @@ static int sysc_legacy_init(struct sysc *ddata)
 	struct ti_sysc_platform_data *pdata = dev_get_platdata(ddata->dev);
 	int error;
 
-	if (!ddata->legacy_mode || !pdata || !pdata->init_module)
+	if (!pdata || !pdata->init_module)
 		return 0;
 
 	error = pdata->init_module(ddata->dev, ddata->mdata, &ddata->cookie);
@@ -1348,7 +1402,13 @@ static int sysc_init_module(struct sysc *ddata)
 	    (SYSC_QUIRK_NO_IDLE | SYSC_QUIRK_NO_IDLE_ON_INIT))
 		manage_clocks = false;
 
+	error = sysc_clockdomain_init(ddata);
+	if (error)
+		return error;
+
 	if (manage_clocks) {
+		sysc_clkdm_deny_idle(ddata);
+
 		error = sysc_enable_opt_clocks(ddata);
 		if (error)
 			return error;
@@ -1361,20 +1421,33 @@ static int sysc_init_module(struct sysc *ddata)
 	ddata->revision = sysc_read_revision(ddata);
 	sysc_init_revision_quirks(ddata);
 
-	error = sysc_legacy_init(ddata);
-	if (error)
-		goto err_main_clocks;
+	if (ddata->legacy_mode) {
+		error = sysc_legacy_init(ddata);
+		if (error)
+			goto err_main_clocks;
+	}
+
+	if (!ddata->legacy_mode && manage_clocks) {
+		error = sysc_enable_module(ddata->dev);
+		if (error)
+			goto err_main_clocks;
+	}
 
 	error = sysc_reset(ddata);
 	if (error)
 		dev_err(ddata->dev, "Reset failed with %d\n", error);
 
+	if (!ddata->legacy_mode && manage_clocks)
+		sysc_disable_module(ddata->dev);
+
 err_main_clocks:
 	if (manage_clocks)
 		sysc_disable_main_clocks(ddata);
 err_opt_clocks:
-	if (manage_clocks)
+	if (manage_clocks) {
 		sysc_disable_opt_clocks(ddata);
+		sysc_clkdm_allow_idle(ddata);
+	}
 
 	return error;
 }
@@ -2013,20 +2086,22 @@ static int sysc_init_pdata(struct sysc *ddata)
 	struct ti_sysc_platform_data *pdata = dev_get_platdata(ddata->dev);
 	struct ti_sysc_module_data *mdata;
 
-	if (!pdata || !ddata->legacy_mode)
+	if (!pdata)
 		return 0;
 
 	mdata = devm_kzalloc(ddata->dev, sizeof(*mdata), GFP_KERNEL);
 	if (!mdata)
 		return -ENOMEM;
 
-	mdata->name = ddata->legacy_mode;
-	mdata->module_pa = ddata->module_pa;
-	mdata->module_size = ddata->module_size;
-	mdata->offsets = ddata->offsets;
-	mdata->nr_offsets = SYSC_MAX_REGS;
-	mdata->cap = ddata->cap;
-	mdata->cfg = &ddata->cfg;
+	if (ddata->legacy_mode) {
+		mdata->name = ddata->legacy_mode;
+		mdata->module_pa = ddata->module_pa;
+		mdata->module_size = ddata->module_size;
+		mdata->offsets = ddata->offsets;
+		mdata->nr_offsets = SYSC_MAX_REGS;
+		mdata->cap = ddata->cap;
+		mdata->cfg = &ddata->cfg;
+	}
 
 	ddata->mdata = mdata;
 
diff --git a/include/linux/platform_data/ti-sysc.h b/include/linux/platform_data/ti-sysc.h
--- a/include/linux/platform_data/ti-sysc.h
+++ b/include/linux/platform_data/ti-sysc.h
@@ -19,6 +19,7 @@ enum ti_sysc_module_type {
 
 struct ti_sysc_cookie {
 	void *data;
+	void *clkdm;
 };
 
 /**
@@ -125,9 +126,16 @@ struct ti_sysc_module_data {
 };
 
 struct device;
+struct clk;
 
 struct ti_sysc_platform_data {
 	struct of_dev_auxdata *auxdata;
+	int (*init_clockdomain)(struct device *dev, struct clk *fck,
+				struct clk *ick, struct ti_sysc_cookie *cookie);
+	void (*clkdm_deny_idle)(struct device *dev,
+				const struct ti_sysc_cookie *cookie);
+	void (*clkdm_allow_idle)(struct device *dev,
+				 const struct ti_sysc_cookie *cookie);
 	int (*init_module)(struct device *dev,
 			   const struct ti_sysc_module_data *data,
 			   struct ti_sysc_cookie *cookie);
-- 
2.21.0
