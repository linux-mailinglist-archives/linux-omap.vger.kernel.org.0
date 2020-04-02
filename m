Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9CFF619C44D
	for <lists+linux-omap@lfdr.de>; Thu,  2 Apr 2020 16:34:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727734AbgDBOeI (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 2 Apr 2020 10:34:08 -0400
Received: from mail.kmu-office.ch ([178.209.48.109]:55018 "EHLO
        mail.kmu-office.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727412AbgDBOeI (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 2 Apr 2020 10:34:08 -0400
Received: from webmail.kmu-office.ch (unknown [IPv6:2a02:418:6a02::a3])
        by mail.kmu-office.ch (Postfix) with ESMTPSA id 5F61E5C0842;
        Thu,  2 Apr 2020 16:34:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agner.ch; s=dkim;
        t=1585838046;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=5W45807pAC71hL/yM35fhSQ/isq694lE2RzwHUJCouo=;
        b=riWQSs+JQkSV8IuBCO9KPrGlqTYOSdBueR5JGiomta+BiJAA1yR2rlaDzMnnBUBAKyKcwc
        ecymobVuYoGIuLSezN0Fh0wC4qUc6fhIKdfTZ7A5ab2PtJ3xiVbj9gMRs/bHtrGxa8zb9U
        n2+KbHaDRoT3dsDZ6U0lArnalIXP3SI=
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Date:   Thu, 02 Apr 2020 16:34:06 +0200
From:   Stefan Agner <stefan@agner.ch>
To:     Ard Biesheuvel <ardb@kernel.org>
Cc:     Peter Smith <Peter.Smith@arm.com>,
        Nick Desaulniers <ndesaulniers@google.com>, nd <nd@arm.com>,
        Tony Lindgren <tony@atomide.com>,
        Russell King <linux@armlinux.org.uk>,
        LKML <linux-kernel@vger.kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        linux-omap@vger.kernel.org,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH] ARM: OMAP2+: drop unnecessary adrl
In-Reply-To: <CAMj1kXEQ4v9e6386ogPdy+s+++9H02DMPnDpTq0WSY2e78ts+Q@mail.gmail.com>
References: <5a6807f19fd69f2de6622c794639cc5d70b9563a.1585513949.git.stefan@agner.ch>
 <CAKwvOdkyOW6RXTOCt1xMp2H+uH28ofByQOjyx776t8RDxTED2w@mail.gmail.com>
 <CAMj1kXGYiMobkue642iDRdOjEHQK=KXpp=Urrgik9UU-eWWibQ@mail.gmail.com>
 <DBBPR08MB4823129E272220712B470716F8C60@DBBPR08MB4823.eurprd08.prod.outlook.com>
 <CAMj1kXEQ4v9e6386ogPdy+s+++9H02DMPnDpTq0WSY2e78ts+Q@mail.gmail.com>
User-Agent: Roundcube Webmail/1.4.1
Message-ID: <e0c125ea492670c7069c407b6b0c5958@agner.ch>
X-Sender: stefan@agner.ch
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 2020-04-02 14:05, Ard Biesheuvel wrote:
> On Thu, 2 Apr 2020 at 13:50, Peter Smith <Peter.Smith@arm.com> wrote:
>>
>> > I take it this implies that the LLVM linker does not support the
>> > R_ARM_ALU_PC_Gn relocations? Since otherwise, adrl could simply be
>> > expanded to a pair of adds with the appropriate relocations, letting
>> > the linker fix up the immediates (and the ADD vs SUB bits)
>>
>> Not at the moment. I have a patch in review to add the G0 variants for these in Arm state at reviews.llvm.org/D75349 . As far as I know LLVM MC does not have support for generating the relocations either. This could be added though. I agree that using the G* relocations with a pair of add/sub instructions would be the ideal solution. The adrl psuedo is essentially that but implemented at assembly time. I think it would be possible to implement in LLVM but at the time (4+ years ago) I wasn't confident in finding someone that would think that adrl support was worth the disruption, for example the current Arm assembly backend can only produce 1 instruction as output and adrl requires two.
>>
>> I'd be happy to look at group relocation support in LLD, I haven't got a lot of spare time so progress is likely to be slow though.
>>
> 
> For Linux, I have proposed another approach in the past, which is to
> define a (Linux-local) adr_l macro with unlimited range [0], which
> basically comes down to place relative movw/movt pairs for v7+, and
> something along the lines of
> 
>         ldr <reg>, 222f
> 111:    add <reg>, <reg>, pc
>         .subsection 1
> 222:    .long <sym> - (111b + 8)
>         .previous

Just to confirm: The instance at hand today seems to be working fine
without adrl, so I guess we are fine here, do you agree?

There are a couple more instances of adrl in arch/arm/crypto/, maybe
that is where the adr_l macro could come in.

--
Stefan

> 
> for v6 and earlier. Could you comment on whether Clang's integrated
> assembler could support anything like this?
> 
> 
> Thanks,
> Ard.
> 
> 
> 
> [0] https://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git/commit/?h=arm-kaslr-latest&id=fd440f1131553a5201ce3b94905419bd067b93b3
