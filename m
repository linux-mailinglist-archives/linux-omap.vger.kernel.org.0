Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C39485378F3
	for <lists+linux-omap@lfdr.de>; Mon, 30 May 2022 12:29:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235161AbiE3KQc (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 30 May 2022 06:16:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49796 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232292AbiE3KQb (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 30 May 2022 06:16:31 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 350987C146;
        Mon, 30 May 2022 03:16:30 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id CA5B6B80B98;
        Mon, 30 May 2022 10:16:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85B9FC36AE3;
        Mon, 30 May 2022 10:16:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1653905787;
        bh=apmXmn8s9Y9OrilVKgqOE3fGsfmklKpZK176L6+lhV0=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=SSyGrMu4ORz//xm5ngjkeE9FlIPtYhIeywjDpSnNLJMZYGXF1FhGmdr7DUbtwnUuQ
         JSsuWlOsa5AgGNZB3SqLEV4q6ixLo86lm5c/3y8RK/jSL4m+pldBfnWIHlHk9BMFrO
         c2M2z+47HuC+9qFie6GvbmsQ2CQsQpCs8m/3n0O9rTzJKsVsJGbu+psxrPpUXqWesM
         1NGNxmae+jaVvJoKuXrnnQCYP2ngdRZuLv0r/gb89AhtJM+KZQsSgbLpGu2Un0hZTn
         +/ZRnLDMmA8+5l+m5Ti/iQqsOQ7XsfimIR39EPc/GaRNV+XbBeA4jW8gijFLsevOCW
         o8vimNMkLcatg==
Received: by mail-oi1-f178.google.com with SMTP id l84so13421095oif.10;
        Mon, 30 May 2022 03:16:27 -0700 (PDT)
X-Gm-Message-State: AOAM532v/Wu82Zi1gXaMxk2CK98y8NGYbSRehq2y7aBTnXZkSh6uESra
        /r7YeVROgkhkMLlogf2IFJXZRrBGa+CzHzv3gO0=
X-Google-Smtp-Source: ABdhPJwap8On8L2Lf266wMBFZLMhUzE+Hlu61GQye2UxjxYRTSF5fKB6hy23DluSIthvInHhzBEGwYkOOxtfVj6XG7A=
X-Received: by 2002:a05:6808:f88:b0:32b:d10f:cc6b with SMTP id
 o8-20020a0568080f8800b0032bd10fcc6bmr7580561oiw.228.1653905786692; Mon, 30
 May 2022 03:16:26 -0700 (PDT)
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
 <CAK8P3a2VV26MhWz95OwfKz+2k35ee8V876iqdJdZ4o1HuNba8A@mail.gmail.com> <CAGm1_ktyCchFwVWhFtrgR621s_fPZJ3u8UmgOPbg7OCOq0h6ZA@mail.gmail.com>
In-Reply-To: <CAGm1_ktyCchFwVWhFtrgR621s_fPZJ3u8UmgOPbg7OCOq0h6ZA@mail.gmail.com>
From:   Ard Biesheuvel <ardb@kernel.org>
Date:   Mon, 30 May 2022 12:16:15 +0200
X-Gmail-Original-Message-ID: <CAMj1kXGrBDkPgux0gOxO1i_1qNTXGKGHOVGZ61jn7oKBLYc-Vg@mail.gmail.com>
Message-ID: <CAMj1kXGrBDkPgux0gOxO1i_1qNTXGKGHOVGZ61jn7oKBLYc-Vg@mail.gmail.com>
Subject: Re: am335x: 5.18.x: system stalling
To:     Yegor Yefremov <yegorslists@googlemail.com>
Cc:     Arnd Bergmann <arnd@arndb.de>, Tony Lindgren <tony@atomide.com>,
        Linux-OMAP <linux-omap@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Sat, 28 May 2022 at 21:28, Yegor Yefremov <yegorslists@googlemail.com> w=
rote:
>
> On Sat, May 28, 2022 at 3:14 PM Arnd Bergmann <arnd@arndb.de> wrote:
> >
> > On Sat, May 28, 2022 at 3:01 PM Yegor Yefremov
> > <yegorslists@googlemail.com> wrote:
> > > On Sat, May 28, 2022 at 11:07 AM Ard Biesheuvel <ardb@kernel.org> wro=
te:
> > > In file included from ./include/linux/irqflags.h:17,
> > >                  from ./arch/arm/include/asm/bitops.h:28,
> > >                  from ./include/linux/bitops.h:33,
> > >                  from ./include/linux/log2.h:12,
> > >                  from kernel/bounds.c:13:
> > > ./arch/arm/include/asm/percpu.h: In function =E2=80=98__my_cpu_offset=
=E2=80=99:
> > > ./arch/arm/include/asm/percpu.h:32:9: error: =E2=80=98__per_cpu_offse=
t=E2=80=99
> > > undeclared (first use in this function); did you mean
> > > =E2=80=98__my_cpu_offset=E2=80=99?
> > >    32 |  return __per_cpu_offset[0];
> > >       |         ^~~~~~~~~~~~~~~~
> > >       |         __my_cpu_offset
> > > ./arch/arm/include/asm/percpu.h:32:9: note: each undeclared identifie=
r
> > > is reported only once for each function it appears in
> >
> > I think you just missed the line in my patch that adds the
> > "extern unsigned long __per_cpu_offset[];" variable declaration.
>
> My bad.
>
> So, I tried both variants and both led to stalls.
>

Could you please try running slcand under strace (and use the -F
option on slcand), and bring up the link from another terminal
session? That way, we may be able to narrow down the cause of the
stall from the strace output.

On my BB white, it never gets past

openat(AT_FDCWD, "/dev/ttyUSB0", O_RDWR|O_NOCTTY|O_NONBLOCK|O_LARGEFILE) =
=3D 3
ioctl(3, TCGETS, {B3000000 -opost -isig -icanon -echo ...}) =3D 0
ioctl(3, TIOCGSERIAL, 0xbec564fc)       =3D 0
ioctl(3, TIOCSSERIAL)                   =3D 0
ioctl(3, TCGETS, {B3000000 -opost -isig -icanon -echo ...}) =3D 0
ioctl(3, SNDCTL_TMR_STOP or TCSETSW, {B3000000 -opost -isig -icanon
-echo ...}) =3D 0
ioctl(3, TCGETS, {B3000000 -opost -isig -icanon -echo ...}) =3D 0
write(3, "C\rS8\r", 5)                  =3D 5
write(3, "O\r", 2)                      =3D 2
ioctl(3, TIOCSETD, [17]

but I don't have any actual CAN-to-USB-serial hardware so I'm not sure
if I'm even able to reproduce this.
