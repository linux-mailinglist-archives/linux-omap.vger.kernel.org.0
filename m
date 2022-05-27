Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4FCD0535B44
	for <lists+linux-omap@lfdr.de>; Fri, 27 May 2022 10:18:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241145AbiE0ISL (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 27 May 2022 04:18:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38312 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234196AbiE0ISK (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 27 May 2022 04:18:10 -0400
Received: from mail-yb1-xb29.google.com (mail-yb1-xb29.google.com [IPv6:2607:f8b0:4864:20::b29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 93AF7EC3EF;
        Fri, 27 May 2022 01:18:09 -0700 (PDT)
Received: by mail-yb1-xb29.google.com with SMTP id v26so6775328ybd.2;
        Fri, 27 May 2022 01:18:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=0z33FdV/Bxsom8j7fiRE8EMcJ4Zlbih/meNdXQLsKk8=;
        b=cwNP6LG5nc1rKyga1xrPAOvrhnPLr8Q9bMClNDAJ7LoDF0i/87mWbptGcF2R5rXwtj
         BfAfJ3pPoDZuKkyJ20AdzmSDbDFamsOtT234h4e/Ld3+5Wpfm1OWpMXQmeir+wr1ZK4c
         G584QgkIic3+txFxeSgiogDXrCya8oLFShzIzRzRpfdwl+vZf1amq4MVqTkaJ4CCq9ti
         /tKtl6D+EZCLcTW1QcCWyTM36yvBcIOqzKPuZJvsMZjlou6S57CEHzqRe5o+kqG7wPpF
         wb7PBlrRz2h6fPdxyeeB+rLL1BWar43ZvmZDdc8frB8V43D4ZQzroetRKMD84NbTVZev
         QyHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0z33FdV/Bxsom8j7fiRE8EMcJ4Zlbih/meNdXQLsKk8=;
        b=R18E/sSCEBM7oWy4bZk2d3yqJ3KlHqtfh+ddK9AJp40kEU89E4a/otzTTyYDxTAEQT
         le1Q+eMHYavq1RONh9Vs/8neyYucQHlJ29ufobE4Bpa2+XCJ8RvrVhx15gSuVn4W23Pl
         4Ijp/O+nMNPLytq7YYCyPPgKAQfk2lhd/a/Gr8s0EOPtwkymBLws7cvfASaqhrfbnDLi
         P87B3lQG21mQP/pd/vaH29KGc9DKs9urYXO0w532ERg4+CH/aNLB3xXB4NtskHAqwCWd
         N/btfleJRldWmCOX8vn6VD9j2mLKm2AanJRYdun7geuIYDndGmI+dR9CeZ6lapJfZSMc
         b7Ug==
X-Gm-Message-State: AOAM533aqjmQFwuiIplwf4+Wyz+CAsWltimsIogTxRFQtHswZGIMJ40w
        JKzGUKfC/6W3m8u0D3IP43IPYgDcUhV8po3WBxm7ZBdvyBQ=
X-Google-Smtp-Source: ABdhPJw10ieSvViuMmAJIqsi1C/C8Zh1SnCnFwmwAol8b0sTRXJ5UpZILb6CHVczYV5dsb5R2PjtdE4iKtKb/twcQfQ=
X-Received: by 2002:a25:814a:0:b0:64f:f06c:cf6d with SMTP id
 j10-20020a25814a000000b0064ff06ccf6dmr20134387ybm.88.1653639488637; Fri, 27
 May 2022 01:18:08 -0700 (PDT)
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
In-Reply-To: <CAK8P3a3ocZDD9odfDe_WBeovHXCNU4CSScrmE4HVtLKef_z+EQ@mail.gmail.com>
From:   Yegor Yefremov <yegorslists@googlemail.com>
Date:   Fri, 27 May 2022 10:17:57 +0200
Message-ID: <CAGm1_ktOPgUSVjPP44Y49GgFLpDMrECu7eqQu7d2ZvJiOftWAQ@mail.gmail.com>
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

Hi Arnd,

On Fri, May 27, 2022 at 8:57 AM Arnd Bergmann <arnd@arndb.de> wrote:
>
> On Fri, May 27, 2022 at 8:50 AM Tony Lindgren <tony@atomide.com> wrote:
> > * Arnd Bergmann <arnd@arndb.de> [220527 06:35]:
> > > On Fri, May 27, 2022 at 6:44 AM Yegor Yefremov <yegorslists@googlemail.com> wrote:
> > > > On Thu, May 26, 2022 at 4:16 PM Arnd Bergmann <arnd@arndb.de> wrote:
>
> > Based on what we just discussed on #armlinux, testing before and after
> > commit 9c46929e7989 ("ARM: implement THREAD_INFO_IN_TASK for uniprocessor
> > systems") might be a good idea as it enables some config options that
> > did not get enabled earlier.
> >
> > Another thing that might help is to bisect again and ensure vmap stack
> > config option stays disabled so issues related to vmap stack are kept
> > out of the way.
>
> Unfortunately the commits around 9c46929e7989 are the ones that failed
> to build according to the original report. But it's possible that the
> problem has something to do with
> CONFIG_CURRENT_POINTER_IN_TPIDRURO, which is disabled
> in the V6+SMP config, and which in turn is required for
> THREAD_INFO_IN_TASK, IRQSTACKS and STACKPROTECTOR_PER_TASK.
>
> If any of the four are the cause of the stall, then turning off ARCH_OMAP2 and
> CONFIG_CPU_V6 should show the same bug in older commits as well.

Both config options disabled:

# zcat /proc/config.gz | grep 'CONFIG_ARCH_MULTI_V6\|CONFIG_SMP'
# CONFIG_ARCH_MULTI_V6 is not set
CONFIG_ARCH_MULTI_V6_V7=y
# CONFIG_SMP is not set

This helped - no stalls.

Regards,
Yegor
