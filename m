Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 836FF534A3F
	for <lists+linux-omap@lfdr.de>; Thu, 26 May 2022 07:49:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345738AbiEZFtR (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 26 May 2022 01:49:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51828 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231845AbiEZFtQ (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 26 May 2022 01:49:16 -0400
Received: from mail-yw1-x1135.google.com (mail-yw1-x1135.google.com [IPv6:2607:f8b0:4864:20::1135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B8BF08A325;
        Wed, 25 May 2022 22:49:14 -0700 (PDT)
Received: by mail-yw1-x1135.google.com with SMTP id 00721157ae682-2ef5380669cso4729297b3.9;
        Wed, 25 May 2022 22:49:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=UoSj+yY+ppeYCV5P505hsxj98Wvu+XMJ/tJbseI22DQ=;
        b=IidrXtJJfDYrIL9gE3q5IzQT56V/uhGjcp907lwHAW3Pnt2gkRDMs/D77C7ZC2YQmy
         iT7TrNqZ/C2mTqqOendKqNM3Vj4/wvznAzSns1GjeIf80Fzkzx3v7nyPVfYE+Xq1fKxl
         3DfFzmOyehwBhV+6IUP2eYJ8eLC3QXMyW/D5g3wRq5i2p18BMWBVIxb8KB/OjNqkfpv+
         N+FV4YfgRRtJydXo0ukFCTC+QDZD7X7IEEsLpj1X0GeuHr5Bl2agzYRLWuoND9NkWFdx
         +n3hrHEQZx7G1lctiCKQQRce7MYdbBod5rJIbrj4UbWJHWimXAzHK3e1EivoXOZQJ5FK
         R+IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=UoSj+yY+ppeYCV5P505hsxj98Wvu+XMJ/tJbseI22DQ=;
        b=zkWdOswo4PcHfYF1dgwVa1gGS/2sz2CRB3JTRVFevmLQrprjoUt2jdiJspauaxAjtR
         SZBkYbrE5sv2Hpv/Sjgp17QugJ8s3SISQdVILa9uDUTzcZLsvyk5n9+GCA4bDlnNAk0Z
         btIes0iEG8/OUNjeTtqigbMgUjPXcHZMVtUw7noqxx4YSzw0o2hlUV8Ko8v6zi4j7pRI
         KAfNwuquHkmuk2Xt4DBMPFkyaK9KCpKsuzpSlPFu1GuD6drFN7IQ9p/XBXo5XpR7fZNV
         qbCxeXk1Sa8YY+end4tfSIgrtWHgOF/09m0SDtYwFMLiuMfaJ5X0OWxE44Xk3TVwJrJK
         G/pw==
X-Gm-Message-State: AOAM533j3dXByHYloaj20eg8G166Bnh1S4xRCt5aObOL9tXGwNKrLGkm
        KOUHErQae62CB2Sb+p7MTxruDT1L9dBnE+Q7eHU=
X-Google-Smtp-Source: ABdhPJwUx7/eiV7wQoB0RRAtjkrOB7Y/F7mIp3iuzy1MShtSwwvyYK+HF6ieZUWtrzTX10CvhK87e2ewJzl3Qksg7t0=
X-Received: by 2002:a81:5593:0:b0:2ff:2663:ea7f with SMTP id
 j141-20020a815593000000b002ff2663ea7fmr37716682ywb.224.1653544153943; Wed, 25
 May 2022 22:49:13 -0700 (PDT)
MIME-Version: 1.0
References: <CAGm1_kvEcvzKBb2O7NEa1SDt8MuOQfnN8LQ+voNGUBDR8JpKSg@mail.gmail.com>
 <YnNb5M+gHI4hIaPG@atomide.com> <CAGm1_kstAbEZXBYwoK4GrFxMmPi=kpmdfJd1WAB8XSE_vNTTNg@mail.gmail.com>
 <Ynyd9HeFNmGQiovY@atomide.com> <CAK8P3a2wrH9XxGF6uBeQ6J0+KhehxsFO63R6qcwZ1DexH4N=2Q@mail.gmail.com>
 <CAGm1_ku85dL_zn4=9=OVkS3S3eBH-eqrc-c1UZyvnERbMrW98Q@mail.gmail.com>
 <CAGm1_kvKxe+RFNSxzZq+hy9594ek-s8owneXQqBMy8PxwdHP8Q@mail.gmail.com>
 <CAK8P3a1YTBRO_pRZLqbNHwG4DaYA56tn1_E0g3c1VW0B-jz-qg@mail.gmail.com>
 <CAGm1_kuaRr3BFWSq-2v4vT0VbVvMX=kMHQsQ1KZnKe9UEff3MA@mail.gmail.com> <Yozpa3DlLLEzBR8W@atomide.com>
In-Reply-To: <Yozpa3DlLLEzBR8W@atomide.com>
From:   Yegor Yefremov <yegorslists@googlemail.com>
Date:   Thu, 26 May 2022 07:49:02 +0200
Message-ID: <CAGm1_ku5EusuSJ9zhYZBRGdRUr8_NYsx3=BZQkuYtNJpq3Tn_w@mail.gmail.com>
Subject: Re: am335x: 5.18.x: system stalling
To:     Tony Lindgren <tony@atomide.com>
Cc:     Arnd Bergmann <arnd@arndb.de>, Ard Biesheuvel <ardb@kernel.org>,
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

Hi Tony,

On Tue, May 24, 2022 at 4:19 PM Tony Lindgren <tony@atomide.com> wrote:
>
> * Yegor Yefremov <yegorslists@googlemail.com> [220524 13:34]:
> > Hi Arnd,
> >
> > On Sat, May 21, 2022 at 9:41 PM Arnd Bergmann <arnd@arndb.de> wrote:
> > >
> > > On Thu, May 19, 2022 at 5:52 PM Yegor Yefremov
> > > <yegorslists@googlemail.com> wrote:
> > > > On Thu, May 12, 2022 at 12:20 PM Yegor Yefremov
> > > > <yegorslists@googlemail.com> wrote:
> > > > > On Thu, May 12, 2022 at 10:43 AM Arnd Bergmann <arnd@arndb.de> wrote:
> > > > > >
> > > > > > On Thu, May 12, 2022 at 7:41 AM Tony Lindgren <tony@atomide.com> wrote:
> > > > > > > * Yegor Yefremov <yegorslists@googlemail.com> [220511 14:16]:
> > > > > > > > On Thu, May 5, 2022 at 7:08 AM Tony Lindgren <tony@atomide.com> wrote:
> > > > > > > > > * Yegor Yefremov <yegorslists@googlemail.com> [220504 10:35]:
> > > > > > > > > > Hi Tony, all,
> > > > > > > > > >
> > > > > > > > > > since kernel 5.18.x (5.17.x doesn't show this behavior), the system
> > > > > > > > > > stalls as soon as I invoke the following commands (initializing
> > > > > > > > > > USB-to-CAN converter):
> > > > > > > > > >
> > > > > > > > > > slcand -o -s8 -t hw -S 3000000 /dev/ttyUSB0
> > > > > > > > > > ip link set slcan0 up
> > > > > >
> > > > > > Oh, I missed this part at first and only looked at the backtrace.
> > > > > > Which CAN driver
> > > > > > are you using? It's likely a problem in the kernel driver.
> > > > >
> > > > > I am using the slcan driver [1].
> > >
> > > Ok, so this is just a serial port based driver, which means the
> > > follow-up question
> > > is what you use for your uart. Is this one of the USB-serial ones or an on-chip
> > > uart? Which driver?
> >
> > This is the following chain: am335x -> musb-> ftdi_sio (FT-X flavor).
> >
> > I have also tried another system with two FT4232 chips (RS232 devices)
> > and performed transmission tests. This had no effect, the system
> > didn't stall.
>
> Maybe also try with CONFIG_MUSB_PIO_ONLY=y to see if it makes things
> better or worse :)

PIO is always the last resort :-) And now it proves it again. With
PIO_ONLY the system doesn't stall.

Regards,
Yegor

> > > > > > CONFIG_DMA_API_DEBUG is still likely to pinpoint the bug, but I might also
> > > > > > just see it by looking at the right source file.
> > > > >
> > > > > I'll try to get more debug info with CONFIG_DMA_API_DEBUG.
> > > >
> > > > DMA_API_DEBUG showed nothing new. But disabling the CPUfreq driver
> > > > "solved" the problem. I have tried different governors and got these
> > > > two groups:
> > > >
> > > > ondemand, schedutil - cause the problem
> > > > conservative, powersave, performance and userspace - don't cause the problem
> > > >
> > > > So far, I have only seen the same debug output that I've initially
> > > > sent and in most cases, the system stalls without the output.
> > >
> > > Ok, so that sounds like it happens when you change the frequency.
> > > I assume this means you are using drivers/cpufreq/omap-cpufreq.c?
> >
> > Yes.
> >
> > > When using the usersapce governor, do you see problems when you
> > > manually change the frequency from sysfs?
> >
> > No, I can switch between 300MHz and 600MHz and perform CAN tests.
> > Everything goes well.
>
> OK so not cpufreq related.
>
> Regards,
>
> Tony
