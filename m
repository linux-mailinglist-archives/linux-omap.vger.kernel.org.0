Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 991952AB2B2
	for <lists+linux-omap@lfdr.de>; Mon,  9 Nov 2020 09:46:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727920AbgKIIqy (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 9 Nov 2020 03:46:54 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:39676 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726127AbgKIIqx (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 9 Nov 2020 03:46:53 -0500
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 249C72FE;
        Mon,  9 Nov 2020 09:46:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1604911611;
        bh=dvN2vwjEk0CcEKWuvwsGCxa5Wucy0oymFDVo2T9XQv8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=dGqVrjImkmaQHhmCAehQx9pdEP+HYf60Lp0lY2OYMggVb2U8DOCImi0z18WK0EJ6Z
         7Mmb6mWSeu4jRBtDTU934x4wirjS7FeP9EYI78+ap4pHPuQ6BElgE7hQgE15y1fQ33
         Q56/PWn9DW0vEQkKrLdHldvlYyh0N4FXc0XVdnVA=
Date:   Mon, 9 Nov 2020 10:46:48 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Tomi Valkeinen <tomi.valkeinen@ti.com>
Cc:     Sebastian Reichel <sre@kernel.org>,
        Nikhil Devshatwar <nikhil.nd@ti.com>,
        linux-omap@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Sekhar Nori <nsekhar@ti.com>, Tony Lindgren <tony@atomide.com>,
        "H . Nikolaus Schaller" <hns@goldelico.com>,
        Sebastian Reichel <sebastian.reichel@collabora.com>
Subject: Re: [PATCH v3 21/56] drm/omap: dsi: drop useless sync()
Message-ID: <20201109084648.GR6029@pendragon.ideasonboard.com>
References: <20201105120333.947408-1-tomi.valkeinen@ti.com>
 <20201105120333.947408-22-tomi.valkeinen@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20201105120333.947408-22-tomi.valkeinen@ti.com>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Tomi and Sebastian,

Thank you for the patch.

On Thu, Nov 05, 2020 at 02:02:58PM +0200, Tomi Valkeinen wrote:
> From: Sebastian Reichel <sebastian.reichel@collabora.com>
> 
> The DSI sync() function only locks the bus and then releases
> it again. Currently the only invocation is directly before
> update(), which locks the bus anyways.
> 
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  .../gpu/drm/omapdrm/displays/panel-dsi-cm.c    | 18 ------------------
>  drivers/gpu/drm/omapdrm/dss/omapdss.h          |  1 -
>  drivers/gpu/drm/omapdrm/omap_crtc.c            |  3 ---
>  3 files changed, 22 deletions(-)
> 
> diff --git a/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c b/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c
> index f59775cabe2d..a9609eed6bfa 100644
> --- a/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c
> +++ b/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c
> @@ -845,23 +845,6 @@ static int dsicm_update(struct omap_dss_device *dssdev,
>  	return r;
>  }
>  
> -static int dsicm_sync(struct omap_dss_device *dssdev)
> -{
> -	struct panel_drv_data *ddata = to_panel_data(dssdev);
> -	struct omap_dss_device *src = ddata->src;
> -
> -	dev_dbg(&ddata->dsi->dev, "sync\n");
> -
> -	mutex_lock(&ddata->lock);
> -	src->ops->dsi.bus_lock(src);
> -	src->ops->dsi.bus_unlock(src);
> -	mutex_unlock(&ddata->lock);
> -
> -	dev_dbg(&ddata->dsi->dev, "sync done\n");
> -
> -	return 0;
> -}
> -
>  static int _dsicm_enable_te(struct panel_drv_data *ddata, bool enable)
>  {
>  	struct omap_dss_device *src = ddata->src;
> @@ -950,7 +933,6 @@ static const struct omap_dss_device_ops dsicm_ops = {
>  
>  static const struct omap_dss_driver dsicm_dss_driver = {
>  	.update		= dsicm_update,
> -	.sync		= dsicm_sync,
>  };
>  
>  static int dsicm_probe_of(struct mipi_dsi_device *dsi)
> diff --git a/drivers/gpu/drm/omapdrm/dss/omapdss.h b/drivers/gpu/drm/omapdrm/dss/omapdss.h
> index 55d5bca59f81..9bbd2c0f3187 100644
> --- a/drivers/gpu/drm/omapdrm/dss/omapdss.h
> +++ b/drivers/gpu/drm/omapdrm/dss/omapdss.h
> @@ -385,7 +385,6 @@ struct omap_dss_device {
>  struct omap_dss_driver {
>  	int (*update)(struct omap_dss_device *dssdev,
>  			       u16 x, u16 y, u16 w, u16 h);
> -	int (*sync)(struct omap_dss_device *dssdev);
>  };
>  
>  struct dss_device *omapdss_get_dss(void);
> diff --git a/drivers/gpu/drm/omapdrm/omap_crtc.c b/drivers/gpu/drm/omapdrm/omap_crtc.c
> index 328a4a74f534..dac9ccda98df 100644
> --- a/drivers/gpu/drm/omapdrm/omap_crtc.c
> +++ b/drivers/gpu/drm/omapdrm/omap_crtc.c
> @@ -379,9 +379,6 @@ static void omap_crtc_manual_display_update(struct work_struct *data)
>  		return;
>  	}
>  
> -	if (dssdrv->sync)
> -		dssdrv->sync(dssdev);
> -
>  	ret = dssdrv->update(dssdev, 0, 0, mode->hdisplay, mode->vdisplay);
>  	if (ret < 0) {
>  		spin_lock_irq(&dev->event_lock);

-- 
Regards,

Laurent Pinchart
