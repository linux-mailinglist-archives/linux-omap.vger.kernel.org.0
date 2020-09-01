Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3EC30258D57
	for <lists+linux-omap@lfdr.de>; Tue,  1 Sep 2020 13:22:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726122AbgIALTv (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 1 Sep 2020 07:19:51 -0400
Received: from lelv0143.ext.ti.com ([198.47.23.248]:46474 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726326AbgIALTt (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 1 Sep 2020 07:19:49 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 081BEnr5090207;
        Tue, 1 Sep 2020 06:14:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1598958889;
        bh=PqEUqNJGk86zH9KZlQj1BR+3Hs8jHEbCXOMzmhZpbLs=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=be5cNdkkGgtfkS5FatQWaUVkVcNq1AQcvjtGS6Ofi267podOO15xlC57HJWmxAQ6c
         hZObOcuY0bSz9glimPtBMSOMRmoS4gLI1utqyLwU2pXp8U3EL/cPLlUj/KBHmLc0il
         p2jfF07rQUW5VcqJkdr21uDFQs1DmHEkfGRbV/lA=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 081BEmKM042804;
        Tue, 1 Sep 2020 06:14:48 -0500
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 1 Sep
 2020 06:14:48 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 1 Sep 2020 06:14:48 -0500
Received: from [192.168.2.14] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 081BElh2110614;
        Tue, 1 Sep 2020 06:14:47 -0500
Subject: Re: [PATCH v2 -next] memory: omap-gpmc: Fix -Wunused-function
 warnings
To:     YueHaibing <yuehaibing@huawei.com>, <tony@atomide.com>,
        <krzk@kernel.org>
CC:     <linux-omap@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20200901035642.22772-1-yuehaibing@huawei.com>
 <20200901070945.23792-1-yuehaibing@huawei.com>
From:   Roger Quadros <rogerq@ti.com>
Message-ID: <23ba6576-1f07-e60e-76f8-e48808f8d42b@ti.com>
Date:   Tue, 1 Sep 2020 14:14:46 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200901070945.23792-1-yuehaibing@huawei.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi,

On 01/09/2020 10:09, YueHaibing wrote:
> If CONFIG_OF is not set, make W=1 warns:
> 
> drivers/memory/omap-gpmc.c:987:12: warning: ‘gpmc_cs_remap’ defined but not used [-Wunused-function]
>   static int gpmc_cs_remap(int cs, u32 base)
>              ^~~~~~~~~~~~~
> drivers/memory/omap-gpmc.c:926:20: warning: ‘gpmc_cs_get_name’ defined but not used [-Wunused-function]
>   static const char *gpmc_cs_get_name(int cs)
>                      ^~~~~~~~~~~~~~~~
> drivers/memory/omap-gpmc.c:919:13: warning: ‘gpmc_cs_set_name’ defined but not used [-Wunused-function]
>   static void gpmc_cs_set_name(int cs, const char *name)
>               ^~~~~~~~~~~~~~~~
> Make them as  __maybe_unused to fix this.

Instead of that how about moving those 3 functions to within
#ifdef CONFIG_OF
#endif

like gpmc_probe_generic_child()

We are absolutely sure they are not required if CONFIG_OF isn't defined.

cheers,
-roger

> 
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
> ---
> v2: update commit log
> ---
>   drivers/memory/omap-gpmc.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/memory/omap-gpmc.c b/drivers/memory/omap-gpmc.c
> index ac0f577a51a1..24372254986e 100644
> --- a/drivers/memory/omap-gpmc.c
> +++ b/drivers/memory/omap-gpmc.c
> @@ -916,14 +916,14 @@ static bool gpmc_cs_reserved(int cs)
>   	return gpmc->flags & GPMC_CS_RESERVED;
>   }
>   
> -static void gpmc_cs_set_name(int cs, const char *name)
> +static void __maybe_unused gpmc_cs_set_name(int cs, const char *name)
>   {
>   	struct gpmc_cs_data *gpmc = &gpmc_cs[cs];
>   
>   	gpmc->name = name;
>   }
>   
> -static const char *gpmc_cs_get_name(int cs)
> +static const __maybe_unused char *gpmc_cs_get_name(int cs)
>   {
>   	struct gpmc_cs_data *gpmc = &gpmc_cs[cs];
>   
> @@ -984,7 +984,7 @@ static int gpmc_cs_delete_mem(int cs)
>    * "base". Returns 0 on success and appropriate negative error code
>    * on failure.
>    */
> -static int gpmc_cs_remap(int cs, u32 base)
> +static int __maybe_unused gpmc_cs_remap(int cs, u32 base)
>   {
>   	int ret;
>   	u32 old_base, size;
> 

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
