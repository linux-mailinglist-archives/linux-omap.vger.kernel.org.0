Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 301CD1796FD
	for <lists+linux-omap@lfdr.de>; Wed,  4 Mar 2020 18:48:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730032AbgCDRsb (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 4 Mar 2020 12:48:31 -0500
Received: from mail-pf1-f194.google.com ([209.85.210.194]:39537 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730022AbgCDRsb (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 4 Mar 2020 12:48:31 -0500
Received: by mail-pf1-f194.google.com with SMTP id l7so1316435pff.6
        for <linux-omap@vger.kernel.org>; Wed, 04 Mar 2020 09:48:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=Klm/gkugAZBInebtG/UbZEqoUEq+E4EHAWBVa5BsR88=;
        b=N9D+7aqjeuqrhULxHFuo0njvU779IDQ5vYLMBRWjiNsefh9Pp0rhzeZZP+9OXOCSd7
         j3wjTyTCMtLHnT+WBrnaUCo7ltxToS4ZxEUk1y69gA5jwyaHE3+oha13Lb5jH4NxOtMD
         9jMEq5oG8QGhs57rGrihfbQ+3Ql/sqiKElrsVnD+99H1pL13lkwUFKADglxu/WfVgNOI
         Lkb/vIKMM3CRKcnkfhRTfG9huJ9R6xgq7Y9+JCZ9HXxxrdNA/u+5WW68CASQUqNggEKK
         uGKkzGIhJt18BbYupgzBFGbtw4JzkiLU8RIsXvUMP2n5ldQOaIYSHWTXl8g37xX7xr69
         NHBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Klm/gkugAZBInebtG/UbZEqoUEq+E4EHAWBVa5BsR88=;
        b=EdE1T+2HsBkYafDvc9r4dqk6SLUAoHqoIibHZKZ3tYMBov3Jy+fR6Z7aQVhcc7kXaM
         Kl3ah2+Zi+plgd1N8MmTYOdCDL6kFXPh2OuCTyE73O0gRODWKBWmHH0B5vHsD8r5ZCRt
         91rpSixdXu1ENTvVKD6FL4ScxichMwdRumJeJYUk4SzNpOfeHfthuW+Fprk9yZdFQiTh
         IWDBL2BU1SijTv9Ysw2VupX3N3+eoiCKRD2lSdJPmZlDB4qia+1anShKQ550wJHG0CTj
         eq+6BC58lTxIhylQ9djTCQdZ9evj3r7whGESJKa1O2WrhjWlft8L5fCWlJoKqxUqdKbW
         DLyQ==
X-Gm-Message-State: ANhLgQ3icGZ/F+EfM2iOh7aVRkKxxkId2BrHeRnzYqq3rMJ4ZYbe44gl
        16U6B7a0GHlpevS0CBWaijIE3w==
X-Google-Smtp-Source: ADFU+vt7dxnlxzDsH0s7sppqFbTW0GfjdrD9B9JKQkoZT3StQ/9JSFa/FvHR8ZStm38O4sUj82cLfg==
X-Received: by 2002:a62:154d:: with SMTP id 74mr1836149pfv.92.1583344109940;
        Wed, 04 Mar 2020 09:48:29 -0800 (PST)
Received: from xps15 (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id q21sm30322579pff.105.2020.03.04.09.48.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2020 09:48:29 -0800 (PST)
Date:   Wed, 4 Mar 2020 10:48:27 -0700
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Tero Kristo <t-kristo@ti.com>
Cc:     bjorn.andersson@linaro.org, ohad@wizery.com,
        linux-remoteproc@vger.kernel.org, afd@ti.com, s-anna@ti.com,
        linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org
Subject: Re: [PATCHv7 07/15] remoteproc/omap: Add support for DRA7xx remote
 processors
Message-ID: <20200304174827.GF8197@xps15>
References: <20200221101936.16833-1-t-kristo@ti.com>
 <20200221101936.16833-8-t-kristo@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200221101936.16833-8-t-kristo@ti.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Fri, Feb 21, 2020 at 12:19:28PM +0200, Tero Kristo wrote:
> From: Suman Anna <s-anna@ti.com>
> 
> DRA7xx/AM57xx SoCs have two IPU and up to two DSP processor subsystems
> for offloading different computation algorithms. The IPU processor
> subsystem contains dual-core ARM Cortex-M4 processors, and is very
> similar to those on OMAP5. The DSP processor subsystem is based on
> the TI's standard TMS320C66x DSP CorePac core.
> 
> Support has been added to the OMAP remoteproc driver through new
> DRA7xx specific compatibles for properly probing and booting all
> the different processor subsystem instances on DRA7xx/AM57xx
> SoCs - IPU1, IPU2, DSP1 & DSP2. A build dependency with SOC_DRA7XX
> is added to enable the driver to be built in DRA7xx-only configuration.
> 
> The DSP boot address programming needed enhancement for DRA7xx as the
> boot register fields are different on DRA7 compared to OMAP4 and OMAP5
> SoCs. The register on DRA7xx contains additional fields within the
> register and the boot address bit-field is right-shifted by 10 bits.
> The internal memory parsing logic has also been updated to compute
> the device addresses for the L2 RAM for DSP devices using relative
> addressing logic, and to parse two additional RAMs at L1 level - L1P
> and L1D. This allows the remoteproc driver to support loading into
> these regions for a small subset of firmware images requiring as
> such. The most common usage would be to use the L1 programmable
> RAMs as L1 Caches.
> 
> The firmware lookup logic also has to be adjusted for DRA7xx as
> there are (can be) more than one instance of both the IPU and DSP
> remote processors for the first time in OMAP4+ SoCs.
> 
> Signed-off-by: Suman Anna <s-anna@ti.com>
> [t-kristo@ti.com: moved address translation quirks to pdata]
> Signed-off-by: Tero Kristo <t-kristo@ti.com>
> ---
>  drivers/remoteproc/Kconfig           |  2 +-
>  drivers/remoteproc/omap_remoteproc.c | 38 +++++++++++++++++++++++++++-
>  2 files changed, 38 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/remoteproc/Kconfig b/drivers/remoteproc/Kconfig
> index de3862c15fcc..b52abc2268cc 100644
> --- a/drivers/remoteproc/Kconfig
> +++ b/drivers/remoteproc/Kconfig
> @@ -35,7 +35,7 @@ config MTK_SCP
>  
>  config OMAP_REMOTEPROC
>  	tristate "OMAP remoteproc support"
> -	depends on ARCH_OMAP4 || SOC_OMAP5
> +	depends on ARCH_OMAP4 || SOC_OMAP5 || SOC_DRA7XX
>  	depends on OMAP_IOMMU
>  	select MAILBOX
>  	select OMAP2PLUS_MBOX
> diff --git a/drivers/remoteproc/omap_remoteproc.c b/drivers/remoteproc/omap_remoteproc.c
> index 872cd0df342b..8c3dc0edae95 100644
> --- a/drivers/remoteproc/omap_remoteproc.c
> +++ b/drivers/remoteproc/omap_remoteproc.c
> @@ -34,10 +34,13 @@
>   * struct omap_rproc_boot_data - boot data structure for the DSP omap rprocs
>   * @syscon: regmap handle for the system control configuration module
>   * @boot_reg: boot register offset within the @syscon regmap
> + * @boot_reg_shift: bit-field shift required for the boot address value in
> + *		    @boot_reg
>   */
>  struct omap_rproc_boot_data {
>  	struct regmap *syscon;
>  	unsigned int boot_reg;
> +	unsigned int boot_reg_shift;
>  };
>  
>  /**
> @@ -161,6 +164,8 @@ static int omap_rproc_write_dsp_boot_addr(struct rproc *rproc)
>  	struct omap_rproc *oproc = rproc->priv;
>  	struct omap_rproc_boot_data *bdata = oproc->boot_data;
>  	u32 offset = bdata->boot_reg;
> +	u32 value;
> +	u32 mask;
>  
>  	if (rproc->bootaddr & (SZ_1K - 1)) {
>  		dev_err(dev, "invalid boot address 0x%x, must be aligned on a 1KB boundary\n",
> @@ -168,7 +173,10 @@ static int omap_rproc_write_dsp_boot_addr(struct rproc *rproc)
>  		return -EINVAL;
>  	}
>  
> -	regmap_write(bdata->syscon, offset, rproc->bootaddr);
> +	value = rproc->bootaddr >> bdata->boot_reg_shift;
> +	mask = ~(SZ_1K - 1) >> bdata->boot_reg_shift;
> +
> +	regmap_update_bits(bdata->syscon, offset, mask, value);

Please handle the return value.  We can either do it now or in 3 months when
someone with an automated tools sends a patch.  Besides, omap_rproc_start() is
already expecting an error from omap_rproc_write_dsp_boot_addr() so it's even
easier.

With the above:

Acked-by: Mathieu Poirier <mathieu.poirier@linaro.org>

>  
>  	return 0;
>  }
> @@ -299,6 +307,13 @@ static const struct omap_rproc_mem_data ipu_mems[] = {
>  	{ },
>  };
>  
> +static const struct omap_rproc_mem_data dra7_dsp_mems[] = {
> +	{ .name = "l2ram", .dev_addr = 0x800000 },
> +	{ .name = "l1pram", .dev_addr = 0xe00000 },
> +	{ .name = "l1dram", .dev_addr = 0xf00000 },
> +	{ },
> +};
> +
>  static const struct omap_rproc_dev_data omap4_dsp_dev_data = {
>  	.device_name	= "dsp",
>  };
> @@ -317,6 +332,16 @@ static const struct omap_rproc_dev_data omap5_ipu_dev_data = {
>  	.mems		= ipu_mems,
>  };
>  
> +static const struct omap_rproc_dev_data dra7_dsp_dev_data = {
> +	.device_name	= "dsp",
> +	.mems		= dra7_dsp_mems,
> +};
> +
> +static const struct omap_rproc_dev_data dra7_ipu_dev_data = {
> +	.device_name	= "ipu",
> +	.mems		= ipu_mems,
> +};
> +
>  static const struct of_device_id omap_rproc_of_match[] = {
>  	{
>  		.compatible     = "ti,omap4-dsp",
> @@ -334,6 +359,14 @@ static const struct of_device_id omap_rproc_of_match[] = {
>  		.compatible     = "ti,omap5-ipu",
>  		.data           = &omap5_ipu_dev_data,
>  	},
> +	{
> +		.compatible     = "ti,dra7-dsp",
> +		.data           = &dra7_dsp_dev_data,
> +	},
> +	{
> +		.compatible     = "ti,dra7-ipu",
> +		.data           = &dra7_ipu_dev_data,
> +	},
>  	{
>  		/* end */
>  	},
> @@ -386,6 +419,9 @@ static int omap_rproc_get_boot_data(struct platform_device *pdev,
>  		return -EINVAL;
>  	}
>  
> +	of_property_read_u32_index(np, "ti,bootreg", 2,
> +				   &oproc->boot_data->boot_reg_shift);
> +
>  	return 0;
>  }
>  
> -- 
> 2.17.1
> 
> --
> Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
