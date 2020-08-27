Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 57CB025500D
	for <lists+linux-omap@lfdr.de>; Thu, 27 Aug 2020 22:33:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726322AbgH0UdF (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 27 Aug 2020 16:33:05 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:49568 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726120AbgH0UdE (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 27 Aug 2020 16:33:04 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 07RKW898076324;
        Thu, 27 Aug 2020 15:32:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1598560328;
        bh=aYp1+3+GIhxsev2f1k2D7ETcN46E5m3qO75FVMnA180=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=RWeorijvGe6nawyg39RIAjSMoLml/oNcTmDHjCMtBE3mWY4mgcypA7J3qCEmonjNB
         gewW5pvg1thGKxlk5TRpiwYVjtPehdnuZuAKXx9m1XDRT0oMgATYYmV+nI/IlepRYG
         8uqygl/ETJpwFZ6jpASwmIqoo4A/pncbK+aTK0+8=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 07RKW8Wl064212
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 27 Aug 2020 15:32:08 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Thu, 27
 Aug 2020 15:32:07 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Thu, 27 Aug 2020 15:32:07 -0500
Received: from [10.250.69.147] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 07RKW5WY114954;
        Thu, 27 Aug 2020 15:32:06 -0500
Subject: Re: [RESEND PATCH v2] mfd: syscon: Use a unique name with
 regmap_config
To:     Marc Zyngier <maz@kernel.org>, Mark Brown <broonie@kernel.org>
CC:     Lee Jones <lee.jones@linaro.org>, Arnd Bergmann <arnd@arndb.de>,
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
From:   Suman Anna <s-anna@ti.com>
Message-ID: <ef1931eb-5677-d92c-732d-b67b5263425d@ti.com>
Date:   Thu, 27 Aug 2020 15:32:05 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <78b465b080772b6ba867e39a623c2310@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Marc,

+ Mark Brown

On 8/27/20 3:06 PM, Marc Zyngier wrote:
> Hi Suman,
> 
> On 2020-08-27 19:28, Suman Anna wrote:
>> Hi Marc,
>>
>> On 8/27/20 9:46 AM, Marc Zyngier wrote:
>>> Hi all,
>>>
>>> On 2020-07-27 22:10, Suman Anna wrote:
>>>> The DT node full name is currently being used in regmap_config
>>>> which in turn is used to create the regmap debugfs directories.
>>>> This name however is not guaranteed to be unique and the regmap
>>>> debugfs registration can fail in the cases where the syscon nodes
>>>> have the same unit-address but are present in different DT node
>>>> hierarchies. Replace this logic using the syscon reg resource
>>>> address instead (inspired from logic used while creating platform
>>>> devices) to ensure a unique name is given for each syscon.
>>>>
>>>> Signed-off-by: Suman Anna <s-anna@ti.com>
>>>> ---
>>>> Hi Arnd,
>>>> Lee is looking for your review on this patch. Can you please
>>>> review and provide your comments.
>>>>
>>>> This is a resend of the patch that was posted previously, rebased
>>>> now onto latest kernel.
>>>>
>>>> v2: https://patchwork.kernel.org/patch/11353355/
>>>>  - Fix build warning reported by kbuild test bot
>>>> v1: https://patchwork.kernel.org/patch/11346363/
>>>>
>>>>  drivers/mfd/syscon.c | 4 +++-
>>>>  1 file changed, 3 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/drivers/mfd/syscon.c b/drivers/mfd/syscon.c
>>>> index 3a97816d0cba..75859e492984 100644
>>>> --- a/drivers/mfd/syscon.c
>>>> +++ b/drivers/mfd/syscon.c
>>>> @@ -101,12 +101,14 @@ static struct syscon *of_syscon_register(struct
>>>> device_node *np, bool check_clk)
>>>>          }
>>>>      }
>>>>
>>>> -    syscon_config.name = of_node_full_name(np);
>>>> +    syscon_config.name = kasprintf(GFP_KERNEL, "%pOFn@%llx", np,
>>>> +                       (u64)res.start);
>>>>      syscon_config.reg_stride = reg_io_width;
>>>>      syscon_config.val_bits = reg_io_width * 8;
>>>>      syscon_config.max_register = resource_size(&res) - reg_io_width;
>>>>
>>>>      regmap = regmap_init_mmio(NULL, base, &syscon_config);
>>>> +    kfree(syscon_config.name);
>>>>      if (IS_ERR(regmap)) {
>>>>          pr_err("regmap init failed\n");
>>>>          ret = PTR_ERR(regmap);
>>>
>>> This patch triggers some illegal memory accesses when debugfs is
>>> enabled, as regmap does rely on config->name to be persistent
>>> when the debugfs registration is deferred via regmap_debugfs_early_list
>>> (__regmap_init() -> regmap_attach_dev() -> regmap_debugfs_init()...),
>>> leading to a KASAN splat on demand.
>>>
>>
>> Thanks, I missed the subtlety around the debugfs registration.
>>
>>> I came up with the following patch that solves the issue for me.
>>>
>>> Thanks,
>>>
>>>         M.
>>>
>>> From fd3f5f2bf72df53be18d13914fe349a34f81f16b Mon Sep 17 00:00:00 2001
>>> From: Marc Zyngier <maz@kernel.org>
>>> Date: Thu, 27 Aug 2020 14:45:34 +0100
>>> Subject: [PATCH] mfd: syscon: Don't free allocated name for regmap_config
>>>
>>> The name allocated for the regmap_config structure is freed
>>> pretty early, right after the registration of the MMIO region.
>>>
>>> Unfortunately, that doesn't follow the life cycle that debugfs
>>> expects, as it can access the name field long after the free
>>> has occured.
>>>
>>> Move the free on the error path, and keep it forever otherwise.
>>
>> Hmm, this is exactly what I was trying to avoid. The regmap_init does duplicate
>> the name into map->name if config->name is given, and the regmap debugfs makes
>> another copy of its own into debugfs_name when actually registered. If the rules
>> for regmap_init is that the config->name should be persistent, then I guess we
>> have no choice but to go with the below fix.
>>
>> Does something like below help?
>>
>> diff --git a/drivers/base/regmap/regmap.c b/drivers/base/regmap/regmap.c
>> index e93700af7e6e..96d8a0161c89 100644
>> --- a/drivers/base/regmap/regmap.c
>> +++ b/drivers/base/regmap/regmap.c
>> @@ -1137,7 +1137,7 @@ struct regmap *__regmap_init(struct device *dev,
>>                 if (ret != 0)
>>                         goto err_regcache;
>>         } else {
>> -               regmap_debugfs_init(map, config->name);
>> +               regmap_debugfs_init(map, map->name);
>>
>> But there are couple of other places in regmap code that uses config->name, but
>> those won't be exercised with the syscon code.
> 
> Is config->name always the same as map->name? If so, why don't you just
> pass map once and for all? Is the lifetime of map->name the same as
> that of config->name?

map->name is created (kstrdup_const) from config->name if not NULL, so above
replacement should be exactly equivalent, map is filled in _regmap_init. But it
does make the regmap_debugfs_init callsites in the file look dissimilar.

> 
> My worry with this approach is that we start changing stuff in a rush,
> and this would IMHO deserve a thorough investigation of whether this
> change is actually safe.
> 
> I'd rather take the safe approach of either keeping the memory around
> until we clearly understand what the implications are (and probably
> this should involve the regmap maintainer), or to revert this patch
> until we figure out the actual life cycle of the various names.

Yeah, agreed. Let's see what Mark suggests.

Mark,
Can you clarify the lifecycle expectations on the config->name and do you have
any suggestions here?

regards
Suman
