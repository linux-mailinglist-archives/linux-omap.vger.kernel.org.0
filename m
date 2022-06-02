Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 65A4A53B6CA
	for <lists+linux-omap@lfdr.de>; Thu,  2 Jun 2022 12:18:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230153AbiFBKRr (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 2 Jun 2022 06:17:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41912 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233519AbiFBKRq (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 2 Jun 2022 06:17:46 -0400
Received: from mail-yb1-xb2b.google.com (mail-yb1-xb2b.google.com [IPv6:2607:f8b0:4864:20::b2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 59A9B1B046F;
        Thu,  2 Jun 2022 03:17:45 -0700 (PDT)
Received: by mail-yb1-xb2b.google.com with SMTP id r82so7444160ybc.13;
        Thu, 02 Jun 2022 03:17:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ADk5iZiJhVeG/cWf0te+HCOZrWubhAAcNQujcLE/58U=;
        b=Yjyhtkt6uOpnbh4Xx6LvKbhfJRLgY9ze6V1oDpkgzObuREsOxaLK2a3UAaJ/61kJEi
         mcYQHMS7y2sI7atXg13x00FCZhVEOXmQh+KbHmFRht3zsicz9J9AgPiM/0xJmMehGW32
         GkES6xLk9LiSQDLBlhWbNYMtmZRV3XzeAWVZ4K+kCPDBt4AA8Dd/iG6laEIJs06qovN6
         ZvV68dkLVvYqW9JXvdroZn0onjcUjoYDM5CYi7OmnJUkpGPQ2JpFcTa1CkKdLOlkBf7z
         sgN2HeUEkCuJYdBtutAjFtQcXEBJQVVyw+blSlqWVVq7A92CUkymUsRyaG11g2Hr7Mw+
         D90w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ADk5iZiJhVeG/cWf0te+HCOZrWubhAAcNQujcLE/58U=;
        b=gqvhEB8sIs9dET2mn4nz8zMtnF7WjV4w2h6LYzyY2mMhsBlXCNXlAWGrUGxxm2B6u7
         V5vLOA2BfokD9MOZB8wS7KKKV7WoSclW9jzv4qypvld3hWsrnWZW3aYaEW37XYFQqVLP
         rw7utNiQbYZWDY3ftZBai4m+msdT5FoZ4x7BpiAziEx95DpyPe1Y5mMrcBnIxp+KxCq/
         E+mFC4LIvB2gG6F8KFEF/M/sJM9JOb+1mMOxhAl3E39oRX2nWHQya/6byQdmEuRHVBxH
         ALWvMqOp/AB2rB1v6lJ0TnlS/tM6o9UGnwWC9rY8wl8D6qOMBraiGjH2md+nzmyQW/3u
         +yQg==
X-Gm-Message-State: AOAM530UhRVhNGbOXp1StbYQebhkqDqMhR+h3pZKdVxZJZ+uBwiXSIfd
        yqCej4s8SG8806kmPyVK8DIRBTKJNAezS6io4f0=
X-Google-Smtp-Source: ABdhPJwQuufe38w25lspgUqLBTNVJRZdVkrxK6a1Jl0GQFLaCIka66EJILJHy+YRs/+zHx7XKyF3LxWBMfvUK8JVSuQ=
X-Received: by 2002:a05:6902:4ad:b0:65c:c0b3:d8e with SMTP id
 r13-20020a05690204ad00b0065cc0b30d8emr4475878ybs.582.1654165064541; Thu, 02
 Jun 2022 03:17:44 -0700 (PDT)
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
 <CAGm1_ks8g3RNwOkC8C_B2eYz56cEA7L-6CRdmqmNwSvAg-JP_g@mail.gmail.com> <CAMj1kXH+WR03MX94rd1p7Yz60mfrkOvOx=NYoZ9FCSnqMP4nTw@mail.gmail.com>
In-Reply-To: <CAMj1kXH+WR03MX94rd1p7Yz60mfrkOvOx=NYoZ9FCSnqMP4nTw@mail.gmail.com>
From:   Yegor Yefremov <yegorslists@googlemail.com>
Date:   Thu, 2 Jun 2022 12:17:33 +0200
Message-ID: <CAGm1_kvZ_6tPgfrTc3pH+6TedoU+mvuEXb+7aEp5mXfx516fmA@mail.gmail.com>
Subject: Re: am335x: 5.18.x: system stalling
To:     Ard Biesheuvel <ardb@kernel.org>
Cc:     Arnd Bergmann <arnd@arndb.de>, Tony Lindgren <tony@atomide.com>,
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

On Wed, Jun 1, 2022 at 12:50 PM Ard Biesheuvel <ardb@kernel.org> wrote:
>
> On Wed, 1 Jun 2022 at 12:46, Yegor Yefremov <yegorslists@googlemail.com> wrote:
> >
> > On Wed, Jun 1, 2022 at 12:06 PM Ard Biesheuvel <ardb@kernel.org> wrote:
> > >
> > > On Wed, 1 Jun 2022 at 12:04, Yegor Yefremov <yegorslists@googlemail.com> wrote:
> > > >
> > > > On Wed, Jun 1, 2022 at 11:28 AM Ard Biesheuvel <ardb@kernel.org> wrote:
> > > > >
> > > > > On Wed, 1 Jun 2022 at 10:08, Ard Biesheuvel <ardb@kernel.org> wrote:
> > > > > >
> > > > > > On Wed, 1 Jun 2022 at 09:59, Arnd Bergmann <arnd@arndb.de> wrote:
> > > > > > >
> > > > > > > On Wed, Jun 1, 2022 at 9:36 AM Yegor Yefremov
> > > > > > > <yegorslists@googlemail.com> wrote:
> > > > > > > > On Tue, May 31, 2022 at 5:23 PM Arnd Bergmann <arnd@arndb.de> wrote:
> > > > > > > > > I've pushed a modified branch now, with that fix on the broken commit,
> > > > > > > > > and another change to make CONFIG_IRQSTACKS user-selectable rather
> > > > > > > > > than always enabled. That should tell us if the problem is in the SMP
> > > > > > > > > patching or in the irqstacks.
> > > > > > > > >
> > > > > > > > > Can you test the top of this branch with CONFIG_IRQSTACKS disabled,
> > > > > > > > > and (if that still stalls) retest the fixed commit f0191ea5c2e5 ("[PART 1]
> > > > > > > > > ARM: implement THREAD_INFO_IN_TASK for uniprocessor systems")?
> > > > > > > >
> > > > > > > > 1. the top of this branch with CONFIG_IRQSTACKS disabled stalls
> > > > > > > > 2. f0191ea5c2e5 with the same config - not
> > > > > > >
> > > > > > > Ok, perfect, that does narrow down the problem quite a bit: The final
> > > > > > > patch has seven changes, all of which can be done individually because
> > > > > > > in each case the simplified version in f0191ea5c2e5 is meant to run
> > > > > > > the exact same instructions as the version after the change, when running
> > > > > > > on a uniprocessor machine such as your am335x.
> > > > > > >
> > > > > > > You have already shown earlier that the get_current() and
> > > > > > > __my_cpu_offset() functions are not to blame here, as reverting
> > > > > > > only those does not change the behavior.
> > > > > > >
> > > > > > > This leaves the is_smp() check in set_current(), and the
> > > > > > > four macros in <asm/assembler.h>. I don't see anything obviously
> > > > > > > wrong with any of those five, but I would bet on the macros
> > > > > > > here. Can you try bisecting into this commit, maybe reverting
> > > > > > > the changes to set_current and get_current first, and then
> > > > > > > narrowing it down to (hopefully) a single macro that causes the
> > > > > > > problem?
> > > > > > >
> > > > > >
> > > > > > set_current() is never called by the primary CPU, which is why the
> > > > > > is_smp() check was removed from there in 57a420435edcb0b94 ("ARM: drop
> > > > > > pointless SMP check on secondary startup path").
> > > > > >
> > > > > > So that leaves only the four macros in asm/assembler.h, but I don't
> > > > > > see anything obviously wrong with those either.
> > > > >
> > > > > I pushed a patch on top of Arnd's branch at the link below that gets
> > > > > rid of the subsections, and uses normal branches (and code patching)
> > > > > to switch between the thread ID register and the LDR to retrieve the
> > > > > CPU offset and the current pointer. I have no explanation whether or
> > > > > why it could make a difference, but I think it's worth a try.
> > > >
> > > > The link to your repo is missing.
> > > >
> > >
> > > Oops, sorry :-)
> > >
> > > https://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git/log/?h=am335x-stall-test
> >
> > I have tested your branch and it stalls:
> >
>
> OK, thanks for verifying.

My bisection results for f0191ea5c2e5aab29484ede0493ca385eec5472f as a base:

percpu.h: sporadic stalls
current.h: always stalls
assembler.h: no stalls
smp.c: no stalls

Yegor
