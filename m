Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C2F101E01C4
	for <lists+linux-omap@lfdr.de>; Sun, 24 May 2020 21:09:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388032AbgEXTJN (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sun, 24 May 2020 15:09:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34900 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387744AbgEXTJN (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sun, 24 May 2020 15:09:13 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AFB97C061A0E;
        Sun, 24 May 2020 12:09:12 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id z18so18473630lji.12;
        Sun, 24 May 2020 12:09:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=LMdjSe0e4mZx0DgOSlru/fa7QuHJbrDuWzDwWOCe4i0=;
        b=LulrS0SBgqaBvc10gVG82AgEpTiv/NizjKbJz3SW/nPv+rc9Kww5tlxYj2lAwL5j4H
         zp7bmG2Z8YPNmaoKM7O+18nR0dQ9VpcSqejFxbPilaq3c6YZZKjmtw+TqqPoROBkEUf8
         yIOkHhUUwLrLaSzEiPTDntbjwj/KVDWjDVO//fnTTbeU7FPN4Av8a7k+gd597j02Lptk
         UXK22LgKl7evFJELPdz0GeAPSvGVTKU3iyZWzXjCDyiy1WMkPBY9gXlaxfcR36rVSgui
         VXjhjxmWympN8vVnu9g7K77FbdpUX5+4OKllqVobXgeAIGHkwoiZgGGu6nJzb5zxfSoc
         RSUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=LMdjSe0e4mZx0DgOSlru/fa7QuHJbrDuWzDwWOCe4i0=;
        b=jcMHCRehz/g8ddNr90FBjJ3rCH4aAFovRg4nE7KmlFmvpZYV3A1yEw8hiIOzY3mdTV
         Cm2RCF0Sn4BL5qYP2X6b9TF4FCgGR4q4tJhd1oEZbzcGHZDuug9Kkjg3fCWMRcQSD0Lb
         d1paI9wMafM2cf5NcErKFpUSmEWS32q5OUzEdz721TDWMTrBdn6hvVaWUTMIjC8H5S5p
         CTAMhlhpoah8jGFbupa1d/hEBtOoHLz4CYcApCt8Sv/svlP562pXM/yFVHWy1lzeDS0d
         uhl8I0gI7I5btkUKxZW1SW5vO72abvDMrVwmScFpFhLebGIdwWiY665N5nmoEAUQuaEC
         ymAw==
X-Gm-Message-State: AOAM533XtP0hmYLVWt670TDpcTYsMllsNJ9ZQ+oKtQUtDzrNVLKQF2aw
        Rx9omMATaRP1xwJtWThn4DHRpPWi
X-Google-Smtp-Source: ABdhPJxNKQlYnDW4nt6D6EISvLPXoXzl5UspSEvu55rh3XUIxr9pk7sfF3shf6pyQtcVpgs9HppSOw==
X-Received: by 2002:a2e:8105:: with SMTP id d5mr9562125ljg.354.1590347350889;
        Sun, 24 May 2020 12:09:10 -0700 (PDT)
Received: from [192.168.2.145] (ppp91-76-17-204.pppoe.mtu-net.ru. [91.76.17.204])
        by smtp.googlemail.com with ESMTPSA id b25sm4089796lff.26.2020.05.24.12.09.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 24 May 2020 12:09:10 -0700 (PDT)
Subject: Re: [PATCH v1] mfd: tps65910: Correct power-off programming sequence
From:   Dmitry Osipenko <digetx@gmail.com>
To:     =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>
Cc:     Tony Lindgren <tony@atomide.com>, Lee Jones <lee.jones@linaro.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Zack Pearsall <zpearsall@yahoo.com>,
        linux-tegra@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20200514205022.7024-1-digetx@gmail.com>
 <20200515110754.GB20564@qmqm.qmqm.pl>
 <7e1eaac5-34d1-f76e-e4c5-bc36f56a7064@gmail.com>
Message-ID: <86d37179-53d1-e0df-6b30-62160351fa4d@gmail.com>
Date:   Sun, 24 May 2020 22:09:09 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <7e1eaac5-34d1-f76e-e4c5-bc36f56a7064@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

15.05.2020 20:30, Dmitry Osipenko пишет:
> 15.05.2020 16:30, Michał Mirosław пишет:
>> On Thu, May 14, 2020 at 11:50:21PM +0300, Dmitry Osipenko wrote:
>>> This patch fixes system shutdown on a devices that use TPS65910 as a
>>> system's power controller. In accordance to the TPS65910 datasheet, the
>>> PMIC's state-machine transitions into the OFF state only when DEV_OFF
>>> bit of DEVCTRL_REG is set. The ON / SLEEP states also should be cleared,
>>> otherwise PMIC won't get into a proper state on shutdown. Devices like
>>> Nexus 7 tablet and Ouya game console are now shutting down properly.
>>>
>>> Tested-by: Zack Pearsall <zpearsall@yahoo.com>
>>> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
>>> ---
>>>  drivers/mfd/tps65910.c | 12 ++++++++++--
>>>  1 file changed, 10 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/mfd/tps65910.c b/drivers/mfd/tps65910.c
>>> index 11959021b50a..22116cee411d 100644
>>> --- a/drivers/mfd/tps65910.c
>>> +++ b/drivers/mfd/tps65910.c
>>> @@ -440,8 +440,16 @@ static void tps65910_power_off(void)
>>>  			DEVCTRL_PWR_OFF_MASK) < 0)
>>>  		return;
>>>  
>>> -	tps65910_reg_clear_bits(tps65910, TPS65910_DEVCTRL,
>>> -			DEVCTRL_DEV_ON_MASK);
>>> +	if (tps65910_reg_clear_bits(tps65910, TPS65910_DEVCTRL,
>>> +			DEVCTRL_DEV_SLP_MASK) < 0)
>>> +		return;
>>> +
>>> +	if (tps65910_reg_clear_bits(tps65910, TPS65910_DEVCTRL,
>>> +			DEVCTRL_DEV_ON_MASK) < 0)
>>> +		return;
>>> +
>>> +	tps65910_reg_set_bits(tps65910, TPS65910_DEVCTRL,
>>> +			DEVCTRL_DEV_OFF_MASK);
>>>  }
>>
>> Isn't it enough to update the DEVCTRL with just one
>> tps65910_reg_update_bits()?
> 
> IIRC, we've tried that variant and it didn't work. Although, maybe it
> was affected by some other changes that we were trying simultaneously,
> so could be worthwhile to re-check it. Thank you for the comment!
> 

We tried it once again and the variant with a single update_bits() for
all bits doesn't work. The single update_bits() for the ON/OFF_MASK mask
works, it's actually the same what downstream driver does [1].

[1]
https://android.googlesource.com/kernel/tegra/+/refs/heads/android-tegra3-grouper-3.1-lollipop-release/drivers/mfd/tps6591x.c#374

I'll prepare a v2.
