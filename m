Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 29994536D0B
	for <lists+linux-omap@lfdr.de>; Sat, 28 May 2022 15:01:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345624AbiE1NBT (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sat, 28 May 2022 09:01:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58956 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344012AbiE1NBT (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sat, 28 May 2022 09:01:19 -0400
Received: from mail-yb1-xb2d.google.com (mail-yb1-xb2d.google.com [IPv6:2607:f8b0:4864:20::b2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 32F0FC2A;
        Sat, 28 May 2022 06:01:18 -0700 (PDT)
Received: by mail-yb1-xb2d.google.com with SMTP id p13so524555ybm.1;
        Sat, 28 May 2022 06:01:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=BKJMVmT6xouVZnKHH1t+32fnxpEdpNO/J4+waPk1SMk=;
        b=OSiwldFcTD5m1v28Gww4fcj+VFEDJoo9LZC550aWzmPrsNO+3qW8HfpbBnXqjc2Z7g
         iUa0nnqUgmX7kmYypSvvWacDReI3oP6s0Hw6sfBCI3XPT0zWqSGvcduLBF0K/aGBYQYM
         gGQ79Awih5OGjE8mybtmmiME5UdTgOWxSzp/xW21WwwRaK7KwgqK9x52mC0eagpBmxWO
         mkT8btHFMDRHPDRC1YBAGxKYjNYz2hykT2NnYil/KXBuDmUV2Zuy5XW77+sOBFU2qL2U
         omfNyCRIu6iQzyiiFm/tfXfy6R/fUa7KVWluSOlaYQlhWyht7J1q/+h3h0+o7po8X6JC
         BBFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=BKJMVmT6xouVZnKHH1t+32fnxpEdpNO/J4+waPk1SMk=;
        b=e8w0zzDWFoGiH7hHjn9SYOFxFQxpHIRYglyY33r617g2RUNRBXhzmyQ4UJ7TGH7kZV
         8CphR9UO81dGccRhnIlAyo6pYEULeXw8mbZjTh6FEeFFcEuWFf/n1xe7XIjox5QRadTL
         RURvTi2TLs2vRtDCG2z5uhAhujSKzhGjRNNJV1QBXyb522lEXY2tHT+4UOnHwLpQLIRR
         p4ohEAxgsxGG14BpR54Op+dIxKSnc88Ij0WCNoGjQSTqqzv9RSnOaEhBi6+N+7i6coNN
         tFzbBYFdinwtioR7HmJGhsf7jPxXQK59kXD3rgD1PTfWobl6r2YMJ3yRYvSVYV8XMs65
         v5tg==
X-Gm-Message-State: AOAM530gGCHS++IbMu3q6Ys+HgPi53PX6WRrsRG6lceDLB01rA+5wMgT
        03yoOsITxYNafN0rjS1r4u0IdynXr6y/67cZZJw=
X-Google-Smtp-Source: ABdhPJzXfiv11UhbK8CnwaYDCRHtEgZ8HuWMSXZRgaP0eVRvLfbXS0aYW8xbo6em4yB3lJyMJlTtX9qVH11oqJXS6/U=
X-Received: by 2002:a25:af02:0:b0:64f:72b8:ce50 with SMTP id
 a2-20020a25af02000000b0064f72b8ce50mr34013107ybh.528.1653742876917; Sat, 28
 May 2022 06:01:16 -0700 (PDT)
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
 <CAGm1_kvXaH19nOmP_Dy3nxWpG0UiX7eyauTLB+9Cd2rBovDcEQ@mail.gmail.com> <CAMj1kXFfc-e0+dpLJHj9W+=YS=3i0t1+wxF+4qJ5K-g7pTd+YQ@mail.gmail.com>
In-Reply-To: <CAMj1kXFfc-e0+dpLJHj9W+=YS=3i0t1+wxF+4qJ5K-g7pTd+YQ@mail.gmail.com>
From:   Yegor Yefremov <yegorslists@googlemail.com>
Date:   Sat, 28 May 2022 15:01:05 +0200
Message-ID: <CAGm1_ksndacPPpyZknvHip=7Fv+3NxXjyfCm_DDMm4EbcBuBig@mail.gmail.com>
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

On Sat, May 28, 2022 at 11:07 AM Ard Biesheuvel <ardb@kernel.org> wrote:
>
> On Sat, 28 May 2022 at 10:29, Yegor Yefremov <yegorslists@googlemail.com>=
 wrote:
> >
> > On Sat, May 28, 2022 at 9:53 AM Arnd Bergmann <arnd@arndb.de> wrote:
> > >
> > > On Sat, May 28, 2022 at 7:48 AM Yegor Yefremov
> > > <yegorslists@googlemail.com> wrote:
> > > >
> > > > On Fri, May 27, 2022 at 4:13 PM Arnd Bergmann <arnd@arndb.de> wrote=
:
> > > > >
> > > > > On Fri, May 27, 2022 at 3:12 PM Ard Biesheuvel <ardb@kernel.org> =
wrote:
> > > > > > On Fri, 27 May 2022 at 14:54, Arnd Bergmann <arnd@arndb.de> wro=
te:
> > > > > > > On Fri, May 27, 2022 at 11:50 AM Yegor Yefremov <yegorslists@=
googlemail.com> wrote:
> > > > > >
> > > > > > Not just per-cpu data: there is also the 'current' global varia=
ble
> > > > > > which gets used now instead of the user thread ID register, and=
 this
> > > > > > is also different between modules and the core kernel (unless
> > > > > > CONFIG_ARM_MODULE_PLTS is disabled)
> > > > >
> > > > > Right, so if the percpu hack doesn't address it, this one might:
> > > > >
> > > > > diff --git a/arch/arm/include/asm/current.h b/arch/arm/include/as=
m/current.h
> > > > > index 1e1178bf176d..306d1a4cae40 100644
> > > > > --- a/arch/arm/include/asm/current.h
> > > > > +++ b/arch/arm/include/asm/current.h
> > > > > @@ -18,6 +18,8 @@ static __always_inline __attribute_const__ stru=
ct
> > > > > task_struct *get_current(void)
> > > > >  {
> > > > >         struct task_struct *cur;
> > > > >
> > > > > +       return __current;
> > > > > +
> > > > >  #if __has_builtin(__builtin_thread_pointer) && \
> > > > >      defined(CONFIG_CURRENT_POINTER_IN_TPIDRURO) && \
> > > > >      !(defined(CONFIG_THUMB2_KERNEL) && \
> > > >
> > > > I have tried this patch and the system still stalls.
> > >
> > > Ok, thanks for testing. To clarify: did you test with both the get_cu=
rrent() and
> > > __my_cpu_offset() changes applied, or just the get_current() one?
> >
> > I have tested only the get_current() one. Should I also test
> > __my_cpu_offset() separately and combined?
> >
>
> That would be helpful, yes.

  SYNC    include/config/auto.conf.cmd
  CC      kernel/bounds.s
  CALL    scripts/atomic/check-atomics.sh
In file included from ./include/linux/irqflags.h:17,
                 from ./arch/arm/include/asm/bitops.h:28,
                 from ./include/linux/bitops.h:33,
                 from ./include/linux/log2.h:12,
                 from kernel/bounds.c:13:
./arch/arm/include/asm/percpu.h: In function =E2=80=98__my_cpu_offset=E2=80=
=99:
./arch/arm/include/asm/percpu.h:32:9: error: =E2=80=98__per_cpu_offset=E2=
=80=99
undeclared (first use in this function); did you mean
=E2=80=98__my_cpu_offset=E2=80=99?
   32 |  return __per_cpu_offset[0];
      |         ^~~~~~~~~~~~~~~~
      |         __my_cpu_offset
./arch/arm/include/asm/percpu.h:32:9: note: each undeclared identifier
is reported only once for each function it appears in

Yegor
