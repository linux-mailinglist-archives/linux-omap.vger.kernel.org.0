Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 41781535BAD
	for <lists+linux-omap@lfdr.de>; Fri, 27 May 2022 10:39:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240644AbiE0IjS (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 27 May 2022 04:39:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48008 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350043AbiE0IjN (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 27 May 2022 04:39:13 -0400
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8DCCF1C4;
        Fri, 27 May 2022 01:39:03 -0700 (PDT)
Received: from mail-yb1-f172.google.com ([209.85.219.172]) by
 mrelayeu.kundenserver.de (mreue011 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1Mq33i-1nQAgZ1Y94-00nDIv; Fri, 27 May 2022 10:39:01 +0200
Received: by mail-yb1-f172.google.com with SMTP id h75so798240ybg.4;
        Fri, 27 May 2022 01:39:01 -0700 (PDT)
X-Gm-Message-State: AOAM531tgu9Asi/7eR+Cs2yOWv5lgPgtZO/MsEEm14coKJ0HWT+8HmCP
        D/TrLItKYoLcFQWdjRM/SLXGwWjOGiaI9SG6TPQ=
X-Google-Smtp-Source: ABdhPJzEo7a8c9x1PmwOPIv9w08b0Cr0payowd8d9tLS1ysIp5CnpPXkYNKvuilEu4rbxk7q2uzoxJxzLwVTi4XTW1U=
X-Received: by 2002:a25:4f0a:0:b0:64f:6a76:3d8f with SMTP id
 d10-20020a254f0a000000b0064f6a763d8fmr29686756ybb.134.1653640740129; Fri, 27
 May 2022 01:39:00 -0700 (PDT)
MIME-Version: 1.0
References: <CAK8P3a1YTBRO_pRZLqbNHwG4DaYA56tn1_E0g3c1VW0B-jz-qg@mail.gmail.com>
 <CAGm1_kuaRr3BFWSq-2v4vT0VbVvMX=kMHQsQ1KZnKe9UEff3MA@mail.gmail.com>
 <Yozpa3DlLLEzBR8W@atomide.com> <CAGm1_ku5EusuSJ9zhYZBRGdRUr8_NYsx3=BZQkuYtNJpq3Tn_w@mail.gmail.com>
 <Yo8cLxktTytqAEV3@atomide.com> <CAMj1kXEr848Jaxfk64wDgFHMmq-CLvgXtH_sfqVC-4DRLwCDqA@mail.gmail.com>
 <CAGm1_ksuNbMvg5tVOHswMRWQyX8ZA_U-49Ge6uoG0xV7x5viHA@mail.gmail.com>
 <CAK8P3a04Qc3Qkb2s1OmCFVKi=yrLReL4Np0JJYjskMWozBDr7Q@mail.gmail.com>
 <CAGm1_kvnqOz68UDL=n80kZd1UoUaPGJG10YvkxUnezg1rSf6Lg@mail.gmail.com>
 <CAK8P3a2qat95d14QDp7HfKmqm8Kw0s0WVeLH=GkgBwH2c7nJ8A@mail.gmail.com>
 <YpB0tdMHh/aBlfyk@atomide.com> <CAK8P3a3ocZDD9odfDe_WBeovHXCNU4CSScrmE4HVtLKef_z+EQ@mail.gmail.com>
 <CAGm1_ktOPgUSVjPP44Y49GgFLpDMrECu7eqQu7d2ZvJiOftWAQ@mail.gmail.com>
In-Reply-To: <CAGm1_ktOPgUSVjPP44Y49GgFLpDMrECu7eqQu7d2ZvJiOftWAQ@mail.gmail.com>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Fri, 27 May 2022 10:38:43 +0200
X-Gmail-Original-Message-ID: <CAK8P3a36s6S2B8PTixxEkmaKXL88NAydTm4abdeC+roGtrUTsw@mail.gmail.com>
Message-ID: <CAK8P3a36s6S2B8PTixxEkmaKXL88NAydTm4abdeC+roGtrUTsw@mail.gmail.com>
Subject: Re: am335x: 5.18.x: system stalling
To:     Yegor Yefremov <yegorslists@googlemail.com>
Cc:     Arnd Bergmann <arnd@arndb.de>, Tony Lindgren <tony@atomide.com>,
        Ard Biesheuvel <ardb@kernel.org>,
        Linux-OMAP <linux-omap@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:jgyBVWoUCJsw/7LT4BFUtkQbLeRr2Tpdk1keC1KRa4USprgdlOS
 53KnsU/HEwIUHqlBAzBkszKOzBXy7FrBVrlSCeNTJkX/ZDMozVi+tyTXF6btvSNpBx9wJ12
 auX7mrv9vC9HH9Fa0Wxy6BauHryITkoTTrvr/6QVuNjcmo2sBEXhnt/ZzlkqNVkMwexgNv1
 vjCF0oRx3YzB8yRsv2kBg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:SP6SWyEpvnE=:U6IvNuTtC9fezqTkEx/ILD
 H6W/pJ7WWFSQb1C/zEcB/EMzZ+YfjYp0DD/DltQd/pt8TNulR2KSxuPlPhLplazVJwzonk1H9
 T8uOzjSVJmWqmjkU4n+B6EihcAj4v6G0+nOdYAsd2aD1/kHjtaT3Q2kEJF/TEhRJRPywFanDY
 b6yDP47n6ilxhtI5HOVw3lBG2uKxDuMvokTwciKqGg/qRLlexz7TDCtIxefoULQASzfF5OGYq
 IKThVa0LOZx9rMR7h2voLCkF/kc6+SUjjFskIDNttxp8aWvioaAwGFXEkS5JxLUrwSoqDvw6J
 Stt/pBfECEBLsB+uHktF8+HeWd0yXSRM5AwwBDneiX1itiyEkAZosm4S8BWh9fSQL7rqEwm2a
 Bm8hHIVAGh75A3yjn7kq7c/bVWe6obfZ13l0nYivN5esgXr+ldY17YVJP2vvOJ4+AOYmC7HHi
 N6G88ukSmRhoNHVRoq6Pl9YDo+4vZRKsTf4Vo7WyEr/9C8fCfFfZ9mibLP3VAndzsW3XljFAT
 nXCQm/b4Q0uZoky27MbZoeOOvapFfiRiuFKSiHexvsm5vCIhyxXRyH/OyKcA9mvvljvblIrtn
 fMVwYNQr+/cXMt5PFk//pHYdp42nhWj+HN3jhy+jKXSKl0k4tzzaZ3g+90fUHn4sjcmZF1SW/
 iy0vl+SM7cWd4rvj52dn8/DAH5w72J3BOIVjzLYqJwVoS2JGkK7EnE05hRVuz8RxY4jnEJkuu
 z6Clh6FI3nxMAHxktSjzYnHUBki3c9/qqENnlw==
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Fri, May 27, 2022 at 10:17 AM Yegor Yefremov
<yegorslists@googlemail.com> wrote:
> On Fri, May 27, 2022 at 8:57 AM Arnd Bergmann <arnd@arndb.de> wrote:
> >
> > On Fri, May 27, 2022 at 8:50 AM Tony Lindgren <tony@atomide.com> wrote:
> > > * Arnd Bergmann <arnd@arndb.de> [220527 06:35]:
> > > > On Fri, May 27, 2022 at 6:44 AM Yegor Yefremov <yegorslists@googlemail.com> wrote:
> > > > > On Thu, May 26, 2022 at 4:16 PM Arnd Bergmann <arnd@arndb.de> wrote:
> >
> > > Based on what we just discussed on #armlinux, testing before and after
> > > commit 9c46929e7989 ("ARM: implement THREAD_INFO_IN_TASK for uniprocessor
> > > systems") might be a good idea as it enables some config options that
> > > did not get enabled earlier.
> > >
> > > Another thing that might help is to bisect again and ensure vmap stack
> > > config option stays disabled so issues related to vmap stack are kept
> > > out of the way.
> >
> > Unfortunately the commits around 9c46929e7989 are the ones that failed
> > to build according to the original report. But it's possible that the
> > problem has something to do with
> > CONFIG_CURRENT_POINTER_IN_TPIDRURO, which is disabled
> > in the V6+SMP config, and which in turn is required for
> > THREAD_INFO_IN_TASK, IRQSTACKS and STACKPROTECTOR_PER_TASK.
> >
> > If any of the four are the cause of the stall, then turning off ARCH_OMAP2 and
> > CONFIG_CPU_V6 should show the same bug in older commits as well.
>
> Both config options disabled:
>
> # zcat /proc/config.gz | grep 'CONFIG_ARCH_MULTI_V6\|CONFIG_SMP'
> # CONFIG_ARCH_MULTI_V6 is not set
> CONFIG_ARCH_MULTI_V6_V7=y
> # CONFIG_SMP is not set
>
> This helped - no stalls.

Ok, that does point back to a recent regression then, rather than something
that was already broken and just uncovered by the changed behavior.

Can you try the other combinations as well? OMAP2=y with SMP=n
and OMAP2=n with SMP=y? Hopefully that narrows it down enough that
we can look at which code paths actually changed.

        Arnd
