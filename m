Return-Path: <linux-omap+bounces-3983-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C5887AEA988
	for <lists+linux-omap@lfdr.de>; Fri, 27 Jun 2025 00:21:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 417293BB454
	for <lists+linux-omap@lfdr.de>; Thu, 26 Jun 2025 22:20:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8ED9264FBB;
	Thu, 26 Jun 2025 22:21:05 +0000 (UTC)
X-Original-To: linux-omap@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1982E2620C4
	for <linux-omap@vger.kernel.org>; Thu, 26 Jun 2025 22:21:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750976465; cv=none; b=tlQS9ih6UVq9gN8BVwwja3RsHFkaUW7eF+UP0hb1fPk045mfmvcMH52pI+C+my+9skpZqZvyQ9PkJkZEkOCzYVDb94w8Rgn8cU+sFhPX5MEdpq3ZUeh2adY7S0qFcx9KkVqVYTc0eMhWCAfPuuZc9a5vlwTVfShn2fnHC8RqChk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750976465; c=relaxed/simple;
	bh=r1HSdZ6WNVEi/Mi83UVnh9NXStJTYzNzdw0G+GYtays=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B81LogsK3P57Sh/RQVUWAbBd76DDIT29JmEW5HHXrppDcNBStUr2mmpRCG0paVyrNyyjL8MMdzcW1C5wEwA3Pv5EPuAqXqfjnsw4BkmyOBAS8oo3jWX5qIpUMAyw0ipJqZJV6pM+k9a7/J6VxcFs471IPNrBJalUtR98l9LmkEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AC8AA169E
	for <linux-omap@vger.kernel.org>; Thu, 26 Jun 2025 15:20:45 -0700 (PDT)
Received: from e110455-lin.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 02FC53F66E
	for <linux-omap@vger.kernel.org>; Thu, 26 Jun 2025 15:21:02 -0700 (PDT)
Date: Thu, 26 Jun 2025 23:20:43 +0100
From: Liviu Dudau <liviu.dudau@arm.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>, Lee Jones <lee@kernel.org>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Aaro Koskinen <aaro.koskinen@iki.fi>,
	Janusz Krzysztofik <jmkrzyszt@gmail.com>,
	Tony Lindgren <tony@atomide.com>,
	Russell King <linux@armlinux.org.uk>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-omap@vger.kernel.org, patches@opensource.cirrus.com,
	linux-samsung-soc@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH RFT 3/6] mfd: vexpress-sysreg: set-up software nodes for
 gpio-mmio
Message-ID: <aF3Hu0bMVfkbXdFn@e110455-lin.cambridge.arm.com>
References: <20250624-gpio-mmio-pdata-v1-0-a58c72eb556a@linaro.org>
 <20250624-gpio-mmio-pdata-v1-3-a58c72eb556a@linaro.org>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250624-gpio-mmio-pdata-v1-3-a58c72eb556a@linaro.org>

On Tue, Jun 24, 2025 at 03:19:14PM +0200, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> Replace struct bgpio_pdata - that we plan to remove - with software
> nodes containing properties encoding the same values thatr can now be
> parsed by gpio-mmio.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>

I'm OK with this going through the GPIO tree.

Best regards,
Liviu

> ---
>  drivers/mfd/vexpress-sysreg.c | 46 ++++++++++++++++++++++++++-----------------
>  1 file changed, 28 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/mfd/vexpress-sysreg.c b/drivers/mfd/vexpress-sysreg.c
> index ef03d6cec9ff6927668d051ca459eb1d8ff7269e..fc2daffc4352cca763cefbf6e17bdd5242290198 100644
> --- a/drivers/mfd/vexpress-sysreg.c
> +++ b/drivers/mfd/vexpress-sysreg.c
> @@ -11,6 +11,7 @@
>  #include <linux/module.h>
>  #include <linux/of_platform.h>
>  #include <linux/platform_device.h>
> +#include <linux/property.h>
>  #include <linux/slab.h>
>  #include <linux/stat.h>
>  
> @@ -37,22 +38,34 @@
>  
>  /* The sysreg block is just a random collection of various functions... */
>  
> -static struct bgpio_pdata vexpress_sysreg_sys_led_pdata = {
> -	.label = "sys_led",
> -	.base = -1,
> -	.ngpio = 8,
> +static const struct property_entry vexpress_sysreg_sys_led_props[] = {
> +	PROPERTY_ENTRY_STRING("label", "sys_led"),
> +	PROPERTY_ENTRY_U32("ngpios", 8),
> +	{ }
>  };
>  
> -static struct bgpio_pdata vexpress_sysreg_sys_mci_pdata = {
> -	.label = "sys_mci",
> -	.base = -1,
> -	.ngpio = 2,
> +static const struct software_node vexpress_sysreg_sys_led_swnode = {
> +	.properties = vexpress_sysreg_sys_led_props,
>  };
>  
> -static struct bgpio_pdata vexpress_sysreg_sys_flash_pdata = {
> -	.label = "sys_flash",
> -	.base = -1,
> -	.ngpio = 1,
> +static const struct property_entry vexpress_sysreg_sys_mci_props[] = {
> +	PROPERTY_ENTRY_STRING("label", "sys_mci"),
> +	PROPERTY_ENTRY_U32("ngpios", 2),
> +	{ }
> +};
> +
> +static const struct software_node vexpress_sysreg_sys_mci_swnode = {
> +	.properties = vexpress_sysreg_sys_mci_props,
> +};
> +
> +static const struct property_entry vexpress_sysreg_sys_flash_props[] = {
> +	PROPERTY_ENTRY_STRING("label", "sys_flash"),
> +	PROPERTY_ENTRY_U32("ngpios", 1),
> +	{ }
> +};
> +
> +static const struct software_node vexpress_sysreg_sys_flash_swnode = {
> +	.properties = vexpress_sysreg_sys_flash_props,
>  };
>  
>  static struct mfd_cell vexpress_sysreg_cells[] = {
> @@ -61,22 +74,19 @@ static struct mfd_cell vexpress_sysreg_cells[] = {
>  		.of_compatible = "arm,vexpress-sysreg,sys_led",
>  		.num_resources = 1,
>  		.resources = &DEFINE_RES_MEM_NAMED(SYS_LED, 0x4, "dat"),
> -		.platform_data = &vexpress_sysreg_sys_led_pdata,
> -		.pdata_size = sizeof(vexpress_sysreg_sys_led_pdata),
> +		.swnode = &vexpress_sysreg_sys_led_swnode,
>  	}, {
>  		.name = "basic-mmio-gpio",
>  		.of_compatible = "arm,vexpress-sysreg,sys_mci",
>  		.num_resources = 1,
>  		.resources = &DEFINE_RES_MEM_NAMED(SYS_MCI, 0x4, "dat"),
> -		.platform_data = &vexpress_sysreg_sys_mci_pdata,
> -		.pdata_size = sizeof(vexpress_sysreg_sys_mci_pdata),
> +		.swnode = &vexpress_sysreg_sys_mci_swnode,
>  	}, {
>  		.name = "basic-mmio-gpio",
>  		.of_compatible = "arm,vexpress-sysreg,sys_flash",
>  		.num_resources = 1,
>  		.resources = &DEFINE_RES_MEM_NAMED(SYS_FLASH, 0x4, "dat"),
> -		.platform_data = &vexpress_sysreg_sys_flash_pdata,
> -		.pdata_size = sizeof(vexpress_sysreg_sys_flash_pdata),
> +		.swnode = &vexpress_sysreg_sys_flash_swnode,
>  	}, {
>  		.name = "vexpress-syscfg",
>  		.num_resources = 1,
> 
> -- 
> 2.48.1
> 

-- 
====================
| I would like to |
| fix the world,  |
| but they're not |
| giving me the   |
 \ source code!  /
  ---------------
    ¯\_(ツ)_/¯

