Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 92A332AB39F
	for <lists+linux-omap@lfdr.de>; Mon,  9 Nov 2020 10:32:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725854AbgKIJcv (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 9 Nov 2020 04:32:51 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:40088 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726176AbgKIJcv (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 9 Nov 2020 04:32:51 -0500
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id BC446B2B;
        Mon,  9 Nov 2020 10:32:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1604914368;
        bh=QZM8pWa3XxAYZ/jFdcXufIqaoC5vUkVqklUwQthkAY0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ZT/OyyJYYoo+ftRVZuQcbYex0j660Q0YDT8LJj+92QfV64CitInRH7PbVbvzqBS2d
         lY56r0xnldU+eXHVQDLkxeJCjTEGyxk79c8koDKCL7hUJPv/jHg2yOsLW6P+6tPpJ1
         E5e0jWuS6ow2Tkz34MlwfZxBE3aWNWG2ZuzL6XFo=
Date:   Mon, 9 Nov 2020 11:32:45 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Tomi Valkeinen <tomi.valkeinen@ti.com>
Cc:     Sebastian Reichel <sre@kernel.org>,
        Nikhil Devshatwar <nikhil.nd@ti.com>,
        linux-omap@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Sekhar Nori <nsekhar@ti.com>, Tony Lindgren <tony@atomide.com>,
        "H . Nikolaus Schaller" <hns@goldelico.com>,
        Sebastian Reichel <sebastian.reichel@collabora.com>
Subject: Re: [PATCH v3 26/56] drm/omap: dsi: drop custom enable_te() API
Message-ID: <20201109093245.GW6029@pendragon.ideasonboard.com>
References: <20201105120333.947408-1-tomi.valkeinen@ti.com>
 <20201105120333.947408-27-tomi.valkeinen@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20201105120333.947408-27-tomi.valkeinen@ti.com>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Tomi and Sebastian,

Thank you for the patch.

On Thu, Nov 05, 2020 at 02:03:03PM +0200, Tomi Valkeinen wrote:
> From: Sebastian Reichel <sebastian.reichel@collabora.com>
> 
> Instead of using the custon enable_te() API, this automatically

s/custon/custom/

> enables/disables TE core support when a matching packet is send

s/send/sent/

> to the panel.
> 
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  .../gpu/drm/omapdrm/displays/panel-dsi-cm.c   |  3 --
>  drivers/gpu/drm/omapdrm/dss/dsi.c             | 34 ++++++++++++++-----
>  drivers/gpu/drm/omapdrm/dss/omapdss.h         |  2 --
>  3 files changed, 25 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c b/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c
> index 43f63b5a120b..dc2c045cc6b0 100644
> --- a/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c
> +++ b/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c
> @@ -772,7 +772,6 @@ static int dsicm_update(struct omap_dss_device *dssdev,
>  
>  static int _dsicm_enable_te(struct panel_drv_data *ddata, bool enable)
>  {
> -	struct omap_dss_device *src = ddata->src;
>  	struct mipi_dsi_device *dsi = ddata->dsi;
>  	int r;
>  
> @@ -781,8 +780,6 @@ static int _dsicm_enable_te(struct panel_drv_data *ddata, bool enable)
>  	else
>  		r = mipi_dsi_dcs_set_tear_off(dsi);
>  
> -	src->ops->dsi.enable_te(src, enable);
> -
>  	/* possible panel bug */
>  	msleep(100);
>  
> diff --git a/drivers/gpu/drm/omapdrm/dss/dsi.c b/drivers/gpu/drm/omapdrm/dss/dsi.c
> index 921e7a1e1014..41431ca34568 100644
> --- a/drivers/gpu/drm/omapdrm/dss/dsi.c
> +++ b/drivers/gpu/drm/omapdrm/dss/dsi.c
> @@ -4110,10 +4110,8 @@ static void dsi_display_disable(struct omap_dss_device *dssdev,
>  	mutex_unlock(&dsi->lock);
>  }
>  
> -static int dsi_enable_te(struct omap_dss_device *dssdev, bool enable)
> +static int dsi_enable_te(struct dsi_data *dsi, bool enable)
>  {
> -	struct dsi_data *dsi = to_dsi_data(dssdev);
> -
>  	dsi->te_enabled = enable;
>  
>  	if (dsi->te_gpio) {
> @@ -4723,6 +4721,7 @@ static ssize_t omap_dsi_host_transfer(struct mipi_dsi_host *host,
>  {
>  	struct dsi_data *dsi = host_to_omap(host);
>  	struct omap_dss_device *dssdev = &dsi->output;
> +	int r;
>  
>  	if (!!(msg->flags & MIPI_DSI_MSG_USE_LPM) != dsi->in_lp_mode) {
>  		dsi_vc_enable_hs(dssdev, msg->channel,
> @@ -4739,16 +4738,35 @@ static ssize_t omap_dsi_host_transfer(struct mipi_dsi_host *host,
>  	case MIPI_DSI_DCS_LONG_WRITE:
>  	case MIPI_DSI_SET_MAXIMUM_RETURN_PACKET_SIZE:
>  	case MIPI_DSI_NULL_PACKET:
> -		return dsi_vc_write_common(dssdev, msg);
> +		r = dsi_vc_write_common(dssdev, msg);
> +		break;
>  	case MIPI_DSI_GENERIC_READ_REQUEST_0_PARAM:
>  	case MIPI_DSI_GENERIC_READ_REQUEST_1_PARAM:
>  	case MIPI_DSI_GENERIC_READ_REQUEST_2_PARAM:
> -		return dsi_vc_generic_read(dssdev, msg);
> +		r = dsi_vc_generic_read(dssdev, msg);
> +		break;
>  	case MIPI_DSI_DCS_READ:
> -		return dsi_vc_dcs_read(dssdev, msg);
> +		r = dsi_vc_dcs_read(dssdev, msg);
> +		break;
> +	default:
> +		r = -EINVAL;
> +		break;
>  	}
>  
> -	return -EINVAL;
> +	if (r < 0)
> +		return r;
> +
> +	if (msg->type == MIPI_DSI_DCS_SHORT_WRITE ||
> +	    msg->type == MIPI_DSI_DCS_SHORT_WRITE_PARAM) {
> +		u8 cmd = ((u8 *)msg->tx_buf)[0];
> +
> +		if (cmd == MIPI_DCS_SET_TEAR_OFF)
> +			dsi_enable_te(dsi, false);
> +		else if (cmd == MIPI_DCS_SET_TEAR_ON)
> +			dsi_enable_te(dsi, true);
> +	}
> +
> +	return 0;
>  }
>  
>  static int dsi_get_clocks(struct dsi_data *dsi)
> @@ -4795,8 +4813,6 @@ static const struct omap_dss_device_ops dsi_ops = {
>  		.disable_video_output = dsi_disable_video_output,
>  
>  		.update = dsi_update,
> -
> -		.enable_te = dsi_enable_te,
>  	},
>  };
>  
> diff --git a/drivers/gpu/drm/omapdrm/dss/omapdss.h b/drivers/gpu/drm/omapdrm/dss/omapdss.h
> index 2d44a8e32fcc..1520a5f752b7 100644
> --- a/drivers/gpu/drm/omapdrm/dss/omapdss.h
> +++ b/drivers/gpu/drm/omapdrm/dss/omapdss.h
> @@ -288,8 +288,6 @@ struct omapdss_dsi_ops {
>  	int (*set_config)(struct omap_dss_device *dssdev,
>  			const struct omap_dss_dsi_config *cfg);
>  
> -	int (*enable_te)(struct omap_dss_device *dssdev, bool enable);
> -
>  	int (*update)(struct omap_dss_device *dssdev, int channel,
>  			void (*callback)(int, void *), void *data);
>  

-- 
Regards,

Laurent Pinchart
