Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 232C813D841
	for <lists+linux-omap@lfdr.de>; Thu, 16 Jan 2020 11:51:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726917AbgAPKuu (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 16 Jan 2020 05:50:50 -0500
Received: from lelv0143.ext.ti.com ([198.47.23.248]:44820 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726896AbgAPKuu (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 16 Jan 2020 05:50:50 -0500
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 00GAofRR050165;
        Thu, 16 Jan 2020 04:50:41 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1579171841;
        bh=wHWA1m86a0FSlLEJbUVHm8efU8i4VU2SilN6sqFL7fc=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=sHbNFUTP2O6MrzAwhRwjp8e0mf1JRj6gvwlqWMbfCAwc7daTeaK5iFOvqFwM0rLNf
         ByGJBi+BitCqxKSKQW2UN7pa2Y+ZhfHAeL6XFb08p35rPC1mfFAA/fDlnZhEw6iZkZ
         e8wJBPhR9fLuNpld8ElebwIefSnquNX0mPnEeuOw=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 00GAof1B101041
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 16 Jan 2020 04:50:41 -0600
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Thu, 16
 Jan 2020 04:50:41 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Thu, 16 Jan 2020 04:50:40 -0600
Received: from a0230074-OptiPlex-7010.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 00GAoRdV000589;
        Thu, 16 Jan 2020 04:50:38 -0600
From:   Faiz Abbas <faiz_abbas@ti.com>
To:     <linux-omap@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-mmc@vger.kernel.org>
CC:     <adrian.hunter@intel.com>, <kishon@ti.com>, <mark.rutland@arm.com>,
        <robh+dt@kernel.org>, <ulf.hansson@linaro.org>,
        <faiz_abbas@ti.com>, <tony@atomide.com>
Subject: [PATCH v5 03/10] mmc: sdhci: add support for using external DMA devices
Date:   Thu, 16 Jan 2020 16:21:47 +0530
Message-ID: <20200116105154.7685-4-faiz_abbas@ti.com>
X-Mailer: git-send-email 2.19.2
In-Reply-To: <20200116105154.7685-1-faiz_abbas@ti.com>
References: <20200116105154.7685-1-faiz_abbas@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

From: Chunyan Zhang <zhang.chunyan@linaro.org>

Some standard SD host controllers can support both external dma
controllers as well as ADMA/SDMA in which the SD host controller
acts as DMA master. TI's omap controller is the case as an example.

Currently the generic SDHCI code supports ADMA/SDMA integrated in
the host controller but does not have any support for external DMA
controllers implemented using dmaengine, meaning that custom code is
needed for any systems that use an external DMA controller with SDHCI.

Fixes by Faiz Abbas <faiz_abbas@ti.com>:
1. Map scatterlists before dmaengine_prep_slave_sg()
2. Use dma_async() functions inside of the send_command() path and call
terminate_sync() in non-atomic context in case of an error.

Signed-off-by: Chunyan Zhang <zhang.chunyan@linaro.org>
Signed-off-by: Faiz Abbas <faiz_abbas@ti.com>
Acked-by: Adrian Hunter <adrian.hunter@intel.com>
---
 drivers/mmc/host/Kconfig |   3 +
 drivers/mmc/host/sdhci.c | 228 ++++++++++++++++++++++++++++++++++++++-
 drivers/mmc/host/sdhci.h |   8 ++
 3 files changed, 237 insertions(+), 2 deletions(-)

diff --git a/drivers/mmc/host/Kconfig b/drivers/mmc/host/Kconfig
index d06b2dfe3c95..adef971582a1 100644
--- a/drivers/mmc/host/Kconfig
+++ b/drivers/mmc/host/Kconfig
@@ -1040,3 +1040,6 @@ config MMC_OWL
 	help
 	  This selects support for the SD/MMC Host Controller on
 	  Actions Semi Owl SoCs.
+
+config MMC_SDHCI_EXTERNAL_DMA
+	bool
diff --git a/drivers/mmc/host/sdhci.c b/drivers/mmc/host/sdhci.c
index 53cd5d0c4290..4d48129de5e4 100644
--- a/drivers/mmc/host/sdhci.c
+++ b/drivers/mmc/host/sdhci.c
@@ -10,6 +10,7 @@
  */
 
 #include <linux/delay.h>
+#include <linux/dmaengine.h>
 #include <linux/ktime.h>
 #include <linux/highmem.h>
 #include <linux/io.h>
@@ -1155,6 +1156,188 @@ static void sdhci_prepare_data(struct sdhci_host *host, struct mmc_command *cmd)
 	sdhci_set_block_info(host, data);
 }
 
+#if IS_ENABLED(CONFIG_MMC_SDHCI_EXTERNAL_DMA)
+
+static int sdhci_external_dma_init(struct sdhci_host *host)
+{
+	int ret = 0;
+	struct mmc_host *mmc = host->mmc;
+
+	host->tx_chan = dma_request_chan(mmc->parent, "tx");
+	if (IS_ERR(host->tx_chan)) {
+		ret = PTR_ERR(host->tx_chan);
+		if (ret != -EPROBE_DEFER)
+			pr_warn("Failed to request TX DMA channel.\n");
+		host->tx_chan = NULL;
+		return ret;
+	}
+
+	host->rx_chan = dma_request_chan(mmc->parent, "rx");
+	if (IS_ERR(host->rx_chan)) {
+		if (host->tx_chan) {
+			dma_release_channel(host->tx_chan);
+			host->tx_chan = NULL;
+		}
+
+		ret = PTR_ERR(host->rx_chan);
+		if (ret != -EPROBE_DEFER)
+			pr_warn("Failed to request RX DMA channel.\n");
+		host->rx_chan = NULL;
+	}
+
+	return ret;
+}
+
+static struct dma_chan *sdhci_external_dma_channel(struct sdhci_host *host,
+						   struct mmc_data *data)
+{
+	return data->flags & MMC_DATA_WRITE ? host->tx_chan : host->rx_chan;
+}
+
+static int sdhci_external_dma_setup(struct sdhci_host *host,
+				    struct mmc_command *cmd)
+{
+	int ret, i;
+	struct dma_async_tx_descriptor *desc;
+	struct mmc_data *data = cmd->data;
+	struct dma_chan *chan;
+	struct dma_slave_config cfg;
+	dma_cookie_t cookie;
+	int sg_cnt;
+
+	if (!host->mapbase)
+		return -EINVAL;
+
+	cfg.src_addr = host->mapbase + SDHCI_BUFFER;
+	cfg.dst_addr = host->mapbase + SDHCI_BUFFER;
+	cfg.src_addr_width = DMA_SLAVE_BUSWIDTH_4_BYTES;
+	cfg.dst_addr_width = DMA_SLAVE_BUSWIDTH_4_BYTES;
+	cfg.src_maxburst = data->blksz / 4;
+	cfg.dst_maxburst = data->blksz / 4;
+
+	/* Sanity check: all the SG entries must be aligned by block size. */
+	for (i = 0; i < data->sg_len; i++) {
+		if ((data->sg + i)->length % data->blksz)
+			return -EINVAL;
+	}
+
+	chan = sdhci_external_dma_channel(host, data);
+
+	ret = dmaengine_slave_config(chan, &cfg);
+	if (ret)
+		return ret;
+
+	sg_cnt = sdhci_pre_dma_transfer(host, data, COOKIE_MAPPED);
+	if (sg_cnt <= 0)
+		return -EINVAL;
+
+	desc = dmaengine_prep_slave_sg(chan, data->sg, data->sg_len,
+				       mmc_get_dma_dir(data),
+				       DMA_PREP_INTERRUPT | DMA_CTRL_ACK);
+	if (!desc)
+		return -EINVAL;
+
+	desc->callback = NULL;
+	desc->callback_param = NULL;
+
+	cookie = dmaengine_submit(desc);
+	if (dma_submit_error(cookie))
+		ret = cookie;
+
+	return ret;
+}
+
+static void sdhci_external_dma_release(struct sdhci_host *host)
+{
+	if (host->tx_chan) {
+		dma_release_channel(host->tx_chan);
+		host->tx_chan = NULL;
+	}
+
+	if (host->rx_chan) {
+		dma_release_channel(host->rx_chan);
+		host->rx_chan = NULL;
+	}
+
+	sdhci_switch_external_dma(host, false);
+}
+
+static void __sdhci_external_dma_prepare_data(struct sdhci_host *host,
+					      struct mmc_command *cmd)
+{
+	struct mmc_data *data = cmd->data;
+
+	sdhci_initialize_data(host, data);
+
+	host->flags |= SDHCI_REQ_USE_DMA;
+	sdhci_set_transfer_irqs(host);
+
+	sdhci_set_block_info(host, data);
+}
+
+static void sdhci_external_dma_prepare_data(struct sdhci_host *host,
+					    struct mmc_command *cmd)
+{
+	if (!sdhci_external_dma_setup(host, cmd)) {
+		__sdhci_external_dma_prepare_data(host, cmd);
+	} else {
+		sdhci_external_dma_release(host);
+		pr_err("%s: Cannot use external DMA, switch to the DMA/PIO which standard SDHCI provides.\n",
+		       mmc_hostname(host->mmc));
+		sdhci_prepare_data(host, cmd);
+	}
+}
+
+static void sdhci_external_dma_pre_transfer(struct sdhci_host *host,
+					    struct mmc_command *cmd)
+{
+	struct dma_chan *chan;
+
+	if (!cmd->data)
+		return;
+
+	chan = sdhci_external_dma_channel(host, cmd->data);
+	if (chan)
+		dma_async_issue_pending(chan);
+}
+
+#else
+
+static inline int sdhci_external_dma_init(struct sdhci_host *host)
+{
+	return -EOPNOTSUPP;
+}
+
+static inline void sdhci_external_dma_release(struct sdhci_host *host)
+{
+}
+
+static inline void sdhci_external_dma_prepare_data(struct sdhci_host *host,
+						   struct mmc_command *cmd)
+{
+	/* This should never happen */
+	WARN_ON_ONCE(1);
+}
+
+static inline void sdhci_external_dma_pre_transfer(struct sdhci_host *host,
+						   struct mmc_command *cmd)
+{
+}
+
+static inline struct dma_chan *sdhci_external_dma_channel(struct sdhci_host *host,
+							  struct mmc_data *data)
+{
+	return NULL;
+}
+
+#endif
+
+void sdhci_switch_external_dma(struct sdhci_host *host, bool en)
+{
+	host->use_external_dma = en;
+}
+EXPORT_SYMBOL_GPL(sdhci_switch_external_dma);
+
 static inline bool sdhci_auto_cmd12(struct sdhci_host *host,
 				    struct mmc_request *mrq)
 {
@@ -1406,8 +1589,12 @@ void sdhci_send_command(struct sdhci_host *host, struct mmc_command *cmd)
 		sdhci_set_timeout(host, cmd);
 	}
 
-	if (cmd->data)
-		sdhci_prepare_data(host, cmd);
+	if (cmd->data) {
+		if (host->use_external_dma)
+			sdhci_external_dma_prepare_data(host, cmd);
+		else
+			sdhci_prepare_data(host, cmd);
+	}
 
 	sdhci_writel(host, cmd->arg, SDHCI_ARGUMENT);
 
@@ -1449,6 +1636,9 @@ void sdhci_send_command(struct sdhci_host *host, struct mmc_command *cmd)
 		timeout += 10 * HZ;
 	sdhci_mod_timer(host, cmd->mrq, timeout);
 
+	if (host->use_external_dma)
+		sdhci_external_dma_pre_transfer(host, cmd);
+
 	sdhci_writew(host, SDHCI_MAKE_CMD(cmd->opcode, flags), SDHCI_COMMAND);
 }
 EXPORT_SYMBOL_GPL(sdhci_send_command);
@@ -2673,6 +2863,17 @@ static bool sdhci_request_done(struct sdhci_host *host)
 	if (host->flags & SDHCI_REQ_USE_DMA) {
 		struct mmc_data *data = mrq->data;
 
+		if (host->use_external_dma && data &&
+		    (mrq->cmd->error || data->error)) {
+			struct dma_chan *chan = sdhci_external_dma_channel(host, data);
+
+			host->mrqs_done[i] = NULL;
+			spin_unlock_irqrestore(&host->lock, flags);
+			dmaengine_terminate_sync(chan);
+			spin_lock_irqsave(&host->lock, flags);
+			sdhci_set_mrq_done(host, mrq);
+		}
+
 		if (data && data->host_cookie == COOKIE_MAPPED) {
 			if (host->bounce_buffer) {
 				/*
@@ -3808,6 +4009,21 @@ int sdhci_setup_host(struct sdhci_host *host)
 	if (sdhci_can_64bit_dma(host))
 		host->flags |= SDHCI_USE_64_BIT_DMA;
 
+	if (host->use_external_dma) {
+		ret = sdhci_external_dma_init(host);
+		if (ret == -EPROBE_DEFER)
+			goto unreg;
+		/*
+		 * Fall back to use the DMA/PIO integrated in standard SDHCI
+		 * instead of external DMA devices.
+		 */
+		else if (ret)
+			sdhci_switch_external_dma(host, false);
+		/* Disable internal DMA sources */
+		else
+			host->flags &= ~(SDHCI_USE_SDMA | SDHCI_USE_ADMA);
+	}
+
 	if (host->flags & (SDHCI_USE_SDMA | SDHCI_USE_ADMA)) {
 		if (host->ops->set_dma_mask)
 			ret = host->ops->set_dma_mask(host);
@@ -4288,6 +4504,10 @@ void sdhci_cleanup_host(struct sdhci_host *host)
 		dma_free_coherent(mmc_dev(mmc), host->align_buffer_sz +
 				  host->adma_table_sz, host->align_buffer,
 				  host->align_addr);
+
+	if (host->use_external_dma)
+		sdhci_external_dma_release(host);
+
 	host->adma_table = NULL;
 	host->align_buffer = NULL;
 }
@@ -4333,6 +4553,7 @@ int __sdhci_add_host(struct sdhci_host *host)
 
 	pr_info("%s: SDHCI controller on %s [%s] using %s\n",
 		mmc_hostname(mmc), host->hw_name, dev_name(mmc_dev(mmc)),
+		host->use_external_dma ? "External DMA" :
 		(host->flags & SDHCI_USE_ADMA) ?
 		(host->flags & SDHCI_USE_64_BIT_DMA) ? "ADMA 64-bit" : "ADMA" :
 		(host->flags & SDHCI_USE_SDMA) ? "DMA" : "PIO");
@@ -4421,6 +4642,9 @@ void sdhci_remove_host(struct sdhci_host *host, int dead)
 				  host->adma_table_sz, host->align_buffer,
 				  host->align_addr);
 
+	if (host->use_external_dma)
+		sdhci_external_dma_release(host);
+
 	host->adma_table = NULL;
 	host->align_buffer = NULL;
 }
diff --git a/drivers/mmc/host/sdhci.h b/drivers/mmc/host/sdhci.h
index fe83ece6965b..3166b3ecef89 100644
--- a/drivers/mmc/host/sdhci.h
+++ b/drivers/mmc/host/sdhci.h
@@ -487,6 +487,7 @@ struct sdhci_host {
 
 	int irq;		/* Device IRQ */
 	void __iomem *ioaddr;	/* Mapped address */
+	phys_addr_t mapbase;	/* physical address base */
 	char *bounce_buffer;	/* For packing SDMA reads/writes */
 	dma_addr_t bounce_addr;
 	unsigned int bounce_buffer_size;
@@ -535,6 +536,7 @@ struct sdhci_host {
 	bool pending_reset;	/* Cmd/data reset is pending */
 	bool irq_wake_enabled;	/* IRQ wakeup is enabled */
 	bool v4_mode;		/* Host Version 4 Enable */
+	bool use_external_dma;	/* Host selects to use external DMA */
 
 	struct mmc_request *mrqs_done[SDHCI_MAX_MRQS];	/* Requests done */
 	struct mmc_command *cmd;	/* Current command */
@@ -564,6 +566,11 @@ struct sdhci_host {
 	struct timer_list timer;	/* Timer for timeouts */
 	struct timer_list data_timer;	/* Timer for data timeouts */
 
+#if IS_ENABLED(CONFIG_MMC_SDHCI_EXTERNAL_DMA)
+	struct dma_chan *rx_chan;
+	struct dma_chan *tx_chan;
+#endif
+
 	u32 caps;		/* CAPABILITY_0 */
 	u32 caps1;		/* CAPABILITY_1 */
 	bool read_caps;		/* Capability flags have been read */
@@ -795,5 +802,6 @@ void sdhci_end_tuning(struct sdhci_host *host);
 void sdhci_reset_tuning(struct sdhci_host *host);
 void sdhci_send_tuning(struct sdhci_host *host, u32 opcode);
 void sdhci_abort_tuning(struct sdhci_host *host, u32 opcode);
+void sdhci_switch_external_dma(struct sdhci_host *host, bool en);
 
 #endif /* __SDHCI_HW_H */
-- 
2.19.2

