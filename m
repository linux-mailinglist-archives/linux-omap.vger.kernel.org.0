Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 429712AB41F
	for <lists+linux-omap@lfdr.de>; Mon,  9 Nov 2020 10:57:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729079AbgKIJ5i (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 9 Nov 2020 04:57:38 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:40314 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727183AbgKIJ5i (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 9 Nov 2020 04:57:38 -0500
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 807BEB2B;
        Mon,  9 Nov 2020 10:57:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1604915855;
        bh=0qNJ1xBp3/MdEscbpbSw9qyLFfefR1RMS9DvL+hYZVA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=eOF+zZoj2fHOZFKaESjlJQUhMeiRXgPVtioMgJP+zYZaAwTYcStSbp1gEnFL1st5Y
         PiaauyMO7kkttqbSGVhbyrn5RHo5p156/YubmDPtu6IukMx/8cnWqmnClMqv6xoW0l
         jv52+lHe5l/FCPlsnI2Xb1a8rM4KZN52sGDcUHEs=
Date:   Mon, 9 Nov 2020 11:57:32 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Tomi Valkeinen <tomi.valkeinen@ti.com>
Cc:     Sebastian Reichel <sre@kernel.org>,
        Nikhil Devshatwar <nikhil.nd@ti.com>,
        linux-omap@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Sekhar Nori <nsekhar@ti.com>, Tony Lindgren <tony@atomide.com>,
        "H . Nikolaus Schaller" <hns@goldelico.com>,
        Sebastian Reichel <sebastian.reichel@collabora.com>
Subject: Re: [PATCH v3 28/56] drm/omap: dsi: untangle ulps ops from
 enable/disable
Message-ID: <20201109095732.GY6029@pendragon.ideasonboard.com>
References: <20201105120333.947408-1-tomi.valkeinen@ti.com>
 <20201105120333.947408-29-tomi.valkeinen@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20201105120333.947408-29-tomi.valkeinen@ti.com>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Tomi and Sebastian,

Thank you for the patch.

On Thu, Nov 05, 2020 at 02:03:05PM +0200, Tomi Valkeinen wrote:
> From: Sebastian Reichel <sebastian.reichel@collabora.com>
> 
> Create a custom function pointer for ULPS and use it instead of
> reusing disable/enable functions for ULPS mode switch. This allows
> us to use the common disable/enable functions pointers for DSI.
> 
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
> ---
>  .../gpu/drm/omapdrm/displays/panel-dsi-cm.c   |  8 ++--
>  drivers/gpu/drm/omapdrm/dss/dsi.c             | 42 ++++++++++++++-----
>  drivers/gpu/drm/omapdrm/dss/omapdss.h         |  5 +--
>  3 files changed, 38 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c b/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c
> index 4be0c9dbcc43..78247dcb1848 100644
> --- a/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c
> +++ b/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c
> @@ -233,7 +233,7 @@ static int dsicm_enter_ulps(struct panel_drv_data *ddata)
>  	if (r)
>  		goto err;
>  
> -	src->ops->dsi.disable(src, false, true);
> +	src->ops->dsi.ulps(src, true);
>  
>  	ddata->ulps_enabled = true;
>  
> @@ -258,7 +258,7 @@ static int dsicm_exit_ulps(struct panel_drv_data *ddata)
>  	if (!ddata->ulps_enabled)
>  		return 0;
>  
> -	src->ops->enable(src);
> +	src->ops->dsi.ulps(src, false);
>  	ddata->dsi->mode_flags &= ~MIPI_DSI_MODE_LPM;
>  
>  	r = _dsicm_enable_te(ddata, ddata->te_enabled);
> @@ -586,7 +586,7 @@ static int dsicm_power_on(struct panel_drv_data *ddata)
>  
>  	dsicm_hw_reset(ddata);
>  
> -	src->ops->dsi.disable(src, true, false);
> +	src->ops->disable(src);
>  err_regulators:
>  	r = regulator_bulk_disable(DCS_REGULATOR_SUPPLY_NUM, ddata->supplies);
>  	if (r)
> @@ -612,7 +612,7 @@ static void dsicm_power_off(struct panel_drv_data *ddata)
>  		dsicm_hw_reset(ddata);
>  	}
>  
> -	src->ops->dsi.disable(src, true, false);
> +	src->ops->disable(src);
>  
>  	r = regulator_bulk_disable(DCS_REGULATOR_SUPPLY_NUM, ddata->supplies);
>  	if (r)
> diff --git a/drivers/gpu/drm/omapdrm/dss/dsi.c b/drivers/gpu/drm/omapdrm/dss/dsi.c
> index d54b743c2b48..937362ade4b4 100644
> --- a/drivers/gpu/drm/omapdrm/dss/dsi.c
> +++ b/drivers/gpu/drm/omapdrm/dss/dsi.c
> @@ -4055,13 +4055,10 @@ static void dsi_display_uninit_dsi(struct dsi_data *dsi, bool disconnect_lanes,
>  	}
>  }
>  
> -static void dsi_display_enable(struct omap_dss_device *dssdev)
> +static void dsi_display_ulps_enable(struct dsi_data *dsi)
>  {
> -	struct dsi_data *dsi = to_dsi_data(dssdev);
>  	int r;
>  
> -	DSSDBG("dsi_display_enable\n");
> -
>  	WARN_ON(!dsi_bus_is_locked(dsi));
>  
>  	mutex_lock(&dsi->lock);
> @@ -4084,16 +4081,19 @@ static void dsi_display_enable(struct omap_dss_device *dssdev)
>  	dsi_runtime_put(dsi);
>  err_get_dsi:
>  	mutex_unlock(&dsi->lock);
> -	DSSDBG("dsi_display_enable FAILED\n");
> +	DSSDBG("dsi_display_ulps_enable FAILED\n");
>  }
>  
> -static void dsi_display_disable(struct omap_dss_device *dssdev,
> -		bool disconnect_lanes, bool enter_ulps)
> +static void dsi_display_enable(struct omap_dss_device *dssdev)
>  {
>  	struct dsi_data *dsi = to_dsi_data(dssdev);
> +	DSSDBG("dsi_display_enable\n");
> +	dsi_display_ulps_enable(dsi);
> +}
>  
> -	DSSDBG("dsi_display_disable\n");
> -
> +static void dsi_display_ulps_disable(struct dsi_data *dsi,
> +		bool disconnect_lanes, bool enter_ulps)
> +{
>  	WARN_ON(!dsi_bus_is_locked(dsi));
>  
>  	mutex_lock(&dsi->lock);
> @@ -4110,6 +4110,27 @@ static void dsi_display_disable(struct omap_dss_device *dssdev,
>  	mutex_unlock(&dsi->lock);
>  }
>  
> +static void dsi_display_disable(struct omap_dss_device *dssdev)
> +{
> +	struct dsi_data *dsi = to_dsi_data(dssdev);
> +
> +	DSSDBG("dsi_display_disable\n");
> +
> +	dsi_display_ulps_disable(dsi, true, false);
> +}
> +
> +static void dsi_ulps(struct omap_dss_device *dssdev, bool enable)
> +{
> +	struct dsi_data *dsi = to_dsi_data(dssdev);
> +
> +	DSSDBG("dsi_ulps\n");
> +
> +	if (enable)
> +		dsi_display_ulps_disable(dsi, false, true);
> +	else
> +		dsi_display_ulps_enable(dsi);

The names are fairly confusing. I would expect
dsi_display_ulps_disable() to disable ULPS mode.

> +}
> +
>  static int dsi_enable_te(struct dsi_data *dsi, bool enable)
>  {
>  	dsi->te_enabled = enable;
> @@ -4812,9 +4833,10 @@ static const struct omap_dss_device_ops dsi_ops = {
>  	.connect = dsi_connect,
>  	.disconnect = dsi_disconnect,
>  	.enable = dsi_display_enable,
> +	.disable = dsi_display_disable,
>  
>  	.dsi = {
> -		.disable = dsi_display_disable,
> +		.ulps = dsi_ulps,
>  
>  		.set_config = dsi_set_config,
>  
> diff --git a/drivers/gpu/drm/omapdrm/dss/omapdss.h b/drivers/gpu/drm/omapdrm/dss/omapdss.h
> index 43eba2ea1f96..0d82ba34ca89 100644
> --- a/drivers/gpu/drm/omapdrm/dss/omapdss.h
> +++ b/drivers/gpu/drm/omapdrm/dss/omapdss.h
> @@ -281,10 +281,9 @@ struct omap_dss_writeback_info {
>  };
>  
>  struct omapdss_dsi_ops {
> -	void (*disable)(struct omap_dss_device *dssdev, bool disconnect_lanes,
> -			bool enter_ulps);
> -
>  	/* bus configuration */
> +	void (*ulps)(struct omap_dss_device *dssdev, bool enable);
> +
>  	int (*set_config)(struct omap_dss_device *dssdev,
>  			const struct omap_dss_dsi_config *cfg);
>  

-- 
Regards,

Laurent Pinchart
