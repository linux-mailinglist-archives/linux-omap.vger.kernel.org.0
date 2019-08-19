Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1157C92066
	for <lists+linux-omap@lfdr.de>; Mon, 19 Aug 2019 11:33:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727142AbfHSJdA (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 19 Aug 2019 05:33:00 -0400
Received: from lelv0143.ext.ti.com ([198.47.23.248]:37524 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726491AbfHSJdA (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 19 Aug 2019 05:33:00 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x7J9WrkH091941;
        Mon, 19 Aug 2019 04:32:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1566207173;
        bh=Tl3P3YfHa/NL1Glc6+gi9ROXr1hL3aCM4tFVkkDcjxQ=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=h3quO8rmqSPHiuw0g6LdDMjd8pN9DhQYNhtigxwBvnKbRKfifRP539uaPACtFodgI
         vTaOpQ2xuSvSFyO9fpDqKFQIxi4/pukcwTj4YjqrithJzPldLW/i/glHsOCRxq0owr
         eMfacolfvd28GLBbZ2UHLXCvIWSjZB8XLpWhipN8=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x7J9WrXh084052
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 19 Aug 2019 04:32:53 -0500
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Mon, 19
 Aug 2019 04:32:52 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Mon, 19 Aug 2019 04:32:52 -0500
Received: from [127.0.0.1] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x7J9Wn1A025052;
        Mon, 19 Aug 2019 04:32:50 -0500
Subject: Re: [PATCH 5/8] soc: ti: omap-prm: add omap4 PRM data
To:     Keerthy <j-keerthy@ti.com>, <ssantosh@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-omap@vger.kernel.org>, <robh+dt@kernel.org>
CC:     <tony@atomide.com>, <s-anna@ti.com>, <devicetree@vger.kernel.org>
References: <1565164139-21886-1-git-send-email-t-kristo@ti.com>
 <1565164139-21886-6-git-send-email-t-kristo@ti.com>
 <643cd090-a4d5-dac6-8395-c01f7fba04ab@ti.com>
From:   Tero Kristo <t-kristo@ti.com>
Message-ID: <80e70ba0-691e-8284-ae6b-80b160b3317e@ti.com>
Date:   Mon, 19 Aug 2019 12:32:49 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <643cd090-a4d5-dac6-8395-c01f7fba04ab@ti.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 08/08/2019 08:30, Keerthy wrote:
> 
> 
> On 07/08/19 1:18 PM, Tero Kristo wrote:
>> Add PRM data for omap4 family of SoCs.
>>
>> Signed-off-by: Tero Kristo <t-kristo@ti.com>
>> ---
>>   drivers/soc/ti/omap_prm.c | 20 ++++++++++++++++++++
>>   1 file changed, 20 insertions(+)
>>
>> diff --git a/drivers/soc/ti/omap_prm.c b/drivers/soc/ti/omap_prm.c
>> index 870515e3..9b8d5945 100644
>> --- a/drivers/soc/ti/omap_prm.c
>> +++ b/drivers/soc/ti/omap_prm.c
>> @@ -54,7 +54,27 @@ struct omap_reset_data {
>>   #define OMAP_PRM_NO_RSTST    BIT(0)
>> +struct omap_prm_data omap4_prm_data[] = {
>> +    { .name = "mpu", .base = 0x4a306300, .pwstst = 0x4 },
>> +    { .name = "tesla", .base = 0x4a306400, .pwstst = 0x4, .rstctl = 
>> 0x10, .rstst = 0x14 },
>> +    { .name = "abe", .base = 0x4a306500, .pwstst = 0x4 },
>> +    { .name = "always_on_core", .base = 0x4a306600, .pwstst = 0x4 },
>> +    { .name = "core", .base = 0x4a306700, .pwstst = 0x4, .rstctl = 
>> 0x210, .rstst = 0x214 },
>> +    { .name = "ivahd", .base = 0x4a306f00, .pwstst = 0x4, .rstctl = 
>> 0x10, .rstst = 0x14 },
>> +    { .name = "cam", .base = 0x4a307000, .pwstst = 0x4 },
>> +    { .name = "dss", .base = 0x4a307100, .pwstst = 0x4 },
>> +    { .name = "gfx", .base = 0x4a307200, .pwstst = 0x4 },
>> +    { .name = "l3init", .base = 0x4a307300, .pwstst = 0x4 },
>> +    { .name = "l4per", .base = 0x4a307400, .pwstst = 0x4 },
>> +    { .name = "cefuse", .base = 0x4a307600, .pwstst = 0x4 },
>> +    { .name = "wkup", .base = 0x4a307700, .pwstst = 0x4 },
>> +    { .name = "emu", .base = 0x4a307900, .pwstst = 0x4 },
>> +    { .name = "device", .base = 0x4a307b00, .rstctl = 0x0, .rstst = 
>> 0x4 },
>> +    { },
>> +};
> 
> So at some point arch/arm/mach-omap2/powerdomains44xx_data.c
> duplicated data will be removed?

Yes, that would be the path forward eventually.

-Tero

> 
>> +
>>   static const struct of_device_id omap_prm_id_table[] = {
>> +    { .compatible = "ti,omap4-prm-inst", .data = omap4_prm_data },
>>       { },
>>   };
>>

--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
