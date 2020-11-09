Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BE2FA2AB589
	for <lists+linux-omap@lfdr.de>; Mon,  9 Nov 2020 11:54:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727915AbgKIKy6 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 9 Nov 2020 05:54:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57572 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727077AbgKIKy6 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 9 Nov 2020 05:54:58 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7ECB5C0613CF
        for <linux-omap@vger.kernel.org>; Mon,  9 Nov 2020 02:54:58 -0800 (PST)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 16C40B2B;
        Mon,  9 Nov 2020 11:54:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1604919297;
        bh=yIAv6NAaHXU/KL9rKq/2IEAKkZfLGk11EuKlw89PXZA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=OKoo5wRdMq3dY2r1u9wiNO1ERDRdY2cRk/VdtG05NbkgUHFBexqaI6KbbO73M1oLf
         J4lfNH+zJFpithhH0+Bmb7u8jxttR8tsYRxMEn0hl5ccDW6tbWDhk3Sk07KvgN0X1X
         syUMN3d921PMBDC1yCXLFtJ82GwCMLqbprswAdMc=
Date:   Mon, 9 Nov 2020 12:54:53 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Tomi Valkeinen <tomi.valkeinen@ti.com>
Cc:     Sebastian Reichel <sre@kernel.org>,
        Nikhil Devshatwar <nikhil.nd@ti.com>,
        linux-omap@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Sekhar Nori <nsekhar@ti.com>, Tony Lindgren <tony@atomide.com>,
        "H . Nikolaus Schaller" <hns@goldelico.com>,
        Sebastian Reichel <sebastian.reichel@collabora.com>
Subject: Re: [PATCH v3 41/56] drm/omap: dsi: Register a drm_bridge
Message-ID: <20201109105453.GL6029@pendragon.ideasonboard.com>
References: <20201105120333.947408-1-tomi.valkeinen@ti.com>
 <20201105120333.947408-42-tomi.valkeinen@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20201105120333.947408-42-tomi.valkeinen@ti.com>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Tomi and Sebastian,

Thank you for the patch.

On Thu, Nov 05, 2020 at 02:03:18PM +0200, Tomi Valkeinen wrote:
> From: Sebastian Reichel <sebastian.reichel@collabora.com>
> 
> In order to integrate with a chain of drm_bridge, the internal DSI
> output has to expose its operations through the drm_bridge API.
> Register a bridge at initialisation time to do so and remove the
> omap_dss_device operations that are now unused.
> 
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/gpu/drm/omapdrm/dss/dsi.c | 134 ++++++++++++++++++++----------
>  1 file changed, 89 insertions(+), 45 deletions(-)
> 
> diff --git a/drivers/gpu/drm/omapdrm/dss/dsi.c b/drivers/gpu/drm/omapdrm/dss/dsi.c
> index f643321434e9..bbcdb62e1571 100644
> --- a/drivers/gpu/drm/omapdrm/dss/dsi.c
> +++ b/drivers/gpu/drm/omapdrm/dss/dsi.c
> @@ -35,6 +35,7 @@
>  #include <linux/component.h>
>  #include <linux/sys_soc.h>
>  
> +#include <drm/drm_bridge.h>
>  #include <drm/drm_mipi_dsi.h>
>  #include <drm/drm_panel.h>
>  #include <video/mipi_display.h>
> @@ -437,6 +438,7 @@ struct dsi_data {
>  	struct omap_dss_dsi_videomode_timings vm_timings;
>  
>  	struct omap_dss_device output;
> +	struct drm_bridge bridge;
>  };
>  
>  struct dsi_packet_sent_handler_data {
> @@ -449,6 +451,9 @@ static bool dsi_perf;
>  module_param(dsi_perf, bool, 0644);
>  #endif
>  
> +#define drm_bridge_to_dsi(bridge) \
> +	container_of(bridge, struct dsi_data, bridge)
> +
>  static inline struct dsi_data *to_dsi_data(struct omap_dss_device *dssdev)
>  {
>  	return dev_get_drvdata(dssdev->dev);
> @@ -5006,50 +5011,7 @@ static int dsi_get_clocks(struct dsi_data *dsi)
>  	return 0;
>  }
>  
> -static void dsi_set_timings(struct omap_dss_device *dssdev,
> -			    const struct drm_display_mode *mode)
> -{
> -	DSSDBG("dsi_set_timings\n");
> -	dsi_set_config(dssdev, mode);
> -}
> -
> -static int dsi_check_timings(struct omap_dss_device *dssdev,
> -			     struct drm_display_mode *mode)
> -{
> -	struct dsi_data *dsi = to_dsi_data(dssdev);
> -	struct dsi_clk_calc_ctx ctx;
> -	int r;
> -
> -	DSSDBG("dsi_check_timings\n");
> -
> -	mutex_lock(&dsi->lock);
> -	r = __dsi_calc_config(dsi, mode, &ctx);
> -	mutex_unlock(&dsi->lock);
> -
> -	return r;
> -}
> -
> -static int dsi_connect(struct omap_dss_device *src,
> -		       struct omap_dss_device *dst)
> -{
> -	return omapdss_device_connect(dst->dss, dst, dst->next);
> -}
> -
> -static void dsi_disconnect(struct omap_dss_device *src,
> -			   struct omap_dss_device *dst)
> -{
> -	omapdss_device_disconnect(dst, dst->next);
> -}
> -
>  static const struct omap_dss_device_ops dsi_ops = {
> -	.connect = dsi_connect,
> -	.disconnect = dsi_disconnect,
> -	.enable = dsi_enable_video_outputs,
> -	.disable = dsi_disable_video_outputs,
> -
> -	.check_timings = dsi_check_timings,
> -	.set_timings = dsi_set_timings,
> -
>  	.dsi = {
>  		.update = dsi_update_all,
>  		.is_video_mode = dsi_is_video_mode,
> @@ -5393,6 +5355,83 @@ static const struct component_ops dsi_component_ops = {
>  	.unbind	= dsi_unbind,
>  };
>  
> +/* -----------------------------------------------------------------------------
> + * DRM Bridge Operations
> + */
> +
> +static int dsi_bridge_attach(struct drm_bridge *bridge,
> +			     enum drm_bridge_attach_flags flags)
> +{
> +	struct dsi_data *dsi = drm_bridge_to_dsi(bridge);
> +
> +	if (!(flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR))
> +		return -EINVAL;
> +
> +	return drm_bridge_attach(bridge->encoder, dsi->output.next_bridge,
> +				 bridge, flags);
> +}
> +
> +static enum drm_mode_status
> +dsi_bridge_mode_valid(struct drm_bridge *bridge,
> +		      const struct drm_display_info *info,
> +		      const struct drm_display_mode *mode)
> +{
> +	struct dsi_data *dsi = drm_bridge_to_dsi(bridge);
> +	struct dsi_clk_calc_ctx ctx;
> +	int r;
> +
> +	mutex_lock(&dsi->lock);
> +	r = __dsi_calc_config(dsi, mode, &ctx);
> +	mutex_unlock(&dsi->lock);
> +
> +	return r ? MODE_CLOCK_RANGE : MODE_OK;
> +}
> +
> +static void dsi_bridge_mode_set(struct drm_bridge *bridge,
> +				const struct drm_display_mode *mode,
> +				const struct drm_display_mode *adjusted_mode)
> +{
> +	struct dsi_data *dsi = drm_bridge_to_dsi(bridge);
> +
> +	dsi_set_config(&dsi->output, adjusted_mode);
> +}
> +
> +static void dsi_bridge_enable(struct drm_bridge *bridge)
> +{
> +	struct dsi_data *dsi = drm_bridge_to_dsi(bridge);
> +
> +	dsi_enable_video_outputs(&dsi->output);
> +}
> +
> +static void dsi_bridge_disable(struct drm_bridge *bridge)
> +{
> +	struct dsi_data *dsi = drm_bridge_to_dsi(bridge);
> +
> +	dsi_disable_video_outputs(&dsi->output);
> +}
> +
> +static const struct drm_bridge_funcs dsi_bridge_funcs = {
> +	.attach = dsi_bridge_attach,
> +	.mode_valid = dsi_bridge_mode_valid,
> +	.mode_set = dsi_bridge_mode_set,
> +	.enable = dsi_bridge_enable,
> +	.disable = dsi_bridge_disable,
> +};
> +
> +static void dsi_bridge_init(struct dsi_data *dsi)
> +{
> +	dsi->bridge.funcs = &dsi_bridge_funcs;
> +	dsi->bridge.of_node = dsi->host.dev->of_node;
> +	dsi->bridge.type = DRM_MODE_CONNECTOR_DSI;
> +
> +	drm_bridge_add(&dsi->bridge);
> +}
> +
> +static void dsi_bridge_cleanup(struct dsi_data *dsi)
> +{
> +	drm_bridge_remove(&dsi->bridge);
> +}
> +
>  /* -----------------------------------------------------------------------------
>   * Probe & Remove, Suspend & Resume
>   */
> @@ -5402,6 +5441,8 @@ static int dsi_init_output(struct dsi_data *dsi)
>  	struct omap_dss_device *out = &dsi->output;
>  	int r;
>  
> +	dsi_bridge_init(dsi);
> +
>  	out->dev = dsi->dev;
>  	out->id = dsi->module_id == 0 ?
>  			OMAP_DSS_OUTPUT_DSI1 : OMAP_DSS_OUTPUT_DSI2;
> @@ -5416,9 +5457,11 @@ static int dsi_init_output(struct dsi_data *dsi)
>  		       | DRM_BUS_FLAG_DE_HIGH
>  		       | DRM_BUS_FLAG_SYNC_DRIVE_NEGEDGE;
>  
> -	r = omapdss_device_init_output(out, NULL);
> -	if (r < 0)
> +	r = omapdss_device_init_output(out, &dsi->bridge);
> +	if (r < 0) {
> +		dsi_bridge_cleanup(dsi);
>  		return r;
> +	}
>  
>  	omapdss_device_register(out);
>  
> @@ -5431,6 +5474,7 @@ static void dsi_uninit_output(struct dsi_data *dsi)
>  
>  	omapdss_device_unregister(out);
>  	omapdss_device_cleanup_output(out);
> +	dsi_bridge_cleanup(dsi);
>  }
>  
>  static int dsi_probe_of(struct dsi_data *dsi)

-- 
Regards,

Laurent Pinchart
