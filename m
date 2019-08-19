Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 74CC291DC9
	for <lists+linux-omap@lfdr.de>; Mon, 19 Aug 2019 09:27:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725958AbfHSH0v (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 19 Aug 2019 03:26:51 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:49794 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725768AbfHSH0v (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 19 Aug 2019 03:26:51 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x7J7QfjJ076517;
        Mon, 19 Aug 2019 02:26:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1566199601;
        bh=VTkyt738yFik3KLlxZ8+j710jFaiCDUYBtYwzHRejMM=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=a2NbfhR7RkcNaJ/cOPLSSHOcw48iGcoP72lY4R/zejtJfkTzwbQ7/d6FBHeIeUuIs
         E+0FbyZiyoung2cy/c9B3Lewd/KkouSJTx3dY//04pCNV3PXICEZVO1bMjWSx/hXVz
         fC0dnv2et1egxA+f9AsVliUKwRpwAM+DFTZUA6Ks=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x7J7QfpX023053
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 19 Aug 2019 02:26:41 -0500
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Mon, 19
 Aug 2019 02:26:41 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Mon, 19 Aug 2019 02:26:41 -0500
Received: from [172.24.191.45] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x7J7QcrQ098685;
        Mon, 19 Aug 2019 02:26:39 -0500
Subject: Re: Suspend/Resume Broken on AM43/AM33 Platforms
To:     Stephen Boyd <swboyd@chromium.org>,
        Tony Lindgren <tony@atomide.com>, <herbert@gondor.apana.org.au>
CC:     Linux-OMAP <linux-omap@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "Kristo, Tero" <t-kristo@ti.com>, Dave Gerlach <d-gerlach@ti.com>
References: <49fc7c64-88c0-74d0-2cb3-07986490941d@ti.com>
 <5d5a4150.1c69fb81.3faa2.eee8@mx.google.com>
From:   Keerthy <j-keerthy@ti.com>
Message-ID: <b0678bfc-05ae-99b4-5b24-5c813efe718d@ti.com>
Date:   Mon, 19 Aug 2019 12:57:13 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <5d5a4150.1c69fb81.3faa2.eee8@mx.google.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org



On 19/08/19 11:57 AM, Stephen Boyd wrote:
> Quoting Keerthy (2019-08-18 21:24:58)
>> Hi Stephen,
>>
>> commit 03a3bb7ae63150230c5de645dc95e673ebf17e1a
>> Author: Stephen Boyd <swboyd@chromium.org>
>> Date:   Mon Aug 5 16:32:41 2019 -0700
>>
>>       hwrng: core - Freeze khwrng thread during suspend
>>
>> Commit seems to be breaking suspend/resume on TI AM43/AM33 platforms.
>>
>>
>> rtcwake: wakeup from "mem" using /dev/rtc0 at Sun Nov 18 02:12:12 2018
>> [   54.033833] PM: suspend entry (deep)
>> [   54.037741] Filesystems sync: 0.000 seconds
>> [   54.062730] Freezing user space processes ... (elapsed 0.001 seconds)
>> done.
>> [   54.071313] OOM killer disabled.
>> [   54.074572] Freezing remaining freezable tasks ...
>> [   74.083121] Freezing of tasks failed after 20.003 seconds (1 tasks
>> refusing to freeze, wq_busy=0):
>> [   74.092257] hwrng           R  running task        0   289      2
>> 0x00000020
>> [   74.099511] [<c08c64c4>] (__schedule) from [<c08c6a10>]
>> (schedule+0x3c/0xc0)
>> [   74.106720] [<c08c6a10>] (schedule) from [<c05dbd8c>]
>> (add_hwgenerator_randomness+0xb0/0x100)
>> [   74.115358] [<c05dbd8c>] (add_hwgenerator_randomness) from
>> [<bf1803c8>] (hwrng_fillfn+0xc0/0x14c [rng_core])
> 
> Thanks for the report. I suspect we need to check for freezer in
> add_hwgenerator_randomness(). I find it odd that there's another caller
> of add_hwgenerator_randomness(), but maybe the ath9k driver can be
> converted to some sort of hwrng driver instead of calling into the
> kthread directly.
> 
> Anyway, can you try this patch?

I applied the below patch on top of latest next branch.

Fixes the issue.

Thanks,
Keerthy

> 
> ---8<---
> diff --git a/drivers/char/random.c b/drivers/char/random.c
> index 5d5ea4ce1442..e2e85ca16410 100644
> --- a/drivers/char/random.c
> +++ b/drivers/char/random.c
> @@ -2429,6 +2429,7 @@ void add_hwgenerator_randomness(const char *buffer, size_t count,
>   				size_t entropy)
>   {
>   	struct entropy_store *poolp = &input_pool;
> +	bool frozen = false;
>   
>   	if (unlikely(crng_init == 0)) {
>   		crng_fast_load(buffer, count);
> @@ -2439,9 +2440,12 @@ void add_hwgenerator_randomness(const char *buffer, size_t count,
>   	 * We'll be woken up again once below random_write_wakeup_thresh,
>   	 * or when the calling thread is about to terminate.
>   	 */
> -	wait_event_interruptible(random_write_wait, kthread_should_stop() ||
> +	wait_event_interruptible(random_write_wait,
> +			kthread_freezable_should_stop(&frozen) ||
>   			ENTROPY_BITS(&input_pool) <= random_write_wakeup_bits);
> -	mix_pool_bytes(poolp, buffer, count);
> -	credit_entropy_bits(poolp, entropy);
> +	if (!frozen) {
> +		mix_pool_bytes(poolp, buffer, count);
> +		credit_entropy_bits(poolp, entropy);
> +	}
>   }
>   EXPORT_SYMBOL_GPL(add_hwgenerator_randomness);
> 
