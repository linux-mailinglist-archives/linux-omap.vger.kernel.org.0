Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A939530720A
	for <lists+linux-omap@lfdr.de>; Thu, 28 Jan 2021 09:56:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232336AbhA1Iv2 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 28 Jan 2021 03:51:28 -0500
Received: from muru.com ([72.249.23.125]:53894 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232151AbhA1Iuu (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 28 Jan 2021 03:50:50 -0500
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 8A1CB80A9;
        Thu, 28 Jan 2021 08:44:10 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>
Cc:     Suman Anna <s-anna@ti.com>, linux-remoteproc@vger.kernel.org,
        linux-omap@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
        Dave Gerlach <d-gerlach@ti.com>,
        Rob Herring <robh+dt@kernel.org>
Subject: [PATCH] remoteproc/wkup_m3: Drop legacy platform data no longer needed
Date:   Thu, 28 Jan 2021 10:44:02 +0200
Message-Id: <20210128084402.1832-1-tony@atomide.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

We have v5.11 booting am3 and 4 with ti-sysc interconnect target module
driver and genpd. As part of that conversion, wkup_m3 driver got converted
to optionally use reset driver instead of legacy platform data with
commit 57df7e370d2a ("remoteproc/wkup_m3: Use reset control driver if
available").

The related SoC calls already got removed with commit b62168e516da ("ARM:
OMAP2+: Fix am4 only build after genpd changes").

We can now just drop the legacy platform data for v5.12 or later, there's
no rush to do this for v5.11.

Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Dave Gerlach <d-gerlach@ti.com>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Suman Anna <s-anna@ti.com>
Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 arch/arm/mach-omap2/pdata-quirks.c    |  1 -
 drivers/remoteproc/wkup_m3_rproc.c    | 37 ++-------------------------
 include/linux/platform_data/wkup_m3.h | 22 ----------------
 3 files changed, 2 insertions(+), 58 deletions(-)
 delete mode 100644 include/linux/platform_data/wkup_m3.h

diff --git a/arch/arm/mach-omap2/pdata-quirks.c b/arch/arm/mach-omap2/pdata-quirks.c
--- a/arch/arm/mach-omap2/pdata-quirks.c
+++ b/arch/arm/mach-omap2/pdata-quirks.c
@@ -21,7 +21,6 @@
 #include <linux/platform_data/hsmmc-omap.h>
 #include <linux/platform_data/iommu-omap.h>
 #include <linux/platform_data/ti-sysc.h>
-#include <linux/platform_data/wkup_m3.h>
 #include <linux/platform_data/asoc-ti-mcbsp.h>
 #include <linux/platform_data/ti-prm.h>
 
diff --git a/drivers/remoteproc/wkup_m3_rproc.c b/drivers/remoteproc/wkup_m3_rproc.c
--- a/drivers/remoteproc/wkup_m3_rproc.c
+++ b/drivers/remoteproc/wkup_m3_rproc.c
@@ -19,8 +19,6 @@
 #include <linux/remoteproc.h>
 #include <linux/reset.h>
 
-#include <linux/platform_data/wkup_m3.h>
-
 #include "remoteproc_internal.h"
 
 #define WKUPM3_MEM_MAX	2
@@ -56,37 +54,15 @@ struct wkup_m3_rproc {
 static int wkup_m3_rproc_start(struct rproc *rproc)
 {
 	struct wkup_m3_rproc *wkupm3 = rproc->priv;
-	struct platform_device *pdev = wkupm3->pdev;
-	struct device *dev = &pdev->dev;
-	struct wkup_m3_platform_data *pdata = dev_get_platdata(dev);
-	int error = 0;
-
-	error = reset_control_deassert(wkupm3->rsts);
 
-	if (!wkupm3->rsts && pdata->deassert_reset(pdev, pdata->reset_name)) {
-		dev_err(dev, "Unable to reset wkup_m3!\n");
-		error = -ENODEV;
-	}
-
-	return error;
+	return reset_control_deassert(wkupm3->rsts);
 }
 
 static int wkup_m3_rproc_stop(struct rproc *rproc)
 {
 	struct wkup_m3_rproc *wkupm3 = rproc->priv;
-	struct platform_device *pdev = wkupm3->pdev;
-	struct device *dev = &pdev->dev;
-	struct wkup_m3_platform_data *pdata = dev_get_platdata(dev);
-	int error = 0;
 
-	error = reset_control_assert(wkupm3->rsts);
-
-	if (!wkupm3->rsts && pdata->assert_reset(pdev, pdata->reset_name)) {
-		dev_err(dev, "Unable to assert reset of wkup_m3!\n");
-		error = -ENODEV;
-	}
-
-	return error;
+	return reset_control_assert(wkupm3->rsts);
 }
 
 static void *wkup_m3_rproc_da_to_va(struct rproc *rproc, u64 da, size_t len)
@@ -128,7 +104,6 @@ MODULE_DEVICE_TABLE(of, wkup_m3_rproc_of_match);
 static int wkup_m3_rproc_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
-	struct wkup_m3_platform_data *pdata = dev->platform_data;
 	/* umem always needs to be processed first */
 	const char *mem_names[WKUPM3_MEM_MAX] = { "umem", "dmem" };
 	struct wkup_m3_rproc *wkupm3;
@@ -171,14 +146,6 @@ static int wkup_m3_rproc_probe(struct platform_device *pdev)
 	wkupm3->rsts = devm_reset_control_get_optional_shared(dev, "rstctrl");
 	if (IS_ERR(wkupm3->rsts))
 		return PTR_ERR(wkupm3->rsts);
-	if (!wkupm3->rsts) {
-		if (!(pdata && pdata->deassert_reset && pdata->assert_reset &&
-		      pdata->reset_name)) {
-			dev_err(dev, "Platform data missing!\n");
-			ret = -ENODEV;
-			goto err_put_rproc;
-		}
-	}
 
 	for (i = 0; i < ARRAY_SIZE(mem_names); i++) {
 		res = platform_get_resource_byname(pdev, IORESOURCE_MEM,
diff --git a/include/linux/platform_data/wkup_m3.h b/include/linux/platform_data/wkup_m3.h
deleted file mode 100644
--- a/include/linux/platform_data/wkup_m3.h
+++ /dev/null
@@ -1,22 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-only */
-/*
- * TI Wakeup M3 remote processor platform data
- *
- * Copyright (C) 2014-2015 Texas Instruments, Inc.
- *
- * Dave Gerlach <d-gerlach@ti.com>
- */
-
-#ifndef _LINUX_PLATFORM_DATA_WKUP_M3_H
-#define _LINUX_PLATFORM_DATA_WKUP_M3_H
-
-struct platform_device;
-
-struct wkup_m3_platform_data {
-	const char *reset_name;
-
-	int (*assert_reset)(struct platform_device *pdev, const char *name);
-	int (*deassert_reset)(struct platform_device *pdev, const char *name);
-};
-
-#endif /* _LINUX_PLATFORM_DATA_WKUP_M3_H */
-- 
2.30.0
