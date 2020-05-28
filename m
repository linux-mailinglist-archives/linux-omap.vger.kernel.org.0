Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AEAF61E62A3
	for <lists+linux-omap@lfdr.de>; Thu, 28 May 2020 15:46:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390518AbgE1Nq1 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 28 May 2020 09:46:27 -0400
Received: from muru.com ([72.249.23.125]:55990 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2390486AbgE1NqZ (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 28 May 2020 09:46:25 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 72A0680BF;
        Thu, 28 May 2020 13:47:14 +0000 (UTC)
Date:   Thu, 28 May 2020 06:46:21 -0700
From:   Tony Lindgren <tony@atomide.com>
To:     Arnd Bergmann <arnd@arndb.de>
Cc:     arm@kernel.org, Rob Herring <robh@kernel.org>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Lokesh Vutla <lokeshvutla@ti.com>, Keerthy <j-keerthy@ti.com>,
        Santosh Shilimkar <santosh.shilimkar@oracle.com>,
        linux-kernel@vger.kernel.org, Tero Kristo <t-kristo@ti.com>,
        Olof Johansson <olof@lixom.net>, linux-omap@vger.kernel.org,
        afzal mohammed <afzal.mohd.ma@gmail.com>,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] ARM: omap2: drop broken broadcast timer hack
Message-ID: <20200528134621.GN37466@atomide.com>
References: <20200528091923.2951100-1-arnd@arndb.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200528091923.2951100-1-arnd@arndb.de>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Arnd Bergmann <arnd@arndb.de> [200528 09:20]:
> The OMAP4 timer code had a special hack for using the broadcast timer
> without SMP. Since the dmtimer is now gone, this also needs to be dropped
> to avoid a link failure for non-SMP AM43xx configurations:
> 
> kernel/time/tick-broadcast.o: in function `tick_device_uses_broadcast':
> tick-broadcast.c:(.text+0x130): undefined reference to `tick_broadcast'

Hmm this sounds like a regression though. Isn't this needed for using
the ARM local timers on non-SMP SoC, so a separate timer from dmtimer?

I've probably removed something accidentally to cause this.

Regards,

Tony


> Fixes: 2ee04b88547a ("ARM: OMAP2+: Drop old timer code for dmtimer and 32k counter")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  arch/arm/mach-omap2/Kconfig | 1 -
>  arch/arm/mach-omap2/timer.c | 6 ------
>  2 files changed, 7 deletions(-)
> 
> diff --git a/arch/arm/mach-omap2/Kconfig b/arch/arm/mach-omap2/Kconfig
> index ca74473f01df..ec4450a5c296 100644
> --- a/arch/arm/mach-omap2/Kconfig
> +++ b/arch/arm/mach-omap2/Kconfig
> @@ -67,7 +67,6 @@ config SOC_AM43XX
>  	select ARM_GIC
>  	select MACH_OMAP_GENERIC
>  	select HAVE_ARM_SCU
> -	select GENERIC_CLOCKEVENTS_BROADCAST
>  	select HAVE_ARM_TWD
>  	select ARM_ERRATA_754322
>  	select ARM_ERRATA_775420
> diff --git a/arch/arm/mach-omap2/timer.c b/arch/arm/mach-omap2/timer.c
> index 2d4ea386fc38..786336ee27ef 100644
> --- a/arch/arm/mach-omap2/timer.c
> +++ b/arch/arm/mach-omap2/timer.c
> @@ -46,12 +46,6 @@ void set_cntfreq(void)
>  	omap_smc1(OMAP5_DRA7_MON_SET_CNTFRQ_INDEX, arch_timer_freq);
>  }
>  
> -#if !defined(CONFIG_SMP) && defined(CONFIG_GENERIC_CLOCKEVENTS_BROADCAST)
> -void tick_broadcast(const struct cpumask *mask)
> -{
> -}
> -#endif
> -
>  #if defined(CONFIG_SOC_OMAP5) || defined(CONFIG_SOC_DRA7XX)
>  
>  /*
> -- 
> 2.26.2
> 
> 
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
