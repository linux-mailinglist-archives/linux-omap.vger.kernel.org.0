Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 561A4537A62
	for <lists+linux-omap@lfdr.de>; Mon, 30 May 2022 14:09:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233538AbiE3MJt (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 30 May 2022 08:09:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50446 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229715AbiE3MJq (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 30 May 2022 08:09:46 -0400
Received: from mail-yb1-xb2c.google.com (mail-yb1-xb2c.google.com [IPv6:2607:f8b0:4864:20::b2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B530A5DA3F;
        Mon, 30 May 2022 05:09:45 -0700 (PDT)
Received: by mail-yb1-xb2c.google.com with SMTP id f34so5653498ybj.6;
        Mon, 30 May 2022 05:09:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=bgFme+cXggcwQqDYmmhvMUMyHH6j4QKDzoDiRHUb9NU=;
        b=baG2IpjM6/w9TbEL7SPFWuDwuWXgnVuNKcYXgfzYr51zX1dmVXL0H+PsEqtFPtMRXO
         p1bIY8+Mtf8RfhBe9X6qSS7SbNrCdp0Tge3ooky/zJXX+IpihYKRVCXPY+0R4+wu9LHo
         JSynPB3WLbhuDmCwUnGCPL+RiHgO8jXUb5Ql1a2V66uYKQ8RhQeyJ4bflksGpjAkf5uL
         YfN8QSlELW+udUYWSL5xw2z1JW+CzgTeIa9uNymFZJIzai19Qx/MHyx7GnzPY0+x5ULj
         aVEmpy2KOpQMJ5C1eYVx4GIsg+Q+y6T6wtoUZXAyGqa+/h1SeZho0K+/hV/IwQAIi0Gr
         g31w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=bgFme+cXggcwQqDYmmhvMUMyHH6j4QKDzoDiRHUb9NU=;
        b=hEIcF8xpFD24QWp/fjaFga1nhcJstU2GjMsLDaComiQxkEV2JQq1qq1RTq8W3C6Wm5
         rmYE3AP+Fyu2soDQuA97aGFOeUwUlIPV5qMoua1jUPfZEtvJ9lxtyp5q2cSSInG5lf8D
         6keouv7rKRwFswys8CS8SfaagIrPx8pE4cC1gywJ379romqYOIrd1n8UjnZ1fKknXroQ
         b8LX5mGLj7TfxZG80Aq/xAgN8rjpoNvBGtpjvP4+SWKKrs9vYNXnDm6NHlR9Q1Wywzw2
         RGNlT3JxzIEwwee5DT/a/V4ZUchKh0tMYZ0cl+UwOqhKy1aAV5qHCkBnXfpcpl8kaOgP
         CrhA==
X-Gm-Message-State: AOAM530/wQP+BHoTjWoDJWNA8rAp1PR+MzR2WPSkQKVEtmxH2CAIbjQY
        g338DkYA1xq5KKw7PIsI+pQg5GQWVJ7VCEgOQ7o=
X-Google-Smtp-Source: ABdhPJy27oBTusOTcZUwgjLOggHeobmH/RshzReCwIzQgNRhzznei6vEhpOVRz1JKr6QCjdn+3ufcY+LzAi/kSTkhTs=
X-Received: by 2002:a25:814a:0:b0:64f:f06c:cf6d with SMTP id
 j10-20020a25814a000000b0064ff06ccf6dmr33377676ybm.88.1653912584825; Mon, 30
 May 2022 05:09:44 -0700 (PDT)
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
 <CAGm1_ktyCchFwVWhFtrgR621s_fPZJ3u8UmgOPbg7OCOq0h6ZA@mail.gmail.com> <CAMj1kXGrBDkPgux0gOxO1i_1qNTXGKGHOVGZ61jn7oKBLYc-Vg@mail.gmail.com>
In-Reply-To: <CAMj1kXGrBDkPgux0gOxO1i_1qNTXGKGHOVGZ61jn7oKBLYc-Vg@mail.gmail.com>
From:   Yegor Yefremov <yegorslists@googlemail.com>
Date:   Mon, 30 May 2022 14:09:33 +0200
Message-ID: <CAGm1_kua8LZzWiiZ+8zL-ZxRgPK7L_b_zAVtSUjCu3q4_69d2Q@mail.gmail.com>
Subject: Re: am335x: 5.18.x: system stalling
To:     Ard Biesheuvel <ardb@kernel.org>
Cc:     Arnd Bergmann <arnd@arndb.de>, Tony Lindgren <tony@atomide.com>,
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

On Mon, May 30, 2022 at 12:16 PM Ard Biesheuvel <ardb@kernel.org> wrote:
>
> On Sat, 28 May 2022 at 21:28, Yegor Yefremov <yegorslists@googlemail.com>=
 wrote:
> >
> > On Sat, May 28, 2022 at 3:14 PM Arnd Bergmann <arnd@arndb.de> wrote:
> > >
> > > On Sat, May 28, 2022 at 3:01 PM Yegor Yefremov
> > > <yegorslists@googlemail.com> wrote:
> > > > On Sat, May 28, 2022 at 11:07 AM Ard Biesheuvel <ardb@kernel.org> w=
rote:
> > > > In file included from ./include/linux/irqflags.h:17,
> > > >                  from ./arch/arm/include/asm/bitops.h:28,
> > > >                  from ./include/linux/bitops.h:33,
> > > >                  from ./include/linux/log2.h:12,
> > > >                  from kernel/bounds.c:13:
> > > > ./arch/arm/include/asm/percpu.h: In function =E2=80=98__my_cpu_offs=
et=E2=80=99:
> > > > ./arch/arm/include/asm/percpu.h:32:9: error: =E2=80=98__per_cpu_off=
set=E2=80=99
> > > > undeclared (first use in this function); did you mean
> > > > =E2=80=98__my_cpu_offset=E2=80=99?
> > > >    32 |  return __per_cpu_offset[0];
> > > >       |         ^~~~~~~~~~~~~~~~
> > > >       |         __my_cpu_offset
> > > > ./arch/arm/include/asm/percpu.h:32:9: note: each undeclared identif=
ier
> > > > is reported only once for each function it appears in
> > >
> > > I think you just missed the line in my patch that adds the
> > > "extern unsigned long __per_cpu_offset[];" variable declaration.
> >
> > My bad.
> >
> > So, I tried both variants and both led to stalls.
> >
>
> Could you please try running slcand under strace (and use the -F
> option on slcand), and bring up the link from another terminal
> session? That way, we may be able to narrow down the cause of the
> stall from the strace output.
>
> On my BB white, it never gets past
>
> openat(AT_FDCWD, "/dev/ttyUSB0", O_RDWR|O_NOCTTY|O_NONBLOCK|O_LARGEFILE) =
=3D 3
> ioctl(3, TCGETS, {B3000000 -opost -isig -icanon -echo ...}) =3D 0
> ioctl(3, TIOCGSERIAL, 0xbec564fc)       =3D 0
> ioctl(3, TIOCSSERIAL)                   =3D 0
> ioctl(3, TCGETS, {B3000000 -opost -isig -icanon -echo ...}) =3D 0
> ioctl(3, SNDCTL_TMR_STOP or TCSETSW, {B3000000 -opost -isig -icanon
> -echo ...}) =3D 0
> ioctl(3, TCGETS, {B3000000 -opost -isig -icanon -echo ...}) =3D 0
> write(3, "C\rS8\r", 5)                  =3D 5
> write(3, "O\r", 2)                      =3D 2
> ioctl(3, TIOCSETD, [17]
>
> but I don't have any actual CAN-to-USB-serial hardware so I'm not sure
> if I'm even able to reproduce this.

Triggering the stall is not that straight forward. slcand just loads
the slcan driver and creates an slcan0 network device. This alone
doesn't lead to a stall. First when I send some CAN frames, the system
stalls after some seconds.

My CAN test script can also work directly with /dev/ttyUSB0 omitting
the slcan driver. In this case, the system stays stable.

Yegor
