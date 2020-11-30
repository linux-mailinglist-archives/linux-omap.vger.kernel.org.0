Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3222E2C8190
	for <lists+linux-omap@lfdr.de>; Mon, 30 Nov 2020 11:01:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726532AbgK3KBZ (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 30 Nov 2020 05:01:25 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:57246 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727105AbgK3KBZ (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 30 Nov 2020 05:01:25 -0500
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 32B61B26;
        Mon, 30 Nov 2020 11:00:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1606730442;
        bh=qlCyntnh/QGScA4pqkfugDGlRBhAJQNyRLZ8ov5DWNo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=PvMLvTg7LIF6+3Va5v/DBybWe6595B1NCIm8rbycA0tUSNAYnXcKQN4sTAXcVQv0M
         j/DBFfbeqrvaJ0ZyRax5b6XRjm7IrOHXL4O+MHCPZdnqN6JsWy6OdC3fibbi+HIW+I
         cB1JcMe9zqzAbH7AZJyreycdr0NOH3TZ6wHjhhW8=
Date:   Mon, 30 Nov 2020 12:00:34 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Tomi Valkeinen <tomi.valkeinen@ti.com>
Cc:     Sebastian Reichel <sre@kernel.org>,
        Nikhil Devshatwar <nikhil.nd@ti.com>,
        linux-omap@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Sekhar Nori <nsekhar@ti.com>, Tony Lindgren <tony@atomide.com>,
        hns@goldelico.com
Subject: Re: [PATCH v4 62/80] drm/omap: dsi: simplify VC handling
Message-ID: <20201130100034.GN4141@pendragon.ideasonboard.com>
References: <20201124124538.660710-1-tomi.valkeinen@ti.com>
 <20201124124538.660710-63-tomi.valkeinen@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20201124124538.660710-63-tomi.valkeinen@ti.com>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Tomi,

Thank you for the patch.

On Tue, Nov 24, 2020 at 02:45:20PM +0200, Tomi Valkeinen wrote:
> The VC handling has gotten quite tangled up. As the first step to clean
> it up, lets define that we only support a single DSI peripheral (which
> was really already the case), and we always use VC0 (define VC_DEFAULT
> 0) register block to send data to the peripheral.
> 
> We can thus have a single mipi_dsi_device pointer and remove the for

s/the for/the need for/ ?

> loops which made passes over all the four VCs (just the first one was
> ever used).
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/gpu/drm/omapdrm/dss/dsi.c | 49 ++++++++-----------------------
>  1 file changed, 13 insertions(+), 36 deletions(-)
> 
> diff --git a/drivers/gpu/drm/omapdrm/dss/dsi.c b/drivers/gpu/drm/omapdrm/dss/dsi.c
> index 746c2149fbbd..63338324c564 100644
> --- a/drivers/gpu/drm/omapdrm/dss/dsi.c
> +++ b/drivers/gpu/drm/omapdrm/dss/dsi.c
> @@ -360,9 +360,10 @@ struct dsi_data {
>  	bool vdds_dsi_enabled;
>  	struct regulator *vdds_dsi_reg;
>  
> +	struct mipi_dsi_device *dsidev;
> +
>  	struct {
>  		enum dsi_vc_source source;
> -		struct mipi_dsi_device *dest;
>  		enum fifo_size tx_fifo_size;
>  		enum fifo_size rx_fifo_size;
>  	} vc[4];
> @@ -452,6 +453,8 @@ static bool dsi_perf;
>  module_param(dsi_perf, bool, 0644);
>  #endif
>  
> +#define VC_DEFAULT 0
> +
>  #define drm_bridge_to_dsi(bridge) \
>  	container_of(bridge, struct dsi_data, bridge)
>  
> @@ -3716,16 +3719,11 @@ static void dsi_disable_video_output(struct omap_dss_device *dssdev, int channel
>  static void dsi_disable_video_outputs(struct omap_dss_device *dssdev)
>  {
>  	struct dsi_data *dsi = to_dsi_data(dssdev);
> -	unsigned int i;
>  
>  	dsi_bus_lock(dsi);
>  	dsi->video_enabled = false;
>  
> -	for (i = 0; i < 4; i++) {
> -		if (!dsi->vc[i].dest)
> -			continue;
> -		dsi_disable_video_output(dssdev, i);
> -	}
> +	dsi_disable_video_output(dssdev, VC_DEFAULT);
>  
>  	dsi_display_disable(dssdev);
>  
> @@ -3914,11 +3912,6 @@ static int dsi_update_channel(struct omap_dss_device *dssdev, int channel)
>  		goto err;
>  	}
>  
> -	if (!dsi->vc[channel].dest) {
> -		r = -ENODEV;
> -		goto err;
> -	}
> -
>  	if (dsi->vm.hactive == 0 || dsi->vm.vactive == 0) {
>  		r = -EINVAL;
>  		goto err;
> @@ -3954,16 +3947,7 @@ static int dsi_update_channel(struct omap_dss_device *dssdev, int channel)
>  
>  static int dsi_update_all(struct omap_dss_device *dssdev)
>  {
> -	unsigned int i;
> -	int r;
> -
> -	for (i = 0; i < 4; i++) {
> -		r = dsi_update_channel(dssdev, i);
> -		if (r && r != -ENODEV)
> -			return r;
> -	}
> -
> -	return r;
> +	return dsi_update_channel(dssdev, VC_DEFAULT);
>  }
>  
>  /* Display funcs */
> @@ -4191,17 +4175,12 @@ static void dsi_display_enable(struct omap_dss_device *dssdev)
>  static void dsi_enable_video_outputs(struct omap_dss_device *dssdev)
>  {
>  	struct dsi_data *dsi = to_dsi_data(dssdev);
> -	unsigned int i;
>  
>  	dsi_bus_lock(dsi);
>  
>  	dsi_display_enable(dssdev);
>  
> -	for (i = 0; i < 4; i++) {
> -		if (!dsi->vc[i].dest)
> -			continue;
> -		dsi_enable_video_output(dssdev, i);
> -	}
> +	dsi_enable_video_output(dssdev, VC_DEFAULT);
>  
>  	dsi->video_enabled = true;
>  
> @@ -5090,8 +5069,8 @@ static int omap_dsi_host_attach(struct mipi_dsi_host *host,
>  	if (channel > 3)
>  		return -EINVAL;
>  
> -	if (dsi->vc[channel].dest) {
> -		DSSERR("cannot get VC for display %s", dev_name(&client->dev));
> +	if (dsi->dsidev) {
> +		DSSERR("dsi client already attached\n");
>  		return -EBUSY;
>  	}
>  
> @@ -5112,7 +5091,7 @@ static int omap_dsi_host_attach(struct mipi_dsi_host *host,
>  		dsi->mode = OMAP_DSS_DSI_CMD_MODE;
>  	}
>  
> -	dsi->vc[channel].dest = client;
> +	dsi->dsidev = client;
>  	dsi->pix_fmt = client->format;
>  
>  	INIT_DEFERRABLE_WORK(&dsi->ulps_work,
> @@ -5144,11 +5123,11 @@ static int omap_dsi_host_detach(struct mipi_dsi_host *host,
>  	if (channel > 3)
>  		return -EINVAL;
>  
> -	if (dsi->vc[channel].dest != client)
> +	if (WARN_ON(dsi->dsidev != client))
>  		return -EINVAL;
>  
>  	omap_dsi_unregister_te_irq(dsi);
> -	dsi->vc[channel].dest = NULL;
> +	dsi->dsidev = NULL;
>  	return 0;
>  }
>  
> @@ -5680,10 +5659,8 @@ static int dsi_probe(struct platform_device *pdev)
>  	}
>  
>  	/* DSI VCs initialization */
> -	for (i = 0; i < ARRAY_SIZE(dsi->vc); i++) {
> +	for (i = 0; i < ARRAY_SIZE(dsi->vc); i++)
>  		dsi->vc[i].source = DSI_VC_SOURCE_L4;
> -		dsi->vc[i].dest = NULL;
> -	}
>  
>  	r = dsi_get_clocks(dsi);
>  	if (r)

-- 
Regards,

Laurent Pinchart
