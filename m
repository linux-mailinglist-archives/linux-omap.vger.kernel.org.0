Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E0FEE62EEF9
	for <lists+linux-omap@lfdr.de>; Fri, 18 Nov 2022 09:12:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235098AbiKRIMK (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 18 Nov 2022 03:12:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38546 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230004AbiKRIMJ (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 18 Nov 2022 03:12:09 -0500
Received: from muru.com (muru.com [72.249.23.125])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 50DB88C081;
        Fri, 18 Nov 2022 00:12:08 -0800 (PST)
Received: from localhost (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id D0FE4807E;
        Fri, 18 Nov 2022 08:02:01 +0000 (UTC)
Date:   Fri, 18 Nov 2022 10:12:05 +0200
From:   Tony Lindgren <tony@atomide.com>
To:     Sicelo <absicsz@gmail.com>
Cc:     linux-usb@vger.kernel.org, linux-omap@vger.kernel.org,
        maemo-leste@lists.dyne.org, Felipe Balbi <balbi@kernel.org>,
        phone-devel@vger.kernel.org, Bin Liu <b-liu@ti.com>,
        Rob Herring <robh@kernel.org>,
        "H. Nikolaus Schaller" <hns@goldelico.com>
Subject: Re: [maemo-leste] USB PHY Initialization Fails on Nokia N900 Since
 5.19
Message-ID: <Y3c+VSLcH+c2sLGr@atomide.com>
References: <Y0PhEOl+MwlQ8HAD@tp440p.steeds.sam>
 <Y0UBindrJa1ptyR0@atomide.com>
 <Y0VI+/XJs8nsazwE@tp440p.steeds.sam>
 <Y24JkS3tykIZRH+A@tp440p.steeds.sam>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y24JkS3tykIZRH+A@tp440p.steeds.sam>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Sicelo <absicsz@gmail.com> [221111 08:26]:
> Just for further testing, I added the very ugly patch below. Applied on
> vanilla 6.1-rc3 (i.e. containing 239071064732), USB works normally on
> the N900.
> 
> I copied the irq numbers from omap3xxx.dtsi. Does this give us any hints
> regarding the cause and resolution of this issue?

OK thanks that helps, I think it's because the platform IRQ resources are
no longer being automatically populated from devicetree because of the
issues with deferred probe.

Maybe give the following patch a try and see if it helps?

Then assuming this works as a fix I'll post further changes to make also
omap2430 glue layer to probe with ti-sysc interconnect target module
driver in call cases.

Regards,

Tony

8< -------------------
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
