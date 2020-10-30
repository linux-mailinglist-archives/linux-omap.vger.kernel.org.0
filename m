Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7E5BB2A0202
	for <lists+linux-omap@lfdr.de>; Fri, 30 Oct 2020 11:01:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726267AbgJ3KBj (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 30 Oct 2020 06:01:39 -0400
Received: from mail.kernel.org ([198.145.29.99]:44916 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725948AbgJ3KBj (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Fri, 30 Oct 2020 06:01:39 -0400
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id D032E2075E;
        Fri, 30 Oct 2020 10:01:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1604052098;
        bh=aCIlM5arV5wY4A3hrPi10D/lq8E6uCXEEm62bc118Xg=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=rWnnma5QZpvlPDieX6oK26oOUQjpvWv0yim4M1HETsFPKHX2T4hoDjL7rVxRxiTST
         xIY1SKuXq4Mx9MWXQGCiwVzpUE53ZzqJL/pPgMWG2T2bdZrc8pKgRMLcmkIvTa52AT
         F649eQhA9sXrIg0kbQ7MhSiU5QsEQlwW1lKV456U=
Received: by mail-qk1-f174.google.com with SMTP id a65so2066113qkg.13;
        Fri, 30 Oct 2020 03:01:37 -0700 (PDT)
X-Gm-Message-State: AOAM532niZXxfie3FLsWrmyzhU+UcdtFVKMjceBHxPSO9TiLIy1OXHd4
        I4PDhOKFaQ8tR03q9BDo11FKNWqDfdDvUiROlj0=
X-Google-Smtp-Source: ABdhPJxiHtCBgBl5vY0rzzkj9bjtnjHjZ82vuqsOwUdZZDGDKiQUXvHFyV8avHUc4GBPPnMOS3+3+cJHFv4EqCC7s0Y=
X-Received: by 2002:a05:620a:22c9:: with SMTP id o9mr1301272qki.286.1604052096817;
 Fri, 30 Oct 2020 03:01:36 -0700 (PDT)
MIME-Version: 1.0
References: <20201001202725.16034-1-grygorii.strashko@ti.com>
 <20201002125000.5b5kho4e5de7jjrj@akan> <bb6e0bd9-a8fe-f63b-14fd-92a1f8cea0bb@ti.com>
 <CAK8P3a1-CCcKmEkdw+NNr4Yo7z+BEzX0g7uU_SnXOB+VEZm8HA@mail.gmail.com> <497f744e-68be-7a87-6a18-824249ddcac8@ti.com>
In-Reply-To: <497f744e-68be-7a87-6a18-824249ddcac8@ti.com>
From:   Arnd Bergmann <arnd@kernel.org>
Date:   Fri, 30 Oct 2020 11:01:20 +0100
X-Gmail-Original-Message-ID: <CAK8P3a2dxGV4ussfC16XN98xeSwsKum=Hu8_GJ+E3ZS=wu8oYw@mail.gmail.com>
Message-ID: <CAK8P3a2dxGV4ussfC16XN98xeSwsKum=Hu8_GJ+E3ZS=wu8oYw@mail.gmail.com>
Subject: Re: [PATCH] ARM: multi_v7_defconfig: ti: Enable networking options
 for nfs boot
To:     Grygorii Strashko <grygorii.strashko@ti.com>
Cc:     Nishanth Menon <nm@ti.com>, Tony Lindgren <tony@atomide.com>,
        Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
        linux-omap <linux-omap@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Sekhar Nori <nsekhar@ti.com>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Russell King <linux@armlinux.org.uk>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Fri, Oct 30, 2020 at 10:36 AM Grygorii Strashko
<grygorii.strashko@ti.com> wrote:
> On 29/10/2020 22:06, Arnd Bergmann wrote:
> >>
> >> Are there any actions need to be done to have this patch merged?
> >
> > I would prefer if a platform maintainer (I assume Tony in this case)
> > picks it up and forwards it to soc@kernel.org together with other
> > related changes. Olof and I tend to ignore patches sent directly
> > to us, so we don't get in the way of platform maintainers that
> > may have already merged similar patches or have comments.
> >
> > I suspect Tony didn't pick it up either because from the patch
> > subject and the description, it is not clear that he is the one
> > to act on it. It helps to be more specific and ask the maintainer
> > by addressing them in person below the '---' line, as well as
> > only putting one person in 'To:' and the rest in 'Cc:'.
>
> Thanks for your comments and sorry that I disturbed you.
>
> But, honestly, I'm confused (and probably I'm not the first one) as multi_v7 is common
> for all ARM platforms while change is TI OMAP specific,
> and neither Documentation neither get_maintainer.pl provide any reliable information
> on how to proceed :( and who should be responsible for merging multi_x patches.
>
> I'd really have tried to do some checking while preparing patch and TO/CC list -
> some patches applied by platform maintainers, but some by top ARM maintainers.

I understand that this is confusion, and we should probably come up
with a better way to handle it.

To clarify further, while we prefer the patches to be picked up by the
platform maintainers and forwarded to us for patches to the common
files that are needed for a particular platform, you can also send these
patches directly to soc@kernel.org, which puts them into patchwork
at https://patchwork.kernel.org/project/linux-soc/list/. Once it's in
there, we will process it by merging the patch or getting back to you
for further clarification.

> > One comment on the contents of the patch: IIRC this is a fairly
> > large driver. To ensure we don't burden other users too much,
> > can you include the size of the vmlinux file before and after
> > this patch?
>
> before:
>     text           data     bss     dec     hex filename
> 14703736        8024602  444976 23173314        16198c2 ./omap-arm/vmlinux
>
> after:
>     text           data     bss     dec     hex filename
> 14727271        8029150  444528 23200949        16204b5 ./omap-arm/vmlinux
>
> diff: 27635 (dec)

Ok, that doesn't look too bad, though the total size is definitely worrying.
Please include the above in the changelog text.

       Arnd
