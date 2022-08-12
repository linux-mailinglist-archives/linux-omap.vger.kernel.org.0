Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D0FAA590C9A
	for <lists+linux-omap@lfdr.de>; Fri, 12 Aug 2022 09:35:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237243AbiHLHfb (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 12 Aug 2022 03:35:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38254 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231848AbiHLHfa (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 12 Aug 2022 03:35:30 -0400
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.74])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB72C1ADA6;
        Fri, 12 Aug 2022 00:35:27 -0700 (PDT)
Received: from mail-ed1-f44.google.com ([209.85.208.44]) by
 mrelayeu.kundenserver.de (mreue106 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1MZk5x-1nqM8n0VCJ-00WoSR; Fri, 12 Aug 2022 09:35:26 +0200
Received: by mail-ed1-f44.google.com with SMTP id s11so294349edd.13;
        Fri, 12 Aug 2022 00:35:26 -0700 (PDT)
X-Gm-Message-State: ACgBeo0bVORcpUdPkNi38i/1V0ULSx/xaKzagu/Kryfme4MHVWBnte1t
        Ddd8T+3rh+Qt35WcOb361JzODZmUpablBllbV0I=
X-Google-Smtp-Source: AA6agR7d73K1JI+2j3beJFux8c8Wf4kaJC0XjVT9fnbjKPpCy0Fq1z0rMFQPm9SjjvRe8XGdGR1auu7RdSUkFtG8HTA=
X-Received: by 2002:a05:6402:3693:b0:43d:1a40:21fd with SMTP id
 ej19-20020a056402369300b0043d1a4021fdmr2423687edb.206.1660289725735; Fri, 12
 Aug 2022 00:35:25 -0700 (PDT)
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
 <CAGm1_kvrivJLsFJaZtr6ojryDZFu3Xmpum8FURoFT9vMr54LUA@mail.gmail.com>
 <CAK8P3a2113EnZw9BNjCYYmKuNqEk4CtZCC0ydBNNQXetvzTSEg@mail.gmail.com>
 <CAGm1_kuUVKAxcxENnvsq5AGzeXAeXP6yLmjt1MQSpfjdcvZjng@mail.gmail.com>
 <CAK8P3a1VeP6YMYV6hh13K1Q3epuO5wRUmTByY7YVVT86J1giqg@mail.gmail.com>
 <CAMj1kXEzK2eEXLHP2OH6APpw+yC66XQafFWs6kMni1i+bDC4uA@mail.gmail.com> <CAGm1_kvutEPNXSVLD6PJ+ND8urrTksKHtELwCLd7sboBUyoz+w@mail.gmail.com>
In-Reply-To: <CAGm1_kvutEPNXSVLD6PJ+ND8urrTksKHtELwCLd7sboBUyoz+w@mail.gmail.com>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Fri, 12 Aug 2022 09:35:09 +0200
X-Gmail-Original-Message-ID: <CAK8P3a0H4kA0atdyDc_Tr95uZPc1nbPxx3CTQ8o35J1YjYW14g@mail.gmail.com>
Message-ID: <CAK8P3a0H4kA0atdyDc_Tr95uZPc1nbPxx3CTQ8o35J1YjYW14g@mail.gmail.com>
Subject: Re: am335x: 5.18.x: system stalling
To:     Yegor Yefremov <yegorslists@googlemail.com>
Cc:     Ard Biesheuvel <ardb@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Tony Lindgren <tony@atomide.com>,
        Linux-OMAP <linux-omap@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:yG7FIwRbY+Xt91aAA4Yefo/FMrjYsoC4BoLjNhKugx3LHQQgcJd
 JAndxn0bFs+zCy+PLyANhPQVYKXu6A+DL736gsw6R2yy02c8mO1uICTjs/SmsF83sU9Nw3U
 eAgkfiTiU6j5oq+sQP7aEatSotXiDgyFV4tDnS3SPHvcGYtUhWOzCi0dEYFNoO838OUi35d
 QXlnd9Jz75laebKGLDsXg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:WvaY+IWhHpg=:Yyi+2YnvbvSOgU7dr98dLf
 6OQ6PyWjYij5xoIzQiw9eI/xyax6aJG+kDUitIlNlOO4K0mj4ysAfrZuuo66fXv3pENefCR7R
 dougE6NfTZ7Iw86klJmHa57v3DGzGICCenhgAxR3TgZS7U5CV6YsMg0XpMyD2uVl8RFJqFhH6
 J0qnXIBxIPjJv72cojmsRQbGzmMD0+WEkhYKekyFOUXyJOyni4egBScYu2UloTJC5C0OdKZEV
 sgncDs5khDxDiiDe5beCRY02T1VyFVoQ8hirQ6tHUruzSaFTJlEzt6by0IpcMTqn6mYL0dJz6
 zYQekB+iX36vqMibuMN0u1azpdsngmPJDfUkwb0zVgKOAyzaBAr1MHkerCadg5w+vmxBdZ2l7
 twCYdVLDS1yWVSUbA0CdpyuVf/lnyg0XoJXsQWKBw5pFkshEpomfdlzu9eqIGB7LHG3vrfp0F
 ql2/7/AeEt0WPvDzwdqv2/j7YnFQMLX6tgxitSNtd5LVS0CwyJ2XfSetDCocZfMpDCOpM5gkV
 G+5NEtugSXaxsqUwHbUOIb8lCO3p9PH9WrNQ/KKLdSH1pCGN4MHqCMmN5XJoVjRvh3E7ixM/R
 k6pxXfr+5YqWFm3LF5j9W3aWToxh0t5CQgRB3ed6TxV1cKUojNqWolOHpCTDTp1OuU0BvzbQw
 k7Tm9/07/+3ZstWqbU8/Y3dq58ufIj1cvysngS/KSHDsE42lC4T64kPO8v9Xn1OL7fUlzp9Hj
 N8XZ8O5deb5rJD06IHdzaNrvhVZdo+wdc0zr5Q==
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Tue, Jun 7, 2022 at 10:55 AM Yegor Yefremov
<yegorslists@googlemail.com> wrote:
> On Sun, Jun 5, 2022 at 4:59 PM Ard Biesheuvel <ardb@kernel.org> wrote:
> > On Fri, 3 Jun 2022 at 22:47, Arnd Bergmann <arnd@arndb.de> wrote:
> > > On Fri, Jun 3, 2022 at 9:11 PM Yegor Yefremov <yegorslists@googlemail.com> wrote:
> > > >
> > > > With compiled-in drivers the system doesn't stall. All other tests and
> > > > related outputs will come next week.
> > >
> > > Ah, nice!
> > >
> > > It's probably a reasonable assumption that the smp-patched get_current()
> > > is (at least sometimes) broken in modules but working in the kernel itself.
> > > I suppose that means in the worst case we can hot-fix the issue by
> > > having an 'extern' version of get_current() for the case of
> > > armv6+smp+module ;-)
> > >
> >
> > I've coded something up along those lines, and pushed it to my
> > am335x-stall-test branch.
> >
> > > Maybe start with the ".long 0xe7f001f2" hack I suggested in my last
> > > mail. If that gives you an oops for the module case, then we know
> > > that the patching doesn't work at all and you don't have to try anything
> > > else, otherwise it's more likely that an incorrect instruction sequence
> > > is patched in.
> > >
> >
> > Yeah, I'd be really surprised if the patching misses some occurrences,
> > so I have no clue what is going on here.
> >
> > Yegor, can you please try my branch with the original config (i.e.,
> > slcan and ftdio as modules)
> >
> > https://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git/log/?h=am335x-stall-test
>
> @Arnd: I have applied your patch with this change:
>
> asm("0: .long 0xe7f001f2                        \n\t" // BUG() trap
>
> But it revealed nothing new:
>
> [   50.754130] rcu: INFO: rcu_sched self-detected stall on CPU
>
> @Ard: I have tried your branch
> (21b6671c82d4df52ea0c7837705331acb375c5c8). The system still stalls.

Getting back to this old thread, as we never found out what is
actually going on.

It seems we are still stuck trying to figure out why a kernel with ARMv6
support and SMP patching is broken, or if the same bug might also affect
other configurations without ARMv6 support. This is of course very
unfortunate, but unless someone has an idea for how to debug the problem
further, I suppose we should at least prevent that broken configuration and
disallow enabling CONFIG_SMP in combination with ARMv6 (pre-ARMv6K)
CPUs, to keep others from running into the same problem.

Any other suggestions?

        Arnd
