Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6EB533669F8
	for <lists+linux-omap@lfdr.de>; Wed, 21 Apr 2021 13:36:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237511AbhDULhI (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 21 Apr 2021 07:37:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47090 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237440AbhDULhH (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 21 Apr 2021 07:37:07 -0400
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ADAE7C06138B
        for <linux-omap@vger.kernel.org>; Wed, 21 Apr 2021 04:36:33 -0700 (PDT)
Received: by mail-wm1-x32a.google.com with SMTP id f195-20020a1c1fcc0000b029012eb88126d7so1060267wmf.3
        for <linux-omap@vger.kernel.org>; Wed, 21 Apr 2021 04:36:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=3U1xeifc4RYATXIaOPm+gVuOiogsqdmpZYnrWwH4mgQ=;
        b=ZCyo4Lvm/KnWehZdix7AShEog4Tc6zanQV0JB2RIAFSrtiTTBaIlyDy8+ZUdFSezQ6
         +KbK+TWWkzZESzM4vM3yAKR1/GXsAssfOs/IycMS1pr2LBsPoirx6p8TK2PVEXdwPipp
         Yz40G+ks8Sc9NTDjekTumF+0YPt5hbeiaZO7NiGaHDeW9Uk9JdRevBoyzCa1+4wbpueO
         TgZq4GC6w17coiCRMNqqmKORqJmTEPRJPJ9lpmYHY1wciQvqg7qcji/1M/PWhBAkDivZ
         UuyuLKSwPXxaS4BXRQu7YhNXr6sYusYwex0AehNkhRftOaKR0CEzhzpJYEKd4LE49G5l
         unfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=3U1xeifc4RYATXIaOPm+gVuOiogsqdmpZYnrWwH4mgQ=;
        b=Ynt197xK05FQZze2DxW70YxkZXQpERbG9L88G+CfGWynCNSbUOqBvbeC5Ik9NEH1EK
         5TtGkpEIPbpWq+AVeE1l0Fh9Eq8zvOD/B/EKRcWP4FDpyYfCF4DiF4/55W3+dDZ0pdRF
         P6KnKOspcGXixi7Y8q+I9Y7UcbnHdwrbZreQRBMOH7YWPW/gH5uu3L8i4UZS+Icgfu6+
         NLAabcO/Qu+LsRwBghWsIzJ3lRtKBfM2LkTUppzNaIfFc+go5EznZOxlJYC9Yh/T9d1Z
         QpIGTEt9nb9D83UA/KNnITmx8JqmqP/Pokzil49HnxM/8NS0DLhlZkZE7zY131/KzUf2
         2ZFw==
X-Gm-Message-State: AOAM531inyBtTmpFkdwQ7E00af6mIo3Jdfu6P6Y/jiS23AUqWT82+bZv
        vVm8sFvWvO50IXs8GmKvgPv79UOVBiQeLk7I
X-Google-Smtp-Source: ABdhPJyOX4FqLp9SQoeu19y0eMvJflSoeUyXcc2fWopIy9J+Fj4eXzzG4ll+AZRlHZl3JEwcMKaHRQ==
X-Received: by 2002:a1c:9850:: with SMTP id a77mr9163790wme.174.1619004992118;
        Wed, 21 Apr 2021 04:36:32 -0700 (PDT)
Received: from ?IPv6:2a01:e34:ed2f:f020:d985:3a3b:ec32:bdfe? ([2a01:e34:ed2f:f020:d985:3a3b:ec32:bdfe])
        by smtp.googlemail.com with ESMTPSA id q5sm2162741wmj.20.2021.04.21.04.36.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Apr 2021 04:36:31 -0700 (PDT)
Subject: Re: [PATCH v3] thermal: ti-soc-thermal: Remove unused variable 'val'
To:     Tony Lindgren <tony@atomide.com>
Cc:     Greg KH <gregkh@linuxfoundation.org>,
        Lin Ruizhe <linruizhe@huawei.com>, rui.zhang@intel.com,
        edubezval@gmail.com, j-keerthy@ti.com, amitk@kernel.org,
        eballetbo@gmail.com, linux-pm@vger.kernel.org,
        linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210421084256.57591-1-linruizhe@huawei.com>
 <YH/nK6xshH+lW7e0@kroah.com>
 <8e66040e-4330-d4f0-afbb-8cae62a5082e@linaro.org>
 <YH/yQ5Hd+30DH4p/@atomide.com>
From:   Daniel Lezcano <daniel.lezcano@linaro.org>
Message-ID: <3116672d-4ff3-a065-f76c-1ae820e1ff95@linaro.org>
Date:   Wed, 21 Apr 2021 13:36:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <YH/yQ5Hd+30DH4p/@atomide.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org


Hi Tony,

thanks for testing

  -- Daniel

On 21/04/2021 11:37, Tony Lindgren wrote:
> * Daniel Lezcano <daniel.lezcano@linaro.org> [210421 09:07]:
>> On 21/04/2021 10:49, Greg KH wrote:
>>> On Wed, Apr 21, 2021 at 04:42:56PM +0800, Lin Ruizhe wrote:
>>>> The variable 'val'in function ti_bandgap_restore_ctxt is
>>>> the register value of read bandgap registers. This function is to
>>>> restore the context. But there is no operation on the return value
>>>> of this register, so this block is redundant. Hulk robot scans this
>>>> warning.This commit remove the dead code.
>>>>
>>>> Reported-by: Hulk Robot <hulkci@huawei.com>
>>>> Fixes: b87ea759a4cc ("staging: omap-thermal: fix context restore function")
>>>> Signed-off-by: Lin Ruizhe <linruizhe@huawei.com>
>>>> ---
>>>> v3:
>>>> -Add Fixes tag and more accurate commit message in this patch.
>>>> v2:
>>>> -As suggest remove the whole unuesed block in fuction
>>>>  ti_bandgap_restore_ctxt
>>>>
>>>>  drivers/thermal/ti-soc-thermal/ti-bandgap.c | 4 ----
>>>>  1 file changed, 4 deletions(-)
>>>>
>>>> diff --git a/drivers/thermal/ti-soc-thermal/ti-bandgap.c b/drivers/thermal/ti-soc-thermal/ti-bandgap.c
>>>> index d81af89166d2..684ffb645aa9 100644
>>>> --- a/drivers/thermal/ti-soc-thermal/ti-bandgap.c
>>>> +++ b/drivers/thermal/ti-soc-thermal/ti-bandgap.c
>>>> @@ -1142,14 +1142,10 @@ static int ti_bandgap_restore_ctxt(struct ti_bandgap *bgp)
>>>>  	for (i = 0; i < bgp->conf->sensor_count; i++) {
>>>>  		struct temp_sensor_registers *tsr;
>>>>  		struct temp_sensor_regval *rval;
>>>> -		u32 val = 0;
>>>>  
>>>>  		rval = &bgp->regval[i];
>>>>  		tsr = bgp->conf->sensors[i].registers;
>>>>  
>>>> -		if (TI_BANDGAP_HAS(bgp, COUNTER))
>>>> -			val = ti_bandgap_readl(bgp, tsr->bgap_counter);
>>>
>>> Are you sure that this hardware does not require this read to happen in
>>> order for it to work properly?
>>
>> Yes, initially we had the same concern but we were unable to find
>> anything specific in the history. The commit mentioned above removed the
>> user of the 'val' code but without removing this block of code.
>>
>> When looking at the current code, it really looks like an oversight.
> 
> Yes so it seems.
> 
>> There is nothing in the commit's changelog referring to a need of
>> reading the counter register but perhaps I'm wrong because I'm not sure
>> to understand correctly the changelog.
>>
>>> Lots of hardware does need this, have you tested this?
> 
> I just tested this on omap3 logicpd torpedo devkit that can do off during
> idle and reading /sys/class/thermal/thermal_zone0/temp works. So feel
> free to add:
> 
> Reviewed-by: Tony Lindgren <tony@atomide.com>
> Tested-by: Tony Lindgren <tony@atomide.com>

Thanks for testing


-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
