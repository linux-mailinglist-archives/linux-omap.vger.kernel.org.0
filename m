Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E2114254AC9
	for <lists+linux-omap@lfdr.de>; Thu, 27 Aug 2020 18:37:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726147AbgH0Qh4 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 27 Aug 2020 12:37:56 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:52634 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726009AbgH0Qh4 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 27 Aug 2020 12:37:56 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 07RGbLba105509;
        Thu, 27 Aug 2020 11:37:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1598546241;
        bh=Mx//Pdg+H+WkwhXnTFfk3IX8zqYVvEgOrHOAmDMt3XE=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=KyfY5s0Gb9luwYKdK1rAQT4Zj+f1oPnNq78Pbr60bnNy52+9eapXOUV6H2Ru5g2yS
         4pOyM7Gp4NbsADNvGdEwxhvLOvLOF8bKwei924xKyA5kqHL3/XLZycl2T495BNRmOX
         4V8sVKqszHpzKPHg8qB/u+RHllu9hYG+8aH6FJYs=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 07RGbL3Q073020
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 27 Aug 2020 11:37:21 -0500
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Thu, 27
 Aug 2020 11:37:21 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Thu, 27 Aug 2020 11:37:21 -0500
Received: from [192.168.2.14] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 07RGbJRN116794;
        Thu, 27 Aug 2020 11:37:19 -0500
Subject: Re: [PATCH v3] memory: omap-gpmc: Fix build error without CONFIG_OF
To:     Krzysztof Kozlowski <krzk@kernel.org>,
        YueHaibing <yuehaibing@huawei.com>
CC:     <tony@atomide.com>, <ladis@linux-mips.org>,
        <bbrezillon@kernel.org>, <peter.ujfalusi@ti.com>,
        <linux-omap@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20200826125919.22172-1-yuehaibing@huawei.com>
 <20200827125316.20780-1-yuehaibing@huawei.com>
 <20200827132154.GB4384@kozik-lap>
From:   Roger Quadros <rogerq@ti.com>
Message-ID: <45d3fa05-01e8-c879-e314-ae627ca4c266@ti.com>
Date:   Thu, 27 Aug 2020 19:37:18 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200827132154.GB4384@kozik-lap>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org



On 27/08/2020 16:21, Krzysztof Kozlowski wrote:
> On Thu, Aug 27, 2020 at 08:53:16PM +0800, YueHaibing wrote:
>> If CONFIG_OF is n, gcc fails:
>>
>> drivers/memory/omap-gpmc.o: In function `gpmc_omap_onenand_set_timings':
>> omap-gpmc.c:(.text+0x2a88): undefined reference to `gpmc_read_settings_dt'
>>
>> Add gpmc_read_settings_dt() helper function, which zero the gpmc_settings
>> so the caller doesn't proceed with random/invalid settings.
>>
>> Fixes: a758f50f10cf ("mtd: onenand: omap2: Configure driver from DT")
>> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
>> ---
>> v3: zero gpmc_settings
>> v2: add gpmc_read_settings_dt() stub
>> ---
>>   drivers/memory/omap-gpmc.c | 4 ++++
>>   1 file changed, 4 insertions(+)
>>
>> diff --git a/drivers/memory/omap-gpmc.c b/drivers/memory/omap-gpmc.c
>> index cd9e80748591..e026b4cd3612 100644
>> --- a/drivers/memory/omap-gpmc.c
>> +++ b/drivers/memory/omap-gpmc.c
>> @@ -2310,6 +2310,10 @@ static void gpmc_probe_dt_children(struct platform_device *pdev)
>>   	}
>>   }
>>   #else
>> +void gpmc_read_settings_dt(struct device_node *np, struct gpmc_settings *p)
>> +{
>> +	memset(p, 0, sizeof(struct gpmc_settings));
> 
> sizeof(*p) but if patch is otherwise ok (got review/ack) then I can fix
> it while applying.
> 
> If there is resend, please fix it as well.

With the sizeof(*p) change.

Acked-by: Roger Quadros <rogerq@ti.com>

cheers,
-roger
-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
