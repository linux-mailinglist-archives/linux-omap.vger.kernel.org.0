Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DB6F31C6008
	for <lists+linux-omap@lfdr.de>; Tue,  5 May 2020 20:26:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728233AbgEES0Y (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 5 May 2020 14:26:24 -0400
Received: from muru.com ([72.249.23.125]:52948 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728135AbgEES0X (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 5 May 2020 14:26:23 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 30AD180A5;
        Tue,  5 May 2020 18:27:10 +0000 (UTC)
Date:   Tue, 5 May 2020 11:26:18 -0700
From:   Tony Lindgren <tony@atomide.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     soc@kernel.org, Arnd Bergmann <arnd@arndb.de>,
        Kevin Hilman <khilman@kernel.org>,
        Olof Johansson <olof@lixom.net>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-omap@vger.kernel.org
Subject: Re: [PATCH v2 12/15] ARM: omap2plus: Drop unneeded select of
 MIGHT_HAVE_CACHE_L2X0
Message-ID: <20200505182618.GQ37466@atomide.com>
References: <20200505150722.1575-1-geert+renesas@glider.be>
 <20200505150722.1575-13-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200505150722.1575-13-geert+renesas@glider.be>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Geert Uytterhoeven <geert+renesas@glider.be> [200505 08:08]:
> Support for TI AM43x SoCs depends on ARCH_MULTI_V7, which selects
> ARCH_MULTI_V6_V7.
> As the latter selects MIGHT_HAVE_CACHE_L2X0, there is no need for
> SOC_AM43XX to select MIGHT_HAVE_CACHE_L2X0.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Cc: Tony Lindgren <tony@atomide.com>
> Cc: linux-omap@vger.kernel.org
> Acked-by: Arnd Bergmann <arnd@arndb.de>
> Acked-by: Tony Lindgren <tony@atomide.com>
> ---
> v2:
>   - Add Acked-by.

I'll queue this into omap-for-v5.8/soc tomorrow assuming nobody else
has it already applied.

Tony

> ---
>  arch/arm/mach-omap2/Kconfig | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/arch/arm/mach-omap2/Kconfig b/arch/arm/mach-omap2/Kconfig
> index dca7d06c0b938619..ea23205bf70f4df6 100644
> --- a/arch/arm/mach-omap2/Kconfig
> +++ b/arch/arm/mach-omap2/Kconfig
> @@ -66,7 +66,6 @@ config SOC_AM43XX
>  	select ARCH_OMAP2PLUS
>  	select ARM_GIC
>  	select MACH_OMAP_GENERIC
> -	select MIGHT_HAVE_CACHE_L2X0
>  	select HAVE_ARM_SCU
>  	select GENERIC_CLOCKEVENTS_BROADCAST
>  	select HAVE_ARM_TWD
> -- 
> 2.17.1
> 
