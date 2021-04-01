Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7116F351BB9
	for <lists+linux-omap@lfdr.de>; Thu,  1 Apr 2021 20:11:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234687AbhDASKx (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 1 Apr 2021 14:10:53 -0400
Received: from mail.kernel.org ([198.145.29.99]:37008 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236815AbhDASDB (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 1 Apr 2021 14:03:01 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id B51106138C;
        Thu,  1 Apr 2021 16:45:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1617295557;
        bh=Yxoz1j6ATayqg96dpqFVU3VxNbkZPibfD69hfuZBg5Y=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Gk4Z48zC8YjsQvsFU5hsAYR1LFloXLmKpobB250U0XDVJ4p6FVPGtfyKMuJr3vr0S
         FF5nQesHVoiHpDuN03cve2GgeBCI+Sz6/tplX8WGoKuL6QtbkulB6D0IbfHITcyXoY
         EAm+vxThPoZEggCXhmHcN29ZAdHilhp35Sstrxf7sDDM0ZeiGiZxMjsz9R+A3/P14c
         wrYv6+R3lpNtiTAfUUnB+FVzGSL8mxMSzkdJDhE7GJZLiSfCT6mfwSAiNRUKN1IYoa
         kezUrwj2Gv7iMnIdvo0/k5yRymuTCRzzyQljHCXFC5KVjziTkqE5urRyR9M0SoznvD
         menWB9cZhHv4Q==
Date:   Thu, 1 Apr 2021 09:45:52 -0700
From:   Nathan Chancellor <nathan@kernel.org>
To:     Maciej Falkowski <maciej.falkowski9@gmail.com>
Cc:     khilman@kernel.org, aaro.koskinen@iki.fi, tony@atomide.com,
        linux@armlinux.org.uk, linux-omap@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        clang-built-linux@googlegroups.com
Subject: Re: [PATCH] ARM: OMAP: Fix use of possibly uninitialized irq variable
Message-ID: <20210401164552.n4nuwvqz5mofdblg@archlinux-ax161>
References: <20210401161127.8942-1-maciej.falkowski9@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210401161127.8942-1-maciej.falkowski9@gmail.com>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Thu, Apr 01, 2021 at 06:11:27PM +0200, Maciej Falkowski wrote:
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
> 
> The patch provides a default value to the `irq` variable
> along with a validity check.
> 

Might be worth a fixes tag:

Fixes: b75ca5217743 ("ARM: OMAP: replace setup_irq() by request_irq()")

> Signed-off-by: Maciej Falkowski <maciej.falkowski9@gmail.com>
> Link: https://github.com/ClangBuiltLinux/linux/issues/1324

Reviewed-by: Nathan Chancellor <nathan@kernel.org>

> ---
>  arch/arm/mach-omap1/pm.c | 10 +++++++---
>  1 file changed, 7 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/arm/mach-omap1/pm.c b/arch/arm/mach-omap1/pm.c
> index 2c1e2b32b9b3..a745d64d4699 100644
> --- a/arch/arm/mach-omap1/pm.c
> +++ b/arch/arm/mach-omap1/pm.c
> @@ -655,9 +655,13 @@ static int __init omap_pm_init(void)
>  		irq = INT_7XX_WAKE_UP_REQ;
>  	else if (cpu_is_omap16xx())
>  		irq = INT_1610_WAKE_UP_REQ;
> -	if (request_irq(irq, omap_wakeup_interrupt, 0, "peripheral wakeup",
> -			NULL))
> -		pr_err("Failed to request irq %d (peripheral wakeup)\n", irq);
> +	else
> +		irq = -1;
> +
> +	if (irq >= 0) {
> +		if (request_irq(irq, omap_wakeup_interrupt, 0, "peripheral wakeup", NULL))
> +			pr_err("Failed to request irq %d (peripheral wakeup)\n", irq);
> +	}
>  
>  	/* Program new power ramp-up time
>  	 * (0 for most boards since we don't lower voltage when in deep sleep)
> -- 
> 2.26.3
> 
