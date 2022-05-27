Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 852D5535DA1
	for <lists+linux-omap@lfdr.de>; Fri, 27 May 2022 11:50:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350239AbiE0Juz (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 27 May 2022 05:50:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41224 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350691AbiE0Juy (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 27 May 2022 05:50:54 -0400
Received: from mail-yb1-xb36.google.com (mail-yb1-xb36.google.com [IPv6:2607:f8b0:4864:20::b36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 49C6F106572;
        Fri, 27 May 2022 02:50:52 -0700 (PDT)
Received: by mail-yb1-xb36.google.com with SMTP id v26so7104738ybd.2;
        Fri, 27 May 2022 02:50:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=TrHpRv64c+YoK1HzOlrj1Q63oDbBkz6zw8zaaBGCR1k=;
        b=PZXsgFa+uHGoFqbkla1Fz2CNNzBPa1A2c8IO59HnUNeOUgZvG4ETvXJlXAkCKN+L/d
         9Uda1N8PjUxI/Xe9KktOJvYvUMaW/QvYsuiAKSySxIFFNyoAQRYuaw15ronQp2rMecoY
         IIXrDFwRPZWqF+r9TQEl3NgpTLL90Tj6eyWjMM8xI4bosHWiU37t7qv0NDc/HBZOOMMg
         SLvzGHQn0Tb0DNpYVu0nL59cOQWypn+bgnsvk3U9tQV9ySY2WAW4uBcNUm8ono04qOk+
         tBontVujuWGzexNUPEBDPg8W1zj6Oa6vpd4yZm5Of5d/G7gQSN6J07X3ctsD+kDZTeuC
         3ZvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=TrHpRv64c+YoK1HzOlrj1Q63oDbBkz6zw8zaaBGCR1k=;
        b=jQdQEy9PZ8yEDqMFn576VKhGFiTMZ60zdanvcCk314wPiZhZQVMvo234JWnOW50XU/
         mD+vw784WXKoyCNBDQHfZKi61iJaVddL8Tr91TGzXZ5DAyK2cjzUH300w3RWuXUBnXx+
         H4pnaFJR9z4XdBSt8kH1tjNblaceqK8lAOcpAF5K2pF3YHMN9IaEpRWtC6EAn5XPDXE6
         tYOIJ3f1ixjcDqh/9z4xuppkIO/HlOMQ0BX8KOuBWg1VMNGqVwHD9/l1yI3/H92CnBuS
         DZI3WBJ4tHL+5fxQt94JWVOtRIKWHoQhrysmDPUBuaDv7JTC3sbpJtL3BQM/no1QTTb+
         /RDA==
X-Gm-Message-State: AOAM530gHg26rJb2zB8QgvzcVUmZAqzsfqAmPZG5R7KFKN/yW3+YImTV
        oTrXFEUR7sbO2xcOKv5rQfEhSCRybeoOgvCwzEh1PTES
X-Google-Smtp-Source: ABdhPJzqL9ND6IPUcs+accWbxqFltjmOUNQB478M6BZsPPyV0GWJU3nx5NkHM9RjxbvbR6/Vb4sHdJfj4nqnLAhQT3A=
X-Received: by 2002:a25:1c84:0:b0:64f:6ecc:8fa7 with SMTP id
 c126-20020a251c84000000b0064f6ecc8fa7mr32131205ybc.432.1653645051230; Fri, 27
 May 2022 02:50:51 -0700 (PDT)
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
 <CAGm1_ktOPgUSVjPP44Y49GgFLpDMrECu7eqQu7d2ZvJiOftWAQ@mail.gmail.com> <CAK8P3a36s6S2B8PTixxEkmaKXL88NAydTm4abdeC+roGtrUTsw@mail.gmail.com>
In-Reply-To: <CAK8P3a36s6S2B8PTixxEkmaKXL88NAydTm4abdeC+roGtrUTsw@mail.gmail.com>
From:   Yegor Yefremov <yegorslists@googlemail.com>
Date:   Fri, 27 May 2022 11:50:40 +0200
Message-ID: <CAGm1_kvdhqrptEYy8WMfqZqG6gaWoBtAojSW5uXYnyXMVfV=Fw@mail.gmail.com>
Subject: Re: am335x: 5.18.x: system stalling
To:     Arnd Bergmann <arnd@arndb.de>
Cc:     Tony Lindgren <tony@atomide.com>, Ard Biesheuvel <ardb@kernel.org>,
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

On Fri, May 27, 2022 at 10:39 AM Arnd Bergmann <arnd@arndb.de> wrote:
>
> On Fri, May 27, 2022 at 10:17 AM Yegor Yefremov
> <yegorslists@googlemail.com> wrote:
> > On Fri, May 27, 2022 at 8:57 AM Arnd Bergmann <arnd@arndb.de> wrote:
> > >
> > > On Fri, May 27, 2022 at 8:50 AM Tony Lindgren <tony@atomide.com> wrote:
> > > > * Arnd Bergmann <arnd@arndb.de> [220527 06:35]:
> > > > > On Fri, May 27, 2022 at 6:44 AM Yegor Yefremov <yegorslists@googlemail.com> wrote:
> > > > > > On Thu, May 26, 2022 at 4:16 PM Arnd Bergmann <arnd@arndb.de> wrote:
> > >
> > > > Based on what we just discussed on #armlinux, testing before and after
> > > > commit 9c46929e7989 ("ARM: implement THREAD_INFO_IN_TASK for uniprocessor
> > > > systems") might be a good idea as it enables some config options that
> > > > did not get enabled earlier.
> > > >
> > > > Another thing that might help is to bisect again and ensure vmap stack
> > > > config option stays disabled so issues related to vmap stack are kept
> > > > out of the way.
> > >
> > > Unfortunately the commits around 9c46929e7989 are the ones that failed
> > > to build according to the original report. But it's possible that the
> > > problem has something to do with
> > > CONFIG_CURRENT_POINTER_IN_TPIDRURO, which is disabled
> > > in the V6+SMP config, and which in turn is required for
> > > THREAD_INFO_IN_TASK, IRQSTACKS and STACKPROTECTOR_PER_TASK.
> > >
> > > If any of the four are the cause of the stall, then turning off ARCH_OMAP2 and
> > > CONFIG_CPU_V6 should show the same bug in older commits as well.
> >
> > Both config options disabled:
> >
> > # zcat /proc/config.gz | grep 'CONFIG_ARCH_MULTI_V6\|CONFIG_SMP'
> > # CONFIG_ARCH_MULTI_V6 is not set
> > CONFIG_ARCH_MULTI_V6_V7=y
> > # CONFIG_SMP is not set
> >
> > This helped - no stalls.
>
> Ok, that does point back to a recent regression then, rather than something
> that was already broken and just uncovered by the changed behavior.
>
> Can you try the other combinations as well? OMAP2=y with SMP=n
> and OMAP2=n with SMP=y? Hopefully that narrows it down enough that
> we can look at which code paths actually changed.

# zcat /proc/config.gz | grep 'CONFIG_ARCH_MULTI_V6\|CONFIG_SMP'
# CONFIG_ARCH_MULTI_V6 is not set
CONFIG_ARCH_MULTI_V6_V7=y
CONFIG_SMP=y
CONFIG_SMP_ON_UP=y

No stalls.

# zcat /proc/config.gz | grep 'CONFIG_ARCH_MULTI_V6\|CONFIG_SMP\|ARCH_OMAP2'
CONFIG_ARCH_MULTI_V6=y
CONFIG_ARCH_MULTI_V6_V7=y
CONFIG_ARCH_OMAP2=y
CONFIG_ARCH_OMAP2PLUS=y
CONFIG_ARCH_OMAP2PLUS_TYPICAL=y

No stalls.

As soon as I enable both SMP and OMAP2 options the system stalls.

Yegor


# CONFIG_SMP is not set
