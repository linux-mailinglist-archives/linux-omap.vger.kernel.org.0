Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B62A8231D2C
	for <lists+linux-omap@lfdr.de>; Wed, 29 Jul 2020 13:03:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726797AbgG2LD1 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 29 Jul 2020 07:03:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56088 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726790AbgG2LCr (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 29 Jul 2020 07:02:47 -0400
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E80CEC0619D2
        for <linux-omap@vger.kernel.org>; Wed, 29 Jul 2020 04:02:46 -0700 (PDT)
Received: by mail-lj1-x242.google.com with SMTP id q4so24590958lji.2
        for <linux-omap@vger.kernel.org>; Wed, 29 Jul 2020 04:02:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=Yee6qgJdq7q4hHcTlE+UoNb1R6ONA6jnPjk4iWaQESo=;
        b=HIA/wMQ08IF71QrwvX9sk9BBYoLvfOzUHeBd/6WYUrzI43D1F/BAM7nC01i1AWHwac
         DEQDy5JeTgggiXmQpgDYYY40VWflRBGJ3VTCXAPZYBotqfYPEMHeRW2HaqoCgYlCpoZS
         r6PRil7f7+kyW4WR1ZErkwm9zrI0TrnaLPCqaFYlYcvnkrsRkNYgj32i3AlNfevIgaaH
         6x5PkoPbVdUU+ndKbI3vIgRdLBGLWtwkoCGwBw0ccWeBdkYe4gwjwNoYsRgXW9W3tQPy
         P743tcczP3nGofn81HtBGEBW5IqbdpzB+iPN8tiScsP5Xi1CR9XrXsoh+vlwbHySEfd+
         eVtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=Yee6qgJdq7q4hHcTlE+UoNb1R6ONA6jnPjk4iWaQESo=;
        b=ZMQG9RgfF8X+c9LGJrVmLCZUnd0EUNWhuQcWlg19LxpYO6tjQjhSiYlPqRjWqUvms/
         Sgceg7eWwo2TzRK4hBYrHyPz9AMlZXOUANE+4nfYnbNVPLUd4jzUhBubAvQUyn1imrsH
         /6ubK5LKAERrTbI2WkfAg8/vTWfwZ8RsE8TDVR9GIPrxYKCQKJqWzCKXFLgh8Hk8HmkT
         TL4V+kJBMF5nQFeam4MMIOWNr/cUEYLy2rblwlXEd+K+FD4fRjlXA5hMz0yhwzNvfh4n
         vvOFkSJr7LmPC89W0DYRH7NlpWnDAXx9exfiuIVpH8yq24nPb1a9w/XgACqJ9undO6dF
         QgPw==
X-Gm-Message-State: AOAM532SNVFlvnN6txCbKn6QehTMuqkuYYLfBbYU2NFWePUxDY5XKotq
        86WggEVOGMCXz3UZxS88ugMC1w==
X-Google-Smtp-Source: ABdhPJzpfS3DNlqDL2XIvgrKyp/oD5Ih3p794qZkUJtAxCOj4qaK3ET7TjZBtQeC3wF4cQbxV2bm2A==
X-Received: by 2002:a2e:9c8e:: with SMTP id x14mr13574093lji.451.1596020565351;
        Wed, 29 Jul 2020 04:02:45 -0700 (PDT)
Received: from gilgamesh.semihalf.com (193-106-246-138.noc.fibertech.net.pl. [193.106.246.138])
        by smtp.gmail.com with ESMTPSA id e12sm329283ljk.74.2020.07.29.04.02.44
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 29 Jul 2020 04:02:44 -0700 (PDT)
From:   Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>
To:     ssantosh@kernel.org, s-anna@ti.com
Cc:     grzegorz.jaszczyk@linaro.org, santosh.shilimkar@oracle.com,
        robh+dt@kernel.org, lee.jones@linaro.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        wmills@ti.com, praneeth@ti.com, "Andrew F . Davis" <afd@ti.com>
Subject: [PATCH 3/6] soc: ti: pruss: Add support for PRU-ICSSs on AM437x SoCs
Date:   Wed, 29 Jul 2020 13:02:05 +0200
Message-Id: <1596020528-19510-4-git-send-email-grzegorz.jaszczyk@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1596020528-19510-1-git-send-email-grzegorz.jaszczyk@linaro.org>
References: <1596020528-19510-1-git-send-email-grzegorz.jaszczyk@linaro.org>
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

