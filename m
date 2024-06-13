Return-Path: <linux-omap+bounces-1526-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 52CFC90634E
	for <lists+linux-omap@lfdr.de>; Thu, 13 Jun 2024 07:09:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F09281F2372F
	for <lists+linux-omap@lfdr.de>; Thu, 13 Jun 2024 05:09:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7959213440F;
	Thu, 13 Jun 2024 05:09:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LRSF+6Vx"
X-Original-To: linux-omap@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A768D131BDF;
	Thu, 13 Jun 2024 05:09:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718255375; cv=none; b=KIGkaDTx+6k79x0wpjKg2XQqUXD1vB2iHOzGlSVYjzO/KbE3a8Qtwp8+Cb47xOieq4wGktEKDzEHJTF8pbbWsp+ci/iRKtzK4+qFi1KHJ63gjh3xrNzbSwv0heU7nrbULCxtDdHlD3nbFbgul/3E+FRWJ4cf5hgZEzEHNLYIudo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718255375; c=relaxed/simple;
	bh=d2zHKEPYRaLxQin1vegxojUgTa6cB4MWuOJFGyRl3hs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YFFArx92RWiu93kC2yD3czM8Euk2wWNjkHdtiKo7yG5UYoEZ1QvwRCSIyZCaJEIozWXTL39u1ExBVvV3gQ2Az2kitefFGAT/BFHQ6QKHDwlScvvOj1pw6FEseklGk4+cs1t87Fr9VQr01eSsMDZNzi6CsNhPqqFLp26y1VuvLe0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LRSF+6Vx; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718255373; x=1749791373;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=d2zHKEPYRaLxQin1vegxojUgTa6cB4MWuOJFGyRl3hs=;
  b=LRSF+6VxMKJT0xIkqnC/xAMcc6Y9iZwZqG53NBEyoz1xECtvR+7rH4fw
   pE2SMlUdLgRplwBb7a2Sgg7UsL5xxDnPyD4q5C3TzmecWwHlHYrLuZKRP
   rjAFwiWsGVS0zT2wMU4c0b46tas1oy758e47940rC098J1CLLcbIRMxik
   xZtnFixaxSY8lW58Rwk/xev7Ik5tXJsDkbnYASjjolTliZKAj0oU4wqAb
   1MrX6qSgdwKN+3qIsd8bQvKW9rd5pnakDYW9K29uM2VB6v+yGnrG+7u/D
   jf0h7NDqOhy5UwEBQihw1sJNWhJU+9e/A7nR6xaxbQGGBlxuGXMU2DJPG
   A==;
X-CSE-ConnectionGUID: qNNtuX6BTGSyJzWSbYeFIQ==
X-CSE-MsgGUID: 0NOmCgUeQAe9X9zTN7Jr1g==
X-IronPort-AV: E=McAfee;i="6700,10204,11101"; a="32538369"
X-IronPort-AV: E=Sophos;i="6.08,234,1712646000"; 
   d="scan'208";a="32538369"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2024 22:09:31 -0700
X-CSE-ConnectionGUID: BqobX7PhQ8O7vFb46O+THg==
X-CSE-MsgGUID: YjK4pofaQlOB9Vzm5B24jg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,234,1712646000"; 
   d="scan'208";a="39975748"
Received: from ahunter6-mobl1.ger.corp.intel.com (HELO [10.0.2.15]) ([10.246.41.28])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2024 22:09:24 -0700
Message-ID: <17eadeab-ecd5-4302-94b3-bbcf4f9d8dfc@intel.com>
Date: Thu, 13 Jun 2024 08:09:19 +0300
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] mmc: Convert from tasklet to BH workqueue
To: Allen Pais <allen.lkml@gmail.com>,
 Aubin Constans <aubin.constans@microchip.com>,
 Ulf Hansson <ulf.hansson@linaro.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 Manuel Lauss <manuel.lauss@gmail.com>,
 =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
 Jaehoon Chung <jh80.chung@samsung.com>, Aaro Koskinen
 <aaro.koskinen@iki.fi>, Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>, Ray Jui
 <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Alex Dubov <oakad@yahoo.com>,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Masami Hiramatsu <mhiramat@kernel.org>, Bruce Chang <brucechang@via.com.tw>,
 Harald Welte <HaraldWelte@viatech.com>, Pierre Ossman <pierre@ossman.eu>
Cc: Christian Loehle <christian.loehle@arm.com>, linux-mmc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-omap@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <20240612234930.211119-1-allen.lkml@gmail.com>
Content-Language: en-US
From: Adrian Hunter <adrian.hunter@intel.com>
Organization: Intel Finland Oy, Registered Address: PL 281, 00181 Helsinki,
 Business Identity Code: 0357606 - 4, Domiciled in Helsinki
In-Reply-To: <20240612234930.211119-1-allen.lkml@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 13/06/24 02:49, Allen Pais wrote:
> The only generic interface to execute asynchronously in the BH context is
> tasklet; however, it's marked deprecated and has some design flaws. To
> replace tasklets, BH workqueue support was recently added. A BH workqueue
> behaves similarly to regular workqueues except that the queued work items
> are executed in the BH context.
> 
> This patch converts drivers/mmc/* from tasklet to BH workqueue.
> 
> Based on the work done by Tejun Heo <tj@kernel.org>
> 
> Tested-by: Christian Loehle <christian.loehle@arm.com>
> Tested-by: Aubin Constans <aubin.constans@microchip.com>
> Acked-by: Aubin Constans <aubin.constans@microchip.com>
> Acked-by: Michał Mirosław <mirq-linux@rere.qmqm.pl>
> Reviewed-by: Christian Loehle <christian.loehle@arm.com>
> Signed-off-by: Allen Pais <allen.lkml@gmail.com>
> ---
> v2:
>    - fixed patch styling issues
>    - rename work to bh_work
> 
> Link to v1:
> https://lore.kernel.org/all/20240327160314.9982-10-apais@linux.microsoft.com/
> 

[SNIP]

> diff --git a/drivers/mmc/host/sdhci-bcm-kona.c b/drivers/mmc/host/sdhci-bcm-kona.c
> index cb9152c6a65d..9c215db81b2b 100644
> --- a/drivers/mmc/host/sdhci-bcm-kona.c
> +++ b/drivers/mmc/host/sdhci-bcm-kona.c
> @@ -107,7 +107,7 @@ static void sdhci_bcm_kona_sd_init(struct sdhci_host *host)
>   * Software emulation of the SD card insertion/removal. Set insert=1 for insert
>   * and insert=0 for removal. The card detection is done by GPIO. For Broadcom
>   * IP to function properly the bit 0 of CORESTAT register needs to be set/reset
> - * to generate the CD IRQ handled in sdhci.c which schedules card_tasklet.
> + * to generate the CD IRQ handled in sdhci.c which schedules card_bh_work.

The comment was stale because sdhci.c has not had a card_tasklet for
a long time.  Just drop the " which schedules card_tasklet"

>   */
>  static int sdhci_bcm_kona_sd_card_emulate(struct sdhci_host *host, int insert)
>  {


