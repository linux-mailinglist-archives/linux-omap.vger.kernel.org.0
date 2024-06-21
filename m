Return-Path: <linux-omap+bounces-1579-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EFE79121AB
	for <lists+linux-omap@lfdr.de>; Fri, 21 Jun 2024 12:09:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6F3BA1C22B70
	for <lists+linux-omap@lfdr.de>; Fri, 21 Jun 2024 10:09:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B48F1176243;
	Fri, 21 Jun 2024 10:06:47 +0000 (UTC)
X-Original-To: linux-omap@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D471E171647;
	Fri, 21 Jun 2024 10:06:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718964407; cv=none; b=taH8So7m0qrNfqPzewpQ4EHwBeLwWwHmQfDtCxim91Sr3fq3q8cdQhonn7ytSQAqFO4aktLU/2c0BPEojHSmr0wqU8Lq7RCExum3lacKE/5Qrc3n1no825Fv+sNrf7svpQU2mYwmnwYCh8FYM1mWEYXdi6IXF7K/jBShNar1Za8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718964407; c=relaxed/simple;
	bh=7ZwF/4gCp2xy/o3OBICgLWHzRyeKJlkv5mp8YDCLCR0=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=bBuV7mP2vzuxkQms0BKKWwLkVXghKvTzWeJW+y1tUwCptqBXJeTCFbZZ7LGjSgOi67HCvDzGXNGlfXq0XQgZN6BjVRhOmwQe9kFa7uL6jfM76xC88JauXQJJVjQNXVtjvmgBMNKHbIz4Moh57YKVO1wmf2DqcMfec9SRCYcQf4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B321FDA7;
	Fri, 21 Jun 2024 03:07:08 -0700 (PDT)
Received: from [10.57.42.30] (unknown [10.57.42.30])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1B7CF3F6A8;
	Fri, 21 Jun 2024 03:06:39 -0700 (PDT)
Message-ID: <fc2b8a80-373a-4049-bdaf-9970a1c1f651@arm.com>
Date: Fri, 21 Jun 2024 11:06:37 +0100
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] mmc: Convert from tasklet to BH workqueue
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Allen Pais <allen.lkml@gmail.com>,
 Aubin Constans <aubin.constans@microchip.com>,
 Ulf Hansson <ulf.hansson@linaro.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 Manuel Lauss <manuel.lauss@gmail.com>,
 =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
 Jaehoon Chung <jh80.chung@samsung.com>, Aaro Koskinen
 <aaro.koskinen@iki.fi>, Adrian Hunter <adrian.hunter@intel.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>, Ray Jui
 <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Alex Dubov <oakad@yahoo.com>,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Masami Hiramatsu <mhiramat@kernel.org>, Bruce Chang <brucechang@via.com.tw>,
 Harald Welte <HaraldWelte@viatech.com>, Pierre Ossman <pierre@ossman.eu>,
 linux-mmc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org
References: <20240618225210.825290-1-allen.lkml@gmail.com>
 <gw6adkoy3ndjdjufti2gs2gnk3xdgylt6tnia2zha76hsgdwtq@dr3czbxjij66>
Content-Language: en-US
From: Christian Loehle <christian.loehle@arm.com>
In-Reply-To: <gw6adkoy3ndjdjufti2gs2gnk3xdgylt6tnia2zha76hsgdwtq@dr3czbxjij66>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 6/21/24 10:53, Wolfram Sang wrote:
> Hi,
> 
> On Tue, Jun 18, 2024 at 03:52:07PM GMT, Allen Pais wrote:
>> The only generic interface to execute asynchronously in the BH context is
>> tasklet; however, it's marked deprecated and has some design flaws. To
>> replace tasklets, BH workqueue support was recently added. A BH workqueue
>> behaves similarly to regular workqueues except that the queued work items
>> are executed in the BH context.
>>
>> This patch converts drivers/mmc/* from tasklet to BH workqueue.
>>
>> Based on the work done by Tejun Heo <tj@kernel.org>
> 
> Has this been fully build-tested?

Obviously not, FWIW I noted this on v1:
https://lore.kernel.org/linux-mmc/9c31b697-3d80-407a-82b3-cfbb19fafb31@arm.com/
But hadn't looked at the patch since then, sorry.

> 
> ===
> drivers/mmc/host/renesas_sdhi_internal_dmac.c: In function ‘renesas_sdhi_internal_dmac_complete_work_fn’:
> ./include/linux/container_of.h:20:54: error: ‘struct tmio_mmc_host’ has no member named ‘dma_complete’
> ===
> 
> In deed, 'dma_complete' is only in 'struct renesas_sdhi_dma'. From
> there, we can get to the parent 'struct renesas_sdhi' using
> container_of. But then, I don't see a way to go to 'struct
> tmio_mmc_host' from there. The other way around is possible because
> there is the pointer 'struct tmio_mmc_data *pdata' in the TMIO struct
> pointing to the data contained in 'struct renesas_sdhi'. 'host_to_priv()'
> does the math. But I don't see a path the other way around.
> 
> So, it doesn't look like the workqueue interface can provide a
> generic pointer like tasklets could do? This means we have to add a
> pointer from 'struct renesas_sdhi' to 'struct tmio_mmc_host'?
> 
> All the best,
> 
>    Wolfram
> 


