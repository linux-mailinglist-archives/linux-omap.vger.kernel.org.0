Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3BB5A13BF1E
	for <lists+linux-omap@lfdr.de>; Wed, 15 Jan 2020 13:03:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730184AbgAOMDW (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 15 Jan 2020 07:03:22 -0500
Received: from mga09.intel.com ([134.134.136.24]:50611 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729758AbgAOMDW (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 15 Jan 2020 07:03:22 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 15 Jan 2020 04:03:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,322,1574150400"; 
   d="scan'208";a="397864621"
Received: from ahunter-desktop.fi.intel.com (HELO [10.237.72.167]) ([10.237.72.167])
  by orsmga005.jf.intel.com with ESMTP; 15 Jan 2020 04:03:18 -0800
Subject: Re: [PATCH v4 04/11] mmc: sdhci-omap: Add using external dma
To:     Faiz Abbas <faiz_abbas@ti.com>, linux-omap@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-mmc@vger.kernel.org
Cc:     kishon@ti.com, mark.rutland@arm.com, robh+dt@kernel.org,
        ulf.hansson@linaro.org, tony@atomide.com
References: <20200106110133.13791-1-faiz_abbas@ti.com>
 <20200106110133.13791-5-faiz_abbas@ti.com>
From:   Adrian Hunter <adrian.hunter@intel.com>
Organization: Intel Finland Oy, Registered Address: PL 281, 00181 Helsinki,
 Business Identity Code: 0357606 - 4, Domiciled in Helsinki
Message-ID: <8c364afb-2a3a-3b5b-1f97-4c0a60c182b8@intel.com>
Date:   Wed, 15 Jan 2020 14:02:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20200106110133.13791-5-faiz_abbas@ti.com>
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
> sdhci-omap can support both external dma controller via dmaengine framework
> as well as ADMA which standard SD host controller provides.
> 
> Fixes by Faiz Abbas <fazi_abbas@ti.com>:
> 1. Switch to DMA slave mode when using external DMA
> 2. Add offset to mapbase
> 
> Signed-off-by: Chunyan Zhang <zhang.chunyan@linaro.org>
> Signed-off-by: Faiz Abbas <faiz_abbas@ti.com>

Acked-by: Adrian Hunter <adrian.hunter@intel.com>

> ---
>  drivers/mmc/host/Kconfig      |  1 +
>  drivers/mmc/host/sdhci-omap.c | 16 +++++++++++++++-
>  2 files changed, 16 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/mmc/host/Kconfig b/drivers/mmc/host/Kconfig
> index adef971582a1..2c0d90b9383e 100644
> --- a/drivers/mmc/host/Kconfig
> +++ b/drivers/mmc/host/Kconfig
> @@ -1010,6 +1010,7 @@ config MMC_SDHCI_OMAP
>  	depends on MMC_SDHCI_PLTFM && OF
>  	select THERMAL
>  	imply TI_SOC_THERMAL
> +	select MMC_SDHCI_EXTERNAL_DMA if DMA_ENGINE
>  	help
>  	  This selects the Secure Digital Host Controller Interface (SDHCI)
>  	  support present in TI's DRA7 SOCs. The controller supports
> diff --git a/drivers/mmc/host/sdhci-omap.c b/drivers/mmc/host/sdhci-omap.c
> index 083e7e053c95..84d85aa743da 100644
> --- a/drivers/mmc/host/sdhci-omap.c
> +++ b/drivers/mmc/host/sdhci-omap.c
> @@ -685,7 +685,11 @@ static int sdhci_omap_enable_dma(struct sdhci_host *host)
>  	struct sdhci_omap_host *omap_host = sdhci_pltfm_priv(pltfm_host);
>  
>  	reg = sdhci_omap_readl(omap_host, SDHCI_OMAP_CON);
> -	reg |= CON_DMA_MASTER;
> +	reg &= ~CON_DMA_MASTER;
> +	/* Switch to DMA slave mode when using external DMA */
> +	if (!host->use_external_dma)
> +		reg |= CON_DMA_MASTER;
> +
>  	sdhci_omap_writel(omap_host, SDHCI_OMAP_CON, reg);
>  
>  	return 0;
> @@ -1037,6 +1041,7 @@ static int sdhci_omap_probe(struct platform_device *pdev)
>  	const struct of_device_id *match;
>  	struct sdhci_omap_data *data;
>  	const struct soc_device_attribute *soc;
> +	struct resource *regs;
>  
>  	match = of_match_device(omap_sdhci_match, dev);
>  	if (!match)
> @@ -1049,6 +1054,10 @@ static int sdhci_omap_probe(struct platform_device *pdev)
>  	}
>  	offset = data->offset;
>  
> +	regs = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +	if (!regs)
> +		return -ENXIO;
> +
>  	host = sdhci_pltfm_init(pdev, &sdhci_omap_pdata,
>  				sizeof(*omap_host));
>  	if (IS_ERR(host)) {
> @@ -1065,6 +1074,7 @@ static int sdhci_omap_probe(struct platform_device *pdev)
>  	omap_host->timing = MMC_TIMING_LEGACY;
>  	omap_host->flags = data->flags;
>  	host->ioaddr += offset;
> +	host->mapbase = regs->start + offset;
>  
>  	mmc = host->mmc;
>  	sdhci_get_of_property(pdev);
> @@ -1134,6 +1144,10 @@ static int sdhci_omap_probe(struct platform_device *pdev)
>  	host->mmc_host_ops.execute_tuning = sdhci_omap_execute_tuning;
>  	host->mmc_host_ops.enable_sdio_irq = sdhci_omap_enable_sdio_irq;
>  
> +	/* Switch to external DMA only if there is the "dmas" property */
> +	if (of_find_property(dev->of_node, "dmas", NULL))
> +		sdhci_switch_external_dma(host, true);
> +
>  	ret = sdhci_setup_host(host);
>  	if (ret)
>  		goto err_put_sync;
> 

