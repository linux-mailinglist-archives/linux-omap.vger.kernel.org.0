Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3E2862AB4A9
	for <lists+linux-omap@lfdr.de>; Mon,  9 Nov 2020 11:20:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727077AbgKIKUd (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 9 Nov 2020 05:20:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52174 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726176AbgKIKUd (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 9 Nov 2020 05:20:33 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE25AC0613CF
        for <linux-omap@vger.kernel.org>; Mon,  9 Nov 2020 02:20:32 -0800 (PST)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 326BFB2B;
        Mon,  9 Nov 2020 11:20:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1604917231;
        bh=tcX+qRLw0uzDjXYmlsPSxct4ho087eCBavQN2lOAuLE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=hDKCAI1i3aZem1YcpX2y68P8e/tLnFDA5W6DE3w8kRg51siSwyt3N0vPBchgHMO04
         BnaA/ghizZoc9sje92JLPReSkBRh19CnkK+JYaQf+PWNkZlkm8NJxH/HLJeSaCxpSw
         XFeoVtA/SNONrI3UJH4dWE+C1HDDKr36JSOTk2aw=
Date:   Mon, 9 Nov 2020 12:20:27 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Tomi Valkeinen <tomi.valkeinen@ti.com>
Cc:     Sebastian Reichel <sre@kernel.org>,
        Nikhil Devshatwar <nikhil.nd@ti.com>,
        linux-omap@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Sekhar Nori <nsekhar@ti.com>, Tony Lindgren <tony@atomide.com>,
        "H . Nikolaus Schaller" <hns@goldelico.com>,
        Sebastian Reichel <sebastian.reichel@collabora.com>
Subject: Re: [PATCH v3 32/56] drm/omap: dsi: drop custom panel capability
 support
Message-ID: <20201109102027.GC6029@pendragon.ideasonboard.com>
References: <20201105120333.947408-1-tomi.valkeinen@ti.com>
 <20201105120333.947408-33-tomi.valkeinen@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20201105120333.947408-33-tomi.valkeinen@ti.com>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Tomi and Sebastian,

Thank you for the patch.

On Thu, Nov 05, 2020 at 02:03:09PM +0200, Tomi Valkeinen wrote:
> From: Sebastian Reichel <sebastian.reichel@collabora.com>
> 
> Due to previous changes the DSI encoder gets the capabilities
> via DSI client's mode_flags and no longer needs the omapdss
> specific caps. The core code now checks if the DSI encoder
> is actually configured into command mode instead of just checking
> the panel capabilities.
> 
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
> ---
>  drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c |  3 ---
>  drivers/gpu/drm/omapdrm/dss/dsi.c               |  8 ++++++++
>  drivers/gpu/drm/omapdrm/dss/omapdss.h           |  8 +-------
>  drivers/gpu/drm/omapdrm/omap_crtc.c             | 17 ++++++++---------
>  4 files changed, 17 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c b/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c
> index 45d417870498..d9b3444b4faf 100644
> --- a/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c
> +++ b/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c
> @@ -599,9 +599,6 @@ static int dsicm_probe(struct mipi_dsi_device *dsi)
>  	dssdev->of_port = 0;
>  	dssdev->ops_flags = OMAP_DSS_DEVICE_OP_MODES;
>  
> -	dssdev->caps = OMAP_DSS_DISPLAY_CAP_MANUAL_UPDATE |
> -		OMAP_DSS_DISPLAY_CAP_TEAR_ELIM;
> -
>  	omapdss_display_init(dssdev);
>  	omapdss_device_register(dssdev);
>  
> diff --git a/drivers/gpu/drm/omapdrm/dss/dsi.c b/drivers/gpu/drm/omapdrm/dss/dsi.c
> index 0aa0d21cf896..620cef8bb1f2 100644
> --- a/drivers/gpu/drm/omapdrm/dss/dsi.c
> +++ b/drivers/gpu/drm/omapdrm/dss/dsi.c
> @@ -4727,6 +4727,13 @@ static bool dsi_vm_calc(struct dsi_data *dsi,
>  			dsi_vm_calc_pll_cb, ctx);
>  }
>  
> +static bool dsi_is_video_mode(struct omap_dss_device *dssdev)
> +{
> +	struct dsi_data *dsi = to_dsi_data(dssdev);
> +
> +	return (dsi->mode == OMAP_DSS_DSI_VIDEO_MODE);

No need for parentheses.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> +}
> +
>  static int dsi_set_config(struct omap_dss_device *dssdev,
>  		const struct omap_dss_dsi_config *config)
>  {
> @@ -4947,6 +4954,7 @@ static const struct omap_dss_device_ops dsi_ops = {
>  		.disable_video_output = dsi_disable_video_output,
>  
>  		.update = dsi_update_all,
> +		.is_video_mode = dsi_is_video_mode,
>  	},
>  };
>  
> diff --git a/drivers/gpu/drm/omapdrm/dss/omapdss.h b/drivers/gpu/drm/omapdrm/dss/omapdss.h
> index de4c779c358a..4200611525d5 100644
> --- a/drivers/gpu/drm/omapdrm/dss/omapdss.h
> +++ b/drivers/gpu/drm/omapdrm/dss/omapdss.h
> @@ -123,11 +123,6 @@ enum omap_dss_dsi_mode {
>  	OMAP_DSS_DSI_VIDEO_MODE,
>  };
>  
> -enum omap_display_caps {
> -	OMAP_DSS_DISPLAY_CAP_MANUAL_UPDATE	= 1 << 0,
> -	OMAP_DSS_DISPLAY_CAP_TEAR_ELIM		= 1 << 1,
> -};
> -
>  enum omap_dss_display_state {
>  	OMAP_DSS_DISPLAY_DISABLED = 0,
>  	OMAP_DSS_DISPLAY_ACTIVE,
> @@ -282,6 +277,7 @@ struct omap_dss_writeback_info {
>  
>  struct omapdss_dsi_ops {
>  	int (*update)(struct omap_dss_device *dssdev);
> +	bool (*is_video_mode)(struct omap_dss_device *dssdev);
>  
>  	/* legacy API used by omapdss panels */
>  	int (*set_config)(struct omap_dss_device *dssdev,
> @@ -354,8 +350,6 @@ struct omap_dss_device {
>  	unsigned long ops_flags;
>  	u32 bus_flags;
>  
> -	enum omap_display_caps caps;
> -
>  	enum omap_dss_display_state state;
>  
>  	/* OMAP DSS output specific fields */
> diff --git a/drivers/gpu/drm/omapdrm/omap_crtc.c b/drivers/gpu/drm/omapdrm/omap_crtc.c
> index 3068e4fffa16..f6b968060cf0 100644
> --- a/drivers/gpu/drm/omapdrm/omap_crtc.c
> +++ b/drivers/gpu/drm/omapdrm/omap_crtc.c
> @@ -496,8 +496,7 @@ static enum drm_mode_status omap_crtc_mode_valid(struct drm_crtc *crtc,
>  	 * valid DISPC mode. DSI will calculate and configure the
>  	 * proper DISPC mode later.
>  	 */
> -	if (omap_crtc->pipe->output->next == NULL ||
> -	    omap_crtc->pipe->output->next->type != OMAP_DISPLAY_TYPE_DSI) {
> +	if (omap_crtc->pipe->output->type != OMAP_DISPLAY_TYPE_DSI) {
>  		r = priv->dispc_ops->mgr_check_timings(priv->dispc,
>  						       omap_crtc->channel,
>  						       &vm);
> @@ -549,17 +548,17 @@ static void omap_crtc_mode_set_nofb(struct drm_crtc *crtc)
>  static bool omap_crtc_is_manually_updated(struct drm_crtc *crtc)
>  {
>  	struct omap_crtc *omap_crtc = to_omap_crtc(crtc);
> -	struct omap_dss_device *display = omap_crtc->pipe->output->next;
> +	struct omap_dss_device *dssdev = omap_crtc->pipe->output;
>  
> -	if (!display)
> +	if (dssdev->type != OMAP_DISPLAY_TYPE_DSI ||
> +	    !dssdev->ops->dsi.is_video_mode)
>  		return false;
>  
> -	if (display->caps & OMAP_DSS_DISPLAY_CAP_MANUAL_UPDATE) {
> -		DBG("detected manually updated display!");
> -		return true;
> -	}
> +	if (dssdev->ops->dsi.is_video_mode(dssdev))
> +		return false;
>  
> -	return false;
> +	DBG("detected manually updated display!");
> +	return true;
>  }
>  
>  static int omap_crtc_atomic_check(struct drm_crtc *crtc,

-- 
Regards,

Laurent Pinchart
