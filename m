Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 591DD230DF3
	for <lists+linux-omap@lfdr.de>; Tue, 28 Jul 2020 17:35:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730898AbgG1PfH (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 28 Jul 2020 11:35:07 -0400
Received: from lelv0143.ext.ti.com ([198.47.23.248]:55120 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730701AbgG1PfG (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 28 Jul 2020 11:35:06 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 06SFYGl8078735;
        Tue, 28 Jul 2020 10:34:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1595950456;
        bh=Y3bdMy0j6b+YSB/57qC4aT+9PUXNDrMIyX5k/Gdanh8=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=e0cYw271xm0WRqWGklcW02kIWJhdHY3bU5qTLX7OFrf6eOyTH+mM19LVILV7SHm0t
         Aj9P5gMz4nzyMF+kSPl+S0rAemWwNhdR0RF2el7mJUYxQLr9STVyvm/ISZf90vtey0
         U6PtHR/PCDo0PIQJd0LlfeS3GFKasATjNye8V4rQ=
Received: from DLEE111.ent.ti.com (dlee111.ent.ti.com [157.170.170.22])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 06SFYGYX015577;
        Tue, 28 Jul 2020 10:34:16 -0500
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 28
 Jul 2020 10:34:16 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 28 Jul 2020 10:34:16 -0500
Received: from [10.250.34.248] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 06SFYFBW097281;
        Tue, 28 Jul 2020 10:34:15 -0500
Subject: Re: [RESEND PATCH v2] mfd: syscon: Use a unique name with
 regmap_config
To:     Arnd Bergmann <arnd@arndb.de>
CC:     Lee Jones <lee.jones@linaro.org>,
        Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>,
        David Lechner <david@lechnology.com>,
        Tony Lindgren <tony@atomide.com>,
        Roger Quadros <rogerq@ti.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-omap <linux-omap@vger.kernel.org>
References: <20200727211008.24225-1-s-anna@ti.com>
 <CAK8P3a3_qu_rwWmxMz=H5DLSoZB3Jngjxqq14vir+NudfavmMg@mail.gmail.com>
From:   Suman Anna <s-anna@ti.com>
Message-ID: <2dc0dd51-2ded-996c-3b93-ad463b52582d@ti.com>
Date:   Tue, 28 Jul 2020 10:34:15 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAK8P3a3_qu_rwWmxMz=H5DLSoZB3Jngjxqq14vir+NudfavmMg@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 7/28/20 2:44 AM, Arnd Bergmann wrote:
> On Mon, Jul 27, 2020 at 11:10 PM Suman Anna <s-anna@ti.com> wrote:
>>
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
> 
> Sorry for missing this earlier. I think this makes sense, and I don't
> expect the name change to cause problems, so
> 
> Reviewed-by: Arnd Bergmann <arnd@arndb.de>

Thanks Arnd.

> 
>> --- a/drivers/mfd/syscon.c
>> +++ b/drivers/mfd/syscon.c
>> @@ -101,12 +101,14 @@ static struct syscon *of_syscon_register(struct device_node *np, bool check_clk)
>>                  }
>>          }
>>
>> -       syscon_config.name = of_node_full_name(np);
>> +       syscon_config.name = kasprintf(GFP_KERNEL, "%pOFn@%llx", np,
>> +                                      (u64)res.start);
> 
> Note that you could avoid the cast by using "%pOFn@%pa", and
> passing res.start by reference. Not important though, the result should
> be similar, and you might not like the '0x' that this adds.

Yeah, preference was not to add the leading 0x or any leading 0s. We did 
discuss about this on the original v2 submission [1].

regards
Suman

[1] https://patchwork.kernel.org/comment/23129393/
