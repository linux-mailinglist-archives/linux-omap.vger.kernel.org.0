Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0960F39BC1F
	for <lists+linux-omap@lfdr.de>; Fri,  4 Jun 2021 17:41:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229925AbhFDPnL (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 4 Jun 2021 11:43:11 -0400
Received: from 49-237-179-185.static.tentacle.fi ([185.179.237.49]:54782 "EHLO
        bitmer.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229809AbhFDPnK (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Fri, 4 Jun 2021 11:43:10 -0400
Received: from 88-114-184-142.elisa-laajakaista.fi ([88.114.184.142] helo=[192.168.1.48])
        by bitmer.com with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.89)
        (envelope-from <jarkko.nikula@bitmer.com>)
        id 1lpBwo-0005eF-VB; Fri, 04 Jun 2021 18:41:23 +0300
Subject: Re: Regression with 6cfcd5563b4f on BeagleBoard Rev C2
To:     Tony Lindgren <tony@atomide.com>
Cc:     linux-omap@vger.kernel.org
References: <68f28473-a196-b106-b4ae-e9162b7002e6@bitmer.com>
 <YLcXicwDxue0a52/@atomide.com>
 <5037cd3e-9c4f-0028-ceef-8315d297f2bc@bitmer.com>
 <YLnJowBaoJPyZWOk@atomide.com>
From:   Jarkko Nikula <jarkko.nikula@bitmer.com>
Message-ID: <3d73f5b4-dfb3-682e-e1dc-cf5feba69121@bitmer.com>
Date:   Fri, 4 Jun 2021 18:41:16 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <YLnJowBaoJPyZWOk@atomide.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 4.6.2021 9.35, Tony Lindgren wrote:
> Hi,
> 
> * Jarkko Nikula <jarkko.nikula@bitmer.com> [210602 18:21]:
>> Hi
>>
>> On 6/2/21 8:30 AM, Tony Lindgren wrote:
>>> Sounds like the beagleboard timer errata handling is either picking
>>> a wrong clockevent timer, or later on ti-sysc misdetects the active
>>> timer for clockevent and idles it.
>>>
>>> What does dmesg say in the beginning for clockevent and clocksource
>>> timers?
>>>
>> I attached logs from commit 6cfcd5563b4f and commit 30c66fc30ee7 before
>> it. Perhaps this is relevant difference between them?
>>
>> +ti-sysc: probe of 49032000.target-module failed with error -16
>> +ti-sysc: probe of 48304000.target-module failed with error -16
> 
> Yeah so it seems. We now attempt to ignore the system timer instances
> while it seems we need also block idling at least for timer12 that is
> used for the beagle timer.
> 
> Can you test the following patch and see if it helps?
> 
It works! I tested on top of both regressing commit and the most recent one:
6cfcd5563b4f ("clocksource/drivers/timer-ti-dm: Fix suspend and resume
for am3 and am4")
and
f88cd3fb9df2 ("Merge tag 'vfio-v5.13-rc5' of
git://github.com/awilliam/linux-vfio")

You may add:
Tested-by: Jarkko Nikula <jarkko.nikula@bitmer.com>
