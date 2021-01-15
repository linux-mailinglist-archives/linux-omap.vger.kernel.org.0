Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EDADE2F75B2
	for <lists+linux-omap@lfdr.de>; Fri, 15 Jan 2021 10:44:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726691AbhAOJnS (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 15 Jan 2021 04:43:18 -0500
Received: from muru.com ([72.249.23.125]:44990 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726642AbhAOJnR (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Fri, 15 Jan 2021 04:43:17 -0500
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 9544E805C;
        Fri, 15 Jan 2021 09:42:46 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-kernel@vger.kernel.org
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org
Subject: [PATCH] drivers: bus: simple-pm-bus: Fix compability with simple-bus for auxdata
Date:   Fri, 15 Jan 2021 11:42:31 +0200
Message-Id: <20210115094231.62491-1-tony@atomide.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

After converting am335x to probe devices with simple-pm-bus I noticed
that we are not passing auxdata for of_platform_populate() like we do
with simple-bus.

While device tree using SoCs should no longer need platform data, there
are still quite a few drivers that still need it.

Let's fix the issue by passing auxdata as platform data to simple-pm-bus.
That way the SoCs needing this can pass the auxdata with OF_DEV_AUXDATA.
And let's pass the auxdata for omaps to fix the issue for am335x.

Later on we may want to consider handling simple-pm-bus directly in
drivers/of/platform.c as then we no longer need the platform data for
simple-pm-bus.

Fixes: 5a230524f879 ("ARM: dts: Use simple-pm-bus for genpd for am3 l4_wkup")
Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 arch/arm/mach-omap2/pdata-quirks.c | 1 +
 drivers/bus/simple-pm-bus.c        | 3 ++-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/arm/mach-omap2/pdata-quirks.c b/arch/arm/mach-omap2/pdata-quirks.c
--- a/arch/arm/mach-omap2/pdata-quirks.c
+++ b/arch/arm/mach-omap2/pdata-quirks.c
@@ -532,6 +532,7 @@ static struct of_dev_auxdata omap_auxdata_lookup[] = {
 		       &dra7_ipu1_dsp_iommu_pdata),
 #endif
 	/* Common auxdata */
+	OF_DEV_AUXDATA("simple-pm-bus", 0, NULL, omap_auxdata_lookup),
 	OF_DEV_AUXDATA("ti,sysc", 0, NULL, &ti_sysc_pdata),
 	OF_DEV_AUXDATA("pinctrl-single", 0, NULL, &pcs_pdata),
 	OF_DEV_AUXDATA("ti,omap-prm-inst", 0, NULL, &ti_prm_pdata),
diff --git a/drivers/bus/simple-pm-bus.c b/drivers/bus/simple-pm-bus.c
--- a/drivers/bus/simple-pm-bus.c
+++ b/drivers/bus/simple-pm-bus.c
@@ -16,6 +16,7 @@
 
 static int simple_pm_bus_probe(struct platform_device *pdev)
 {
+	const struct of_dev_auxdata *lookup = dev_get_platdata(&pdev->dev);
 	struct device_node *np = pdev->dev.of_node;
 
 	dev_dbg(&pdev->dev, "%s\n", __func__);
@@ -23,7 +24,7 @@ static int simple_pm_bus_probe(struct platform_device *pdev)
 	pm_runtime_enable(&pdev->dev);
 
 	if (np)
-		of_platform_populate(np, NULL, NULL, &pdev->dev);
+		of_platform_populate(np, NULL, lookup, &pdev->dev);
 
 	return 0;
 }
-- 
2.30.0
