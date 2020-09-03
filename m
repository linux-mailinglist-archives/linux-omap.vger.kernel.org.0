Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 79BE825BD21
	for <lists+linux-omap@lfdr.de>; Thu,  3 Sep 2020 10:26:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726025AbgICI0I (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 3 Sep 2020 04:26:08 -0400
Received: from mail.kernel.org ([198.145.29.99]:59260 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725984AbgICI0H (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 3 Sep 2020 04:26:07 -0400
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org [51.254.78.96])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id AA5B420767;
        Thu,  3 Sep 2020 08:26:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1599121566;
        bh=GvZkOC+BPPTL+XcUgMkplQGWuZ8I+5+/ZHbskGgUnBU=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=mhwDCr0SNhzZErsLcrf769vbGcVDe+PUxzIm7TCOPMRcnDUJSlGYz42VVtRVjKj76
         rDZ5KlhHsCfkPWWbyNO4Qz0Y3PPT+iTlqZpyy+HlkJOj95jTk7o7lfkVg6C3A0jA0S
         1aAo5Vlgznh2dUyTbR0uuWUZR2O6S/SJE3ur6NvM=
Received: from disco-boy.misterjones.org ([51.254.78.96] helo=www.loen.fr)
        by disco-boy.misterjones.org with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.92)
        (envelope-from <maz@kernel.org>)
        id 1kDkZJ-008puc-1G; Thu, 03 Sep 2020 09:26:05 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
Date:   Thu, 03 Sep 2020 09:26:04 +0100
From:   Marc Zyngier <maz@kernel.org>
To:     Suman Anna <s-anna@ti.com>
Cc:     Mark Brown <broonie@kernel.org>, Lee Jones <lee.jones@linaro.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>,
        David Lechner <david@lechnology.com>,
        Tony Lindgren <tony@atomide.com>, linux-kernel@vger.kernel.org,
        linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Roger Quadros <rogerq@ti.com>, kernel-team@android.com
Subject: Re: [RESEND PATCH v2] mfd: syscon: Use a unique name with
 regmap_config
In-Reply-To: <ef1931eb-5677-d92c-732d-b67b5263425d@ti.com>
References: <20200727211008.24225-1-s-anna@ti.com>
 <0c1feaf91b9d285c1bded488437705da@misterjones.org>
 <74bc1f9f-cc48-cec9-85f4-3376b66b40fc@ti.com>
 <78b465b080772b6ba867e39a623c2310@kernel.org>
 <ef1931eb-5677-d92c-732d-b67b5263425d@ti.com>
User-Agent: Roundcube Webmail/1.4.8
Message-ID: <0d43f357983711fcffce7023ad115d13@kernel.org>
X-Sender: maz@kernel.org
X-SA-Exim-Connect-IP: 51.254.78.96
X-SA-Exim-Rcpt-To: s-anna@ti.com, broonie@kernel.org, lee.jones@linaro.org, arnd@arndb.de, grzegorz.jaszczyk@linaro.org, david@lechnology.com, tony@atomide.com, linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org, rogerq@ti.com, kernel-team@android.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 2020-08-27 21:32, Suman Anna wrote:
> Hi Marc,
> 
> + Mark Brown
> 
> On 8/27/20 3:06 PM, Marc Zyngier wrote:
>> Hi Suman,
>> 
>> On 2020-08-27 19:28, Suman Anna wrote:
>>> Hi Marc,
>>> 
>>> On 8/27/20 9:46 AM, Marc Zyngier wrote:

[...]

>>>> This patch triggers some illegal memory accesses when debugfs is
>>>> enabled, as regmap does rely on config->name to be persistent
>>>> when the debugfs registration is deferred via 
>>>> regmap_debugfs_early_list
>>>> (__regmap_init() -> regmap_attach_dev() -> 
>>>> regmap_debugfs_init()...),
>>>> leading to a KASAN splat on demand.
>>>> 
>>> 
>>> Thanks, I missed the subtlety around the debugfs registration.
>>> 
>>>> I came up with the following patch that solves the issue for me.
>>>> 
>>>> Thanks,
>>>> 
>>>>         M.
>>>> 
>>>> From fd3f5f2bf72df53be18d13914fe349a34f81f16b Mon Sep 17 00:00:00 
>>>> 2001
>>>> From: Marc Zyngier <maz@kernel.org>
>>>> Date: Thu, 27 Aug 2020 14:45:34 +0100
>>>> Subject: [PATCH] mfd: syscon: Don't free allocated name for 
>>>> regmap_config
>>>> 
>>>> The name allocated for the regmap_config structure is freed
>>>> pretty early, right after the registration of the MMIO region.
>>>> 
>>>> Unfortunately, that doesn't follow the life cycle that debugfs
>>>> expects, as it can access the name field long after the free
>>>> has occured.
>>>> 
>>>> Move the free on the error path, and keep it forever otherwise.
>>> 
>>> Hmm, this is exactly what I was trying to avoid. The regmap_init does 
>>> duplicate
>>> the name into map->name if config->name is given, and the regmap 
>>> debugfs makes
>>> another copy of its own into debugfs_name when actually registered. 
>>> If the rules
>>> for regmap_init is that the config->name should be persistent, then I 
>>> guess we
>>> have no choice but to go with the below fix.
>>> 
>>> Does something like below help?
>>> 
>>> diff --git a/drivers/base/regmap/regmap.c 
>>> b/drivers/base/regmap/regmap.c
>>> index e93700af7e6e..96d8a0161c89 100644
>>> --- a/drivers/base/regmap/regmap.c
>>> +++ b/drivers/base/regmap/regmap.c
>>> @@ -1137,7 +1137,7 @@ struct regmap *__regmap_init(struct device 
>>> *dev,
>>>                 if (ret != 0)
>>>                         goto err_regcache;
>>>         } else {
>>> -               regmap_debugfs_init(map, config->name);
>>> +               regmap_debugfs_init(map, map->name);
>>> 
>>> But there are couple of other places in regmap code that uses 
>>> config->name, but
>>> those won't be exercised with the syscon code.
>> 
>> Is config->name always the same as map->name? If so, why don't you 
>> just
>> pass map once and for all? Is the lifetime of map->name the same as
>> that of config->name?
> 
> map->name is created (kstrdup_const) from config->name if not NULL, so 
> above
> replacement should be exactly equivalent, map is filled in 
> _regmap_init. But it
> does make the regmap_debugfs_init callsites in the file look 
> dissimilar.
> 
>> 
>> My worry with this approach is that we start changing stuff in a rush,
>> and this would IMHO deserve a thorough investigation of whether this
>> change is actually safe.
>> 
>> I'd rather take the safe approach of either keeping the memory around
>> until we clearly understand what the implications are (and probably
>> this should involve the regmap maintainer), or to revert this patch
>> until we figure out the actual life cycle of the various names.
> 
> Yeah, agreed. Let's see what Mark suggests.
> 
> Mark,
> Can you clarify the lifecycle expectations on the config->name and do 
> you have
> any suggestions here?

Have we reached a conclusion here? Can we get a fix in mainline?

Thanks,

         M.
-- 
Jazz is not dead. It just smells funny...
