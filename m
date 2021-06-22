Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 38A433B0F40
	for <lists+linux-omap@lfdr.de>; Tue, 22 Jun 2021 23:08:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229950AbhFVVK0 convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-omap@lfdr.de>); Tue, 22 Jun 2021 17:10:26 -0400
Received: from hostingweb31-40.netsons.net ([89.40.174.40]:38778 "EHLO
        hostingweb31-40.netsons.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229629AbhFVVKZ (ORCPT
        <rfc822;linux-omap@vger.kernel.org>);
        Tue, 22 Jun 2021 17:10:25 -0400
Received: from [77.244.183.192] (port=62262 helo=[192.168.178.41])
        by hostingweb31.netsons.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.94.2)
        (envelope-from <luca@lucaceresoli.net>)
        id 1lvncu-0003cS-4G; Tue, 22 Jun 2021 23:08:08 +0200
Subject: Re: [PATCH v2] PCI: dra7xx: Fix reset behaviour
To:     =?UTF-8?Q?Pali_Roh=c3=a1r?= <pali@kernel.org>,
        Kishon Vijay Abraham I <kishon@ti.com>
Cc:     Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        linus.walleij@linaro.org, linux-pci@vger.kernel.org,
        linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, Rob Herring <robh@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>
References: <20210531133211.llyiq3jcfy25tmz4@pali>
 <8ff1c54f-bb29-1e40-8342-905e34361e1c@lucaceresoli.net>
 <9fdbada4-4902-cec1-f283-0d12e1d4ac64@ti.com>
 <20210531162242.jm73yzntzmilsvbg@pali>
 <8207a53c-4de9-d0e5-295a-c165e7237e36@lucaceresoli.net>
 <20210622110627.aqzxxtf2j3uxfeyl@pali> <20210622115604.GA25503@lpieralisi>
 <20210622121649.ouiaecdvwutgdyy5@pali>
 <18a104a9-2cb8-7535-a5b2-f5f049adff47@lucaceresoli.net>
 <4d4c0d4d-41b4-4756-5189-bffa15f88406@ti.com>
 <20210622205220.ypu22tuxhpdn2jwz@pali>
From:   Luca Ceresoli <luca@lucaceresoli.net>
Message-ID: <2873969e-ac56-a41f-0cc9-38e387542aa1@lucaceresoli.net>
Date:   Tue, 22 Jun 2021 23:08:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210622205220.ypu22tuxhpdn2jwz@pali>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8BIT
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - hostingweb31.netsons.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - lucaceresoli.net
X-Get-Message-Sender-Via: hostingweb31.netsons.net: authenticated_id: luca@lucaceresoli.net
X-Authenticated-Sender: hostingweb31.netsons.net: luca@lucaceresoli.net
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 22/06/21 22:52, Pali Rohár wrote:
> On Tuesday 22 June 2021 19:27:37 Kishon Vijay Abraham I wrote:
>> Hi Luca, Pali,
>>
>> On 22/06/21 7:01 pm, Luca Ceresoli wrote:
>>> Hi,
>>>
>>> On 22/06/21 14:16, Pali Rohár wrote:
>>>> On Tuesday 22 June 2021 12:56:04 Lorenzo Pieralisi wrote:
>>>>> [Adding Linus for GPIO discussion, thread:
>>>>> https://lore.kernel.org/linux-pci/20210531090540.2663171-1-luca@lucaceresoli.net]
>>>>>
>>>>> On Tue, Jun 22, 2021 at 01:06:27PM +0200, Pali Rohár wrote:
>>>>>> Hello!
>>>>>>
>>>>>> On Tuesday 22 June 2021 12:57:22 Luca Ceresoli wrote:
>>>>>>> Nothing happened after a few weeks... I understand that knowing the
>>>>>>> correct reset timings is relevant, but unfortunately I cannot help much
>>>>>>> in finding out the correct values.
>>>>>>>
>>>>>>> However I'm wondering what should happen to this patch. It *does* fix a
>>>>>>> real bug, but potentially with an incorrect or non-optimal usleep range.
>>>>>>> Do we really want to ignore a bugfix because we are not sure about how
>>>>>>> long this delay should be?
>>>>>>
>>>>>> As there is no better solution right now, I'm fine with your patch. But
>>>>>> patch needs to be approved by Lorenzo, so please wait for his final
>>>>>> answer.
>>>>>
>>>>> I am not a GPIO expert and I have a feeling this is platform specific
>>>>> beyond what the PCI specification can actually define architecturally.
>>>>
>>>> In my opinion timeout is not platform specific as I wrote in email:
>>>> https://lore.kernel.org/linux-pci/20210310110535.zh4pnn4vpmvzwl5q@pali/
>>>>
>>>> My experiments already proved that some PCIe cards needs to be in reset
>>>> state for some minimal time otherwise they cannot be enumerated. And it
>>>> does not matter to which platform you connect those (endpoint) cards.
>>>>
>>>> I do not think that timeout itself is platform specific. GPIO controls
>>>> PERST# pin and therefore specified sleep value directly drives how long
>>>> is card on the other end of PCIe slot in Warm Reset state. PCIe CEM spec
>>>> directly says that PERST# signal controls PCIe Warm Reset.
>>>>
>>>> What is here platform specific thing is that PERST# signal is controlled
>>>> by GPIO. But value of signal (high / low) and how long is in signal in
>>>> which state for me sounds like not an platform specific thing, but as
>>>> PCIe / CEM related.
>>>
>>> That's exactly my understanding of this matter. At least for the dra7xx
>>> controller it works exactly like this, PERSTn# is nothing but a GPIO
>>> output from the SoC that drives the PERSTn# input of the external chip
>>> without affecting the controller directly.
>>>
>>
>> While the patch itself is correct, this kind-of changes the behavior on
>> already upstreamed platforms. Previously the driver expected #PERST to
>> be asserted be external means (or default power-up state) and only takes
>> care of de-asserting the #PERST line.
>>
>> There are 2 platforms that will be impacted due to this change
>> 1) arch/arm/boot/dts/am57xx-beagle-x15-common.dtsi (has an inverter on
>> GPIO line)
>> 2) arch/arm/boot/dts/am571x-idk.dts (directly connected to #PERST)
>>
>> For 1), gpiod_set_value(reset, 0) will assert the PERST line due to the
>> inverter (and GPIO_ACTIVE_LOW)
>> For 2), gpiod_set_value(reset, 0) will assert the PERST line because we
>> have GPIO_ACTIVE_HIGH
> 
> Ou! This is a problem in DT. It needs to be defined in a way that state
> is same for every DTS device which uses this driver.

Why? These are different boards and each specifies its own polarity.
They are already opposite to each other right now:

https://elixir.bootlin.com/linux/v5.13-rc7/source/arch/arm/boot/dts/am57xx-beagle-x15-common.dtsi#L602

https://elixir.bootlin.com/linux/v5.13-rc7/source/arch/arm/boot/dts/am571x-idk.dts#L196

-- 
Luca

