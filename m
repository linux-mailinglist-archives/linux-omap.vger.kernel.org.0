Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C96F841D5B2
	for <lists+linux-omap@lfdr.de>; Thu, 30 Sep 2021 10:49:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348827AbhI3Iv3 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 30 Sep 2021 04:51:29 -0400
Received: from muru.com ([72.249.23.125]:39120 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1348818AbhI3Iv3 (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 30 Sep 2021 04:51:29 -0400
Received: from localhost (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id ED3A38050;
        Thu, 30 Sep 2021 08:50:15 +0000 (UTC)
Date:   Thu, 30 Sep 2021 11:49:45 +0300
From:   Tony Lindgren <tony@atomide.com>
To:     Kees Cook <keescook@chromium.org>
Cc:     kernel test robot <lkp@intel.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Keerthy <j-keerthy@ti.com>,
        Sebastian Reichel <sebastian.reichel@collabora.co.uk>,
        Ladislav Michl <ladis@linux-mips.org>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        linux-omap@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
        linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: Re: [PATCH] clocksource/drivers/timer-ti-dm: Select TIMER_OF
Message-ID: <YVV6KZ7TYhvABjIz@atomide.com>
References: <20210828175747.3777891-1-keescook@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210828175747.3777891-1-keescook@chromium.org>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Kees Cook <keescook@chromium.org> [210828 17:58]:
> When building OMAP_DM_TIMER without TIMER_OF, there are orphan sections
> due to the use of TIMER_OF_DELCARE() without CONFIG_TIMER_OF. Select
> CONFIG_TIMER_OF when enaling OMAP_DM_TIMER:
> 
> arm-linux-gnueabi-ld: warning: orphan section `__timer_of_table' from `drivers/clocksource/timer-ti-dm-systimer.o' being placed in section `__timer_of_table'
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Link: https://lore.kernel.org/lkml/202108282255.tkdt4ani-lkp@intel.com/
> Cc: Tony Lindgren <tony@atomide.com>
> Cc: Daniel Lezcano <daniel.lezcano@linaro.org>
> Cc: Keerthy <j-keerthy@ti.com>
> Cc: Sebastian Reichel <sebastian.reichel@collabora.co.uk>
> Cc: Ladislav Michl <ladis@linux-mips.org>
> Cc: Grygorii Strashko <grygorii.strashko@ti.com>
> Cc: linux-omap@vger.kernel.org
> Fixes: 52762fbd1c47 ("clocksource/drivers/timer-ti-dm: Add clockevent and clocksource support")
> Signed-off-by: Kees Cook <keescook@chromium.org>

Sorry for the delay, I just noticed I never replied earlier:

Acked-by: Tony Lindgren <tony@atomide.com>

> ---
>  drivers/clocksource/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/clocksource/Kconfig b/drivers/clocksource/Kconfig
> index 0f5e3983951a..08f8cb944a2a 100644
> --- a/drivers/clocksource/Kconfig
> +++ b/drivers/clocksource/Kconfig
> @@ -24,6 +24,7 @@ config I8253_LOCK
>  
>  config OMAP_DM_TIMER
>  	bool
> +	select TIMER_OF
>  
>  config CLKBLD_I8253
>  	def_bool y if CLKSRC_I8253 || CLKEVT_I8253 || I8253_LOCK
> -- 
> 2.30.2
> 
