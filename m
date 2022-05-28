Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 62B2C536E42
	for <lists+linux-omap@lfdr.de>; Sat, 28 May 2022 22:00:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229454AbiE1UAX (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sat, 28 May 2022 16:00:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36864 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229459AbiE1UAX (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sat, 28 May 2022 16:00:23 -0400
Received: from mail-ot1-x335.google.com (mail-ot1-x335.google.com [IPv6:2607:f8b0:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 289C184A23;
        Sat, 28 May 2022 13:00:18 -0700 (PDT)
Received: by mail-ot1-x335.google.com with SMTP id h9-20020a056830400900b0060b03bfe792so5168226ots.12;
        Sat, 28 May 2022 13:00:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=/KLzDOmIX3qxkjLX++pQxe3ly1Uf5qfCdyEeGZRMrK8=;
        b=DJyM1fGwnWaTVgarAIn6vo+ICUbSBPq904MOk79IGYpchYCRLrPd09FH9w91800JGh
         UkYsSOxDZ83vv4XGKRDFxTrMDNak9PrxP+D+BHoTAtEuyZ9GZ//yl38w/4x4VB6FZqQz
         8KlGhKbxYkDV1MH3VynFB7GcTszRK+qCg1GcAqqVEEwiT+41+6dQouFkA7gwsj7i6V4I
         6yFx94yVBcqDKMoQStwB7kOOiQi5snJd1OjL5K3mqunmnjd7HoKYd/8IskVkhCEt+JCV
         kG964+uBcphyWRV+xLvoKKLEri4t9eMDNcZ98DI55krwzlA/UE2rSfrfR+IesUV6NZ7h
         YNLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=/KLzDOmIX3qxkjLX++pQxe3ly1Uf5qfCdyEeGZRMrK8=;
        b=oHqypsjqdkIK6jAvrb4eJOeRdZ4Fb4fz1vQKo1A6Uf+hojwtho+j853YYRD4GUCzJl
         h/0DYMGa999+XCCYriBsa9u2s/4ycRMVb+OGphXYYrjypDbv3mbo1567gYwila/oWtwh
         KbPBHTzR8+mmt1Pb6Rr+Mfm/eDY7EpxLRpJmkB3QPfADV8pzflEfbIiShTVLB0XtIDYh
         S2+2LBvE9sRCfNoC+nRlXnLDaEk9XqoZPLir7e3rWJcEG72XyrlLkoT0dA3lFwr+q4cc
         k7sk6iE8+fUg42UmrcmkW/0jlw+j0MCQrppIhnSq3yr7nhOkgoiV1+F/HLaQQzmWPbJ0
         zgsQ==
X-Gm-Message-State: AOAM5311OprUah42uRVd4gyKEluqdqvf3Rr3oBq36xZ4Z60MqBjCGM0r
        0ieolvOdNNiIkswJfdYIziFhPipDZY5dRBiE4Uhyf8vm
X-Google-Smtp-Source: ABdhPJzhRTTaLOpHb1BSjGMpVBAepKYVSPnglt2YA0M4Ryvvi8CwshOaYDYgXo6qcQO6GXJ/VSEYoCB/En8gC/rPqqk=
X-Received: by 2002:a25:af02:0:b0:64f:72b8:ce50 with SMTP id
 a2-20020a25af02000000b0064f72b8ce50mr35392183ybh.528.1653766109000; Sat, 28
 May 2022 12:28:29 -0700 (PDT)
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
 <CAGm1_ksndacPPpyZknvHip=7Fv+3NxXjyfCm_DDMm4EbcBuBig@mail.gmail.com> <CAK8P3a2VV26MhWz95OwfKz+2k35ee8V876iqdJdZ4o1HuNba8A@mail.gmail.com>
In-Reply-To: <CAK8P3a2VV26MhWz95OwfKz+2k35ee8V876iqdJdZ4o1HuNba8A@mail.gmail.com>
From:   Yegor Yefremov <yegorslists@googlemail.com>
Date:   Sat, 28 May 2022 21:28:17 +0200
Message-ID: <CAGm1_ktyCchFwVWhFtrgR621s_fPZJ3u8UmgOPbg7OCOq0h6ZA@mail.gmail.com>
Subject: Re: am335x: 5.18.x: system stalling
To:     Arnd Bergmann <arnd@arndb.de>
Cc:     Ard Biesheuvel <ardb@kernel.org>, Tony Lindgren <tony@atomide.com>,
        Linux-OMAP <linux-omap@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Sat, May 28, 2022 at 3:14 PM Arnd Bergmann <arnd@arndb.de> wrote:
>
> On Sat, May 28, 2022 at 3:01 PM Yegor Yefremov
> <yegorslists@googlemail.com> wrote:
> > On Sat, May 28, 2022 at 11:07 AM Ard Biesheuvel <ardb@kernel.org> wrote=
:
> > In file included from ./include/linux/irqflags.h:17,
> >                  from ./arch/arm/include/asm/bitops.h:28,
> >                  from ./include/linux/bitops.h:33,
> >                  from ./include/linux/log2.h:12,
> >                  from kernel/bounds.c:13:
> > ./arch/arm/include/asm/percpu.h: In function =E2=80=98__my_cpu_offset=
=E2=80=99:
> > ./arch/arm/include/asm/percpu.h:32:9: error: =E2=80=98__per_cpu_offset=
=E2=80=99
> > undeclared (first use in this function); did you mean
> > =E2=80=98__my_cpu_offset=E2=80=99?
> >    32 |  return __per_cpu_offset[0];
> >       |         ^~~~~~~~~~~~~~~~
> >       |         __my_cpu_offset
> > ./arch/arm/include/asm/percpu.h:32:9: note: each undeclared identifier
> > is reported only once for each function it appears in
>
> I think you just missed the line in my patch that adds the
> "extern unsigned long __per_cpu_offset[];" variable declaration.

My bad.

So, I tried both variants and both led to stalls.

Yegor
