Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 71F68366784
	for <lists+linux-omap@lfdr.de>; Wed, 21 Apr 2021 11:06:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237600AbhDUJGi (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 21 Apr 2021 05:06:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41996 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237626AbhDUJGi (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 21 Apr 2021 05:06:38 -0400
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 23B2DC06138D
        for <linux-omap@vger.kernel.org>; Wed, 21 Apr 2021 02:06:05 -0700 (PDT)
Received: by mail-wm1-x333.google.com with SMTP id n4-20020a05600c4f84b029013151278decso803017wmq.4
        for <linux-omap@vger.kernel.org>; Wed, 21 Apr 2021 02:06:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=5+rdKaHivfH/nfoVVfN5MWkd8Dr98/JULxmu5Qz06AE=;
        b=CAQEzYpQzZtvI6FzvH5AO0pSxv2pkoQ8WtG0auR9WDWLeMArsDdQyR02qPPQFGYoWQ
         UX/h1XHAG5Rsgfq0nKQYi2K4563HqsKdwVJVMOFN724V/X0mSScJA+6IZRYvkJFOqScf
         1LY6PjE7VW2ZqNatraDnt+3dgCFlbkc0rmF71YTw2uoVK7BhnbjsAYWffSGoe9JNXxfE
         D/xaoqHNC3rgdDP3j3ucGLuVzBhm+s8vrNA6k+1J3s09HC3TIGz8Bm+pBJDuYhz0PIU/
         SZYKfYp/1YG4iWSCjkNqEHVB5nq9TV1Nwx0nzpKgYsvj5+o04hGnd75pDxtNNbsPkItv
         tbtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=5+rdKaHivfH/nfoVVfN5MWkd8Dr98/JULxmu5Qz06AE=;
        b=dh+5/GSekYJOBE8YxNkZj+C94AwqFE2Is+VHwSD4RsIKJYWcSmhTldNydWlwlK+Fx7
         flAO/U+KTXNcQXdyT7TEBfr6/wOU8xonYqD1rXioONcRJfPJyp7vVLCc2lO5Il7pJM58
         0nhg2gAwHUso/g9pZPWCIZTXDeFqlNhUufXG2OfVabV482xzKMf+kDP1UmIGQKq8ee34
         7YmNwWYWO+IsycBm3kRzz0KynAi+gnPUvrJq4odmRy/ytSbvken26q/5nM8MqPVBff1r
         HxdXiC5EXs+NG/vPCYJfTJTDXKGKWlozo0mulGP4IjkikuGumqRgA7eeV3rwnPPU1aGr
         3IrA==
X-Gm-Message-State: AOAM531jyHNy5y4uWwP/2o4tBSyljAP+sxIaWyvBET+Gpy26JAtsSd+9
        nN22ACTFobt7+jsehYgKT9Ejzw==
X-Google-Smtp-Source: ABdhPJyoHz1uPPt9F1homOiXgiRIdiIGCz2mkuwDqBJcHl5PnqGPmZUAfDePYe3IosuXBwYDdsyivg==
X-Received: by 2002:a1c:4102:: with SMTP id o2mr8751767wma.177.1618995963577;
        Wed, 21 Apr 2021 02:06:03 -0700 (PDT)
Received: from ?IPv6:2a01:e34:ed2f:f020:d985:3a3b:ec32:bdfe? ([2a01:e34:ed2f:f020:d985:3a3b:ec32:bdfe])
        by smtp.googlemail.com with ESMTPSA id b16sm1676580wmb.39.2021.04.21.02.06.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Apr 2021 02:06:03 -0700 (PDT)
Subject: Re: [PATCH v3] thermal: ti-soc-thermal: Remove unused variable 'val'
To:     Greg KH <gregkh@linuxfoundation.org>,
        Lin Ruizhe <linruizhe@huawei.com>
Cc:     rui.zhang@intel.com, edubezval@gmail.com, j-keerthy@ti.com,
        amitk@kernel.org, radhesh.fadnis@ti.com, eballetbo@gmail.com,
        linux-pm@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20210421084256.57591-1-linruizhe@huawei.com>
 <YH/nK6xshH+lW7e0@kroah.com>
From:   Daniel Lezcano <daniel.lezcano@linaro.org>
Message-ID: <8e66040e-4330-d4f0-afbb-8cae62a5082e@linaro.org>
Date:   Wed, 21 Apr 2021 11:06:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <YH/nK6xshH+lW7e0@kroah.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 21/04/2021 10:49, Greg KH wrote:
> On Wed, Apr 21, 2021 at 04:42:56PM +0800, Lin Ruizhe wrote:
>> The variable 'val'in function ti_bandgap_restore_ctxt is
>> the register value of read bandgap registers. This function is to
>> restore the context. But there is no operation on the return value
>> of this register, so this block is redundant. Hulk robot scans this
>> warning.This commit remove the dead code.
>>
>> Reported-by: Hulk Robot <hulkci@huawei.com>
>> Fixes: b87ea759a4cc ("staging: omap-thermal: fix context restore function")
>> Signed-off-by: Lin Ruizhe <linruizhe@huawei.com>
>> ---
>> v3:
>> -Add Fixes tag and more accurate commit message in this patch.
>> v2:
>> -As suggest remove the whole unuesed block in fuction
>>  ti_bandgap_restore_ctxt
>>
>>  drivers/thermal/ti-soc-thermal/ti-bandgap.c | 4 ----
>>  1 file changed, 4 deletions(-)
>>
>> diff --git a/drivers/thermal/ti-soc-thermal/ti-bandgap.c b/drivers/thermal/ti-soc-thermal/ti-bandgap.c
>> index d81af89166d2..684ffb645aa9 100644
>> --- a/drivers/thermal/ti-soc-thermal/ti-bandgap.c
>> +++ b/drivers/thermal/ti-soc-thermal/ti-bandgap.c
>> @@ -1142,14 +1142,10 @@ static int ti_bandgap_restore_ctxt(struct ti_bandgap *bgp)
>>  	for (i = 0; i < bgp->conf->sensor_count; i++) {
>>  		struct temp_sensor_registers *tsr;
>>  		struct temp_sensor_regval *rval;
>> -		u32 val = 0;
>>  
>>  		rval = &bgp->regval[i];
>>  		tsr = bgp->conf->sensors[i].registers;
>>  
>> -		if (TI_BANDGAP_HAS(bgp, COUNTER))
>> -			val = ti_bandgap_readl(bgp, tsr->bgap_counter);
> 
> Are you sure that this hardware does not require this read to happen in
> order for it to work properly?

Yes, initially we had the same concern but we were unable to find
anything specific in the history. The commit mentioned above removed the
user of the 'val' code but without removing this block of code.

When looking at the current code, it really looks like an oversight.

There is nothing in the commit's changelog referring to a need of
reading the counter register but perhaps I'm wrong because I'm not sure
to understand correctly the changelog.

> Lots of hardware does need this, have you tested this?
> 
> thanks,
> 
> greg k-h
> 


-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
