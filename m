Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6F7222AB2B7
	for <lists+linux-omap@lfdr.de>; Mon,  9 Nov 2020 09:49:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727077AbgKIIt1 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 9 Nov 2020 03:49:27 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:39710 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726482AbgKIIt1 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 9 Nov 2020 03:49:27 -0500
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id ADB902FE;
        Mon,  9 Nov 2020 09:49:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1604911764;
        bh=7esOE86lh6VNU6+Dmt9NNDLKtswT7FtPqnqUMYm5fGo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=dNtXnhJko1nEv67p03XlH7DHuOWZSbvSBxzWexzcgcQzIaIXpPy+/ZlhQB5vlV9rJ
         zvCRKR/GeWX2XaOczNSE5Hs3M9sItaXjYwBqtE8d5k+HrS6khc4vyEbSHnJopodcTs
         OYclxBhmBphluRs2QKhHRRkwmJBzqePv/UuZX9E0=
Date:   Mon, 9 Nov 2020 10:49:21 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Tomi Valkeinen <tomi.valkeinen@ti.com>
Cc:     Sebastian Reichel <sre@kernel.org>,
        Nikhil Devshatwar <nikhil.nd@ti.com>,
        linux-omap@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Sekhar Nori <nsekhar@ti.com>, Tony Lindgren <tony@atomide.com>,
        "H . Nikolaus Schaller" <hns@goldelico.com>,
        Sebastian Reichel <sebastian.reichel@collabora.com>
Subject: Re: [PATCH v3 22/56] drm/omap: dsi: use pixel-format and mode from
 attach
Message-ID: <20201109084921.GS6029@pendragon.ideasonboard.com>
References: <20201105120333.947408-1-tomi.valkeinen@ti.com>
 <20201105120333.947408-23-tomi.valkeinen@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20201105120333.947408-23-tomi.valkeinen@ti.com>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Tomi and Sebastian,

Thank you for the patch.

On Thu, Nov 05, 2020 at 02:02:59PM +0200, Tomi Valkeinen wrote:
> From: Sebastian Reichel <sebastian.reichel@collabora.com>
> 
> In order to reduce the amount of custom functionality, this moves
> handling of pixel format and DSI mode from set_config() to dsi
> attach.
> 
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
> ---
>  .../gpu/drm/omapdrm/displays/panel-dsi-cm.c   |  2 --
>  drivers/gpu/drm/omapdrm/dss/dsi.c             | 31 ++++++++++++-------
>  2 files changed, 19 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c b/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c
> index a9609eed6bfa..2e9de33fc8d4 100644
> --- a/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c
> +++ b/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c
> @@ -550,8 +550,6 @@ static int dsicm_power_on(struct panel_drv_data *ddata)
>  	u8 id1, id2, id3;
>  	int r;
>  	struct omap_dss_dsi_config dsi_config = {
> -		.mode = OMAP_DSS_DSI_CMD_MODE,
> -		.pixel_format = MIPI_DSI_FMT_RGB888,
>  		.vm = &ddata->vm,
>  		.hs_clk_min = 150000000,
>  		.hs_clk_max = 300000000,
> diff --git a/drivers/gpu/drm/omapdrm/dss/dsi.c b/drivers/gpu/drm/omapdrm/dss/dsi.c
> index a16427f3bc23..e341aca92462 100644
> --- a/drivers/gpu/drm/omapdrm/dss/dsi.c
> +++ b/drivers/gpu/drm/omapdrm/dss/dsi.c
> @@ -4579,24 +4579,19 @@ static int dsi_set_config(struct omap_dss_device *dssdev,
>  {
>  	struct dsi_data *dsi = to_dsi_data(dssdev);
>  	struct dsi_clk_calc_ctx ctx;
> +	struct omap_dss_dsi_config cfg = *config;
>  	bool ok;
>  	int r;
>  
>  	mutex_lock(&dsi->lock);
>  
> -	dsi->pix_fmt = config->pixel_format;
> -	dsi->mode = config->mode;
> +	cfg.mode = dsi->mode;
> +	cfg.pixel_format = dsi->pix_fmt;
>  
> -	if (mipi_dsi_pixel_format_to_bpp(dsi->pix_fmt) < 0) {
> -		DSSERR("invalid pixel format\n");
> -		r = -EINVAL;
> -		goto err;
> -	}
> -
> -	if (config->mode == OMAP_DSS_DSI_VIDEO_MODE)
> -		ok = dsi_vm_calc(dsi, config, &ctx);
> +	if (dsi->mode == OMAP_DSS_DSI_VIDEO_MODE)
> +		ok = dsi_vm_calc(dsi, &cfg, &ctx);
>  	else
> -		ok = dsi_cm_calc(dsi, config, &ctx);
> +		ok = dsi_cm_calc(dsi, &cfg, &ctx);
>  
>  	if (!ok) {
>  		DSSERR("failed to find suitable DSI clock settings\n");
> @@ -4607,7 +4602,7 @@ static int dsi_set_config(struct omap_dss_device *dssdev,
>  	dsi_pll_calc_dsi_fck(dsi, &ctx.dsi_cinfo);
>  
>  	r = dsi_lp_clock_calc(ctx.dsi_cinfo.clkout[HSDIV_DSI],
> -		config->lp_clk_min, config->lp_clk_max, &dsi->user_lp_cinfo);
> +		cfg.lp_clk_min, cfg.lp_clk_max, &dsi->user_lp_cinfo);
>  	if (r) {
>  		DSSERR("failed to find suitable DSI LP clock settings\n");
>  		goto err;
> @@ -4785,7 +4780,19 @@ static int omap_dsi_host_attach(struct mipi_dsi_host *host,
>  		return -EBUSY;
>  	}
>  
> +	if (mipi_dsi_pixel_format_to_bpp(client->format) < 0) {
> +		DSSERR("invalid pixel format\n");
> +		return -EINVAL;
> +	}
> +
>  	dsi->vc[channel].dest = client;
> +
> +	dsi->pix_fmt = client->format;

Does this mean that all clients must use the same pixel format ? Do we
even support multiple clients ? If no the VC allocation could be
simplified.

> +	if (client->mode_flags & MIPI_DSI_MODE_VIDEO)
> +		dsi->mode = OMAP_DSS_DSI_VIDEO_MODE;
> +	else
> +		dsi->mode = OMAP_DSS_DSI_CMD_MODE;
> +
>  	return 0;
>  }
>  

-- 
Regards,

Laurent Pinchart
