Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BB96E21299A
	for <lists+linux-omap@lfdr.de>; Thu,  2 Jul 2020 18:34:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726630AbgGBQeW (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 2 Jul 2020 12:34:22 -0400
Received: from muru.com ([72.249.23.125]:60416 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726415AbgGBQeW (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 2 Jul 2020 12:34:22 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id E2B738062;
        Thu,  2 Jul 2020 16:35:14 +0000 (UTC)
Date:   Thu, 2 Jul 2020 09:34:19 -0700
From:   Tony Lindgren <tony@atomide.com>
To:     Lee Jones <lee.jones@linaro.org>
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Ulf Hansson <ulf.hansson@linaro.org>,
        linux-mmc@vger.kernel.org, linux-omap@vger.kernel.org
Subject: Re: [PATCH 1/1] arch: arm: mach-omap2: mmc: Move
 omap_mmc_notify_cover_event() prototype
Message-ID: <20200702163419.GL37466@atomide.com>
References: <20200701102317.235032-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200701102317.235032-1-lee.jones@linaro.org>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Lee Jones <lee.jones@linaro.org> [200701 03:24]:
> When building the kernel with W=1 the build system complains of:
> 
>  drivers/mmc/host/omap.c:854:6: warning: no previous prototype for ‘omap_mmc_notify_cover_event’ [-Wmissing-prototypes]
>  854 | void omap_mmc_notify_cover_event(struct device *dev, int num, int is_closed)
>  | ^~~~~~~~~~~~~~~~~~~~~~~~~~~
> 
> If we move the prototype into a shared headerfile the build system
> will be satisfied.  Rather than create a whole new headerfile just
> for this purpose, it makes sense to use the already existing
> mmc-omap.h.

Looks good to me and should not conflict with anything so feel
free to queue along with your other patches:

Acked-by: Tony Lindgren <tony@atomide.com>


> Cc: Ulf Hansson <ulf.hansson@linaro.org>
> Cc: linux-mmc@vger.kernel.org
> Cc: Tony Lindgren <tony@atomide.com>
> Cc: linux-omap@vger.kernel.org
> Signed-off-by: Lee Jones <lee.jones@linaro.org>
> ---
>  arch/arm/mach-omap2/mmc.h              | 4 ----
>  include/linux/platform_data/mmc-omap.h | 3 +++
>  2 files changed, 3 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/arm/mach-omap2/mmc.h b/arch/arm/mach-omap2/mmc.h
> index 7f4e053c34344..b5533e93cb632 100644
> --- a/arch/arm/mach-omap2/mmc.h
> +++ b/arch/arm/mach-omap2/mmc.h
> @@ -16,7 +16,3 @@ static inline int omap_msdi_reset(struct omap_hwmod *oh)
>  	return 0;
>  }
>  #endif
> -
> -/* called from board-specific card detection service routine */
> -extern void omap_mmc_notify_cover_event(struct device *dev, int slot,
> -					int is_closed);
> diff --git a/include/linux/platform_data/mmc-omap.h b/include/linux/platform_data/mmc-omap.h
> index 9acf0e87aa9be..f0b8947e6b07d 100644
> --- a/include/linux/platform_data/mmc-omap.h
> +++ b/include/linux/platform_data/mmc-omap.h
> @@ -116,3 +116,6 @@ struct omap_mmc_platform_data {
>  
>  	} slots[OMAP_MMC_MAX_SLOTS];
>  };
> +
> +extern void omap_mmc_notify_cover_event(struct device *dev, int slot,
> +					int is_closed);
> -- 
> 2.25.1
> 
