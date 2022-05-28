Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3788D536B7D
	for <lists+linux-omap@lfdr.de>; Sat, 28 May 2022 09:53:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229999AbiE1Hxr (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sat, 28 May 2022 03:53:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38804 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229998AbiE1Hxq (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sat, 28 May 2022 03:53:46 -0400
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5D949CC;
        Sat, 28 May 2022 00:53:44 -0700 (PDT)
Received: from mail-yw1-f174.google.com ([209.85.128.174]) by
 mrelayeu.kundenserver.de (mreue107 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1N7RDn-1nkUzz1xbZ-017kpO; Sat, 28 May 2022 09:53:42 +0200
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-2fee010f509so67138897b3.11;
        Sat, 28 May 2022 00:53:42 -0700 (PDT)
X-Gm-Message-State: AOAM532ri1rBu22JQIiCMeV6HnhYxKoIAfJAQfW79iwKVZ+6wxTZd99s
        3nrYvB+8XRV7zgIW7ooQrQ7z5JG5HRoVHTOLTHI=
X-Google-Smtp-Source: ABdhPJxEDo7yAkEh+elLoJWiHCklFeajSmqKHcchVjZyppNaUw49SAee0ToWe5WPWRCsiz4WfhGsoYulbWs4rMbOCeU=
X-Received: by 2002:a0d:cfc7:0:b0:300:26d2:30eb with SMTP id
 r190-20020a0dcfc7000000b0030026d230ebmr22317543ywd.320.1653724421108; Sat, 28
 May 2022 00:53:41 -0700 (PDT)
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
 <CAK8P3a1DnyNvBqdRGHAnHcXBfoNPn4GfUmf_SBGRRU3q3iwwvg@mail.gmail.com> <CAGm1_kta63UM8um5BB5jOh+r9uFMiGwAiYsrNDOwG3dN-Oo47Q@mail.gmail.com>
In-Reply-To: <CAGm1_kta63UM8um5BB5jOh+r9uFMiGwAiYsrNDOwG3dN-Oo47Q@mail.gmail.com>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Sat, 28 May 2022 09:53:24 +0200
X-Gmail-Original-Message-ID: <CAK8P3a2yaKcEiO-LvH5z5azTEX1XTh=9U2MChRS92dtatceY5g@mail.gmail.com>
Message-ID: <CAK8P3a2yaKcEiO-LvH5z5azTEX1XTh=9U2MChRS92dtatceY5g@mail.gmail.com>
Subject: Re: am335x: 5.18.x: system stalling
To:     Yegor Yefremov <yegorslists@googlemail.com>
Cc:     Arnd Bergmann <arnd@arndb.de>, Ard Biesheuvel <ardb@kernel.org>,
        Tony Lindgren <tony@atomide.com>,
        Linux-OMAP <linux-omap@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:MGSzAh5nA/TitX3ze0Q7S2DqufDYslWZ0Q1krCsiYnQlOT7MXOc
 epRr7vnUdMq7V3qQK2jbKvc6bl+UeMeER7H/eZA4xn4anpwi3dXVTVHysov9hv8UT/DJj2k
 QFl2hY0uRYmCN9+luMILbW3iwTpVlXjeiAydroAMclx7bhkVGNGazJRRHQHTwHOYC0WW4ua
 HF0xt3ex/3t7yQtooI/7g==
X-UI-Out-Filterresults: notjunk:1;V03:K0:o5CsRMlljcs=:BOsaZ67Pp3am44rxb9ioDc
 V9ysqGut9Aa0UX0k6Vl4OVkb4LQfAbTKHGvlbXqmFpQ9Rwdn7BpogMCMgovigjPhF1KuOgCjd
 HEOcio84zYiYnkRTwWdqvhAFEq0TFKdumNBjwH/qSDjmkoalqzDixtVncLaA37YrGuxNeGfiT
 bor1N2Rl18LAPV7erLEs5+Tt2mp4xQV5b7+NXJlFUIDAsVsuRaBWK+bB83Zr+ibYyMqWz7w4z
 HyYPEQSiLhyk5sqWFtZyvtXLpECL/+9o5s9VP6LXPvTWcTPhZP9CMcMsAy90U6LRUwTEYOpHl
 OlW/V2RIY/tui53uwUjwBXDPFM7VaQK1O2GhAOzaRLjnUh3GQCICW1AfcA+OJUvi7zLgPZ+sA
 KlpDhoaK6CF+q2AgwhrgPxV82g7jHA2oZhGXOiUo204UlKeVDja3SIvRpm9D3jEBqwdY7gm1x
 BDqkSoj0OvhKuHOs2cy6l5omd6vvevPc9NKPVhyW1jRt+rfGno9XTnYYuDZmi6QD1N9vd6cEH
 hJ/8N4R9BkuUWsAeFeYA/+XWryeO376gJxnZoxE26miEncQcSBX8lVruCDeMFj0dybC3ru4K2
 EOBDNoeiLtW6C/Ez8EkxMoVEfRsXFyAy6JI8hbbmsYltRoxJUW2+HTQsl/O4Eit8ud7gdZyii
 5By/gD3ESt9bNG8YRmMlBna0y/vripOHcJbRtXz0+yoGNfmjnYg9iiq7X8ASVtriWV33wpzZo
 XjrIgXNpxxX3uHrXWcNv1rDjTpQg5XA9sJOxOhSBkuulaIqI8x4jzenU+Q3wSBc9BpaDKXGOG
 9zgwad2CzA0CuC5FrMHLSFr4vnGkKuvRcWTm9gMLInPPqGCi4ewAFfoHVXZMgeKX4mEXKafGN
 F4ZYqj5C808k7uzK63vQ==
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Sat, May 28, 2022 at 7:48 AM Yegor Yefremov
<yegorslists@googlemail.com> wrote:
>
> On Fri, May 27, 2022 at 4:13 PM Arnd Bergmann <arnd@arndb.de> wrote:
> >
> > On Fri, May 27, 2022 at 3:12 PM Ard Biesheuvel <ardb@kernel.org> wrote:
> > > On Fri, 27 May 2022 at 14:54, Arnd Bergmann <arnd@arndb.de> wrote:
> > > > On Fri, May 27, 2022 at 11:50 AM Yegor Yefremov <yegorslists@googlemail.com> wrote:
> > >
> > > Not just per-cpu data: there is also the 'current' global variable
> > > which gets used now instead of the user thread ID register, and this
> > > is also different between modules and the core kernel (unless
> > > CONFIG_ARM_MODULE_PLTS is disabled)
> >
> > Right, so if the percpu hack doesn't address it, this one might:
> >
> > diff --git a/arch/arm/include/asm/current.h b/arch/arm/include/asm/current.h
> > index 1e1178bf176d..306d1a4cae40 100644
> > --- a/arch/arm/include/asm/current.h
> > +++ b/arch/arm/include/asm/current.h
> > @@ -18,6 +18,8 @@ static __always_inline __attribute_const__ struct
> > task_struct *get_current(void)
> >  {
> >         struct task_struct *cur;
> >
> > +       return __current;
> > +
> >  #if __has_builtin(__builtin_thread_pointer) && \
> >      defined(CONFIG_CURRENT_POINTER_IN_TPIDRURO) && \
> >      !(defined(CONFIG_THUMB2_KERNEL) && \
>
> I have tried this patch and the system still stalls.

Ok, thanks for testing. To clarify: did you test with both the get_current() and
__my_cpu_offset() changes applied, or just the get_current() one?

       Arnd
