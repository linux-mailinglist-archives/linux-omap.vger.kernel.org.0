Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 71F92532C58
	for <lists+linux-omap@lfdr.de>; Tue, 24 May 2022 16:38:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238313AbiEXOhV (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 24 May 2022 10:37:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43006 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238291AbiEXOhQ (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 24 May 2022 10:37:16 -0400
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E49838CCFB;
        Tue, 24 May 2022 07:37:14 -0700 (PDT)
Received: from mail-yw1-f182.google.com ([209.85.128.182]) by
 mrelayeu.kundenserver.de (mreue012 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1MCoYS-1o2H6G3lAG-008sj6; Tue, 24 May 2022 16:37:13 +0200
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-2ff90e0937aso109245257b3.4;
        Tue, 24 May 2022 07:37:12 -0700 (PDT)
X-Gm-Message-State: AOAM531NQ9nZ42DUFSZhpY01z8jVWqk321MePbhNymLIHPUo+L28NmLu
        XTr+QielpdSmSx3B/cWEdZod4rvWRtBIOvko/8s=
X-Google-Smtp-Source: ABdhPJxGrm1E6BZQK5YLCc+LaETp8Lh3ZeDMhYEsJkfK/OrROFxhdLdYFixdudWyg6b1NU1IqUuE+/cFgJa+s4Ofbr8=
X-Received: by 2002:a0d:cfc7:0:b0:300:26d2:30eb with SMTP id
 r190-20020a0dcfc7000000b0030026d230ebmr3783730ywd.320.1653403031598; Tue, 24
 May 2022 07:37:11 -0700 (PDT)
MIME-Version: 1.0
References: <CAGm1_kvEcvzKBb2O7NEa1SDt8MuOQfnN8LQ+voNGUBDR8JpKSg@mail.gmail.com>
 <YnNb5M+gHI4hIaPG@atomide.com> <CAGm1_kstAbEZXBYwoK4GrFxMmPi=kpmdfJd1WAB8XSE_vNTTNg@mail.gmail.com>
 <Ynyd9HeFNmGQiovY@atomide.com> <CAK8P3a2wrH9XxGF6uBeQ6J0+KhehxsFO63R6qcwZ1DexH4N=2Q@mail.gmail.com>
 <CAGm1_ku85dL_zn4=9=OVkS3S3eBH-eqrc-c1UZyvnERbMrW98Q@mail.gmail.com>
 <CAGm1_kvKxe+RFNSxzZq+hy9594ek-s8owneXQqBMy8PxwdHP8Q@mail.gmail.com>
 <CAK8P3a1YTBRO_pRZLqbNHwG4DaYA56tn1_E0g3c1VW0B-jz-qg@mail.gmail.com> <CAGm1_kuaRr3BFWSq-2v4vT0VbVvMX=kMHQsQ1KZnKe9UEff3MA@mail.gmail.com>
In-Reply-To: <CAGm1_kuaRr3BFWSq-2v4vT0VbVvMX=kMHQsQ1KZnKe9UEff3MA@mail.gmail.com>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Tue, 24 May 2022 16:36:54 +0200
X-Gmail-Original-Message-ID: <CAK8P3a1Wba80aKkraqEawYSoOxX-crYrKY_NPyRqkPZtfspk4g@mail.gmail.com>
Message-ID: <CAK8P3a1Wba80aKkraqEawYSoOxX-crYrKY_NPyRqkPZtfspk4g@mail.gmail.com>
Subject: Re: am335x: 5.18.x: system stalling
To:     Yegor Yefremov <yegorslists@googlemail.com>
Cc:     Arnd Bergmann <arnd@arndb.de>, Tony Lindgren <tony@atomide.com>,
        Ard Biesheuvel <ardb@kernel.org>,
        Linux-OMAP <linux-omap@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:Yy1Tkhcsf150+AgMTml809xsdYpvfJ3PwPAASTs681y+6fifNgV
 bf54Klpty9SLq0ZuAGb1eA1tqj0rWRG5dk5Qi7B4oEHgAV2fAb8fgpxeBxB3ifvvCrWet4p
 gDsRMH9K+N2Hu2nEPEwAUN9h32EraAR5U7Ag7C5jahn77/pjot006Z9kfz1GdMzbtgcNGPH
 zyiHW7HR/bASt3nhclZcw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:5BR7wGzgues=:lkOSIl9ZGNDwnFwY7Gb86v
 ITv6N1kwoxCq5t+LqkH+9K8cFwoIPGHwxOlH/FBQAp4QWU0vOoI0EgR7tcLpvihq/BwOWhqfj
 NWUeR6hks52fNMyVBYSRRjem1haC3oRvtQxKoFZzt8dCRkE3glcjcJ0voQb0C9cZP62Mf8wGq
 KRrNF4UhtQHfhPpP9FR2gy7sUozFUAgypJDyiD4zSw8+Z0KT6AUyEMZWDZKkgmYZcH0bDGijb
 aXePlGmafcRcEd0wSPJ2jxzXod0IormCA9c31gqhdc9urZUTS15GkrJ2brr3nA5l7cgf+KNed
 t7FXhDALTsY7UfPwUn+faf9fQPCc63w0pJmGgHQRt7Qc3SyjRqYN2saVlQ9XHrsNHLBeMWIs0
 c1wg3JX7cpd9Vathzuzwj8Xf3IRcSEPIyGiPxxeKrqQRLEIgqX5olnyYYSqwQ4X9b7qfxuPma
 nMIirYpP5f1Q4p6aAyuwVqkM1nmP9/DohdNEwfvL24UQq1fyv1OqWGpqbVgtOwTvjjcigDMqR
 B1+dCDBOS0z3ycO6XE5UXcLPeWgEKV8xuLUDfNBAsFsptaolGX+vHDcXcvrmHwChGoEyJbfN6
 n4f7VSh+Q0x6oBpIpGVvtb57VBhviHDWkzSc6YcI8A52oHQ4R7NEWGmCYQo8tcTH2IXgjj/cC
 v6olGJQ9W4hb3w37QsWjIXQQKcxrEoWOvtZSsGsmu6MImNOM9kz9Qgt5d4YSTXwO4MJtdRzuw
 NChbyAKHv3Db5b+D8scjOrjcZTatIS+xRMJJow==
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Tue, May 24, 2022 at 3:38 PM Yegor Yefremov
<yegorslists@googlemail.com> wrote:
> On Sat, May 21, 2022 at 9:41 PM Arnd Bergmann <arnd@arndb.de> wrote:
> > On Thu, May 19, 2022 at 5:52 PM Yegor Yefremov <yegorslists@googlemail.com> wrote:
> >
> > Ok, so this is just a serial port based driver, which means the
> > follow-up question
> > is what you use for your uart. Is this one of the USB-serial ones or an on-chip
> > uart? Which driver?
>
> This is the following chain: am335x -> musb-> ftdi_sio (FT-X flavor).
>
> I have also tried another system with two FT4232 chips (RS232 devices)
> and performed transmission tests. This had no effect, the system
> didn't stall.

Ok, I see. I looked at ftdi_sio, and found a couple of slightly suspicious
code paths in the FT-X specific bits, but after looking more closely I
found nothing actually wrong with them.

It might still be worth trying more combinations of those, e.g. if the FT-X
uart fails without the CAN adapter, or whether it fails on the other machine.

> > > > > CONFIG_DMA_API_DEBUG is still likely to pinpoint the bug, but I might also
> > > > > just see it by looking at the right source file.
> > > >
> > > > I'll try to get more debug info with CONFIG_DMA_API_DEBUG.
> > >
> > > DMA_API_DEBUG showed nothing new. But disabling the CPUfreq driver
> > > "solved" the problem. I have tried different governors and got these
> > > two groups:
> > >
> > > ondemand, schedutil - cause the problem
> > > conservative, powersave, performance and userspace - don't cause the problem
> > >
> > > So far, I have only seen the same debug output that I've initially
> > > sent and in most cases, the system stalls without the output.
> >
> > Ok, so that sounds like it happens when you change the frequency.
> > I assume this means you are using drivers/cpufreq/omap-cpufreq.c?
>
> Yes.
>
> > When using the usersapce governor, do you see problems when you
> > manually change the frequency from sysfs?
>
> No, I can switch between 300MHz and 600MHz and perform CAN tests.
> Everything goes well.

One more idea: maybe this is a case where we actually run out of stack
space? Without VMAP stacks, that may easily go unnoticed, but with
VMAP stack it is supposed to produce an obvious error message with a
backtrace. If we have a callchain that involves

can_xmit -> tty -> tty_usb -> usb -> musb -> schedule -> cpufreq_update_util
 -> omap_cpufreq

we might run out of the 8KB stack area. It's probably not this, but if you
want to rule it out, try using

#define THREAD_SIZE_ORDER       2

       Arnd
