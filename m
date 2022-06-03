Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 052F553C7AB
	for <lists+linux-omap@lfdr.de>; Fri,  3 Jun 2022 11:37:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243100AbiFCJh3 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 3 Jun 2022 05:37:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48058 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241746AbiFCJh2 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 3 Jun 2022 05:37:28 -0400
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E3CF313E0B;
        Fri,  3 Jun 2022 02:37:25 -0700 (PDT)
Received: from mail-yb1-f174.google.com ([209.85.219.174]) by
 mrelayeu.kundenserver.de (mreue009 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1McH1Q-1nMczA1Qbs-00civJ; Fri, 03 Jun 2022 11:32:20 +0200
Received: by mail-yb1-f174.google.com with SMTP id i11so12730033ybq.9;
        Fri, 03 Jun 2022 02:32:20 -0700 (PDT)
X-Gm-Message-State: AOAM531GfgrrF8+0IjKKt7tcun5Z52fchlvEuedqfyrCeDa9CXunwuZB
        uT5KaToEUJT9ChrXrH5vWZglFC7ocPl6xc5Q4j8=
X-Google-Smtp-Source: ABdhPJyl01FFNiOxfFn5n+0e+bXa/tkLiTvE+mzEwQhGa7WM3f6YEbKF9lylH2naA751u11i5Lt3IcBdEVY/A+Lq9xU=
X-Received: by 2002:a25:db8a:0:b0:65c:b04a:f612 with SMTP id
 g132-20020a25db8a000000b0065cb04af612mr9750275ybf.106.1654248739041; Fri, 03
 Jun 2022 02:32:19 -0700 (PDT)
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
 <CAK8P3a2VV26MhWz95OwfKz+2k35ee8V876iqdJdZ4o1HuNba8A@mail.gmail.com>
 <CAGm1_ktyCchFwVWhFtrgR621s_fPZJ3u8UmgOPbg7OCOq0h6ZA@mail.gmail.com>
 <CAK8P3a02uFq4edc_VzPaNQXp_cuLXUMbF4c=k6KATApS9hNHkw@mail.gmail.com>
 <CAMj1kXEvxP8ULqy7ajT_cSxMzYLJuCjEZGfYBb=F9qOwz-AFaQ@mail.gmail.com>
 <CAGm1_ksF1UPpdeiTnADiQK8MFbvP8-eDhc=yaCL75EsE_pG=-g@mail.gmail.com>
 <CAGm1_ksmXTnEo_Mxk7+S4vs_CQAs5ZHoEOpq9Tq3ZFf7sruX7A@mail.gmail.com>
 <CAK8P3a1nhBnbbocBNkKUKYhw14OYE0WPEyQcJJXzbpW4uASu_Q@mail.gmail.com>
 <CAGm1_kswMZkoV9_DnB71ugVTF_rh5SV2NazkHROwXiFqhxTWYA@mail.gmail.com>
 <CAK8P3a0Qdav2JaF8yLydxr9amQp30gnY67CVx+ubowUHeG1VeA@mail.gmail.com>
 <CAMj1kXEL48=w08A2t7522y1visAUcnkkq4LA6ERRP_FbCbEgiw@mail.gmail.com>
 <CAMj1kXFmFfQ1oZ-CUcwe+ojSkk+9KBH1azhGrEJ4=-pZgMXX-Q@mail.gmail.com>
 <CAGm1_ku-tygQJrgvHnvJd0xzb6Vw3t_qdz_VKHJx4YWSxCEryA@mail.gmail.com>
 <CAMj1kXHUoDQ0xZ4yBx9uT6D9=6xfOsJoWLoOKho_-=Z9uYS30w@mail.gmail.com>
 <CAGm1_ks8g3RNwOkC8C_B2eYz56cEA7L-6CRdmqmNwSvAg-JP_g@mail.gmail.com>
 <CAMj1kXH+WR03MX94rd1p7Yz60mfrkOvOx=NYoZ9FCSnqMP4nTw@mail.gmail.com>
 <CAGm1_kvZ_6tPgfrTc3pH+6TedoU+mvuEXb+7aEp5mXfx516fmA@mail.gmail.com>
 <CAMj1kXEfKLYYxt9imEO155oxWTzXtWPpF8txGZ-xCs_6vez-WA@mail.gmail.com>
 <CAGm1_kvJpoDk=G3xYKT5UD5QnjRGr9Npft-8OCgtB9+qCjRtqQ@mail.gmail.com> <CAGm1_kvrivJLsFJaZtr6ojryDZFu3Xmpum8FURoFT9vMr54LUA@mail.gmail.com>
In-Reply-To: <CAGm1_kvrivJLsFJaZtr6ojryDZFu3Xmpum8FURoFT9vMr54LUA@mail.gmail.com>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Fri, 3 Jun 2022 11:32:01 +0200
X-Gmail-Original-Message-ID: <CAK8P3a2113EnZw9BNjCYYmKuNqEk4CtZCC0ydBNNQXetvzTSEg@mail.gmail.com>
Message-ID: <CAK8P3a2113EnZw9BNjCYYmKuNqEk4CtZCC0ydBNNQXetvzTSEg@mail.gmail.com>
Subject: Re: am335x: 5.18.x: system stalling
To:     Yegor Yefremov <yegorslists@googlemail.com>
Cc:     Ard Biesheuvel <ardb@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Tony Lindgren <tony@atomide.com>,
        Linux-OMAP <linux-omap@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:Op2iUl1kxM+CQlg/d9Qq0cQDdHGiuq8r8UmKrIccAksxJsRobrm
 aV+W4Ugpjfi2BTgVAJwp0Di+HB/pNGZ8y0YbtPCFFUAlL+fvjUPOBel1jiETW6BoVyr8hll
 wFVbJkyaNM6cfAMVXNGSziquMOOIig0WGxcrhYyF4v7Mi4G/56PdgL9LnhKw2j4ycouKoY8
 FamfAJ1cCygUpEuxyfIdw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:Y01DiLEFcNY=:YLWYYRvhzQnSwduzeRJofJ
 ZlZPt6GXkzE0LX1A/LUTRIZk89MHjQ3kerz9pl9lORG3vW4wSaOTf4GQe9dNkwGgyev1d2mWa
 mIDubnGY7oCbSIkdFgwv7Ht8CElGKQ2crzr5t9QTaFO37BVAc7A/HttIMuWOdgOVz5tt3VJz4
 wQDhUSJEmXmnNyzYiLWSSaOECAFLpRg2mFKyelhbVeAqMmEHuWu5JGjRmx9Fx9Qx1ikFdRgsq
 PJ8FlaCpoU6in8GA5nOzy/4kC/zZJnobk9ha8oNlcyVkVC/JqOizwAyVmkdGXQJPO3im8PlhT
 xsf5bgocEi9fOIs3Kq5+LjJWsrQV0DDkebaQMX63EX1U/HtXJu8L+SdJ2aJzR9cFdd9R7992i
 xSjLWfGfVz36ESxnfbL/+8yXc5dCVS+70VTkLJic8XnvFSZjZZAOfe+P2rOgmJcmLx3Ga/alX
 sbG35hxFF/Af1IsCTk8m9xsrEP3ehcx2H8LOyTo5ha1TgBxSqyp4dApaRsx44ZQFwdyIySQ5l
 DHl9o80MjbbNlr1EQ5YCe++q8f0A3vnK6xLebnFrq0yO9l65LGpz3BzRzJO6tXk6E4Hp/G+Sg
 vAPnAK/4f1+iGJzCAU4gL8Cgnl51YhcZ2Yuz2S5n4VDHWn1TU6AqREATD7XNSORUccMjYKo8O
 UFMBvRvlTkmlI2d4/5U8Pf++h/2hx/3oVr+2lzpb5u2kolAWL7Mm/56ICntItXIfPPjsDVd69
 a7cesYJi9IrvyLkqhE01AuxdulY8wTqiBVbJbOriwoAgt8o51/8iE4RxYr9kcV/sRuEzl/M4w
 PQau18BDtfljSIORiKM3E5q7UkWQDWU0izvRfg0OSYnrB5pxG89V3USubwnd0+rlqZveVYdeZ
 WLtnmTp61sSFTjiX1XqA==
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Fri, Jun 3, 2022 at 10:54 AM Yegor Yefremov
<yegorslists@googlemail.com> wrote:
> On Thu, Jun 2, 2022 at 2:27 PM Yegor Yefremov <yegorslists@googlemail.com> wrote:
> > On Thu, Jun 2, 2022 at 12:37 PM Ard Biesheuvel <ardb@kernel.org> wrote:

> > > That confirms my statement that smp.c cannot be the culprit, and
> > > appears to exonerate the pure asm pieces. I wonder if this is related
> > > to insufficient asm constraints on the C helpers, or just the cost
> > > model taking different decisions because the inline asm string is much
> > > longer. In any case, this opens up a couple of avenues we could
> > > explore to narrow this down further.
> > >
> > > As a quick check, can you try the below snippet applied onto the
> > > broken current.h build?
> > >
> > > --- a/arch/arm/include/asm/current.h
> > > +++ b/arch/arm/include/asm/current.h
> > > @@ -53,7 +53,8 @@ static __always_inline __attribute_const__ struct
> > > task_struct *get_current(void)
> > >             "   b       . + (2b - 0b)                           \n\t"
> > >             "   .popsection                                     \n\t"
> > >  #endif
> > > -           : "=r"(cur));
> > > +           : "=r"(cur)
> > > +           : "Q" (*(const unsigned long *)current_stack_pointer));
> >
> > Where is the current_stack_pointer defined?
> >
> > >  #elif __LINUX_ARM_ARCH__>= 7 || \
> > >        !defined(CONFIG_ARM_HAS_GROUP_RELOCS) || \
> > >        (defined(MODULE) && defined(CONFIG_ARM_MODULE_PLTS))
> > >
> > > Given that the problematic sequence appears to be in C code, could you
> > > please confirm whether or not the stall is reproducible when all the
> > > pieces that are used by the CAN stack (musb, slcan, ftdio-sio, etc)
> > > are built into the kernel rather than built as modules? Also, which
> > > GCC version are you using?
> >
> > For now, the CAN stack parts are built as modules. I'll try to compile them in.
> >
> > I'm using GCC 10.x
>
> I have tried your patch (see the attachment) and the system stalls.

This is with only get_current() patched on top of the working
f0191ea5c2e5 ("[PART 1] ARM: implement THREAD_INFO_IN_TASK for
uniprocessor systems"), right?

My best theory right now is that something in get_currnent() is wrong that
causes it to return the wrong task pointer, which in turn leads to
current->preempt_count to get out of sync. This may be related to the cppi41
dmaengine tasklet and effectively disables further softirqs including the timer
that triggers the RCU grace period.

When we finally switch tasks to the cpufreq worker thread, softirqs
can happen again because of the task switch, and at the next IRQ
the timer detects the stall.

> Will try GCC 11.x and also compiled-in drivers.

Ok. Maybe make sure all drivers are built-in here. I see both the CAN
layer and the cppi41 driver use softirqs, so to be on the safe side,
try to get to a running kernel that has no modules loaded at all at
the time you expect the stall.


One thing that could possibly go wrong with get_current() would be that
it fails to get patched for some reason, or it gets patched only after
it was already called. Since you run on an ARMv7 CPU as opposed to
an actual OMAP2410/ARM1136r0, it would then try to load the
variable from the uninitialized TPIDRURO register. If that happens,
the one-liner below should tell you exactly where, by triggering an
Oops. You can apply the patch on top for testing, it should have no
other effects if the patching part works correctly.

        Anrd

8<---

diff --git a/arch/arm/include/asm/current.h b/arch/arm/include/asm/current.h
index 2f9d79214b25..2a15832793c4 100644
--- a/arch/arm/include/asm/current.h
+++ b/arch/arm/include/asm/current.h
@@ -33,7 +33,7 @@ static inline __attribute_const__ struct task_struct
*get_current(void)
         */
        cur = __builtin_thread_pointer();
 #elif defined(CONFIG_CURRENT_POINTER_IN_TPIDRURO) || defined(CONFIG_SMP)
-       asm("0: mrc p15, 0, %0, c13, c0, 3                      \n\t"
+       asm("0: .long 0xe7f001f2                        \n\t" // BUG() trap
 #ifdef CONFIG_CPU_V6
            "1:                                                 \n\t"
            "   .subsection 1                                   \n\t"
