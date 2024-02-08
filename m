Return-Path: <linux-omap+bounces-536-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EE05784DFBA
	for <lists+linux-omap@lfdr.de>; Thu,  8 Feb 2024 12:30:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A6C5E28D568
	for <lists+linux-omap@lfdr.de>; Thu,  8 Feb 2024 11:30:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8CEA6EB75;
	Thu,  8 Feb 2024 11:30:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=smile-fr.20230601.gappssmtp.com header.i=@smile-fr.20230601.gappssmtp.com header.b="SlOjy+jL"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 047591DFCE
	for <linux-omap@vger.kernel.org>; Thu,  8 Feb 2024 11:30:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707391804; cv=none; b=kyFfGyX+13b2ojE9V8E8B18QnzXtHoeBKHRet6A0wN6cacdOEiOVD0RkXjadjRJvV7Q39o3bglFrKeH35dTLiZzZxwb5Qly1zBODfcMSdrYTVtJjaaaDblcDH4DyA9vtAs6Wav36OjpwW6DgPyFeiBPh/Y1QKdbjQ4FZxTIaH9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707391804; c=relaxed/simple;
	bh=A/9QDHOveTF5KwzqzneyZu01uq/HZbUuDGK1iuX0Q14=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oJeIB3c6SLKxnflPZvH/PLI5B1mwQUFQYI9bs6910+64zcSHpGQEjLOH+7+tKo+l88V0l4qCObRjQ/BLsugq8s87lNiChf3jCxNM38ZTaX3lTOU1BwjHHIzbTZM+2t6xjQEym3rT2duft334odq5QjcGpuLHBBEcK70WcFxWqDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=smile.fr; spf=pass smtp.mailfrom=smile.fr; dkim=pass (2048-bit key) header.d=smile-fr.20230601.gappssmtp.com header.i=@smile-fr.20230601.gappssmtp.com header.b=SlOjy+jL; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=smile.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=smile.fr
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-33b45e8a670so934225f8f.3
        for <linux-omap@vger.kernel.org>; Thu, 08 Feb 2024 03:30:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1707391799; x=1707996599; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ENBamKSr18pgv2cENK3EgfJJXVVKjXw+PVr60UI5gP4=;
        b=SlOjy+jLqBwIbgSXlb3VhD06kn6J550KHpt1ZMOMJJD1bVwbpETnKkUAUXQnOGXBZ3
         fpon2eI93F+ronMz+2Hi8OsIHFRZ6BVvEH5SFSj743FHvS5nfyx7pFn6+ZBXhg7pj/9H
         fz8WMrKK0y+yuXABjFN5Bccbs4QiAM4nXoD40ww3B3uTPH9OpVpFKDsN+C5Cuyc+RBT8
         QZOKOAtugOYFmAJzNr4CZLpK1iO5Pjhcyt+ZRdwN2B5Rhq8JmgPGdGGPI2kxyNf7L1Pe
         RQuQ/HLmJryHr7qIoKR8nKyvmqbJijqz+u43qPBbqUNYBQOtQJ863X9ZonvoKoWRpc7V
         Ex5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707391799; x=1707996599;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ENBamKSr18pgv2cENK3EgfJJXVVKjXw+PVr60UI5gP4=;
        b=YkNp88TC783ygSbRvTpAClDpBjgC+5j7ZVMYrnFSrgAFlubjV4QJAMs1yZfftDY/E/
         Kxf4KRBt5uHZwirbwTttprDZAICi3mj8pFXMe7kzRMjeiCrgBxreS15HPcin7DrTLNY9
         osYgfKJQKgEUQn3jxe4V23lxzwRIsppAAC9BgKp//9U9P+/iJJUO/a3fuHc8Mw5DCFGE
         FMJF8gsYoJ5PmFNLdMrve6uAub9w9uhJJx3bW/XosvfprI7JmrEgJuhl1Sjgguxs0QP8
         tvEH4uCqo8NMu62HHwFKhYrEm+59GbeALnX0GiWOgI1xKWEYnIsJfhyzGvyY9xqYbMY/
         sGoA==
X-Gm-Message-State: AOJu0YyK28J7uRZTkeyPOY6c9O3xKwRynIW/D+cNVq3C8WqfJKKKa17m
	yiX7cAf7SwBUMbJudoCTHtcOlCg+/P/c0YI0PyMqavcP/uvLQt8a1c8mDde/UhQ=
X-Google-Smtp-Source: AGHT+IHPOHd6a0AkvrNfbmLAOFonzs2GMBV0wj0xVlXRgB1TISVRSGvv8X9jjK4rAgyo0b6nzpsMmg==
X-Received: by 2002:a5d:4986:0:b0:33b:139e:9110 with SMTP id r6-20020a5d4986000000b0033b139e9110mr5587477wrq.36.1707391798897;
        Thu, 08 Feb 2024 03:29:58 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXe/vzOJyYV0FKR2ZOg7iJDzGOvMNQl58dHCM0W+wCcQgqKUHkeNzzHeZQPiWkW4O9hsjAqoRvatAyr6/HSxa2Bd+T/qnYje1Yz3miY9Ahq/RVs1ST8Xv9WtSCzR5ijWFya+btJIKWOnYe1euIUkksLMVH776ZAL4foYEEdweacovhVZ25L
Received: from ?IPV6:2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31? (2a01cb05945b7e009bdc688723a24f31.ipv6.abo.wanadoo.fr. [2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31])
        by smtp.gmail.com with ESMTPSA id f2-20020a5d50c2000000b0033b4db744e5sm3406984wrt.12.2024.02.08.03.29.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Feb 2024 03:29:58 -0800 (PST)
Message-ID: <6eced20a-6454-4824-a149-ee331ebb7eec@smile.fr>
Date: Thu, 8 Feb 2024 12:29:57 +0100
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: sdhci-omap: issues with PM features since 5.16
Content-Language: fr, en-US
To: Tony Lindgren <tony@atomide.com>
Cc: Linux-OMAP <linux-omap@vger.kernel.org>, Nishanth Menon <nm@ti.com>,
 linux-mmc@vger.kernel.org, Ulf Hansson <ulf.hansson@linaro.org>,
 Adrian Hunter <adrian.hunter@intel.com>
References: <2e5f1997-564c-44e4-b357-6343e0dae7ab@smile.fr>
 <20240127044851.GW5185@atomide.com>
 <d09925b3-83e6-4c52-878f-4c1db7670543@smile.fr>
 <20240129111733.GX5185@atomide.com>
 <f80b5390-8bfa-43d8-80ce-70b069aef947@smile.fr>
 <7d72f3ee-bcfe-4197-b492-857dc49b2788@smile.fr>
 <20240131103050.GZ5185@atomide.com>
 <519f7e2e-4df2-4b3c-90e2-2383b6b34562@smile.fr>
 <20240202043601.GA5185@atomide.com>
From: Romain Naour <romain.naour@smile.fr>
In-Reply-To: <20240202043601.GA5185@atomide.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Le 02/02/2024 à 05:36, Tony Lindgren a écrit :
> * Romain Naour <romain.naour@smile.fr> [240201 09:04]:
>> Le 31/01/2024 à 11:30, Tony Lindgren a écrit :
>>> * Romain Naour <romain.naour@smile.fr> [240130 11:20]:
>>>> Le 29/01/2024 à 18:42, Romain Naour a écrit :
>>>>> Le 29/01/2024 à 12:17, Tony Lindgren a écrit :
>>>>>> So I'm still guessing your issue is with emmc not getting reinitialized
>>>>>> properly as there's no mmc-pwrseq-emmc configured. Can you give it a
>>>>>> try? See am5729-beagleboneai.dts for an example.
>>>>
>>>> I can't add such mmc-pwrseq-emmc on the custom board, there is no gpio available
>>>> to reset the emmc device.
>>>>
>>>> To resume:
>>>> - the emmc doesn't work with mmc-hs200-1_8v mode with PM runtime enabled
>>>> - the emmc works with mmc-hs200-1_8v mode without PM runtime (patch series reverted)
>>>> - the emmc works with mmc-ddr-1_8v mode with PM runtime enabled
>>>>
>>>> AFAIU the hs200 mode requires some pin iodelay tuning (SDHCI_OMAP_REQUIRE_IODELAY)
>>>> is sdhci_omap_runtime_{suspend,resume} needs to take care of that?
> 
> On PM runtime resume, sdhci_omap_runtime_resume() gets called and calls
> sdhci_runtime_resume_host(), and calls mmc->ops->set_ios().
> 
> Then sdhci_omap_set_ios() calls sdhci_omap_set_timing() to set the iodelay.
> Maybe add some printk to sdhci_omap_set_timing() to verify the right modes
> get set on PM runtime resume?
> 
>>>> The mmc2 clock seems idle when mmc-hs200-1_8v and PM runtime are used.
>>>>
>>>> omapconf dump prcm l3init
>>>>
>>>> (mmc2 clock idle)
>>>> | CM_L3INIT_MMC2_CLKCTRL           | 0x4A009330   | 0x01070000 |
>>>>
>>>> (mmc2 clock running)
>>>> | CM_L3INIT_MMC2_CLKCTRL           | 0x4A009330   | 0x01040002 |
>>>>
>>>> Thoughts?
> 
> For the clocks above, that is as expected. The clocks get idled when the
> MMC controller is idle.
> 
>>> OK so if the emmc reset gpio is not available, seems we should do something
>>> like the following patch to not set MMC_CAP_POWER_OFF_CARD unless the
>>> cap-power-off-card devicetree property is set.
>>>
>>> Care to give it a try and see if it helps?
>>
>> Same problem without MMC_CAP_POWER_OFF_CARD flag (even by removing
>> MMC_CAP_AGGRESSIVE_PM too).
>>
>> I did some test with mmc capabilities mask but no progress so far.
> 
> OK. So this issue seems to be related to the PM runtime resume not
> restoring something properly as you suggested earlier.

Adding your PM reply with the mailing list in Cc:

Le 06/02/2024 à 09:25, Tony Lindgren a écrit :
> * Tony Lindgren <tony@atomide.com> [240202 10:30]:
[...]
>
> When you get a chance, maybe give the following debug patch a try.
> I'm mostly seeing value of 2 and sometimes 0, but that could be
> for a different mmc controller instance as I just used pr_info.
> So you may need to tweak the debug patch to use dev_dbg to leave
> out other controllers.
>
> #define MMC_POWER_OFF           0
> #define MMC_POWER_UP            1
> #define MMC_POWER_ON            2
> #define MMC_POWER_UNDEFINED     3
>
> So on MMC_POWER_OFF, in sdhci_runtime_resume_host() the flag
> host->reinit_uhs = true does not get set, and maybe with hs200
> that causes the failure?

With the debug line added, I don't see any MMC_POWER_OFF for the emmc but only
MMC_POWER_ON lines:

XXX sdhci_runtime_resume_host: mmc->ios.power_mode: 2

>
> If you're seeing MMC_POWER_OFF values, maybe also try changing
> sdhci_omap_runtime_resume() to call sdhci_runtime_resume_host(host, 1)
> and see if that helps as requesting a soft reset causes sdhci_init() to
> set host->reinit_uhs = true.. That change feels like a workaround
> though.

I tried anyway with soft reset, the cache flush error is gone but now I have
this dump in dmesg each time the emmc is reset:

[ 3978.852783] mmc1: Reset 0x6 never completed.
[ 3978.852783] mmc1: sdhci: ============ SDHCI REGISTER DUMP ===========
[ 3978.852783] mmc1: sdhci: Sys addr:  0x00000000 | Version:  0x00003302
[ 3978.852813] mmc1: sdhci: Blk size:  0x00000000 | Blk cnt:  0x00000000
[ 3978.852813] mmc1: sdhci: Argument:  0x00000000 | Trn mode: 0x00000000
[ 3978.852813] mmc1: sdhci: Present:   0x01f00000 | Host ctl: 0x00000000
[ 3978.852813] mmc1: sdhci: Power:     0x00000000 | Blk gap:  0x00000000
[ 3978.852813] mmc1: sdhci: Wake-up:   0x00000000 | Clock:    0x00000000
[ 3978.852844] mmc1: sdhci: Timeout:   0x00000000 | Int stat: 0x00000000
[ 3978.852844] mmc1: sdhci: Int enab:  0x00000000 | Sig enab: 0x00000000
[ 3978.852844] mmc1: sdhci: ACmd stat: 0x00000000 | Slot int: 0x00000000
[ 3978.852844] mmc1: sdhci: Caps:      0x24e90080 | Caps_1:   0x00000f77
[ 3978.852844] mmc1: sdhci: Cmd:       0x00000000 | Max curr: 0x00000000
[ 3978.852874] mmc1: sdhci: Resp[0]:   0x00000000 | Resp[1]:  0x00000000
[ 3978.852874] mmc1: sdhci: Resp[2]:   0x00000000 | Resp[3]:  0x00000000
[ 3978.852874] mmc1: sdhci: Host ctl2: 0x00000000
[ 3978.852874] mmc1: sdhci: ADMA Err:  0x00000000 | ADMA Ptr: 0x00000000
[ 3978.852874] mmc1: sdhci: ============================================

With sdhci soft reset enabled, there are some MMC_POWER_OFF in dmesg

[ 3978.852905] XXX sdhci_runtime_resume_host: mmc->ios.power_mode: 0
[ 3982.217590] XXX sdhci_runtime_resume_host: mmc->ios.power_mode: 2

The iodelay pin setting is still applied after the emmc is reset:

# omapconf dump 0x4A00348c 0x4A0034ac
|----------------------------|
| Address (hex) | Data (hex) |
|----------------------------|
| 0x4A00348C    | 0x00070101 |
| 0x4A003490    | 0x00070101 |
| 0x4A003494    | 0x00070101 |
| 0x4A003498    | 0x00070101 |
| 0x4A00349C    | 0x00060101 |
| 0x4A0034A0    | 0x00070101 |
| 0x4A0034A4    | 0x00070101 |
| 0x4A0034A8    | 0x00070101 |
| 0x4A0034AC    | 0x00070101 |
|----------------------------|

>
> Regards,
>
> Tony
>
> 8< ------
> diff --git a/drivers/mmc/host/sdhci.c b/drivers/mmc/host/sdhci.c
> --- a/drivers/mmc/host/sdhci.c
> +++ b/drivers/mmc/host/sdhci.c
> @@ -3848,6 +3848,7 @@ int sdhci_runtime_resume_host(struct sdhci_host *host,
int soft_reset)
>  	}
>
>  	sdhci_init(host, soft_reset);
> +	pr_info("XXX %s: mmc->ios.power_mode: %i\n", __func__, mmc->ios.power_mode);
>
>  	if (mmc->ios.power_mode != MMC_POWER_UNDEFINED &&
>  	    mmc->ios.power_mode != MMC_POWER_OFF) {


Best regards,
Romain


> 
> Regards,
> 
> Tony


