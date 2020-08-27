Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 25480254FB9
	for <lists+linux-omap@lfdr.de>; Thu, 27 Aug 2020 22:06:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726307AbgH0UGb (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 27 Aug 2020 16:06:31 -0400
Received: from mail.kernel.org ([198.145.29.99]:54638 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726120AbgH0UGa (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 27 Aug 2020 16:06:30 -0400
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org [51.254.78.96])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id F19A220737;
        Thu, 27 Aug 2020 20:06:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1598558789;
        bh=4/XNRU5rKAtpaXdhI/CFjAMslEaB+vEKDey8nNOsVTQ=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=Okue3pjoa1k0VitmvfJa/ru6HzEhtAppffFkKj+MGoBZhxioOa7Ybk7t1e8cXONKE
         lD/uIXlH0VL6oXQhRJoQwqdpAM/e0XqnXVrTuOs1la3i1ZnNWiUCJ1CJyn5G7n5lPB
         NiAJ6S01t4j1E4vxyjDCL98261R7nmq+AhouY/p8=
Received: from disco-boy.misterjones.org ([51.254.78.96] helo=www.loen.fr)
        by disco-boy.misterjones.org with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.92)
        (envelope-from <maz@kernel.org>)
        id 1kBOAF-007F0X-2e; Thu, 27 Aug 2020 21:06:27 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
Date:   Thu, 27 Aug 2020 21:06:26 +0100
From:   Marc Zyngier <maz@kernel.org>
To:     Suman Anna <s-anna@ti.com>
Cc:     Lee Jones <lee.jones@linaro.org>, Arnd Bergmann <arnd@arndb.de>,
        Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>,
        David Lechner <david@lechnology.com>,
        Tony Lindgren <tony@atomide.com>, linux-kernel@vger.kernel.org,
        linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Roger Quadros <rogerq@ti.com>, kernel-team@android.com
Subject: Re: [RESEND PATCH v2] mfd: syscon: Use a unique name with
 regmap_config
In-Reply-To: <74bc1f9f-cc48-cec9-85f4-3376b66b40fc@ti.com>
References: <20200727211008.24225-1-s-anna@ti.com>
 <0c1feaf91b9d285c1bded488437705da@misterjones.org>
 <74bc1f9f-cc48-cec9-85f4-3376b66b40fc@ti.com>
User-Agent: Roundcube Webmail/1.4.8
Message-ID: <78b465b080772b6ba867e39a623c2310@kernel.org>
X-Sender: maz@kernel.org
X-SA-Exim-Connect-IP: 51.254.78.96
X-SA-Exim-Rcpt-To: s-anna@ti.com, lee.jones@linaro.org, arnd@arndb.de, grzegorz.jaszczyk@linaro.org, david@lechnology.com, tony@atomide.com, linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org, rogerq@ti.com, kernel-team@android.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Suman,

On 2020-08-27 19:28, Suman Anna wrote:
> Hi Marc,
> 
> On 8/27/20 9:46 AM, Marc Zyngier wrote:
>> Hi all,
>> 
>> On 2020-07-27 22:10, Suman Anna wrote:
>>> The DT node full name is currently being used in regmap_config
>>> which in turn is used to create the regmap debugfs directories.
>>> This name however is not guaranteed to be unique and the regmap
>>> debugfs registration can fail in the cases where the syscon nodes
>>> have the same unit-address but are present in different DT node
>>> hierarchies. Replace this logic using the syscon reg resource
>>> address instead (inspired from logic used while creating platform
>>> devices) to ensure a unique name is given for each syscon.
>>> 
>>> Signed-off-by: Suman Anna <s-anna@ti.com>
>>> ---
>>> Hi Arnd,
>>> Lee is looking for your review on this patch. Can you please
>>> review and provide your comments.
>>> 
>>> This is a resend of the patch that was posted previously, rebased
>>> now onto latest kernel.
>>> 
>>> v2: https://patchwork.kernel.org/patch/11353355/
>>>  - Fix build warning reported by kbuild test bot
>>> v1: https://patchwork.kernel.org/patch/11346363/
>>> 
>>>  drivers/mfd/syscon.c | 4 +++-
>>>  1 file changed, 3 insertions(+), 1 deletion(-)
>>> 
>>> diff --git a/drivers/mfd/syscon.c b/drivers/mfd/syscon.c
>>> index 3a97816d0cba..75859e492984 100644
>>> --- a/drivers/mfd/syscon.c
>>> +++ b/drivers/mfd/syscon.c
>>> @@ -101,12 +101,14 @@ static struct syscon *of_syscon_register(struct
>>> device_node *np, bool check_clk)
>>>          }
>>>      }
>>> 
>>> -    syscon_config.name = of_node_full_name(np);
>>> +    syscon_config.name = kasprintf(GFP_KERNEL, "%pOFn@%llx", np,
>>> +                       (u64)res.start);
>>>      syscon_config.reg_stride = reg_io_width;
>>>      syscon_config.val_bits = reg_io_width * 8;
>>>      syscon_config.max_register = resource_size(&res) - reg_io_width;
>>> 
>>>      regmap = regmap_init_mmio(NULL, base, &syscon_config);
>>> +    kfree(syscon_config.name);
>>>      if (IS_ERR(regmap)) {
>>>          pr_err("regmap init failed\n");
>>>          ret = PTR_ERR(regmap);
>> 
>> This patch triggers some illegal memory accesses when debugfs is
>> enabled, as regmap does rely on config->name to be persistent
>> when the debugfs registration is deferred via 
>> regmap_debugfs_early_list
>> (__regmap_init() -> regmap_attach_dev() -> regmap_debugfs_init()...),
>> leading to a KASAN splat on demand.
>> 
> 
> Thanks, I missed the subtlety around the debugfs registration.
> 
>> I came up with the following patch that solves the issue for me.
>> 
>> Thanks,
>> 
>>         M.
>> 
>> From fd3f5f2bf72df53be18d13914fe349a34f81f16b Mon Sep 17 00:00:00 2001
>> From: Marc Zyngier <maz@kernel.org>
>> Date: Thu, 27 Aug 2020 14:45:34 +0100
>> Subject: [PATCH] mfd: syscon: Don't free allocated name for 
>> regmap_config
>> 
>> The name allocated for the regmap_config structure is freed
>> pretty early, right after the registration of the MMIO region.
>> 
>> Unfortunately, that doesn't follow the life cycle that debugfs
>> expects, as it can access the name field long after the free
>> has occured.
>> 
>> Move the free on the error path, and keep it forever otherwise.
> 
> Hmm, this is exactly what I was trying to avoid. The regmap_init does 
> duplicate
> the name into map->name if config->name is given, and the regmap 
> debugfs makes
> another copy of its own into debugfs_name when actually registered. If 
> the rules
> for regmap_init is that the config->name should be persistent, then I 
> guess we
> have no choice but to go with the below fix.
> 
> Does something like below help?
> 
> diff --git a/drivers/base/regmap/regmap.c 
> b/drivers/base/regmap/regmap.c
> index e93700af7e6e..96d8a0161c89 100644
> --- a/drivers/base/regmap/regmap.c
> +++ b/drivers/base/regmap/regmap.c
> @@ -1137,7 +1137,7 @@ struct regmap *__regmap_init(struct device *dev,
>                 if (ret != 0)
>                         goto err_regcache;
>         } else {
> -               regmap_debugfs_init(map, config->name);
> +               regmap_debugfs_init(map, map->name);
> 
> But there are couple of other places in regmap code that uses 
> config->name, but
> those won't be exercised with the syscon code.

Is config->name always the same as map->name? If so, why don't you just
pass map once and for all? Is the lifetime of map->name the same as
that of config->name?

My worry with this approach is that we start changing stuff in a rush,
and this would IMHO deserve a thorough investigation of whether this
change is actually safe.

I'd rather take the safe approach of either keeping the memory around
until we clearly understand what the implications are (and probably
this should involve the regmap maintainer), or to revert this patch
until we figure out the actual life cycle of the various names.

Thanks,

         M.
-- 
Jazz is not dead. It just smells funny...
