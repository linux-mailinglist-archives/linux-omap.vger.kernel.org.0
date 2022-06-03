Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F007753D23D
	for <lists+linux-omap@lfdr.de>; Fri,  3 Jun 2022 21:12:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348873AbiFCTMB (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 3 Jun 2022 15:12:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42286 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348872AbiFCTL6 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 3 Jun 2022 15:11:58 -0400
Received: from mail-yb1-xb35.google.com (mail-yb1-xb35.google.com [IPv6:2607:f8b0:4864:20::b35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3DFE51D0CB;
        Fri,  3 Jun 2022 12:11:55 -0700 (PDT)
Received: by mail-yb1-xb35.google.com with SMTP id g4so15310124ybf.12;
        Fri, 03 Jun 2022 12:11:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=QddfCQ7RvAbAaYBceLg4vV5BMHxPwAwxWdkPg5UtNEE=;
        b=Hw3p8duD2YT5/K0bCo/6GREIyGxRHpT1VZAlJl2HexQGmy59Bx9WkXqYdQG6tTXJfb
         V0FHpiEAcznq9fUhZquYTs0PzvbmiA+zcwWl0suV2Ghd+n3ZLwkqFCYrOtwocAH/yLkx
         uyY15wYfanXL/VeSzBEyVGz2Ftm+PnJHH8kuaiEYpU01wWGSOlgoGxF4EUCNBP4gwj5B
         iIVXZNptDAUtPaNyy0VlTBGcVo2N12AiNPxWPLPYgOoX7UsV7sOZjxBF2zfNWTyCbS2W
         3qjs5Kh7J16YQobqpXGEmcWwyhWiElJ8I1K+WNSzsZVvH5IrDrxl46KUPoOEUafp1mfv
         qZyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=QddfCQ7RvAbAaYBceLg4vV5BMHxPwAwxWdkPg5UtNEE=;
        b=tJK87lvIRkOKOEaXmNf0fXXYJyMM7xtP5Cr3DTaT6j36G+bZriwWPk51o7KF6zsONs
         2yqlbMEhAo/8EmFMGsF9AWjikiO0vNlywqu5ubITROXZxx3iF2z0dP4Yviqdbt8dNY36
         8cpBOumHr+V9B+vwhp2ni7q8GBCvDtq5hJFAs1hkSy33BPj6YMEIEoqLaPQX2F8JGnlh
         Vl7E0Dgwxnkal+W5iFhAyiusN0svXTE6mo9GFU/u00dWqzqlWsWR7ktk7wv3RtrvQlhI
         joLDkPqL5MFwuWj//MCrLKihjozp9ZfLZQ+/EBR9XzUnCSar6W3jR5GOoZDOnesdnTM2
         4AHg==
X-Gm-Message-State: AOAM531I3C4Fu0gmP0Lsn10cZODbg0KT1i3m3bmlTacfXd4RM6YMG455
        Z0ct1eZnt9IAXqJLT4Vv1O0yYf6U6UEEDVVzBg0=
X-Google-Smtp-Source: ABdhPJyZJdLACA7RDPU84kD1uibvsmZKfsIz/xGJ5iPWDqlGLdicfp6VmAQ7TCGP2i6Ue6nZLccSJZWkN1wo3mM1jms=
X-Received: by 2002:a05:6902:352:b0:64e:8f8:d552 with SMTP id
 e18-20020a056902035200b0064e08f8d552mr12507657ybs.540.1654283514364; Fri, 03
 Jun 2022 12:11:54 -0700 (PDT)
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
 <CAGm1_kvJpoDk=G3xYKT5UD5QnjRGr9Npft-8OCgtB9+qCjRtqQ@mail.gmail.com>
 <CAGm1_kvrivJLsFJaZtr6ojryDZFu3Xmpum8FURoFT9vMr54LUA@mail.gmail.com> <CAK8P3a2113EnZw9BNjCYYmKuNqEk4CtZCC0ydBNNQXetvzTSEg@mail.gmail.com>
In-Reply-To: <CAK8P3a2113EnZw9BNjCYYmKuNqEk4CtZCC0ydBNNQXetvzTSEg@mail.gmail.com>
From:   Yegor Yefremov <yegorslists@googlemail.com>
Date:   Fri, 3 Jun 2022 21:11:42 +0200
Message-ID: <CAGm1_kuUVKAxcxENnvsq5AGzeXAeXP6yLmjt1MQSpfjdcvZjng@mail.gmail.com>
Subject: Re: am335x: 5.18.x: system stalling
To:     Arnd Bergmann <arnd@arndb.de>
Cc:     Ard Biesheuvel <ardb@kernel.org>, Tony Lindgren <tony@atomide.com>,
        Linux-OMAP <linux-omap@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Fri, Jun 3, 2022 at 11:32 AM Arnd Bergmann <arnd@arndb.de> wrote:
>
> On Fri, Jun 3, 2022 at 10:54 AM Yegor Yefremov
> <yegorslists@googlemail.com> wrote:
> > On Thu, Jun 2, 2022 at 2:27 PM Yegor Yefremov <yegorslists@googlemail.com> wrote:
> > > On Thu, Jun 2, 2022 at 12:37 PM Ard Biesheuvel <ardb@kernel.org> wrote:
>
> > > > That confirms my statement that smp.c cannot be the culprit, and
> > > > appears to exonerate the pure asm pieces. I wonder if this is related
> > > > to insufficient asm constraints on the C helpers, or just the cost
> > > > model taking different decisions because the inline asm string is much
> > > > longer. In any case, this opens up a couple of avenues we could
> > > > explore to narrow this down further.
> > > >
> > > > As a quick check, can you try the below snippet applied onto the
> > > > broken current.h build?
> > > >
> > > > --- a/arch/arm/include/asm/current.h
> > > > +++ b/arch/arm/include/asm/current.h
> > > > @@ -53,7 +53,8 @@ static __always_inline __attribute_const__ struct
> > > > task_struct *get_current(void)
> > > >             "   b       . + (2b - 0b)                           \n\t"
> > > >             "   .popsection                                     \n\t"
> > > >  #endif
> > > > -           : "=r"(cur));
> > > > +           : "=r"(cur)
> > > > +           : "Q" (*(const unsigned long *)current_stack_pointer));
> > >
> > > Where is the current_stack_pointer defined?
> > >
> > > >  #elif __LINUX_ARM_ARCH__>= 7 || \
> > > >        !defined(CONFIG_ARM_HAS_GROUP_RELOCS) || \
> > > >        (defined(MODULE) && defined(CONFIG_ARM_MODULE_PLTS))
> > > >
> > > > Given that the problematic sequence appears to be in C code, could you
> > > > please confirm whether or not the stall is reproducible when all the
> > > > pieces that are used by the CAN stack (musb, slcan, ftdio-sio, etc)
> > > > are built into the kernel rather than built as modules? Also, which
> > > > GCC version are you using?
> > >
> > > For now, the CAN stack parts are built as modules. I'll try to compile them in.
> > >
> > > I'm using GCC 10.x
> >
> > I have tried your patch (see the attachment) and the system stalls.
>
> This is with only get_current() patched on top of the working
> f0191ea5c2e5 ("[PART 1] ARM: implement THREAD_INFO_IN_TASK for
> uniprocessor systems"), right?
>
> My best theory right now is that something in get_currnent() is wrong that
> causes it to return the wrong task pointer, which in turn leads to
> current->preempt_count to get out of sync. This may be related to the cppi41
> dmaengine tasklet and effectively disables further softirqs including the timer
> that triggers the RCU grace period.
>
> When we finally switch tasks to the cpufreq worker thread, softirqs
> can happen again because of the task switch, and at the next IRQ
> the timer detects the stall.
>
> > Will try GCC 11.x and also compiled-in drivers.
>
> Ok. Maybe make sure all drivers are built-in here. I see both the CAN
> layer and the cppi41 driver use softirqs, so to be on the safe side,
> try to get to a running kernel that has no modules loaded at all at
> the time you expect the stall.
>
>
> One thing that could possibly go wrong with get_current() would be that
> it fails to get patched for some reason, or it gets patched only after
> it was already called. Since you run on an ARMv7 CPU as opposed to
> an actual OMAP2410/ARM1136r0, it would then try to load the
> variable from the uninitialized TPIDRURO register. If that happens,
> the one-liner below should tell you exactly where, by triggering an
> Oops. You can apply the patch on top for testing, it should have no
> other effects if the patching part works correctly.
>
>         Anrd
>
> 8<---
>
> diff --git a/arch/arm/include/asm/current.h b/arch/arm/include/asm/current.h
> index 2f9d79214b25..2a15832793c4 100644
> --- a/arch/arm/include/asm/current.h
> +++ b/arch/arm/include/asm/current.h
> @@ -33,7 +33,7 @@ static inline __attribute_const__ struct task_struct
> *get_current(void)
>          */
>         cur = __builtin_thread_pointer();
>  #elif defined(CONFIG_CURRENT_POINTER_IN_TPIDRURO) || defined(CONFIG_SMP)
> -       asm("0: mrc p15, 0, %0, c13, c0, 3                      \n\t"
> +       asm("0: .long 0xe7f001f2                        \n\t" // BUG() trap
>  #ifdef CONFIG_CPU_V6
>             "1:                                                 \n\t"
>             "   .subsection 1                                   \n\t"

With compiled-in drivers the system doesn't stall. All other tests and
related outputs will come next week.

Have a nice weekend.

Yegor
