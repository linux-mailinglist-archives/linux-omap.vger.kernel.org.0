Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 90F4B52DAA5
	for <lists+linux-omap@lfdr.de>; Thu, 19 May 2022 18:52:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241234AbiESQwT (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 19 May 2022 12:52:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47606 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235521AbiESQwS (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 19 May 2022 12:52:18 -0400
Received: from mail-yw1-x1129.google.com (mail-yw1-x1129.google.com [IPv6:2607:f8b0:4864:20::1129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C79715AEC8;
        Thu, 19 May 2022 09:52:16 -0700 (PDT)
Received: by mail-yw1-x1129.google.com with SMTP id 00721157ae682-2fefb051547so63017427b3.5;
        Thu, 19 May 2022 09:52:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=lHCXvfU913UZzWwkWLW8PuUF55J+NqN7GNP5EdosEmA=;
        b=PmWqJxxifKIoOgHFXmefLeMf5SNVsk8hDjVTNrBVEGLYoDc1OflT/W/t6tCoRq3bFS
         Zsj+hHaUHB2vloNW/GMQTopmCmwq5+ADqPsH1BRegbriHDTsEN5pys++wP0kQFgLuKLW
         BnMAtgGNO3ZV1yLp8Ga+O5Nvcyr/UwaVYNpguYa0dx4bnw2nq7XfK1v1xgEI9PDWxqG9
         jCQ6bqv9RiFFlOdtMKB1IavNGfFxL9U1LEsr0v4bGra3LlphCkUArMKOk5Kjx0ss0y/7
         5bgXb9fm6VpyMM3pK7iWkZI340+ZVySJUatMphxu/PMqm6l2a7zVJc3HWyKMnfxNfMIT
         boOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=lHCXvfU913UZzWwkWLW8PuUF55J+NqN7GNP5EdosEmA=;
        b=OCWMz6gX1ln9BO93B0dBcK69YtMErq/D4rwl34lLcPz0GUGFTXtXik29YfSH2c0f5M
         xPauNUzyWMRHldUB1+15TfMXkReRwG9x9m/tTCbm394uYBUFynXnMzefvcrVa3jFXZek
         JW1aS9Q2IJMrpMjNrJFPaBwXtWmEukZCgjoWsCNAEO10/0iAdhYQdq9bdJWpRgkvTYfQ
         e7Zj9LeQPYGUtrRaxnUChOwDKTnH4zM0HhwTIdwvF2NaUJuoUck4kv952DfxBoc6dPoY
         KdhnNQZG5QBXDsn7mykc0nJ3JYk5qSxEGq9okO8cMdI3lYnGkh22I6xFa6qYbNgAnIhv
         7LgQ==
X-Gm-Message-State: AOAM531z5JXNkf8/tjlyqjdyCbkkiRbFxWl6fk7FjnAaLDtQgyXMAcvM
        qLVSRqxX8d/MvSFtQgp3wuSxhAQnJvAff9v6Azg=
X-Google-Smtp-Source: ABdhPJxgwqortp6LMKQqdJfzXMmfQSE/OcnF3FErWG8XOevuRbeXOgq6I2WrPKba3Od1VBXy6oyEfNaFprdUyPboKIk=
X-Received: by 2002:a0d:cd06:0:b0:2f8:f39c:4cfc with SMTP id
 p6-20020a0dcd06000000b002f8f39c4cfcmr5740233ywd.495.1652979135944; Thu, 19
 May 2022 09:52:15 -0700 (PDT)
MIME-Version: 1.0
References: <CAGm1_kvEcvzKBb2O7NEa1SDt8MuOQfnN8LQ+voNGUBDR8JpKSg@mail.gmail.com>
 <YnNb5M+gHI4hIaPG@atomide.com> <CAGm1_kstAbEZXBYwoK4GrFxMmPi=kpmdfJd1WAB8XSE_vNTTNg@mail.gmail.com>
 <Ynyd9HeFNmGQiovY@atomide.com> <CAK8P3a2wrH9XxGF6uBeQ6J0+KhehxsFO63R6qcwZ1DexH4N=2Q@mail.gmail.com>
 <CAGm1_ku85dL_zn4=9=OVkS3S3eBH-eqrc-c1UZyvnERbMrW98Q@mail.gmail.com>
In-Reply-To: <CAGm1_ku85dL_zn4=9=OVkS3S3eBH-eqrc-c1UZyvnERbMrW98Q@mail.gmail.com>
From:   Yegor Yefremov <yegorslists@googlemail.com>
Date:   Thu, 19 May 2022 18:52:04 +0200
Message-ID: <CAGm1_kvKxe+RFNSxzZq+hy9594ek-s8owneXQqBMy8PxwdHP8Q@mail.gmail.com>
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

On Thu, May 12, 2022 at 12:20 PM Yegor Yefremov
<yegorslists@googlemail.com> wrote:
>
> Hi Arnd,
>
> On Thu, May 12, 2022 at 10:43 AM Arnd Bergmann <arnd@arndb.de> wrote:
> >
> > On Thu, May 12, 2022 at 7:41 AM Tony Lindgren <tony@atomide.com> wrote:
> > > * Yegor Yefremov <yegorslists@googlemail.com> [220511 14:16]:
> > > > On Thu, May 5, 2022 at 7:08 AM Tony Lindgren <tony@atomide.com> wrote:
> > > > > * Yegor Yefremov <yegorslists@googlemail.com> [220504 10:35]:
> > > > > > Hi Tony, all,
> > > > > >
> > > > > > since kernel 5.18.x (5.17.x doesn't show this behavior), the system
> > > > > > stalls as soon as I invoke the following commands (initializing
> > > > > > USB-to-CAN converter):
> > > > > >
> > > > > > slcand -o -s8 -t hw -S 3000000 /dev/ttyUSB0
> > > > > > ip link set slcan0 up
> >
> > Oh, I missed this part at first and only looked at the backtrace.
> > Which CAN driver
> > are you using? It's likely a problem in the kernel driver.
>
> I am using the slcan driver [1].
>
> > CONFIG_DMA_API_DEBUG is still likely to pinpoint the bug, but I might also
> > just see it by looking at the right source file.
>
> I'll try to get more debug info with CONFIG_DMA_API_DEBUG.

DMA_API_DEBUG showed nothing new. But disabling the CPUfreq driver
"solved" the problem. I have tried different governors and got these
two groups:

ondemand, schedutil - cause the problem
conservative, powersave, performance and userspace - don't cause the problem

So far, I have only seen the same debug output that I've initially
sent and in most cases, the system stalls without the output.

Yegor
>
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/net/can/slcan.c?h=v5.18-rc6
>
> Yegor
> >        Arnd
