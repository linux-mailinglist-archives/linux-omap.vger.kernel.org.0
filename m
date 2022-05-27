Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 52D5C536338
	for <lists+linux-omap@lfdr.de>; Fri, 27 May 2022 15:13:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344095AbiE0NM6 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 27 May 2022 09:12:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43538 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235848AbiE0NM6 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 27 May 2022 09:12:58 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2293A127195;
        Fri, 27 May 2022 06:12:56 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id BE8BBB82504;
        Fri, 27 May 2022 13:12:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 612C0C385A9;
        Fri, 27 May 2022 13:12:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1653657173;
        bh=6p7oBMm6QzOQnT+oDCahCxyIyMkTov2pRVoC/5qV0Vg=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=Ur4MvhVOEYu8X+dWTZLVGLtUeUGSQarP/6edtuUKsXuuFYAiWtJ9FscVsgbGRzTs+
         cc5ouYbGudAgEmXQaO/LYV47GdBCltvHwXmYvpCz/a4wTM/vrRb2t4wPXAV8ZHUoMC
         V2fZkn2Qta1sql+NivJgcl80ThZ1Or3sPMZQMVB1Lwc5wrbR6HKRVzkB+iwSGBVG15
         1TAGOX9hjemeGIb/wSTMHVh5Xo1+KAkaLgqs4LOWwI9qrvvSdiwKM5+vX59vQKMF7e
         /682dMs77CMIky/gGCXkOOk9Wiqs6mAmjbZ0HaKkrJl1o21DXstGcNuzDuQIVHSLhq
         hWN2wtgQ8KKIA==
Received: by mail-oi1-f175.google.com with SMTP id w130so5678246oig.0;
        Fri, 27 May 2022 06:12:53 -0700 (PDT)
X-Gm-Message-State: AOAM533dsPVn1ZaUcFZeiTm+ZusY7lobDRYpt4HBOArp7JPAy+FwmJ2o
        m1n67DKQoTmPZZ1/x6dV5VLgPADcm7kLaeZcVmI=
X-Google-Smtp-Source: ABdhPJw4LvLt21j/5Z86BrQ95Geu5PHkJnYczZRrX6hNjWux11OuOwaYX7mYe+cl+gjqPUv7ftdhzrIRe3/RFP/4Eyw=
X-Received: by 2002:a05:6808:f88:b0:32b:d10f:cc6b with SMTP id
 o8-20020a0568080f8800b0032bd10fcc6bmr1815761oiw.228.1653657172571; Fri, 27
 May 2022 06:12:52 -0700 (PDT)
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
 <CAGm1_kvdhqrptEYy8WMfqZqG6gaWoBtAojSW5uXYnyXMVfV=Fw@mail.gmail.com> <CAK8P3a22hmSnS4X93ETLpF7vPtK_F1TD51SK5VvhEz9L9H4i3g@mail.gmail.com>
In-Reply-To: <CAK8P3a22hmSnS4X93ETLpF7vPtK_F1TD51SK5VvhEz9L9H4i3g@mail.gmail.com>
From:   Ard Biesheuvel <ardb@kernel.org>
Date:   Fri, 27 May 2022 15:12:40 +0200
X-Gmail-Original-Message-ID: <CAMj1kXF2NFxiNm=9ixOncN_wkgg2NrNNm9vE-CGUvpJuThj3JA@mail.gmail.com>
Message-ID: <CAMj1kXF2NFxiNm=9ixOncN_wkgg2NrNNm9vE-CGUvpJuThj3JA@mail.gmail.com>
Subject: Re: am335x: 5.18.x: system stalling
To:     Arnd Bergmann <arnd@arndb.de>
Cc:     Yegor Yefremov <yegorslists@googlemail.com>,
        Tony Lindgren <tony@atomide.com>,
        Linux-OMAP <linux-omap@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-7.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Fri, 27 May 2022 at 14:54, Arnd Bergmann <arnd@arndb.de> wrote:
>
> On Fri, May 27, 2022 at 11:50 AM Yegor Yefremov
> <yegorslists@googlemail.com> wrote:
> >
> > # zcat /proc/config.gz | grep 'CONFIG_ARCH_MULTI_V6\|CONFIG_SMP'
> > # CONFIG_ARCH_MULTI_V6 is not set
> > CONFIG_ARCH_MULTI_V6_V7=y
> > CONFIG_SMP=y
> > CONFIG_SMP_ON_UP=y
> >
> > No stalls.
> >
> > # zcat /proc/config.gz | grep 'CONFIG_ARCH_MULTI_V6\|CONFIG_SMP\|ARCH_OMAP2'
> > CONFIG_ARCH_MULTI_V6=y
> > CONFIG_ARCH_MULTI_V6_V7=y
> > CONFIG_ARCH_OMAP2=y
> > CONFIG_ARCH_OMAP2PLUS=y
> > CONFIG_ARCH_OMAP2PLUS_TYPICAL=y
> >
> > No stalls.
> >
> > As soon as I enable both SMP and OMAP2 options the system stalls.
>
> Ok, that points to the SMP patching for percpu data, which doesn't happen
> before the patch, and which is different between loadable modules and
> the normal code.
>

Not just per-cpu data: there is also the 'current' global variable
which gets used now instead of the user thread ID register, and this
is also different between modules and the core kernel (unless
CONFIG_ARM_MODULE_PLTS is disabled)

I looked at the fdti-sio and slcan modules, and didn't find any
references to per-CPU offsets when building them using the provided
.config. I did find some references to __current, but these seem to be
ignored (they are only emitted to satisfy the "m" inline asm
constraint in get_domain(), but the parameter is never actually used
in the assembler code)


> Can you try out this patch to short-circuit the logic and always return
> the offset for CPU 0? This is obviously broken on SMP machines but
> would get around the bit of code that is V6+SMP specific.
>
>         Arnd
>
> diff --git a/arch/arm/include/asm/percpu.h b/arch/arm/include/asm/percpu.h
> index 7545c87c251f..3057c5fef970 100644
> --- a/arch/arm/include/asm/percpu.h
> +++ b/arch/arm/include/asm/percpu.h
> @@ -25,10 +25,13 @@ static inline void set_my_cpu_offset(unsigned long off)
>         asm volatile("mcr p15, 0, %0, c13, c0, 4" : : "r" (off) : "memory");
>  }
>
> +extern unsigned long __per_cpu_offset[];
>  static __always_inline unsigned long __my_cpu_offset(void)
>  {
>         unsigned long off;
>
> +       return __per_cpu_offset[0];
> +
>         /*
>          * Read TPIDRPRW.
>          * We want to allow caching the value, so avoid using volatile and
