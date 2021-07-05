Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A76CC3BBE02
	for <lists+linux-omap@lfdr.de>; Mon,  5 Jul 2021 16:10:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231421AbhGEOMt (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 5 Jul 2021 10:12:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48598 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231394AbhGEOMt (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 5 Jul 2021 10:12:49 -0400
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 68F62C061574
        for <linux-omap@vger.kernel.org>; Mon,  5 Jul 2021 07:10:11 -0700 (PDT)
Received: by mail-lj1-x22b.google.com with SMTP id k21so24865625ljh.2
        for <linux-omap@vger.kernel.org>; Mon, 05 Jul 2021 07:10:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:cc:references:from:subject:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=OdZYTiftP3sztHkdp6OFT92fCx9XkufzdKaqoXE/Mzg=;
        b=Xi/LY6n7Ocia1kSXm+s2WiwqWgNETA3QeaJgaP/f/uBSdziCLAzBswETzqcohamZbP
         befyWbXrKFIikXx/SSzs4DoatFjrpnS+XexUfZ8zTcTzB/LDHblf3Oxuj4DX9E/dYO6C
         IzWQs1HeNmgDcCaHJNZ5JNYg/mLe/AQXdkG18otZyAktwLJe5fxRv8n4gGvjnFmhDT18
         W96Y4fDcZO7IgtlnEm21hlie34vO8xxmZEFcIMplFMKHXGUozvYC48SN72hDtHwaPWmk
         AFyeXVtZlzvUmCMhTzfAvHEwMn2SZ5mJkxIs6UBP1iht2LCdL5A5L0LL/eQ+6lN2AdCh
         sZZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:cc:references:from:subject:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=OdZYTiftP3sztHkdp6OFT92fCx9XkufzdKaqoXE/Mzg=;
        b=gECB1RBqpRg8KmxInYJCHoiO5u7dUltn9uQPzNys7Cu/eB2TdRR614BuHjEC80qROS
         kuLqb5wii32X8XpTYa2w3TJ+pfC5rBZ3rvK6xbGegD7oi+2AQpZ0LPYga3n2qP/Opn9o
         FzDgDtjrW8apDJIlhWdcnRCPgGEod1r6zHY3iJYQPmiQB/pnqlkCe2H/ktlGLkWh1qER
         8QRs9o9pqgE0MeMqLeKkm2GFtBVNvSDQIdS+sm7xkzKl+1SIj9DLC3Ebj3fhOjCxwgc4
         UvKMp2MMMedpxN3cXob5uNRHDJ5lN5FXfMZopzkToA/4M4Nsox4f6mRX+dpLPpiiL1Hn
         5kSQ==
X-Gm-Message-State: AOAM532OtIe86hvH5ddl2ZjGynZLpg0pKWsOQrf8b2BQTsXQpsRDoQ2N
        VudX4Q37g5K/N1yWnptt95Ciin0QEGhnJmNP
X-Google-Smtp-Source: ABdhPJxiJcAfWRp9SnmDGTyaqdBgXo8GaVL7MZv37XgiNc2RTU6bYGKpfovOTE/FGAXGjg0841AOxg==
X-Received: by 2002:a2e:9f4c:: with SMTP id v12mr11240593ljk.179.1625494209278;
        Mon, 05 Jul 2021 07:10:09 -0700 (PDT)
Received: from [10.0.0.40] (91-155-111-71.elisa-laajakaista.fi. [91.155.111.71])
        by smtp.gmail.com with ESMTPSA id d4sm245484lfv.0.2021.07.05.07.10.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Jul 2021 07:10:08 -0700 (PDT)
To:     "H. Nikolaus Schaller" <hns@goldelico.com>
Cc:     Mark Brown <broonie@kernel.org>, tony@atomide.com,
        alsa-devel@alsa-project.org, lgirdwood@gmail.com,
        linux-omap@vger.kernel.org
References: <20210704150450.20106-1-peter.ujfalusi@gmail.com>
 <E1C17C0D-1363-4109-89B3-A652A2B47703@goldelico.com>
From:   =?UTF-8?Q?P=c3=a9ter_Ujfalusi?= <peter.ujfalusi@gmail.com>
Subject: Re: [PATCH 0/5] ASoC: ti: davinci-mcasp: Fix the DIT mode and OMAP4
 support
Message-ID: <e7a02ee7-6c44-f3e1-f3e7-19e908790246@gmail.com>
Date:   Mon, 5 Jul 2021 17:10:13 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <E1C17C0D-1363-4109-89B3-A652A2B47703@goldelico.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Nikolaus,

On 05/07/2021 16:32, H. Nikolaus Schaller wrote:
> Hi Péter,
> 
>> Am 04.07.2021 um 17:04 schrieb Peter Ujfalusi <peter.ujfalusi@gmail.com>:
>>
>> Hi,
>>
>> it has been on my todo list for several years to support McASP on OMAP4 devices.
>> For Galaxy Nexus we had an omap-mcasp driver (which was mostly a stripped down
>> davinci-mcasp driver) to support what was needed on that specific phone + it's
>> dock for S/PDIF (48KHz, 16bit, stereo).
>>
>> Not many (if any) device available to test the DIT mode of McASP.
>> I have used BeagleBone White (McASP1 AXR3 can be routed to a pin) to get the
>> S/PDIF mode working then PandaES for OMAP4 support (on PandaES the gpio_121 is
>> not used and the signal is routed to expansion J6 pin14)
>>
>> In theory the McASP in OMAP5 should be working after this series, but the OMAP5
>> TRM is not public and I do not have one to check the addresses and see if there
>> is a way to test it on omap5-uevm.
>>
>> Mark, Tony:
>> The ASoC and dts patches can go via separate tree I felt that it is better if
>> they are together, at least initially.
>>
>> Nikolaus: fyi, this might be useful for Pyra?
> 
> Yes, definitively.
> 
> I just wonder how compatible it is with the "old" omap-mcasp driver we carry
> along for the Pyra:
> 
> https://git.goldelico.com/?p=letux-kernel.git;a=blob;f=sound/soc/ti/omap-mcasp.c;h=24d839a24f34ec02456176744d3690016592b5a3;hb=7789ab635e56a2fd9fe04ca2e9ccfeaccb8e0f52
> 
> Does it now have additional functionality or robustness?

The davinci-mcasp with series does work on OMAP4. I could not made the
omap-mcasp working. I have picked the driver from pyra in hopes that it
is working so I will ahve a stable base.
Have you tested it?

the omap-mcasp supports only 48KHz and 16bit, no passthrough, no 24bit,
all is hardwired for the Galaxy Nexus setup, afaik.

The davinci-mcasp should be better all around, I think the PM side is
also more robust.

The other point is that I would not accept the omap-mcasp driver
upstream. The IP is the same so the driver should be also...

> And does it need changes of the OMAP5 device tree?

In a similar way as the dts patches in this series.
fwiw:
https://github.com/omap-audio/linux-audio/commit/2f0a632db0b52321f1fc3623d088a741aeb72ef7
is the patch I have for PandaES to get S/PDIF working.

> And also important seems to be the ABE/AESS integration where we so far failed
> to make it work again on more recent kernels.

The McASP is not routed via ABE/AESS, it has been always handled outside
of the firmware, so it is just a simple link outside.

> Our most recent patch set is here:
> 
> https://git.goldelico.com/?p=letux-kernel.git;a=shortlog;h=refs/heads/letux/aess-v5

Yes, I'm following it ;)

> Anyways I am happy to see a little progress on the omap4/5 audio subsystem.

It is in maintenance mode as there is not much of an interest outside of
a small group of people, but I try to help to get it better for Pyra.

> BR and thanks,
> Nikolaus
> 
> 
> 
>>
>> Regards,
>> Péter
>> ---
>> Peter Ujfalusi (5):
>>  ASoC: ti: davinci-mcasp: Fix DIT mode support
>>  ASoC: dt-bindings: davinci-mcasp: Add compatible string for OMAP4
>>  ASoC: ti: davinci-mcasp: Add support for the OMAP4 version of McASP
>>  ARM: dts: omap4-l4-abe: Correct sidle modes for McASP
>>  ARM: dts: omap4-l4-abe: Add McASP configuration
>>
>> .../bindings/sound/davinci-mcasp-audio.txt    |   1 +
>> arch/arm/boot/dts/omap4-l4-abe.dtsi           |  39 ++--
>> include/linux/platform_data/davinci_asp.h     |   1 +
>> sound/soc/ti/Kconfig                          |   1 +
>> sound/soc/ti/davinci-mcasp.c                  | 168 +++++++++++++++---
>> 5 files changed, 168 insertions(+), 42 deletions(-)
>>
>> -- 
>> 2.32.0
>>
> 

-- 
Péter
