Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EFCFB24D798
	for <lists+linux-omap@lfdr.de>; Fri, 21 Aug 2020 16:45:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727982AbgHUOpW (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 21 Aug 2020 10:45:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46684 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727817AbgHUOo3 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 21 Aug 2020 10:44:29 -0400
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1B25DC061755
        for <linux-omap@vger.kernel.org>; Fri, 21 Aug 2020 07:44:28 -0700 (PDT)
Received: by mail-lj1-x242.google.com with SMTP id v4so2156908ljd.0
        for <linux-omap@vger.kernel.org>; Fri, 21 Aug 2020 07:44:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=3iZtNbqc1mBJJJjWeSLbgS2Cn5Da5RL7AKHBFy+181Q=;
        b=O/rp+j/mkB/qPlnoIM4brPw7wKuHchbCzNlJAK9refknfOTqNp8S9SD94tcBhaAaGU
         bvr+qINvuhsIjJjWcYElzw5nzGWCK6eBylvqlAaH/EgtKke/80kgCrfzN/iClSfG7QW+
         C8TkYjtUI7o6dO1RJl1g8cushOqXEEVsKRBaFOfFFMgTc8T+n/FYRNrWbsPGYotewsaW
         upa0na5T5n/UxA1j7i3XjAYfdoZeEaVLFYqQyuD9/hUIg8eYPl+FZ1EDQQWyxTpvDmkl
         frhhwbgUK2oRmpMhqlja8ogqUpVMP4t4gvY/Cl2cA4BI+R34usSfTZCaIbqvGkq8j+QZ
         YNhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=3iZtNbqc1mBJJJjWeSLbgS2Cn5Da5RL7AKHBFy+181Q=;
        b=V/gWvh7+XA8MhIlfbkwBM44ra8kGqX8ZCOTYT085YOKGGWDtMSC22xtde0S36MRN6k
         X0ynzRKsBH7QJx4In4+jkll+rTFm+C/o68X9/sWN0f0fOJpV9GhDJyNttvnJYXaTb0Ei
         iwPdq+eDAct14LHXtWMYtA8fMfiQ/X+mWg9eGwp53i2BYC7XsKp7ntnSwhBskbK0XXox
         C3c8DJxaPc0IJgDR9uT36nnXD3Kd48jY2+tPdXz0F0cfrvlaMc3VzeCf5GFxTpA+6x12
         1Yx7om6tqQWRSxUs1TFa5M85pdT+rKcV6k0fWvPcy/4O/Z4JvwaYVBt0q2CseeMJW6XC
         sNgQ==
X-Gm-Message-State: AOAM533YGpP7NYx78ZJYNiNRTe6fLyp1/sLxnxSZNp227//oM4rk9wQn
        m6oPzbzpjHrfsvErV0Shd8K5uw==
X-Google-Smtp-Source: ABdhPJx1dh3XKL1n3kASOWvLKD/q4ylgbtRjFmMJei1J6JhlNOHQME7Fbz/tJ31RLYgisdtynECWtg==
X-Received: by 2002:a2e:a586:: with SMTP id m6mr1793847ljp.458.1598021066514;
        Fri, 21 Aug 2020 07:44:26 -0700 (PDT)
Received: from gilgamesh.semihalf.com (193-106-246-138.noc.fibertech.net.pl. [193.106.246.138])
        by smtp.gmail.com with ESMTPSA id u10sm425301lfo.39.2020.08.21.07.44.25
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 21 Aug 2020 07:44:26 -0700 (PDT)
From:   Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>
To:     ssantosh@kernel.org, s-anna@ti.com
Cc:     grzegorz.jaszczyk@linaro.org, santosh.shilimkar@oracle.com,
        robh+dt@kernel.org, lee.jones@linaro.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        praneeth@ti.com, tony@atomide.com, "Andrew F . Davis" <afd@ti.com>
Subject: [PATCH v2 3/7] soc: ti: pruss: Add support for PRU-ICSSs on AM437x SoCs
Date:   Fri, 21 Aug 2020 16:42:40 +0200
Message-Id: <1598020964-29877-4-git-send-email-grzegorz.jaszczyk@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1598020964-29877-1-git-send-email-grzegorz.jaszczyk@linaro.org>
References: <1598020964-29877-1-git-send-email-grzegorz.jaszczyk@linaro.org>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

From: Suman Anna <s-anna@ti.com>

The AM437x SoCs have two different PRU-ICSS subsystems: PRU-ICSS1
and a smaller PRU-ICSS0. Enhance the PRUSS platform driver to support
both the PRU-ICSS sub-systems on these SoCs.

The PRU-ICSS1 on AM437x is very similar to the PRU-ICSS on AM33xx
except for few minor differences - increased Instruction RAM, increased
Shared Data RAM2, and 1 less interrupt (PRUSS host interrupt 7 which is
redirected to the other PRUSS) towards the MPU INTC. The PRU-ICSS0 is
a cut-down version of the IP, with less DRAM per PRU, no Shared DRAM etc.
It also does not have direct access to L3 bus regions, there is a single
interface to L3 for both PRUSS0 and PRUSS1, and it would have to go
through the PRUSS1's interface. The PRUSS_SYSCFG register is reserved on
PRUSS0, so any external access requires the programming the corresponding
PRUSS_SYSCFG register in PRUSS1. It does have its own dedicated I/O lines
though. Note that this instance does not support any PRU Ethernet related
use cases.

The adaptation uses SoC-specific compatibles in the driver and uses
a newly introduced pruss_match_private_data structure and the
pruss_get_private_data() function to retrieve a PRUSS instance specific
data using a device-name based lookup logic. The reset and the L3 external
access are managed by the parent interconnect ti-sysc bus driver so that
PRUSS1 and PRUSS0 can be independently supported.

Signed-off-by: Suman Anna <s-anna@ti.com>
Signed-off-by: Andrew F. Davis <afd@ti.com>
Signed-off-by: Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>
---
v1->v2:
 - No changes.
---
 drivers/soc/ti/Kconfig |  2 +-
 drivers/soc/ti/pruss.c | 35 ++++++++++++++++++++++++++++++++++-
 2 files changed, 35 insertions(+), 2 deletions(-)

diff --git a/drivers/soc/ti/Kconfig b/drivers/soc/ti/Kconfig
index b934bc3..40d6a22 100644
--- a/drivers/soc/ti/Kconfig
+++ b/drivers/soc/ti/Kconfig
@@ -103,7 +103,7 @@ config TI_K3_SOCINFO
 
 config TI_PRUSS
 	tristate "TI PRU-ICSS Subsystem Platform drivers"
-	depends on SOC_AM33XX
+	depends on SOC_AM33XX || SOC_AM43XX
 	select MFD_SYSCON
 	help
 	  TI PRU-ICSS Subsystem platform specific support.
diff --git a/drivers/soc/ti/pruss.c b/drivers/soc/ti/pruss.c
index c071bb2..04938ba 100644
--- a/drivers/soc/ti/pruss.c
+++ b/drivers/soc/ti/pruss.c
@@ -17,6 +17,14 @@
 #include <linux/pm_runtime.h>
 #include <linux/pruss_driver.h>
 
+/**
+ * struct pruss_private_data - PRUSS driver private data
+ * @has_no_sharedram: flag to indicate the absence of PRUSS Shared Data RAM
+ */
+struct pruss_private_data {
+	bool has_no_sharedram;
+};
+
 static int pruss_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -25,8 +33,15 @@ static int pruss_probe(struct platform_device *pdev)
 	struct pruss *pruss;
 	struct resource res;
 	int ret, i, index;
+	const struct pruss_private_data *data;
 	const char *mem_names[PRUSS_MEM_MAX] = { "dram0", "dram1", "shrdram2" };
 
+	data = of_device_get_match_data(&pdev->dev);
+	if (IS_ERR(data)) {
+		dev_err(dev, "missing private data\n");
+		return -ENODEV;
+	}
+
 	ret = dma_set_coherent_mask(dev, DMA_BIT_MASK(32));
 	if (ret) {
 		dev_err(dev, "failed to set the DMA coherent mask");
@@ -45,7 +60,14 @@ static int pruss_probe(struct platform_device *pdev)
 		return -ENODEV;
 	}
 
-	for (i = 0; i < ARRAY_SIZE(mem_names); i++) {
+	for (i = 0; i < PRUSS_MEM_MAX; i++) {
+		/*
+		 * On AM437x one of two PRUSS units don't contain Shared RAM,
+		 * skip it
+		 */
+		if (data && data->has_no_sharedram && i == PRUSS_MEM_SHRD_RAM2)
+			continue;
+
 		index = of_property_match_string(child, "reg-names",
 						 mem_names[i]);
 		if (index < 0) {
@@ -126,8 +148,19 @@ static int pruss_remove(struct platform_device *pdev)
 	return 0;
 }
 
+/* instance-specific driver private data */
+static const struct pruss_private_data am437x_pruss1_data = {
+	.has_no_sharedram = false,
+};
+
+static const struct pruss_private_data am437x_pruss0_data = {
+	.has_no_sharedram = true,
+};
+
 static const struct of_device_id pruss_of_match[] = {
 	{ .compatible = "ti,am3356-pruss" },
+	{ .compatible = "ti,am4376-pruss0", .data = &am437x_pruss0_data, },
+	{ .compatible = "ti,am4376-pruss1", .data = &am437x_pruss1_data, },
 	{},
 };
 MODULE_DEVICE_TABLE(of, pruss_of_match);
-- 
2.7.4

