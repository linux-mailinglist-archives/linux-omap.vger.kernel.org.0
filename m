Return-Path: <linux-omap+bounces-3229-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 29B50A1D2FA
	for <lists+linux-omap@lfdr.de>; Mon, 27 Jan 2025 10:06:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F267A3A5C74
	for <lists+linux-omap@lfdr.de>; Mon, 27 Jan 2025 09:06:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED3301FBEB7;
	Mon, 27 Jan 2025 09:06:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr header.b="E98zZimE"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59EA61FC7CE
	for <linux-omap@vger.kernel.org>; Mon, 27 Jan 2025 09:06:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737968771; cv=none; b=WV3V7oElVPsfrCAn2sk51SLaldTN3DJtui+JHN7dMCkcIGwnS5jJwzogsM5lB0BM7S2dg6VkvIPBDNfZCa5Kkh7PJUuaFyVPU8OSExs72xpP+OmKhC/BhRJcmJW+U1X9RiyOR29u4qJvGhEQGwannQA8rvEREhAdU1daeCTvc7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737968771; c=relaxed/simple;
	bh=s+QAACx7XAIj+9dQJJeraqJ6a2Xieev3nS6MsFgWmBk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=R9NyH/JH4ze3O3GEmYOCZFbzkMbf4si8rQp73N3otXZJ6xGhe0CqFVfD0Uzor3SETvxFGl3lhrosL/4U0qTm180YduCy6UF3yHviWTKcmqqqBp0Mv9gahohenSLFSOI8G0Iw3JBQ21TzHXvmE37F8+RlSSjhbbULBypdEaPmIkg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=smile.fr; spf=pass smtp.mailfrom=smile.fr; dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr header.b=E98zZimE; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=smile.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=smile.fr
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-38a88ba968aso4087417f8f.3
        for <linux-omap@vger.kernel.org>; Mon, 27 Jan 2025 01:06:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1737968766; x=1738573566; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Mwx0LRL75FZZYCf/UA3XDEfpyFKzyK6NfZzxQ+xoqqM=;
        b=E98zZimEPahwx0xDrVEsxpKADhAYmt3XaZzy0dTRUr9Lb/QaY43F9HjTkvv7TGQZ4Y
         6cVFw1sUZ7hXIEY2NlcG7vfdL3210BVd8Pmr0/fczBaKTRjRWi+7VMWZDgIJsr5yxXDh
         nQIor91Fs7HO2MfD9q3GuYRvKSelcqvRfAIbY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737968766; x=1738573566;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Mwx0LRL75FZZYCf/UA3XDEfpyFKzyK6NfZzxQ+xoqqM=;
        b=twrZoiy/Y9Y5WX1h7UVCgFL5DhMLFNw0AhL+iB4sJ6r+dBeP8vJFUGGkjrCK3zn2XO
         2QL7X0EfsJZrliGrsPP2nP2j8lEei94Z/xwKJvQ7mxm9V2vi+8gaHJAuOSMUtVnHMufL
         bI/7EFAe/ZitLu72NxEeEI6OFOmBrvJmv8ICFPABTz28iuZ4fIB0fH+q51DwDzwiZw86
         12Af8q+KGf5k4DZi1m1lurZWUCkoe8lTJhbbZDdbf30CHHOhwmPI5ELP8QTshw2uqM+h
         1gKNKXwrm6n01dBnNdYjET+8B5X4LNmvIbmo8cUgw050ls+DZ7x7GRgR2L38KDum5GYd
         f8vA==
X-Forwarded-Encrypted: i=1; AJvYcCUbIGKMLl1PXmUGmsVOvh0VdjYE7GSfyb6GeCl5J0cGMQezINBGdwAuCXoMfoQhnz1X1nQ5Bf7YqeNo@vger.kernel.org
X-Gm-Message-State: AOJu0Ywcm/4byi+wsiV2aIwv7DLN5G4kdgGmiWGMN7NsMFF3jPAjdQzl
	JfD0YFdZsEbRE5sBhjs8XHxi0nDsS86LiHB/cU/oQTYzbImJi/cC7Eidy+TGTAE=
X-Gm-Gg: ASbGncsSHwD/n+9PoNXMeNQMjohcVAFvu9+5KITRZoKIjc43OOjddYodEbIMniXlQ3N
	fLwbPsS0lfzMAhj+o4G58Q8Ja8BWMKkugRiVT5pNeuHkyZVEXCseviwsbVF5TcBnf6P00kDEDyh
	dfjbObP19Z877yQ9/Fq1+V/rkovt7AkrfCNejRvde5ZrWmtdsrJs5ROSb2IXWqAE19VuTlrE1YR
	BJTRmkS/ksDtbAIMQsEMaH0tb8RDGY36XNoaVmbwRdMN2XF5Hc1cOigaJ6NW8/hORRxyItCZrlM
	ppkSH/8jgBXWiXzPRT/68m9Li1n0/66hem8bsoZwQFBsuzXjCg4asILmlfeFPkAGm2hVJoO4H83
	7PrxkAildkv/UcNe1wG+K2n87j4Rb8FzmpCESy1Hg
X-Google-Smtp-Source: AGHT+IEYqZAFYZKYrz+u193B49EVQbbzdIFAS4Wfq/j01I9AzzmfuYvC63wlDKaLbJ6eOErmHeIBFA==
X-Received: by 2002:a5d:6489:0:b0:385:f6f4:f8e with SMTP id ffacd0b85a97d-38bf57bd824mr34624997f8f.50.1737968766559;
        Mon, 27 Jan 2025 01:06:06 -0800 (PST)
Received: from ?IPV6:2a01:cb05:949d:5800:e3ef:2d7a:4131:71f? (2a01cb05949d5800e3ef2d7a4131071f.ipv6.abo.wanadoo.fr. [2a01:cb05:949d:5800:e3ef:2d7a:4131:71f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c2a1c418esm10531513f8f.95.2025.01.27.01.06.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Jan 2025 01:06:06 -0800 (PST)
Message-ID: <b1a369e2-938b-49ed-b743-6562f0bb46f9@smile.fr>
Date: Mon, 27 Jan 2025 10:06:05 +0100
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: sdhci-omap: additional PM issue since 5.16
To: David <daowens01@gmail.com>, linux-omap@vger.kernel.org
Cc: linux-mmc@vger.kernel.org, Ulf Hansson <ulf.hansson@linaro.org>,
 Tony Lindgren <tony@atomide.com>
References: <1c5f72c4-3d55-4d62-b690-8c68b76a15d2@gmail.com>
 <f6732c49-a5b1-4a13-b9f6-c2d552b5e7e8@smile.fr>
 <31717d89-432c-4b77-a974-99f7e6b97f97@gmail.com>
 <9168d127-06a7-46e6-a7a2-f2e60032a50e@gmail.com>
Content-Language: en-US
From: Romain Naour <romain.naour@smile.fr>
In-Reply-To: <9168d127-06a7-46e6-a7a2-f2e60032a50e@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hello David, All,

Le 24/01/2025 à 19:49, David a écrit :
> 
> On 1/24/25 11:15, David Owens wrote:
>> Hi Romain
>>
>> On 1/24/25 04:36, Romain Naour wrote:
>>> Hello David,
>>>
>>> Le 23/01/2025 à 23:09, David Owens a écrit :
>>>> Hello,
>>>>
>>>> I have a AM574x system and encountered an eMMC regression when upgrading from 5.15 to 6.1.38.  The eMMC is using mmc-hs200 powered at 1.8v.  Reads from /dev/mmcblk1boot0 will return expected data except when a delay of several seconds is inserted between reads.  With a delay between reads, the read will occasionally (~50% of the time) return garbage data.  Using hexdump, I was able to determine that the "bad" data is actually coming from /dev/mmcblk1, not /dev/mmcblk1boot0.  The same thing happens when reading from /dev/mmcblk1boot1.
>>>>
>>>> Much like a previous report in the linux-omap mailing list [1], I too was able to correct the regression by reverting the commit "mmc: sdhci-omap: Allow SDIO card power off and enable aggressive PM" [2].  Unlike the previous report, applying the sdhci-omap patch [3] did not resolve my issue.  Only reverting the original commit allowed for reliable reads from /dev/mmcblk1boot0.  I also don't see the same I/O errors mentioned in the previous posting.  Reads always succeed and return the correct amount of data, its just from the wrong device.
>>> Interesting, can you share a test script to reproduce your issue?
>> Here is a test script I've been running on my devices.  A failure is typically
>> detected after a minute or two.  I include the eMMC part type in the output as
>> we've used a couple different parts in production, all claiming to be compatible
>> and I'm starting to wonder if the failure is a combination of the aggressive
>> PM _and_ specific emmc parts.  The offset used in hexdump was just a place in
>> both mmcblk1 and mmcblk1boot0 that was non-zero.  The issue happens using any
>> offset.
>>
>> #!/bin/bash
>>
>> echo "Kernel:    $(uname -r)"
>> echo "eMMC part: $(dmesg | grep 'mmcblk1: mmc1:0001' | awk '{print $5}')"
>> BLK1=$(hexdump -C /dev/mmcblk1 -s 0x3fc000 -n 10 | head -n 1)
>> BOOT=$(hexdump -C /dev/mmcblk1boot0 -s 0x3fc000 -n 10 | head -n 1)
>>
>> echo "/dev/mmcblk1:      ${BLK1}"
>> echo "/dev/mmcblk1boot0: ${BOOT}"
>>
>> while [[ "$BLK1" != "$BOOT" ]]; do
>>     sleep 20
>>     BOOT=$(hexdump -C /dev/mmcblk1boot0 -s 0x3fc000 -n 10 | head -n 1)
>>     echo "/dev/mmcblk1boot0: ${BOOT}"
>> done
>>
>> echo "/dev/mmcblk1boot0 read failure"
>>
>>> Why 6.1.38? nowadays the 6.1.x stable is 6.1.127 already.
>>> Can you test with the latest stable release?
>> Good question.  I can certainly update to .127 but at the time we were shipping
>> units we were on .38 so that's where I've been doing all my testing.  I'll let
>> you know how running under .127 compares.
> 
> Testing with 6.1.127 shows the same behavior.

Thanks for testing.

I'm able to reproduce the issue locally (using a kernel 6.1.112).
It fail after the first sleep 20...

If I remove MMC_CAP_AGGRESSIVE_PM from the sdhci-omap driver the issue is gone.

About sdhci-omap driver, It's one of the only few enabling
MMC_CAP_AGGRESSIVE_PM. I recently switched to a new project using a newer SoC
but the eMMC driver doesn't event set MMC_CAP_AGGRESSIVE_PM.

I'm wondering if MMC_CAP_AGGRESSIVE_PM is really safe (or compatible) for
HS200/HS400 eMMC speed. Indeed, MMC_CAP_AGGRESSIVE_PM has been added to
sdhci-omap driver to support SDIO WLAN device PM [1].

I've found another similar report on the Beaglebone-black (AM335x SoC) [2].

It seems the MMC_CAP_AGGRESSIVE_PM feature should only be enabled to SDIO cards.

The TRM (SoC manual) says that "Suspend-Resume Flow" is only supported for SDIO
cards:

  26.5.1.2.1.6 Suspend-Resume Flow
    The suspend-and-resume feature is supported only by SDIO cards.

Thoughts?

[1]
https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=3edf588e7fe00e90d1dc7fb9e599861b2c2cf442

[2]
https://e2e.ti.com/support/processors-group/processors/f/processors-forum/1332523/beagl-bone-black-problems-reading-from-emmc-boot-partitions-on-beaglebone-with-kernel-6-1

Best regards,
Romain


> 
>>> I believe this issue could be reproduced on the beaglebone-ai board (I don't
>>> have it).
>>>
>>> [1] https://www.beagleboard.org/boards/beaglebone-ai
>> Thanks for the suggestion, I'll see if I can dig one up.
>>
>>> Best regards,
>>> Romain
>>>
>>>
>>>> [1] https://lore.kernel.org/all/2e5f1997-564c-44e4-b357-6343e0dae7ab@smile.fr/
>>>>
>>>> [2] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=3edf588e7fe00e90d1dc7fb9e599861b2c2cf442
>>>>
>>>> [3] https://lore.kernel.org/linux-omap/20240315234444.816978-1-romain.naour@smile.fr/T/#u
>>>>
>>>> Regards,
>>>>
>>>> Dave
>>>>
> Thanks,
> 
> Dave
> 


