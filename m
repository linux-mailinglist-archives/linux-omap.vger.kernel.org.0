Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8365A12F992
	for <lists+linux-omap@lfdr.de>; Fri,  3 Jan 2020 16:11:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727701AbgACPLr (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 3 Jan 2020 10:11:47 -0500
Received: from mout.gmx.net ([212.227.17.21]:50351 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725890AbgACPLr (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Fri, 3 Jan 2020 10:11:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1578064290;
        bh=YISjgU0LkPsoxH02G0LFkI5q7bEgpyrZfIb0+h+ulUk=;
        h=X-UI-Sender-Class:Subject:To:Cc:References:From:Date:In-Reply-To;
        b=WG3YwSHKgjo0liW877dr3/99Pul/LL280aWbC6AOoh5Ya+g2dmWSaRqA9YBqudi2I
         GD0EXNMEhOgLDHAOLPRGiKZHu0/pUzNt2wKAf6c3uJXwIZoYH0jd8kf8GLwFGaOjXs
         EGGjE4c8qhueo0K6FVDFKgSFn2bczUfYAT9DRuC0=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.1.176] ([37.4.249.154]) by mail.gmx.com (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1M72oB-1ineOr3HOZ-008e9D; Fri, 03
 Jan 2020 16:11:30 +0100
Subject: Re: Droid 4 regression in 5.5-rc1, armsoc-soc tree
To:     Pavel Machek <pavel@ucw.cz>
Cc:     Arnd Bergmann <arnd@arndb.de>, Marcel Partap <mpartap@gmx.net>,
        Tony Lindgren <tony@atomide.com>, merlijn@wizzup.org,
        martin_rysavy@centrum.cz,
        kernel list <linux-kernel@vger.kernel.org>,
        Sebastian Reichel <sre@kernel.org>, nekit1000@gmail.com,
        Olof Johansson <olof@lixom.net>,
        linux-omap <linux-omap@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
References: <20191228162929.GA29269@duo.ucw.cz>
 <20191228193622.GA13047@duo.ucw.cz> <20191230173507.GM35479@atomide.com>
 <20200102110025.GA29035@amd>
 <CAK8P3a2Ya+GZRRA_THZBVDq7SWO8UYoUPwW5fEyorCVjPnd1qA@mail.gmail.com>
From:   Stefan Wahren <wahrenst@gmx.net>
Message-ID: <4839ea34-ba1a-c127-46f9-c574d19f0c4f@gmx.net>
Date:   Fri, 3 Jan 2020 16:11:27 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <CAK8P3a2Ya+GZRRA_THZBVDq7SWO8UYoUPwW5fEyorCVjPnd1qA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Provags-ID: V03:K1:kYG6Nb4oG+yRmH+rLW9ZUUc/J/8Z/6PHmEmxCf7e1Jsxya2J1VO
 DVQ7K2NBhm1i2LX1zuvk6mhR0O4xN4x4QwgJAerpaB2BOpNruC8ReRmxe3byj7MbVR/2Qjx
 mNX5cwBwPYRO+/og3RVZJX5RW94fj47xdNgvUrpDtpSCOIv8kNRPPg3YzQyeYCj0JkXhhRd
 DA5yFWIR5mLFTFbvBUl8A==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:U90eUWHdTrM=:DL5xM7BSWsUGb2oQMbSvR6
 1tH+V9uV/xlmNSjLLgGm3gNulXN5OkIXEiylMuVDBjyFG8+1KMfPRAYh9B14iduCiGMcav6yA
 D+E4lwUoV7XziEOsAw7QxeYHAjaZvRa83ahGt0kr7lm+iJXpvcGN2mDHk2Z6dwOxCJvxhN7Og
 GiAACjtG7GBVHM0/5KZZMn4+XQmUaPaIfUX0YkvveCA0WiEuKIrv/4x3jlYofukiJx7mGcHr7
 yQ56+FzRVLiZXC7WJ6d+rnAXZ2thXEeMmvBtjd6x7PTqkHBMN8sQuVe1ljPG0Nb1mNVmu9CLb
 8CHVU9cksihaq1Amb5oF26djNH38OpJ2klE15pfdp/OIbRlJFqSv6BPYIPbGToBbLv91wnOce
 gxHguietSpYk1LN1JTaIuDQtvG1Ew+eCt1nVJjp0O1EEVgIM2yANeN9mq4NU1Q5F4JtClNaMz
 cVRAaz63FxnqjVI3stPaOhwetOWqJ5+dZOguM2NPYSvXvgMUsotoNBVL/bPDNTbgKT6LNyLOm
 EBYJiA5FwoO3QUvi6p7hviTXCTL+nXk5G4qYwJu44IIj5lv1987f2s4Yf+fVeTef6x1rPcSqf
 XuK3jKN28q/5tVJW8CLqFVWFfx7n5dyZJuVfQYhBj5cGJFvQStelyVB+kn9MXS5W9n5fCbM5n
 nKq+U6JyXOCnMtTSyBmXyWpg5jPkP7Q3Or1RkRK7GcI3vKE3Sn5SnAPMolHKJHHGJqnWtTCm6
 +RopbgMUSPbA+3IbWTZ7Fb2bkU16GbXW77H25Vx8kGypidEpZCJJoIGfI20nHwyCvN5WIU3EE
 PRDi+noMg3Qtu3xDGORRf+qt3JDyA9IlEoBHUbQz7HATR7wskQtbKoJLA+cMxrbHA4AXf2tOv
 XV8k28yq1QDnw51y535zOJgXIyDIT3XgmROTC/pWDjFE2BEWmsEKyRSS+v0QkR7eR2fra+RBY
 xvmprMNNBdw/0ZIIxLI/m4H5yB/NsHTBWOA7TEARlqbCLmjASXdBHPdQZIxqJsGxkb2Tarh7U
 nO6p8joqjTP18HDgXzat0p9/7P/1BkoACUJaFt3j3lSoSYePp1PppvCAfW/HR1bu+lqP7yXoS
 HMNGWTDdy0TYGfPHAjpfamHKPKkXvvKkq6HpEj0dsov75CGuXePa7Wa9NYnzLSaH5DFP+Mm5c
 ona1ZS73SjaHvglcQNtTXIfW5RxSpKUedKBIW9SFhXuo9Q51xDd8M93MiWFS6ZMIShHraQITN
 9MxvrOnOlGw4SXnGsneSz1vbcla+mNxk75OG+8lfZEp3UYANUha5/0qxXqkE=
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Pavel,

Am 02.01.20 um 12:49 schrieb Arnd Bergmann:
> On Thu, Jan 2, 2020 at 12:00 PM Pavel Machek <pavel@ucw.cz> wrote:
>> On Mon 2019-12-30 09:35:07, Tony Lindgren wrote:
>>> * Pavel Machek <pavel@ucw.cz> [191228 19:37]:
>>>> Hi!
>>>>
>>>>> 5.4-based kernel works ok on my droid 4.
>>>>>
>>>>> 5.5-rc3 based kernel has problems; it reboots when I try to kexec it.
>>>>>
>>>>> Vanilla 5.5-rc3 reboots, too.
>>>>>
>>>>> If you have any ideas, let me know.
>>>> I managed to get partial serial dump. This should be 5.5-rc3: And then
>>>> a bit better serial dump (below). But it is silent for few seconds,
>>>> and then it restarts...
>>> If spi or regulators have problems, nothing will really work..
>> arm-soc merge seems to be responsible:
>>
>> bad 38206c24ab09b4f4c2a57de5c1af0bb2e69cf5b6 Merge tag 'armsoc-soc' of
>> good d9e48dc2a71a836f17d1febbedb31470f957edb4 Merge tag
>>
>>                                                                         Pavel
>>
>> # bad: [738d2902773e30939a982c8df7a7f94293659810] Merge git://git.kernel.org/pub/scm/linux/kernel/git/netdev/net
>> # good: [219d54332a09e8d8741c1e1982f5eae56099de85] Linux 5.4
>> git bisect start '738d2902773e' '219d54332a09'
>> # bad: [46cf053efec6a3a5f343fead837777efe8252a46] Linux 5.5-rc3
>> git bisect bad 46cf053efec6a3a5f343fead837777efe8252a46
>> # bad: [e42617b825f8073569da76dc4510bfa019b1c35a] Linux 5.5-rc1
>> git bisect bad e42617b825f8073569da76dc4510bfa019b1c35a
>> # good: [9a3d7fd275be4559277667228902824165153c80] Merge tag 'driver-core-5.5-rc1' of git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/driver-core
>> git bisect good 9a3d7fd275be4559277667228902824165153c80
>> # good: [0b4295b5e2b9b42f3f3096496fe4775b656c9ba6] io_uring: fix a typo in a comment
>> git bisect good 0b4295b5e2b9b42f3f3096496fe4775b656c9ba6
>> # good: [056df578c2dcac1e624254567f5df5ddaa223234] Merge tag 'arc-5.5-rc1' of git://git.kernel.org/pub/scm/linux/kernel/git/vgupta/arc
>> git bisect good 056df578c2dcac1e624254567f5df5ddaa223234
>> # bad: [25cfb0c7de3f14e283a43dcd6de903657f9f98c7] Merge branch 'for-next' of git://git.kernel.org/pub/scm/linux/kernel/git/gerg/m68knommu
>> git bisect bad 25cfb0c7de3f14e283a43dcd6de903657f9f98c7
>> # bad: [38206c24ab09b4f4c2a57de5c1af0bb2e69cf5b6] Merge tag 'armsoc-soc' of git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc
>> git bisect bad 38206c24ab09b4f4c2a57de5c1af0bb2e69cf5b6
>> # good: [d9e48dc2a71a836f17d1febbedb31470f957edb4] Merge tag 'pwm/for-5.5-rc1' of git://git.kernel.org/pub/scm/linux/kernel/git/thierry.reding/linux-pwm
>> git bisect good d9e48dc2a71a836f17d1febbedb31470f957edb4
> In that branch, I see the following non-merge commits:
>
> ...
> 781fa0a95424 ARM: bcm: Add support for BCM2711 SoC
>
unfortunately this patch breaks multiplatform support and might be
affect you.

Please make sure this one is applied, while bisecting:

59034b9d6af8 ("ARM: bcm: Add missing sentinel to bcm2711_compat[]")

Sorry about this

Stefan

