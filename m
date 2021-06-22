Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 88C5D3AFD01
	for <lists+linux-omap@lfdr.de>; Tue, 22 Jun 2021 08:21:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229629AbhFVGXb (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 22 Jun 2021 02:23:31 -0400
Received: from gecko.sbs.de ([194.138.37.40]:57318 "EHLO gecko.sbs.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229620AbhFVGXb (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 22 Jun 2021 02:23:31 -0400
X-Greylist: delayed 329 seconds by postgrey-1.27 at vger.kernel.org; Tue, 22 Jun 2021 02:23:30 EDT
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
        by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id 15M6FUwD013324
        (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 22 Jun 2021 08:15:30 +0200
Received: from [167.87.93.200] ([167.87.93.200])
        by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 15M6FTtU011380;
        Tue, 22 Jun 2021 08:15:29 +0200
Subject: Re: [PATCH] serial: 8250: 8250_omap: Fix possible interrupt storm
To:     Vignesh Raghavendra <vigneshr@ti.com>,
        Tony Lindgren <tony@atomide.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Jiri Slaby <jirislaby@kernel.org>, linux-serial@vger.kernel.org,
        linux-omap@vger.kernel.org,
        Linux ARM Mailing List <linux-arm-kernel@lists.infradead.org>,
        linux-kernel@vger.kernel.org
References: <20210511151955.28071-1-vigneshr@ti.com>
 <YJ008MjjewRUTn9Z@kroah.com> <YLCCJzkkB4N7LTQS@atomide.com>
 <e5b35370-bf2d-7295-e2fd-9aee5bbc3296@ti.com>
From:   Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <0ad948ac-f669-3d6d-5eca-4ca48d47d6a3@siemens.com>
Date:   Tue, 22 Jun 2021 08:15:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <e5b35370-bf2d-7295-e2fd-9aee5bbc3296@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 28.05.21 08:11, Vignesh Raghavendra wrote:
> Hi,
> 
> On 5/28/21 11:09 AM, Tony Lindgren wrote:
>> Hi Greg, Vignesh & Jan,
>>
>> * Greg Kroah-Hartman <gregkh@linuxfoundation.org> [210513 14:17]:
>>> On Tue, May 11, 2021 at 08:49:55PM +0530, Vignesh Raghavendra wrote:
>>>> It is possible that RX TIMEOUT is signalled after RX FIFO has been
>>>> drained, in which case a dummy read of RX FIFO is required to clear RX
>>>> TIMEOUT condition. Otherwise, RX TIMEOUT condition is not cleared
>>>> leading to an interrupt storm
>>>>
>>>> Cc: stable@vger.kernel.org
>>>
>>> How far back does this need to go?  What commit id does this fix?  What
>>> caused this to just show up now vs. previously?
> 
> Sorry, I missed this reply. Issue was reported on AM65x SoC with custom
> test case from Jan Kiszka that stressed UART with rapid baudrate changes
> from 9600 to 4M along with data transfer.
> 
> Based on the condition that led to interrupt storm, I inferred it to
> affect all SoCs with 8250 OMAP UARTs. But that seems thats not the best
> idea as seen from OMAP3 regression.
> 
> Greg,
> 
> Could you please drop the patch? Very sorry for the inconvenience..
> 
>>
>> I just noticed this causes the following regression in Linux next when
>> pressing a key on uart console after boot at least on omap3. This seems
>> to happen on serial_port_in(port, UART_RX) in the quirk handling.
>>
>> Vignesh, it seems this quirk needs some soc specific flag added to
>> it maybe? Or maybe UART_OMAP_RX_LVL register is not available for
>> all the SoCs?
>>
> 
> Yes indeed :(
> 
>> I think it's best to drop this patch until the issues are resolved,
>> also there are some open comments above that might be answered by
>> limiting this quirk to a specific range of SoCs :)
>>
> 
> Oops, I did test patch AM33xx assuming its equivalent to OMAP3, but UART
> IP is quite different. I will respin the patch making sure, workaround
> applies only to AM65x and K3 SoCs.
> 
> Regards
> Vignesh
> 

What's the status here for AM65x? The issue remains present on that
platform, and I was hoping to see a quick follow up that limit the fix
to that target.

Jan

-- 
Siemens AG, T RDA IOT
Corporate Competence Center Embedded Linux
