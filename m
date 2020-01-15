Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B571713BF28
	for <lists+linux-omap@lfdr.de>; Wed, 15 Jan 2020 13:05:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730215AbgAOMFC (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 15 Jan 2020 07:05:02 -0500
Received: from mga07.intel.com ([134.134.136.100]:39832 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726165AbgAOMFC (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 15 Jan 2020 07:05:02 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 15 Jan 2020 04:05:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,322,1574150400"; 
   d="scan'208";a="397865142"
Received: from ahunter-desktop.fi.intel.com (HELO [10.237.72.167]) ([10.237.72.167])
  by orsmga005.jf.intel.com with ESMTP; 15 Jan 2020 04:04:58 -0800
Subject: Re: [PATCH v4 06/11] mmc: sdhci: Refactor sdhci_set_timeout()
To:     Faiz Abbas <faiz_abbas@ti.com>, linux-omap@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-mmc@vger.kernel.org
Cc:     kishon@ti.com, mark.rutland@arm.com, robh+dt@kernel.org,
        ulf.hansson@linaro.org, tony@atomide.com
References: <20200106110133.13791-1-faiz_abbas@ti.com>
 <20200106110133.13791-7-faiz_abbas@ti.com>
From:   Adrian Hunter <adrian.hunter@intel.com>
Organization: Intel Finland Oy, Registered Address: PL 281, 00181 Helsinki,
 Business Identity Code: 0357606 - 4, Domiciled in Helsinki
Message-ID: <ccdb5a91-b090-a35a-2c41-5cde40866dad@intel.com>
Date:   Wed, 15 Jan 2020 14:04:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20200106110133.13791-7-faiz_abbas@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 6/01/20 1:01 pm, Faiz Abbas wrote:
> Refactor sdhci_set_timeout() such that platform drivers can do some
> functionality in a set_timeout() callback and then call
> __sdhci_set_timeout() to complete the operation.
> 
> Signed-off-by: Faiz Abbas <faiz_abbas@ti.com>

Acked-by: Adrian Hunter <adrian.hunter@intel.com>

> ---
>  drivers/mmc/host/sdhci.c | 36 +++++++++++++++++++-----------------
>  drivers/mmc/host/sdhci.h |  1 +
>  2 files changed, 20 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/mmc/host/sdhci.c b/drivers/mmc/host/sdhci.c
> index 56f46bd7cdad..adb3e8ccefb8 100644
> --- a/drivers/mmc/host/sdhci.c
> +++ b/drivers/mmc/host/sdhci.c
> @@ -1004,27 +1004,29 @@ void sdhci_set_data_timeout_irq(struct sdhci_host *host, bool enable)
>  }
>  EXPORT_SYMBOL_GPL(sdhci_set_data_timeout_irq);
>  
> -static void sdhci_set_timeout(struct sdhci_host *host, struct mmc_command *cmd)
> +void __sdhci_set_timeout(struct sdhci_host *host, struct mmc_command *cmd)
>  {
> -	u8 count;
> +	bool too_big = false;
> +	u8 count = sdhci_calc_timeout(host, cmd, &too_big);
>  
> -	if (host->ops->set_timeout) {
> -		host->ops->set_timeout(host, cmd);
> -	} else {
> -		bool too_big = false;
> -
> -		count = sdhci_calc_timeout(host, cmd, &too_big);
> +	if (too_big &&
> +	    host->quirks2 & SDHCI_QUIRK2_DISABLE_HW_TIMEOUT) {
> +		sdhci_calc_sw_timeout(host, cmd);
> +		sdhci_set_data_timeout_irq(host, false);
> +	} else if (!(host->ier & SDHCI_INT_DATA_TIMEOUT)) {
> +		sdhci_set_data_timeout_irq(host, true);
> +	}
>  
> -		if (too_big &&
> -		    host->quirks2 & SDHCI_QUIRK2_DISABLE_HW_TIMEOUT) {
> -			sdhci_calc_sw_timeout(host, cmd);
> -			sdhci_set_data_timeout_irq(host, false);
> -		} else if (!(host->ier & SDHCI_INT_DATA_TIMEOUT)) {
> -			sdhci_set_data_timeout_irq(host, true);
> -		}
> +	sdhci_writeb(host, count, SDHCI_TIMEOUT_CONTROL);
> +}
> +EXPORT_SYMBOL_GPL(__sdhci_set_timeout);
>  
> -		sdhci_writeb(host, count, SDHCI_TIMEOUT_CONTROL);
> -	}
> +static void sdhci_set_timeout(struct sdhci_host *host, struct mmc_command *cmd)
> +{
> +	if (host->ops->set_timeout)
> +		host->ops->set_timeout(host, cmd);
> +	else
> +		__sdhci_set_timeout(host, cmd);
>  }
>  
>  static void sdhci_initialize_data(struct sdhci_host *host,
> diff --git a/drivers/mmc/host/sdhci.h b/drivers/mmc/host/sdhci.h
> index 928c6f35fcad..1fe230c2ed84 100644
> --- a/drivers/mmc/host/sdhci.h
> +++ b/drivers/mmc/host/sdhci.h
> @@ -804,5 +804,6 @@ void sdhci_send_tuning(struct sdhci_host *host, u32 opcode);
>  void sdhci_abort_tuning(struct sdhci_host *host, u32 opcode);
>  void sdhci_switch_external_dma(struct sdhci_host *host, bool en);
>  void sdhci_set_data_timeout_irq(struct sdhci_host *host, bool enable);
> +void __sdhci_set_timeout(struct sdhci_host *host, struct mmc_command *cmd);
>  
>  #endif /* __SDHCI_HW_H */
> 

