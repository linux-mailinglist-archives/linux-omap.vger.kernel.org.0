Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3DA3F96759
	for <lists+linux-omap@lfdr.de>; Tue, 20 Aug 2019 19:24:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728554AbfHTRYF (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 20 Aug 2019 13:24:05 -0400
Received: from lelv0143.ext.ti.com ([198.47.23.248]:43428 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727006AbfHTRYF (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 20 Aug 2019 13:24:05 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x7KHNwPl037361;
        Tue, 20 Aug 2019 12:23:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1566321839;
        bh=3coPamp12U7rOrX0gGA1OOmWrMsb4FMbc1a7GqoR5iE=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=P8CNwPEiQWKjL/gi/Aj422xAUWGW+SQMQHjVg7N+wGNwmzkoOaVM863qC8UcvVFg1
         NWJRkXQOf+TseRQjGZ6Zd9+ZgLGASBBESnmb3/vK9ayyRvsXifBlUG0dX3+drZ4o8z
         Y9Ov7CixACl8H6DcHWF5R7uLZL5cYWoebJFBL/zM=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x7KHNwrl061587
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 20 Aug 2019 12:23:58 -0500
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Tue, 20
 Aug 2019 12:23:58 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Tue, 20 Aug 2019 12:23:58 -0500
Received: from [128.247.58.153] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x7KHNwgv020020;
        Tue, 20 Aug 2019 12:23:58 -0500
Subject: Re: [PATCH 5/8] soc: ti: omap-prm: add omap4 PRM data
To:     Tero Kristo <t-kristo@ti.com>, <ssantosh@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-omap@vger.kernel.org>, <robh+dt@kernel.org>
CC:     <tony@atomide.com>, <devicetree@vger.kernel.org>
References: <1565164139-21886-1-git-send-email-t-kristo@ti.com>
 <1565164139-21886-6-git-send-email-t-kristo@ti.com>
 <04bc6773-dbd4-e1ab-ce31-d93e99dafb33@ti.com>
 <9d684bdc-28b8-0772-2957-93e01c55aae4@ti.com>
From:   Suman Anna <s-anna@ti.com>
Message-ID: <ed0ec707-ddea-cbfa-ecdf-99faeb770f3f@ti.com>
Date:   Tue, 20 Aug 2019 12:23:58 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <9d684bdc-28b8-0772-2957-93e01c55aae4@ti.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 8/20/19 2:52 AM, Tero Kristo wrote:
> On 20.8.2019 2.08, Suman Anna wrote:
>> On 8/7/19 2:48 AM, Tero Kristo wrote:
>>> Add PRM data for omap4 family of SoCs.
>>>
>>> Signed-off-by: Tero Kristo <t-kristo@ti.com>
>>> ---
>>>   drivers/soc/ti/omap_prm.c | 20 ++++++++++++++++++++
>>>   1 file changed, 20 insertions(+)
>>>
>>> diff --git a/drivers/soc/ti/omap_prm.c b/drivers/soc/ti/omap_prm.c
>>> index 870515e3..9b8d5945 100644
>>> --- a/drivers/soc/ti/omap_prm.c
>>> +++ b/drivers/soc/ti/omap_prm.c
>>> @@ -54,7 +54,27 @@ struct omap_reset_data {
>>>     #define OMAP_PRM_NO_RSTST    BIT(0)
>>>   +struct omap_prm_data omap4_prm_data[] = {
>>
>> static const
> 
> Will fix this and rest of the similar comments.
> 
> -Tero
> 
>>
>> regards
>> Suman
>>
>>> +    { .name = "mpu", .base = 0x4a306300, .pwstst = 0x4 },
>>> +    { .name = "tesla", .base = 0x4a306400, .pwstst = 0x4, .rstctl =
>>> 0x10, .rstst = 0x14 },
>>> +    { .name = "abe", .base = 0x4a306500, .pwstst = 0x4 },
>>> +    { .name = "always_on_core", .base = 0x4a306600, .pwstst = 0x4 },
>>> +    { .name = "core", .base = 0x4a306700, .pwstst = 0x4, .rstctl =
>>> 0x210, .rstst = 0x214 },
>>> +    { .name = "ivahd", .base = 0x4a306f00, .pwstst = 0x4, .rstctl =
>>> 0x10, .rstst = 0x14 },
>>> +    { .name = "cam", .base = 0x4a307000, .pwstst = 0x4 },
>>> +    { .name = "dss", .base = 0x4a307100, .pwstst = 0x4 },
>>> +    { .name = "gfx", .base = 0x4a307200, .pwstst = 0x4 },
>>> +    { .name = "l3init", .base = 0x4a307300, .pwstst = 0x4 },
>>> +    { .name = "l4per", .base = 0x4a307400, .pwstst = 0x4 },
>>> +    { .name = "cefuse", .base = 0x4a307600, .pwstst = 0x4 },
>>> +    { .name = "wkup", .base = 0x4a307700, .pwstst = 0x4 },
>>> +    { .name = "emu", .base = 0x4a307900, .pwstst = 0x4 },
>>> +    { .name = "device", .base = 0x4a307b00, .rstctl = 0x0, .rstst =
>>> 0x4 },

So, looks like you are using pwstctrl as 0 by default, but some of them
will neither have pwstctrl or pwstst like "device" PRM here. Is the plan
to use -1 for the fields, or a flags field?

regards
Suman

>>> +    { },
>>> +};
>>> +
>>>   static const struct of_device_id omap_prm_id_table[] = {
>>> +    { .compatible = "ti,omap4-prm-inst", .data = omap4_prm_data },
>>>       { },
>>>   };
>>>  
>>
> 
> -- 
> Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
> Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

