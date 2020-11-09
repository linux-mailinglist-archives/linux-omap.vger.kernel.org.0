Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2B7642AB2AB
	for <lists+linux-omap@lfdr.de>; Mon,  9 Nov 2020 09:45:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729796AbgKIIpP (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 9 Nov 2020 03:45:15 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:39600 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727791AbgKIIpP (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 9 Nov 2020 03:45:15 -0500
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9D3112FE;
        Mon,  9 Nov 2020 09:45:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1604911512;
        bh=WhWdGkaugo9Jx10L4LmFLCyTUG2vy4IhXe+IL84jFNQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ZWtUArJ5sSDHQtNN8imEr0Kaqtjes+XXRMJIQQ4A0K8shMYVXCYaLcp8U14jv3ebA
         xEfBLG28FFOFK+P9T/KB8Ix5e/KRKXRbsoc5qViBcgviXAyjnnZYbTmq/6NkIPvX1S
         mZ6AlWWAGJ96etXasUFQwms2FfwsOsYImra/LLjQ=
Date:   Mon, 9 Nov 2020 10:45:09 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Tomi Valkeinen <tomi.valkeinen@ti.com>
Cc:     Sebastian Reichel <sre@kernel.org>,
        Nikhil Devshatwar <nikhil.nd@ti.com>,
        linux-omap@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Sekhar Nori <nsekhar@ti.com>, Tony Lindgren <tony@atomide.com>,
        "H . Nikolaus Schaller" <hns@goldelico.com>,
        Sebastian Reichel <sebastian.reichel@collabora.com>
Subject: Re: [PATCH v3 18/56] drm/omap: dsi: drop unused memory_read()
Message-ID: <20201109084509.GO6029@pendragon.ideasonboard.com>
References: <20201105120333.947408-1-tomi.valkeinen@ti.com>
 <20201105120333.947408-19-tomi.valkeinen@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20201105120333.947408-19-tomi.valkeinen@ti.com>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Tomi and Sebastian,

Thank you for the patch.

On Thu, Nov 05, 2020 at 02:02:55PM +0200, Tomi Valkeinen wrote:
> From: Sebastian Reichel <sebastian.reichel@collabora.com>
> 
> memory_read is not used, so we can drop the code.
> 
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  .../gpu/drm/omapdrm/displays/panel-dsi-cm.c   | 93 -------------------
>  drivers/gpu/drm/omapdrm/dss/omapdss.h         |  4 -
>  2 files changed, 97 deletions(-)
> 
> diff --git a/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c b/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c
> index a7236d9c3046..dd9112ca76ba 100644
> --- a/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c
> +++ b/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c
> @@ -931,97 +931,6 @@ static int dsicm_get_te(struct omap_dss_device *dssdev)
>  	return r;
>  }
>  
> -static int dsicm_set_max_rx_packet_size(struct omap_dss_device *dssdev,
> -					u16 size)
> -{
> -	struct panel_drv_data *ddata = to_panel_data(dssdev);
> -	struct mipi_dsi_device *dsi = ddata->dsi;
> -
> -	return mipi_dsi_set_maximum_return_packet_size(dsi, size);
> -}
> -
> -static int dsicm_memory_read(struct omap_dss_device *dssdev,
> -		void *buf, size_t size,
> -		u16 x, u16 y, u16 w, u16 h)
> -{
> -	struct panel_drv_data *ddata = to_panel_data(dssdev);
> -	struct mipi_dsi_device *dsi = ddata->dsi;
> -	struct omap_dss_device *src = ddata->src;
> -	int r;
> -	int first = 1;
> -	int plen;
> -	unsigned int buf_used = 0;
> -
> -	if (size < w * h * 3)
> -		return -ENOMEM;
> -
> -	mutex_lock(&ddata->lock);
> -
> -	if (!ddata->enabled) {
> -		r = -ENODEV;
> -		goto err1;
> -	}
> -
> -	size = min((u32)w * h * 3,
> -		   ddata->vm.hactive * ddata->vm.vactive * 3);
> -
> -	src->ops->dsi.bus_lock(src);
> -
> -	r = dsicm_wake_up(ddata);
> -	if (r)
> -		goto err2;
> -
> -	/* plen 1 or 2 goes into short packet. until checksum error is fixed,
> -	 * use short packets. plen 32 works, but bigger packets seem to cause
> -	 * an error. */
> -	if (size % 2)
> -		plen = 1;
> -	else
> -		plen = 2;
> -
> -	dsicm_set_update_window(ddata, x, y, w, h);
> -
> -	r = dsicm_set_max_rx_packet_size(dssdev, plen);
> -	if (r)
> -		goto err2;
> -
> -	while (buf_used < size) {
> -		u8 dcs_cmd = first ? 0x2e : 0x3e;
> -		first = 0;
> -
> -		r = mipi_dsi_dcs_read(dsi, dcs_cmd,
> -				      buf + buf_used, size - buf_used);
> -		if (r < 0) {
> -			dev_err(dssdev->dev, "read error\n");
> -			goto err3;
> -		}
> -
> -		buf_used += r;
> -
> -		if (r < plen) {
> -			dev_err(&ddata->dsi->dev, "short read\n");
> -			break;
> -		}
> -
> -		if (signal_pending(current)) {
> -			dev_err(&ddata->dsi->dev, "signal pending, "
> -					"aborting memory read\n");
> -			r = -ERESTARTSYS;
> -			goto err3;
> -		}
> -	}
> -
> -	r = buf_used;
> -
> -err3:
> -	dsicm_set_max_rx_packet_size(dssdev, 1);
> -err2:
> -	src->ops->dsi.bus_unlock(src);
> -err1:
> -	mutex_unlock(&ddata->lock);
> -	return r;
> -}
> -
>  static void dsicm_ulps_work(struct work_struct *work)
>  {
>  	struct panel_drv_data *ddata = container_of(work, struct panel_drv_data,
> @@ -1094,8 +1003,6 @@ static const struct omap_dss_driver dsicm_dss_driver = {
>  
>  	.enable_te	= dsicm_enable_te,
>  	.get_te		= dsicm_get_te,
> -
> -	.memory_read	= dsicm_memory_read,
>  };
>  
>  static int dsicm_probe_of(struct mipi_dsi_device *dsi)
> diff --git a/drivers/gpu/drm/omapdrm/dss/omapdss.h b/drivers/gpu/drm/omapdrm/dss/omapdss.h
> index 78041ef922cc..e67928373560 100644
> --- a/drivers/gpu/drm/omapdrm/dss/omapdss.h
> +++ b/drivers/gpu/drm/omapdrm/dss/omapdss.h
> @@ -389,10 +389,6 @@ struct omap_dss_driver {
>  
>  	int (*enable_te)(struct omap_dss_device *dssdev, bool enable);
>  	int (*get_te)(struct omap_dss_device *dssdev);
> -
> -	int (*memory_read)(struct omap_dss_device *dssdev,
> -			void *buf, size_t size,
> -			u16 x, u16 y, u16 w, u16 h);
>  };
>  
>  struct dss_device *omapdss_get_dss(void);

-- 
Regards,

Laurent Pinchart
