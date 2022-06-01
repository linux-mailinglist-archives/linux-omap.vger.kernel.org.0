Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3704C539E5E
	for <lists+linux-omap@lfdr.de>; Wed,  1 Jun 2022 09:36:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345526AbiFAHg2 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 1 Jun 2022 03:36:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55378 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345599AbiFAHgZ (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 1 Jun 2022 03:36:25 -0400
Received: from mail-yw1-x112f.google.com (mail-yw1-x112f.google.com [IPv6:2607:f8b0:4864:20::112f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 867BB8BD2E;
        Wed,  1 Jun 2022 00:36:23 -0700 (PDT)
Received: by mail-yw1-x112f.google.com with SMTP id 00721157ae682-306b5b452b1so9307017b3.1;
        Wed, 01 Jun 2022 00:36:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=7CCQa39SGQ9dVfo6kYlr8Pz8EWwXxGFs+Ui1e66PB8U=;
        b=brofxjrOJHt1PACyZ46xvD4vWJ8JJyiRQP+f62CYBQFOgISBkGBEnugmpZ0hDPNkby
         vv+TeqtwR2FDFnjidTGtjvGW5fr/g/gUijbmZiRZtOQA8q+ybM91bYUwEZmuMleAPaqT
         BKkH8ZUxs91xT+5C3QCOVyOrH5WP6+MRsxwMUDUScJybF3mlrjLVPU0VVHgMWU/h6l1X
         WaXB/7NSrkhd3KA4cKwX6AotiTFIb3/Dy9O59MD8DNkOh4jCE+F5GytJ5ec0x7zI93mr
         t8x9NNoSOgoKF8hHCoCucAMlUODvvNACGQLgKN6HFzFgfT+g8aodYvOF6Ysg/b96nhLs
         jp5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7CCQa39SGQ9dVfo6kYlr8Pz8EWwXxGFs+Ui1e66PB8U=;
        b=r7b+nyHJOOZeHDeMkqTBy1e380KfzCITUuCFs6MurjFEwOQPrD4N0lSh03cf8n7eTy
         tMiBz4cWukWcmaEvs/iZxChIzLINYA7TO1wp+nIlIK2NSzCGezAwZ2Vy0ZCRN6B7m/BR
         WNF+G9QgUCFPEPODFHJ13y5f5xKhpe8YY0RM/xgXYo3FfbdDsU1nxm25eqKedaDZ2NSP
         xH07YHx5+UR4YS3/fOR0whDJD9PB2axPD+3vlkNUB5izka1YRbkbwNkB+aykkH3yudqQ
         vYd4F8BkpSFMMOdwBPHVeMyVRHRgWS0LZ1fzqqV74mUxjqgV39oTyRZjr/RPfZr5hxOQ
         FbDA==
X-Gm-Message-State: AOAM533Vx6mlkbFMNEwKizO/nRPQfbzTw/CCrVMcdO1DlBmqCK+G85SE
        GJCEjFID35botGWsqNmYLCTUFoEGnjA80tcf3q8FlofwjfU=
X-Google-Smtp-Source: ABdhPJy1YMedQNa6c5TKF2oWOm2qRGAFR7bQLRhS8gDTqJgtMv5B9JnCe2XnJW/ELrrnHsx1QcVgh8tEuvG2q2RQKsM=
X-Received: by 2002:a05:690c:102:b0:2ef:48d8:24c3 with SMTP id
 bd2-20020a05690c010200b002ef48d824c3mr69734516ywb.153.1654068982718; Wed, 01
 Jun 2022 00:36:22 -0700 (PDT)
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
 <CAGm1_ksmXTnEo_Mxk7+S4vs_CQAs5ZHoEOpq9Tq3ZFf7sruX7A@mail.gmail.com> <CAK8P3a1nhBnbbocBNkKUKYhw14OYE0WPEyQcJJXzbpW4uASu_Q@mail.gmail.com>
In-Reply-To: <CAK8P3a1nhBnbbocBNkKUKYhw14OYE0WPEyQcJJXzbpW4uASu_Q@mail.gmail.com>
From:   Yegor Yefremov <yegorslists@googlemail.com>
Date:   Wed, 1 Jun 2022 09:36:11 +0200
Message-ID: <CAGm1_kswMZkoV9_DnB71ugVTF_rh5SV2NazkHROwXiFqhxTWYA@mail.gmail.com>
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

On Tue, May 31, 2022 at 5:23 PM Arnd Bergmann <arnd@arndb.de> wrote:
>
> On Tue, May 31, 2022 at 4:16 PM Yegor Yefremov
> <yegorslists@googlemail.com> wrote:
> > On Tue, May 31, 2022 at 10:36 AM Yegor Yefremov <yegorslists@googlemail.com> wrote:
> > # bad: [b6b3b4814e77d2f5a7517297e9ac1d1aa1cda103] [PART 1] ARM:
> > implement THREAD_INFO_IN_TASK for uniprocessor systems
> > git bisect bad b6b3b4814e77d2f5a7517297e9ac1d1aa1cda103
> > # good: [dccfc18999cf4b4e518f01d5c7c578426166e5f2] ARM: v7m: enable
> > support for IRQ stacks
> > git bisect good dccfc18999cf4b4e518f01d5c7c578426166e5f2
> > # first bad commit: [b6b3b4814e77d2f5a7517297e9ac1d1aa1cda103] [PART
> > 1] ARM: implement THREAD_INFO_IN_TASK for uniprocessor systems
> >
> > Though commit b6b3b4814e77d2f5a7517297e9ac1d1aa1cda103 led to a broken
> > kernel that didn't even show any output after the bootloader had
> > started it.
> >
> > Commit 2d3456213319c0277ee6082946c43c3afacca9b4 showed the expected stalling.
>
> Ok, good, so we know that the "ARM: implement THREAD_INFO_IN_TASK for
> uniprocessor system" commit caused the problem then. This is what we had
> already assumed, but now it's confirmed.
>
> Too bad I screwed up that "this_cpu_offset" macro, I think it should
> have been
>
> @@ -286,7 +286,7 @@ THUMB(      fpreg   .req    r7      )
>          *                   register 'rd'
>          */
>         .macro          this_cpu_offset, rd:req
> -       mov             \rd, #0
> +       ldr_va          \rd, __per_cpu_offset
>         .endm
>
>         /*
>
> I've pushed a modified branch now, with that fix on the broken commit,
> and another change to make CONFIG_IRQSTACKS user-selectable rather
> than always enabled. That should tell us if the problem is in the SMP
> patching or in the irqstacks.
>
> Can you test the top of this branch with CONFIG_IRQSTACKS disabled,
> and (if that still stalls) retest the fixed commit f0191ea5c2e5 ("[PART 1]
> ARM: implement THREAD_INFO_IN_TASK for uniprocessor systems")?

1. the top of this branch with CONFIG_IRQSTACKS disabled stalls
2. f0191ea5c2e5 with the same config - not

Yegor
