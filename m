Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 10A9B2AB67A
	for <lists+linux-omap@lfdr.de>; Mon,  9 Nov 2020 12:18:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729493AbgKILSJ (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 9 Nov 2020 06:18:09 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:41616 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729508AbgKILSJ (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 9 Nov 2020 06:18:09 -0500
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 72BC3B2B;
        Mon,  9 Nov 2020 12:18:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1604920686;
        bh=jDX0QTBOD5CwoY/KpdQcTJmxbWmpsAABqWOdjN9aN8U=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=JDaN9fg8Npwf6zlLY3ntODej7BidixEVRFrMdS8y6FtdZYnSJ3Ssw8ElyxHqDn4FS
         kodKkMW3bx7peecMA4MojPZVhvOTOd9UQ08bpTy8TcCJnH1uqY3jQC+ADVREX5+Zq6
         Id3VRw0D1VLfiXJRocnuBqILCFg3lBy7fjGo1VCI=
Date:   Mon, 9 Nov 2020 13:18:03 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Tomi Valkeinen <tomi.valkeinen@ti.com>
Cc:     Sebastian Reichel <sre@kernel.org>,
        Nikhil Devshatwar <nikhil.nd@ti.com>,
        linux-omap@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Sekhar Nori <nsekhar@ti.com>, Tony Lindgren <tony@atomide.com>,
        "H . Nikolaus Schaller" <hns@goldelico.com>
Subject: Re: [PATCH v3 56/56] drm/omap: remove dss_mgr_ops
Message-ID: <20201109111803.GA6029@pendragon.ideasonboard.com>
References: <20201105120333.947408-1-tomi.valkeinen@ti.com>
 <20201105120333.947408-57-tomi.valkeinen@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20201105120333.947408-57-tomi.valkeinen@ti.com>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Tomi,

Thank you for the patch.

On Thu, Nov 05, 2020 at 02:03:33PM +0200, Tomi Valkeinen wrote:
> dss_mgr_ops was needed with the multi-module architecture, but is no
> longer needed. We can thus remove it and use direct calls.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>

Acked-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/gpu/drm/omapdrm/dss/dss.h     |  1 -
>  drivers/gpu/drm/omapdrm/dss/omapdss.h | 42 +++++++++++----------------
>  drivers/gpu/drm/omapdrm/dss/output.c  | 33 +++++----------------
>  drivers/gpu/drm/omapdrm/omap_crtc.c   | 38 +++++-------------------
>  drivers/gpu/drm/omapdrm/omap_crtc.h   |  2 --
>  drivers/gpu/drm/omapdrm/omap_drv.c    |  4 +--
>  6 files changed, 33 insertions(+), 87 deletions(-)
> 
> diff --git a/drivers/gpu/drm/omapdrm/dss/dss.h b/drivers/gpu/drm/omapdrm/dss/dss.h
> index 96f702314c8c..a547527bb2f3 100644
> --- a/drivers/gpu/drm/omapdrm/dss/dss.h
> +++ b/drivers/gpu/drm/omapdrm/dss/dss.h
> @@ -257,7 +257,6 @@ struct dss_device {
>  	struct dss_pll	*video2_pll;
>  
>  	struct dispc_device *dispc;
> -	const struct dss_mgr_ops *mgr_ops;
>  	struct omap_drm_private *mgr_ops_priv;
>  };
>  
> diff --git a/drivers/gpu/drm/omapdrm/dss/omapdss.h b/drivers/gpu/drm/omapdrm/dss/omapdss.h
> index fba5f05e5e48..9df322ca467d 100644
> --- a/drivers/gpu/drm/omapdrm/dss/omapdss.h
> +++ b/drivers/gpu/drm/omapdrm/dss/omapdss.h
> @@ -338,31 +338,23 @@ enum dss_writeback_channel {
>  	DSS_WB_LCD3_MGR =	7,
>  };
>  
> -struct dss_mgr_ops {
> -	void (*start_update)(struct omap_drm_private *priv,
> -			     enum omap_channel channel);
> -	int (*enable)(struct omap_drm_private *priv,
> -		      enum omap_channel channel);
> -	void (*disable)(struct omap_drm_private *priv,
> -			enum omap_channel channel);
> -	void (*set_timings)(struct omap_drm_private *priv,
> -			    enum omap_channel channel,
> -			    const struct videomode *vm);
> -	void (*set_lcd_config)(struct omap_drm_private *priv,
> -			       enum omap_channel channel,
> -			       const struct dss_lcd_mgr_config *config);
> -	int (*register_framedone_handler)(struct omap_drm_private *priv,
> -			enum omap_channel channel,
> -			void (*handler)(void *), void *data);
> -	void (*unregister_framedone_handler)(struct omap_drm_private *priv,
> -			enum omap_channel channel,
> -			void (*handler)(void *), void *data);
> -};
> -
> -int dss_install_mgr_ops(struct dss_device *dss,
> -			const struct dss_mgr_ops *mgr_ops,
> -			struct omap_drm_private *priv);
> -void dss_uninstall_mgr_ops(struct dss_device *dss);
> +void omap_crtc_dss_start_update(struct omap_drm_private *priv,
> +				       enum omap_channel channel);
> +void omap_crtc_set_enabled(struct drm_crtc *crtc, bool enable);
> +int omap_crtc_dss_enable(struct omap_drm_private *priv, enum omap_channel channel);
> +void omap_crtc_dss_disable(struct omap_drm_private *priv, enum omap_channel channel);
> +void omap_crtc_dss_set_timings(struct omap_drm_private *priv,
> +		enum omap_channel channel,
> +		const struct videomode *vm);
> +void omap_crtc_dss_set_lcd_config(struct omap_drm_private *priv,
> +		enum omap_channel channel,
> +		const struct dss_lcd_mgr_config *config);
> +int omap_crtc_dss_register_framedone(
> +		struct omap_drm_private *priv, enum omap_channel channel,
> +		void (*handler)(void *), void *data);
> +void omap_crtc_dss_unregister_framedone(
> +		struct omap_drm_private *priv, enum omap_channel channel,
> +		void (*handler)(void *), void *data);
>  
>  void dss_mgr_set_timings(struct omap_dss_device *dssdev,
>  		const struct videomode *vm);
> diff --git a/drivers/gpu/drm/omapdrm/dss/output.c b/drivers/gpu/drm/omapdrm/dss/output.c
> index 7a14d2b5b2f7..2121c947947b 100644
> --- a/drivers/gpu/drm/omapdrm/dss/output.c
> +++ b/drivers/gpu/drm/omapdrm/dss/output.c
> @@ -81,54 +81,35 @@ void omapdss_device_cleanup_output(struct omap_dss_device *out)
>  					out->next_bridge : out->bridge);
>  }
>  
> -int dss_install_mgr_ops(struct dss_device *dss,
> -			const struct dss_mgr_ops *mgr_ops,
> -			struct omap_drm_private *priv)
> -{
> -	if (dss->mgr_ops)
> -		return -EBUSY;
> -
> -	dss->mgr_ops = mgr_ops;
> -	dss->mgr_ops_priv = priv;
> -
> -	return 0;
> -}
> -
> -void dss_uninstall_mgr_ops(struct dss_device *dss)
> -{
> -	dss->mgr_ops = NULL;
> -	dss->mgr_ops_priv = NULL;
> -}
> -
>  void dss_mgr_set_timings(struct omap_dss_device *dssdev,
>  			 const struct videomode *vm)
>  {
> -	dssdev->dss->mgr_ops->set_timings(dssdev->dss->mgr_ops_priv,
> +	omap_crtc_dss_set_timings(dssdev->dss->mgr_ops_priv,
>  					  dssdev->dispc_channel, vm);
>  }
>  
>  void dss_mgr_set_lcd_config(struct omap_dss_device *dssdev,
>  		const struct dss_lcd_mgr_config *config)
>  {
> -	dssdev->dss->mgr_ops->set_lcd_config(dssdev->dss->mgr_ops_priv,
> +	omap_crtc_dss_set_lcd_config(dssdev->dss->mgr_ops_priv,
>  					     dssdev->dispc_channel, config);
>  }
>  
>  int dss_mgr_enable(struct omap_dss_device *dssdev)
>  {
> -	return dssdev->dss->mgr_ops->enable(dssdev->dss->mgr_ops_priv,
> +	return omap_crtc_dss_enable(dssdev->dss->mgr_ops_priv,
>  					    dssdev->dispc_channel);
>  }
>  
>  void dss_mgr_disable(struct omap_dss_device *dssdev)
>  {
> -	dssdev->dss->mgr_ops->disable(dssdev->dss->mgr_ops_priv,
> +	omap_crtc_dss_disable(dssdev->dss->mgr_ops_priv,
>  				      dssdev->dispc_channel);
>  }
>  
>  void dss_mgr_start_update(struct omap_dss_device *dssdev)
>  {
> -	dssdev->dss->mgr_ops->start_update(dssdev->dss->mgr_ops_priv,
> +	omap_crtc_dss_start_update(dssdev->dss->mgr_ops_priv,
>  					   dssdev->dispc_channel);
>  }
>  
> @@ -137,7 +118,7 @@ int dss_mgr_register_framedone_handler(struct omap_dss_device *dssdev,
>  {
>  	struct dss_device *dss = dssdev->dss;
>  
> -	return dss->mgr_ops->register_framedone_handler(dss->mgr_ops_priv,
> +	return omap_crtc_dss_register_framedone(dss->mgr_ops_priv,
>  							dssdev->dispc_channel,
>  							handler, data);
>  }
> @@ -147,7 +128,7 @@ void dss_mgr_unregister_framedone_handler(struct omap_dss_device *dssdev,
>  {
>  	struct dss_device *dss = dssdev->dss;
>  
> -	dss->mgr_ops->unregister_framedone_handler(dss->mgr_ops_priv,
> +	omap_crtc_dss_unregister_framedone(dss->mgr_ops_priv,
>  						   dssdev->dispc_channel,
>  						   handler, data);
>  }
> diff --git a/drivers/gpu/drm/omapdrm/omap_crtc.c b/drivers/gpu/drm/omapdrm/omap_crtc.c
> index 0bf5cef579b5..e3259338afb9 100644
> --- a/drivers/gpu/drm/omapdrm/omap_crtc.c
> +++ b/drivers/gpu/drm/omapdrm/omap_crtc.c
> @@ -100,14 +100,14 @@ int omap_crtc_wait_pending(struct drm_crtc *crtc)
>   * the upstream part of the video pipe.
>   */
>  
> -static void omap_crtc_dss_start_update(struct omap_drm_private *priv,
> +void omap_crtc_dss_start_update(struct omap_drm_private *priv,
>  				       enum omap_channel channel)
>  {
>  	dispc_mgr_enable(priv->dispc, channel, true);
>  }
>  
>  /* Called only from the encoder enable/disable and suspend/resume handlers. */
> -static void omap_crtc_set_enabled(struct drm_crtc *crtc, bool enable)
> +void omap_crtc_set_enabled(struct drm_crtc *crtc, bool enable)
>  {
>  	struct omap_crtc_state *omap_state = to_omap_crtc_state(crtc->state);
>  	struct drm_device *dev = crtc->dev;
> @@ -180,8 +180,7 @@ static void omap_crtc_set_enabled(struct drm_crtc *crtc, bool enable)
>  }
>  
>  
> -static int omap_crtc_dss_enable(struct omap_drm_private *priv,
> -				enum omap_channel channel)
> +int omap_crtc_dss_enable(struct omap_drm_private *priv, enum omap_channel channel)
>  {
>  	struct drm_crtc *crtc = priv->channels[channel]->crtc;
>  	struct omap_crtc *omap_crtc = to_omap_crtc(crtc);
> @@ -193,8 +192,7 @@ static int omap_crtc_dss_enable(struct omap_drm_private *priv,
>  	return 0;
>  }
>  
> -static void omap_crtc_dss_disable(struct omap_drm_private *priv,
> -				  enum omap_channel channel)
> +void omap_crtc_dss_disable(struct omap_drm_private *priv, enum omap_channel channel)
>  {
>  	struct drm_crtc *crtc = priv->channels[channel]->crtc;
>  	struct omap_crtc *omap_crtc = to_omap_crtc(crtc);
> @@ -202,7 +200,7 @@ static void omap_crtc_dss_disable(struct omap_drm_private *priv,
>  	omap_crtc_set_enabled(&omap_crtc->base, false);
>  }
>  
> -static void omap_crtc_dss_set_timings(struct omap_drm_private *priv,
> +void omap_crtc_dss_set_timings(struct omap_drm_private *priv,
>  		enum omap_channel channel,
>  		const struct videomode *vm)
>  {
> @@ -213,7 +211,7 @@ static void omap_crtc_dss_set_timings(struct omap_drm_private *priv,
>  	omap_crtc->vm = *vm;
>  }
>  
> -static void omap_crtc_dss_set_lcd_config(struct omap_drm_private *priv,
> +void omap_crtc_dss_set_lcd_config(struct omap_drm_private *priv,
>  		enum omap_channel channel,
>  		const struct dss_lcd_mgr_config *config)
>  {
> @@ -225,7 +223,7 @@ static void omap_crtc_dss_set_lcd_config(struct omap_drm_private *priv,
>  					    config);
>  }
>  
> -static int omap_crtc_dss_register_framedone(
> +int omap_crtc_dss_register_framedone(
>  		struct omap_drm_private *priv, enum omap_channel channel,
>  		void (*handler)(void *), void *data)
>  {
> @@ -244,7 +242,7 @@ static int omap_crtc_dss_register_framedone(
>  	return 0;
>  }
>  
> -static void omap_crtc_dss_unregister_framedone(
> +void omap_crtc_dss_unregister_framedone(
>  		struct omap_drm_private *priv, enum omap_channel channel,
>  		void (*handler)(void *), void *data)
>  {
> @@ -261,16 +259,6 @@ static void omap_crtc_dss_unregister_framedone(
>  	omap_crtc->framedone_handler_data = NULL;
>  }
>  
> -static const struct dss_mgr_ops mgr_ops = {
> -	.start_update = omap_crtc_dss_start_update,
> -	.enable = omap_crtc_dss_enable,
> -	.disable = omap_crtc_dss_disable,
> -	.set_timings = omap_crtc_dss_set_timings,
> -	.set_lcd_config = omap_crtc_dss_set_lcd_config,
> -	.register_framedone_handler = omap_crtc_dss_register_framedone,
> -	.unregister_framedone_handler = omap_crtc_dss_unregister_framedone,
> -};
> -
>  /* -----------------------------------------------------------------------------
>   * Setup, Flush and Page Flip
>   */
> @@ -753,16 +741,6 @@ static const char *channel_names[] = {
>  	[OMAP_DSS_CHANNEL_LCD3] = "lcd3",
>  };
>  
> -void omap_crtc_pre_init(struct omap_drm_private *priv)
> -{
> -	dss_install_mgr_ops(priv->dss, &mgr_ops, priv);
> -}
> -
> -void omap_crtc_pre_uninit(struct omap_drm_private *priv)
> -{
> -	dss_uninstall_mgr_ops(priv->dss);
> -}
> -
>  /* initialize crtc */
>  struct drm_crtc *omap_crtc_init(struct drm_device *dev,
>  				struct omap_drm_pipeline *pipe,
> diff --git a/drivers/gpu/drm/omapdrm/omap_crtc.h b/drivers/gpu/drm/omapdrm/omap_crtc.h
> index 2fd57751ae2b..a8b9cbee86e0 100644
> --- a/drivers/gpu/drm/omapdrm/omap_crtc.h
> +++ b/drivers/gpu/drm/omapdrm/omap_crtc.h
> @@ -22,8 +22,6 @@ struct videomode;
>  
>  struct videomode *omap_crtc_timings(struct drm_crtc *crtc);
>  enum omap_channel omap_crtc_channel(struct drm_crtc *crtc);
> -void omap_crtc_pre_init(struct omap_drm_private *priv);
> -void omap_crtc_pre_uninit(struct omap_drm_private *priv);
>  struct drm_crtc *omap_crtc_init(struct drm_device *dev,
>  				struct omap_drm_pipeline *pipe,
>  				struct drm_plane *plane);
> diff --git a/drivers/gpu/drm/omapdrm/omap_drv.c b/drivers/gpu/drm/omapdrm/omap_drv.c
> index eb419387ed05..c5b2f50439d6 100644
> --- a/drivers/gpu/drm/omapdrm/omap_drv.c
> +++ b/drivers/gpu/drm/omapdrm/omap_drv.c
> @@ -581,7 +581,7 @@ static int omapdrm_init(struct omap_drm_private *priv, struct device *dev)
>  	priv->dss = pdata->dss;
>  	priv->dispc = dispc_get_dispc(priv->dss);
>  
> -	omap_crtc_pre_init(priv);
> +	priv->dss->mgr_ops_priv = priv;
>  
>  	soc = soc_device_match(omapdrm_soc_devices);
>  	priv->omaprev = soc ? (unsigned int)soc->data : 0;
> @@ -634,7 +634,6 @@ static int omapdrm_init(struct omap_drm_private *priv, struct device *dev)
>  	omap_gem_deinit(ddev);
>  	destroy_workqueue(priv->wq);
>  	omap_disconnect_pipelines(ddev);
> -	omap_crtc_pre_uninit(priv);
>  	drm_dev_put(ddev);
>  	return ret;
>  }
> @@ -660,7 +659,6 @@ static void omapdrm_cleanup(struct omap_drm_private *priv)
>  	destroy_workqueue(priv->wq);
>  
>  	omap_disconnect_pipelines(ddev);
> -	omap_crtc_pre_uninit(priv);
>  
>  	drm_dev_put(ddev);
>  }

-- 
Regards,

Laurent Pinchart
