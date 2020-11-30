Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ED7212C88B9
	for <lists+linux-omap@lfdr.de>; Mon, 30 Nov 2020 16:57:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727070AbgK3P5S (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 30 Nov 2020 10:57:18 -0500
Received: from mslow2.mail.gandi.net ([217.70.178.242]:54984 "EHLO
        mslow2.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726651AbgK3P5S (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 30 Nov 2020 10:57:18 -0500
Received: from relay1-d.mail.gandi.net (unknown [217.70.183.193])
        by mslow2.mail.gandi.net (Postfix) with ESMTP id B961B3E4608;
        Mon, 30 Nov 2020 15:38:52 +0000 (UTC)
X-Originating-IP: 86.194.74.19
Received: from localhost (lfbn-lyo-1-997-19.w86-194.abo.wanadoo.fr [86.194.74.19])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id C9B63240008;
        Mon, 30 Nov 2020 15:37:43 +0000 (UTC)
Date:   Mon, 30 Nov 2020 16:37:43 +0100
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Andrey Zhizhikin <andrey.zhizhikin@leica-geosystems.com>
Cc:     linux@armlinux.org.uk, nicolas.ferre@microchip.com,
        ludovic.desroches@microchip.com, tony@atomide.com,
        mripard@kernel.org, wens@csie.org, jernej.skrabec@siol.net,
        thierry.reding@gmail.com, jonathanh@nvidia.com,
        catalin.marinas@arm.com, will@kernel.org,
        tsbogend@alpha.franken.de, James.Bottomley@hansenpartnership.com,
        deller@gmx.de, mpe@ellerman.id.au, benh@kernel.crashing.org,
        paulus@samba.org, lee.jones@linaro.org, sam@ravnborg.org,
        emil.l.velikov@gmail.com, daniel.thompson@linaro.org,
        krzk@kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-mips@vger.kernel.org,
        linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH 1/5] ARM: configs: drop unused BACKLIGHT_GENERIC option
Message-ID: <20201130153743.GO1296649@piout.net>
References: <20201130152137.24909-1-andrey.zhizhikin@leica-geosystems.com>
 <20201130152137.24909-2-andrey.zhizhikin@leica-geosystems.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201130152137.24909-2-andrey.zhizhikin@leica-geosystems.com>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 30/11/2020 15:21:33+0000, Andrey Zhizhikin wrote:
> Commit 7ecdea4a0226 ("backlight: generic_bl: Remove this driver as it is
> unused") removed geenric_bl driver from the tree, together with
> corresponding config option.
> 
> Remove BACKLIGHT_GENERIC config item from all ARM configurations.
> 
> Fixes: 7ecdea4a0226 ("backlight: generic_bl: Remove this driver as it is unused")
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Signed-off-by: Andrey Zhizhikin <andrey.zhizhikin@leica-geosystems.com>
Acked-by: Alexandre Belloni <alexandre.belloni@bootlin.com>

> ---
>  arch/arm/configs/at91_dt_defconfig        | 1 -
>  arch/arm/configs/cm_x300_defconfig        | 1 -
>  arch/arm/configs/colibri_pxa300_defconfig | 1 -
>  arch/arm/configs/jornada720_defconfig     | 1 -
>  arch/arm/configs/magician_defconfig       | 1 -
>  arch/arm/configs/mini2440_defconfig       | 1 -
>  arch/arm/configs/omap2plus_defconfig      | 1 -
>  arch/arm/configs/pxa3xx_defconfig         | 1 -
>  arch/arm/configs/qcom_defconfig           | 1 -
>  arch/arm/configs/sama5_defconfig          | 1 -
>  arch/arm/configs/sunxi_defconfig          | 1 -
>  arch/arm/configs/tegra_defconfig          | 1 -
>  arch/arm/configs/u8500_defconfig          | 1 -
>  13 files changed, 13 deletions(-)
> 
> diff --git a/arch/arm/configs/at91_dt_defconfig b/arch/arm/configs/at91_dt_defconfig
> index 4a0ba2ae1a25..6e52c9c965e6 100644
> --- a/arch/arm/configs/at91_dt_defconfig
> +++ b/arch/arm/configs/at91_dt_defconfig
> @@ -132,7 +132,6 @@ CONFIG_DRM_ATMEL_HLCDC=y
>  CONFIG_DRM_PANEL_SIMPLE=y
>  CONFIG_FB_ATMEL=y
>  CONFIG_BACKLIGHT_ATMEL_LCDC=y
> -# CONFIG_BACKLIGHT_GENERIC is not set
>  CONFIG_BACKLIGHT_PWM=y
>  CONFIG_FRAMEBUFFER_CONSOLE=y
>  CONFIG_LOGO=y
> diff --git a/arch/arm/configs/cm_x300_defconfig b/arch/arm/configs/cm_x300_defconfig
> index 2f7acde2d921..502a9d870ca4 100644
> --- a/arch/arm/configs/cm_x300_defconfig
> +++ b/arch/arm/configs/cm_x300_defconfig
> @@ -87,7 +87,6 @@ CONFIG_FB=y
>  CONFIG_FB_PXA=y
>  CONFIG_LCD_CLASS_DEVICE=y
>  CONFIG_LCD_TDO24M=y
> -# CONFIG_BACKLIGHT_GENERIC is not set
>  CONFIG_BACKLIGHT_DA903X=m
>  CONFIG_FRAMEBUFFER_CONSOLE=y
>  CONFIG_FRAMEBUFFER_CONSOLE_DETECT_PRIMARY=y
> diff --git a/arch/arm/configs/colibri_pxa300_defconfig b/arch/arm/configs/colibri_pxa300_defconfig
> index 0dae3b185284..26e5a67f8e2d 100644
> --- a/arch/arm/configs/colibri_pxa300_defconfig
> +++ b/arch/arm/configs/colibri_pxa300_defconfig
> @@ -34,7 +34,6 @@ CONFIG_FB=y
>  CONFIG_FB_PXA=y
>  # CONFIG_LCD_CLASS_DEVICE is not set
>  CONFIG_BACKLIGHT_CLASS_DEVICE=y
> -# CONFIG_BACKLIGHT_GENERIC is not set
>  # CONFIG_VGA_CONSOLE is not set
>  CONFIG_FRAMEBUFFER_CONSOLE=y
>  CONFIG_LOGO=y
> diff --git a/arch/arm/configs/jornada720_defconfig b/arch/arm/configs/jornada720_defconfig
> index 9f079be2b84b..069f60ffdcd8 100644
> --- a/arch/arm/configs/jornada720_defconfig
> +++ b/arch/arm/configs/jornada720_defconfig
> @@ -48,7 +48,6 @@ CONFIG_FB=y
>  CONFIG_FB_S1D13XXX=y
>  CONFIG_LCD_CLASS_DEVICE=y
>  CONFIG_BACKLIGHT_CLASS_DEVICE=y
> -# CONFIG_BACKLIGHT_GENERIC is not set
>  # CONFIG_VGA_CONSOLE is not set
>  CONFIG_FRAMEBUFFER_CONSOLE=y
>  CONFIG_FRAMEBUFFER_CONSOLE_DETECT_PRIMARY=y
> diff --git a/arch/arm/configs/magician_defconfig b/arch/arm/configs/magician_defconfig
> index d2e684f6565a..b4670d42f378 100644
> --- a/arch/arm/configs/magician_defconfig
> +++ b/arch/arm/configs/magician_defconfig
> @@ -95,7 +95,6 @@ CONFIG_FB_PXA_OVERLAY=y
>  CONFIG_FB_W100=y
>  CONFIG_LCD_CLASS_DEVICE=y
>  CONFIG_BACKLIGHT_CLASS_DEVICE=y
> -# CONFIG_BACKLIGHT_GENERIC is not set
>  CONFIG_BACKLIGHT_PWM=y
>  # CONFIG_VGA_CONSOLE is not set
>  CONFIG_FRAMEBUFFER_CONSOLE=y
> diff --git a/arch/arm/configs/mini2440_defconfig b/arch/arm/configs/mini2440_defconfig
> index 301f29a1fcc3..898490aaa39e 100644
> --- a/arch/arm/configs/mini2440_defconfig
> +++ b/arch/arm/configs/mini2440_defconfig
> @@ -158,7 +158,6 @@ CONFIG_FB_S3C2410=y
>  CONFIG_LCD_CLASS_DEVICE=y
>  CONFIG_LCD_PLATFORM=y
>  CONFIG_BACKLIGHT_CLASS_DEVICE=y
> -# CONFIG_BACKLIGHT_GENERIC is not set
>  CONFIG_BACKLIGHT_PWM=y
>  CONFIG_FRAMEBUFFER_CONSOLE=y
>  CONFIG_FRAMEBUFFER_CONSOLE_DETECT_PRIMARY=y
> diff --git a/arch/arm/configs/omap2plus_defconfig b/arch/arm/configs/omap2plus_defconfig
> index de3b7813a1ce..7eae097a75d2 100644
> --- a/arch/arm/configs/omap2plus_defconfig
> +++ b/arch/arm/configs/omap2plus_defconfig
> @@ -388,7 +388,6 @@ CONFIG_FB_TILEBLITTING=y
>  CONFIG_LCD_CLASS_DEVICE=y
>  CONFIG_LCD_PLATFORM=y
>  CONFIG_BACKLIGHT_CLASS_DEVICE=y
> -CONFIG_BACKLIGHT_GENERIC=m
>  CONFIG_BACKLIGHT_PWM=m
>  CONFIG_BACKLIGHT_PANDORA=m
>  CONFIG_BACKLIGHT_GPIO=m
> diff --git a/arch/arm/configs/pxa3xx_defconfig b/arch/arm/configs/pxa3xx_defconfig
> index 06bbc7a59b60..f0c34017f2aa 100644
> --- a/arch/arm/configs/pxa3xx_defconfig
> +++ b/arch/arm/configs/pxa3xx_defconfig
> @@ -74,7 +74,6 @@ CONFIG_FB_PXA=y
>  CONFIG_LCD_CLASS_DEVICE=y
>  CONFIG_LCD_TDO24M=y
>  CONFIG_BACKLIGHT_CLASS_DEVICE=y
> -# CONFIG_BACKLIGHT_GENERIC is not set
>  CONFIG_BACKLIGHT_DA903X=y
>  # CONFIG_VGA_CONSOLE is not set
>  CONFIG_FRAMEBUFFER_CONSOLE=y
> diff --git a/arch/arm/configs/qcom_defconfig b/arch/arm/configs/qcom_defconfig
> index c882167e1496..d6733e745b80 100644
> --- a/arch/arm/configs/qcom_defconfig
> +++ b/arch/arm/configs/qcom_defconfig
> @@ -159,7 +159,6 @@ CONFIG_FB=y
>  CONFIG_FRAMEBUFFER_CONSOLE=y
>  # CONFIG_LCD_CLASS_DEVICE is not set
>  CONFIG_BACKLIGHT_CLASS_DEVICE=y
> -# CONFIG_BACKLIGHT_GENERIC is not set
>  CONFIG_BACKLIGHT_LM3630A=y
>  CONFIG_BACKLIGHT_LP855X=y
>  CONFIG_SOUND=y
> diff --git a/arch/arm/configs/sama5_defconfig b/arch/arm/configs/sama5_defconfig
> index 037d3a718a60..0a167891eb05 100644
> --- a/arch/arm/configs/sama5_defconfig
> +++ b/arch/arm/configs/sama5_defconfig
> @@ -161,7 +161,6 @@ CONFIG_DRM_ATMEL_HLCDC=y
>  CONFIG_DRM_PANEL_SIMPLE=y
>  CONFIG_LCD_CLASS_DEVICE=y
>  CONFIG_BACKLIGHT_CLASS_DEVICE=y
> -# CONFIG_BACKLIGHT_GENERIC is not set
>  CONFIG_BACKLIGHT_PWM=y
>  CONFIG_FRAMEBUFFER_CONSOLE=y
>  CONFIG_SOUND=y
> diff --git a/arch/arm/configs/sunxi_defconfig b/arch/arm/configs/sunxi_defconfig
> index 244126172fd6..af6e80d1a0f2 100644
> --- a/arch/arm/configs/sunxi_defconfig
> +++ b/arch/arm/configs/sunxi_defconfig
> @@ -111,7 +111,6 @@ CONFIG_DRM_SIMPLE_BRIDGE=y
>  CONFIG_DRM_LIMA=y
>  CONFIG_FB_SIMPLE=y
>  CONFIG_BACKLIGHT_CLASS_DEVICE=y
> -# CONFIG_BACKLIGHT_GENERIC is not set
>  CONFIG_BACKLIGHT_PWM=y
>  CONFIG_SOUND=y
>  CONFIG_SND=y
> diff --git a/arch/arm/configs/tegra_defconfig b/arch/arm/configs/tegra_defconfig
> index fff5fae0db30..74739a52a8ad 100644
> --- a/arch/arm/configs/tegra_defconfig
> +++ b/arch/arm/configs/tegra_defconfig
> @@ -205,7 +205,6 @@ CONFIG_DRM_PANEL_SIMPLE=y
>  CONFIG_DRM_LVDS_CODEC=y
>  # CONFIG_LCD_CLASS_DEVICE is not set
>  CONFIG_BACKLIGHT_CLASS_DEVICE=y
> -# CONFIG_BACKLIGHT_GENERIC is not set
>  CONFIG_BACKLIGHT_PWM=y
>  CONFIG_FRAMEBUFFER_CONSOLE=y
>  CONFIG_FRAMEBUFFER_CONSOLE_ROTATION=y
> diff --git a/arch/arm/configs/u8500_defconfig b/arch/arm/configs/u8500_defconfig
> index 28dd7cf56048..24aacc255021 100644
> --- a/arch/arm/configs/u8500_defconfig
> +++ b/arch/arm/configs/u8500_defconfig
> @@ -92,7 +92,6 @@ CONFIG_DRM_PANEL_SONY_ACX424AKP=y
>  CONFIG_DRM_LIMA=y
>  CONFIG_DRM_MCDE=y
>  CONFIG_BACKLIGHT_CLASS_DEVICE=y
> -CONFIG_BACKLIGHT_GENERIC=m
>  CONFIG_BACKLIGHT_GPIO=y
>  CONFIG_LOGO=y
>  CONFIG_SOUND=y
> -- 
> 2.17.1
> 

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
