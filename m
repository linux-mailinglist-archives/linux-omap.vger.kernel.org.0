Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8EAE3213D48
	for <lists+linux-omap@lfdr.de>; Fri,  3 Jul 2020 18:08:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726513AbgGCQHr (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 3 Jul 2020 12:07:47 -0400
Received: from muru.com ([72.249.23.125]:60618 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726236AbgGCQHp (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Fri, 3 Jul 2020 12:07:45 -0400
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id A3552807A;
        Fri,  3 Jul 2020 16:08:36 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     "Andrew F . Davis" <afd@ti.com>, Dave Gerlach <d-gerlach@ti.com>,
        Faiz Abbas <faiz_abbas@ti.com>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        Suman Anna <s-anna@ti.com>, Tero Kristo <t-kristo@ti.com>,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Keerthy <j-keerthy@ti.com>
Subject: [PATCH 1/3] soc: ti: pm33xx: Simplify RTC usage to prepare to drop platform data
Date:   Fri,  3 Jul 2020 09:07:29 -0700
Message-Id: <20200703160731.53698-2-tony@atomide.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200703160731.53698-1-tony@atomide.com>
References: <20200703160731.53698-1-tony@atomide.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

We must re-enable the RTC module clock enabled in RTC+DDR suspend, and
pm33xx has been using platform data callbacks for that. Looks like for
retention suspend the RTC module clock must not be re-enabled.

To remove the legacy platform data callbacks, and eventually be able to
drop the RTC legacy platform data, let's manage the RTC module clock
and register range directly in pm33xx.

Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 arch/arm/mach-omap2/pm33xx-core.c    | 25 ---------------
 drivers/soc/ti/pm33xx.c              | 47 +++++++++++++++++++++++++---
 include/linux/platform_data/pm33xx.h |  3 --
 3 files changed, 42 insertions(+), 33 deletions(-)

diff --git a/arch/arm/mach-omap2/pm33xx-core.c b/arch/arm/mach-omap2/pm33xx-core.c
--- a/arch/arm/mach-omap2/pm33xx-core.c
+++ b/arch/arm/mach-omap2/pm33xx-core.c
@@ -25,7 +25,6 @@
 #include "control.h"
 #include "clockdomain.h"
 #include "iomap.h"
-#include "omap_hwmod.h"
 #include "pm.h"
 #include "powerdomain.h"
 #include "prm33xx.h"
@@ -36,7 +35,6 @@
 static struct powerdomain *cefuse_pwrdm, *gfx_pwrdm, *per_pwrdm, *mpu_pwrdm;
 static struct clockdomain *gfx_l4ls_clkdm;
 static void __iomem *scu_base;
-static struct omap_hwmod *rtc_oh;
 
 static int (*idle_fn)(u32 wfi_flags);
 
@@ -267,13 +265,6 @@ static struct am33xx_pm_sram_addr *amx3_get_sram_addrs(void)
 		return NULL;
 }
 
-static void __iomem *am43xx_get_rtc_base_addr(void)
-{
-	rtc_oh = omap_hwmod_lookup("rtc");
-
-	return omap_hwmod_get_mpu_rt_va(rtc_oh);
-}
-
 static void am43xx_save_context(void)
 {
 }
@@ -297,16 +288,6 @@ static void am43xx_restore_context(void)
 	writel_relaxed(0x0, AM33XX_L4_WK_IO_ADDRESS(0x44df2e14));
 }
 
-static void am43xx_prepare_rtc_suspend(void)
-{
-	omap_hwmod_enable(rtc_oh);
-}
-
-static void am43xx_prepare_rtc_resume(void)
-{
-	omap_hwmod_idle(rtc_oh);
-}
-
 static struct am33xx_pm_platform_data am33xx_ops = {
 	.init = am33xx_suspend_init,
 	.deinit = amx3_suspend_deinit,
@@ -317,10 +298,7 @@ static struct am33xx_pm_platform_data am33xx_ops = {
 	.get_sram_addrs = amx3_get_sram_addrs,
 	.save_context = am33xx_save_context,
 	.restore_context = am33xx_restore_context,
-	.prepare_rtc_suspend = am43xx_prepare_rtc_suspend,
-	.prepare_rtc_resume = am43xx_prepare_rtc_resume,
 	.check_off_mode_enable = am33xx_check_off_mode_enable,
-	.get_rtc_base_addr = am43xx_get_rtc_base_addr,
 };
 
 static struct am33xx_pm_platform_data am43xx_ops = {
@@ -333,10 +311,7 @@ static struct am33xx_pm_platform_data am43xx_ops = {
 	.get_sram_addrs = amx3_get_sram_addrs,
 	.save_context = am43xx_save_context,
 	.restore_context = am43xx_restore_context,
-	.prepare_rtc_suspend = am43xx_prepare_rtc_suspend,
-	.prepare_rtc_resume = am43xx_prepare_rtc_resume,
 	.check_off_mode_enable = am43xx_check_off_mode_enable,
-	.get_rtc_base_addr = am43xx_get_rtc_base_addr,
 };
 
 static struct am33xx_pm_platform_data *am33xx_pm_get_pdata(void)
diff --git a/drivers/soc/ti/pm33xx.c b/drivers/soc/ti/pm33xx.c
--- a/drivers/soc/ti/pm33xx.c
+++ b/drivers/soc/ti/pm33xx.c
@@ -16,6 +16,7 @@
 #include <linux/module.h>
 #include <linux/nvmem-consumer.h>
 #include <linux/of.h>
+#include <linux/of_address.h>
 #include <linux/platform_data/pm33xx.h>
 #include <linux/platform_device.h>
 #include <linux/rtc.h>
@@ -39,6 +40,8 @@
 #define GIC_INT_SET_PENDING_BASE 0x200
 #define AM43XX_GIC_DIST_BASE	0x48241000
 
+static void __iomem *rtc_base_virt;
+static struct clk *rtc_fck;
 static u32 rtc_magic_val;
 
 static int (*am33xx_do_wfi_sram)(unsigned long unused);
@@ -90,7 +93,7 @@ static int am33xx_push_sram_idle(void)
 	ro_sram_data.amx3_pm_sram_data_virt = ocmcram_location_data;
 	ro_sram_data.amx3_pm_sram_data_phys =
 		gen_pool_virt_to_phys(sram_pool_data, ocmcram_location_data);
-	ro_sram_data.rtc_base_virt = pm_ops->get_rtc_base_addr();
+	ro_sram_data.rtc_base_virt = rtc_base_virt;
 
 	/* Save physical address to calculate resume offset during pm init */
 	am33xx_do_wfi_sram_phys = gen_pool_virt_to_phys(sram_pool,
@@ -158,7 +161,7 @@ static struct wkup_m3_wakeup_src rtc_wake_src(void)
 {
 	u32 i;
 
-	i = __raw_readl(pm_ops->get_rtc_base_addr() + 0x44) & 0x40;
+	i = __raw_readl(rtc_base_virt + 0x44) & 0x40;
 
 	if (i) {
 		retrigger_irq = rtc_alarm_wakeup.irq_nr;
@@ -177,13 +180,24 @@ static int am33xx_rtc_only_idle(unsigned long wfi_flags)
 	return 0;
 }
 
+/*
+ * Note that the RTC module clock must be re-enabled only for rtc+ddr suspend.
+ * And looks like the module can stay in SYSC_IDLE_SMART_WKUP mode configured
+ * by the interconnect code just fine for both rtc+ddr suspend and retention
+ * suspend.
+ */
 static int am33xx_pm_suspend(suspend_state_t suspend_state)
 {
 	int i, ret = 0;
 
 	if (suspend_state == PM_SUSPEND_MEM &&
 	    pm_ops->check_off_mode_enable()) {
-		pm_ops->prepare_rtc_suspend();
+		ret = clk_prepare_enable(rtc_fck);
+		if (ret) {
+			dev_err(pm33xx_dev, "Failed to enable clock: %i\n", ret);
+			return ret;
+		}
+
 		pm_ops->save_context();
 		suspend_wfi_flags |= WFI_FLAG_RTC_ONLY;
 		clk_save_context();
@@ -236,7 +250,7 @@ static int am33xx_pm_suspend(suspend_state_t suspend_state)
 	}
 
 	if (suspend_state == PM_SUSPEND_MEM && pm_ops->check_off_mode_enable())
-		pm_ops->prepare_rtc_resume();
+		clk_disable_unprepare(rtc_fck);
 
 	return ret;
 }
@@ -425,14 +439,28 @@ static int am33xx_pm_rtc_setup(void)
 	struct device_node *np;
 	unsigned long val = 0;
 	struct nvmem_device *nvmem;
+	int error;
 
 	np = of_find_node_by_name(NULL, "rtc");
 
 	if (of_device_is_available(np)) {
+		/* RTC interconnect target module clock */
+		rtc_fck = of_clk_get_by_name(np->parent, "fck");
+		if (IS_ERR(rtc_fck))
+			return PTR_ERR(rtc_fck);
+
+		rtc_base_virt = of_iomap(np, 0);
+		if (!rtc_base_virt) {
+			pr_warn("PM: could not iomap rtc");
+			error = -ENODEV;
+			goto err_clk_put;
+		}
+
 		omap_rtc = rtc_class_open("rtc0");
 		if (!omap_rtc) {
 			pr_warn("PM: rtc0 not available");
-			return -EPROBE_DEFER;
+			error = -EPROBE_DEFER;
+			goto err_iounmap;
 		}
 
 		nvmem = devm_nvmem_device_get(&omap_rtc->dev,
@@ -454,6 +482,13 @@ static int am33xx_pm_rtc_setup(void)
 	}
 
 	return 0;
+
+err_iounmap:
+	iounmap(rtc_base_virt);
+err_clk_put:
+	clk_put(rtc_fck);
+
+	return error;
 }
 
 static int am33xx_pm_probe(struct platform_device *pdev)
@@ -544,6 +579,8 @@ static int am33xx_pm_remove(struct platform_device *pdev)
 	suspend_set_ops(NULL);
 	wkup_m3_ipc_put(m3_ipc);
 	am33xx_pm_free_sram();
+	iounmap(rtc_base_virt);
+	clk_put(rtc_fck);
 	return 0;
 }
 
diff --git a/include/linux/platform_data/pm33xx.h b/include/linux/platform_data/pm33xx.h
--- a/include/linux/platform_data/pm33xx.h
+++ b/include/linux/platform_data/pm33xx.h
@@ -54,11 +54,8 @@ struct am33xx_pm_platform_data {
 	void    (*begin_suspend)(void);
 	void    (*finish_suspend)(void);
 	struct  am33xx_pm_sram_addr *(*get_sram_addrs)(void);
-	void __iomem *(*get_rtc_base_addr)(void);
 	void (*save_context)(void);
 	void (*restore_context)(void);
-	void (*prepare_rtc_suspend)(void);
-	void (*prepare_rtc_resume)(void);
 	int (*check_off_mode_enable)(void);
 };
 
-- 
2.27.0
