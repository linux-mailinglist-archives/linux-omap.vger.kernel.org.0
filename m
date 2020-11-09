Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 143562AB2AF
	for <lists+linux-omap@lfdr.de>; Mon,  9 Nov 2020 09:46:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727791AbgKIIqR (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 9 Nov 2020 03:46:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37590 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726127AbgKIIqR (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 9 Nov 2020 03:46:17 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A051C0613CF
        for <linux-omap@vger.kernel.org>; Mon,  9 Nov 2020 00:46:17 -0800 (PST)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id AEA4E2FE;
        Mon,  9 Nov 2020 09:46:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1604911575;
        bh=GY7HzEaiXBPQX9s8myHCxD5TJ1jQI9lnheQLhSmxKy8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=C6RcCL3wSYsuFcJJOh86CHKjDyKEOXP/jnHmSzY8Z4orEo/zonGKyACTOWBv7kMJE
         PLw5AWT9Fa858kPNxbWV6C41jLKhIviKZhm4YK6SXDBe042/YTnG0+vtUfn7mRSTA5
         zifKVHibAB/5CC9PHmURZZyNB1fdsKl9dLMkSRIs=
Date:   Mon, 9 Nov 2020 10:46:12 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Tomi Valkeinen <tomi.valkeinen@ti.com>
Cc:     Sebastian Reichel <sre@kernel.org>,
        Nikhil Devshatwar <nikhil.nd@ti.com>,
        linux-omap@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Sekhar Nori <nsekhar@ti.com>, Tony Lindgren <tony@atomide.com>,
        "H . Nikolaus Schaller" <hns@goldelico.com>,
        Sebastian Reichel <sebastian.reichel@collabora.com>
Subject: Re: [PATCH v3 20/56] drm/omap: dsi: drop unused enable_te()
Message-ID: <20201109084612.GQ6029@pendragon.ideasonboard.com>
References: <20201105120333.947408-1-tomi.valkeinen@ti.com>
 <20201105120333.947408-21-tomi.valkeinen@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20201105120333.947408-21-tomi.valkeinen@ti.com>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Tomi and Sebastian,

Thank you for the patch.

On Thu, Nov 05, 2020 at 02:02:57PM +0200, Tomi Valkeinen wrote:
> From: Sebastian Reichel <sebastian.reichel@collabora.com>
> 
> enable_te() is not used, so the custom API can be dropped.
> 
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  .../gpu/drm/omapdrm/displays/panel-dsi-cm.c   | 39 -------------------
>  drivers/gpu/drm/omapdrm/dss/omapdss.h         |  2 -
>  2 files changed, 41 deletions(-)
> 
> diff --git a/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c b/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c
> index 92ac90035fec..f59775cabe2d 100644
> --- a/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c
> +++ b/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c
> @@ -882,43 +882,6 @@ static int _dsicm_enable_te(struct panel_drv_data *ddata, bool enable)
>  	return r;
>  }
>  
> -static int dsicm_enable_te(struct omap_dss_device *dssdev, bool enable)
> -{
> -	struct panel_drv_data *ddata = to_panel_data(dssdev);
> -	struct omap_dss_device *src = ddata->src;
> -	int r;
> -
> -	mutex_lock(&ddata->lock);
> -
> -	if (ddata->te_enabled == enable)
> -		goto end;
> -
> -	src->ops->dsi.bus_lock(src);
> -
> -	if (ddata->enabled) {
> -		r = dsicm_wake_up(ddata);
> -		if (r)
> -			goto err;
> -
> -		r = _dsicm_enable_te(ddata, enable);
> -		if (r)
> -			goto err;
> -	}
> -
> -	ddata->te_enabled = enable;
> -
> -	src->ops->dsi.bus_unlock(src);
> -end:
> -	mutex_unlock(&ddata->lock);
> -
> -	return 0;
> -err:
> -	src->ops->dsi.bus_unlock(src);
> -	mutex_unlock(&ddata->lock);
> -
> -	return r;
> -}
> -
>  static void dsicm_ulps_work(struct work_struct *work)
>  {
>  	struct panel_drv_data *ddata = container_of(work, struct panel_drv_data,
> @@ -988,8 +951,6 @@ static const struct omap_dss_device_ops dsicm_ops = {
>  static const struct omap_dss_driver dsicm_dss_driver = {
>  	.update		= dsicm_update,
>  	.sync		= dsicm_sync,
> -
> -	.enable_te	= dsicm_enable_te,
>  };
>  
>  static int dsicm_probe_of(struct mipi_dsi_device *dsi)
> diff --git a/drivers/gpu/drm/omapdrm/dss/omapdss.h b/drivers/gpu/drm/omapdrm/dss/omapdss.h
> index aa307f5ab9cf..55d5bca59f81 100644
> --- a/drivers/gpu/drm/omapdrm/dss/omapdss.h
> +++ b/drivers/gpu/drm/omapdrm/dss/omapdss.h
> @@ -386,8 +386,6 @@ struct omap_dss_driver {
>  	int (*update)(struct omap_dss_device *dssdev,
>  			       u16 x, u16 y, u16 w, u16 h);
>  	int (*sync)(struct omap_dss_device *dssdev);
> -
> -	int (*enable_te)(struct omap_dss_device *dssdev, bool enable);
>  };
>  
>  struct dss_device *omapdss_get_dss(void);

-- 
Regards,

Laurent Pinchart
