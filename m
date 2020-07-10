Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3295521BCF5
	for <lists+linux-omap@lfdr.de>; Fri, 10 Jul 2020 20:29:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727851AbgGJS3P (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 10 Jul 2020 14:29:15 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:45772 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726872AbgGJS3P (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 10 Jul 2020 14:29:15 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 06AITA3a016582;
        Fri, 10 Jul 2020 13:29:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1594405750;
        bh=JA2fGK+IPfj2XRw+1DVYm1XcdbI6kYi+WfeNyz5F/cE=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=KXwE82fH65xgnhVszE0t9MXVwpgz7n2HoWW71OKhIyV3X3D6qw87TbaIz+is8cmjE
         AMVdnP1iKvVQ8H+WGx/d/DlsU13UlvstrL8VEZ2iRzpwh+n5yfKCJiacsPqmVsqhWO
         bYUtIpVHs0Gi4yJq02N5vOK2gScZW7AnbbQ5HVWM=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 06AITAQF054371
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 10 Jul 2020 13:29:10 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Fri, 10
 Jul 2020 13:29:09 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Fri, 10 Jul 2020 13:29:09 -0500
Received: from [10.250.34.57] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 06AIT9ul061868;
        Fri, 10 Jul 2020 13:29:09 -0500
Subject: Re: [PATCH 00/13] Add IPU & DSP remoteprocs on OMAP4 and OMAP5
To:     Tony Lindgren <tony@atomide.com>
CC:     <linux-omap@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        Tero Kristo <t-kristo@ti.com>
References: <20200709231954.1973-1-s-anna@ti.com>
 <20200710165814.GF5849@atomide.com>
 <41bd2bb4-06fe-5f70-22cf-ce9cedc8bbc3@ti.com>
 <4602b219-6822-4ebc-66c6-c64740793938@ti.com>
 <20200710175907.GH5849@atomide.com>
From:   Suman Anna <s-anna@ti.com>
Message-ID: <bc05fbe7-be02-e44e-3461-69f7c06b7d34@ti.com>
Date:   Fri, 10 Jul 2020 13:29:08 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200710175907.GH5849@atomide.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 7/10/20 12:59 PM, Tony Lindgren wrote:
> * Suman Anna <s-anna@ti.com> [200710 17:29]:
>> FYI, the following one-line removal is enough for me to not see the error.
>>
>> diff --git a/arch/arm/mach-omap2/vc.c b/arch/arm/mach-omap2/vc.c
>> index 86f1ac4c2412..b80c9dff81c4 100644
>> --- a/arch/arm/mach-omap2/vc.c
>> +++ b/arch/arm/mach-omap2/vc.c
>> @@ -44,7 +44,6 @@
>>   #define OMAP4_VDD_DEFAULT_VAL  \
>>          (OMAP4430_VDD_I2C_DISABLE_MASK | \
>>           OMAP4430_VDD_IVA_PRESENCE | OMAP4430_VDD_MPU_PRESENCE | \
>> -        OMAP4430_AUTO_CTRL_VDD_IVA(OMAP4430_AUTO_CTRL_VDD_RET) | \
>>           OMAP4430_AUTO_CTRL_VDD_MPU(OMAP4430_AUTO_CTRL_VDD_RET) | \
>>           OMAP4430_AUTO_CTRL_VDD_CORE(OMAP4430_AUTO_CTRL_VDD_RET))
>>
> 
> OK.
> 
> Below is an untested attempt to sync the 4460 opp values with
> what earlier TI kernels had. Not sure if this help, might be worth
> testing :) My pandaboard-es seems to have a corrupt sdio card.

Yeah, mine is the regular pandaboard with 4430, so the below patch will 
not make any difference.

regards
Suman

> 
> Regards,
> 
> Tony
> 
> 8< ---------------------
> diff --git a/arch/arm/mach-omap2/opp4xxx_data.c b/arch/arm/mach-omap2/opp4xxx_data.c
> --- a/arch/arm/mach-omap2/opp4xxx_data.c
> +++ b/arch/arm/mach-omap2/opp4xxx_data.c
> @@ -66,21 +66,23 @@ struct omap_volt_data omap443x_vdd_core_volt_data[] = {
>   };
>   
>   #define OMAP4460_VDD_MPU_OPP50_UV		1025000
> -#define OMAP4460_VDD_MPU_OPP100_UV		1200000
> -#define OMAP4460_VDD_MPU_OPPTURBO_UV		1313000
> -#define OMAP4460_VDD_MPU_OPPNITRO_UV		1375000
> +#define OMAP4460_VDD_MPU_OPP100_UV		1203000
> +#define OMAP4460_VDD_MPU_OPPTURBO_UV		1317000
> +#define OMAP4460_VDD_MPU_OPPNITRO_UV		1380000
> +#define OMAP4460_VDD_MPU_OPPNITROSB_UV		1390000
>   
>   struct omap_volt_data omap446x_vdd_mpu_volt_data[] = {
>   	VOLT_DATA_DEFINE(OMAP4460_VDD_MPU_OPP50_UV, OMAP44XX_CONTROL_FUSE_MPU_OPP50, 0xf4, 0x0c),
>   	VOLT_DATA_DEFINE(OMAP4460_VDD_MPU_OPP100_UV, OMAP44XX_CONTROL_FUSE_MPU_OPP100, 0xf9, 0x16),
>   	VOLT_DATA_DEFINE(OMAP4460_VDD_MPU_OPPTURBO_UV, OMAP44XX_CONTROL_FUSE_MPU_OPPTURBO, 0xfa, 0x23),
>   	VOLT_DATA_DEFINE(OMAP4460_VDD_MPU_OPPNITRO_UV, OMAP44XX_CONTROL_FUSE_MPU_OPPNITRO, 0xfa, 0x27),
> +	VOLT_DATA_DEFINE(OMAP4460_VDD_MPU_OPPNITROSB_UV, OMAP44XX_CONTROL_FUSE_MPU_OPPNITROSB, 0xfa, 0x27),
>   	VOLT_DATA_DEFINE(0, 0, 0, 0),
>   };
>   
> -#define OMAP4460_VDD_IVA_OPP50_UV		1025000
> -#define OMAP4460_VDD_IVA_OPP100_UV		1200000
> -#define OMAP4460_VDD_IVA_OPPTURBO_UV		1313000
> +#define OMAP4460_VDD_IVA_OPP50_UV		 950000
> +#define OMAP4460_VDD_IVA_OPP100_UV		1140000
> +#define OMAP4460_VDD_IVA_OPPTURBO_UV		1291000
>   #define OMAP4460_VDD_IVA_OPPNITRO_UV		1375000
>   
>   struct omap_volt_data omap446x_vdd_iva_volt_data[] = {
> @@ -91,8 +93,8 @@ struct omap_volt_data omap446x_vdd_iva_volt_data[] = {
>   	VOLT_DATA_DEFINE(0, 0, 0, 0),
>   };
>   
> -#define OMAP4460_VDD_CORE_OPP50_UV		1025000
> -#define OMAP4460_VDD_CORE_OPP100_UV		1200000
> +#define OMAP4460_VDD_CORE_OPP50_UV		 962000
> +#define OMAP4460_VDD_CORE_OPP100_UV		1127000
>   #define OMAP4460_VDD_CORE_OPP100_OV_UV		1250000
>   
>   struct omap_volt_data omap446x_vdd_core_volt_data[] = {
> 

