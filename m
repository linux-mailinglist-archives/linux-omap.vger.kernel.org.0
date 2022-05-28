Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9482F536AF4
	for <lists+linux-omap@lfdr.de>; Sat, 28 May 2022 07:48:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231932AbiE1FsQ (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sat, 28 May 2022 01:48:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55092 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230263AbiE1FsP (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sat, 28 May 2022 01:48:15 -0400
Received: from mail-yb1-xb31.google.com (mail-yb1-xb31.google.com [IPv6:2607:f8b0:4864:20::b31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BAF805DE69;
        Fri, 27 May 2022 22:48:13 -0700 (PDT)
Received: by mail-yb1-xb31.google.com with SMTP id z7so11022297ybf.7;
        Fri, 27 May 2022 22:48:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=EWf+R1zs+9TCPQKASeslxTVWxVROpblNBGqrlLLHfYo=;
        b=bZSBA3Cdaj6s/kVfhwZIGMHmp3EyQJnwGyVT1D9m1hGJjUX/vRbY/0/+GAR49tb7LN
         tTfnZYq+NlAX+M8kAV+gWPmsFKvnCgsofcB+DMdZg/sTgWL4lM4oETJthZdsqR76fuNW
         fKAIX1gi49Laa3JmY60zqhFL6GAqltu7u3Nl0o7anjCjEE/oFThvgmELnB8HbLZUnnk3
         pNxPKlI3t6W6W+3S+3mfKrvXrkGjwpKyeZ5RDFyfjzQDCKNdsHuTQkl/ju/WBwnMaZj7
         EY05XHLoPggcX/VDD5AEbU1yptbT6PQMHMmr8qpEJ/BT3IbSC2/wIJ6m0wVHtkUPOd07
         7izA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=EWf+R1zs+9TCPQKASeslxTVWxVROpblNBGqrlLLHfYo=;
        b=us2ReMnh05GS9+hfC3ffYYybKpnSQP9jwtCrfyXy1EgbDjK/J3TKM12+eNIAzy2ffY
         aHFb1/n3OQJFnWGiood05TmTFfp6eFLFUiKbrHItFMsu86GY4HEavR5QiC/59r7ca2Gc
         zR2hdH4uCF+maOv90L1mzDjLaZRu+d1nTKpQG41SmBs0TBQVRNUANL1YI50YAvSvwshn
         1FKVQRRmquhSwbjR5C6D5V7uBol8prXl7FmCVwEZ3vJtvDjRH2gAsM/2SeXOJjY+sYnz
         I+XsHhs0i4vALbO0iXDxs8gQteTQkqqeIVc547xIcLMsPNeQavH6NxrycqKwEssI6AhA
         x+cg==
X-Gm-Message-State: AOAM532PVzlTf/19NQBVvZUXuxJ9/S2+o33WY0EkYPYItru0B91jELmJ
        NDxlZsfcaWScjYjJyjmoYZ9ZcoNOFpHF2yxATrw=
X-Google-Smtp-Source: ABdhPJyF4FwX78BJyhbuc51+qa1G8UBv3JxJmhDIgjHPzYB0J1brboVN5xP6TDG+m19w8FQdQ0m/s5hVZJfKDN5eveA=
X-Received: by 2002:a25:cec6:0:b0:65c:98f5:a06a with SMTP id
 x189-20020a25cec6000000b0065c98f5a06amr1109156ybe.355.1653716892855; Fri, 27
 May 2022 22:48:12 -0700 (PDT)
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
 <CAMj1kXF2NFxiNm=9ixOncN_wkgg2NrNNm9vE-CGUvpJuThj3JA@mail.gmail.com> <CAK8P3a1DnyNvBqdRGHAnHcXBfoNPn4GfUmf_SBGRRU3q3iwwvg@mail.gmail.com>
In-Reply-To: <CAK8P3a1DnyNvBqdRGHAnHcXBfoNPn4GfUmf_SBGRRU3q3iwwvg@mail.gmail.com>
From:   Yegor Yefremov <yegorslists@googlemail.com>
Date:   Sat, 28 May 2022 07:48:01 +0200
Message-ID: <CAGm1_kta63UM8um5BB5jOh+r9uFMiGwAiYsrNDOwG3dN-Oo47Q@mail.gmail.com>
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

On Fri, May 27, 2022 at 4:13 PM Arnd Bergmann <arnd@arndb.de> wrote:
>
> On Fri, May 27, 2022 at 3:12 PM Ard Biesheuvel <ardb@kernel.org> wrote:
> > On Fri, 27 May 2022 at 14:54, Arnd Bergmann <arnd@arndb.de> wrote:
> > > On Fri, May 27, 2022 at 11:50 AM Yegor Yefremov <yegorslists@googlemail.com> wrote:
> >
> > Not just per-cpu data: there is also the 'current' global variable
> > which gets used now instead of the user thread ID register, and this
> > is also different between modules and the core kernel (unless
> > CONFIG_ARM_MODULE_PLTS is disabled)
>
> Right, so if the percpu hack doesn't address it, this one might:
>
> diff --git a/arch/arm/include/asm/current.h b/arch/arm/include/asm/current.h
> index 1e1178bf176d..306d1a4cae40 100644
> --- a/arch/arm/include/asm/current.h
> +++ b/arch/arm/include/asm/current.h
> @@ -18,6 +18,8 @@ static __always_inline __attribute_const__ struct
> task_struct *get_current(void)
>  {
>         struct task_struct *cur;
>
> +       return __current;
> +
>  #if __has_builtin(__builtin_thread_pointer) && \
>      defined(CONFIG_CURRENT_POINTER_IN_TPIDRURO) && \
>      !(defined(CONFIG_THUMB2_KERNEL) && \

I have tried this patch and the system still stalls.

Yegor

> > I looked at the fdti-sio and slcan modules, and didn't find any
> > references to per-CPU offsets when building them using the provided
> > .config. I did find some references to __current, but these seem to be
> > ignored (they are only emitted to satisfy the "m" inline asm
> > constraint in get_domain(), but the parameter is never actually used
> > in the assembler code)
>
> I see some __current references in the musb driver that come from
> tracepoints as well (in omap2plus_defconfig), but these also shouldn't be
> active.
>
>         Arnd
