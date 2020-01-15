Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 513E313BFA4
	for <lists+linux-omap@lfdr.de>; Wed, 15 Jan 2020 13:15:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731062AbgAOMPD (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 15 Jan 2020 07:15:03 -0500
Received: from mga09.intel.com ([134.134.136.24]:51825 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730989AbgAOMPB (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 15 Jan 2020 07:15:01 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 15 Jan 2020 04:15:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,322,1574150400"; 
   d="scan'208";a="397867467"
Received: from ahunter-desktop.fi.intel.com (HELO [10.237.72.167]) ([10.237.72.167])
  by orsmga005.jf.intel.com with ESMTP; 15 Jan 2020 04:14:58 -0800
Subject: Re: [PATCH v4 09/11] mmc: sdhci-omap: Add ti,needs-special-reset
 property
To:     Faiz Abbas <faiz_abbas@ti.com>, linux-omap@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-mmc@vger.kernel.org
Cc:     kishon@ti.com, mark.rutland@arm.com, robh+dt@kernel.org,
        ulf.hansson@linaro.org, tony@atomide.com
References: <20200106110133.13791-1-faiz_abbas@ti.com>
 <20200106110133.13791-10-faiz_abbas@ti.com>
From:   Adrian Hunter <adrian.hunter@intel.com>
Organization: Intel Finland Oy, Registered Address: PL 281, 00181 Helsinki,
 Business Identity Code: 0357606 - 4, Domiciled in Helsinki
Message-ID: <df86859f-de3b-4419-02be-870b29b13a7a@intel.com>
Date:   Wed, 15 Jan 2020 14:14:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20200106110133.13791-10-faiz_abbas@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 6/01/20 1:01 pm, Faiz Abbas wrote:
> Some omap controllers need software to monitor a 0->1->0 for software
> reset. Add a ti,needs-special-reset property to indicate this and use
> the special_reset member to indicate when a controller needs this.
> 
> Signed-off-by: Faiz Abbas <faiz_abbas@ti.com>

Acked-by: Adrian Hunter <adrian.hunter@intel.com>

> ---
>  drivers/mmc/host/sdhci-omap.c | 24 ++++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
> 
> diff --git a/drivers/mmc/host/sdhci-omap.c b/drivers/mmc/host/sdhci-omap.c
> index 1f05c8e98d62..34df30edd450 100644
> --- a/drivers/mmc/host/sdhci-omap.c
> +++ b/drivers/mmc/host/sdhci-omap.c
> @@ -107,6 +107,7 @@ struct sdhci_omap_host {
>  	struct pinctrl		*pinctrl;
>  	struct pinctrl_state	**pinctrl_state;
>  	bool			is_tuning;
> +	bool			special_reset;
>  };
>  
>  static void sdhci_omap_start_clock(struct sdhci_omap_host *omap_host);
> @@ -779,15 +780,35 @@ static void sdhci_omap_set_uhs_signaling(struct sdhci_host *host,
>  	sdhci_omap_start_clock(omap_host);
>  }
>  
> +#define MMC_TIMEOUT_US		20000		/* 20000 micro Sec */
>  static void sdhci_omap_reset(struct sdhci_host *host, u8 mask)
>  {
>  	struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
>  	struct sdhci_omap_host *omap_host = sdhci_pltfm_priv(pltfm_host);
> +	unsigned long limit = MMC_TIMEOUT_US;
> +	unsigned long i = 0;
>  
>  	/* Don't reset data lines during tuning operation */
>  	if (omap_host->is_tuning)
>  		mask &= ~SDHCI_RESET_DATA;
>  
> +	if (omap_host->special_reset) {
> +		sdhci_writeb(host, mask, SDHCI_SOFTWARE_RESET);
> +		while ((!(sdhci_readb(host, SDHCI_SOFTWARE_RESET) & mask)) &&
> +		       (i++ < limit))
> +			udelay(1);
> +		i = 0;
> +		while ((sdhci_readb(host, SDHCI_SOFTWARE_RESET) & mask) &&
> +		       (i++ < limit))
> +			udelay(1);
> +
> +		if (sdhci_readb(host, SDHCI_SOFTWARE_RESET) & mask)
> +			dev_err(mmc_dev(host->mmc),
> +				"Timeout waiting on controller reset in %s\n",
> +				__func__);
> +		return;
> +	}
> +
>  	sdhci_reset(host, mask);
>  }
>  
> @@ -1107,6 +1128,9 @@ static int sdhci_omap_probe(struct platform_device *pdev)
>  	if (!mmc_can_gpio_ro(mmc))
>  		mmc->caps2 |= MMC_CAP2_NO_WRITE_PROTECT;
>  
> +	if (of_find_property(dev->of_node, "ti,needs-special-reset", NULL))
> +		omap_host->special_reset = true;
> +
>  	pltfm_host->clk = devm_clk_get(dev, "fck");
>  	if (IS_ERR(pltfm_host->clk)) {
>  		ret = PTR_ERR(pltfm_host->clk);
> 

