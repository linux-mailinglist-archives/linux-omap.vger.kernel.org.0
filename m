Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4532525C42F
	for <lists+linux-omap@lfdr.de>; Thu,  3 Sep 2020 17:05:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728962AbgICPEg (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 3 Sep 2020 11:04:36 -0400
Received: from lelv0143.ext.ti.com ([198.47.23.248]:33950 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729002AbgICN6Q (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 3 Sep 2020 09:58:16 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 083DPoom115466;
        Thu, 3 Sep 2020 08:25:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1599139550;
        bh=AdVba5dvU+UA3YkUl7bYkqrAbMHpmT7cr+MbTs7OoEE=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=QP5b21vAK8yefGssR4I1g643HnK8rfcwR66tWhgRIgOYOEg4vOa0Na6zUNlSxHCcw
         guwGq2XRRUU75JKwjv9G1cR4KU+3QOjbw7AWfAVXoct65kUS4nxgWz0AaTGARjnvBg
         DWQ2PsSQUDgDd2ozfPEbT0mx8MyL2BB1hAK1j99I=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 083DPnRb070019
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 3 Sep 2020 08:25:50 -0500
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Thu, 3 Sep
 2020 08:25:48 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Thu, 3 Sep 2020 08:25:48 -0500
Received: from [10.250.71.39] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 083DPlPj007255;
        Thu, 3 Sep 2020 08:25:47 -0500
Subject: Re: [RESEND PATCH v2] mfd: syscon: Use a unique name with
 regmap_config
To:     Marc Zyngier <maz@kernel.org>
CC:     Mark Brown <broonie@kernel.org>, Lee Jones <lee.jones@linaro.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>,
        David Lechner <david@lechnology.com>,
        Tony Lindgren <tony@atomide.com>,
        <linux-kernel@vger.kernel.org>, <linux-omap@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        Roger Quadros <rogerq@ti.com>, <kernel-team@android.com>
References: <20200727211008.24225-1-s-anna@ti.com>
 <0c1feaf91b9d285c1bded488437705da@misterjones.org>
 <74bc1f9f-cc48-cec9-85f4-3376b66b40fc@ti.com>
 <78b465b080772b6ba867e39a623c2310@kernel.org>
 <ef1931eb-5677-d92c-732d-b67b5263425d@ti.com>
 <0d43f357983711fcffce7023ad115d13@kernel.org>
From:   Suman Anna <s-anna@ti.com>
Message-ID: <b378af0d-19a8-3d1b-5ca3-54ebccd77c9b@ti.com>
Date:   Thu, 3 Sep 2020 08:25:47 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <0d43f357983711fcffce7023ad115d13@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 9/3/20 3:26 AM, Marc Zyngier wrote:
> On 2020-08-27 21:32, Suman Anna wrote:
>> Hi Marc,
>>
>> + Mark Brown
>>
>> On 8/27/20 3:06 PM, Marc Zyngier wrote:
>>> Hi Suman,
>>>
>>> On 2020-08-27 19:28, Suman Anna wrote:
>>>> Hi Marc,
>>>>
>>>> On 8/27/20 9:46 AM, Marc Zyngier wrote:
> 
> [...]
> 
>>>>> This patch triggers some illegal memory accesses when debugfs is
>>>>> enabled, as regmap does rely on config->name to be persistent
>>>>> when the debugfs registration is deferred via regmap_debugfs_early_list
>>>>> (__regmap_init() -> regmap_attach_dev() -> regmap_debugfs_init()...),
>>>>> leading to a KASAN splat on demand.
>>>>>
>>>>
>>>> Thanks, I missed the subtlety around the debugfs registration.
>>>>
>>>>> I came up with the following patch that solves the issue for me.
>>>>>
>>>>> Thanks,
>>>>>
>>>>>         M.
>>>>>
>>>>> From fd3f5f2bf72df53be18d13914fe349a34f81f16b Mon Sep 17 00:00:00 2001
>>>>> From: Marc Zyngier <maz@kernel.org>
>>>>> Date: Thu, 27 Aug 2020 14:45:34 +0100
>>>>> Subject: [PATCH] mfd: syscon: Don't free allocated name for regmap_config
>>>>>
>>>>> The name allocated for the regmap_config structure is freed
>>>>> pretty early, right after the registration of the MMIO region.
>>>>>
>>>>> Unfortunately, that doesn't follow the life cycle that debugfs
>>>>> expects, as it can access the name field long after the free
>>>>> has occured.
>>>>>
>>>>> Move the free on the error path, and keep it forever otherwise.
>>>>
>>>> Hmm, this is exactly what I was trying to avoid. The regmap_init does duplicate
>>>> the name into map->name if config->name is given, and the regmap debugfs makes
>>>> another copy of its own into debugfs_name when actually registered. If the
>>>> rules
>>>> for regmap_init is that the config->name should be persistent, then I guess we
>>>> have no choice but to go with the below fix.
>>>>
>>>> Does something like below help?
>>>>
>>>> diff --git a/drivers/base/regmap/regmap.c b/drivers/base/regmap/regmap.c
>>>> index e93700af7e6e..96d8a0161c89 100644
>>>> --- a/drivers/base/regmap/regmap.c
>>>> +++ b/drivers/base/regmap/regmap.c
>>>> @@ -1137,7 +1137,7 @@ struct regmap *__regmap_init(struct device *dev,
>>>>                 if (ret != 0)
>>>>                         goto err_regcache;
>>>>         } else {
>>>> -               regmap_debugfs_init(map, config->name);
>>>> +               regmap_debugfs_init(map, map->name);
>>>>
>>>> But there are couple of other places in regmap code that uses config->name, but
>>>> those won't be exercised with the syscon code.
>>>
>>> Is config->name always the same as map->name? If so, why don't you just
>>> pass map once and for all? Is the lifetime of map->name the same as
>>> that of config->name?
>>
>> map->name is created (kstrdup_const) from config->name if not NULL, so above
>> replacement should be exactly equivalent, map is filled in _regmap_init. But it
>> does make the regmap_debugfs_init callsites in the file look dissimilar.
>>
>>>
>>> My worry with this approach is that we start changing stuff in a rush,
>>> and this would IMHO deserve a thorough investigation of whether this
>>> change is actually safe.
>>>
>>> I'd rather take the safe approach of either keeping the memory around
>>> until we clearly understand what the implications are (and probably
>>> this should involve the regmap maintainer), or to revert this patch
>>> until we figure out the actual life cycle of the various names.
>>
>> Yeah, agreed. Let's see what Mark suggests.
>>
>> Mark,
>> Can you clarify the lifecycle expectations on the config->name and do you have
>> any suggestions here?
> 
> Have we reached a conclusion here? Can we get a fix in mainline?

Marc, we can go with your patch based on Mark's response.

regards
Suman
