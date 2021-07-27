Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 30C763D72DC
	for <lists+linux-omap@lfdr.de>; Tue, 27 Jul 2021 12:12:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236289AbhG0KMj (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 27 Jul 2021 06:12:39 -0400
Received: from muru.com ([72.249.23.125]:55778 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236110AbhG0KMe (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 27 Jul 2021 06:12:34 -0400
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 3377280F0;
        Tue, 27 Jul 2021 10:12:51 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     Dave Gerlach <d-gerlach@ti.com>, Faiz Abbas <faiz_abbas@ti.com>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        Suman Anna <s-anna@ti.com>, Tero Kristo <kristo@kernel.org>,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH] soc: ti: Remove pm_runtime_irq_safe() usage for smartreflex
Date:   Tue, 27 Jul 2021 13:12:29 +0300
Message-Id: <20210727101229.33343-1-tony@atomide.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

For the smartreflex device, we need to disable smartreflex on SoC idle,
and have been using pm_runtime_irq_safe() to do that. But we want to
remove the irq_safe usage as PM runtime takes a permanent usage count
on the parent device with it.

In order to remove the need for pm_runtime_irq_safe(), let's gate
the clock directly in the driver. This removes the need to call PM runtime
during idle, and allows us to switch to using CPU_PM in the following
patch.

Note that the smartreflex interconnect target module is configured for smart
idle, but the clock does not have autoidle capability, and needs to be gated
manually. If the clock supported autoidle, we would not need to even gate
the clock.

With this change, we can now remove the related quirk flags for ti-sysc
also.

Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 drivers/bus/ti-sysc.c             |  6 ++--
 drivers/soc/ti/smartreflex.c      | 52 +++++++++++++------------------
 include/linux/power/smartreflex.h |  2 ++
 3 files changed, 26 insertions(+), 34 deletions(-)

diff --git a/drivers/bus/ti-sysc.c b/drivers/bus/ti-sysc.c
--- a/drivers/bus/ti-sysc.c
+++ b/drivers/bus/ti-sysc.c
@@ -1444,10 +1444,6 @@ static const struct sysc_revision_quirk sysc_revision_quirks[] = {
 		   SYSC_QUIRK_LEGACY_IDLE | SYSC_QUIRK_OPT_CLKS_IN_RESET),
 	SYSC_QUIRK("sham", 0, 0x100, 0x110, 0x114, 0x40000c03, 0xffffffff,
 		   SYSC_QUIRK_LEGACY_IDLE),
-	SYSC_QUIRK("smartreflex", 0, -ENODEV, 0x24, -ENODEV, 0x00000000, 0xffffffff,
-		   SYSC_QUIRK_LEGACY_IDLE),
-	SYSC_QUIRK("smartreflex", 0, -ENODEV, 0x38, -ENODEV, 0x00000000, 0xffffffff,
-		   SYSC_QUIRK_LEGACY_IDLE),
 	SYSC_QUIRK("uart", 0, 0x50, 0x54, 0x58, 0x00000046, 0xffffffff,
 		   SYSC_QUIRK_SWSUP_SIDLE | SYSC_QUIRK_LEGACY_IDLE),
 	SYSC_QUIRK("uart", 0, 0x50, 0x54, 0x58, 0x00000052, 0xffffffff,
@@ -1583,6 +1579,8 @@ static const struct sysc_revision_quirk sysc_revision_quirks[] = {
 	SYSC_QUIRK("sdma", 0, 0, 0x2c, 0x28, 0x00010900, 0xffffffff, 0),
 	SYSC_QUIRK("slimbus", 0, 0, 0x10, -ENODEV, 0x40000902, 0xffffffff, 0),
 	SYSC_QUIRK("slimbus", 0, 0, 0x10, -ENODEV, 0x40002903, 0xffffffff, 0),
+	SYSC_QUIRK("smartreflex", 0, -ENODEV, 0x24, -ENODEV, 0x00000000, 0xffffffff, 0),
+	SYSC_QUIRK("smartreflex", 0, -ENODEV, 0x38, -ENODEV, 0x00000000, 0xffffffff, 0),
 	SYSC_QUIRK("spinlock", 0, 0, 0x10, -ENODEV, 0x50020000, 0xffffffff, 0),
 	SYSC_QUIRK("rng", 0, 0x1fe0, 0x1fe4, -ENODEV, 0x00000020, 0xffffffff, 0),
 	SYSC_QUIRK("timer", 0, 0, 0x10, 0x14, 0x00000013, 0xffffffff, 0),
diff --git a/drivers/soc/ti/smartreflex.c b/drivers/soc/ti/smartreflex.c
--- a/drivers/soc/ti/smartreflex.c
+++ b/drivers/soc/ti/smartreflex.c
@@ -126,23 +126,13 @@ static irqreturn_t sr_interrupt(int irq, void *data)
 
 static void sr_set_clk_length(struct omap_sr *sr)
 {
-	struct clk *fck;
 	u32 fclk_speed;
 
 	/* Try interconnect target module fck first if it already exists */
-	fck = clk_get(sr->pdev->dev.parent, "fck");
-	if (IS_ERR(fck)) {
-		fck = clk_get(&sr->pdev->dev, "fck");
-		if (IS_ERR(fck)) {
-			dev_err(&sr->pdev->dev,
-				"%s: unable to get fck for device %s\n",
-				__func__, dev_name(&sr->pdev->dev));
-			return;
-		}
-	}
+	if (IS_ERR(sr->fck))
+		return;
 
-	fclk_speed = clk_get_rate(fck);
-	clk_put(fck);
+	fclk_speed = clk_get_rate(sr->fck);
 
 	switch (fclk_speed) {
 	case 12000000:
@@ -587,21 +577,25 @@ int sr_enable(struct omap_sr *sr, unsigned long volt)
 	/* errminlimit is opp dependent and hence linked to voltage */
 	sr->err_minlimit = nvalue_row->errminlimit;
 
-	pm_runtime_get_sync(&sr->pdev->dev);
+	clk_enable(sr->fck);
 
 	/* Check if SR is already enabled. If yes do nothing */
 	if (sr_read_reg(sr, SRCONFIG) & SRCONFIG_SRENABLE)
-		return 0;
+		goto out_enabled;
 
 	/* Configure SR */
 	ret = sr_class->configure(sr);
 	if (ret)
-		return ret;
+		goto out_enabled;
 
 	sr_write_reg(sr, NVALUERECIPROCAL, nvalue_row->nvalue);
 
 	/* SRCONFIG - enable SR */
 	sr_modify_reg(sr, SRCONFIG, SRCONFIG_SRENABLE, SRCONFIG_SRENABLE);
+
+out_enabled:
+	sr->enabled = 1;
+
 	return 0;
 }
 
@@ -621,7 +615,7 @@ void sr_disable(struct omap_sr *sr)
 	}
 
 	/* Check if SR clocks are already disabled. If yes do nothing */
-	if (pm_runtime_suspended(&sr->pdev->dev))
+	if (!sr->enabled)
 		return;
 
 	/*
@@ -642,7 +636,8 @@ void sr_disable(struct omap_sr *sr)
 		}
 	}
 
-	pm_runtime_put_sync_suspend(&sr->pdev->dev);
+	clk_disable(sr->fck);
+	sr->enabled = 0;
 }
 
 /**
@@ -851,8 +846,12 @@ static int omap_sr_probe(struct platform_device *pdev)
 
 	irq = platform_get_resource(pdev, IORESOURCE_IRQ, 0);
 
+	sr_info->fck = devm_clk_get(pdev->dev.parent, "fck");
+	if (IS_ERR(sr_info->fck))
+		return PTR_ERR(sr_info->fck);
+	clk_prepare(sr_info->fck);
+
 	pm_runtime_enable(&pdev->dev);
-	pm_runtime_irq_safe(&pdev->dev);
 
 	snprintf(sr_info->name, SMARTREFLEX_NAME_LEN, "%s", pdata->name);
 
@@ -878,12 +877,6 @@ static int omap_sr_probe(struct platform_device *pdev)
 
 	list_add(&sr_info->node, &sr_list);
 
-	ret = pm_runtime_get_sync(&pdev->dev);
-	if (ret < 0) {
-		pm_runtime_put_noidle(&pdev->dev);
-		goto err_list_del;
-	}
-
 	/*
 	 * Call into late init to do initializations that require
 	 * both sr driver and sr class driver to be initiallized.
@@ -933,16 +926,13 @@ static int omap_sr_probe(struct platform_device *pdev)
 
 	}
 
-	pm_runtime_put_sync(&pdev->dev);
-
 	return ret;
 
 err_debugfs:
 	debugfs_remove_recursive(sr_info->dbg_dir);
 err_list_del:
 	list_del(&sr_info->node);
-
-	pm_runtime_put_sync(&pdev->dev);
+	clk_unprepare(sr_info->fck);
 
 	return ret;
 }
@@ -950,6 +940,7 @@ static int omap_sr_probe(struct platform_device *pdev)
 static int omap_sr_remove(struct platform_device *pdev)
 {
 	struct omap_sr_data *pdata = pdev->dev.platform_data;
+	struct device *dev = &pdev->dev;
 	struct omap_sr *sr_info;
 
 	if (!pdata) {
@@ -968,7 +959,8 @@ static int omap_sr_remove(struct platform_device *pdev)
 		sr_stop_vddautocomp(sr_info);
 	debugfs_remove_recursive(sr_info->dbg_dir);
 
-	pm_runtime_disable(&pdev->dev);
+	pm_runtime_disable(dev);
+	clk_unprepare(sr_info->fck);
 	list_del(&sr_info->node);
 	return 0;
 }
diff --git a/include/linux/power/smartreflex.h b/include/linux/power/smartreflex.h
--- a/include/linux/power/smartreflex.h
+++ b/include/linux/power/smartreflex.h
@@ -155,6 +155,7 @@ struct omap_sr {
 	struct voltagedomain		*voltdm;
 	struct dentry			*dbg_dir;
 	unsigned int			irq;
+	struct clk			*fck;
 	int				srid;
 	int				ip_type;
 	int				nvalue_count;
@@ -169,6 +170,7 @@ struct omap_sr {
 	u32				senp_mod;
 	u32				senn_mod;
 	void __iomem			*base;
+	unsigned long			enabled:1;
 };
 
 /**
-- 
2.32.0
