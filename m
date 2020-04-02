Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7962719C45A
	for <lists+linux-omap@lfdr.de>; Thu,  2 Apr 2020 16:36:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727734AbgDBOgV (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 2 Apr 2020 10:36:21 -0400
Received: from mail.kernel.org ([198.145.29.99]:52850 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727412AbgDBOgV (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 2 Apr 2020 10:36:21 -0400
Received: from mail-il1-f181.google.com (mail-il1-f181.google.com [209.85.166.181])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id CA3652074D;
        Thu,  2 Apr 2020 14:36:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1585838179;
        bh=hgqNTt2kKMNGHqP+Km3jz9TvPzM2T4GaVOuSBURhUvs=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=Xea48Y7rVx7bKJXai1/rCZV02PKwdZb4NtyEvbGgM3eK43U6ZAC4N4R5Dzhu/tpgZ
         Ix/acFtoFs6RiiUvxog1xUiHsMKNCC4kJfqpbdKlGwGBb87JV6h20pa2q195oUMJoZ
         hsriSvjosxbqeD+R/0eO72SAMOgSI4V4mocJgaho=
Received: by mail-il1-f181.google.com with SMTP id n13so3803217ilm.5;
        Thu, 02 Apr 2020 07:36:19 -0700 (PDT)
X-Gm-Message-State: AGi0PuYVkkH4P4W2Q6zs9x0Up8lvfPxYccKUSFz5txRfncp/smthyakU
        G3So/1RCSCnr4vSlQKX8gBMgRXt3mF3mR1uEY9Q=
X-Google-Smtp-Source: APiQypK/ccv9NRSETRVTWozAv5jSrWGxRlqM/ygFo4EjfN+UAGVGv17+NG3gieCqXQN2oci7WqN0P+0T4tCB/gk2P3w=
X-Received: by 2002:a92:dcd1:: with SMTP id b17mr3620113ilr.80.1585838179188;
 Thu, 02 Apr 2020 07:36:19 -0700 (PDT)
MIME-Version: 1.0
References: <5a6807f19fd69f2de6622c794639cc5d70b9563a.1585513949.git.stefan@agner.ch>
 <CAKwvOdkyOW6RXTOCt1xMp2H+uH28ofByQOjyx776t8RDxTED2w@mail.gmail.com>
 <CAMj1kXGYiMobkue642iDRdOjEHQK=KXpp=Urrgik9UU-eWWibQ@mail.gmail.com>
 <DBBPR08MB4823129E272220712B470716F8C60@DBBPR08MB4823.eurprd08.prod.outlook.com>
 <CAMj1kXEQ4v9e6386ogPdy+s+++9H02DMPnDpTq0WSY2e78ts+Q@mail.gmail.com> <e0c125ea492670c7069c407b6b0c5958@agner.ch>
In-Reply-To: <e0c125ea492670c7069c407b6b0c5958@agner.ch>
From:   Ard Biesheuvel <ardb@kernel.org>
Date:   Thu, 2 Apr 2020 16:36:08 +0200
X-Gmail-Original-Message-ID: <CAMj1kXEe835GbXU5qgX-QQ5n4SmwQO1nAoAZw5pUVCbR=J8XmQ@mail.gmail.com>
Message-ID: <CAMj1kXEe835GbXU5qgX-QQ5n4SmwQO1nAoAZw5pUVCbR=J8XmQ@mail.gmail.com>
Subject: Re: [PATCH] ARM: OMAP2+: drop unnecessary adrl
To:     Stefan Agner <stefan@agner.ch>
Cc:     linux-omap@vger.kernel.org, Tony Lindgren <tony@atomide.com>,
        Nick Desaulniers <ndesaulniers@google.com>,
        LKML <linux-kernel@vger.kernel.org>,
        Peter Smith <Peter.Smith@arm.com>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        Russell King <linux@armlinux.org.uk>, nd <nd@arm.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Thu, 2 Apr 2020 at 16:34, Stefan Agner <stefan@agner.ch> wrote:
>
> On 2020-04-02 14:05, Ard Biesheuvel wrote:
> > On Thu, 2 Apr 2020 at 13:50, Peter Smith <Peter.Smith@arm.com> wrote:
> >>
> >> > I take it this implies that the LLVM linker does not support the
> >> > R_ARM_ALU_PC_Gn relocations? Since otherwise, adrl could simply be
> >> > expanded to a pair of adds with the appropriate relocations, letting
> >> > the linker fix up the immediates (and the ADD vs SUB bits)
> >>
> >> Not at the moment. I have a patch in review to add the G0 variants for=
 these in Arm state at reviews.llvm.org/D75349 . As far as I know LLVM MC d=
oes not have support for generating the relocations either. This could be a=
dded though. I agree that using the G* relocations with a pair of add/sub i=
nstructions would be the ideal solution. The adrl psuedo is essentially tha=
t but implemented at assembly time. I think it would be possible to impleme=
nt in LLVM but at the time (4+ years ago) I wasn't confident in finding som=
eone that would think that adrl support was worth the disruption, for examp=
le the current Arm assembly backend can only produce 1 instruction as outpu=
t and adrl requires two.
> >>
> >> I'd be happy to look at group relocation support in LLD, I haven't got=
 a lot of spare time so progress is likely to be slow though.
> >>
> >
> > For Linux, I have proposed another approach in the past, which is to
> > define a (Linux-local) adr_l macro with unlimited range [0], which
> > basically comes down to place relative movw/movt pairs for v7+, and
> > something along the lines of
> >
> >         ldr <reg>, 222f
> > 111:    add <reg>, <reg>, pc
> >         .subsection 1
> > 222:    .long <sym> - (111b + 8)
> >         .previous
>
> Just to confirm: The instance at hand today seems to be working fine
> without adrl, so I guess we are fine here, do you agree?
>

I agree. Apologies for hijacking the thread :-)

> There are a couple more instances of adrl in arch/arm/crypto/, maybe
> that is where the adr_l macro could come in.
>

There are various places in the arch code that could be cleaned up
along these lines.

But you're right - this is a separate discussion that deserves a
thread of its own. I was just satisfying my own curiosity.
