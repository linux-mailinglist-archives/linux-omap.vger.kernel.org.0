Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DE48D4B32B8
	for <lists+linux-omap@lfdr.de>; Sat, 12 Feb 2022 03:34:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229558AbiBLCeo (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 11 Feb 2022 21:34:44 -0500
Received: from gmail-smtp-in.l.google.com ([23.128.96.19]:45106 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229543AbiBLCen (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 11 Feb 2022 21:34:43 -0500
X-Greylist: delayed 915 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Fri, 11 Feb 2022 18:34:38 PST
Received: from m12-11.163.com (m12-11.163.com [220.181.12.11])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 982E429838
        for <linux-omap@vger.kernel.org>; Fri, 11 Feb 2022 18:34:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
        s=s110527; h=Message-ID:Date:MIME-Version:Subject:From; bh=6C4KV
        f/lOEQ0zwCrpQvbT9R2nNeS49cywD5C2J3GJbk=; b=WCIxmLUKlP38ji+8nYEw1
        aPUcaYF+rwVjlR22cqgsq+rcULpjQzfl/gpF78U5ETws1/M0MOz1WBm/pLtE4eSK
        WKBoH5UrndpzkpxSkQNhuIrtzyrIjjH6zQJ2/RgItN5yxfS2STn8hRoM3EIth/Fs
        PTeqA7Xyz49Ec//cH61U/k=
Received: from [192.168.3.109] (unknown [218.201.129.19])
        by smtp7 (Coremail) with SMTP id C8CowAAX5RkQGQdipbFdCg--.37108S2;
        Sat, 12 Feb 2022 10:18:56 +0800 (CST)
Message-ID: <bb16001d-4a1b-f842-9445-7305e3496997@163.com>
Date:   Sat, 12 Feb 2022 10:18:19 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: OMAP GPIO ready too later
To:     Tony Lindgren <tony@atomide.com>
Cc:     linux-omap@vger.kernel.org,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        Kevin Hilman <khilman@kernel.org>
References: <63abe475-710f-9ff5-ef20-c78b2a3d5e5c@163.com>
 <YfubSOB+uq9jYf/N@atomide.com>
From:   qianfan <qianfanguijin@163.com>
In-Reply-To: <YfubSOB+uq9jYf/N@atomide.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: C8CowAAX5RkQGQdipbFdCg--.37108S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7Kr4UJF48tw45Ww4fGF1UAwb_yoW8AFW5pF
        s7Aa4fKrykJw42kr18twnruF9YyFnrKF45XryDWryava45Wr98XryIya1Y9a4UWw4vgF1F
        vFWYv345XFW5AFJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07U4UDXUUUUU=
X-Originating-IP: [218.201.129.19]
X-CM-SenderInfo: htld0w5dqj3xxmlqqiywtou0bp/xtbBdhWl7WDkmudLCAAAsR
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org


在 2022/2/3 17:07, Tony Lindgren 写道:
> Hi,
>
> * qianfan <qianfanguijin@163.com> [220119 08:36]:
>> Hi everyone:
>>
>> On my board there has a gpio watchdong connected on am3358. And I found that
>> the omap gpio device ready too later so it takes about 5 seconds when the
>> gpio-wdt is ready.
>>
>> I had tested on some version of linux, check when the OMAP GPIO is ready.
>> Next is the log:
>>
>> v4.19 [    0.195191] OMAP GPIO hardware version 0.1
>>
>> v5.4  [    1.168868] OMAP GPIO hardware version 0.1
>>
>> v5.9  [    4.598052] OMAP GPIO hardware version 0.1
>>
>> v5.15 [    1.253851] OMAP GPIO hardware version 0.1
>>
>> I can't find which commit slowdown omap gpio driver. could you please give
>> me some advice?
> We've moved to probe pretty much everything at normal module_init time
> instead of trying to probe everything early. Only clocks and system timers
> need to be probed early for the omap variants.
>
> One of the reasons for the device drivers probing later on during the boot
> is caused by drivers/bus/ti-sysc.c. As ti-sysc is the parent device on the
> interconnect, none of it's child devices probe before it. And there should
> not be any need to probe ti-sysc early. The total boot-up time should be
> about the same, just the probe order has changed. If there are issues with
> the boot-up time in general, then that's a bug.
>
> Maybe you want to configure the watchdog in the bootloader initially until
> the Linux device drivers get probed?

Yes, the gpio watchdog is alived on bootloader, I want find a good way 
to feed it until linux driver ready.  gpio-wdt.c has an option 
CONFIG_GPIO_WATCHDOG_ARCH_INITCALL which will register gpio-wdt driver 
on arch_innitcall, but this feature doesn't work on am335x platform due 
to the gpio driver ready too later.

>
> Regards,
>
> Tony

