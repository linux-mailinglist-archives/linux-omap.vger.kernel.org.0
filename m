Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 73826428762
	for <lists+linux-omap@lfdr.de>; Mon, 11 Oct 2021 09:04:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234684AbhJKHGM (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 11 Oct 2021 03:06:12 -0400
Received: from mail.kernel.org ([198.145.29.99]:52538 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234598AbhJKHFv (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 11 Oct 2021 03:05:51 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0F43461074;
        Mon, 11 Oct 2021 07:03:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1633935832;
        bh=LO3lJPfriqc1V81Pj+EgxCPgaz8IAMTHZRso2RCz3xU=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=EBv7WvHTp3KmMnBQHeLmxkHZlKqyHwL3UUV8nDlBHiwGkW98INtLvw2H8s+6/VywB
         o2AW/RDjkXHuO0Q7/0Bvx5GIiS+YLSHMt565C3sHZtZWI4Kt4y7YhBwnp1pgSHtsCj
         1vVGn1XwqD9VxUb0dgQgeB/8ecPheXQ6qPHiyp0t+WscYQGj9C5WDi9kW7V5cWsdMu
         UMgjGG8hMmIyqYC0C+NQ95IpCRyABG0c3c9CaOycNIZap+c3Bs26TGwRAgBPovevud
         8+D3g0Uw/wW6rM39WMgMeFlvESZLoLlouyng68+ziEFqig/IHJvTLtoTNvUpLX3yDp
         gTEugByM8No2A==
Subject: Re: [PATCH v5 0/8] dt-bindings: memory-controllers: ti,gpmc: Convert
 to yaml
To:     Tony Lindgren <tony@atomide.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     =?UTF-8?Q?Miqu=c3=a8l_Raynal?= <miquel.raynal@bootlin.com>,
        robh+dt@kernel.org, grygorii.strashko@ti.com, nm@ti.com,
        nsekhar@ti.com, devicetree@vger.kernel.org,
        linux-mtd@lists.infradead.org, linux-omap@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20211007120830.17221-1-rogerq@kernel.org>
 <6b90a6fd-001f-a41a-b69f-2bd3ec8a8e26@canonical.com>
 <e165b6ee-91d3-3a50-3b9d-3f15fa82a101@kernel.org>
 <64b65579-7153-1e7d-9866-77ce07fd1df5@canonical.com>
 <YWPRbmaJQN85wRIO@atomide.com>
From:   Roger Quadros <rogerq@kernel.org>
Message-ID: <f2125e81-07da-92ea-899a-d06ecae1919f@kernel.org>
Date:   Mon, 11 Oct 2021 10:03:48 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <YWPRbmaJQN85wRIO@atomide.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Tony,

On 11/10/2021 08:53, Tony Lindgren wrote:
> * Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com> [211009 14:56]:
>> On 08/10/2021 21:10, Roger Quadros wrote:
>>> Krzysztof,
>>>
>>> On 07/10/2021 20:37, Krzysztof Kozlowski wrote:
>>>> On 07/10/2021 14:08, Roger Quadros wrote:
>>>>> Hi,
>>>>>
>>>>> This series converts ti,gpmc memory controller and ti,gpmc-nand and
>>>>> ti,gpmc-onenand MTD controller bindings to yaml.
>>>>>
>>>>> cheers,
>>>>> -roger
>>>>>
>>>>
>>>> Hi,
>>>>
>>>> Although you did not mention it here, it looks like you have some
>>>> dependencies between the patches. Maybe this shall go simply via Rob's tree?
>>>>
>>>
>>> Rob has acked all the DT binding patches.
>>> So it is upto you and Miquèl to decide the best way. MTD tree or Memory controller tree
>>> for the dt-bindings patches.
>>>
>>> The ARM: dts changes should go via Tony's OMAP SoC tree.
>>>
>>> Or if Tony is OK with it then maybe all patches can go via Tony's tree? :)
>>>
>>
>>
>> I reviewed the two memory-controller patches, so feel free to take them
>> via MTD or OMAP SoC.
> 
> Sounds like I should pick up these because of the dts changes.

There is no dependency with the dts patches but it would be great if you can pick them all up.
Thanks!

cheers,
-roger
