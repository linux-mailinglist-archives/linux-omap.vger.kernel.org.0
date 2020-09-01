Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3CCB9258E6D
	for <lists+linux-omap@lfdr.de>; Tue,  1 Sep 2020 14:44:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727822AbgIAMNd (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 1 Sep 2020 08:13:33 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:58710 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728134AbgIAML4 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 1 Sep 2020 08:11:56 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 081CBeeM129244;
        Tue, 1 Sep 2020 07:11:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1598962300;
        bh=ZPmfc3tbXFxNZBsIdxF9wSsTNTax2dCj/lPCTR7IpIM=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=MMcndQqW8HAc+L/7lnPJ+PtCj97/3WF7HraTRUIyZ4S2dhJB5Xd3+4KnBZ6GT2Mfv
         oDYCISZHNWk1r7VwJ0zsmPI93bmOw6M66W5PETczpfrp8LEty3X39bfrDdDmQOiG2Y
         2AWFlnkZesAiLPDPCdzNtzDXiZH9fB/CA4s4Vdqg=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 081CBeN0026303
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 1 Sep 2020 07:11:40 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 1 Sep
 2020 07:11:40 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 1 Sep 2020 07:11:39 -0500
Received: from [192.168.2.14] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 081CBc0B077801;
        Tue, 1 Sep 2020 07:11:38 -0500
Subject: Re: [PATCH v3 -next] memory: omap-gpmc: Fix -Wunused-function
 warnings
To:     YueHaibing <yuehaibing@huawei.com>, <tony@atomide.com>,
        <krzk@kernel.org>
CC:     <linux-omap@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20200901035642.22772-1-yuehaibing@huawei.com>
 <20200901112832.3084-1-yuehaibing@huawei.com>
From:   Roger Quadros <rogerq@ti.com>
Message-ID: <616e2369-13d1-b120-d1c2-bf8fea7f52b7@ti.com>
Date:   Tue, 1 Sep 2020 15:11:37 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200901112832.3084-1-yuehaibing@huawei.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org



On 01/09/2020 14:28, YueHaibing wrote:
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
> Move them to #ifdef CONFIG_OF block to fix this.
> 
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>

Acked-by: Roger Quadros <rogerq@ti.com>

> ---
> v3: move the functions to #ifdef block
> v2: update commit log
> ---
>   drivers/memory/omap-gpmc.c | 114 ++++++++++++++++++-------------------
>   1 file changed, 57 insertions(+), 57 deletions(-)
> 
> diff --git a/drivers/memory/omap-gpmc.c b/drivers/memory/omap-gpmc.c
> index ac0f577a51a1..cfa730cfd145 100644
> --- a/drivers/memory/omap-gpmc.c
> +++ b/drivers/memory/omap-gpmc.c
> @@ -916,20 +916,6 @@ static bool gpmc_cs_reserved(int cs)
>   	return gpmc->flags & GPMC_CS_RESERVED;
>   }
>   
> -static void gpmc_cs_set_name(int cs, const char *name)
> -{
> -	struct gpmc_cs_data *gpmc = &gpmc_cs[cs];
> -
> -	gpmc->name = name;
> -}
> -
> -static const char *gpmc_cs_get_name(int cs)
> -{
> -	struct gpmc_cs_data *gpmc = &gpmc_cs[cs];
> -
> -	return gpmc->name;
> -}
> -
>   static unsigned long gpmc_mem_align(unsigned long size)
>   {
>   	int order;
> @@ -975,49 +961,6 @@ static int gpmc_cs_delete_mem(int cs)
>   	return r;
>   }
>   
> -/**
> - * gpmc_cs_remap - remaps a chip-select physical base address
> - * @cs:		chip-select to remap
> - * @base:	physical base address to re-map chip-select to
> - *
> - * Re-maps a chip-select to a new physical base address specified by
> - * "base". Returns 0 on success and appropriate negative error code
> - * on failure.
> - */
> -static int gpmc_cs_remap(int cs, u32 base)
> -{
> -	int ret;
> -	u32 old_base, size;
> -
> -	if (cs >= gpmc_cs_num) {
> -		pr_err("%s: requested chip-select is disabled\n", __func__);
> -		return -ENODEV;
> -	}
> -
> -	/*
> -	 * Make sure we ignore any device offsets from the GPMC partition
> -	 * allocated for the chip select and that the new base confirms
> -	 * to the GPMC 16MB minimum granularity.
> -	 */
> -	base &= ~(SZ_16M - 1);
> -
> -	gpmc_cs_get_memconf(cs, &old_base, &size);
> -	if (base == old_base)
> -		return 0;
> -
> -	ret = gpmc_cs_delete_mem(cs);
> -	if (ret < 0)
> -		return ret;
> -
> -	ret = gpmc_cs_insert_mem(cs, base, size);
> -	if (ret < 0)
> -		return ret;
> -
> -	ret = gpmc_cs_set_memconf(cs, base, size);
> -
> -	return ret;
> -}
> -
>   int gpmc_cs_request(int cs, unsigned long size, unsigned long *base)
>   {
>   	struct gpmc_cs_data *gpmc = &gpmc_cs[cs];
> @@ -1941,6 +1884,63 @@ static const struct of_device_id gpmc_dt_ids[] = {
>   	{ }
>   };
>   
> +static void gpmc_cs_set_name(int cs, const char *name)
> +{
> +	struct gpmc_cs_data *gpmc = &gpmc_cs[cs];
> +
> +	gpmc->name = name;
> +}
> +
> +static const char *gpmc_cs_get_name(int cs)
> +{
> +	struct gpmc_cs_data *gpmc = &gpmc_cs[cs];
> +
> +	return gpmc->name;
> +}
> +
> +/**
> + * gpmc_cs_remap - remaps a chip-select physical base address
> + * @cs:		chip-select to remap
> + * @base:	physical base address to re-map chip-select to
> + *
> + * Re-maps a chip-select to a new physical base address specified by
> + * "base". Returns 0 on success and appropriate negative error code
> + * on failure.
> + */
> +static int gpmc_cs_remap(int cs, u32 base)
> +{
> +	int ret;
> +	u32 old_base, size;
> +
> +	if (cs >= gpmc_cs_num) {
> +		pr_err("%s: requested chip-select is disabled\n", __func__);
> +		return -ENODEV;
> +	}
> +
> +	/*
> +	 * Make sure we ignore any device offsets from the GPMC partition
> +	 * allocated for the chip select and that the new base confirms
> +	 * to the GPMC 16MB minimum granularity.
> +	 */
> +	base &= ~(SZ_16M - 1);
> +
> +	gpmc_cs_get_memconf(cs, &old_base, &size);
> +	if (base == old_base)
> +		return 0;
> +
> +	ret = gpmc_cs_delete_mem(cs);
> +	if (ret < 0)
> +		return ret;
> +
> +	ret = gpmc_cs_insert_mem(cs, base, size);
> +	if (ret < 0)
> +		return ret;
> +
> +	ret = gpmc_cs_set_memconf(cs, base, size);
> +
> +	return ret;
> +}
> +
>   /**
>    * gpmc_read_settings_dt - read gpmc settings from device-tree
>    * @np:		pointer to device-tree node for a gpmc child device
> 

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
