Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 761CE254D11
	for <lists+linux-omap@lfdr.de>; Thu, 27 Aug 2020 20:29:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726234AbgH0S3V (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 27 Aug 2020 14:29:21 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:34146 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726120AbgH0S3S (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 27 Aug 2020 14:29:18 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 07RISNAL042936;
        Thu, 27 Aug 2020 13:28:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1598552903;
        bh=CYfrfqchJ0r8G0FVf8s1w6i5+0bkf7U47DWkf0YLlpY=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=TfE7kX5VaR8jwPQ/8Jm61wV4C7Pcb3YhF/K7lnah7bJN99DtUtGBsWQD/7uCqlOBF
         cNYayzjo1OxmWSGlfHTHKGJIlV0rRk5W0RnSeKj0KF8KXC/AVrvjuEVFCyqbOxC1Xn
         P0bxORDWBCxi2ab3CtHJqpYH7ceODu1Sq3JdhAgY=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 07RISNEu082634;
        Thu, 27 Aug 2020 13:28:23 -0500
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Thu, 27
 Aug 2020 13:28:23 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Thu, 27 Aug 2020 13:28:23 -0500
Received: from [10.250.69.147] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 07RISL33019552;
        Thu, 27 Aug 2020 13:28:22 -0500
Subject: Re: [RESEND PATCH v2] mfd: syscon: Use a unique name with
 regmap_config
To:     Marc Zyngier <maz@kernel.org>
CC:     Lee Jones <lee.jones@linaro.org>, Arnd Bergmann <arnd@arndb.de>,
        Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>,
        David Lechner <david@lechnology.com>,
        Tony Lindgren <tony@atomide.com>,
        <linux-kernel@vger.kernel.org>, <linux-omap@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        Roger Quadros <rogerq@ti.com>, <kernel-team@android.com>
References: <20200727211008.24225-1-s-anna@ti.com>
 <0c1feaf91b9d285c1bded488437705da@misterjones.org>
From:   Suman Anna <s-anna@ti.com>
Message-ID: <74bc1f9f-cc48-cec9-85f4-3376b66b40fc@ti.com>
Date:   Thu, 27 Aug 2020 13:28:21 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <0c1feaf91b9d285c1bded488437705da@misterjones.org>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Marc,

On 8/27/20 9:46 AM, Marc Zyngier wrote:
> Hi all,
> 
> On 2020-07-27 22:10, Suman Anna wrote:
>> The DT node full name is currently being used in regmap_config
>> which in turn is used to create the regmap debugfs directories.
>> This name however is not guaranteed to be unique and the regmap
>> debugfs registration can fail in the cases where the syscon nodes
>> have the same unit-address but are present in different DT node
>> hierarchies. Replace this logic using the syscon reg resource
>> address instead (inspired from logic used while creating platform
>> devices) to ensure a unique name is given for each syscon.
>>
>> Signed-off-by: Suman Anna <s-anna@ti.com>
>> ---
>> Hi Arnd,
>> Lee is looking for your review on this patch. Can you please
>> review and provide your comments.
>>
>> This is a resend of the patch that was posted previously, rebased
>> now onto latest kernel.
>>
>> v2: https://patchwork.kernel.org/patch/11353355/
>>  - Fix build warning reported by kbuild test bot
>> v1: https://patchwork.kernel.org/patch/11346363/
>>
>>  drivers/mfd/syscon.c | 4 +++-
>>  1 file changed, 3 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/mfd/syscon.c b/drivers/mfd/syscon.c
>> index 3a97816d0cba..75859e492984 100644
>> --- a/drivers/mfd/syscon.c
>> +++ b/drivers/mfd/syscon.c
>> @@ -101,12 +101,14 @@ static struct syscon *of_syscon_register(struct
>> device_node *np, bool check_clk)
>>          }
>>      }
>>
>> -    syscon_config.name = of_node_full_name(np);
>> +    syscon_config.name = kasprintf(GFP_KERNEL, "%pOFn@%llx", np,
>> +                       (u64)res.start);
>>      syscon_config.reg_stride = reg_io_width;
>>      syscon_config.val_bits = reg_io_width * 8;
>>      syscon_config.max_register = resource_size(&res) - reg_io_width;
>>
>>      regmap = regmap_init_mmio(NULL, base, &syscon_config);
>> +    kfree(syscon_config.name);
>>      if (IS_ERR(regmap)) {
>>          pr_err("regmap init failed\n");
>>          ret = PTR_ERR(regmap);
> 
> This patch triggers some illegal memory accesses when debugfs is
> enabled, as regmap does rely on config->name to be persistent
> when the debugfs registration is deferred via regmap_debugfs_early_list
> (__regmap_init() -> regmap_attach_dev() -> regmap_debugfs_init()...),
> leading to a KASAN splat on demand.
> 

Thanks, I missed the subtlety around the debugfs registration.

> I came up with the following patch that solves the issue for me.
> 
> Thanks,
> 
>         M.
> 
> From fd3f5f2bf72df53be18d13914fe349a34f81f16b Mon Sep 17 00:00:00 2001
> From: Marc Zyngier <maz@kernel.org>
> Date: Thu, 27 Aug 2020 14:45:34 +0100
> Subject: [PATCH] mfd: syscon: Don't free allocated name for regmap_config
> 
> The name allocated for the regmap_config structure is freed
> pretty early, right after the registration of the MMIO region.
> 
> Unfortunately, that doesn't follow the life cycle that debugfs
> expects, as it can access the name field long after the free
> has occured.
> 
> Move the free on the error path, and keep it forever otherwise.

Hmm, this is exactly what I was trying to avoid. The regmap_init does duplicate
the name into map->name if config->name is given, and the regmap debugfs makes
another copy of its own into debugfs_name when actually registered. If the rules
for regmap_init is that the config->name should be persistent, then I guess we
have no choice but to go with the below fix.

Does something like below help?

diff --git a/drivers/base/regmap/regmap.c b/drivers/base/regmap/regmap.c
index e93700af7e6e..96d8a0161c89 100644
--- a/drivers/base/regmap/regmap.c
+++ b/drivers/base/regmap/regmap.c
@@ -1137,7 +1137,7 @@ struct regmap *__regmap_init(struct device *dev,
                if (ret != 0)
                        goto err_regcache;
        } else {
-               regmap_debugfs_init(map, config->name);
+               regmap_debugfs_init(map, map->name);

But there are couple of other places in regmap code that uses config->name, but
those won't be exercised with the syscon code.

regards
Suman

> 
> Fixes: e15d7f2b81d2 ("mfd: syscon: Use a unique name with regmap_config")
> Signed-off-by: Marc Zyngier <maz@kernel.org>
> ---
>  drivers/mfd/syscon.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/mfd/syscon.c b/drivers/mfd/syscon.c
> index 75859e492984..7a660411c562 100644
> --- a/drivers/mfd/syscon.c
> +++ b/drivers/mfd/syscon.c
> @@ -108,7 +108,6 @@ static struct syscon *of_syscon_register(struct device_node
> *np, bool check_clk)
>      syscon_config.max_register = resource_size(&res) - reg_io_width;
> 
>      regmap = regmap_init_mmio(NULL, base, &syscon_config);
> -    kfree(syscon_config.name);
>      if (IS_ERR(regmap)) {
>          pr_err("regmap init failed\n");
>          ret = PTR_ERR(regmap);
> @@ -145,6 +144,7 @@ static struct syscon *of_syscon_register(struct device_node
> *np, bool check_clk)
>      regmap_exit(regmap);
>  err_regmap:
>      iounmap(base);
> +    kfree(syscon_config.name);
>  err_map:
>      kfree(syscon);
>      return ERR_PTR(ret);

