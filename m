Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4F45D2AB580
	for <lists+linux-omap@lfdr.de>; Mon,  9 Nov 2020 11:53:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729466AbgKIKxZ (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 9 Nov 2020 05:53:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57338 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729453AbgKIKxZ (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 9 Nov 2020 05:53:25 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0ECD5C0613CF
        for <linux-omap@vger.kernel.org>; Mon,  9 Nov 2020 02:53:25 -0800 (PST)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 34C89B2B;
        Mon,  9 Nov 2020 11:53:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1604919203;
        bh=esit/MqXQPXh0mCqsfav6GdIY2R2A831XLmA4SZYARQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=IK1rTtiyRjbYOdErspRCzhwKeEm89cwHeRyBg/OrwNb3zBZV7TOPqKEmj6tKUPBMY
         sFd6nAnFnl6jZhxXEIT77sm014h5YpauSzzcvBe0Cwkai0hatGj7UPGU/DFlq14eRh
         G51AXjdkSmhKO+MW/umBCmtAKEXAf7tx2uUEwEZ4=
Date:   Mon, 9 Nov 2020 12:53:20 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Tomi Valkeinen <tomi.valkeinen@ti.com>
Cc:     Sebastian Reichel <sre@kernel.org>,
        Nikhil Devshatwar <nikhil.nd@ti.com>,
        linux-omap@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Sekhar Nori <nsekhar@ti.com>, Tony Lindgren <tony@atomide.com>,
        "H . Nikolaus Schaller" <hns@goldelico.com>,
        Sebastian Reichel <sebastian.reichel@collabora.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v3 40/56] drm/panel: Move OMAP's DSI command mode panel
 driver
Message-ID: <20201109105320.GK6029@pendragon.ideasonboard.com>
References: <20201105120333.947408-1-tomi.valkeinen@ti.com>
 <20201105120333.947408-41-tomi.valkeinen@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20201105120333.947408-41-tomi.valkeinen@ti.com>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Tomi and Sebastian,

Thank you for the patch.

On Thu, Nov 05, 2020 at 02:03:17PM +0200, Tomi Valkeinen wrote:
> From: Sebastian Reichel <sebastian.reichel@collabora.com>
> 
> The panel driver is no longer using any OMAP specific APIs, so
> let's move it into the generic panel directory.
> 
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: Sam Ravnborg <sam@ravnborg.org>

Acked-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/gpu/drm/omapdrm/Kconfig                        |  1 -
>  drivers/gpu/drm/omapdrm/Makefile                       |  1 -
>  drivers/gpu/drm/omapdrm/displays/Kconfig               | 10 ----------
>  drivers/gpu/drm/omapdrm/displays/Makefile              |  2 --
>  drivers/gpu/drm/panel/Kconfig                          |  9 +++++++++
>  drivers/gpu/drm/panel/Makefile                         |  1 +
>  .../gpu/drm/{omapdrm/displays => panel}/panel-dsi-cm.c |  0
>  7 files changed, 10 insertions(+), 14 deletions(-)
>  delete mode 100644 drivers/gpu/drm/omapdrm/displays/Kconfig
>  delete mode 100644 drivers/gpu/drm/omapdrm/displays/Makefile
>  rename drivers/gpu/drm/{omapdrm/displays => panel}/panel-dsi-cm.c (100%)
> 
> diff --git a/drivers/gpu/drm/omapdrm/Kconfig b/drivers/gpu/drm/omapdrm/Kconfig
> index 5417e7a47072..cea3f44ea6d4 100644
> --- a/drivers/gpu/drm/omapdrm/Kconfig
> +++ b/drivers/gpu/drm/omapdrm/Kconfig
> @@ -12,6 +12,5 @@ config DRM_OMAP
>  if DRM_OMAP
>  
>  source "drivers/gpu/drm/omapdrm/dss/Kconfig"
> -source "drivers/gpu/drm/omapdrm/displays/Kconfig"
>  
>  endif
> diff --git a/drivers/gpu/drm/omapdrm/Makefile b/drivers/gpu/drm/omapdrm/Makefile
> index f115253115c5..66a73eae6f7c 100644
> --- a/drivers/gpu/drm/omapdrm/Makefile
> +++ b/drivers/gpu/drm/omapdrm/Makefile
> @@ -5,7 +5,6 @@
>  #
>  
>  obj-y += dss/
> -obj-y += displays/
>  
>  omapdrm-y := omap_drv.o \
>  	omap_irq.o \
> diff --git a/drivers/gpu/drm/omapdrm/displays/Kconfig b/drivers/gpu/drm/omapdrm/displays/Kconfig
> deleted file mode 100644
> index f2be594c7eff..000000000000
> --- a/drivers/gpu/drm/omapdrm/displays/Kconfig
> +++ /dev/null
> @@ -1,10 +0,0 @@
> -# SPDX-License-Identifier: GPL-2.0-only
> -menu "OMAPDRM External Display Device Drivers"
> -
> -config DRM_OMAP_PANEL_DSI_CM
> -	tristate "Generic DSI Command Mode Panel"
> -	depends on BACKLIGHT_CLASS_DEVICE
> -	help
> -	  Driver for generic DSI command mode panels.
> -
> -endmenu
> diff --git a/drivers/gpu/drm/omapdrm/displays/Makefile b/drivers/gpu/drm/omapdrm/displays/Makefile
> deleted file mode 100644
> index 488ddf153613..000000000000
> --- a/drivers/gpu/drm/omapdrm/displays/Makefile
> +++ /dev/null
> @@ -1,2 +0,0 @@
> -# SPDX-License-Identifier: GPL-2.0
> -obj-$(CONFIG_DRM_OMAP_PANEL_DSI_CM) += panel-dsi-cm.o
> diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
> index b9dbedf8f15e..a71f95afc52e 100644
> --- a/drivers/gpu/drm/panel/Kconfig
> +++ b/drivers/gpu/drm/panel/Kconfig
> @@ -48,6 +48,15 @@ config DRM_PANEL_BOE_TV101WUM_NL6
>  	  Say Y here if you want to support for BOE TV101WUM and AUO KD101N80
>  	  45NA WUXGA PANEL DSI Video Mode panel
>  
> +config DRM_PANEL_DSI_CM
> +	tristate "Generic DSI command mode panels"
> +	depends on OF
> +	depends on DRM_MIPI_DSI
> +	depends on BACKLIGHT_CLASS_DEVICE
> +	help
> +	  DRM panel driver for DSI command mode panels with support for
> +	  embedded and external backlights.
> +
>  config DRM_PANEL_LVDS
>  	tristate "Generic LVDS panel driver"
>  	depends on OF
> diff --git a/drivers/gpu/drm/panel/Makefile b/drivers/gpu/drm/panel/Makefile
> index 2ba560bca61d..c553e968e9a9 100644
> --- a/drivers/gpu/drm/panel/Makefile
> +++ b/drivers/gpu/drm/panel/Makefile
> @@ -3,6 +3,7 @@ obj-$(CONFIG_DRM_PANEL_ARM_VERSATILE) += panel-arm-versatile.o
>  obj-$(CONFIG_DRM_PANEL_ASUS_Z00T_TM5P5_NT35596) += panel-asus-z00t-tm5p5-n35596.o
>  obj-$(CONFIG_DRM_PANEL_BOE_HIMAX8279D) += panel-boe-himax8279d.o
>  obj-$(CONFIG_DRM_PANEL_BOE_TV101WUM_NL6) += panel-boe-tv101wum-nl6.o
> +obj-$(CONFIG_DRM_PANEL_DSI_CM) += panel-dsi-cm.o
>  obj-$(CONFIG_DRM_PANEL_LVDS) += panel-lvds.o
>  obj-$(CONFIG_DRM_PANEL_SIMPLE) += panel-simple.o
>  obj-$(CONFIG_DRM_PANEL_ELIDA_KD35T133) += panel-elida-kd35t133.o
> diff --git a/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c b/drivers/gpu/drm/panel/panel-dsi-cm.c
> similarity index 100%
> rename from drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c
> rename to drivers/gpu/drm/panel/panel-dsi-cm.c

-- 
Regards,

Laurent Pinchart
