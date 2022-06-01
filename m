Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4BED653A055
	for <lists+linux-omap@lfdr.de>; Wed,  1 Jun 2022 11:29:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344232AbiFAJ27 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 1 Jun 2022 05:28:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37072 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350422AbiFAJ2M (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 1 Jun 2022 05:28:12 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D71A75C35D;
        Wed,  1 Jun 2022 02:28:10 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 4E1ACB81855;
        Wed,  1 Jun 2022 09:28:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F17C8C36AE2;
        Wed,  1 Jun 2022 09:28:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1654075688;
        bh=iiZO8SpL5l4lZgT8QyC1XjNL9kQkDdoBvgkTrN4vLVk=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=uU73KWJIfpz3qFybI0scp3GCBkahzGtsDpXh9WYI/mLNnfFgzNf/HuIr+qxJEFAvV
         KWj2oviz1umL5FWgZYCWXBjH/4IjLs90alPoRveqo2jnm79XC147Z41bb5QhU0LUnx
         svxlsXw2ljM8pnSMPD7UtH9LujN6RcTI/O0YmovitemhfgtCoc7aQp2+gRH3nffBhK
         1quyw52XgPvn4WAW5V/eFhz3IgipLtHieYanCuGh9+udYBYn/N14FpBOPNQdaJBONd
         TYhnQSK9ov5b2zYlBVrwaHYjQtYYg9EJaXvPc7NM1S5Nx7X9ee6j5bPRgCHVylLXtT
         4q+zjd9Z505mA==
Received: by mail-oo1-f49.google.com with SMTP id c17-20020a4ac311000000b0040ea8bf80f2so241801ooq.1;
        Wed, 01 Jun 2022 02:28:07 -0700 (PDT)
X-Gm-Message-State: AOAM532ElqGyjKS4BGve90yzrD071Biga2qZ3refNRDNvSvjOx3mJIHk
        OOLqLjtWQbOwonuTwe2PLhi/Z9pkNDEV4xyUK2M=
X-Google-Smtp-Source: ABdhPJxC87TPTbcVZH8smwi2BLzzs/bjbciUAZCZE9HPZkXhCIRlx9jtGXFtWXNKKnTeq+qma87ev74oSX4YOitPtrk=
X-Received: by 2002:a4a:d095:0:b0:40e:65c9:1000 with SMTP id
 i21-20020a4ad095000000b0040e65c91000mr21520501oor.98.1654075687062; Wed, 01
 Jun 2022 02:28:07 -0700 (PDT)
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
 <CAK8P3a0Qdav2JaF8yLydxr9amQp30gnY67CVx+ubowUHeG1VeA@mail.gmail.com> <CAMj1kXEL48=w08A2t7522y1visAUcnkkq4LA6ERRP_FbCbEgiw@mail.gmail.com>
In-Reply-To: <CAMj1kXEL48=w08A2t7522y1visAUcnkkq4LA6ERRP_FbCbEgiw@mail.gmail.com>
From:   Ard Biesheuvel <ardb@kernel.org>
Date:   Wed, 1 Jun 2022 11:27:55 +0200
X-Gmail-Original-Message-ID: <CAMj1kXFmFfQ1oZ-CUcwe+ojSkk+9KBH1azhGrEJ4=-pZgMXX-Q@mail.gmail.com>
Message-ID: <CAMj1kXFmFfQ1oZ-CUcwe+ojSkk+9KBH1azhGrEJ4=-pZgMXX-Q@mail.gmail.com>
Subject: Re: am335x: 5.18.x: system stalling
To:     Arnd Bergmann <arnd@arndb.de>
Cc:     Yegor Yefremov <yegorslists@googlemail.com>,
        Tony Lindgren <tony@atomide.com>,
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

On Wed, 1 Jun 2022 at 10:08, Ard Biesheuvel <ardb@kernel.org> wrote:
>
> On Wed, 1 Jun 2022 at 09:59, Arnd Bergmann <arnd@arndb.de> wrote:
> >
> > On Wed, Jun 1, 2022 at 9:36 AM Yegor Yefremov
> > <yegorslists@googlemail.com> wrote:
> > > On Tue, May 31, 2022 at 5:23 PM Arnd Bergmann <arnd@arndb.de> wrote:
> > > > I've pushed a modified branch now, with that fix on the broken commit,
> > > > and another change to make CONFIG_IRQSTACKS user-selectable rather
> > > > than always enabled. That should tell us if the problem is in the SMP
> > > > patching or in the irqstacks.
> > > >
> > > > Can you test the top of this branch with CONFIG_IRQSTACKS disabled,
> > > > and (if that still stalls) retest the fixed commit f0191ea5c2e5 ("[PART 1]
> > > > ARM: implement THREAD_INFO_IN_TASK for uniprocessor systems")?
> > >
> > > 1. the top of this branch with CONFIG_IRQSTACKS disabled stalls
> > > 2. f0191ea5c2e5 with the same config - not
> >
> > Ok, perfect, that does narrow down the problem quite a bit: The final
> > patch has seven changes, all of which can be done individually because
> > in each case the simplified version in f0191ea5c2e5 is meant to run
> > the exact same instructions as the version after the change, when running
> > on a uniprocessor machine such as your am335x.
> >
> > You have already shown earlier that the get_current() and
> > __my_cpu_offset() functions are not to blame here, as reverting
> > only those does not change the behavior.
> >
> > This leaves the is_smp() check in set_current(), and the
> > four macros in <asm/assembler.h>. I don't see anything obviously
> > wrong with any of those five, but I would bet on the macros
> > here. Can you try bisecting into this commit, maybe reverting
> > the changes to set_current and get_current first, and then
> > narrowing it down to (hopefully) a single macro that causes the
> > problem?
> >
>
> set_current() is never called by the primary CPU, which is why the
> is_smp() check was removed from there in 57a420435edcb0b94 ("ARM: drop
> pointless SMP check on secondary startup path").
>
> So that leaves only the four macros in asm/assembler.h, but I don't
> see anything obviously wrong with those either.

I pushed a patch on top of Arnd's branch at the link below that gets
rid of the subsections, and uses normal branches (and code patching)
to switch between the thread ID register and the LDR to retrieve the
CPU offset and the current pointer. I have no explanation whether or
why it could make a difference, but I think it's worth a try.
