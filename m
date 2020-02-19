Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9258E163E61
	for <lists+linux-omap@lfdr.de>; Wed, 19 Feb 2020 09:02:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726551AbgBSIBx (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 19 Feb 2020 03:01:53 -0500
Received: from lelv0143.ext.ti.com ([198.47.23.248]:60458 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726156AbgBSIBx (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 19 Feb 2020 03:01:53 -0500
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 01J81ReD077111;
        Wed, 19 Feb 2020 02:01:28 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1582099288;
        bh=egg33giyK1clnWZ+akRjk/X3rHDMZjpzVNVhCybJGHU=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=IOXLHU1oopM3/4EIKrpLuN/m0a24GhzipSyOq/bUtwPp1Wzov0QwLHhiSiAW+zWQl
         boHLYXIROgdQMLilFeUsxwWeloWqZXMNjM2ZKhi+u9Vg6ZdnnmDEhHbDR1FRObdmYJ
         eEQYaUTfhgKXV/5PcIEqoJpm6aaXRIyeVvkkwvzM=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 01J81Rgj036385;
        Wed, 19 Feb 2020 02:01:27 -0600
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Wed, 19
 Feb 2020 02:01:27 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Wed, 19 Feb 2020 02:01:27 -0600
Received: from [10.24.69.159] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 01J81OJC117502;
        Wed, 19 Feb 2020 02:01:25 -0600
Subject: Re: [PATCH] mmc: sdhci-omap: Add Support for Suspend/Resume
To:     Faiz Abbas <faiz_abbas@ti.com>, <linux-kernel@vger.kernel.org>,
        <linux-mmc@vger.kernel.org>, <linux-omap@vger.kernel.org>
CC:     <ulf.hansson@linaro.org>, <adrian.hunter@intel.com>,
        <tony@atomide.com>
References: <20200218141018.24456-1-faiz_abbas@ti.com>
From:   Kishon Vijay Abraham I <kishon@ti.com>
Message-ID: <52f4cb0c-2b4e-65bf-d669-b9b5cdc44cb7@ti.com>
Date:   Wed, 19 Feb 2020 13:35:05 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <20200218141018.24456-1-faiz_abbas@ti.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Faiz,

On 18/02/20 7:40 pm, Faiz Abbas wrote:
> Add power management ops which save and restore the driver context and
> facilitate a system suspend and resume.
> 
> Signed-off-by: Faiz Abbas <faiz_abbas@ti.com>
> ---
>  drivers/mmc/host/sdhci-omap.c | 59 +++++++++++++++++++++++++++++++++++
>  1 file changed, 59 insertions(+)
> 
> diff --git a/drivers/mmc/host/sdhci-omap.c b/drivers/mmc/host/sdhci-omap.c
> index 882053151a47..a524c01da8de 100644
> --- a/drivers/mmc/host/sdhci-omap.c
> +++ b/drivers/mmc/host/sdhci-omap.c
> @@ -108,6 +108,11 @@ struct sdhci_omap_host {
>  	struct pinctrl		*pinctrl;
>  	struct pinctrl_state	**pinctrl_state;
>  	bool			is_tuning;
> +	/* Omap specific context save */
> +	u32			con;
> +	u32			hctl;
> +	u32			sysctl;
> +	u32			capa;

Except CON register which is specific to OMAP, others are SDHCI
registers. Shouldn't the save and restore of these registers be in
sdhci.c? Doesn't set_ios() already take care of configuring HCTL, SYSCTL
etc..?

Thanks
Kishon

>  };
>  
>  static void sdhci_omap_start_clock(struct sdhci_omap_host *omap_host);
> @@ -1233,11 +1238,65 @@ static int sdhci_omap_remove(struct platform_device *pdev)
>  	return 0;
>  }
>  
> +static void sdhci_omap_context_save(struct sdhci_omap_host *omap_host)
> +{
> +	omap_host->con = sdhci_omap_readl(omap_host, SDHCI_OMAP_CON);
> +	omap_host->hctl = sdhci_omap_readl(omap_host, SDHCI_OMAP_HCTL);
> +	omap_host->sysctl = sdhci_omap_readl(omap_host, SDHCI_OMAP_SYSCTL);
> +	omap_host->capa = sdhci_omap_readl(omap_host, SDHCI_OMAP_CAPA);
> +}
> +
> +static void sdhci_omap_context_restore(struct sdhci_omap_host *omap_host)
> +{
> +	sdhci_omap_writel(omap_host, SDHCI_OMAP_CON, omap_host->con);
> +	sdhci_omap_writel(omap_host, SDHCI_OMAP_HCTL, omap_host->hctl);
> +	sdhci_omap_writel(omap_host, SDHCI_OMAP_SYSCTL, omap_host->sysctl);
> +	sdhci_omap_writel(omap_host, SDHCI_OMAP_CAPA, omap_host->capa);
> +}
> +
> +static int __maybe_unused sdhci_omap_suspend(struct device *dev)
> +{
> +	struct sdhci_host *host = dev_get_drvdata(dev);
> +	struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
> +	struct sdhci_omap_host *omap_host = sdhci_pltfm_priv(pltfm_host);
> +
> +	sdhci_suspend_host(host);
> +
> +	sdhci_omap_context_save(omap_host);
> +
> +	pinctrl_pm_select_idle_state(dev);
> +
> +	pm_runtime_put_sync(dev);
> +
> +	return 0;
> +}
> +
> +static int __maybe_unused sdhci_omap_resume(struct device *dev)
> +{
> +	struct sdhci_host *host = dev_get_drvdata(dev);
> +	struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
> +	struct sdhci_omap_host *omap_host = sdhci_pltfm_priv(pltfm_host);
> +
> +	pm_runtime_get_sync(dev);
> +
> +	pinctrl_pm_select_default_state(dev);
> +
> +	sdhci_omap_context_restore(omap_host);
> +
> +	sdhci_resume_host(host);
> +
> +	return 0;
> +}
> +
> +static SIMPLE_DEV_PM_OPS(sdhci_omap_dev_pm_ops, sdhci_omap_suspend,
> +			 sdhci_omap_resume);
> +
>  static struct platform_driver sdhci_omap_driver = {
>  	.probe = sdhci_omap_probe,
>  	.remove = sdhci_omap_remove,
>  	.driver = {
>  		   .name = "sdhci-omap",
> +		   .pm = &sdhci_omap_dev_pm_ops,
>  		   .of_match_table = omap_sdhci_match,
>  		  },
>  };
> 
