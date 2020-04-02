Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D79D219C0A9
	for <lists+linux-omap@lfdr.de>; Thu,  2 Apr 2020 14:05:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388185AbgDBMFW (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 2 Apr 2020 08:05:22 -0400
Received: from mail.kernel.org ([198.145.29.99]:37692 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2388089AbgDBMFW (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 2 Apr 2020 08:05:22 -0400
Received: from mail-io1-f46.google.com (mail-io1-f46.google.com [209.85.166.46])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id CC80A2078B;
        Thu,  2 Apr 2020 12:05:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1585829121;
        bh=DOCQ79khuQuDX0scByQjV/Dc+mOTV7PRi2d4y/PFuMw=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=iD87RcG6nBHeTUMhqFAjd+RBG0FGs4BeQ4ux6X6bhnYF6VnOep4M1fGpvbTOhrfQI
         ebNclHF2SR1Ut2knX/Xv0Vgk8ZTvOB5ZDD0EaRIsU7djv1MJpx02Q/L5kbQXEQVxSA
         xD+yUGtzFfRae/rBsiwinYeO9P6kFZGsZMpdMzhM=
Received: by mail-io1-f46.google.com with SMTP id r25so3243683ioc.11;
        Thu, 02 Apr 2020 05:05:21 -0700 (PDT)
X-Gm-Message-State: AGi0PuZ4qwx7cKCOWtQBXJJ3BjULFp4eG46jSh078ohBOMiF2ajVWuJS
        08x+bwiYwtbkTi8cMG+rY20NJqpqhFvxA6/O5uQ=
X-Google-Smtp-Source: APiQypKiGRMVC/rZ/zmEQRLEdmyG/DKSK9Po+czO2H2U6ZtZ+m0OEYQCKxKanhryjTbOQCpeiqefVGI+Qu4nXgiL3E4=
X-Received: by 2002:a6b:f413:: with SMTP id i19mr2424610iog.203.1585829121163;
 Thu, 02 Apr 2020 05:05:21 -0700 (PDT)
MIME-Version: 1.0
References: <5a6807f19fd69f2de6622c794639cc5d70b9563a.1585513949.git.stefan@agner.ch>
 <CAKwvOdkyOW6RXTOCt1xMp2H+uH28ofByQOjyx776t8RDxTED2w@mail.gmail.com>
 <CAMj1kXGYiMobkue642iDRdOjEHQK=KXpp=Urrgik9UU-eWWibQ@mail.gmail.com> <DBBPR08MB4823129E272220712B470716F8C60@DBBPR08MB4823.eurprd08.prod.outlook.com>
In-Reply-To: <DBBPR08MB4823129E272220712B470716F8C60@DBBPR08MB4823.eurprd08.prod.outlook.com>
From:   Ard Biesheuvel <ardb@kernel.org>
Date:   Thu, 2 Apr 2020 14:05:10 +0200
X-Gmail-Original-Message-ID: <CAMj1kXEQ4v9e6386ogPdy+s+++9H02DMPnDpTq0WSY2e78ts+Q@mail.gmail.com>
Message-ID: <CAMj1kXEQ4v9e6386ogPdy+s+++9H02DMPnDpTq0WSY2e78ts+Q@mail.gmail.com>
Subject: Re: [PATCH] ARM: OMAP2+: drop unnecessary adrl
To:     Peter Smith <Peter.Smith@arm.com>
Cc:     Nick Desaulniers <ndesaulniers@google.com>, nd <nd@arm.com>,
        Tony Lindgren <tony@atomide.com>,
        Russell King <linux@armlinux.org.uk>,
        Stefan Agner <stefan@agner.ch>,
        LKML <linux-kernel@vger.kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Thu, 2 Apr 2020 at 13:50, Peter Smith <Peter.Smith@arm.com> wrote:
>
> > I take it this implies that the LLVM linker does not support the
> > R_ARM_ALU_PC_Gn relocations? Since otherwise, adrl could simply be
> > expanded to a pair of adds with the appropriate relocations, letting
> > the linker fix up the immediates (and the ADD vs SUB bits)
>
> Not at the moment. I have a patch in review to add the G0 variants for th=
ese in Arm state at reviews.llvm.org/D75349 . As far as I know LLVM MC does=
 not have support for generating the relocations either. This could be adde=
d though. I agree that using the G* relocations with a pair of add/sub inst=
ructions would be the ideal solution. The adrl psuedo is essentially that b=
ut implemented at assembly time. I think it would be possible to implement =
in LLVM but at the time (4+ years ago) I wasn't confident in finding someon=
e that would think that adrl support was worth the disruption, for example =
the current Arm assembly backend can only produce 1 instruction as output a=
nd adrl requires two.
>
> I'd be happy to look at group relocation support in LLD, I haven't got a =
lot of spare time so progress is likely to be slow though.
>

For Linux, I have proposed another approach in the past, which is to
define a (Linux-local) adr_l macro with unlimited range [0], which
basically comes down to place relative movw/movt pairs for v7+, and
something along the lines of

        ldr <reg>, 222f
111:    add <reg>, <reg>, pc
        .subsection 1
222:    .long <sym> - (111b + 8)
        .previous

for v6 and earlier. Could you comment on whether Clang's integrated
assembler could support anything like this?


Thanks,
Ard.



[0] https://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git/commit/?=
h=3Darm-kaslr-latest&id=3Dfd440f1131553a5201ce3b94905419bd067b93b3
