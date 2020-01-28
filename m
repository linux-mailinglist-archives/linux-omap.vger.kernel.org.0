Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 42F6914AD33
	for <lists+linux-omap@lfdr.de>; Tue, 28 Jan 2020 01:28:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726099AbgA1A2L (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 27 Jan 2020 19:28:11 -0500
Received: from fllv0016.ext.ti.com ([198.47.19.142]:56222 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725955AbgA1A2L (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 27 Jan 2020 19:28:11 -0500
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 00S0RJvu059947;
        Mon, 27 Jan 2020 18:27:19 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1580171239;
        bh=W1EB64W45tmk/zMPnKEvQZ3k2ekG2mBDdjgBaVTmooE=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=SKfoxij3czRX498JAimlSsNcBJ2eS7JtvSDxNfs9A0J+Uu0U8D9aLr8WU/r5imFnn
         I1j/F/CkTj/hTfSIITRpfJSQYfuk3Epr/3mq/1Kwmh61FQrOKMj0LfWBnLdvaf3s70
         Sk5uWeTQb6W9LKodHGBdeGPDQBgkWJ6bdZWKhWAE=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 00S0RJOt018928
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 27 Jan 2020 18:27:19 -0600
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Mon, 27
 Jan 2020 18:27:19 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Mon, 27 Jan 2020 18:27:19 -0600
Received: from [128.247.58.153] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 00S0RJUJ089082;
        Mon, 27 Jan 2020 18:27:19 -0600
Subject: Re: [PATCH v2] mfd: syscon: Use a unique name with regmap_config
To:     David Lechner <david@lechnology.com>,
        Lee Jones <lee.jones@linaro.org>
CC:     Arnd Bergmann <arnd@arndb.de>, Tony Lindgren <tony@atomide.com>,
        Roger Quadros <rogerq@ti.com>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-omap@vger.kernel.org>
References: <20200127231208.1443-1-s-anna@ti.com>
 <217993e5-5e1d-79a1-7684-c6bb964379f0@lechnology.com>
From:   Suman Anna <s-anna@ti.com>
Message-ID: <448eeb87-9945-8a93-9231-6e2a22aa8342@ti.com>
Date:   Mon, 27 Jan 2020 18:27:19 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <217993e5-5e1d-79a1-7684-c6bb964379f0@lechnology.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi David,

On 1/27/20 5:40 PM, David Lechner wrote:
> On 1/27/20 5:12 PM, Suman Anna wrote:
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
>> v2: Fix build warning reported by kbuild test bot
>> v1: https://patchwork.kernel.org/patch/11346363/
>>
>>   drivers/mfd/syscon.c | 4 +++-
>>   1 file changed, 3 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/mfd/syscon.c b/drivers/mfd/syscon.c
>> index e22197c832e8..f0815d8e6e95 100644
>> --- a/drivers/mfd/syscon.c
>> +++ b/drivers/mfd/syscon.c
>> @@ -101,12 +101,14 @@ static struct syscon *of_syscon_register(struct
>> device_node *np, bool check_clk)
>>           }
>>       }
>>   -    syscon_config.name = of_node_full_name(np);
>> +    syscon_config.name = kasprintf(GFP_KERNEL, "%pOFn@%llx", np,
>> +                       (u64)res.start);
> 
> Would it make sense to also include the node name along with the
> pointer address so that the name is still easily identifiable?

I haven't dropped the node name, it is still there, the pOFn part. I am
only replacing the DT unit-address with the bus address, I haven't
changed the name style either.

regards
Suman

> 
>>       syscon_config.reg_stride = reg_io_width;
>>       syscon_config.val_bits = reg_io_width * 8;
>>       syscon_config.max_register = resource_size(&res) - reg_io_width;
>>         regmap = regmap_init_mmio(NULL, base, &syscon_config);
>> +    kfree(syscon_config.name);
>>       if (IS_ERR(regmap)) {
>>           pr_err("regmap init failed\n");
>>           ret = PTR_ERR(regmap);
>>
> 

