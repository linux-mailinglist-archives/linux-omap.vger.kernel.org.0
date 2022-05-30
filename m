Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A6928538423
	for <lists+linux-omap@lfdr.de>; Mon, 30 May 2022 17:15:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238792AbiE3OnO convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-omap@lfdr.de>); Mon, 30 May 2022 10:43:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43628 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240463AbiE3OiX (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 30 May 2022 10:38:23 -0400
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 528BD146436;
        Mon, 30 May 2022 06:54:32 -0700 (PDT)
Received: from mail-yw1-f179.google.com ([209.85.128.179]) by
 mrelayeu.kundenserver.de (mreue010 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1Mz9pT-1naJXg0Rl5-00wEys; Mon, 30 May 2022 15:54:31 +0200
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-30c143c41e5so53100097b3.3;
        Mon, 30 May 2022 06:54:30 -0700 (PDT)
X-Gm-Message-State: AOAM532plWcYCg+dUnhc7w+QRUxFiaRGI40HDIVPuyT/e+9T1igfEpR1
        cu3pcLb55cT/N59sCkbjxR4L0owxyBPgcBN2j94=
X-Google-Smtp-Source: ABdhPJy5zk6iMI/IoxCzISxx4lJeFwEOkzCOqpWFPw1vQOWZZWODdnNGT5cBoncpY79vVoJd2WWQbnv5ExJDqYnHvCs=
X-Received: by 2002:a81:6283:0:b0:2ff:2443:6f3c with SMTP id
 w125-20020a816283000000b002ff24436f3cmr58349993ywb.135.1653918869807; Mon, 30
 May 2022 06:54:29 -0700 (PDT)
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
 <CAK8P3a36s6S2B8PTixxEkmaKXL88NAydTm4abdeC+roGtrUTsw@mail.gmail.com>
 <CAGm1_kvdhqrptEYy8WMfqZqG6gaWoBtAojSW5uXYnyXMVfV=Fw@mail.gmail.com>
 <CAK8P3a22hmSnS4X93ETLpF7vPtK_F1TD51SK5VvhEz9L9H4i3g@mail.gmail.com>
 <CAMj1kXF2NFxiNm=9ixOncN_wkgg2NrNNm9vE-CGUvpJuThj3JA@mail.gmail.com>
 <CAK8P3a1DnyNvBqdRGHAnHcXBfoNPn4GfUmf_SBGRRU3q3iwwvg@mail.gmail.com>
 <CAGm1_kta63UM8um5BB5jOh+r9uFMiGwAiYsrNDOwG3dN-Oo47Q@mail.gmail.com>
 <CAK8P3a2yaKcEiO-LvH5z5azTEX1XTh=9U2MChRS92dtatceY5g@mail.gmail.com>
 <CAGm1_kvXaH19nOmP_Dy3nxWpG0UiX7eyauTLB+9Cd2rBovDcEQ@mail.gmail.com>
 <CAMj1kXFfc-e0+dpLJHj9W+=YS=3i0t1+wxF+4qJ5K-g7pTd+YQ@mail.gmail.com>
 <CAGm1_ksndacPPpyZknvHip=7Fv+3NxXjyfCm_DDMm4EbcBuBig@mail.gmail.com>
 <CAK8P3a2VV26MhWz95OwfKz+2k35ee8V876iqdJdZ4o1HuNba8A@mail.gmail.com> <CAGm1_ktyCchFwVWhFtrgR621s_fPZJ3u8UmgOPbg7OCOq0h6ZA@mail.gmail.com>
In-Reply-To: <CAGm1_ktyCchFwVWhFtrgR621s_fPZJ3u8UmgOPbg7OCOq0h6ZA@mail.gmail.com>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Mon, 30 May 2022 15:54:13 +0200
X-Gmail-Original-Message-ID: <CAK8P3a02uFq4edc_VzPaNQXp_cuLXUMbF4c=k6KATApS9hNHkw@mail.gmail.com>
Message-ID: <CAK8P3a02uFq4edc_VzPaNQXp_cuLXUMbF4c=k6KATApS9hNHkw@mail.gmail.com>
Subject: Re: am335x: 5.18.x: system stalling
To:     Yegor Yefremov <yegorslists@googlemail.com>
Cc:     Arnd Bergmann <arnd@arndb.de>, Ard Biesheuvel <ardb@kernel.org>,
        Tony Lindgren <tony@atomide.com>,
        Linux-OMAP <linux-omap@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Provags-ID: V03:K1:mFgN59EbK0P0VDvyiPwoR5DemdAPKQuMDqPeo7HGw6mJfuo4Oj4
 XVQKVwiV0HpTrjreX2lqy0LCMlmGXg28xHbeaBt9jW/wvCeV4O4x4HcN+MRY/oSfBWBoyRK
 0g1j+z5QSnO5ArPAlGbPRj3cnT3R1S+fISSouc9YRFP2io1mxToBuho+KSDtHjLHICD0KeE
 wAMRHAierN1fHa5a3NKjw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:gP/RHkj97sg=:+4VjUgG1/PMp4BzQf7OtPe
 s8VVuHn6V/S8V0IEA7wzliCcVbp7tqNirHaT496XO+1HrCqLSEmfEzuNt0YrW6u7IOblNYT0Y
 gamtQlJKxTWdwxh2NByu/cKzqL9PYkMKvH48+GQTilCahIXEoz6aDZ6YNy3xRHcrULIzb3eGH
 HTlg3W8WW1WPTVFQE3niWwpEWIGJ8SFf0jz5uUu2IWwrxo+7PApboMoH5iitYB8c4GdAElFDY
 ATZTBxnudw0djMc58zBSV4H0QoghqLYIW07DOAVYTdQ2eY3oTWGt9RbRSBq2niYnE+gQ/JbPI
 4oLQ78g87OJZk/vg0BeJb/IXRLU2Bi5GNWIEj6YCHcHdVOPiwvCV/yaUzZ+j18wtqHZ9EKX96
 z+7YHRB744INnMbwavx3u9ayXtgfWf5xaMlWCLnPLi4Er1oaJb5eGyFFfJ+LtPEP/sKxeEzXp
 4Tjm+xXnuivWK6R/yTLQr0Hm8XGw9PmOUF0b12sOmGnl4f8czPFUoynB0qOTPIs1OZZQsEfsG
 U2xtYcASrfYfZ1198Fj54/1Ey7I8RJod0weRMBlDooORWf0iTS1pdoBRLBzBoZED8D1jd0fAw
 2RwTocKUSa0IvDQHrlKnhMxV+q0NTsqS5YCiVsUA4Gn+07c39SwicijeQt1jUKNdmfsfrXbCy
 Sh0B1P81Z3YAE8caT24Gi7mHfj0NLyNagRDgGmNLvaIwdfJMzVa5rQ6PdgRi5kKVpfUjxpSFy
 X0i5nTm5Sb114A5eSQt4pRjASuudnYD4qrG9i6gLemqL40OV+ijFpar3SanQuI48rhSogqIa6
 Vfs+8N6Z3iRZjdokThngZmQpk4zN5vZOTh0YYkn0gm12BdkaorqGukjg4Lwfc7t+Iaf4Pj1Lt
 eWBjSMLuvPjzYMYMgd5hsfvLwuxte75y/3vff05U4=
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Sat, May 28, 2022 at 9:28 PM Yegor Yefremov
<yegorslists@googlemail.com> wrote:
>
> On Sat, May 28, 2022 at 3:14 PM Arnd Bergmann <arnd@arndb.de> wrote:
> >
> > On Sat, May 28, 2022 at 3:01 PM Yegor Yefremov
> > <yegorslists@googlemail.com> wrote:
> > > On Sat, May 28, 2022 at 11:07 AM Ard Biesheuvel <ardb@kernel.org> wrote:
> > > In file included from ./include/linux/irqflags.h:17,
> > >                  from ./arch/arm/include/asm/bitops.h:28,
> > >                  from ./include/linux/bitops.h:33,
> > >                  from ./include/linux/log2.h:12,
> > >                  from kernel/bounds.c:13:
> > > ./arch/arm/include/asm/percpu.h: In function ‘__my_cpu_offset’:
> > > ./arch/arm/include/asm/percpu.h:32:9: error: ‘__per_cpu_offset’
> > > undeclared (first use in this function); did you mean
> > > ‘__my_cpu_offset’?
> > >    32 |  return __per_cpu_offset[0];
> > >       |         ^~~~~~~~~~~~~~~~
> > >       |         __my_cpu_offset
> > > ./arch/arm/include/asm/percpu.h:32:9: note: each undeclared identifier
> > > is reported only once for each function it appears in
> >
> > I think you just missed the line in my patch that adds the
> > "extern unsigned long __per_cpu_offset[];" variable declaration.
>
> So, I tried both variants and both led to stalls.

I'm running out of ideas here.  Going to back to the original bisection,
I rebased Ard's patches in a way that you should be able to build the
config for each patch, and I split up the "ARM: implement
THREAD_INFO_IN_TASK for uniprocessor systems" commit in yet
another way, hoping to get something left over that points to the
bug. Can you try bisecting through the top commits of

https://kernel.org/pub/scm/linux/kernel/git/soc/soc.git am335x-stall-test

starting maybe with "52d240871760 irqchip: nvic: Use
GENERIC_IRQ_MULTI_HANDLER" as the patch that is almost certainly
going to be ok?

At some point I fear we may have to give up and just mark the v6+SMP
configuration as broken, which is something we have considered in the
past but ended up always keeping around for the purpose of testing
omap2plus_defconfig and imx_v6_v7_defconfig. Note that on production
systems you probably don't want to use that config anway, and should
either stick to a uniprocessor build, or disable the ARMv6 support.

         Arnd
