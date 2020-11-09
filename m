Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0B39F2AB23C
	for <lists+linux-omap@lfdr.de>; Mon,  9 Nov 2020 09:14:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726176AbgKIIO4 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 9 Nov 2020 03:14:56 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:39206 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726127AbgKIIO4 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 9 Nov 2020 03:14:56 -0500
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id B43D6B2B;
        Mon,  9 Nov 2020 09:14:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1604909693;
        bh=d0DDRneslSyG2GQWj+VC/DzITZ6nO3R4jE+jJQWH5hY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=pj7WIVKF41wdw15ZGa5+BTb/3x/cr0R4VSE1uU4x1v2UgP/keu4wOPSP1t1kZh/qP
         5uBb1q+EVvrVdhYt9tUd+SPHG71QdewK6jA1LqJ0SuxdTZ3AVzAv16vg9JUrG7Cadk
         qIJ49UrEr5HN+HEPb1WoaYT8UCHTVE+qrj0eZ09M=
Date:   Mon, 9 Nov 2020 10:14:50 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Tomi Valkeinen <tomi.valkeinen@ti.com>
Cc:     Sebastian Reichel <sre@kernel.org>,
        Nikhil Devshatwar <nikhil.nd@ti.com>,
        linux-omap@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Sekhar Nori <nsekhar@ti.com>, Tony Lindgren <tony@atomide.com>,
        "H . Nikolaus Schaller" <hns@goldelico.com>,
        Sebastian Reichel <sebastian.reichel@collabora.com>
Subject: Re: [PATCH v3 09/56] drm/omap: dsi: drop virtual channel logic
Message-ID: <20201109081450.GE6029@pendragon.ideasonboard.com>
References: <20201105120333.947408-1-tomi.valkeinen@ti.com>
 <20201105120333.947408-10-tomi.valkeinen@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20201105120333.947408-10-tomi.valkeinen@ti.com>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Tomi and Sebastian,

Thank you for the patch.

On Thu, Nov 05, 2020 at 02:02:46PM +0200, Tomi Valkeinen wrote:
> From: Sebastian Reichel <sebastian.reichel@collabora.com>
> 
> This drops the virtual channel logic. Afterwards DSI clients
> request their channel number and get the virtual channel with
> the same number or -EBUSY if already in use.

It could be useful to explain the reason for this patch (which, if I
understand the patch correctly, is to replace dynamic allocation of
virtual channels with a fixed allocation by the DSI panel, I assume
because dynamic allocation isn't actually useful ?).

> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
> ---
>  .../gpu/drm/omapdrm/displays/panel-dsi-cm.c   | 11 ++---
>  drivers/gpu/drm/omapdrm/dss/dsi.c             | 46 ++++---------------
>  drivers/gpu/drm/omapdrm/dss/omapdss.h         |  4 +-
>  3 files changed, 12 insertions(+), 49 deletions(-)
> 
> diff --git a/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c b/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c
> index 8b2e80129bd8..ea76a89d1833 100644
> --- a/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c
> +++ b/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c
> @@ -768,19 +768,12 @@ static int dsicm_connect(struct omap_dss_device *src,
>  	struct device *dev = &ddata->pdev->dev;
>  	int r;
>  
> -	r = src->ops->dsi.request_vc(src, &ddata->channel);
> +	r = src->ops->dsi.request_vc(src, ddata->channel);
>  	if (r) {
>  		dev_err(dev, "failed to get virtual channel\n");
>  		return r;
>  	}
>  
> -	r = src->ops->dsi.set_vc_id(src, ddata->channel, TCH);
> -	if (r) {
> -		dev_err(dev, "failed to set VC_ID\n");
> -		src->ops->dsi.release_vc(src, ddata->channel);
> -		return r;
> -	}
> -
>  	ddata->src = src;
>  	return 0;
>  }
> @@ -1215,6 +1208,8 @@ static int dsicm_probe_of(struct platform_device *pdev)
>  	struct display_timing timing;
>  	int err;
>  
> +	ddata->channel = TCH;

I'd drop the macro, but no big deal.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> +
>  	ddata->reset_gpio = devm_gpiod_get(&pdev->dev, "reset", GPIOD_OUT_LOW);
>  	if (IS_ERR(ddata->reset_gpio)) {
>  		err = PTR_ERR(ddata->reset_gpio);
> diff --git a/drivers/gpu/drm/omapdrm/dss/dsi.c b/drivers/gpu/drm/omapdrm/dss/dsi.c
> index 2270730b16db..348be32505a2 100644
> --- a/drivers/gpu/drm/omapdrm/dss/dsi.c
> +++ b/drivers/gpu/drm/omapdrm/dss/dsi.c
> @@ -350,7 +350,6 @@ struct dsi_data {
>  		struct omap_dss_device *dssdev;
>  		enum fifo_size tx_fifo_size;
>  		enum fifo_size rx_fifo_size;
> -		int vc_id;
>  	} vc[4];
>  
>  	struct mutex lock;
> @@ -2579,7 +2578,7 @@ static inline void dsi_vc_write_long_header(struct dsi_data *dsi, int channel,
>  
>  	WARN_ON(!dsi_bus_is_locked(dsi));
>  
> -	data_id = data_type | dsi->vc[channel].vc_id << 6;
> +	data_id = data_type | channel << 6;
>  
>  	val = FLD_VAL(data_id, 7, 0) | FLD_VAL(len, 23, 8) |
>  		FLD_VAL(ecc, 31, 24);
> @@ -2683,7 +2682,7 @@ static int dsi_vc_send_short(struct dsi_data *dsi, int channel, u8 data_type,
>  		return -EINVAL;
>  	}
>  
> -	data_id = data_type | dsi->vc[channel].vc_id << 6;
> +	data_id = data_type | channel << 6;
>  
>  	r = (data_id << 0) | (data << 8) | (ecc << 24);
>  
> @@ -4789,45 +4788,19 @@ static enum omap_channel dsi_get_channel(struct dsi_data *dsi)
>  	}
>  }
>  
> -static int dsi_request_vc(struct omap_dss_device *dssdev, int *channel)
> +static int dsi_request_vc(struct omap_dss_device *dssdev, int channel)
>  {
>  	struct dsi_data *dsi = to_dsi_data(dssdev);
> -	int i;
> -
> -	for (i = 0; i < ARRAY_SIZE(dsi->vc); i++) {
> -		if (!dsi->vc[i].dssdev) {
> -			dsi->vc[i].dssdev = dssdev;
> -			*channel = i;
> -			return 0;
> -		}
> -	}
>  
> -	DSSERR("cannot get VC for display %s", dssdev->name);
> -	return -ENOSPC;
> -}
> -
> -static int dsi_set_vc_id(struct omap_dss_device *dssdev, int channel, int vc_id)
> -{
> -	struct dsi_data *dsi = to_dsi_data(dssdev);
> -
> -	if (vc_id < 0 || vc_id > 3) {
> -		DSSERR("VC ID out of range\n");
> -		return -EINVAL;
> -	}
> -
> -	if (channel < 0 || channel > 3) {
> -		DSSERR("Virtual Channel out of range\n");
> +	if (channel < 0 || channel > 3)
>  		return -EINVAL;
> -	}
>  
> -	if (dsi->vc[channel].dssdev != dssdev) {
> -		DSSERR("Virtual Channel not allocated to display %s\n",
> -			dssdev->name);
> -		return -EINVAL;
> +	if (dsi->vc[channel].dssdev) {
> +		DSSERR("cannot get VC for display %s", dssdev->name);
> +		return -EBUSY;
>  	}
>  
> -	dsi->vc[channel].vc_id = vc_id;
> -
> +	dsi->vc[channel].dssdev = dssdev;
>  	return 0;
>  }
>  
> @@ -4838,7 +4811,6 @@ static void dsi_release_vc(struct omap_dss_device *dssdev, int channel)
>  	if ((channel >= 0 && channel <= 3) &&
>  		dsi->vc[channel].dssdev == dssdev) {
>  		dsi->vc[channel].dssdev = NULL;
> -		dsi->vc[channel].vc_id = 0;
>  	}
>  }
>  
> @@ -4945,7 +4917,6 @@ static const struct omap_dss_device_ops dsi_ops = {
>  		.enable_te = dsi_enable_te,
>  
>  		.request_vc = dsi_request_vc,
> -		.set_vc_id = dsi_set_vc_id,
>  		.release_vc = dsi_release_vc,
>  
>  		.transfer = omap_dsi_transfer,
> @@ -5401,7 +5372,6 @@ static int dsi_probe(struct platform_device *pdev)
>  	for (i = 0; i < ARRAY_SIZE(dsi->vc); i++) {
>  		dsi->vc[i].source = DSI_VC_SOURCE_L4;
>  		dsi->vc[i].dssdev = NULL;
> -		dsi->vc[i].vc_id = 0;
>  	}
>  
>  	r = dsi_get_clocks(dsi);
> diff --git a/drivers/gpu/drm/omapdrm/dss/omapdss.h b/drivers/gpu/drm/omapdrm/dss/omapdss.h
> index 9ead877cb24c..40e1ce9e256e 100644
> --- a/drivers/gpu/drm/omapdrm/dss/omapdss.h
> +++ b/drivers/gpu/drm/omapdrm/dss/omapdss.h
> @@ -302,9 +302,7 @@ struct omapdss_dsi_ops {
>  	void (*disable_video_output)(struct omap_dss_device *dssdev,
>  			int channel);
>  
> -	int (*request_vc)(struct omap_dss_device *dssdev, int *channel);
> -	int (*set_vc_id)(struct omap_dss_device *dssdev, int channel,
> -			int vc_id);
> +	int (*request_vc)(struct omap_dss_device *dssdev, int channel);
>  	void (*release_vc)(struct omap_dss_device *dssdev, int channel);
>  
>  	/* data transfer */

-- 
Regards,

Laurent Pinchart
