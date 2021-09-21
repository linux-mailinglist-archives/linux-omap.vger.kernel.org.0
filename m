Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B342841310B
	for <lists+linux-omap@lfdr.de>; Tue, 21 Sep 2021 12:01:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229683AbhIUKDC (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 21 Sep 2021 06:03:02 -0400
Received: from muru.com ([72.249.23.125]:35428 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231570AbhIUKDA (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 21 Sep 2021 06:03:00 -0400
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id EC5B08132;
        Tue, 21 Sep 2021 10:01:57 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     Dave Gerlach <d-gerlach@ti.com>, Faiz Abbas <faiz_abbas@ti.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        Keerthy <j-keerthy@ti.com>, Kevin Hilman <khilman@baylibre.com>,
        Nishanth Menon <nm@ti.com>, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH 3/9] bus: ti-sysc: Add quirk handling for reinit on context lost
Date:   Tue, 21 Sep 2021 13:01:09 +0300
Message-Id: <20210921100115.59865-4-tony@atomide.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210921100115.59865-1-tony@atomide.com>
References: <20210921100115.59865-1-tony@atomide.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Some interconnect target modules such as otg and gpmc on am335x need a
re-init after resume. As we also have PM runtime cases where the context
may be lost, let's handle these all with cpu_pm.

For the am335x resume path, we already have cpu_pm_resume() call
cpu_pm_cluster_exit().

Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 drivers/bus/ti-sysc.c                 | 108 ++++++++++++++++++++++++--
 include/linux/platform_data/ti-sysc.h |   1 +
 2 files changed, 103 insertions(+), 6 deletions(-)

diff --git a/drivers/bus/ti-sysc.c b/drivers/bus/ti-sysc.c
--- a/drivers/bus/ti-sysc.c
+++ b/drivers/bus/ti-sysc.c
@@ -6,6 +6,7 @@
 #include <linux/io.h>
 #include <linux/clk.h>
 #include <linux/clkdev.h>
+#include <linux/cpu_pm.h>
 #include <linux/delay.h>
 #include <linux/list.h>
 #include <linux/module.h>
@@ -52,11 +53,18 @@ struct sysc_address {
 	struct list_head node;
 };
 
+struct sysc_module {
+	struct sysc *ddata;
+	struct list_head node;
+};
+
 struct sysc_soc_info {
 	unsigned long general_purpose:1;
 	enum sysc_soc soc;
-	struct mutex list_lock;			/* disabled modules list lock */
+	struct mutex list_lock;	/* disabled and restored modules list lock */
 	struct list_head disabled_modules;
+	struct list_head restored_modules;
+	struct notifier_block nb;
 };
 
 enum sysc_clocks {
@@ -2477,6 +2485,79 @@ static struct dev_pm_domain sysc_child_pm_domain = {
 	}
 };
 
+/* Caller needs to take list_lock if ever used outside of cpu_pm */
+static void sysc_reinit_modules(struct sysc_soc_info *soc)
+{
+	struct sysc_module *module;
+	struct list_head *pos;
+	struct sysc *ddata;
+	int error = 0;
+
+	list_for_each(pos, &sysc_soc->restored_modules) {
+		module = list_entry(pos, struct sysc_module, node);
+		ddata = module->ddata;
+		error = sysc_reinit_module(ddata, ddata->enabled);
+	}
+}
+
+/**
+ * sysc_context_notifier - optionally reset and restore module after idle
+ * @nb: notifier block
+ * @cmd: unused
+ * @v: unused
+ *
+ * Some interconnect target modules need to be restored, or reset and restored
+ * on CPU_PM CPU_PM_CLUSTER_EXIT notifier. This is needed at least for am335x
+ * OTG and GPMC target modules even if the modules are unused.
+ */
+static int sysc_context_notifier(struct notifier_block *nb, unsigned long cmd,
+				 void *v)
+{
+	struct sysc_soc_info *soc;
+
+	soc = container_of(nb, struct sysc_soc_info, nb);
+
+	switch (cmd) {
+	case CPU_CLUSTER_PM_ENTER:
+		break;
+	case CPU_CLUSTER_PM_ENTER_FAILED:	/* No need to restore context */
+		break;
+	case CPU_CLUSTER_PM_EXIT:
+		sysc_reinit_modules(soc);
+		break;
+	}
+
+	return NOTIFY_OK;
+}
+
+/**
+ * sysc_add_restored - optionally add reset and restore quirk hanlling
+ * @ddata: device data
+ */
+static void sysc_add_restored(struct sysc *ddata)
+{
+	struct sysc_module *restored_module;
+
+	restored_module = kzalloc(sizeof(*restored_module), GFP_KERNEL);
+	if (!restored_module)
+		return;
+
+	restored_module->ddata = ddata;
+
+	mutex_lock(&sysc_soc->list_lock);
+
+	list_add(&restored_module->node, &sysc_soc->restored_modules);
+
+	if (sysc_soc->nb.notifier_call)
+		goto out_unlock;
+
+	sysc_soc->nb.notifier_call = sysc_context_notifier;
+	cpu_pm_register_notifier(&sysc_soc->nb);
+
+out_unlock:
+	mutex_unlock(&sysc_soc->list_lock);
+}
+
 /**
  * sysc_legacy_idle_quirk - handle children in omap_device compatible way
  * @ddata: device driver data
@@ -2976,12 +3057,14 @@ static int sysc_add_disabled(unsigned long base)
 }
 
 /*
- * One time init to detect the booted SoC and disable unavailable features.
+ * One time init to detect the booted SoC, disable unavailable features
+ * and initialize list for optional cpu_pm notifier.
+ *
  * Note that we initialize static data shared across all ti-sysc instances
  * so ddata is only used for SoC type. This can be called from module_init
  * once we no longer need to rely on platform data.
  */
-static int sysc_init_soc(struct sysc *ddata)
+static int sysc_init_static_data(struct sysc *ddata)
 {
 	const struct soc_device_attribute *match;
 	struct ti_sysc_platform_data *pdata;
@@ -2997,6 +3080,7 @@ static int sysc_init_soc(struct sysc *ddata)
 
 	mutex_init(&sysc_soc->list_lock);
 	INIT_LIST_HEAD(&sysc_soc->disabled_modules);
+	INIT_LIST_HEAD(&sysc_soc->restored_modules);
 	sysc_soc->general_purpose = true;
 
 	pdata = dev_get_platdata(ddata->dev);
@@ -3060,15 +3144,24 @@ static int sysc_init_soc(struct sysc *ddata)
 	return 0;
 }
 
-static void sysc_cleanup_soc(void)
+static void sysc_cleanup_static_data(void)
 {
+	struct sysc_module *restored_module;
 	struct sysc_address *disabled_module;
 	struct list_head *pos, *tmp;
 
 	if (!sysc_soc)
 		return;
 
+	if (sysc_soc->nb.notifier_call)
+		cpu_pm_unregister_notifier(&sysc_soc->nb);
+
 	mutex_lock(&sysc_soc->list_lock);
+	list_for_each_safe(pos, tmp, &sysc_soc->restored_modules) {
+		restored_module = list_entry(pos, struct sysc_module, node);
+		list_del(pos);
+		kfree(restored_module);
+	}
 	list_for_each_safe(pos, tmp, &sysc_soc->disabled_modules) {
 		disabled_module = list_entry(pos, struct sysc_address, node);
 		list_del(pos);
@@ -3136,7 +3229,7 @@ static int sysc_probe(struct platform_device *pdev)
 	ddata->dev = &pdev->dev;
 	platform_set_drvdata(pdev, ddata);
 
-	error = sysc_init_soc(ddata);
+	error = sysc_init_static_data(ddata);
 	if (error)
 		return error;
 
@@ -3234,6 +3327,9 @@ static int sysc_probe(struct platform_device *pdev)
 		pm_runtime_put(&pdev->dev);
 	}
 
+	if (ddata->cfg.quirks & SYSC_QUIRK_REINIT_ON_CTX_LOST)
+		sysc_add_restored(ddata);
+
 	return 0;
 
 err:
@@ -3315,7 +3411,7 @@ static void __exit sysc_exit(void)
 {
 	bus_unregister_notifier(&platform_bus_type, &sysc_nb);
 	platform_driver_unregister(&sysc_driver);
-	sysc_cleanup_soc();
+	sysc_cleanup_static_data();
 }
 module_exit(sysc_exit);
 
diff --git a/include/linux/platform_data/ti-sysc.h b/include/linux/platform_data/ti-sysc.h
--- a/include/linux/platform_data/ti-sysc.h
+++ b/include/linux/platform_data/ti-sysc.h
@@ -50,6 +50,7 @@ struct sysc_regbits {
 	s8 emufree_shift;
 };
 
+#define SYSC_QUIRK_REINIT_ON_CTX_LOST	BIT(28)
 #define SYSC_QUIRK_REINIT_ON_RESUME	BIT(27)
 #define SYSC_QUIRK_GPMC_DEBUG		BIT(26)
 #define SYSC_MODULE_QUIRK_ENA_RESETDONE	BIT(25)
-- 
2.33.0
