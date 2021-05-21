Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1FF5C38C234
	for <lists+linux-omap@lfdr.de>; Fri, 21 May 2021 10:45:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232785AbhEUIq6 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 21 May 2021 04:46:58 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:47030 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230442AbhEUIq6 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 21 May 2021 04:46:58 -0400
Received: from [192.168.1.111] (91-157-208-71.elisa-laajakaista.fi [91.157.208.71])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id C43428D8;
        Fri, 21 May 2021 10:45:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1621586731;
        bh=WIs/t3U/kddeRP0vSywJKonvx676D72juDfNaO7cqkc=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=e2Un5NxX3Gh2pQL1HLaRtlF3OdVX0EDoBOp+zNnXP0/bflRKoEcQKUvMxDWIG2mws
         HAASKaYBq+Z42l6/U7fjdHhT+HSlKsGHQxEtnXk43XoPfKwnjhY4rE0XPD9a2gghOq
         fg/mPxubxUH/wVRo+ZUtWNXLXbpakntB/0GzLMVE=
Subject: Re: Random stack corruption on v5.13 with dra76
To:     Tony Lindgren <tony@atomide.com>
Cc:     linux-arm-kernel@lists.infradead.org, Nishanth Menon <nm@ti.com>,
        "Bajjuri, Praneeth" <praneeth@ti.com>, linux-omap@vger.kernel.org
References: <0f48c7e5-6acd-1143-35ef-3dea2255bec6@ideasonboard.com>
 <YKdG5rsNCRYVLDpj@atomide.com>
 <f71c2b05-9d11-f8a4-a0ff-c2c179eda7f0@ideasonboard.com>
 <YKdjyAYY1s8BXLAz@atomide.com>
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Message-ID: <064a9324-cfcf-47b9-6ae3-a29085a52683@ideasonboard.com>
Date:   Fri, 21 May 2021 11:45:29 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <YKdjyAYY1s8BXLAz@atomide.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 21/05/2021 10:39, Tony Lindgren wrote:
> * Tomi Valkeinen <tomi.valkeinen@ideasonboard.com> [210521 07:05]:
>> On 21/05/2021 08:36, Tony Lindgren wrote:
>>> * Tomi Valkeinen <tomi.valkeinen@ideasonboard.com> [210520 08:27]:
>>>> Hi,
>>>>
>>>> I've noticed that the v5.13 rcs crash randomly (but quite often) on dra76 evm
>>>> (I haven't tested other boards). Anyone else seen this problem?
>>>
>>> I have not seen this so far and beagle-x15 is behaving for me.
>>>
>>> Does it always happen on boot?
>>
>> No, but quite often. I can't really say how often, as it's annoyingly random.
>> I tried to bisect, but that proved to be difficult as sometimes I get multiple (5+)
>> successful boots before the crash.
>>
>> I tested with x15, same issue (below). So... Something in my kernel config? Or compiler?
>> Looks like the crash happens always very soon after (or during) probing palmas.
> 
> After about 10 reboots with your .config I'm seeing it now too on
> beagle-x15. So far no luck reproducing it with omap2plus_defconfig.

I think I have an easy way to see if a kernel is good or bad, by 
printing stack_not_used(current) in the first call to 
omap_i2c_xfer_irq(). There's a huge drop between v5.12 and v5.13-rc1.

And interestingly, sometimes a simple printk seems to use hundreds of 
bytes of stack (i.e. compare stack usage before and after the print). 
But not always. So maybe the issue is somehow related to printk.

I'm bisecting.

  Tomi
