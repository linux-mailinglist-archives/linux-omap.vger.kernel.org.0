Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4620146DE61
	for <lists+linux-omap@lfdr.de>; Wed,  8 Dec 2021 23:29:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237073AbhLHWdP (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 8 Dec 2021 17:33:15 -0500
Received: from mail.archive.org ([207.241.224.6]:39672 "EHLO mail.archive.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229533AbhLHWdP (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 8 Dec 2021 17:33:15 -0500
Received: from mail.archive.org (localhost [127.0.0.1])
        by mail.archive.org (Postfix) with ESMTP id B2A9C2FDB6;
        Wed,  8 Dec 2021 22:29:12 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on mail.archive.org
X-Spam-Level: 
X-Spam-Status: No, score=-100.0 required=5.0 tests=SHORTCIRCUIT,
        USER_IN_ALL_SPAM_TO autolearn=disabled version=3.4.2
Received: from [0.0.0.0] (unknown [45.83.235.159])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: merlijn@archive.org)
        by mail.archive.org (Postfix) with ESMTPSA id 10D282FDA3;
        Wed,  8 Dec 2021 22:29:10 +0000 (UTC)
Subject: Re: Oops while booting 5.15.2 on Nokia N900
To:     Andreas Kemnade <andreas@kemnade.info>, Pavel Machek <pavel@ucw.cz>
Cc:     "Merlijn B.W. Wajer" <merlijn@archive.org>,
        linux-omap <linux-omap@vger.kernel.org>,
        Tony Lindgren <tony@atomide.com>, Dev Null <devnull@uvos.xyz>,
        Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>,
        Sebastian Reichel <sre@kernel.org>,
        "H. Nikolaus Schaller" <hns@goldelico.com>
References: <12e13327-3bb5-229e-d784-cd528db4b58e@archive.org>
 <6fa3d07a-28e5-7853-e6ca-fc405d3080e4@archive.org>
 <c75ac850-7d9b-6263-a046-57c8f4435090@archive.org>
 <f463d8f2-109e-3040-4350-ce20d651ffe6@archive.org>
 <20211208205700.GA12125@duo.ucw.cz> <20211208220400.1f9cff00@aktux>
From:   "Merlijn B.W. Wajer" <merlijn@archive.org>
Message-ID: <ee94556b-2c35-c641-a86a-e9e70600aab7@archive.org>
Date:   Wed, 8 Dec 2021 23:34:53 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211208220400.1f9cff00@aktux>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-Envelope-From: <merlijn@archive.org>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi,

On 08/12/2021 22:04, Andreas Kemnade wrote:
> Hi,
> 
> On Wed, 8 Dec 2021 21:57:00 +0100
> Pavel Machek <pavel@ucw.cz> wrote:
> 
>> Hi!
>>
>> You may want to cc: linux-kernel@vger.kernel.org and
>> phone-devel@vger.kernel.org, since this is kernel issue.
>>
>>>> I am back with a bit more news, but no solution.  
>>>
>>> It looks like commit fb2c599f056640d289b2147fbe6d9eaee689f1b2 ("ARM:
>>> omap3: enable off mode automatically") is causing these failures on the
>>> Nokia N900. Reverting this commit on top of v5.10 (with
>>> 21b2cec61c04bd175f0860d9411a472d5a0e7ba1 also reverted), makes the
>>> problem go away (I tried 10 times).
>>>
>>> The same holds for 5.15.y, just reverting
>>> fb2c599f056640d289b2147fbe6d9eaee689f1b2 makes the system "stable" (at
>>> least the problem reported in the first email is gone).
>>>
>>> Perhaps the "pwrst->next_state" change is causing these problems, since
>>> I can enter OFF mode just fine with init=/bin/sh and a custom
>>> script?  
>>
>> fb2c599f056640d28 has some hints in it. Perhaps Andreas can mention
>> what boards he tested it on?
>>
> well, I tested it on gta04a4 and gta04a5 (both dm3730).
> There is one 1Ghz issue at least on the a5, so I disabled that opp.
> 
>> And rather than reverting it, we may want to delete ti,twl4030-idle*
>> hints from n900 device tree for now?
>>
> well, it has side effects on power consumption, power consumption
> should be worse without ti,twl4030-idle-*. So the real solution would
> be to understand what is causing the trouble here.

What I have seen is that if off mode is enabled from userspace
(debugfs), it does not cause a problem (or I don't hit the problem at
least). That said, my off mode tests are pretty minimal with
init=/bin/sh, and I haven't gotten a fully booted (with lots of modules
loaded, gui and daemons) system to enter off mode yet. But as noted
before, sometimes this problem would occur not on boot, but far into the
boot process (~4 minutes after power up), and that problem is also gone
now with the revert, so there's something going on...

I can't really comment on what would be causing the trouble specifically
(I'm not really familiar with omap pm), just noticed the regression for
the N900, where off mode does appear to work, but this commit/method
doesn't at least. I'm also not sure if removing the hint from the device
tree is the right way to go - I'm happy to see off mode getting some
more testing by turning it on by default.

Regards,
Merlijn
