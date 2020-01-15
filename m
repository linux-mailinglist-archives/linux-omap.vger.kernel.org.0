Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E384E13BF14
	for <lists+linux-omap@lfdr.de>; Wed, 15 Jan 2020 13:02:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730174AbgAOMCU (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 15 Jan 2020 07:02:20 -0500
Received: from mga12.intel.com ([192.55.52.136]:43537 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729892AbgAOMCU (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 15 Jan 2020 07:02:20 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 15 Jan 2020 04:02:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,322,1574150400"; 
   d="scan'208";a="397864191"
Received: from ahunter-desktop.fi.intel.com (HELO [10.237.72.167]) ([10.237.72.167])
  by orsmga005.jf.intel.com with ESMTP; 15 Jan 2020 04:02:15 -0800
Subject: Re: [PATCH v4 03/11] mmc: sdhci: add support for using external DMA
 devices
To:     Faiz Abbas <faiz_abbas@ti.com>, linux-omap@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-mmc@vger.kernel.org
Cc:     kishon@ti.com, mark.rutland@arm.com, robh+dt@kernel.org,
        ulf.hansson@linaro.org, tony@atomide.com
References: <20200106110133.13791-1-faiz_abbas@ti.com>
 <20200106110133.13791-4-faiz_abbas@ti.com>
From:   Adrian Hunter <adrian.hunter@intel.com>
Organization: Intel Finland Oy, Registered Address: PL 281, 00181 Helsinki,
 Business Identity Code: 0357606 - 4, Domiciled in Helsinki
Message-ID: <c5ca1285-2aaf-f69a-820c-8602122d2a66@intel.com>
Date:   Wed, 15 Jan 2020 14:01:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20200106110133.13791-4-faiz_abbas@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 6/01/20 1:01 pm, Faiz Abbas wrote:
> From: Chunyan Zhang <zhang.chunyan@linaro.org>
> 
> Some standard SD host controllers can support both external dma
> controllers as well as ADMA/SDMA in which the SD host controller
> acts as DMA master. TI's omap controller is the case as an example.
> 
> Currently the generic SDHCI code supports ADMA/SDMA integrated in
> the host controller but does not have any support for external DMA
> controllers implemented using dmaengine, meaning that custom code is
> needed for any systems that use an external DMA controller with SDHCI.
> 
> Fixes by Faiz Abbas <faiz_abbas@ti.com>:
> 1. Map scatterlists before dmaengine_prep_slave_sg()
> 2. Use dma_async() functions inside of the send_command() path and call
> terminate_sync() in non-atomic context in case of an error.
> 
> Signed-off-by: Chunyan Zhang <zhang.chunyan@linaro.org>
> Signed-off-by: Faiz Abbas <faiz_abbas@ti.com>

Notwithstanding comments from other people:

Acked-by: Adrian Hunter <adrian.hunter@intel.com>

> ---
>  drivers/mmc/host/Kconfig |   3 +
>  drivers/mmc/host/sdhci.c | 228 ++++++++++++++++++++++++++++++++++++++-
>  drivers/mmc/host/sdhci.h |   8 ++
>  3 files changed, 237 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/mmc/host/Kconfig b/drivers/mmc/host/Kconfig
> index d06b2dfe3c95..adef971582a1 100644
> --- a/drivers/mmc/host/Kconfig
> +++ b/drivers/mmc/host/Kconfig
> @@ -1040,3 +1040,6 @@ config MMC_OWL
>  	help
>  	  This selects support for the SD/MMC Host Controller on
>  	  Actions Semi Owl SoCs.
> +
> +config MMC_SDHCI_EXTERNAL_DMA
> +	bool
> diff --git a/drivers/mmc/host/sdhci.c b/drivers/mmc/host/sdhci.c
> index f6999054abcf..8cc78c76bc3d 100644
> --- a/drivers/mmc/host/sdhci.c
> +++ b/drivers/mmc/host/sdhci.c
> @@ -10,6 +10,7 @@
>   */
>  
>  #include <linux/delay.h>
> +#include <linux/dmaengine.h>
>  #include <linux/ktime.h>
>  #include <linux/highmem.h>
>  #include <linux/io.h>
> @@ -1157,6 +1158,188 @@ static void sdhci_prepare_data(struct sdhci_host *host, struct mmc_command *cmd)
>  	sdhci_set_block_info(host, data);
>  }
>  
> +#if IS_ENABLED(CONFIG_MMC_SDHCI_EXTERNAL_DMA)
> +
> +static int sdhci_external_dma_init(struct sdhci_host *host)
> +{
> +	int ret = 0;
> +	struct mmc_host *mmc = host->mmc;
> +
> +	host->tx_chan = dma_request_chan(mmc->parent, "tx");
> +	if (IS_ERR(host->tx_chan)) {
> +		ret = PTR_ERR(host->tx_chan);
> +		if (ret != -EPROBE_DEFER)
> +			pr_warn("Failed to request TX DMA channel.\n");
> +		host->tx_chan = NULL;
> +		return ret;
> +	}
> +
> +	host->rx_chan = dma_request_chan(mmc->parent, "rx");
> +	if (IS_ERR(host->rx_chan)) {
> +		if (host->tx_chan) {
> +			dma_release_channel(host->tx_chan);
> +			host->tx_chan = NULL;
> +		}
> +
> +		ret = PTR_ERR(host->rx_chan);
> +		if (ret != -EPROBE_DEFER)
> +			pr_warn("Failed to request RX DMA channel.\n");
> +		host->rx_chan = NULL;
> +	}
> +
> +	return ret;
> +}
> +
> +static struct dma_chan *sdhci_external_dma_channel(struct sdhci_host *host,
> +						   struct mmc_data *data)
> +{
> +	return data->flags & MMC_DATA_WRITE ? host->tx_chan : host->rx_chan;
> +}
> +
> +static int sdhci_external_dma_setup(struct sdhci_host *host,
> +				    struct mmc_command *cmd)
> +{
> +	int ret, i;
> +	struct dma_async_tx_descriptor *desc;
> +	struct mmc_data *data = cmd->data;
> +	struct dma_chan *chan;
> +	struct dma_slave_config cfg;
> +	dma_cookie_t cookie;
> +	int sg_cnt;
> +
> +	if (!host->mapbase)
> +		return -EINVAL;
> +
> +	cfg.src_addr = host->mapbase + SDHCI_BUFFER;
> +	cfg.dst_addr = host->mapbase + SDHCI_BUFFER;
> +	cfg.src_addr_width = DMA_SLAVE_BUSWIDTH_4_BYTES;
> +	cfg.dst_addr_width = DMA_SLAVE_BUSWIDTH_4_BYTES;
> +	cfg.src_maxburst = data->blksz / 4;
> +	cfg.dst_maxburst = data->blksz / 4;
> +
> +	/* Sanity check: all the SG entries must be aligned by block size. */
> +	for (i = 0; i < data->sg_len; i++) {
> +		if ((data->sg + i)->length % data->blksz)
> +			return -EINVAL;
> +	}
> +
> +	chan = sdhci_external_dma_channel(host, data);
> +
> +	ret = dmaengine_slave_config(chan, &cfg);
> +	if (ret)
> +		return ret;
> +
> +	sg_cnt = sdhci_pre_dma_transfer(host, data, COOKIE_MAPPED);
> +	if (sg_cnt <= 0)
> +		return -EINVAL;
> +
> +	desc = dmaengine_prep_slave_sg(chan, data->sg, data->sg_len,
> +				       mmc_get_dma_dir(data),
> +				       DMA_PREP_INTERRUPT | DMA_CTRL_ACK);
> +	if (!desc)
> +		return -EINVAL;
> +
> +	desc->callback = NULL;
> +	desc->callback_param = NULL;
> +
> +	cookie = dmaengine_submit(desc);
> +	if (cookie < 0)
> +		ret = cookie;
> +
> +	return ret;
> +}
> +
> +static void sdhci_external_dma_release(struct sdhci_host *host)
> +{
> +	if (host->tx_chan) {
> +		dma_release_channel(host->tx_chan);
> +		host->tx_chan = NULL;
> +	}
> +
> +	if (host->rx_chan) {
> +		dma_release_channel(host->rx_chan);
> +		host->rx_chan = NULL;
> +	}
> +
> +	sdhci_switch_external_dma(host, false);
> +}
> +
> +static void __sdhci_external_dma_prepare_data(struct sdhci_host *host,
> +					      struct mmc_command *cmd)
> +{
> +	struct mmc_data *data = cmd->data;
> +
> +	sdhci_initialize_data(host, data);
> +
> +	host->flags |= SDHCI_REQ_USE_DMA;
> +	sdhci_set_transfer_irqs(host);
> +
> +	sdhci_set_block_info(host, data);
> +}
> +
> +static void sdhci_external_dma_prepare_data(struct sdhci_host *host,
> +					    struct mmc_command *cmd)
> +{
> +	if (!sdhci_external_dma_setup(host, cmd)) {
> +		__sdhci_external_dma_prepare_data(host, cmd);
> +	} else {
> +		sdhci_external_dma_release(host);
> +		pr_err("%s: Cannot use external DMA, switch to the DMA/PIO which standard SDHCI provides.\n",
> +		       mmc_hostname(host->mmc));
> +		sdhci_prepare_data(host, cmd);
> +	}
> +}
> +
> +static void sdhci_external_dma_pre_transfer(struct sdhci_host *host,
> +					    struct mmc_command *cmd)
> +{
> +	struct dma_chan *chan;
> +
> +	if (!cmd->data)
> +		return;
> +
> +	chan = sdhci_external_dma_channel(host, cmd->data);
> +	if (chan)
> +		dma_async_issue_pending(chan);
> +}
> +
> +#else
> +
> +static inline int sdhci_external_dma_init(struct sdhci_host *host)
> +{
> +	return -EOPNOTSUPP;
> +}
> +
> +static inline void sdhci_external_dma_release(struct sdhci_host *host)
> +{
> +}
> +
> +static inline void sdhci_external_dma_prepare_data(struct sdhci_host *host,
> +						   struct mmc_command *cmd)
> +{
> +	/* This should never happen */
> +	WARN_ON_ONCE(1);
> +}
> +
> +static inline void sdhci_external_dma_pre_transfer(struct sdhci_host *host,
> +						   struct mmc_command *cmd)
> +{
> +}
> +
> +static inline struct dma_chan *sdhci_external_dma_channel(struct sdhci_host *host,
> +							  struct mmc_data *data)
> +{
> +	return NULL;
> +}
> +
> +#endif
> +
> +void sdhci_switch_external_dma(struct sdhci_host *host, bool en)
> +{
> +	host->use_external_dma = en;
> +}
> +EXPORT_SYMBOL_GPL(sdhci_switch_external_dma);
> +
>  static inline bool sdhci_auto_cmd12(struct sdhci_host *host,
>  				    struct mmc_request *mrq)
>  {
> @@ -1408,8 +1591,12 @@ void sdhci_send_command(struct sdhci_host *host, struct mmc_command *cmd)
>  		sdhci_set_timeout(host, cmd);
>  	}
>  
> -	if (cmd->data)
> -		sdhci_prepare_data(host, cmd);
> +	if (cmd->data) {
> +		if (host->use_external_dma)
> +			sdhci_external_dma_prepare_data(host, cmd);
> +		else
> +			sdhci_prepare_data(host, cmd);
> +	}
>  
>  	sdhci_writel(host, cmd->arg, SDHCI_ARGUMENT);
>  
> @@ -1451,6 +1638,9 @@ void sdhci_send_command(struct sdhci_host *host, struct mmc_command *cmd)
>  		timeout += 10 * HZ;
>  	sdhci_mod_timer(host, cmd->mrq, timeout);
>  
> +	if (host->use_external_dma)
> +		sdhci_external_dma_pre_transfer(host, cmd);
> +
>  	sdhci_writew(host, SDHCI_MAKE_CMD(cmd->opcode, flags), SDHCI_COMMAND);
>  }
>  EXPORT_SYMBOL_GPL(sdhci_send_command);
> @@ -2675,6 +2865,17 @@ static bool sdhci_request_done(struct sdhci_host *host)
>  	if (host->flags & SDHCI_REQ_USE_DMA) {
>  		struct mmc_data *data = mrq->data;
>  
> +		if (host->use_external_dma && data &&
> +		    (mrq->cmd->error || data->error)) {
> +			struct dma_chan *chan = sdhci_external_dma_channel(host, data);
> +
> +			host->mrqs_done[i] = NULL;
> +			spin_unlock_irqrestore(&host->lock, flags);
> +			dmaengine_terminate_sync(chan);
> +			spin_lock_irqsave(&host->lock, flags);
> +			sdhci_set_mrq_done(host, mrq);
> +		}
> +
>  		if (data && data->host_cookie == COOKIE_MAPPED) {
>  			if (host->bounce_buffer) {
>  				/*
> @@ -3810,6 +4011,21 @@ int sdhci_setup_host(struct sdhci_host *host)
>  	if (sdhci_can_64bit_dma(host))
>  		host->flags |= SDHCI_USE_64_BIT_DMA;
>  
> +	if (host->use_external_dma) {
> +		ret = sdhci_external_dma_init(host);
> +		if (ret == -EPROBE_DEFER)
> +			goto unreg;
> +		/*
> +		 * Fall back to use the DMA/PIO integrated in standard SDHCI
> +		 * instead of external DMA devices.
> +		 */
> +		else if (ret)
> +			sdhci_switch_external_dma(host, false);
> +		/* Disable internal DMA sources */
> +		else
> +			host->flags &= ~(SDHCI_USE_SDMA | SDHCI_USE_ADMA);
> +	}
> +
>  	if (host->flags & (SDHCI_USE_SDMA | SDHCI_USE_ADMA)) {
>  		if (host->ops->set_dma_mask)
>  			ret = host->ops->set_dma_mask(host);
> @@ -4290,6 +4506,10 @@ void sdhci_cleanup_host(struct sdhci_host *host)
>  		dma_free_coherent(mmc_dev(mmc), host->align_buffer_sz +
>  				  host->adma_table_sz, host->align_buffer,
>  				  host->align_addr);
> +
> +	if (host->use_external_dma)
> +		sdhci_external_dma_release(host);
> +
>  	host->adma_table = NULL;
>  	host->align_buffer = NULL;
>  }
> @@ -4335,6 +4555,7 @@ int __sdhci_add_host(struct sdhci_host *host)
>  
>  	pr_info("%s: SDHCI controller on %s [%s] using %s\n",
>  		mmc_hostname(mmc), host->hw_name, dev_name(mmc_dev(mmc)),
> +		host->use_external_dma ? "External DMA" :
>  		(host->flags & SDHCI_USE_ADMA) ?
>  		(host->flags & SDHCI_USE_64_BIT_DMA) ? "ADMA 64-bit" : "ADMA" :
>  		(host->flags & SDHCI_USE_SDMA) ? "DMA" : "PIO");
> @@ -4423,6 +4644,9 @@ void sdhci_remove_host(struct sdhci_host *host, int dead)
>  				  host->adma_table_sz, host->align_buffer,
>  				  host->align_addr);
>  
> +	if (host->use_external_dma)
> +		sdhci_external_dma_release(host);
> +
>  	host->adma_table = NULL;
>  	host->align_buffer = NULL;
>  }
> diff --git a/drivers/mmc/host/sdhci.h b/drivers/mmc/host/sdhci.h
> index fe83ece6965b..3166b3ecef89 100644
> --- a/drivers/mmc/host/sdhci.h
> +++ b/drivers/mmc/host/sdhci.h
> @@ -487,6 +487,7 @@ struct sdhci_host {
>  
>  	int irq;		/* Device IRQ */
>  	void __iomem *ioaddr;	/* Mapped address */
> +	phys_addr_t mapbase;	/* physical address base */
>  	char *bounce_buffer;	/* For packing SDMA reads/writes */
>  	dma_addr_t bounce_addr;
>  	unsigned int bounce_buffer_size;
> @@ -535,6 +536,7 @@ struct sdhci_host {
>  	bool pending_reset;	/* Cmd/data reset is pending */
>  	bool irq_wake_enabled;	/* IRQ wakeup is enabled */
>  	bool v4_mode;		/* Host Version 4 Enable */
> +	bool use_external_dma;	/* Host selects to use external DMA */
>  
>  	struct mmc_request *mrqs_done[SDHCI_MAX_MRQS];	/* Requests done */
>  	struct mmc_command *cmd;	/* Current command */
> @@ -564,6 +566,11 @@ struct sdhci_host {
>  	struct timer_list timer;	/* Timer for timeouts */
>  	struct timer_list data_timer;	/* Timer for data timeouts */
>  
> +#if IS_ENABLED(CONFIG_MMC_SDHCI_EXTERNAL_DMA)
> +	struct dma_chan *rx_chan;
> +	struct dma_chan *tx_chan;
> +#endif
> +
>  	u32 caps;		/* CAPABILITY_0 */
>  	u32 caps1;		/* CAPABILITY_1 */
>  	bool read_caps;		/* Capability flags have been read */
> @@ -795,5 +802,6 @@ void sdhci_end_tuning(struct sdhci_host *host);
>  void sdhci_reset_tuning(struct sdhci_host *host);
>  void sdhci_send_tuning(struct sdhci_host *host, u32 opcode);
>  void sdhci_abort_tuning(struct sdhci_host *host, u32 opcode);
> +void sdhci_switch_external_dma(struct sdhci_host *host, bool en);
>  
>  #endif /* __SDHCI_HW_H */
> 

