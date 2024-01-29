Return-Path: <linux-omap+bounces-429-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 84CA484110B
	for <lists+linux-omap@lfdr.de>; Mon, 29 Jan 2024 18:44:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 646DBB22532
	for <lists+linux-omap@lfdr.de>; Mon, 29 Jan 2024 17:44:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77E243F9DE;
	Mon, 29 Jan 2024 17:42:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=smile-fr.20230601.gappssmtp.com header.i=@smile-fr.20230601.gappssmtp.com header.b="zZQI1QOn"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88C523F9DC
	for <linux-omap@vger.kernel.org>; Mon, 29 Jan 2024 17:42:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706550158; cv=none; b=o0S/zQV3+ufxQ+Ry/EMgYnxecsN5E62FTdA7JRuCBSaY0bD03tjElgqF0l9zlk0ZViKiTap0wlkdDo2Z3iNHt4+tI2mBt1VB2aIzfhNxUHLOpYdZ/XiXDsfU3PJ3qt2X796Udi5WQ/8TlYbTc3vAcOVYfvJf5Kc7qqbpewTz5vY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706550158; c=relaxed/simple;
	bh=Rvgk7uoE1FiPSub6otlmissNJbxOnbi2gmZRBDq3Y1M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NP2bjV6oOQ4gALPL3zDTqHEKhr1JK+V1BQ7VLAt799pF/yiFctu94reVUN+l432p0BTq4jp4p1N+SAKTCfmdG0+X65M1MNGzbgiJ1bWADv5XFoacxfYsl22jfmthmo6iDqjPAfpOiqG3UuNVXl/JDxDGl3USsJeU/fQmHmXrSjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=smile.fr; spf=pass smtp.mailfrom=smile.fr; dkim=pass (2048-bit key) header.d=smile-fr.20230601.gappssmtp.com header.i=@smile-fr.20230601.gappssmtp.com header.b=zZQI1QOn; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=smile.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=smile.fr
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-40e7065b7bdso40034295e9.3
        for <linux-omap@vger.kernel.org>; Mon, 29 Jan 2024 09:42:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1706550152; x=1707154952; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=H8cSgDOxzOU0swAHCHbS+AbMl4v4lxJ/4luwVE8nPf4=;
        b=zZQI1QOnAB5uF3LiYfRFlEZ3jN+a8ICqatr8k5z0S/SAJ/gwhZB0/k9jKvxyxViGnV
         FmVxQaB5HX+kAxHWyPVL0+EdAUbzP5oTRiCxQt54d4FBMExwbog3PFcvgD0u9HJQUvpY
         iMwqbJjFUAz9uPAbgMV//yfOPAVB3qDhZqw2Bs5U1GmnlsyClLnM1pHVntgRW5eFhBPM
         vUvxZqI9mRozNU8zR3sTVnYzq64OL2NyjRkwJFStadOROLyI0WkkkpQMEqn+byKMdW0R
         KmNGNHR9kkOxStM01LIUjSQI3Vlpp/tZ/FIjT/wQQwTBEUdT1FOZeMGWiUCF4S6CtfIm
         hu7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706550152; x=1707154952;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=H8cSgDOxzOU0swAHCHbS+AbMl4v4lxJ/4luwVE8nPf4=;
        b=UTrZfmVHh1c43/xF9ROs169NtAfIeF+lomWLax356HPKz/1FW8ERnP9t7sEvJnCjVN
         PzCfEZKanjEXi6ORXK0CK6jtYBwJb3+p14ek6/qCxmJFDUlDNdf/iLETueOlTkbeBIPZ
         AGeHIEqn+1F1k/JtIFd5BqHCdG7aH26aWsfrxQgNFKujsLi7lA8MnayBdtkrOhOjpKFE
         h7EkR2wOpDjmQafcnShhm570p0U/hUCGk6ST9/0p5ozLxN8JBBnr3ynY6MKbYtmFOcNx
         1UXuWpVWH0e5E+kM3X4CcVq+1a1F7fjL9agLJ3m/gdQLAEKgjxNiW9/C/cr0x2/IG7wC
         S8Lg==
X-Gm-Message-State: AOJu0YxwQuv2YLbnYsKB1AKUkNQbVOPYnHRhY3r5Jh6NCbhqXqUAFdeZ
	8tGQK/IxgMZ/QnQrEeUrVmcdZdylmehov1NcNBdnRJr5G+Nc0pe2JiQZrdeL8vQ=
X-Google-Smtp-Source: AGHT+IFzTjpm2q8nqTRhYC1J5XH+6P23MBQgfQuQJVdRW+MkuHvYyaY8zReDovPhUdG2fLuphEoZLA==
X-Received: by 2002:a5d:6692:0:b0:33a:e773:5f33 with SMTP id l18-20020a5d6692000000b0033ae7735f33mr3147540wru.17.1706550152535;
        Mon, 29 Jan 2024 09:42:32 -0800 (PST)
Received: from ?IPV6:2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31? (2a01cb05945b7e009bdc688723a24f31.ipv6.abo.wanadoo.fr. [2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31])
        by smtp.gmail.com with ESMTPSA id d2-20020adf9c82000000b0033929310ae4sm8621009wre.73.2024.01.29.09.42.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jan 2024 09:42:32 -0800 (PST)
Message-ID: <f80b5390-8bfa-43d8-80ce-70b069aef947@smile.fr>
Date: Mon, 29 Jan 2024 18:42:31 +0100
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
Cc: Linux-OMAP <linux-omap@vger.kernel.org>, Nishanth Menon <nm@ti.com>
References: <2e5f1997-564c-44e4-b357-6343e0dae7ab@smile.fr>
 <20240127044851.GW5185@atomide.com>
 <d09925b3-83e6-4c52-878f-4c1db7670543@smile.fr>
 <20240129111733.GX5185@atomide.com>
From: Romain Naour <romain.naour@smile.fr>
In-Reply-To: <20240129111733.GX5185@atomide.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hello,

Le 29/01/2024 à 12:17, Tony Lindgren a écrit :
> * Romain Naour <romain.naour@smile.fr> [240129 10:11]:
>> Hello,
>>
>> Le 27/01/2024 à 05:48, Tony Lindgren a écrit :
>>> Hi,
>>>
>>> * Romain Naour <romain.naour@smile.fr> [240126 20:53]:
>>>> Hello,
>>>>
>>>> I'm upgrading the kernel from 5.10.168 to 6.1.69 (both from TI tree) on a custom
>>>> board based on a AM574x SoC and I noticed a regression on the sdhci-omap driver.
>>>>
>>>> The emmc was working on the 5.10 kernel using mmc-hs200 powered at 1,8v (mmc2).
>>>
>>> Is this limited to emmc or does it also happen with the micro-sd or wlan possibly?
>>
>> I can't test with a wlan device but I noticed the same issue on micro-sd (the
>> mmc0 interface in my first post is a micro-sd)
> 
> OK
> 
>>> If the issue is emmc related, do you have mmc-pwrseq-emmc configured in the dts?
>>>
>>>> I'm able to reproduce on the IDK574x evaluation board (where the emmc is powered
>>>> at 3v3) with vanilla kernels.
>>>
>>> OK, looks like only am5729-beagleboneai.dts has configured mmc-pwrseq-emmc.
>>>
>>>> I had to revert all commits related to "PM runtime functions" [1] and "card
>>>> power off and enable aggressive PM" [2] from kernel 5.16 to use the emmc again
>>>> on both boards.
>>>
>>> OK, this sounds like power sequence related when the emmc gets idled.
>>
>> It seems mmc0 ios infos are lost at some point, just after the kernel boot they
>> are correct:
>>
>> cat /sys/kernel/debug/mmc0/ios
>> clock:		50000000 Hz
>> vdd:		21 (3.3 ~ 3.4 V)
>> bus mode:	2 (push-pull)
>> chip select:	0 (don't care)
>> power mode:	2 (on)
>> bus width:	2 (4 bits)
>> timing spec:	2 (sd high-speed)
>> signal voltage:	0 (3.30 V)
>> driver type:	0 (driver type B)
>>
>> And without notice, ios became wrong:
>>
>> cat /sys/kernel/debug/mmc0/ios
>> clock:		0 Hz
>> vdd:		0 (invalid)
>> bus mode:	2 (push-pull)
>> chip select:	0 (don't care)
>> power mode:	0 (off)
>> bus width:	0 (1 bits)
>> timing spec:	0 (legacy)
>> signal voltage:	0 (3.30 V)
>> driver type:	0 (driver type B)
>>
>> # cat /sys/bus/mmc/devices/mmc0:1234/type
>> SD
> 
> With a beagle x15, the ios values are correct after I do
> something like fdisk -l /dev/mmcblk0:
> 
> # cat /sys/kernel/debug/mmc0/ios
> clock:          0 Hz
> vdd:            0 (invalid)
> bus mode:       2 (push-pull)
> chip select:    0 (don't care)
> power mode:     0 (off)
> bus width:      0 (1 bits)
> timing spec:    0 (legacy)
> signal voltage: 0 (3.30 V)
> driver type:    0 (driver type B)
> 
> # fdisk -l /dev/mmcblk0
> ...
> 
> # cat /sys/kernel/debug/mmc0/ios
> clock:          50000000 Hz
> vdd:            21 (3.3 ~ 3.4 V)
> bus mode:       2 (push-pull)
> chip select:    0 (don't care)
> power mode:     2 (on)
> bus width:      2 (4 bits)
> timing spec:    2 (sd high-speed)
> signal voltage: 0 (3.30 V)
> driver type:    0 (driver type B)

OK, I reproduced the same behavior on the AM574x evaluation board. I didn't know
that ios can report clock 0 Hz and vdd invalid when the device is idle. I
thought that was a symptom of my initial issue "mmc1: cache flush error -110".

So, there is no issue on AM574x evaluation board.

> 
> So I'm still guessing your issue is with emmc not getting reinitialized
> properly as there's no mmc-pwrseq-emmc configured. Can you give it a
> try? See am5729-beagleboneai.dts for an example.

I don't understand how the emmc_pwrseq node can work on am5729-beagleboneai
using gpio5_7 as reset-gpio since this pin it's not connected (F13 ball)

	emmc_pwrseq: emmc_pwrseq {
		compatible = "mmc-pwrseq-emmc";
		reset-gpios = <&gpio5 7 GPIO_ACTIVE_LOW>;
	};

https://openbeagle.org/beagleboard/beaglebone-ai/-/blob/master/BeagleBone-AI_RevA2_sch.pdf

Note that mmc2 node is using ti,needs-special-reset property that is not used in
shdci-omap driver but only in omap_hsmmc.

Best regards,
Romain

> 
> Regards,
> 
> Tony


