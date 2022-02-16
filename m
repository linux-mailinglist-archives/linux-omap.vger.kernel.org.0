Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A74B64B7F19
	for <lists+linux-omap@lfdr.de>; Wed, 16 Feb 2022 05:06:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244453AbiBPEGm (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 15 Feb 2022 23:06:42 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:46962 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239345AbiBPEGj (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 15 Feb 2022 23:06:39 -0500
Received: from m12-14.163.com (m12-14.163.com [220.181.12.14])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 3288C6365
        for <linux-omap@vger.kernel.org>; Tue, 15 Feb 2022 20:06:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
        s=s110527; h=Message-ID:Date:MIME-Version:Subject:From; bh=F2fnS
        TLvvvEHBuPSziEG4GLktfZXvvy7S3qrcVUlmbE=; b=oNV9HYyciK+RtYMJNKAz+
        AcUGGZIuAcu28e4qv2k20fEF0Y9Mnev9QqyjILJnOKrUQ+ZLuQkAMhrSEfseMTkF
        DcaoI1F5S4IEUYTU5A3a7eFISEQq2HC7+tywPbiK9YwQxVWS2ME/QGRlJCTB7eLb
        K53ch+EQHIKT4RnFPxnHmg=
Received: from [192.168.3.109] (unknown [218.201.129.19])
        by smtp10 (Coremail) with SMTP id DsCowACX4hg0eAxiw8GHDQ--.9771S2;
        Wed, 16 Feb 2022 12:06:13 +0800 (CST)
Message-ID: <379b9e75-933c-902c-0f6e-807be9acebc5@163.com>
Date:   Wed, 16 Feb 2022 12:06:00 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: OMAP GPIO ready too later
To:     Tony Lindgren <tony@atomide.com>
Cc:     linux-omap@vger.kernel.org,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        Kevin Hilman <khilman@kernel.org>
References: <63abe475-710f-9ff5-ef20-c78b2a3d5e5c@163.com>
 <YfubSOB+uq9jYf/N@atomide.com> <bb16001d-4a1b-f842-9445-7305e3496997@163.com>
 <YgoJqP1xBsuqX2ui@atomide.com>
From:   qianfan <qianfanguijin@163.com>
In-Reply-To: <YgoJqP1xBsuqX2ui@atomide.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: DsCowACX4hg0eAxiw8GHDQ--.9771S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7KFW5Cw47GF43uFyxWF1xXwb_yoW8KFyfpF
        48Ca45Kr1ktw4jyr18tw1DuFyFyrnrKF15Xr1DGr10vas09r98XrZ2ya1Y9a4DWw4vgw1j
        vFyUt343XryUAFJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zRhqXXUUUUU=
X-Originating-IP: [218.201.129.19]
X-CM-SenderInfo: htld0w5dqj3xxmlqqiywtou0bp/1tbiXRWp7VWBnKwk9gAAs6
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


在 2022/2/14 15:50, Tony Lindgren 写道:
> * qianfan <qianfanguijin@163.com> [220212 02:18]:
>> 在 2022/2/3 17:07, Tony Lindgren 写道:
>>> Hi,
>>>
>>> * qianfan <qianfanguijin@163.com> [220119 08:36]:
>>>> Hi everyone:
>>>>
>>>> On my board there has a gpio watchdong connected on am3358. And I found that
>>>> the omap gpio device ready too later so it takes about 5 seconds when the
>>>> gpio-wdt is ready.
>>>>
>>>> I had tested on some version of linux, check when the OMAP GPIO is ready.
>>>> Next is the log:
>>>>
>>>> v4.19 [    0.195191] OMAP GPIO hardware version 0.1
>>>>
>>>> v5.4  [    1.168868] OMAP GPIO hardware version 0.1
>>>>
>>>> v5.9  [    4.598052] OMAP GPIO hardware version 0.1
>>>>
>>>> v5.15 [    1.253851] OMAP GPIO hardware version 0.1
>>>>
>>>> I can't find which commit slowdown omap gpio driver. could you please give
>>>> me some advice?
>>> We've moved to probe pretty much everything at normal module_init time
>>> instead of trying to probe everything early. Only clocks and system timers
>>> need to be probed early for the omap variants.
>>>
>>> One of the reasons for the device drivers probing later on during the boot
>>> is caused by drivers/bus/ti-sysc.c. As ti-sysc is the parent device on the
>>> interconnect, none of it's child devices probe before it. And there should
>>> not be any need to probe ti-sysc early. The total boot-up time should be
>>> about the same, just the probe order has changed. If there are issues with
>>> the boot-up time in general, then that's a bug.
>>>
>>> Maybe you want to configure the watchdog in the bootloader initially until
>>> the Linux device drivers get probed?
>> Yes, the gpio watchdog is alived on bootloader, I want find a good way to
>> feed it until linux driver ready.  gpio-wdt.c has an option
>> CONFIG_GPIO_WATCHDOG_ARCH_INITCALL which will register gpio-wdt driver on
>> arch_innitcall, but this feature doesn't work on am335x platform due to the
>> gpio driver ready too later.
> Well seems like the boottime of 1.25 seconds to having the gpio probed should
> be way longer than your bootloader configured watchdog timeout :) What do you
> have the bootloader set the watchdog timeout?
I had sniffer the gpio data by using logic analysis, when the linux 
gpio-wdt driver toggle watchdog pin, it passed about 5 seconds after the 
u-boot done. And the gpio watchdog's deadline is 1.6s.
>
> Regards,
>
> Tony

