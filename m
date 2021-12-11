Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C643E47135D
	for <lists+linux-omap@lfdr.de>; Sat, 11 Dec 2021 11:38:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230348AbhLKKiM (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sat, 11 Dec 2021 05:38:12 -0500
Received: from mail.wizzup.org ([95.217.97.174]:43700 "EHLO wizzup.org"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229514AbhLKKiM (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Sat, 11 Dec 2021 05:38:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=wizzup.org;
        s=mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:
        Date:Message-ID:References:Cc:To:From:Subject:Sender:Reply-To:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
        List-Post:List-Owner:List-Archive;
        bh=sAJNowm3kkhC7ahUo2fo2OC1xgItAFr1ZS00OA8jRs8=; b=d+ko8cSwaM8UWRcwXXjfa8JdwZ
        6VJ3I8sQbZdvkpujWiAgNc6DvhzEFTPZwBgHXQaaoIT2Ri063IUPzQ2frjflf8uz46gurw8YBmXmh
        lSHY85/bApSZhMdd+X+pwnBKxeXvFM58vVFZK5KjGD7kyxkhS8t3wkomqbuRmGe63DQYorOel+vQV
        HAxPOFcxRq419W3hMXmt/MziuLqXI6YL62aIg1V7oxgRse0xuUQAfL8N9RQQo5YXC4W/rRzFokOiA
        BnM73CYebUyO11tRJfFT6UrZ3UnV7ggZphCkkSVEwYrCQyQTSKOB7mjA+gXUtHFdj1jG5pXcPD3hH
        eTvPzpdg==;
Received: from [45.83.235.159] (helo=[0.0.0.0])
        by wizzup.org with esmtpsa  (TLS1.3) tls TLS_AES_128_GCM_SHA256
        (Exim 4.94.2)
        (envelope-from <merlijn@wizzup.org>)
        id 1mvzlV-0000zg-3W; Sat, 11 Dec 2021 10:38:05 +0000
Subject: Re: Nokia N900 OFF mode regression between v5.10 and v5.11
From:   Merlijn Wajer <merlijn@wizzup.org>
To:     Andreas Kemnade <andreas@kemnade.info>
Cc:     linux-omap <linux-omap@vger.kernel.org>,
        Tony Lindgren <tony@atomide.com>,
        Adam Ford <aford173@gmail.com>,
        Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dev Null <devnull@uvos.xyz>,
        "H. Nikolaus Schaller" <hns@goldelico.com>,
        Aaro Koskinen <aaro.koskinen@iki.fi>
References: <43cac03a-53c2-83dd-e1b0-4d25920d9095@wizzup.org>
 <20211211085403.3c1fcb0d@aktux>
 <4fa31761-e7d2-0995-2180-c52afeb39dfa@wizzup.org>
Message-ID: <93b272c8-1551-9f4d-7efc-4dc941e801b0@wizzup.org>
Date:   Sat, 11 Dec 2021 11:43:50 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <4fa31761-e7d2-0995-2180-c52afeb39dfa@wizzup.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 11/12/2021 11:23, Merlijn Wajer wrote:
> Hi Andreas,
> 
> On 11/12/2021 08:54, Andreas Kemnade wrote:
>> Hi,
>>
>> On Sat, 11 Dec 2021 00:20:24 +0100
>> Merlijn Wajer <merlijn@wizzup.org> wrote:
>>
>>> Hi Tony, Adam,
>>>
>>> I noticed that after I fixed the OFF mode regression between v5.9 and
>>> v5.10 that there are another one between v5.10 and v5.11. Fortunately,
>>> much like the other change it can be worked around with a config change,
>>> and in fact it looks like the commit identified by git bisect is indeed
>>> just a commit to change omap2plus_defconfig.
>>>
>>> a82820fcd079e38309403f595f005a8cc318a13c ("ARM: omap2plus_defconfig:
>>> Enable OMAP3_THERMAL") prevents the N900 from entering OFF mode pretty
>>> much all the time (I've seen scenarios with OFF:2,RET:500), but with the
>>> config change reverted, stuff like this is more common: OFF:13,RET:2
>>>
>>> We will probably to keep the thermal features enabled, but maybe we can
>>> figure out why it causes the SoC to not enter sleep modes?
>>
>> well, it was enabled after people agreed that is fixed... including me.
>> It was wrongly enabled some time before, then disabled again, fixed and
>> reenabled.
>> The mentioned commit was just after the fix. So what is different now?
> 
> I'll have to find the mails you are referring to, but I suspect that if
> the device wasn't hitting OFF mode on v5.10 because of the
> CONFIG_COMPACT=y option in omap2plus_defconfig, it might have masked
> this issue?

Correction: CONFIG_COMPAT=y is not in omap2plus_defconfig, but it does
get enabled by default since v5.10, so the above still holds.

Regards,
Merlijn

