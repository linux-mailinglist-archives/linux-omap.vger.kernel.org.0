Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A361D536BA5
	for <lists+linux-omap@lfdr.de>; Sat, 28 May 2022 10:29:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231571AbiE1I34 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sat, 28 May 2022 04:29:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40654 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231648AbiE1I3x (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sat, 28 May 2022 04:29:53 -0400
Received: from mail-yb1-xb2b.google.com (mail-yb1-xb2b.google.com [IPv6:2607:f8b0:4864:20::b2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 92135186D4;
        Sat, 28 May 2022 01:29:51 -0700 (PDT)
Received: by mail-yb1-xb2b.google.com with SMTP id e184so1909080ybf.8;
        Sat, 28 May 2022 01:29:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Gh011goySH22XTngq56RODm4m9cvubYBJZZlT0wtiEk=;
        b=PAy1iHrECvCazgFAvw4ULbU0ZtSsGyTqSRx1UV1nH0hZN3WM9S4QqJq5AGnNYU1aXZ
         O2u3YZ94f0J1Q0UO0ND4luYt8c1Q9cCR1Pltcg1QDC9Rg/HNbLXJsLFc3APLmz3oee+A
         z0wM9/3KT6eZUB04SJge4FolVa0FoiBY221T6tQzOllGNtWdIWSes2bFwg9tegOAkRWA
         qarILH/5sk1/LHu31IVPqkIo6tLqadIojIUhun4rYRkFoqNuNElzQyD03MZPLDhBaxm0
         2QFK/lljRUCrucnfsCtfILtSytw/QSkbAL0/oH2k0ZGUl83Hdf+tINkO/Nxgky87stCm
         bv8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Gh011goySH22XTngq56RODm4m9cvubYBJZZlT0wtiEk=;
        b=MZaPv1wg2wBLwT8Hmf3LfcFJrXxbWWt+fKjIYFLJfO5O64QFxP0ll3Hzhmq08k6H7A
         0JaGNPlSEiJ+jh/PcCLwkPPL2pAxDgiaqDX81M/eZF8T8BAgKzaKVBtce6+ROvy3SaSI
         C0KFzp22gEWdhoVwwftbzVF9wXU2xrmKJ/jkIxLgowgOJSOKJrYsjeX7lDkW8IcRscfH
         Bzl+u/qhQyCCo/bzb0gOzSGg9rTOlGMka/8YsKmEnC/AwgRu90MU56oDK7WTjz7G7zgv
         HlK1v7I4qN1fTsuCO/RglLbXMO+i2Afvm4mYGkadMeEUSbq+ursSWSRMMfxAIrrjO6Bx
         KUqg==
X-Gm-Message-State: AOAM530PWHkgAW7qeDoQ/TvlFNXDSrfHW3DZXpGNPy2q0LWh4bgs5IvE
        7QrvYm9SoPDmQadKj+1mrr8wH/fS+m+ncm/YMWI=
X-Google-Smtp-Source: ABdhPJze7Kt6xeEfr+s1V1LlOUYzLOg3c9AFD7lRmW9nUqrYb7gql3kdS6fO6wOKZv9+ILxBWMMAC7QNqx5PpYhMprM=
X-Received: by 2002:a25:cec6:0:b0:65c:98f5:a06a with SMTP id
 x189-20020a25cec6000000b0065c98f5a06amr1410283ybe.355.1653726590756; Sat, 28
 May 2022 01:29:50 -0700 (PDT)
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
 <CAGm1_kta63UM8um5BB5jOh+r9uFMiGwAiYsrNDOwG3dN-Oo47Q@mail.gmail.com> <CAK8P3a2yaKcEiO-LvH5z5azTEX1XTh=9U2MChRS92dtatceY5g@mail.gmail.com>
In-Reply-To: <CAK8P3a2yaKcEiO-LvH5z5azTEX1XTh=9U2MChRS92dtatceY5g@mail.gmail.com>
From:   Yegor Yefremov <yegorslists@googlemail.com>
Date:   Sat, 28 May 2022 10:29:39 +0200
Message-ID: <CAGm1_kvXaH19nOmP_Dy3nxWpG0UiX7eyauTLB+9Cd2rBovDcEQ@mail.gmail.com>
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

On Sat, May 28, 2022 at 9:53 AM Arnd Bergmann <arnd@arndb.de> wrote:
>
> On Sat, May 28, 2022 at 7:48 AM Yegor Yefremov
> <yegorslists@googlemail.com> wrote:
> >
> > On Fri, May 27, 2022 at 4:13 PM Arnd Bergmann <arnd@arndb.de> wrote:
> > >
> > > On Fri, May 27, 2022 at 3:12 PM Ard Biesheuvel <ardb@kernel.org> wrote:
> > > > On Fri, 27 May 2022 at 14:54, Arnd Bergmann <arnd@arndb.de> wrote:
> > > > > On Fri, May 27, 2022 at 11:50 AM Yegor Yefremov <yegorslists@googlemail.com> wrote:
> > > >
> > > > Not just per-cpu data: there is also the 'current' global variable
> > > > which gets used now instead of the user thread ID register, and this
> > > > is also different between modules and the core kernel (unless
> > > > CONFIG_ARM_MODULE_PLTS is disabled)
> > >
> > > Right, so if the percpu hack doesn't address it, this one might:
> > >
> > > diff --git a/arch/arm/include/asm/current.h b/arch/arm/include/asm/current.h
> > > index 1e1178bf176d..306d1a4cae40 100644
> > > --- a/arch/arm/include/asm/current.h
> > > +++ b/arch/arm/include/asm/current.h
> > > @@ -18,6 +18,8 @@ static __always_inline __attribute_const__ struct
> > > task_struct *get_current(void)
> > >  {
> > >         struct task_struct *cur;
> > >
> > > +       return __current;
> > > +
> > >  #if __has_builtin(__builtin_thread_pointer) && \
> > >      defined(CONFIG_CURRENT_POINTER_IN_TPIDRURO) && \
> > >      !(defined(CONFIG_THUMB2_KERNEL) && \
> >
> > I have tried this patch and the system still stalls.
>
> Ok, thanks for testing. To clarify: did you test with both the get_current() and
> __my_cpu_offset() changes applied, or just the get_current() one?

I have tested only the get_current() one. Should I also test
__my_cpu_offset() separately and combined?

Yegor
