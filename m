Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9959F19BEE3
	for <lists+linux-omap@lfdr.de>; Thu,  2 Apr 2020 11:48:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387936AbgDBJsc (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 2 Apr 2020 05:48:32 -0400
Received: from mail.kernel.org ([198.145.29.99]:43352 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725965AbgDBJsc (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 2 Apr 2020 05:48:32 -0400
Received: from mail-il1-f180.google.com (mail-il1-f180.google.com [209.85.166.180])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id E31E3207FF;
        Thu,  2 Apr 2020 09:48:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1585820911;
        bh=LjNvstn7WlZUpPaykGFD8SBtsMecvpPvGupUUAYJrrM=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=U48gLdrdRHDAQDtmItYnayj4DF5XGggSR3UlcQYq+K2ARBvsbECQAShfYujMgAXS4
         9jK2X9uHOcCpMmMGoQQSnohvzADtlUw/9e+VSxM6ws5ttiiOqD84n9TVHWALbPCZQu
         fo+GsR+bKV65Z0qA6OaoBwpIRGB47+2wQ2ubfqXY=
Received: by mail-il1-f180.google.com with SMTP id x16so2933208ilp.12;
        Thu, 02 Apr 2020 02:48:30 -0700 (PDT)
X-Gm-Message-State: AGi0PubmwyHfE9cDXRMgQX7pAtbyyx5+w7611M1LGqpt2K/JOOdwIH/t
        9numCzfhYL9LCfWIl0VHvx2u/rMBABg+ilKEQQc=
X-Google-Smtp-Source: APiQypJNNgC/IdNZmahWaYdw0GsLnMorCfjyPAMbhlDCQBxR/IfV4gBIePsSRqqn5LpF5w8gtQOa4ExhZakQ86S0rNY=
X-Received: by 2002:a05:6e02:551:: with SMTP id i17mr2167800ils.218.1585820910280;
 Thu, 02 Apr 2020 02:48:30 -0700 (PDT)
MIME-Version: 1.0
References: <5a6807f19fd69f2de6622c794639cc5d70b9563a.1585513949.git.stefan@agner.ch>
 <CAKwvOdkyOW6RXTOCt1xMp2H+uH28ofByQOjyx776t8RDxTED2w@mail.gmail.com>
In-Reply-To: <CAKwvOdkyOW6RXTOCt1xMp2H+uH28ofByQOjyx776t8RDxTED2w@mail.gmail.com>
From:   Ard Biesheuvel <ardb@kernel.org>
Date:   Thu, 2 Apr 2020 11:48:19 +0200
X-Gmail-Original-Message-ID: <CAMj1kXGYiMobkue642iDRdOjEHQK=KXpp=Urrgik9UU-eWWibQ@mail.gmail.com>
Message-ID: <CAMj1kXGYiMobkue642iDRdOjEHQK=KXpp=Urrgik9UU-eWWibQ@mail.gmail.com>
Subject: Re: [PATCH] ARM: OMAP2+: drop unnecessary adrl
To:     Nick Desaulniers <ndesaulniers@google.com>, Peter.Smith@arm.com
Cc:     Stefan Agner <stefan@agner.ch>, Tony Lindgren <tony@atomide.com>,
        Russell King <linux@armlinux.org.uk>,
        LKML <linux-kernel@vger.kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        linux-omap@vger.kernel.org,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Wed, 1 Apr 2020 at 20:02, Nick Desaulniers <ndesaulniers@google.com> wrote:
>
> On Sun, Mar 29, 2020 at 1:33 PM Stefan Agner <stefan@agner.ch> wrote:
> >
> > The adrl instruction has been introduced with commit dd31394779aa ("ARM:
> > omap3: Thumb-2 compatibility for sleep34xx.S"), back when this assembly
> > file was considerably longer. Today adr seems to have enough reach, even
> > when inserting about 60 instructions between the use site and the label.
> > Replace adrl with conventional adr instruction.
> >
> > This allows to build this file using Clang's integrated assembler (which
> > does not support the adrl pseudo instruction).
>
> Context: https://github.com/ClangBuiltLinux/linux/issues/430#issuecomment-476124724
> If Peter says it's difficult to implement, I trust him.
> Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>
>

I take it this implies that the LLVM linker does not support the
R_ARM_ALU_PC_Gn relocations? Since otherwise, adrl could simply be
expanded to a pair of adds with the appropriate relocations, letting
the linker fix up the immediates (and the ADD vs SUB bits)


> >
> > Link: https://github.com/ClangBuiltLinux/linux/issues/430
> > Signed-off-by: Stefan Agner <stefan@agner.ch>
> > ---
> >  arch/arm/mach-omap2/sleep34xx.S | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/arch/arm/mach-omap2/sleep34xx.S b/arch/arm/mach-omap2/sleep34xx.S
> > index ac1324c6453b..c4e97d35c310 100644
> > --- a/arch/arm/mach-omap2/sleep34xx.S
> > +++ b/arch/arm/mach-omap2/sleep34xx.S
> > @@ -72,7 +72,7 @@ ENTRY(enable_omap3630_toggle_l2_on_restore)
> >         stmfd   sp!, {lr}       @ save registers on stack
> >         /* Setup so that we will disable and enable l2 */
> >         mov     r1, #0x1
> > -       adrl    r3, l2dis_3630_offset   @ may be too distant for plain adr
> > +       adr     r3, l2dis_3630_offset
> >         ldr     r2, [r3]                @ value for offset
> >         str     r1, [r2, r3]            @ write to l2dis_3630
> >         ldmfd   sp!, {pc}       @ restore regs and return
> > --
> > 2.25.1
> >
> > --
> > You received this message because you are subscribed to the Google Groups "Clang Built Linux" group.
> > To unsubscribe from this group and stop receiving emails from it, send an email to clang-built-linux+unsubscribe@googlegroups.com.
> > To view this discussion on the web visit https://groups.google.com/d/msgid/clang-built-linux/5a6807f19fd69f2de6622c794639cc5d70b9563a.1585513949.git.stefan%40agner.ch.
>
>
>
> --
> Thanks,
> ~Nick Desaulniers
>
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
