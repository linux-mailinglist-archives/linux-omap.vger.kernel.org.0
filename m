Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2B14D53A33F
	for <lists+linux-omap@lfdr.de>; Wed,  1 Jun 2022 12:50:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351067AbiFAKu1 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 1 Jun 2022 06:50:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34164 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1352458AbiFAKuQ (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 1 Jun 2022 06:50:16 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 81F6F633D;
        Wed,  1 Jun 2022 03:50:14 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 98AB3B81977;
        Wed,  1 Jun 2022 10:50:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F9F8C385B8;
        Wed,  1 Jun 2022 10:50:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1654080611;
        bh=z/J74CZ3/BSNe+S0MIQ+I0zuNCCKqJO8tJxAyK3/SCg=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=Q8BoWlJZknF1+TFxgZXHi7fHr4TH/AL+56o8Nzs6G4GCH3UW6teOuy6toUW/CfRDb
         ViHS8nfgOl00IVcS+LwiXLrrAsgaGRIDOAST3XhfjGDsvlP3hw7as0vikUamvF/12Q
         SmY8FfhAJzXiiPFU6Wi9szX4cCN4VB+DYCX5aL9DPPOjxEbKnNs6KRbSTt/n8EOt4q
         r6pVVQVai2l69F95gQBt7/gF3U5dtC2riMX8FGeXrGmEwI8dFerYVg75iFlK0kM5Sr
         34BH5BISXgosEzLGjdf9ljLYDnD6WpYZSPV/bpzTrtTzDQQ7+iveVV2RLF0JUT3wjL
         BN65OwgmugqAw==
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-f2bb84f9edso2133060fac.10;
        Wed, 01 Jun 2022 03:50:11 -0700 (PDT)
X-Gm-Message-State: AOAM532qIXvFJ4mMIIr5ZRU8DHPu/9S9RZD50SE515n6b+I5P0YLuHJn
        KyNtvRIHX5LxfSHcpQlKp60eEUFJQmFQBvjrqN4=
X-Google-Smtp-Source: ABdhPJyfvcrfF1t2F1lT4AQMTQltAfb29GqdrFHeJRQoZAF8a8meZS5QncjxIv1u3nI3R1EnbF4BS/ZBXR2gXL2faFk=
X-Received: by 2002:a05:6870:eaa5:b0:da:b3f:2b45 with SMTP id
 s37-20020a056870eaa500b000da0b3f2b45mr16847571oap.228.1654080610269; Wed, 01
 Jun 2022 03:50:10 -0700 (PDT)
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
 <CAMj1kXHUoDQ0xZ4yBx9uT6D9=6xfOsJoWLoOKho_-=Z9uYS30w@mail.gmail.com> <CAGm1_ks8g3RNwOkC8C_B2eYz56cEA7L-6CRdmqmNwSvAg-JP_g@mail.gmail.com>
In-Reply-To: <CAGm1_ks8g3RNwOkC8C_B2eYz56cEA7L-6CRdmqmNwSvAg-JP_g@mail.gmail.com>
From:   Ard Biesheuvel <ardb@kernel.org>
Date:   Wed, 1 Jun 2022 12:49:58 +0200
X-Gmail-Original-Message-ID: <CAMj1kXH+WR03MX94rd1p7Yz60mfrkOvOx=NYoZ9FCSnqMP4nTw@mail.gmail.com>
Message-ID: <CAMj1kXH+WR03MX94rd1p7Yz60mfrkOvOx=NYoZ9FCSnqMP4nTw@mail.gmail.com>
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

On Wed, 1 Jun 2022 at 12:46, Yegor Yefremov <yegorslists@googlemail.com> wrote:
>
> On Wed, Jun 1, 2022 at 12:06 PM Ard Biesheuvel <ardb@kernel.org> wrote:
> >
> > On Wed, 1 Jun 2022 at 12:04, Yegor Yefremov <yegorslists@googlemail.com> wrote:
> > >
> > > On Wed, Jun 1, 2022 at 11:28 AM Ard Biesheuvel <ardb@kernel.org> wrote:
> > > >
> > > > On Wed, 1 Jun 2022 at 10:08, Ard Biesheuvel <ardb@kernel.org> wrote:
> > > > >
> > > > > On Wed, 1 Jun 2022 at 09:59, Arnd Bergmann <arnd@arndb.de> wrote:
> > > > > >
> > > > > > On Wed, Jun 1, 2022 at 9:36 AM Yegor Yefremov
> > > > > > <yegorslists@googlemail.com> wrote:
> > > > > > > On Tue, May 31, 2022 at 5:23 PM Arnd Bergmann <arnd@arndb.de> wrote:
> > > > > > > > I've pushed a modified branch now, with that fix on the broken commit,
> > > > > > > > and another change to make CONFIG_IRQSTACKS user-selectable rather
> > > > > > > > than always enabled. That should tell us if the problem is in the SMP
> > > > > > > > patching or in the irqstacks.
> > > > > > > >
> > > > > > > > Can you test the top of this branch with CONFIG_IRQSTACKS disabled,
> > > > > > > > and (if that still stalls) retest the fixed commit f0191ea5c2e5 ("[PART 1]
> > > > > > > > ARM: implement THREAD_INFO_IN_TASK for uniprocessor systems")?
> > > > > > >
> > > > > > > 1. the top of this branch with CONFIG_IRQSTACKS disabled stalls
> > > > > > > 2. f0191ea5c2e5 with the same config - not
> > > > > >
> > > > > > Ok, perfect, that does narrow down the problem quite a bit: The final
> > > > > > patch has seven changes, all of which can be done individually because
> > > > > > in each case the simplified version in f0191ea5c2e5 is meant to run
> > > > > > the exact same instructions as the version after the change, when running
> > > > > > on a uniprocessor machine such as your am335x.
> > > > > >
> > > > > > You have already shown earlier that the get_current() and
> > > > > > __my_cpu_offset() functions are not to blame here, as reverting
> > > > > > only those does not change the behavior.
> > > > > >
> > > > > > This leaves the is_smp() check in set_current(), and the
> > > > > > four macros in <asm/assembler.h>. I don't see anything obviously
> > > > > > wrong with any of those five, but I would bet on the macros
> > > > > > here. Can you try bisecting into this commit, maybe reverting
> > > > > > the changes to set_current and get_current first, and then
> > > > > > narrowing it down to (hopefully) a single macro that causes the
> > > > > > problem?
> > > > > >
> > > > >
> > > > > set_current() is never called by the primary CPU, which is why the
> > > > > is_smp() check was removed from there in 57a420435edcb0b94 ("ARM: drop
> > > > > pointless SMP check on secondary startup path").
> > > > >
> > > > > So that leaves only the four macros in asm/assembler.h, but I don't
> > > > > see anything obviously wrong with those either.
> > > >
> > > > I pushed a patch on top of Arnd's branch at the link below that gets
> > > > rid of the subsections, and uses normal branches (and code patching)
> > > > to switch between the thread ID register and the LDR to retrieve the
> > > > CPU offset and the current pointer. I have no explanation whether or
> > > > why it could make a difference, but I think it's worth a try.
> > >
> > > The link to your repo is missing.
> > >
> >
> > Oops, sorry :-)
> >
> > https://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git/log/?h=am335x-stall-test
>
> I have tested your branch and it stalls:
>

OK, thanks for verifying.
