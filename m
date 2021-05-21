Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AAF5A38C4FC
	for <lists+linux-omap@lfdr.de>; Fri, 21 May 2021 12:32:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230414AbhEUKdu (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 21 May 2021 06:33:50 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:48932 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232694AbhEUKcX (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 21 May 2021 06:32:23 -0400
Received: from [192.168.1.111] (91-157-208-71.elisa-laajakaista.fi [91.157.208.71])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 648918D8;
        Fri, 21 May 2021 12:30:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1621593059;
        bh=6p0bVg/UmK+uYev1JVeL9BVbX3w24rY/vkcEb+2tA2I=;
        h=To:Cc:References:From:Subject:Date:In-Reply-To:From;
        b=Adv1enw3bO1mvH5CDCPxa/OtFUqjlUbiWx7aVfdlAbPliCbvm40phH4R/8iFA7Dd/
         LTp9jXBwAor2flclwiPnQ4ZFKIWs1IY0W/UYk+vdZ7dpJbf2RhFlGwRTLZNGOO3yrc
         bOgYQ+zxWnNZCkLhcFUg0dvXadCe65fbiImItMz4=
To:     Tony Lindgren <tony@atomide.com>
Cc:     linux-arm-kernel@lists.infradead.org, Nishanth Menon <nm@ti.com>,
        "Bajjuri, Praneeth" <praneeth@ti.com>, linux-omap@vger.kernel.org
References: <0f48c7e5-6acd-1143-35ef-3dea2255bec6@ideasonboard.com>
 <YKdG5rsNCRYVLDpj@atomide.com>
 <f71c2b05-9d11-f8a4-a0ff-c2c179eda7f0@ideasonboard.com>
 <YKdjyAYY1s8BXLAz@atomide.com>
 <064a9324-cfcf-47b9-6ae3-a29085a52683@ideasonboard.com>
 <YKd56/KAnIUIm7K5@atomide.com>
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: Re: Random stack corruption on v5.13 with dra76
Message-ID: <9e2e544d-4e3c-4171-9a37-fb582861e368@ideasonboard.com>
Date:   Fri, 21 May 2021 13:30:58 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <YKd56/KAnIUIm7K5@atomide.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 21/05/2021 12:14, Tony Lindgren wrote:
> * Tomi Valkeinen <tomi.valkeinen@ideasonboard.com> [210521 08:45]:
>> On 21/05/2021 10:39, Tony Lindgren wrote:
>>> * Tomi Valkeinen <tomi.valkeinen@ideasonboard.com> [210521 07:05]:
>>>> On 21/05/2021 08:36, Tony Lindgren wrote:
>>>>> * Tomi Valkeinen <tomi.valkeinen@ideasonboard.com> [210520 08:27]:
>>>>>> Hi,
>>>>>>
>>>>>> I've noticed that the v5.13 rcs crash randomly (but quite often) on dra76 evm
>>>>>> (I haven't tested other boards). Anyone else seen this problem?
>>>>>
>>>>> I have not seen this so far and beagle-x15 is behaving for me.
>>>>>
>>>>> Does it always happen on boot?
>>>>
>>>> No, but quite often. I can't really say how often, as it's annoyingly random.
>>>> I tried to bisect, but that proved to be difficult as sometimes I get multiple (5+)
>>>> successful boots before the crash.
>>>>
>>>> I tested with x15, same issue (below). So... Something in my kernel config? Or compiler?
>>>> Looks like the crash happens always very soon after (or during) probing palmas.
>>>
>>> After about 10 reboots with your .config I'm seeing it now too on
>>> beagle-x15. So far no luck reproducing it with omap2plus_defconfig.
>>
>> I think I have an easy way to see if a kernel is good or bad, by printing
>> stack_not_used(current) in the first call to omap_i2c_xfer_irq(). There's a
>> huge drop between v5.12 and v5.13-rc1.
>>
>> And interestingly, sometimes a simple printk seems to use hundreds of bytes
>> of stack (i.e. compare stack usage before and after the print). But not
>> always. So maybe the issue is somehow related to printk.
>>
>> I'm bisecting.
> 
> OK sounds good to me.

Well, I found the bad commit but unfortunately it doesn't exactly point 
where the issue is.

f483a3e123410bd1c78af295bf65feffb6769a98 is the first bad commit
commit f483a3e123410bd1c78af295bf65feffb6769a98
Author: Tony Lindgren <tony@atomide.com>
Date:   Wed Mar 10 14:03:48 2021 +0200

     ARM: dts: Configure simple-pm-bus for dra7 l4_per1

     We can now probe interconnects with device tree only configuration 
using
     simple-pm-bus and genpd.

     Tested-by: Kishon Vijay Abraham I <kishon@ti.com>
     Signed-off-by: Tony Lindgren <tony@atomide.com>

  arch/arm/boot/dts/dra7-l4.dtsi | 9 ++++++---
  1 file changed, 6 insertions(+), 3 deletions(-)


The difference is clear, though. With 
9a75368b6426739e8b798592f084cb682d760568, which is the last good commit, 
when I print the stack usage with stack_not_used() in three different 
places in omap_i2c_xfer_irq(), I get always prints roughly like:

STACK FREE omap_i2c_xfer_irq: 2972, 2972, 2972

And these repeat exactly the same for each call to omap_i2c_xfer_irq (at 
least during palmas probe).

With the bad commit the situation is different. The first call to 
omap_i2c_xfer_irq prints:

STACK FREE omap_i2c_xfer_irq: 2024, 2024, 2024

so we're already using 1k more. But then, instead of the stack usage 
staying the same, consecutive calls show increased stack usage. It 
doesn't increase for each xfer call, but after about 10 calls, I'm 
getting ~1800, ten calls more I see ~800, and going down to ~500.

However, with this bad commit, I don't see the empty stack going below 
~500, so I don't get crashes. But going to a more recent commit, like 
01d7136894410a71932096e0fb9f1d301b6ccf07, the situation is much worse. 
The first print shows:

STACK FREE omap_i2c_xfer_irq: 1164, 1164, 1164

and it quickly goes to stack overflow.

  Tomi
