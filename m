Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5372653B767
	for <lists+linux-omap@lfdr.de>; Thu,  2 Jun 2022 12:38:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233941AbiFBKhw (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 2 Jun 2022 06:37:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39922 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233952AbiFBKht (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 2 Jun 2022 06:37:49 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C949429F5AA;
        Thu,  2 Jun 2022 03:37:47 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 8BAE0B81D81;
        Thu,  2 Jun 2022 10:37:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 585B2C3411E;
        Thu,  2 Jun 2022 10:37:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1654166265;
        bh=7QMtOgu5XbT6lxFMq+0BiAHaw/SCYNRKnCpofv7YzLY=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=kS1psSFkPN2w8WXDavVwLFz93bqPyBtRjQLVjgkWZksYBgDy4M8uR7zAY2YX86op6
         Xr/EkjSh3aTYVSFZlKu+aAenT280NdRJFPLqCkgFYUiX6GGWJytjMHiPyFOrcP7fk6
         MCxPwSYjurypjfx9Qf634IeOAKgyzR7dkZSHdwJ1VedHzo/U+aOHhZD3ynHTQACAwG
         r5QKH9iFe5KhWQ0S+JRR6iLXYqKRlBFV/XxZbXjTm5+KQZEKtO6IlUJWOGmf+dZ4ND
         4vlMJs+tCT/P/iyNtUFjPQklip5BP+hEPgxStzNk54p3rmJ+fuccL5eiLq9dsZiLzn
         yDOH+sAnNaV/w==
Received: by mail-oi1-f181.google.com with SMTP id m82so5984169oif.13;
        Thu, 02 Jun 2022 03:37:45 -0700 (PDT)
X-Gm-Message-State: AOAM533lhC0BItXQ9HnIEHWcK8wkFicejriwi2W+qUzzeiyEfDmt7xAm
        oCJLYIfnxFpEJ8cpotvPrBo5zKNZdGyp80JLDTY=
X-Google-Smtp-Source: ABdhPJzISgF2r/IFJ0l9A0zj6pZ/5fIfdoySbqr3f4efDkSgOkHCXk1sexQNZRpmy1RTH9FMOhv2uH1PooM3oJxgCUI=
X-Received: by 2002:a05:6808:300e:b0:32c:425e:df34 with SMTP id
 ay14-20020a056808300e00b0032c425edf34mr2164825oib.126.1654166264341; Thu, 02
 Jun 2022 03:37:44 -0700 (PDT)
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
 <CAMj1kXH+WR03MX94rd1p7Yz60mfrkOvOx=NYoZ9FCSnqMP4nTw@mail.gmail.com> <CAGm1_kvZ_6tPgfrTc3pH+6TedoU+mvuEXb+7aEp5mXfx516fmA@mail.gmail.com>
In-Reply-To: <CAGm1_kvZ_6tPgfrTc3pH+6TedoU+mvuEXb+7aEp5mXfx516fmA@mail.gmail.com>
From:   Ard Biesheuvel <ardb@kernel.org>
Date:   Thu, 2 Jun 2022 12:37:32 +0200
X-Gmail-Original-Message-ID: <CAMj1kXEfKLYYxt9imEO155oxWTzXtWPpF8txGZ-xCs_6vez-WA@mail.gmail.com>
Message-ID: <CAMj1kXEfKLYYxt9imEO155oxWTzXtWPpF8txGZ-xCs_6vez-WA@mail.gmail.com>
Subject: Re: am335x: 5.18.x: system stalling
To:     Yegor Yefremov <yegorslists@googlemail.com>
Cc:     Arnd Bergmann <arnd@arndb.de>, Tony Lindgren <tony@atomide.com>,
        Linux-OMAP <linux-omap@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Thu, 2 Jun 2022 at 12:17, Yegor Yefremov <yegorslists@googlemail.com> wrote:
>
> On Wed, Jun 1, 2022 at 12:50 PM Ard Biesheuvel <ardb@kernel.org> wrote:
> >
> > On Wed, 1 Jun 2022 at 12:46, Yegor Yefremov <yegorslists@googlemail.com> wrote:
> > >
> > > On Wed, Jun 1, 2022 at 12:06 PM Ard Biesheuvel <ardb@kernel.org> wrote:
> > > >
> > > > On Wed, 1 Jun 2022 at 12:04, Yegor Yefremov <yegorslists@googlemail.com> wrote:
> > > > >
> > > > > On Wed, Jun 1, 2022 at 11:28 AM Ard Biesheuvel <ardb@kernel.org> wrote:
> > > > > >
> > > > > > On Wed, 1 Jun 2022 at 10:08, Ard Biesheuvel <ardb@kernel.org> wrote:
> > > > > > >
> > > > > > > On Wed, 1 Jun 2022 at 09:59, Arnd Bergmann <arnd@arndb.de> wrote:
> > > > > > > >
> > > > > > > > On Wed, Jun 1, 2022 at 9:36 AM Yegor Yefremov
> > > > > > > > <yegorslists@googlemail.com> wrote:
> > > > > > > > > On Tue, May 31, 2022 at 5:23 PM Arnd Bergmann <arnd@arndb.de> wrote:
> > > > > > > > > > I've pushed a modified branch now, with that fix on the broken commit,
> > > > > > > > > > and another change to make CONFIG_IRQSTACKS user-selectable rather
> > > > > > > > > > than always enabled. That should tell us if the problem is in the SMP
> > > > > > > > > > patching or in the irqstacks.
> > > > > > > > > >
> > > > > > > > > > Can you test the top of this branch with CONFIG_IRQSTACKS disabled,
> > > > > > > > > > and (if that still stalls) retest the fixed commit f0191ea5c2e5 ("[PART 1]
> > > > > > > > > > ARM: implement THREAD_INFO_IN_TASK for uniprocessor systems")?
> > > > > > > > >
> > > > > > > > > 1. the top of this branch with CONFIG_IRQSTACKS disabled stalls
> > > > > > > > > 2. f0191ea5c2e5 with the same config - not
> > > > > > > >
> > > > > > > > Ok, perfect, that does narrow down the problem quite a bit: The final
> > > > > > > > patch has seven changes, all of which can be done individually because
> > > > > > > > in each case the simplified version in f0191ea5c2e5 is meant to run
> > > > > > > > the exact same instructions as the version after the change, when running
> > > > > > > > on a uniprocessor machine such as your am335x.
> > > > > > > >
> > > > > > > > You have already shown earlier that the get_current() and
> > > > > > > > __my_cpu_offset() functions are not to blame here, as reverting
> > > > > > > > only those does not change the behavior.
> > > > > > > >
> > > > > > > > This leaves the is_smp() check in set_current(), and the
> > > > > > > > four macros in <asm/assembler.h>. I don't see anything obviously
> > > > > > > > wrong with any of those five, but I would bet on the macros
> > > > > > > > here. Can you try bisecting into this commit, maybe reverting
> > > > > > > > the changes to set_current and get_current first, and then
> > > > > > > > narrowing it down to (hopefully) a single macro that causes the
> > > > > > > > problem?
> > > > > > > >
> > > > > > >
> > > > > > > set_current() is never called by the primary CPU, which is why the
> > > > > > > is_smp() check was removed from there in 57a420435edcb0b94 ("ARM: drop
> > > > > > > pointless SMP check on secondary startup path").
> > > > > > >
> > > > > > > So that leaves only the four macros in asm/assembler.h, but I don't
> > > > > > > see anything obviously wrong with those either.
> > > > > >
> > > > > > I pushed a patch on top of Arnd's branch at the link below that gets
> > > > > > rid of the subsections, and uses normal branches (and code patching)
> > > > > > to switch between the thread ID register and the LDR to retrieve the
> > > > > > CPU offset and the current pointer. I have no explanation whether or
> > > > > > why it could make a difference, but I think it's worth a try.
> > > > >
> > > > > The link to your repo is missing.
> > > > >
> > > >
> > > > Oops, sorry :-)
> > > >
> > > > https://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git/log/?h=am335x-stall-test
> > >
> > > I have tested your branch and it stalls:
> > >
> >
> > OK, thanks for verifying.
>
> My bisection results for f0191ea5c2e5aab29484ede0493ca385eec5472f as a base:
>
> percpu.h: sporadic stalls
> current.h: always stalls
> assembler.h: no stalls
> smp.c: no stalls
>

So you mean that applying the changes to each of those files in
isolation to the baseline in f0191ea5c2e5aab29484ede0493ca385eec5472f
produces those results, right?

That confirms my statement that smp.c cannot be the culprit, and
appears to exonerate the pure asm pieces. I wonder if this is related
to insufficient asm constraints on the C helpers, or just the cost
model taking different decisions because the inline asm string is much
longer. In any case, this opens up a couple of avenues we could
explore to narrow this down further.

As a quick check, can you try the below snippet applied onto the
broken current.h build?

--- a/arch/arm/include/asm/current.h
+++ b/arch/arm/include/asm/current.h
@@ -53,7 +53,8 @@ static __always_inline __attribute_const__ struct
task_struct *get_current(void)
            "   b       . + (2b - 0b)                           \n\t"
            "   .popsection                                     \n\t"
 #endif
-           : "=r"(cur));
+           : "=r"(cur)
+           : "Q" (*(const unsigned long *)current_stack_pointer));
 #elif __LINUX_ARM_ARCH__>= 7 || \
       !defined(CONFIG_ARM_HAS_GROUP_RELOCS) || \
       (defined(MODULE) && defined(CONFIG_ARM_MODULE_PLTS))

Given that the problematic sequence appears to be in C code, could you
please confirm whether or not the stall is reproducible when all the
pieces that are used by the CAN stack (musb, slcan, ftdio-sio, etc)
are built into the kernel rather than built as modules? Also, which
GCC version are you using?
