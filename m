Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 936C81687DF
	for <lists+linux-omap@lfdr.de>; Fri, 21 Feb 2020 20:53:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728351AbgBUTxW (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 21 Feb 2020 14:53:22 -0500
Received: from muru.com ([72.249.23.125]:56926 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728019AbgBUTxV (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Fri, 21 Feb 2020 14:53:21 -0500
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 4EF8E814A;
        Fri, 21 Feb 2020 19:54:04 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     "Andrew F . Davis" <afd@ti.com>, Dave Gerlach <d-gerlach@ti.com>,
        Faiz Abbas <faiz_abbas@ti.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Keerthy <j-keerthy@ti.com>, Nishanth Menon <nm@ti.com>,
        Peter Ujfalusi <peter.ujfalusi@ti.com>,
        Roger Quadros <rogerq@ti.com>, Suman Anna <s-anna@ti.com>,
        Tero Kristo <t-kristo@ti.com>, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Adam Ford <aford173@gmail.com>,
        =?UTF-8?q?Andr=C3=A9=20Hentschel?= <nerv@dawncrow.de>,
        "H . Nikolaus Schaller" <hns@goldelico.com>
Subject: [PATCH 6/7] bus: ti-sysc: Implement SoC revision handling
Date:   Fri, 21 Feb 2020 11:52:55 -0800
Message-Id: <20200221195256.54016-7-tony@atomide.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200221195256.54016-1-tony@atomide.com>
References: <20200221195256.54016-1-tony@atomide.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

We need to know SoC type and features for cases where the same SoC
may be installed in various versions on the same board and would need
a separate dts file otherwise for the different variants.

For example, am3703 is pin compatible with omap3630, but has sgx and
iva accelerators disabled. We must not try to access the sgx or iva
module registers on am3703, and need to set the unavailable devices
disabled early.

Let's also detect omap3430 as that is needed for display subsystem
(DSS) reset later on, and GP vs EMU or HS devices. Further SoC
specific disabled device detection can be added as needed, such as
dra71x vs dra76x rtc and usb4.

Cc: Adam Ford <aford173@gmail.com>
Cc: André Hentschel <nerv@dawncrow.de>
Cc: H. Nikolaus Schaller <hns@goldelico.com>
Cc: Keerthy <j-keerthy@ti.com>
Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 arch/arm/mach-omap2/pdata-quirks.c    |   6 +
 drivers/bus/ti-sysc.c                 | 194 +++++++++++++++++++++++++-
 include/linux/platform_data/ti-sysc.h |   1 +
 3 files changed, 200 insertions(+), 1 deletion(-)

diff --git a/arch/arm/mach-omap2/pdata-quirks.c b/arch/arm/mach-omap2/pdata-quirks.c
--- a/arch/arm/mach-omap2/pdata-quirks.c
+++ b/arch/arm/mach-omap2/pdata-quirks.c
@@ -397,10 +397,16 @@ static int ti_sysc_shutdown_module(struct device *dev,
 	return omap_hwmod_shutdown(cookie->data);
 }
 
+static bool ti_sysc_soc_type_gp(void)
+{
+	return omap_type() == OMAP2_DEVICE_TYPE_GP;
+}
+
 static struct of_dev_auxdata omap_auxdata_lookup[];
 
 static struct ti_sysc_platform_data ti_sysc_pdata = {
 	.auxdata = omap_auxdata_lookup,
+	.soc_type_gp = ti_sysc_soc_type_gp,
 	.init_clockdomain = ti_sysc_clkdm_init,
 	.clkdm_deny_idle = ti_sysc_clkdm_deny_idle,
 	.clkdm_allow_idle = ti_sysc_clkdm_allow_idle,
diff --git a/drivers/bus/ti-sysc.c b/drivers/bus/ti-sysc.c
--- a/drivers/bus/ti-sysc.c
+++ b/drivers/bus/ti-sysc.c
@@ -7,6 +7,7 @@
 #include <linux/clk.h>
 #include <linux/clkdev.h>
 #include <linux/delay.h>
+#include <linux/list.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
 #include <linux/pm_domain.h>
@@ -15,15 +16,47 @@
 #include <linux/of_address.h>
 #include <linux/of_platform.h>
 #include <linux/slab.h>
+#include <linux/sys_soc.h>
 #include <linux/iopoll.h>
 
 #include <linux/platform_data/ti-sysc.h>
 
 #include <dt-bindings/bus/ti-sysc.h>
 
+#define DIS_ISP		BIT(2)
+#define DIS_IVA		BIT(1)
+#define DIS_SGX		BIT(0)
+
+#define SOC_FLAG(match, flag)	{ .machine = match, .data = (void *)(flag), }
+
 #define MAX_MODULE_SOFTRESET_WAIT		10000
 
-static const char * const reg_names[] = { "rev", "sysc", "syss", };
+enum sysc_soc {
+	SOC_UNKNOWN,
+	SOC_2420,
+	SOC_2430,
+	SOC_3430,
+	SOC_3630,
+	SOC_4430,
+	SOC_4460,
+	SOC_4470,
+	SOC_5430,
+	SOC_AM3,
+	SOC_AM4,
+	SOC_DRA7,
+};
+
+struct sysc_address {
+	unsigned long base;
+	struct list_head node;
+};
+
+struct sysc_soc_info {
+	unsigned long general_purpose:1;
+	enum sysc_soc soc;
+	struct mutex list_lock;			/* disabled modules list lock */
+	struct list_head disabled_modules;
+};
 
 enum sysc_clocks {
 	SYSC_FCK,
@@ -39,6 +72,8 @@ enum sysc_clocks {
 	SYSC_MAX_CLOCKS,
 };
 
+static struct sysc_soc_info *sysc_soc;
+static const char * const reg_names[] = { "rev", "sysc", "syss", };
 static const char * const clock_names[SYSC_MAX_CLOCKS] = {
 	"fck", "ick", "opt0", "opt1", "opt2", "opt3", "opt4",
 	"opt5", "opt6", "opt7",
@@ -2382,6 +2417,154 @@ static void ti_sysc_idle(struct work_struct *work)
 		pm_runtime_put_sync(ddata->dev);
 }
 
+/*
+ * SoC model and features detection. Only needed for SoCs that need
+ * special handling for quirks, no need to list others.
+ */
+static const struct soc_device_attribute sysc_soc_match[] = {
+	SOC_FLAG("OMAP242*", SOC_2420),
+	SOC_FLAG("OMAP243*", SOC_2430),
+	SOC_FLAG("OMAP3[45]*", SOC_3430),
+	SOC_FLAG("OMAP3[67]*", SOC_3630),
+	SOC_FLAG("OMAP443*", SOC_4430),
+	SOC_FLAG("OMAP446*", SOC_4460),
+	SOC_FLAG("OMAP447*", SOC_4470),
+	SOC_FLAG("OMAP54*", SOC_5430),
+	SOC_FLAG("AM433", SOC_AM3),
+	SOC_FLAG("AM43*", SOC_AM4),
+	SOC_FLAG("DRA7*", SOC_DRA7),
+
+	{ /* sentinel */ },
+};
+
+/*
+ * List of SoCs variants with disabled features. By default we assume all
+ * devices in the device tree are available so no need to list those SoCs.
+ */
+static const struct soc_device_attribute sysc_soc_feat_match[] = {
+	/* OMAP3430/3530 and AM3517 variants with some accelerators disabled */
+	SOC_FLAG("AM3505", DIS_SGX),
+	SOC_FLAG("OMAP3525", DIS_SGX),
+	SOC_FLAG("OMAP3515", DIS_IVA | DIS_SGX),
+	SOC_FLAG("OMAP3503", DIS_ISP | DIS_IVA | DIS_SGX),
+
+	/* OMAP3630/DM3730 variants with some accelerators disabled */
+	SOC_FLAG("AM3703", DIS_IVA | DIS_SGX),
+	SOC_FLAG("DM3725", DIS_SGX),
+	SOC_FLAG("OMAP3611", DIS_ISP | DIS_IVA | DIS_SGX),
+	SOC_FLAG("OMAP3615/AM3715", DIS_IVA),
+	SOC_FLAG("OMAP3621", DIS_ISP),
+
+	{ /* sentinel */ },
+};
+
+static int sysc_add_disabled(unsigned long base)
+{
+	struct sysc_address *disabled_module;
+
+	disabled_module = kzalloc(sizeof(*disabled_module), GFP_KERNEL);
+	if (!disabled_module)
+		return -ENOMEM;
+
+	disabled_module->base = base;
+
+	mutex_lock(&sysc_soc->list_lock);
+	list_add(&disabled_module->node, &sysc_soc->disabled_modules);
+	mutex_unlock(&sysc_soc->list_lock);
+
+	return 0;
+}
+
+/*
+ * One time init to detect the booted SoC and disable unavailable features.
+ * Note that we initialize static data shared across all ti-sysc instances
+ * so ddata is only used for SoC type. This can be called from module_init
+ * once we no longer need to rely on platform data.
+ */
+static int sysc_init_soc(struct sysc *ddata)
+{
+	const struct soc_device_attribute *match;
+	struct ti_sysc_platform_data *pdata;
+	unsigned long features = 0;
+
+	if (sysc_soc)
+		return 0;
+
+	sysc_soc = kzalloc(sizeof(*sysc_soc), GFP_KERNEL);
+	if (!sysc_soc)
+		return -ENOMEM;
+
+	mutex_init(&sysc_soc->list_lock);
+	INIT_LIST_HEAD(&sysc_soc->disabled_modules);
+	sysc_soc->general_purpose = true;
+
+	pdata = dev_get_platdata(ddata->dev);
+	if (pdata && pdata->soc_type_gp)
+		sysc_soc->general_purpose = pdata->soc_type_gp();
+
+	match = soc_device_match(sysc_soc_match);
+	if (match && match->data)
+		sysc_soc->soc = (int)match->data;
+
+	match = soc_device_match(sysc_soc_feat_match);
+	if (!match)
+		return 0;
+
+	if (match->data)
+		features = (unsigned long)match->data;
+
+	/*
+	 * Add disabled devices to the list based on the module base.
+	 * Note that this must be done before we attempt to access the
+	 * device and have module revision checks working.
+	 */
+	if (features & DIS_ISP)
+		sysc_add_disabled(0x480bd400);
+	if (features & DIS_IVA)
+		sysc_add_disabled(0x5d000000);
+	if (features & DIS_SGX)
+		sysc_add_disabled(0x50000000);
+
+	return 0;
+}
+
+static void sysc_cleanup_soc(void)
+{
+	struct sysc_address *disabled_module;
+	struct list_head *pos, *tmp;
+
+	if (!sysc_soc)
+		return;
+
+	mutex_lock(&sysc_soc->list_lock);
+	list_for_each_safe(pos, tmp, &sysc_soc->disabled_modules) {
+		disabled_module = list_entry(pos, struct sysc_address, node);
+		list_del(pos);
+		kfree(disabled_module);
+	}
+	mutex_unlock(&sysc_soc->list_lock);
+}
+
+static int sysc_check_disabled_devices(struct sysc *ddata)
+{
+	struct sysc_address *disabled_module;
+	struct list_head *pos;
+	int error = 0;
+
+	mutex_lock(&sysc_soc->list_lock);
+	list_for_each(pos, &sysc_soc->disabled_modules) {
+		disabled_module = list_entry(pos, struct sysc_address, node);
+		if (ddata->module_pa == disabled_module->base) {
+			dev_dbg(ddata->dev, "module disabled for this SoC\n");
+			error = -ENODEV;
+			break;
+		}
+	}
+	mutex_unlock(&sysc_soc->list_lock);
+
+	return error;
+}
+
 static const struct of_device_id sysc_match_table[] = {
 	{ .compatible = "simple-bus", },
 	{ /* sentinel */ },
@@ -2400,6 +2583,10 @@ static int sysc_probe(struct platform_device *pdev)
 	ddata->dev = &pdev->dev;
 	platform_set_drvdata(pdev, ddata);
 
+	error = sysc_init_soc(ddata);
+	if (error)
+		return error;
+
 	error = sysc_init_match(ddata);
 	if (error)
 		return error;
@@ -2430,6 +2617,10 @@ static int sysc_probe(struct platform_device *pdev)
 
 	sysc_init_early_quirks(ddata);
 
+	error = sysc_check_disabled_devices(ddata);
+	if (error)
+		return error;
+
 	error = sysc_get_clocks(ddata);
 	if (error)
 		return error;
@@ -2560,6 +2751,7 @@ static void __exit sysc_exit(void)
 {
 	bus_unregister_notifier(&platform_bus_type, &sysc_nb);
 	platform_driver_unregister(&sysc_driver);
+	sysc_cleanup_soc();
 }
 module_exit(sysc_exit);
 
diff --git a/include/linux/platform_data/ti-sysc.h b/include/linux/platform_data/ti-sysc.h
--- a/include/linux/platform_data/ti-sysc.h
+++ b/include/linux/platform_data/ti-sysc.h
@@ -141,6 +141,7 @@ struct clk;
 
 struct ti_sysc_platform_data {
 	struct of_dev_auxdata *auxdata;
+	bool (*soc_type_gp)(void);
 	int (*init_clockdomain)(struct device *dev, struct clk *fck,
 				struct clk *ick, struct ti_sysc_cookie *cookie);
 	void (*clkdm_deny_idle)(struct device *dev,
-- 
2.25.1
