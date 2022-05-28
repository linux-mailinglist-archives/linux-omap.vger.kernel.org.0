Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7F186536BC1
	for <lists+linux-omap@lfdr.de>; Sat, 28 May 2022 11:07:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231867AbiE1JH6 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sat, 28 May 2022 05:07:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49242 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230320AbiE1JH5 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sat, 28 May 2022 05:07:57 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1403C217;
        Sat, 28 May 2022 02:07:55 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id DA79B60C59;
        Sat, 28 May 2022 09:07:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3AAAFC34114;
        Sat, 28 May 2022 09:07:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1653728874;
        bh=++iIKTzT8BlgqQeTXIS+I91B25rhPAewWrfFC1nVGwM=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=tCLvLkXr/uCNwwBbTV1Aon10/ImkPIcE6FTSnmc+qzJscoJJ0KWWEegZ0lHU0MMXC
         FCN+OxkGhJDyYsoY8V6LrmXQgJ1HbXgsDVREgbXkTMIrJY0A13Di1tNx3oXmHeIAkY
         NhM9HFDjskZ5HaQHzR3qKxgbDdX3OFeFTphCd/2hnBVYuXNeBqW2Pwv7Kr24JRbnrb
         r+UReUxrzUOct8vORzfy4D8ge++WaDF6kSm+VnBQf78hM9J5Vph2DtIy+4J2hRBtc6
         t0pijb485C0fsaLtSf48dYMLlmgjoiEGlhQanpOyCrGGbzVK0uSIeXWLdlqnCNu3YM
         lx3iuknMyPJvw==
Received: by mail-oa1-f43.google.com with SMTP id 586e51a60fabf-edeb6c3642so8478997fac.3;
        Sat, 28 May 2022 02:07:54 -0700 (PDT)
X-Gm-Message-State: AOAM5332DhWMkM0qBBmEiUKRH7pfQKRvMOs1ryuNPiptTdGIjl6j+ag+
        Nc3k1gEovyw6hkaK8LZZaeZ9a1wFkYU4hMIB+oI=
X-Google-Smtp-Source: ABdhPJw2lq56t4wMHLXUFS9u0ZeTqkLqI18yQz9gIx+j+0hn+/jjzDVvsTaHIzhs8X7gZq5uU08KYWJkz4kHrhqEr5A=
X-Received: by 2002:a05:6870:eaa5:b0:da:b3f:2b45 with SMTP id
 s37-20020a056870eaa500b000da0b3f2b45mr6123131oap.228.1653728873386; Sat, 28
 May 2022 02:07:53 -0700 (PDT)
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
 <CAK8P3a2yaKcEiO-LvH5z5azTEX1XTh=9U2MChRS92dtatceY5g@mail.gmail.com> <CAGm1_kvXaH19nOmP_Dy3nxWpG0UiX7eyauTLB+9Cd2rBovDcEQ@mail.gmail.com>
In-Reply-To: <CAGm1_kvXaH19nOmP_Dy3nxWpG0UiX7eyauTLB+9Cd2rBovDcEQ@mail.gmail.com>
From:   Ard Biesheuvel <ardb@kernel.org>
Date:   Sat, 28 May 2022 11:07:41 +0200
X-Gmail-Original-Message-ID: <CAMj1kXFfc-e0+dpLJHj9W+=YS=3i0t1+wxF+4qJ5K-g7pTd+YQ@mail.gmail.com>
Message-ID: <CAMj1kXFfc-e0+dpLJHj9W+=YS=3i0t1+wxF+4qJ5K-g7pTd+YQ@mail.gmail.com>
Subject: Re: am335x: 5.18.x: system stalling
To:     Yegor Yefremov <yegorslists@googlemail.com>
Cc:     Arnd Bergmann <arnd@arndb.de>, Tony Lindgren <tony@atomide.com>,
        Linux-OMAP <linux-omap@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-7.9 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Sat, 28 May 2022 at 10:29, Yegor Yefremov <yegorslists@googlemail.com> wrote:
>
> On Sat, May 28, 2022 at 9:53 AM Arnd Bergmann <arnd@arndb.de> wrote:
> >
> > On Sat, May 28, 2022 at 7:48 AM Yegor Yefremov
> > <yegorslists@googlemail.com> wrote:
> > >
> > > On Fri, May 27, 2022 at 4:13 PM Arnd Bergmann <arnd@arndb.de> wrote:
> > > >
> > > > On Fri, May 27, 2022 at 3:12 PM Ard Biesheuvel <ardb@kernel.org> wrote:
> > > > > On Fri, 27 May 2022 at 14:54, Arnd Bergmann <arnd@arndb.de> wrote:
> > > > > > On Fri, May 27, 2022 at 11:50 AM Yegor Yefremov <yegorslists@googlemail.com> wrote:
> > > > >
> > > > > Not just per-cpu data: there is also the 'current' global variable
> > > > > which gets used now instead of the user thread ID register, and this
> > > > > is also different between modules and the core kernel (unless
> > > > > CONFIG_ARM_MODULE_PLTS is disabled)
> > > >
> > > > Right, so if the percpu hack doesn't address it, this one might:
> > > >
> > > > diff --git a/arch/arm/include/asm/current.h b/arch/arm/include/asm/current.h
> > > > index 1e1178bf176d..306d1a4cae40 100644
> > > > --- a/arch/arm/include/asm/current.h
> > > > +++ b/arch/arm/include/asm/current.h
> > > > @@ -18,6 +18,8 @@ static __always_inline __attribute_const__ struct
> > > > task_struct *get_current(void)
> > > >  {
> > > >         struct task_struct *cur;
> > > >
> > > > +       return __current;
> > > > +
> > > >  #if __has_builtin(__builtin_thread_pointer) && \
> > > >      defined(CONFIG_CURRENT_POINTER_IN_TPIDRURO) && \
> > > >      !(defined(CONFIG_THUMB2_KERNEL) && \
> > >
> > > I have tried this patch and the system still stalls.
> >
> > Ok, thanks for testing. To clarify: did you test with both the get_current() and
> > __my_cpu_offset() changes applied, or just the get_current() one?
>
> I have tested only the get_current() one. Should I also test
> __my_cpu_offset() separately and combined?
>

That would be helpful, yes.
