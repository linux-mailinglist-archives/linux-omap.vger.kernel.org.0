Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3F877376296
	for <lists+linux-omap@lfdr.de>; Fri,  7 May 2021 11:03:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236705AbhEGJEL (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 7 May 2021 05:04:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40680 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236690AbhEGJEI (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 7 May 2021 05:04:08 -0400
X-Greylist: delayed 2161 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Fri, 07 May 2021 02:03:09 PDT
Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [IPv6:2a01:488:42:1000:50ed:8234::])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 46272C061574;
        Fri,  7 May 2021 02:03:09 -0700 (PDT)
Received: from ip4d14bd53.dynamic.kabel-deutschland.de ([77.20.189.83] helo=[192.168.66.200]); authenticated
        by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
        id 1levp9-0004o6-Bo; Fri, 07 May 2021 10:27:03 +0200
To:     Tony Lindgren <tony@atomide.com>,
        Naresh Kamboju <naresh.kamboju@linaro.org>
Cc:     "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, lkft-triage@lists.linaro.org,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux-OMAP <linux-omap@vger.kernel.org>,
        regressions@lists.linux.dev,
        Benoit Cousson <bcousson@baylibre.com>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
References: <CA+G9fYtTN6ug3eBAW3wMcDeESUo+ebj7L5HBe5_fj4uqDExFQg@mail.gmail.com>
 <YJPYvsdkfx4JD4vT@atomide.com>
 <CA+G9fYv48aJ6tmSaf_HtRKHse4yN40hEYSPR5=A3W6HRoJ8p_g@mail.gmail.com>
 <YJTz+D9Sp8Eyp+iw@atomide.com>
From:   Thorsten Leemhuis <linux@leemhuis.info>
Subject: Re: #regzb introduced: 98feab31ac49 ("ARM: OMAP2+: Drop legacy
 platform data for dra7 sata")
Message-ID: <e896704c-c13a-739d-0723-22fec35406ed@leemhuis.info>
Date:   Fri, 7 May 2021 10:27:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <YJTz+D9Sp8Eyp+iw@atomide.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-BZ
Content-Transfer-Encoding: 8bit
X-bounce-key: webpack.hosteurope.de;linux@leemhuis.info;1620378189;540b3e67;
X-HE-SMSGID: 1levp9-0004o6-Bo
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 07.05.21 10:02, Tony Lindgren wrote:
> * Naresh Kamboju <naresh.kamboju@linaro.org> [210506 15:19]:
>> On Thu, 6 May 2021 at 17:23, Tony Lindgren <tony@atomide.com> wrote:
>>> * Naresh Kamboju <naresh.kamboju@linaro.org> [210506 11:00]:
>>>> Our bisect script pointed this as the first bad commit on linux
>>>> mainline master branch.
>>>> commit 98feab31ac491400f28b76a04dabd18ce21e91ba
>>>> Author: Tony Lindgren <tony@atomide.com>
>>>> Date:   Wed Mar 10 14:03:51 2021 +0200
>>>>     ARM: OMAP2+: Drop legacy platform data for dra7 sata
>>> Thanks for the report, looks like we are now missing the sata related
>>> quirk flags compared to the patch above.
>>> Below is a quick patch to add the missing quirk flags that might help
>>> if you can give it a try.
>> The reported problem was solved by this patch. Thank you.
>> Please add reported and tested by tags.
>> Reported-by: Naresh Kamboju <naresh.kamboju@linaro.org>
>> Tested-by: Naresh Kamboju <naresh.kamboju@linaro.org>
> OK good to hear and thanks for testing. Will send out a proper patch.

Great to see that this is about to be fixed. And Naresh, many thx for
giving the #regzb tag a try, even if regzbot (shameless plug for the
unaware: https://linux-regtracking.leemhuis.info/post/regzbot-approach/
) is not up and running already, much appreciated!

But FWIW, you don't need to add the tag to the subject; in fact, better
use it for it's intended purpose. Instead add the tag to the mail's
body, like this:

#regzb introduced: 98feab31ac49 ("ARM: OMAP2+: Drop legacy platform data
for dra7 sata")

Just ensure there is a blank line after that, as regzbot will have to
deal with line breaks (as can be seen above) and somehow needs to decide
where to stop. ;-)

Ohh, and Tony, if you want to do me a favour please include

Link:
https://lore.kernel.org/regressions/CA+G9fYtTN6ug3eBAW3wMcDeESUo+ebj7L5HBe5_fj4uqDExFQg@mail.gmail.com/

in the commit message of the fix, then I have some real data already at
hand to test regzbot in practice. :-D

Ciao, Thorsten
