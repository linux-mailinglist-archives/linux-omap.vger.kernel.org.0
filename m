Return-Path: <linux-omap+bounces-211-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A6E0C821968
	for <lists+linux-omap@lfdr.de>; Tue,  2 Jan 2024 11:06:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CC8C51C21B51
	for <lists+linux-omap@lfdr.de>; Tue,  2 Jan 2024 10:06:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 832F3D271;
	Tue,  2 Jan 2024 10:06:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ei8qaFIh"
X-Original-To: linux-omap@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42E05CA7F;
	Tue,  2 Jan 2024 10:06:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1704190000; x=1735726000;
  h=message-id:date:mime-version:subject:to:references:from:
   in-reply-to:content-transfer-encoding;
  bh=INJea+ilY+R6vmdJ0Y2sL79V8au5+vAXrWfyDbG3jlk=;
  b=Ei8qaFIhUmI+VAqg+j/cyzvl+FSkDtGV8a9BaiO85yKvGV0IZsPb7wMH
   Oxvky+lId0h2ptGG6+iN+c/8H6y5qz3UebbkdUSX4rpr34JilzbIMAYn8
   PZNcSAqzJg3ArifNcEyiOrGJDa16Po8ciqDv6hxS0JNaL239g33Lvw9X6
   zyBSP2zKrSFv1HDf5Yq//t3B4Kv4Kje0QlMi0Qyki4Chep8hS+IF+lgF2
   680BmVKQwhNDjan8p6T6xXnfwIg82+xJqa7sgsDZ4DhW5qh8FsSiv71Jd
   gc5JF3SI6T3f0q2NpTuQXtD7pfcGnbzvh6c7p0Z47Lx2pYQRGUXnr7cgM
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10940"; a="3635379"
X-IronPort-AV: E=Sophos;i="6.04,324,1695711600"; 
   d="scan'208";a="3635379"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jan 2024 02:06:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10940"; a="729456929"
X-IronPort-AV: E=Sophos;i="6.04,324,1695711600"; 
   d="scan'208";a="729456929"
Received: from ahunter6-mobl1.ger.corp.intel.com (HELO [10.0.2.15]) ([10.252.51.83])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jan 2024 02:06:36 -0800
Message-ID: <0fe97709-6b6c-4c66-82a1-ecf58dde5b3f@intel.com>
Date: Tue, 2 Jan 2024 12:06:35 +0200
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] mmc: sdhci_am654: Fix TI SoC dependencies
Content-Language: en-US
To: Peter Robinson <pbrobinson@gmail.com>,
 Ulf Hansson <ulf.hansson@linaro.org>, Faiz Abbas <faiz_abbas@ti.com>,
 Kishon Vijay Abraham I <kishon@ti.com>, Tony Lindgren <tony@atomide.com>,
 linux-mmc@vger.kernel.org, linux-omap@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20231220135950.433588-1-pbrobinson@gmail.com>
From: Adrian Hunter <adrian.hunter@intel.com>
Organization: Intel Finland Oy, Registered Address: PL 281, 00181 Helsinki,
 Business Identity Code: 0357606 - 4, Domiciled in Helsinki
In-Reply-To: <20231220135950.433588-1-pbrobinson@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 20/12/23 15:59, Peter Robinson wrote:
> The sdhci_am654 is specific to recent TI SoCs, update the
> dependencies for those SoCs and compile testing. While we're
> at it update the text to reflect the wider range of
> supported TI SoCS the driver now supports.
> 
> Fixes: 41fd4caeb00b ("mmc: sdhci_am654: Add Initial Support for AM654 SDHCI driver")

Is this really a fix?  Seems like a minor improvement.
Same question for patch 2/2.

> Signed-off-by: Peter Robinson <pbrobinson@gmail.com>

It would be good to get an Ack from a TI person.
Same for patch 2/2.

> ---
>  drivers/mmc/host/Kconfig | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/mmc/host/Kconfig b/drivers/mmc/host/Kconfig
> index 58bd5fe4cd25..24ce5576b61a 100644
> --- a/drivers/mmc/host/Kconfig
> +++ b/drivers/mmc/host/Kconfig
> @@ -1041,14 +1041,15 @@ config MMC_SDHCI_OMAP
>  
>  config MMC_SDHCI_AM654
>  	tristate "Support for the SDHCI Controller in TI's AM654 SOCs"
> +	depends on ARCH_K3 || COMPILE_TEST
>  	depends on MMC_SDHCI_PLTFM && OF
>  	select MMC_SDHCI_IO_ACCESSORS
>  	select MMC_CQHCI
>  	select REGMAP_MMIO
>  	help
>  	  This selects the Secure Digital Host Controller Interface (SDHCI)
> -	  support present in TI's AM654 SOCs. The controller supports
> -	  SD/MMC/SDIO devices.
> +	  support present in TI's AM65x/AM64x/AM62x/J721E SOCs. The controller
> +	  supports SD/MMC/SDIO devices.
>  
>  	  If you have a controller with this interface, say Y or M here.
>  


