Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AB7172A8E7D
	for <lists+linux-omap@lfdr.de>; Fri,  6 Nov 2020 05:50:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725830AbgKFEus (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 5 Nov 2020 23:50:48 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:60274 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725616AbgKFEus (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 5 Nov 2020 23:50:48 -0500
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 97D0AB16;
        Fri,  6 Nov 2020 05:50:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1604638246;
        bh=sCYJOpNk29TUZacmieHi7Ge1j1um8XqLdOXm+HhjlGY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=tuUnGAr9J4vZ/FFpO81HASffQKs5Ps9bUnBNfsGyP7lvpCtnFs+1F9wUe1FEEFVl9
         4V9UevQbw721KiABHalKujXelESKijNp8v8LX4tQhK4ntd2GCIWz8QiW8fexZJpqEQ
         mbSCbbbNB1LQ28EMzTTeHEh1PDTjQAf3pmhBwQ/c=
Date:   Fri, 6 Nov 2020 06:50:45 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Tomi Valkeinen <tomi.valkeinen@ti.com>
Cc:     Sebastian Reichel <sre@kernel.org>,
        Nikhil Devshatwar <nikhil.nd@ti.com>,
        linux-omap@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Sekhar Nori <nsekhar@ti.com>, Tony Lindgren <tony@atomide.com>,
        "H . Nikolaus Schaller" <hns@goldelico.com>,
        Sebastian Reichel <sebastian.reichel@collabora.com>
Subject: Re: [PATCH v3 03/56] drm/omap: drop unused dsi.configure_pins
Message-ID: <20201106045045.GD16469@pendragon.ideasonboard.com>
References: <20201105120333.947408-1-tomi.valkeinen@ti.com>
 <20201105120333.947408-4-tomi.valkeinen@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20201105120333.947408-4-tomi.valkeinen@ti.com>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Tomi and Sebastian,

Thank you for the patch.

On Thu, Nov 05, 2020 at 02:02:40PM +0200, Tomi Valkeinen wrote:
> From: Sebastian Reichel <sebastian.reichel@collabora.com>
> 
> The panel-dsi-cm's ddata->pin_config is always NULL, so this
> callback is never called. Instead the DSI encoder gets the pin
> configuration directly from DT.
> 
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c | 11 -----------
>  drivers/gpu/drm/omapdrm/dss/dsi.c               |  1 -
>  drivers/gpu/drm/omapdrm/dss/omapdss.h           |  2 --
>  3 files changed, 14 deletions(-)
> 
> diff --git a/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c b/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c
> index faca5c873bde..ff610d2a13fd 100644
> --- a/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c
> +++ b/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c
> @@ -68,8 +68,6 @@ struct panel_drv_data {
>  	int width_mm;
>  	int height_mm;
>  
> -	struct omap_dsi_pin_config pin_config;
> -
>  	/* runtime variables */
>  	bool enabled;
>  
> @@ -623,15 +621,6 @@ static int dsicm_power_on(struct panel_drv_data *ddata)
>  		}
>  	}
>  
> -	if (ddata->pin_config.num_pins > 0) {
> -		r = src->ops->dsi.configure_pins(src, &ddata->pin_config);
> -		if (r) {
> -			dev_err(&ddata->pdev->dev,
> -				"failed to configure DSI pins\n");
> -			goto err_vddi;
> -		}
> -	}
> -
>  	r = src->ops->dsi.set_config(src, &dsi_config);
>  	if (r) {
>  		dev_err(&ddata->pdev->dev, "failed to configure DSI\n");
> diff --git a/drivers/gpu/drm/omapdrm/dss/dsi.c b/drivers/gpu/drm/omapdrm/dss/dsi.c
> index eeccf40bae41..5598fc8f91db 100644
> --- a/drivers/gpu/drm/omapdrm/dss/dsi.c
> +++ b/drivers/gpu/drm/omapdrm/dss/dsi.c
> @@ -4892,7 +4892,6 @@ static const struct omap_dss_device_ops dsi_ops = {
>  
>  		.enable_hs = dsi_vc_enable_hs,
>  
> -		.configure_pins = dsi_configure_pins,
>  		.set_config = dsi_set_config,
>  
>  		.enable_video_output = dsi_enable_video_output,
> diff --git a/drivers/gpu/drm/omapdrm/dss/omapdss.h b/drivers/gpu/drm/omapdrm/dss/omapdss.h
> index cbbe10b2b60d..b0424daaceed 100644
> --- a/drivers/gpu/drm/omapdrm/dss/omapdss.h
> +++ b/drivers/gpu/drm/omapdrm/dss/omapdss.h
> @@ -292,8 +292,6 @@ struct omapdss_dsi_ops {
>  	/* bus configuration */
>  	int (*set_config)(struct omap_dss_device *dssdev,
>  			const struct omap_dss_dsi_config *cfg);
> -	int (*configure_pins)(struct omap_dss_device *dssdev,
> -			const struct omap_dsi_pin_config *pin_cfg);
>  
>  	void (*enable_hs)(struct omap_dss_device *dssdev, int channel,
>  			bool enable);

-- 
Regards,

Laurent Pinchart
