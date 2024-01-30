Return-Path: <linux-omap+bounces-437-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 072858422C2
	for <lists+linux-omap@lfdr.de>; Tue, 30 Jan 2024 12:20:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 736D11F21E6E
	for <lists+linux-omap@lfdr.de>; Tue, 30 Jan 2024 11:20:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 202F367E74;
	Tue, 30 Jan 2024 11:14:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=smile-fr.20230601.gappssmtp.com header.i=@smile-fr.20230601.gappssmtp.com header.b="Mvfgcs/9"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0251664B9
	for <linux-omap@vger.kernel.org>; Tue, 30 Jan 2024 11:14:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706613289; cv=none; b=KWzsx5qXQyhBI+rxTGeu37oz9bCrecDSPgS2Y0xFcPBRrZysHb4o12nZETC8ZgBPqH/PMSn9795JiSDp7+8F0YTXpwC3E1HwyytqmyIQBt9G+0obMVM0nnUE4A5ISZ59W1pns+C1d8L+VdYUPngpCBtu3CUs6Zfs751z7tICdw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706613289; c=relaxed/simple;
	bh=K/2eJh6Ls1oiKU9sFLsYlw9+wzMCCvz/3r+UMoz8crw=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=aEHcXR002A0HRPcAS4pFde7fXpyoH5ICCJrr7HzZHW2SMPlXSh5cXbWHzZZrDr2D41uVVLXGIyuNllpta6fsWyNkV6aO1VO+LpVgx5pomZnI9izbDnt59Sq8HGYmPvZeX3cYb/utY7w3PRk2h+EsAnotEg1Hjsj+Sn87IoYgdSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=smile.fr; spf=pass smtp.mailfrom=smile.fr; dkim=pass (2048-bit key) header.d=smile-fr.20230601.gappssmtp.com header.i=@smile-fr.20230601.gappssmtp.com header.b=Mvfgcs/9; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=smile.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=smile.fr
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-33aea66a31cso1149277f8f.1
        for <linux-omap@vger.kernel.org>; Tue, 30 Jan 2024 03:14:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1706613284; x=1707218084; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Hniqh3kKs2/+cemGO+EOvfp3qpxJ4wowlEni+urQRaQ=;
        b=Mvfgcs/9irULeylqufvmYEOwiLWuBzd9T6HSLocGebQQA/jppfqOUKvAjQr4UbWfW4
         Wow0ItDnF+ziOfaX1PMV0WzuI4hIXCH0LLk3L0ASE8ZV00qN5OUpNaTGFApnnWeMbXKC
         1nuV0s8XiBN96hycqzX3Gbs/3UoLapIixUhyC8E7XPebiTABfmZ8Czb5mMM1ZrwDxEtI
         K3lWcdWq71ZovQQ4MCYcrkFx35X2K5x+fY1oZGDECin727TEQvJPntCc9xRfWRRmc/Ak
         AjgNiqLAAKpxTZ1IBcRtJtYZx47Y0C6itMNxi79JKAzapeL1tOcL61xxNgRHiYwcoq8h
         3pDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706613284; x=1707218084;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Hniqh3kKs2/+cemGO+EOvfp3qpxJ4wowlEni+urQRaQ=;
        b=POkKg3K2y7u6MEq3y42okF7iGpC+MhXwLcbE4BvVmyQBuw3Ki7CRXa5wTv8GkACltM
         9aFu2MGW7QSyPml0qpuTDelQ5/dH4K738vkczIgGjF37a3qlTvB1FSS5UVxCFlOjQUIK
         Sa6Sm7NieOyW9qT4xJoXWugwKg5Uyc4dywGfOzvotb9oY2VgZQv0ChPLJRQjQmuwgPKF
         +ius+r9O134LrH9V7z3jgDgwhFMRIeSbuF4CD5oeuERt+Wyz85Q3tgqAprwa4URhIIqn
         VvZ2OowhOVZFMDvJAyW/W2ffnaVuQwGP4oX4uk2SzKd3nUAw0GuEx8aqiyIhzcIEY1Ll
         3BjQ==
X-Gm-Message-State: AOJu0Ywpqp55XZq2EXyTJrrHP/TUKWxCkDu2gPD1pi03UOlDQdWU6G1g
	wNQn2Zzd162XTZoVuK2aBi2abQrlQNW6OopmLRTVrDTHIEcR2FMRq0hl1DhipCk=
X-Google-Smtp-Source: AGHT+IHe53/cXw6t3nvTUo9H7xu+zL0PWIihQdhXpKekMW2IIuGXf0UHk8N5PCnb2UBwUYyn4fhqfQ==
X-Received: by 2002:adf:f045:0:b0:33a:e2f3:6fc4 with SMTP id t5-20020adff045000000b0033ae2f36fc4mr7943972wro.27.1706613283814;
        Tue, 30 Jan 2024 03:14:43 -0800 (PST)
Received: from ?IPV6:2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31? (2a01cb05945b7e009bdc688723a24f31.ipv6.abo.wanadoo.fr. [2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31])
        by smtp.gmail.com with ESMTPSA id cc9-20020a5d5c09000000b0033afb963d0dsm1325684wrb.101.2024.01.30.03.14.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jan 2024 03:14:43 -0800 (PST)
Message-ID: <7d72f3ee-bcfe-4197-b492-857dc49b2788@smile.fr>
Date: Tue, 30 Jan 2024 12:14:42 +0100
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: sdhci-omap: issues with PM features since 5.16
Content-Language: en-US
From: Romain Naour <romain.naour@smile.fr>
To: Tony Lindgren <tony@atomide.com>
Cc: Linux-OMAP <linux-omap@vger.kernel.org>, Nishanth Menon <nm@ti.com>
References: <2e5f1997-564c-44e4-b357-6343e0dae7ab@smile.fr>
 <20240127044851.GW5185@atomide.com>
 <d09925b3-83e6-4c52-878f-4c1db7670543@smile.fr>
 <20240129111733.GX5185@atomide.com>
 <f80b5390-8bfa-43d8-80ce-70b069aef947@smile.fr>
In-Reply-To: <f80b5390-8bfa-43d8-80ce-70b069aef947@smile.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hello,

Le 29/01/2024 à 18:42, Romain Naour a écrit :
> Hello,
> 
> Le 29/01/2024 à 12:17, Tony Lindgren a écrit :
>> * Romain Naour <romain.naour@smile.fr> [240129 10:11]:
>>> Hello,
>>>
>>> Le 27/01/2024 à 05:48, Tony Lindgren a écrit :
>>>> Hi,
>>>>
>>>> * Romain Naour <romain.naour@smile.fr> [240126 20:53]:
>>>>> Hello,
>>>>>
>>>>> I'm upgrading the kernel from 5.10.168 to 6.1.69 (both from TI tree) on a custom
>>>>> board based on a AM574x SoC and I noticed a regression on the sdhci-omap driver.
>>>>>
>>>>> The emmc was working on the 5.10 kernel using mmc-hs200 powered at 1,8v (mmc2).
>>>>
>>>> Is this limited to emmc or does it also happen with the micro-sd or wlan possibly?
>>>
>>> I can't test with a wlan device but I noticed the same issue on micro-sd (the
>>> mmc0 interface in my first post is a micro-sd)
>>
>> OK
>>
>>>> If the issue is emmc related, do you have mmc-pwrseq-emmc configured in the dts?
>>>>
>>>>> I'm able to reproduce on the IDK574x evaluation board (where the emmc is powered
>>>>> at 3v3) with vanilla kernels.
>>>>
>>>> OK, looks like only am5729-beagleboneai.dts has configured mmc-pwrseq-emmc.
>>>>
>>>>> I had to revert all commits related to "PM runtime functions" [1] and "card
>>>>> power off and enable aggressive PM" [2] from kernel 5.16 to use the emmc again
>>>>> on both boards.
>>>>
>>>> OK, this sounds like power sequence related when the emmc gets idled.
>>>
>>> It seems mmc0 ios infos are lost at some point, just after the kernel boot they
>>> are correct:
>>>
>>> cat /sys/kernel/debug/mmc0/ios
>>> clock:		50000000 Hz
>>> vdd:		21 (3.3 ~ 3.4 V)
>>> bus mode:	2 (push-pull)
>>> chip select:	0 (don't care)
>>> power mode:	2 (on)
>>> bus width:	2 (4 bits)
>>> timing spec:	2 (sd high-speed)
>>> signal voltage:	0 (3.30 V)
>>> driver type:	0 (driver type B)
>>>
>>> And without notice, ios became wrong:
>>>
>>> cat /sys/kernel/debug/mmc0/ios
>>> clock:		0 Hz
>>> vdd:		0 (invalid)
>>> bus mode:	2 (push-pull)
>>> chip select:	0 (don't care)
>>> power mode:	0 (off)
>>> bus width:	0 (1 bits)
>>> timing spec:	0 (legacy)
>>> signal voltage:	0 (3.30 V)
>>> driver type:	0 (driver type B)
>>>
>>> # cat /sys/bus/mmc/devices/mmc0:1234/type
>>> SD
>>
>> With a beagle x15, the ios values are correct after I do
>> something like fdisk -l /dev/mmcblk0:
>>
>> # cat /sys/kernel/debug/mmc0/ios
>> clock:          0 Hz
>> vdd:            0 (invalid)
>> bus mode:       2 (push-pull)
>> chip select:    0 (don't care)
>> power mode:     0 (off)
>> bus width:      0 (1 bits)
>> timing spec:    0 (legacy)
>> signal voltage: 0 (3.30 V)
>> driver type:    0 (driver type B)
>>
>> # fdisk -l /dev/mmcblk0
>> ...
>>
>> # cat /sys/kernel/debug/mmc0/ios
>> clock:          50000000 Hz
>> vdd:            21 (3.3 ~ 3.4 V)
>> bus mode:       2 (push-pull)
>> chip select:    0 (don't care)
>> power mode:     2 (on)
>> bus width:      2 (4 bits)
>> timing spec:    2 (sd high-speed)
>> signal voltage: 0 (3.30 V)
>> driver type:    0 (driver type B)
> 
> OK, I reproduced the same behavior on the AM574x evaluation board. I didn't know
> that ios can report clock 0 Hz and vdd invalid when the device is idle. I
> thought that was a symptom of my initial issue "mmc1: cache flush error -110".
> 
> So, there is no issue on AM574x evaluation board.
> 
>>
>> So I'm still guessing your issue is with emmc not getting reinitialized
>> properly as there's no mmc-pwrseq-emmc configured. Can you give it a
>> try? See am5729-beagleboneai.dts for an example.

I can't add such mmc-pwrseq-emmc on the custom board, there is no gpio available
to reset the emmc device.

To resume:
- the emmc doesn't work with mmc-hs200-1_8v mode with PM runtime enabled
- the emmc works with mmc-hs200-1_8v mode without PM runtime (patch series reverted)
- the emmc works with mmc-ddr-1_8v mode with PM runtime enabled

AFAIU the hs200 mode requires some pin iodelay tuning (SDHCI_OMAP_REQUIRE_IODELAY)
is sdhci_omap_runtime_{suspend,resume} needs to take care of that?

The mmc2 clock seems idle when mmc-hs200-1_8v and PM runtime are used.

omapconf dump prcm l3init

(mmc2 clock idle)
| CM_L3INIT_MMC2_CLKCTRL           | 0x4A009330   | 0x01070000 |

(mmc2 clock running)
| CM_L3INIT_MMC2_CLKCTRL           | 0x4A009330   | 0x01040002 |

Thoughts?

Best regards,
Romain

> 
> I don't understand how the emmc_pwrseq node can work on am5729-beagleboneai
> using gpio5_7 as reset-gpio since this pin it's not connected (F13 ball)
> 
> 	emmc_pwrseq: emmc_pwrseq {
> 		compatible = "mmc-pwrseq-emmc";
> 		reset-gpios = <&gpio5 7 GPIO_ACTIVE_LOW>;
> 	};
> 
> https://openbeagle.org/beagleboard/beaglebone-ai/-/blob/master/BeagleBone-AI_RevA2_sch.pdf
> 
> Note that mmc2 node is using ti,needs-special-reset property that is not used in
> shdci-omap driver but only in omap_hsmmc.
> 
> Best regards,
> Romain
> 
>>
>> Regards,
>>
>> Tony
> 


