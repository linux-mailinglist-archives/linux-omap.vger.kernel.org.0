Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CD28A532B65
	for <lists+linux-omap@lfdr.de>; Tue, 24 May 2022 15:38:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233427AbiEXNi1 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 24 May 2022 09:38:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49908 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231971AbiEXNi0 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 24 May 2022 09:38:26 -0400
Received: from mail-yb1-xb2f.google.com (mail-yb1-xb2f.google.com [IPv6:2607:f8b0:4864:20::b2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F005B75213;
        Tue, 24 May 2022 06:38:25 -0700 (PDT)
Received: by mail-yb1-xb2f.google.com with SMTP id s14so3570021ybc.10;
        Tue, 24 May 2022 06:38:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=a7K02siOWCjBPHJ/N7NfpvThuWXbwOYCbTDmR8EMUaY=;
        b=ML9vz3JqGsm18QLFOzYFXiI0o515V3vdtA397fdxanu9u1f9pNKpT1SYxPXr6Ip9cJ
         clNtG0GfaSKxIaPe+9BqzNFfcpLn6pVOteP9wI8jbwSp7lpHhqlK8PgGSzhb46SfZkOz
         BxrXlTV7JX0WVkkuvzFJo7Op30RZ4gbbnv41ptT1pywds/VXhql3DB8SngsCUdNgtmgQ
         W7+xrXYxJcOVmfrXvqPQYq70IpaJC/4RZMdp7OiVauFacD3WX22jdY2TFBmp/6PgI/NZ
         ubiZICXuuAfm6zS7K47UP/SON01cG3S9XGFyZ+h4XN0SypQX7wi92OmAqqN55DgufUZ5
         aMIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=a7K02siOWCjBPHJ/N7NfpvThuWXbwOYCbTDmR8EMUaY=;
        b=7RV/qv7cVp6te4OevRtrwr1aW23dOKOZHCKP4rsxOFw7phzpmVFCZt0lFLlgBNI4c+
         39n0ZCXIXpb+YTeVk7lcgwKjQSQ0/P0g1xcZ7RJpgOAwcVQEk1zRDnpmSk/lgtYxh6A2
         jNCKegPl73rFn43x4TspMRU0lJaOU79bECiknI1RLStE2vOMgVZpfULKjRTnh3uw3fTn
         NEAEDkteCzFJ1Zkg72pXE7p/m+56VIlsvvF5TuYIwtrvS5g3vVY/XFkaDFiUPsH/6LId
         uAFTXN1/anTmjLNneF8d3jWnjsZy337TmWkJEEhfB14ZA//Fx+jsEgun6jVgb/DPGWrP
         SHvQ==
X-Gm-Message-State: AOAM531HgoFn4EP7IT6HTKy17w3068PZuOfppulelVL/O+Gpx4Jux/BX
        OmKMSQ1Ktvi+C9Xxppw9UChq3Qu86+hexevuGiPcwMR1SIU=
X-Google-Smtp-Source: ABdhPJwPxe+ejl2APV4T9cgV1ZBHOWJgH2A70FN8su8l4jbO58aY+UO3i5eMhepdZmKJoVZtZvTjXyJZyRJRPK+zI6U=
X-Received: by 2002:a25:2c81:0:b0:64d:f21d:1fab with SMTP id
 s123-20020a252c81000000b0064df21d1fabmr26524917ybs.355.1653399505148; Tue, 24
 May 2022 06:38:25 -0700 (PDT)
MIME-Version: 1.0
References: <CAGm1_kvEcvzKBb2O7NEa1SDt8MuOQfnN8LQ+voNGUBDR8JpKSg@mail.gmail.com>
 <YnNb5M+gHI4hIaPG@atomide.com> <CAGm1_kstAbEZXBYwoK4GrFxMmPi=kpmdfJd1WAB8XSE_vNTTNg@mail.gmail.com>
 <Ynyd9HeFNmGQiovY@atomide.com> <CAK8P3a2wrH9XxGF6uBeQ6J0+KhehxsFO63R6qcwZ1DexH4N=2Q@mail.gmail.com>
 <CAGm1_ku85dL_zn4=9=OVkS3S3eBH-eqrc-c1UZyvnERbMrW98Q@mail.gmail.com>
 <CAGm1_kvKxe+RFNSxzZq+hy9594ek-s8owneXQqBMy8PxwdHP8Q@mail.gmail.com> <CAK8P3a1YTBRO_pRZLqbNHwG4DaYA56tn1_E0g3c1VW0B-jz-qg@mail.gmail.com>
In-Reply-To: <CAK8P3a1YTBRO_pRZLqbNHwG4DaYA56tn1_E0g3c1VW0B-jz-qg@mail.gmail.com>
From:   Yegor Yefremov <yegorslists@googlemail.com>
Date:   Tue, 24 May 2022 15:38:13 +0200
Message-ID: <CAGm1_kuaRr3BFWSq-2v4vT0VbVvMX=kMHQsQ1KZnKe9UEff3MA@mail.gmail.com>
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

On Sat, May 21, 2022 at 9:41 PM Arnd Bergmann <arnd@arndb.de> wrote:
>
> On Thu, May 19, 2022 at 5:52 PM Yegor Yefremov
> <yegorslists@googlemail.com> wrote:
> > On Thu, May 12, 2022 at 12:20 PM Yegor Yefremov
> > <yegorslists@googlemail.com> wrote:
> > > On Thu, May 12, 2022 at 10:43 AM Arnd Bergmann <arnd@arndb.de> wrote:
> > > >
> > > > On Thu, May 12, 2022 at 7:41 AM Tony Lindgren <tony@atomide.com> wrote:
> > > > > * Yegor Yefremov <yegorslists@googlemail.com> [220511 14:16]:
> > > > > > On Thu, May 5, 2022 at 7:08 AM Tony Lindgren <tony@atomide.com> wrote:
> > > > > > > * Yegor Yefremov <yegorslists@googlemail.com> [220504 10:35]:
> > > > > > > > Hi Tony, all,
> > > > > > > >
> > > > > > > > since kernel 5.18.x (5.17.x doesn't show this behavior), the system
> > > > > > > > stalls as soon as I invoke the following commands (initializing
> > > > > > > > USB-to-CAN converter):
> > > > > > > >
> > > > > > > > slcand -o -s8 -t hw -S 3000000 /dev/ttyUSB0
> > > > > > > > ip link set slcan0 up
> > > >
> > > > Oh, I missed this part at first and only looked at the backtrace.
> > > > Which CAN driver
> > > > are you using? It's likely a problem in the kernel driver.
> > >
> > > I am using the slcan driver [1].
>
> Ok, so this is just a serial port based driver, which means the
> follow-up question
> is what you use for your uart. Is this one of the USB-serial ones or an on-chip
> uart? Which driver?

This is the following chain: am335x -> musb-> ftdi_sio (FT-X flavor).

I have also tried another system with two FT4232 chips (RS232 devices)
and performed transmission tests. This had no effect, the system
didn't stall.

> > > > CONFIG_DMA_API_DEBUG is still likely to pinpoint the bug, but I might also
> > > > just see it by looking at the right source file.
> > >
> > > I'll try to get more debug info with CONFIG_DMA_API_DEBUG.
> >
> > DMA_API_DEBUG showed nothing new. But disabling the CPUfreq driver
> > "solved" the problem. I have tried different governors and got these
> > two groups:
> >
> > ondemand, schedutil - cause the problem
> > conservative, powersave, performance and userspace - don't cause the problem
> >
> > So far, I have only seen the same debug output that I've initially
> > sent and in most cases, the system stalls without the output.
>
> Ok, so that sounds like it happens when you change the frequency.
> I assume this means you are using drivers/cpufreq/omap-cpufreq.c?

Yes.

> When using the usersapce governor, do you see problems when you
> manually change the frequency from sysfs?

No, I can switch between 300MHz and 600MHz and perform CAN tests.
Everything goes well.

Yegor
