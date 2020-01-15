Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B030413BF24
	for <lists+linux-omap@lfdr.de>; Wed, 15 Jan 2020 13:05:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730129AbgAOMEJ (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 15 Jan 2020 07:04:09 -0500
Received: from mga14.intel.com ([192.55.52.115]:8776 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726165AbgAOMEJ (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 15 Jan 2020 07:04:09 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 15 Jan 2020 04:04:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,322,1574150400"; 
   d="scan'208";a="397864941"
Received: from ahunter-desktop.fi.intel.com (HELO [10.237.72.167]) ([10.237.72.167])
  by orsmga005.jf.intel.com with ESMTP; 15 Jan 2020 04:04:05 -0800
Subject: Re: [PATCH v4 05/11] mmc: sdhci: Convert sdhci_set_timeout_irq() to
 non-static
To:     Faiz Abbas <faiz_abbas@ti.com>, linux-omap@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-mmc@vger.kernel.org
Cc:     kishon@ti.com, mark.rutland@arm.com, robh+dt@kernel.org,
        ulf.hansson@linaro.org, tony@atomide.com
References: <20200106110133.13791-1-faiz_abbas@ti.com>
 <20200106110133.13791-6-faiz_abbas@ti.com>
From:   Adrian Hunter <adrian.hunter@intel.com>
Organization: Intel Finland Oy, Registered Address: PL 281, 00181 Helsinki,
 Business Identity Code: 0357606 - 4, Domiciled in Helsinki
Message-ID: <4c534ec1-d673-2875-1a44-b3f7fc400b35@intel.com>
Date:   Wed, 15 Jan 2020 14:03:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20200106110133.13791-6-faiz_abbas@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 6/01/20 1:01 pm, Faiz Abbas wrote:
> Export sdhci_set_timeout_irq() so that it is accessible from platform drivers.
> 
> Signed-off-by: Faiz Abbas <faiz_abbas@ti.com>

Acked-by: Adrian Hunter <adrian.hunter@intel.com>

> ---
>  drivers/mmc/host/sdhci.c | 3 ++-
>  drivers/mmc/host/sdhci.h | 1 +
>  2 files changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/mmc/host/sdhci.c b/drivers/mmc/host/sdhci.c
> index 8cc78c76bc3d..56f46bd7cdad 100644
> --- a/drivers/mmc/host/sdhci.c
> +++ b/drivers/mmc/host/sdhci.c
> @@ -993,7 +993,7 @@ static void sdhci_set_transfer_irqs(struct sdhci_host *host)
>  	sdhci_writel(host, host->ier, SDHCI_SIGNAL_ENABLE);
>  }
>  
> -static void sdhci_set_data_timeout_irq(struct sdhci_host *host, bool enable)
> +void sdhci_set_data_timeout_irq(struct sdhci_host *host, bool enable)
>  {
>  	if (enable)
>  		host->ier |= SDHCI_INT_DATA_TIMEOUT;
> @@ -1002,6 +1002,7 @@ static void sdhci_set_data_timeout_irq(struct sdhci_host *host, bool enable)
>  	sdhci_writel(host, host->ier, SDHCI_INT_ENABLE);
>  	sdhci_writel(host, host->ier, SDHCI_SIGNAL_ENABLE);
>  }
> +EXPORT_SYMBOL_GPL(sdhci_set_data_timeout_irq);
>  
>  static void sdhci_set_timeout(struct sdhci_host *host, struct mmc_command *cmd)
>  {
> diff --git a/drivers/mmc/host/sdhci.h b/drivers/mmc/host/sdhci.h
> index 3166b3ecef89..928c6f35fcad 100644
> --- a/drivers/mmc/host/sdhci.h
> +++ b/drivers/mmc/host/sdhci.h
> @@ -803,5 +803,6 @@ void sdhci_reset_tuning(struct sdhci_host *host);
>  void sdhci_send_tuning(struct sdhci_host *host, u32 opcode);
>  void sdhci_abort_tuning(struct sdhci_host *host, u32 opcode);
>  void sdhci_switch_external_dma(struct sdhci_host *host, bool en);
> +void sdhci_set_data_timeout_irq(struct sdhci_host *host, bool enable);
>  
>  #endif /* __SDHCI_HW_H */
> 

