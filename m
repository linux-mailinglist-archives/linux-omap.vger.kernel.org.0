Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B3EB919B505
	for <lists+linux-omap@lfdr.de>; Wed,  1 Apr 2020 20:02:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732262AbgDASCQ (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 1 Apr 2020 14:02:16 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:43463 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732285AbgDASCQ (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 1 Apr 2020 14:02:16 -0400
Received: by mail-pf1-f195.google.com with SMTP id f206so343564pfa.10
        for <linux-omap@vger.kernel.org>; Wed, 01 Apr 2020 11:02:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=nN3zsE+FK4cNT3gjBDZd4jgl2nFuBzMDukGWMo8ib/8=;
        b=GsmNqDfWVuI94Oouw5oRi/M8iAEHPfTyZl24/WcIsq+OX4gRmtf3p5E8jXOLhCQ4TV
         oQHOknDYzNgrtOTvOLkhmI5KQYwXGOlXugZ7Az/dfPT0w94IQpJSB1g7aPLA4fQ0ki7a
         vWyLIBQOiPMk+cGIFgLjcxu08/VVqH5PPTyHs8Y1RqOwg7XPnMFRVRBorTILaaFBk5Dg
         oYAFQoOsNWZYGRfdDUqC8VcyROFgelXyRnCDQH4Yw3Q/zw81xHzn2XO8T+NjwsrLUzjt
         +Q3etXSA1TCXn0XRKh6TMMW5DMaJNavmVgjbMVbMNioNZEbMInlu9jOGoJmNRRPfc16h
         mgtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=nN3zsE+FK4cNT3gjBDZd4jgl2nFuBzMDukGWMo8ib/8=;
        b=rsetxr4g/TQMaYkqxwbuENpE0ZnSaG0cjapsYj+CkTtg4yr9hyj5dckdht99+hT/Ps
         hw82OMbLbeNi5MzKYnMsEowM9C1jdYoWbtl2NEHliWYbQqlIjJHZxeHZBi+MRHB1Oqog
         R1DbQmP6XU2kA+aNpj91RoadoGg2PQgjGpQ2B5xCOHCvVFyih49kA9LKtHlpjEsoCvFy
         f2JNK+pAGBffQNdWK0Y+qwPprf3HM4zBKJYCCrNfJ/zFpR7nmPbTtM1N5tx2ySBsauVK
         WjpdXqah8TOescI1HGKTDO0hfTcqnsG+EXU00g6cKt7+gHZJW9EfP+HXDtSLXqbSX0Kj
         CnXg==
X-Gm-Message-State: ANhLgQ3fDsCkXsBrd3NLZijRQ8jiKvLk4vh9Xn70E0ASp/TTlVzeTuDN
        IzuIw7a7VmnyFghQ8qA4gE/vXAtDwmwJNg2Kp+M7J5TM838=
X-Google-Smtp-Source: ADFU+vu46Uqfs6o6Px6mzmc9zh4c7v6h2s+5k/Y7IBrPgJB3jMFrWnCsH4/l3yf3W7Jxb0rN86SwRgc3KzwC01F6MbE=
X-Received: by 2002:a05:6a00:42:: with SMTP id i2mr24113583pfk.108.1585764134729;
 Wed, 01 Apr 2020 11:02:14 -0700 (PDT)
MIME-Version: 1.0
References: <5a6807f19fd69f2de6622c794639cc5d70b9563a.1585513949.git.stefan@agner.ch>
In-Reply-To: <5a6807f19fd69f2de6622c794639cc5d70b9563a.1585513949.git.stefan@agner.ch>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Wed, 1 Apr 2020 11:02:03 -0700
Message-ID: <CAKwvOdkyOW6RXTOCt1xMp2H+uH28ofByQOjyx776t8RDxTED2w@mail.gmail.com>
Subject: Re: [PATCH] ARM: OMAP2+: drop unnecessary adrl
To:     Stefan Agner <stefan@agner.ch>
Cc:     tony@atomide.com, Russell King <linux@armlinux.org.uk>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-omap@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Sun, Mar 29, 2020 at 1:33 PM Stefan Agner <stefan@agner.ch> wrote:
>
> The adrl instruction has been introduced with commit dd31394779aa ("ARM:
> omap3: Thumb-2 compatibility for sleep34xx.S"), back when this assembly
> file was considerably longer. Today adr seems to have enough reach, even
> when inserting about 60 instructions between the use site and the label.
> Replace adrl with conventional adr instruction.
>
> This allows to build this file using Clang's integrated assembler (which
> does not support the adrl pseudo instruction).

Context: https://github.com/ClangBuiltLinux/linux/issues/430#issuecomment-476124724
If Peter says it's difficult to implement, I trust him.
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

>
> Link: https://github.com/ClangBuiltLinux/linux/issues/430
> Signed-off-by: Stefan Agner <stefan@agner.ch>
> ---
>  arch/arm/mach-omap2/sleep34xx.S | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/arm/mach-omap2/sleep34xx.S b/arch/arm/mach-omap2/sleep34xx.S
> index ac1324c6453b..c4e97d35c310 100644
> --- a/arch/arm/mach-omap2/sleep34xx.S
> +++ b/arch/arm/mach-omap2/sleep34xx.S
> @@ -72,7 +72,7 @@ ENTRY(enable_omap3630_toggle_l2_on_restore)
>         stmfd   sp!, {lr}       @ save registers on stack
>         /* Setup so that we will disable and enable l2 */
>         mov     r1, #0x1
> -       adrl    r3, l2dis_3630_offset   @ may be too distant for plain adr
> +       adr     r3, l2dis_3630_offset
>         ldr     r2, [r3]                @ value for offset
>         str     r1, [r2, r3]            @ write to l2dis_3630
>         ldmfd   sp!, {pc}       @ restore regs and return
> --
> 2.25.1
>
> --
> You received this message because you are subscribed to the Google Groups "Clang Built Linux" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to clang-built-linux+unsubscribe@googlegroups.com.
> To view this discussion on the web visit https://groups.google.com/d/msgid/clang-built-linux/5a6807f19fd69f2de6622c794639cc5d70b9563a.1585513949.git.stefan%40agner.ch.



-- 
Thanks,
~Nick Desaulniers
