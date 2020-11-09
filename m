Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5DD3B2AB609
	for <lists+linux-omap@lfdr.de>; Mon,  9 Nov 2020 12:08:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729228AbgKILIA (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 9 Nov 2020 06:08:00 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:41372 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729752AbgKILHv (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 9 Nov 2020 06:07:51 -0500
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id ECFF1B2B;
        Mon,  9 Nov 2020 12:07:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1604920069;
        bh=IB4l3ZVmuIhcEzPFNJcsDLAm9fTeYO0gr9QNbu9E4t4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=J4pmv8MJvz5LIaKLk4rCl6cglgXs/5VesSjnvypcwPN0q8GxltRV2YROtKkokZrgC
         IaexK9q2t+Rxubd26GZutfj+5SJ569dPepbpkqpVYRTeq5Sqejcpo9qx81dK2rN5j2
         ddmxz9sR850UJ1VEpeKBdJA0trc6vTS1iHmYkvzc=
Date:   Mon, 9 Nov 2020 13:07:45 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Tomi Valkeinen <tomi.valkeinen@ti.com>
Cc:     Sebastian Reichel <sre@kernel.org>,
        Nikhil Devshatwar <nikhil.nd@ti.com>,
        linux-omap@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Sekhar Nori <nsekhar@ti.com>, Tony Lindgren <tony@atomide.com>,
        "H . Nikolaus Schaller" <hns@goldelico.com>,
        Sebastian Reichel <sebastian.reichel@collabora.com>
Subject: Re: [PATCH v3 49/56] drm/omap: simplify DSI manual update code
Message-ID: <20201109110745.GT6029@pendragon.ideasonboard.com>
References: <20201105120333.947408-1-tomi.valkeinen@ti.com>
 <20201105120333.947408-50-tomi.valkeinen@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20201105120333.947408-50-tomi.valkeinen@ti.com>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Tomi and Sebastian,

Thank you for the patch.

On Thu, Nov 05, 2020 at 02:03:26PM +0200, Tomi Valkeinen wrote:
> From: Sebastian Reichel <sebastian.reichel@collabora.com>
> 
> Move dsi_ops into the main structure, since all other ops
> are gone. Instead of checking the device type we can simply
> check if dsi_ops are set.
> 
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/gpu/drm/omapdrm/dss/dsi.c     | 10 ++++------
>  drivers/gpu/drm/omapdrm/dss/omapdss.h |  6 +-----
>  drivers/gpu/drm/omapdrm/omap_crtc.c   | 16 ++++------------
>  3 files changed, 9 insertions(+), 23 deletions(-)
> 
> diff --git a/drivers/gpu/drm/omapdrm/dss/dsi.c b/drivers/gpu/drm/omapdrm/dss/dsi.c
> index bbcdb62e1571..f47d7e3bb631 100644
> --- a/drivers/gpu/drm/omapdrm/dss/dsi.c
> +++ b/drivers/gpu/drm/omapdrm/dss/dsi.c
> @@ -5011,11 +5011,9 @@ static int dsi_get_clocks(struct dsi_data *dsi)
>  	return 0;
>  }
>  
> -static const struct omap_dss_device_ops dsi_ops = {
> -	.dsi = {
> -		.update = dsi_update_all,
> -		.is_video_mode = dsi_is_video_mode,
> -	},
> +static const struct omapdss_dsi_ops dsi_ops = {
> +	.update = dsi_update_all,
> +	.is_video_mode = dsi_is_video_mode,
>  };
>  
>  static irqreturn_t omap_dsi_te_irq_handler(int irq, void *dev_id)
> @@ -5450,7 +5448,7 @@ static int dsi_init_output(struct dsi_data *dsi)
>  	out->type = OMAP_DISPLAY_TYPE_DSI;
>  	out->name = dsi->module_id == 0 ? "dsi.0" : "dsi.1";
>  	out->dispc_channel = dsi_get_channel(dsi);
> -	out->ops = &dsi_ops;
> +	out->dsi_ops = &dsi_ops;
>  	out->owner = THIS_MODULE;
>  	out->of_port = 0;
>  	out->bus_flags = DRM_BUS_FLAG_PIXDATA_DRIVE_POSEDGE
> diff --git a/drivers/gpu/drm/omapdrm/dss/omapdss.h b/drivers/gpu/drm/omapdrm/dss/omapdss.h
> index c2199c4946ec..a1236b8ef7ea 100644
> --- a/drivers/gpu/drm/omapdrm/dss/omapdss.h
> +++ b/drivers/gpu/drm/omapdrm/dss/omapdss.h
> @@ -275,10 +275,6 @@ struct omapdss_dsi_ops {
>  	bool (*is_video_mode)(struct omap_dss_device *dssdev);
>  };
>  
> -struct omap_dss_device_ops {
> -	const struct omapdss_dsi_ops dsi;
> -};
> -
>  struct omap_dss_device {
>  	struct device *dev;
>  
> @@ -300,7 +296,7 @@ struct omap_dss_device {
>  
>  	const char *name;
>  
> -	const struct omap_dss_device_ops *ops;
> +	const struct omapdss_dsi_ops *dsi_ops;
>  	u32 bus_flags;
>  
>  	/* OMAP DSS output specific fields */
> diff --git a/drivers/gpu/drm/omapdrm/omap_crtc.c b/drivers/gpu/drm/omapdrm/omap_crtc.c
> index f6b968060cf0..5ab557c477ef 100644
> --- a/drivers/gpu/drm/omapdrm/omap_crtc.c
> +++ b/drivers/gpu/drm/omapdrm/omap_crtc.c
> @@ -366,17 +366,10 @@ static void omap_crtc_manual_display_update(struct work_struct *data)
>  	struct drm_device *dev = omap_crtc->base.dev;
>  	int ret;
>  
> -	if (!dssdev) {
> -		dev_err_once(dev->dev, "missing display dssdev!");
> +	if (!dssdev || !dssdev->dsi_ops || !dssdev->dsi_ops->update)
>  		return;
> -	}
> -
> -	if (dssdev->type != OMAP_DISPLAY_TYPE_DSI || !dssdev->ops->dsi.update) {
> -		dev_err_once(dev->dev, "no DSI update callback found!");
> -		return;
> -	}
>  
> -	ret = dssdev->ops->dsi.update(dssdev);
> +	ret = dssdev->dsi_ops->update(dssdev);
>  	if (ret < 0) {
>  		spin_lock_irq(&dev->event_lock);
>  		omap_crtc->pending = false;
> @@ -550,11 +543,10 @@ static bool omap_crtc_is_manually_updated(struct drm_crtc *crtc)
>  	struct omap_crtc *omap_crtc = to_omap_crtc(crtc);
>  	struct omap_dss_device *dssdev = omap_crtc->pipe->output;
>  
> -	if (dssdev->type != OMAP_DISPLAY_TYPE_DSI ||
> -	    !dssdev->ops->dsi.is_video_mode)
> +	if (!dssdev || !dssdev->dsi_ops || !dssdev->dsi_ops->is_video_mode)
>  		return false;
>  
> -	if (dssdev->ops->dsi.is_video_mode(dssdev))
> +	if (dssdev->dsi_ops->is_video_mode(dssdev))
>  		return false;
>  
>  	DBG("detected manually updated display!");

-- 
Regards,

Laurent Pinchart
