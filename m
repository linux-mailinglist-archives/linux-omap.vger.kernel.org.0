Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3F00662F27F
	for <lists+linux-omap@lfdr.de>; Fri, 18 Nov 2022 11:25:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241659AbiKRKZz (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 18 Nov 2022 05:25:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51466 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241645AbiKRKZy (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 18 Nov 2022 05:25:54 -0500
Received: from muru.com (muru.com [72.249.23.125])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 055AC9152F;
        Fri, 18 Nov 2022 02:25:54 -0800 (PST)
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id D22C7807E;
        Fri, 18 Nov 2022 10:15:46 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     Bin Liu <b-liu@ti.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org, linux-omap@vger.kernel.org,
        "H . Nikolaus Schaller" <hns@goldelico.com>,
        Sicelo Mhlongo <absicsz@gmail.com>
Subject: [PATCH v2 1/1] usb: musb: omap2430: Fix probe regression for missing resources
Date:   Fri, 18 Nov 2022 12:25:32 +0200
Message-Id: <20221118102532.34458-1-tony@atomide.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Probe for omap2430 glue layer is now broken for interrupt resources in
all cases.

Commit  239071064732 ("partially Revert "usb: musb: Set the DT node on the
child device"") broke probing for SoCs using ti-sysc interconnect target
module as the dt node is not found.

Commit a1a2b7125e10 ("of/platform: Drop static setup of IRQ resource from
DT core") caused omap3 to fail with error "-ENXIO: IRQ mc not found" as
the IRQ resources are no longer automatically populated from devicetree.

Let's fix the issues by calling device_set_of_node_from_dev() only if the
SoC has been updated to probe with ti-sysc. And for legacy SoCs, let's
populate the resources manually as needed.

Note that once we have updated the SoCs to probe with proper devicetree
data in all cases, this is no longer needed. But doing that requires
patching both devicetree and SoC code, so let's fix the probe issues first.

Fixes: a1a2b7125e10 ("of/platform: Drop static setup of IRQ resource from DT core")
Fixes: 239071064732 ("partially Revert "usb: musb: Set the DT node on the child device"")
Cc: H. Nikolaus Schaller <hns@goldelico.com>
Reported-by: Sicelo Mhlongo <absicsz@gmail.com>
Tested-by: Sicelo Mhlongo <absicsz@gmail.com>
Signed-off-by: Tony Lindgren <tony@atomide.com>
---

Changes since v1:

- Drop the accidental clock changes I was testing with

---
 drivers/usb/musb/omap2430.c | 54 +++++++++++++++++++++++++++++++++++++
 1 file changed, 54 insertions(+)

diff --git a/drivers/usb/musb/omap2430.c b/drivers/usb/musb/omap2430.c
--- a/drivers/usb/musb/omap2430.c
+++ b/drivers/usb/musb/omap2430.c
@@ -15,6 +15,7 @@
 #include <linux/list.h>
 #include <linux/io.h>
 #include <linux/of.h>
+#include <linux/of_irq.h>
 #include <linux/platform_device.h>
 #include <linux/dma-mapping.h>
 #include <linux/pm_runtime.h>
@@ -310,6 +311,7 @@ static int omap2430_probe(struct platform_device *pdev)
 	struct device_node		*control_node;
 	struct platform_device		*control_pdev;
 	int				ret = -ENOMEM, val;
+	bool				populate_irqs = false;
 
 	if (!np)
 		return -ENODEV;
@@ -328,6 +330,18 @@ static int omap2430_probe(struct platform_device *pdev)
 	musb->dev.dma_mask		= &omap2430_dmamask;
 	musb->dev.coherent_dma_mask	= omap2430_dmamask;
 
+	/*
+	 * Legacy SoCs using omap_device get confused if node is moved
+	 * because of interconnect properties mixed into the node.
+	 */
+	if (of_get_property(np, "ti,hwmods", NULL)) {
+		dev_warn(&pdev->dev, "please update to probe with ti-sysc\n");
+		populate_irqs = true;
+	} else {
+		device_set_of_node_from_dev(&musb->dev, &pdev->dev);
+	}
+	of_node_put(np);
+
 	glue->dev			= &pdev->dev;
 	glue->musb			= musb;
 	glue->status			= MUSB_UNKNOWN;
@@ -389,6 +403,46 @@ static int omap2430_probe(struct platform_device *pdev)
 		goto err2;
 	}
 
+	if (populate_irqs) {
+		struct resource musb_res[3];
+		struct resource *res;
+		int i = 0;
+
+		memset(musb_res, 0, sizeof(*musb_res) * ARRAY_SIZE(musb_res));
+
+		res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+		if (!res)
+			goto err2;
+
+		musb_res[i].start = res->start;
+		musb_res[i].end = res->end;
+		musb_res[i].flags = res->flags;
+		musb_res[i].name = res->name;
+		i++;
+
+		ret = of_irq_get_byname(np, "mc");
+		if (ret > 0) {
+			musb_res[i].start = ret;
+			musb_res[i].flags = IORESOURCE_IRQ;
+			musb_res[i].name = "mc";
+			i++;
+		}
+
+		ret = of_irq_get_byname(np, "dma");
+		if (ret > 0) {
+			musb_res[i].start = ret;
+			musb_res[i].flags = IORESOURCE_IRQ;
+			musb_res[i].name = "dma";
+			i++;
+		}
+
+		ret = platform_device_add_resources(musb, musb_res, i);
+		if (ret) {
+			dev_err(&pdev->dev, "failed to add IRQ resources\n");
+			goto err2;
+		}
+	}
+
 	ret = platform_device_add_data(musb, pdata, sizeof(*pdata));
 	if (ret) {
 		dev_err(&pdev->dev, "failed to add platform_data\n");
-- 
2.38.1
