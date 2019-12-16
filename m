Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9249C12091E
	for <lists+linux-omap@lfdr.de>; Mon, 16 Dec 2019 15:59:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728063AbfLPO7u (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 16 Dec 2019 09:59:50 -0500
Received: from muru.com ([72.249.23.125]:48474 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728167AbfLPO7u (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 16 Dec 2019 09:59:50 -0500
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 0E8A8810D;
        Mon, 16 Dec 2019 15:00:28 +0000 (UTC)
Date:   Mon, 16 Dec 2019 06:59:46 -0800
From:   Tony Lindgren <tony@atomide.com>
To:     Arnd Bergmann <arnd@arndb.de>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        Tero Kristo <t-kristo@ti.com>,
        Santosh Shilimkar <santosh.shilimkar@oracle.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ARM: omap2plus: select RESET_CONTROLLER
Message-ID: <20191216145946.GO35479@atomide.com>
References: <20191216132132.3330811-1-arnd@arndb.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191216132132.3330811-1-arnd@arndb.de>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Arnd Bergmann <arnd@arndb.de> [191216 13:22]:
> With the new omap_prm driver added unconditionally, omap2 builds
> fail when the reset controller subsystem is disabled:
> 
> drivers/soc/ti/omap_prm.o: In function `omap_prm_probe':
> omap_prm.c:(.text+0x2d4): undefined reference to `devm_reset_controller_register'
> 
> Fixes: 3e99cb214f03 ("soc: ti: add initial PRM driver with reset control support")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Acked-by: Tony Lindgren <tony@atomide.com>

> ---
>  arch/arm/mach-omap2/Kconfig | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm/mach-omap2/Kconfig b/arch/arm/mach-omap2/Kconfig
> index fe0f82efb1de..639bc38567a7 100644
> --- a/arch/arm/mach-omap2/Kconfig
> +++ b/arch/arm/mach-omap2/Kconfig
> @@ -95,6 +95,7 @@ config ARCH_OMAP2PLUS
>  	bool
>  	select ARCH_HAS_BANDGAP
>  	select ARCH_HAS_HOLES_MEMORYMODEL
> +	select ARCH_HAS_RESET_CONTROLLER
>  	select ARCH_OMAP
>  	select CLKSRC_MMIO
>  	select GENERIC_IRQ_CHIP
> @@ -105,11 +106,11 @@ config ARCH_OMAP2PLUS
>  	select OMAP_DM_TIMER
>  	select OMAP_GPMC
>  	select PINCTRL
> +	select RESET_CONTROLLER
>  	select SOC_BUS
>  	select TI_SYSC
>  	select OMAP_IRQCHIP
>  	select CLKSRC_TI_32K
> -	select ARCH_HAS_RESET_CONTROLLER
>  	help
>  	  Systems based on OMAP2, OMAP3, OMAP4 or OMAP5
>  
> -- 
> 2.20.0
> 
