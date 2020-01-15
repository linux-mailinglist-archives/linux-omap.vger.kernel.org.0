Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1A8C913BFAC
	for <lists+linux-omap@lfdr.de>; Wed, 15 Jan 2020 13:15:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730904AbgAOMP1 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 15 Jan 2020 07:15:27 -0500
Received: from mga07.intel.com ([134.134.136.100]:40430 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730613AbgAOMP0 (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 15 Jan 2020 07:15:26 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 15 Jan 2020 04:15:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,322,1574150400"; 
   d="scan'208";a="397867590"
Received: from ahunter-desktop.fi.intel.com (HELO [10.237.72.167]) ([10.237.72.167])
  by orsmga005.jf.intel.com with ESMTP; 15 Jan 2020 04:15:21 -0800
Subject: Re: [PATCH v4 11/11] mmc: sdhci-omap: Add am335x and am437x specific
 compatibles
To:     Faiz Abbas <faiz_abbas@ti.com>, linux-omap@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-mmc@vger.kernel.org
Cc:     kishon@ti.com, mark.rutland@arm.com, robh+dt@kernel.org,
        ulf.hansson@linaro.org, tony@atomide.com
References: <20200106110133.13791-1-faiz_abbas@ti.com>
 <20200106110133.13791-12-faiz_abbas@ti.com>
From:   Adrian Hunter <adrian.hunter@intel.com>
Organization: Intel Finland Oy, Registered Address: PL 281, 00181 Helsinki,
 Business Identity Code: 0357606 - 4, Domiciled in Helsinki
Message-ID: <7714819c-f850-082e-6ab4-be1ab3b8a248@intel.com>
Date:   Wed, 15 Jan 2020 14:14:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20200106110133.13791-12-faiz_abbas@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 6/01/20 1:01 pm, Faiz Abbas wrote:
> Add support for new compatible for TI's am335x and am437x devices.
> 
> Signed-off-by: Faiz Abbas <faiz_abbas@ti.com>

Acked-by: Adrian Hunter <adrian.hunter@intel.com>

> ---
>  drivers/mmc/host/sdhci-omap.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/drivers/mmc/host/sdhci-omap.c b/drivers/mmc/host/sdhci-omap.c
> index 34df30edd450..4d7026daa8cd 100644
> --- a/drivers/mmc/host/sdhci-omap.c
> +++ b/drivers/mmc/host/sdhci-omap.c
> @@ -919,6 +919,14 @@ static const struct sdhci_omap_data k2g_data = {
>  	.offset = 0x200,
>  };
>  
> +static const struct sdhci_omap_data am335_data = {
> +	.offset = 0x200,
> +};
> +
> +static const struct sdhci_omap_data am437_data = {
> +	.offset = 0x200,
> +};
> +
>  static const struct sdhci_omap_data dra7_data = {
>  	.offset = 0x200,
>  	.flags	= SDHCI_OMAP_REQUIRE_IODELAY,
> @@ -927,6 +935,8 @@ static const struct sdhci_omap_data dra7_data = {
>  static const struct of_device_id omap_sdhci_match[] = {
>  	{ .compatible = "ti,dra7-sdhci", .data = &dra7_data },
>  	{ .compatible = "ti,k2g-sdhci", .data = &k2g_data },
> +	{ .compatible = "ti,am335-sdhci", .data = &am335_data },
> +	{ .compatible = "ti,am437-sdhci", .data = &am437_data },
>  	{},
>  };
>  MODULE_DEVICE_TABLE(of, omap_sdhci_match);
> 

