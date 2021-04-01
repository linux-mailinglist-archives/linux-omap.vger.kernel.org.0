Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E58A2351FC5
	for <lists+linux-omap@lfdr.de>; Thu,  1 Apr 2021 21:27:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234781AbhDAT1q (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 1 Apr 2021 15:27:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52494 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234428AbhDAT1k (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 1 Apr 2021 15:27:40 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C8BCAC03D205
        for <linux-omap@vger.kernel.org>; Thu,  1 Apr 2021 12:06:06 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id o10so4356385lfb.9
        for <linux-omap@vger.kernel.org>; Thu, 01 Apr 2021 12:06:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=DNNEGx7A8yGFZ03tYjwr9iyeGvfeQ20XIzLEait0s70=;
        b=QdVoyrhhfbDEFqnPYd9w4ehNfmf+FjnOe9vuh1ECpZjh4u8A2geVILkm+LOXR76MUv
         aDaWPbbdGQ8as9RLCzdBMzdKAeAQuy+QYSFlptzE/7GSNNVav3REeTmGSvCShaDkCPe1
         xaphaeO+zk4yx/WziudmaNHwePNXdkuDzaXK8ndzAgOm4C9AyxGC7TJ3lcyMlPjy4lnT
         9WXKXl2eOZO3IaTGztvDWDLj83XhhoZOacpxEmjDDmRitjLzaSvwyI4efC8kW5yeZY2t
         +1+33vm/80LAw8q18kME3zeGlQX1uVhaOSWWcPi3+R/0lVOt9fmMrWz31MzYH25uo9nj
         2O+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=DNNEGx7A8yGFZ03tYjwr9iyeGvfeQ20XIzLEait0s70=;
        b=jzO1TbUU9v+6ILd7JACoZDge+9nXDl5rinC75NbGGBxEtMhZrO61qidNDQu8ly4aJ/
         HdnkF8JxGDKx8XvhUmoEJOijdhLPsWTEyziPXd5ozLGtSqOuF/dJNDZpJsicMSHpJpE8
         i6tIxGxRok+0WedqVZAb7yTPTMzAJKTLHGV3lXXI7yQRFS9LQo2wFxDbuxFrg9HPL3CX
         f+1pSFegVgvPfGY+T+cpb9dY7/YtOKstnXkossD6iD31XWICfG7PtwrUq1ThuGSF/M2Z
         YqZGAAMwuk+c8QrCU1A3PjIA0DkK/s0rg21LBCtKkViPSzh0x0cX8U6eh95BPylPKI1v
         otIA==
X-Gm-Message-State: AOAM531S+HQBs0CJbLvPItCqDcR06EHwjguNjqCcLrmHPQxiT47W6+Fg
        FFRWr+CmHyDAWtbQHBk8OdusBopH7oLHxEPsMDw9NA==
X-Google-Smtp-Source: ABdhPJz5ZHtEXsDY5GLsqYFc5mT6sVAzavQNzfR0vjCD8kxtCmVEUswcjEz41xlCccQI7rIOFft+pHHoX7YVkqcyFTs=
X-Received: by 2002:ac2:538e:: with SMTP id g14mr6217538lfh.543.1617303965137;
 Thu, 01 Apr 2021 12:06:05 -0700 (PDT)
MIME-Version: 1.0
References: <20210401161127.8942-1-maciej.falkowski9@gmail.com>
In-Reply-To: <20210401161127.8942-1-maciej.falkowski9@gmail.com>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Thu, 1 Apr 2021 12:05:53 -0700
Message-ID: <CAKwvOdkCe1OkPetLzFTO+f-dp8=kD3OKX8mfEnw2GBRkU_cBnw@mail.gmail.com>
Subject: Re: [PATCH] ARM: OMAP: Fix use of possibly uninitialized irq variable
To:     Maciej Falkowski <maciej.falkowski9@gmail.com>
Cc:     khilman@kernel.org, aaro.koskinen@iki.fi, tony@atomide.com,
        Russell King <linux@armlinux.org.uk>,
        linux-omap@vger.kernel.org,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        LKML <linux-kernel@vger.kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Thu, Apr 1, 2021 at 9:12 AM Maciej Falkowski
<maciej.falkowski9@gmail.com> wrote:
>
> The current control flow of IRQ number assignment to `irq` variable
> allows a request of IRQ of unspecified value,
> generating a warning under Clang compilation with omap1_defconfig on linux-next:
>
> arch/arm/mach-omap1/pm.c:656:11: warning: variable 'irq' is used uninitialized whenever
> 'if' condition is false [-Wsometimes-uninitialized]
>         else if (cpu_is_omap16xx())
>                  ^~~~~~~~~~~~~~~~~
> ./arch/arm/mach-omap1/include/mach/soc.h:123:30: note: expanded from macro 'cpu_is_omap16xx'
>                                         ^~~~~~~~~~~~~
> arch/arm/mach-omap1/pm.c:658:18: note: uninitialized use occurs here
>         if (request_irq(irq, omap_wakeup_interrupt, 0, "peripheral wakeup",
>                         ^~~
> arch/arm/mach-omap1/pm.c:656:7: note: remove the 'if' if its condition is always true
>         else if (cpu_is_omap16xx())
>              ^~~~~~~~~~~~~~~~~~~~~~
> arch/arm/mach-omap1/pm.c:611:9: note: initialize the variable 'irq' to silence this warning
>         int irq;
>                ^
>                 = 0
> 1 warning generated.

Ooh, yeah if cpu_is_omap15xx() then irq is unused uninitialized; I
don't see any INT_1610_WAKE_UP_REQ-equlivalent for
INT_15XX_WAKE_UP_REQ.

Ok, LGTM.

Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

I agree with Nathan on the Fixes tag.

>
> The patch provides a default value to the `irq` variable
> along with a validity check.
>
> Signed-off-by: Maciej Falkowski <maciej.falkowski9@gmail.com>
> Link: https://github.com/ClangBuiltLinux/linux/issues/1324
> ---
>  arch/arm/mach-omap1/pm.c | 10 +++++++---
>  1 file changed, 7 insertions(+), 3 deletions(-)
>
> diff --git a/arch/arm/mach-omap1/pm.c b/arch/arm/mach-omap1/pm.c
> index 2c1e2b32b9b3..a745d64d4699 100644
> --- a/arch/arm/mach-omap1/pm.c
> +++ b/arch/arm/mach-omap1/pm.c
> @@ -655,9 +655,13 @@ static int __init omap_pm_init(void)
>                 irq = INT_7XX_WAKE_UP_REQ;
>         else if (cpu_is_omap16xx())
>                 irq = INT_1610_WAKE_UP_REQ;
> -       if (request_irq(irq, omap_wakeup_interrupt, 0, "peripheral wakeup",
> -                       NULL))
> -               pr_err("Failed to request irq %d (peripheral wakeup)\n", irq);
> +       else
> +               irq = -1;
> +
> +       if (irq >= 0) {
> +               if (request_irq(irq, omap_wakeup_interrupt, 0, "peripheral wakeup", NULL))
> +                       pr_err("Failed to request irq %d (peripheral wakeup)\n", irq);
> +       }
>
>         /* Program new power ramp-up time
>          * (0 for most boards since we don't lower voltage when in deep sleep)
> --
-- 
Thanks,
~Nick Desaulniers
