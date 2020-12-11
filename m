Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2ED752D7EDE
	for <lists+linux-omap@lfdr.de>; Fri, 11 Dec 2020 19:54:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390361AbgLKSw0 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 11 Dec 2020 13:52:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56254 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2406396AbgLKStS (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 11 Dec 2020 13:49:18 -0500
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5ED2DC0611CD
        for <linux-omap@vger.kernel.org>; Fri, 11 Dec 2020 10:48:37 -0800 (PST)
Received: by mail-lj1-x236.google.com with SMTP id b10so9738909ljp.6
        for <linux-omap@vger.kernel.org>; Fri, 11 Dec 2020 10:48:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=slw9FlW0qv1ca+qHNtWZZr6egc4uA3g+4z4fUtQXfwA=;
        b=yH9YN3CX1M9ZwQcP1i/VPDSn6CBQQeYWJ6J4iAu8dH/wDVXFGel/wCGQsDQHQANMor
         TeJtPjOuECCIeyaFvQum4ty3bEZ3psaeaQA/XNhwn3DziOu71yVzWlYfmXQkJMRG1s0S
         nK1DkXXCN1zjvq9ei9e34hv4kHTDPfV42Drzed/fjdDTz51oIGYD1O4oksGsO7decono
         UVkU14uGeDyMesT6C/dalGUZAWwL3s5qVXdCaW2NVL92QoPe3WHia3nL9R0ne5mq8qB4
         tWatL1shAmIHT/ks2cyeP1Za0xUE9INLNMcedXJrBxSlU30/P17qSlzn2LtJx3DGZSfB
         U31g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=slw9FlW0qv1ca+qHNtWZZr6egc4uA3g+4z4fUtQXfwA=;
        b=Q3JCm6TZFMoik4vkPULM+t1tyyWMpaCPuRGwHXEk7IUjNta5uHh5gDTgMD2BQj4PRg
         Pahdpb7SO6SmBcBfRFIWLR1+/Y/xdHN2DfuWH0oq9jEkm0KqJC/WVBUqNGNttCDIkIow
         MHuD3QnoY/b6Pth6dShKFwyqLipocDPjp6mjeFtbldK1jQVlyLKxo7EwrG6Y0XKLjAdV
         JhiJiheZmxkuhduDbLiCDyn3SCS+LHtJDQkzeMRX3DsSkwBEMxDKtHlzJltls74sPSaS
         a49D89ixkNYeaFwNMnoKXpsHf0HJlJuj6ynWpBdpYvuSKt+Qjl1oP7TEmOtiLMpCf9KG
         WLkg==
X-Gm-Message-State: AOAM532zJ2Hb/uBeGXL4xiB23vCy2SfhjhQtFPx6itTuv/+xnC85WZgX
        So65nTls135ajofh5n1U+nzmnp8pvGa0dQ==
X-Google-Smtp-Source: ABdhPJwU25aIo1XwzXoLDVdoqhtupRDHxNWYJb+Q3fz5D0yCcYmr0YPL+/BHnvlJZpTJUhqKK7TFmQ==
X-Received: by 2002:a05:651c:211e:: with SMTP id a30mr6105765ljq.18.1607712515842;
        Fri, 11 Dec 2020 10:48:35 -0800 (PST)
Received: from gilgamesh.semihalf.com (193-106-246-138.noc.fibertech.net.pl. [193.106.246.138])
        by smtp.gmail.com with ESMTPSA id b12sm903316lfb.139.2020.12.11.10.48.34
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 11 Dec 2020 10:48:35 -0800 (PST)
From:   Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>
To:     ssantosh@kernel.org, s-anna@ti.com
Cc:     grzegorz.jaszczyk@linaro.org, santosh.shilimkar@oracle.com,
        lee.jones@linaro.org, linux-kernel@vger.kernel.org,
        linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        praneeth@ti.com, tony@atomide.com,
        linux-remoteproc@vger.kernel.org, mathieu.poirier@linaro.org
Subject: [PATCH 5/6] soc: ti: pruss: Add helper function to enable OCP master ports
Date:   Fri, 11 Dec 2020 19:48:10 +0100
Message-Id: <20201211184811.6490-6-grzegorz.jaszczyk@linaro.org>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20201211184811.6490-1-grzegorz.jaszczyk@linaro.org>
References: <20201211184811.6490-1-grzegorz.jaszczyk@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

From: Suman Anna <s-anna@ti.com>

The PRU-ICSS subsystem on OMAP-architecture based SoCS (AM33xx, AM437x
and AM57xx SoCs) has a control bit STANDBY_INIT in the PRUSS_CFG register
to initiate a Standby sequence (when set) and trigger a MStandby request
to the SoC's PRCM module. This same bit is also used to enable the OCP
master ports (when cleared). The clearing of the STANDBY_INIT bit requires
an acknowledgment from PRCM and is done through the monitoring of the
PRUSS_SYSCFG.SUB_MWAIT bit.

Add a helper function pruss_cfg_ocp_master_ports() to allow the PRU
client drivers to control this bit and enable or disable the firmware
running on PRU cores access to any peripherals or memory to achieve
desired functionality. The access is disabled by default on power-up
and on any suspend (context is not maintained).

Signed-off-by: Suman Anna <s-anna@ti.com>
Co-developed-by: Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>
Signed-off-by: Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>
---
 drivers/soc/ti/pruss.c | 81 ++++++++++++++++++++++++++++++++++++++++--
 include/linux/pruss.h  |  6 ++++
 2 files changed, 85 insertions(+), 2 deletions(-)

diff --git a/drivers/soc/ti/pruss.c b/drivers/soc/ti/pruss.c
index 56e0ac948796..b373d5579647 100644
--- a/drivers/soc/ti/pruss.c
+++ b/drivers/soc/ti/pruss.c
@@ -22,14 +22,19 @@
 #include <linux/remoteproc.h>
 #include <linux/slab.h>
 
+#define SYSCFG_STANDBY_INIT	BIT(4)
+#define SYSCFG_SUB_MWAIT_READY	BIT(5)
+
 /**
  * struct pruss_private_data - PRUSS driver private data
  * @has_no_sharedram: flag to indicate the absence of PRUSS Shared Data RAM
  * @has_core_mux_clock: flag to indicate the presence of PRUSS core clock
+ * @has_ocp_syscfg: flag to indicate if OCP SYSCFG is present
  */
 struct pruss_private_data {
 	bool has_no_sharedram;
 	bool has_core_mux_clock;
+	bool has_ocp_syscfg;
 };
 
 /**
@@ -205,6 +210,72 @@ int pruss_cfg_update(struct pruss *pruss, unsigned int reg,
 }
 EXPORT_SYMBOL_GPL(pruss_cfg_update);
 
+/**
+ * pruss_cfg_ocp_master_ports() - configure PRUSS OCP master ports
+ * @pruss: the pruss instance handle
+ * @enable: set to true for enabling or false for disabling the OCP master ports
+ *
+ * This function programs the PRUSS_SYSCFG.STANDBY_INIT bit either to enable or
+ * disable the OCP master ports (applicable only on SoCs using OCP interconnect
+ * like the OMAP family). Clearing the bit achieves dual functionalities - one
+ * is to deassert the MStandby signal to the device PRCM, and the other is to
+ * enable OCP master ports to allow accesses outside of the PRU-ICSS. The
+ * function has to wait for the PRCM to acknowledge through the monitoring of
+ * the PRUSS_SYSCFG.SUB_MWAIT bit when enabling master ports. Setting the bit
+ * disables the master access, and also signals the PRCM that the PRUSS is ready
+ * for Standby.
+ *
+ * Return: 0 on success, or an error code otherwise. ETIMEDOUT is returned
+ * when the ready-state fails.
+ */
+int pruss_cfg_ocp_master_ports(struct pruss *pruss, bool enable)
+{
+	int ret;
+	u32 syscfg_val, i;
+	const struct pruss_private_data *data;
+
+	if (IS_ERR_OR_NULL(pruss))
+		return -EINVAL;
+
+	data = of_device_get_match_data(pruss->dev);
+
+	/* nothing to do on non OMAP-SoCs */
+	if (!data || !data->has_ocp_syscfg)
+		return 0;
+
+	/* assert the MStandby signal during disable path */
+	if (!enable)
+		return pruss_cfg_update(pruss, PRUSS_CFG_SYSCFG,
+					SYSCFG_STANDBY_INIT,
+					SYSCFG_STANDBY_INIT);
+
+	/* enable the OCP master ports and disable MStandby */
+	ret = pruss_cfg_update(pruss, PRUSS_CFG_SYSCFG, SYSCFG_STANDBY_INIT, 0);
+	if (ret)
+		return ret;
+
+	/* wait till we are ready for transactions - delay is arbitrary */
+	for (i = 0; i < 10; i++) {
+		ret = pruss_cfg_read(pruss, PRUSS_CFG_SYSCFG, &syscfg_val);
+		if (ret)
+			goto disable;
+
+		if (!(syscfg_val & SYSCFG_SUB_MWAIT_READY))
+			return 0;
+
+		udelay(5);
+	}
+
+	dev_err(pruss->dev, "timeout waiting for SUB_MWAIT_READY\n");
+	ret = -ETIMEDOUT;
+
+disable:
+	pruss_cfg_update(pruss, PRUSS_CFG_SYSCFG, SYSCFG_STANDBY_INIT,
+			 SYSCFG_STANDBY_INIT);
+	return ret;
+}
+EXPORT_SYMBOL_GPL(pruss_cfg_ocp_master_ports);
+
 static void pruss_of_free_clk_provider(void *data)
 {
 	struct device_node *clk_mux_np = data;
@@ -487,10 +558,16 @@ static int pruss_remove(struct platform_device *pdev)
 /* instance-specific driver private data */
 static const struct pruss_private_data am437x_pruss1_data = {
 	.has_no_sharedram = false,
+	.has_ocp_syscfg = true,
 };
 
 static const struct pruss_private_data am437x_pruss0_data = {
 	.has_no_sharedram = true,
+	.has_ocp_syscfg = false,
+};
+
+static const struct pruss_private_data am33xx_am57xx_data = {
+	.has_ocp_syscfg = true,
 };
 
 static const struct pruss_private_data am65x_j721e_pruss_data = {
@@ -498,10 +575,10 @@ static const struct pruss_private_data am65x_j721e_pruss_data = {
 };
 
 static const struct of_device_id pruss_of_match[] = {
-	{ .compatible = "ti,am3356-pruss" },
+	{ .compatible = "ti,am3356-pruss", .data = &am33xx_am57xx_data },
 	{ .compatible = "ti,am4376-pruss0", .data = &am437x_pruss0_data, },
 	{ .compatible = "ti,am4376-pruss1", .data = &am437x_pruss1_data, },
-	{ .compatible = "ti,am5728-pruss" },
+	{ .compatible = "ti,am5728-pruss", .data = &am33xx_am57xx_data },
 	{ .compatible = "ti,k2g-pruss" },
 	{ .compatible = "ti,am654-icssg", .data = &am65x_j721e_pruss_data, },
 	{ .compatible = "ti,j721e-icssg", .data = &am65x_j721e_pruss_data, },
diff --git a/include/linux/pruss.h b/include/linux/pruss.h
index c8d73cc6baa9..b3087dc9730e 100644
--- a/include/linux/pruss.h
+++ b/include/linux/pruss.h
@@ -163,6 +163,7 @@ int pruss_release_mem_region(struct pruss *pruss,
 int pruss_cfg_read(struct pruss *pruss, unsigned int reg, unsigned int *val);
 int pruss_cfg_update(struct pruss *pruss, unsigned int reg,
 		     unsigned int mask, unsigned int val);
+int pruss_cfg_ocp_master_ports(struct pruss *pruss, bool enable);
 
 #else
 
@@ -198,6 +199,11 @@ static inline int pruss_cfg_update(struct pruss *pruss, unsigned int reg,
 	return -ENOTSUPP;
 }
 
+static inline int pruss_cfg_ocp_master_ports(struct pruss *pruss, bool enable)
+{
+	return -ENOTSUPP;
+}
+
 #endif /* CONFIG_TI_PRUSS */
 
 #if IS_ENABLED(CONFIG_PRU_REMOTEPROC)
-- 
2.29.0

