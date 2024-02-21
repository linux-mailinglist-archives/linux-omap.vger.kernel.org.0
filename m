Return-Path: <linux-omap+bounces-687-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E65F85D07E
	for <lists+linux-omap@lfdr.de>; Wed, 21 Feb 2024 07:31:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 54C951F2433D
	for <lists+linux-omap@lfdr.de>; Wed, 21 Feb 2024 06:31:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2BD031F16B;
	Wed, 21 Feb 2024 06:31:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CGDM3oSx"
X-Original-To: linux-omap@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11E4D4A1D;
	Wed, 21 Feb 2024 06:30:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708497060; cv=none; b=pHTwp+VcKlEh3T15mhs7MB/k2S92NvU2t3FVKESD7upn9fV+PmBGFh5Y9Wt5/3f3+fNNkegt727cU1lIGkPa/Udwxu68qO370zSnm3WixV2TBkp3d1Rd8vYqtrKt044hq6oJsXSkgqujCrThr1OChYki1Q7MYPuUey0/XylCXDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708497060; c=relaxed/simple;
	bh=fvHRvjJCBdn79HNK8KXKViqM3aKhNHqSGtji0zA0cAo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=h+Whdjmal8LQncggU4F34KWuZ7yQ29+JiXKKbysckED/ie7zicsjVBvGDz6IQm4RgsQTOR35F2s5huHb65F+pejzCZ6VcvlCZNNV+eIb+d9b4M1h1DRdIDuPLteNiIKXqufQSUmpxAhMgGWRnk89WVIOkNnXsScgSw7UHaM+J9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CGDM3oSx; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708497059; x=1740033059;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=fvHRvjJCBdn79HNK8KXKViqM3aKhNHqSGtji0zA0cAo=;
  b=CGDM3oSxFV67ObEE/mn4vfQunticVCPIT0EBaA4aMNivr39tmIMv5OHJ
   L2ogA/cF31udJc97XxFns2s0rBFOk9ro4zwD4xuqDkMzvSCtm+fOOPV7N
   Cu4aCQDak5c6NpFF+Ka1ZVg0b7rJQgPVidcutJEVaD88qc9itrf3q3XvB
   0UIn7tTWaafocyu8tEjK5iYYW536xg8xZIvlM9N5uZq5oPNaILpUfOSzF
   cxe7oySVTQK0vmkFeQG59v2kTejeNc47CVmuXzWf90SQiPlADrNsBP2rl
   z2SKJP4zLrGhJA6wHvvxrmo428VExRMOH5A5+ao9ByOzHjzsDrpUtIHNV
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10990"; a="5595945"
X-IronPort-AV: E=Sophos;i="6.06,174,1705392000"; 
   d="scan'208";a="5595945"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2024 22:30:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,174,1705392000"; 
   d="scan'208";a="36066273"
Received: from ahunter6-mobl1.ger.corp.intel.com (HELO [10.0.2.15]) ([10.251.221.1])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2024 22:30:55 -0800
Message-ID: <3aa092fd-177f-453e-abce-a53cd28c11e6@intel.com>
Date: Wed, 21 Feb 2024 08:30:50 +0200
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 8/9] mmc: sdhci-esdhc-mcf: Use sg_miter for swapping
To: Linus Walleij <linus.walleij@linaro.org>, Christoph Hellwig <hch@lst.de>,
 Jens Axboe <axboe@kernel.dk>, Ming Lei <ming.lei@redhat.com>,
 Arnd Bergmann <arnd@arndb.de>, Ulf Hansson <ulf.hansson@linaro.org>,
 Nicolas Pitre <nico@fluxnic.net>, Aaro Koskinen <aaro.koskinen@iki.fi>,
 Angelo Dureghello <angelo.dureghello@timesys.com>
Cc: linux-mmc@vger.kernel.org, linux-block@vger.kernel.org,
 linux-omap@vger.kernel.org
References: <20240127-mmc-proper-kmap-v2-0-d8e732aa97d1@linaro.org>
 <20240127-mmc-proper-kmap-v2-8-d8e732aa97d1@linaro.org>
Content-Language: en-US
From: Adrian Hunter <adrian.hunter@intel.com>
Organization: Intel Finland Oy, Registered Address: PL 281, 00181 Helsinki,
 Business Identity Code: 0357606 - 4, Domiciled in Helsinki
In-Reply-To: <20240127-mmc-proper-kmap-v2-8-d8e732aa97d1@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 27/01/24 02:19, Linus Walleij wrote:
> Use sg_miter iterator instead of sg_virt() and custom code
> to loop over the scatterlist. The memory iterator will do
> bounce buffering if the page happens to be located in high memory,
> which the driver may or may not be using.
> 
> Suggested-by: Christoph Hellwig <hch@lst.de>
> Link: https://lore.kernel.org/linux-mmc/20240122073423.GA25859@lst.de/
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>  drivers/mmc/host/sdhci-esdhc-mcf.c | 12 +++++++-----
>  1 file changed, 7 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/mmc/host/sdhci-esdhc-mcf.c b/drivers/mmc/host/sdhci-esdhc-mcf.c
> index a07f8333cd6b..1909a11fd065 100644
> --- a/drivers/mmc/host/sdhci-esdhc-mcf.c
> +++ b/drivers/mmc/host/sdhci-esdhc-mcf.c
> @@ -299,9 +299,8 @@ static void esdhc_mcf_pltfm_set_bus_width(struct sdhci_host *host, int width)
>  static void esdhc_mcf_request_done(struct sdhci_host *host,
>  				   struct mmc_request *mrq)
>  {
> -	struct scatterlist *sg;
> +	struct sg_mapping_iter sgm;
>  	u32 *buffer;
> -	int i;
>  
>  	if (!mrq->data || !mrq->data->bytes_xfered)
>  		goto exit_done;
> @@ -313,10 +312,13 @@ static void esdhc_mcf_request_done(struct sdhci_host *host,
>  	 * On mcf5441x there is no hw sdma option/flag to select the dma
>  	 * transfer endiannes. A swap after the transfer is needed.
>  	 */
> -	for_each_sg(mrq->data->sg, sg, mrq->data->sg_len, i) {
> -		buffer = (u32 *)sg_virt(sg);
> -		esdhc_mcf_buffer_swap32(buffer, sg->length);
> +	sg_miter_start(&sgm, mrq->data->sg, mrq->data->sg_len,
> +		       SG_MITER_TO_SG | SG_MITER_FROM_SG);

Could be called from atomic context, so probably needs
SG_MITER_ATOMIC

> +	while (sg_miter_next(&sgm)) {
> +		buffer = sgm.addr;
> +		esdhc_mcf_buffer_swap32(buffer, sgm.length);
>  	}
> +	sg_miter_stop(&sgm);
>  
>  exit_done:
>  	mmc_request_done(host->mmc, mrq);
> 


