Return-Path: <linux-omap+bounces-917-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 470D38857CD
	for <lists+linux-omap@lfdr.de>; Thu, 21 Mar 2024 12:09:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 00907282138
	for <lists+linux-omap@lfdr.de>; Thu, 21 Mar 2024 11:09:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8B1457884;
	Thu, 21 Mar 2024 11:09:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JUYw31G2"
X-Original-To: linux-omap@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C8735731E;
	Thu, 21 Mar 2024 11:09:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711019356; cv=none; b=Qd21sXDolnNkmyd5kxLloGJmeOnS6YmHEn4KPuGKFhpIlOxBOXS3OJWCngkguK042i3j+4O10ws2t9z2byrVX8CMj7KVpNC9ZCMTz9YFPkscibhVHi2N1VDna4+A5YGQzL+RrNewsUh7pEhvPtId3S8LkEzwKhVHLAWvy47Ktz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711019356; c=relaxed/simple;
	bh=JcYwKHfZIlb0nbaP16Hc4ovkmhVJHbn5ZMwI1T16S/o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=C+YL+VAs44K+a7RP194R08du+uq6HR4tJN4HJxWICJYzWrG389ZsxnTYuWBOUNFnMaLWtiXzs00vVKBwvNB0UbCJu4usbL3UY5nnahDNkCVL8jVI/bnidi8lU1VN83z9qYErG+tEu7Lvw4iGo5PHULegM8fRygnWFxyJdGsHuxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JUYw31G2; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711019354; x=1742555354;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=JcYwKHfZIlb0nbaP16Hc4ovkmhVJHbn5ZMwI1T16S/o=;
  b=JUYw31G27rVUOzXzYSus7MtJx7vIn2LOuTBsA5tHoAaHorn7POwVlYmd
   IivGe9tDtDkW3lTznfHTnj0j8qCe2qnhwGPHwM1D+tG4sdcayYPoF9FCr
   q7y8M66r8GGSi8k7dAlLXvXdT4fPROIjQOB8eOxRx9A4LNwdciLnzK/EH
   IKoGwXv4H+wHNZ7PMek7NqltxHP4vK8/7tUXIe2AxQ7k09FTrQxas+a28
   SXpVkBMeFDNXaUrvr2HHRw6FaJ2aqdBdpZm/1bbRKRHLh4S4zC3QOgVX2
   agP9NqPIrgaUthxB6Egms0XIF9+032VuSX+5dLo/xRAiYjgOWSg1lcOAq
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11019"; a="6124968"
X-IronPort-AV: E=Sophos;i="6.07,142,1708416000"; 
   d="scan'208,217";a="6124968"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Mar 2024 04:09:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,142,1708416000"; 
   d="scan'208,217";a="14450383"
Received: from ahunter6-mobl1.ger.corp.intel.com (HELO [10.0.2.15]) ([10.251.210.179])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Mar 2024 04:09:01 -0700
Message-ID: <d506a7de-b1d6-4d41-8aae-cd0679126e0c@intel.com>
Date: Thu, 21 Mar 2024 13:08:56 +0200
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mmc: sdhci-omap: re-tuning is needed after a pm
 transition to support emmc HS200 mode
To: Romain Naour <romain.naour@smile.fr>, linux-omap@vger.kernel.org
Cc: vigneshr@ti.com, ulf.hansson@linaro.org, linux-mmc@vger.kernel.org,
 tony@atomide.com, Romain Naour <romain.naour@skf.com>
References: <20240315234444.816978-1-romain.naour@smile.fr>
Content-Language: en-US
From: Adrian Hunter <adrian.hunter@intel.com>
Organization: Intel Finland Oy, Registered Address: PL 281, 00181 Helsinki,
 Business Identity Code: 0357606 - 4, Domiciled in Helsinki
In-Reply-To: <20240315234444.816978-1-romain.naour@smile.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 16/03/24 01:44, Romain Naour wrote:
> From: Romain Naour <romain.naour@skf.com>
> 
> "PM runtime functions" has been added in sdhci-omap driver in 5.16
> f433e8aac6b9 ("mmc: sdhci-omap: Implement PM runtime functions") along
> with "card power off and enable aggressive PM" 3edf588e7fe0

checkpatch expects "commit" before commit numbers i.e.

ERROR: Please use git commit description style 'commit <12+ chars of sha1> ("<title line>")' - ie: 'commit f433e8aac6b9 ("mmc: sdhci-omap: Implement PM runtime functions")'
#9: 
f433e8aac6b9 ("mmc: sdhci-omap: Implement PM runtime functions") along

ERROR: Please use git commit description style 'commit <12+ chars of sha1> ("<title line>")' - ie: 'commit 3edf588e7fe0 ("mmc: sdhci-omap: Allow SDIO card power off and enable aggressive PM")'
#10: 
with "card power off and enable aggressive PM" 3edf588e7fe0

> ("mmc: sdhci-omap: Allow SDIO card power off and enable aggressive PM").
> 
> Since then, the sdhci-omap driver doesn't work using mmc-hs200 mode
> due to the tuning values being lost during a pm transition.
> See the report on the linux-omap mailing list [1].
> 
> As for the sdhci_am654 driver, request a new tuning sequence before
> suspend (sdhci_omap_runtime_suspend()), othwerwise the device will

othwerwise -> otherwise

> thigger cache flush errors:

thigger -> trigger

> 
>   mmc1: cache flush error -110 (ETIMEDOUT)
>   mmc1: error -110 doing aggressive suspend
> 
> followed by I/O errors produced by fdisk -l /dev/mmcblk1boot1:
> 
>   I/O error, dev mmcblk1boot0, sector 64384 op 0x0:(READ) flags 0x80700 phys_seg 1
>   prio class 2
>   I/O error, dev mmcblk1boot1, sector 64384 op 0x0:(READ) flags 0x80700 phys_seg 1
>   prio class 2
>   I/O error, dev mmcblk1boot1, sector 64384 op 0x0:(READ) flags 0x0 phys_seg 1
>   prio class 2
>   Buffer I/O error on dev mmcblk1boot1, logical block 8048, async page read
>   I/O error, dev mmcblk1boot0, sector 64384 op 0x0:(READ) flags 0x0 phys_seg 1
>   prio class 2
>   Buffer I/O error on dev mmcblk1boot0, logical block 8048, async page read
> 
> Don't re-tune if auto retuning is supported in HW (when SDHCI_TUNING_MODE_3
> is available).
> 
> [1] https://lore.kernel.org/all/2e5f1997-564c-44e4-b357-6343e0dae7ab@smile.fr
> 
> Fixes: f433e8aac6b9 ("mmc: sdhci-omap: Implement PM runtime functions")

Cc stable?

> Signed-off-by: Romain Naour <romain.naour@skf.com>

Minor cosmetics, otherwise:

Acked-by: Adrian Hunter <adrian.hunter@intel.com>

> ---
>  drivers/mmc/host/sdhci-omap.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/mmc/host/sdhci-omap.c b/drivers/mmc/host/sdhci-omap.c
> index e78faef67d7a..94076b095571 100644
> --- a/drivers/mmc/host/sdhci-omap.c
> +++ b/drivers/mmc/host/sdhci-omap.c
> @@ -1439,6 +1439,9 @@ static int __maybe_unused sdhci_omap_runtime_suspend(struct device *dev)
>  	struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
>  	struct sdhci_omap_host *omap_host = sdhci_pltfm_priv(pltfm_host);
>  
> +	if (host->tuning_mode != SDHCI_TUNING_MODE_3)
> +		mmc_retune_needed(host->mmc);
> +
>  	if (omap_host->con != -EINVAL)
>  		sdhci_runtime_suspend_host(host);
>  


