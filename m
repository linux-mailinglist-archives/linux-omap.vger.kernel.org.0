Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5D8AD2AB5AC
	for <lists+linux-omap@lfdr.de>; Mon,  9 Nov 2020 12:01:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729427AbgKILB6 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 9 Nov 2020 06:01:58 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:41152 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729422AbgKILB6 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 9 Nov 2020 06:01:58 -0500
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id EBD52B2B;
        Mon,  9 Nov 2020 12:01:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1604919715;
        bh=k0GQOFUSGpRilhcWsnTPLk1/LGy+5Lm8LgtR2KL95ZA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=qgIu1iHaYB+dVs8oRyUvmisp/0X9SteDBOKwwKTfxEZj9594PKrgZJpCz/5PDt9oT
         KECWWDVKJjU218rz08YdscPcc0D3G6tABgQrU+M5KXVhpLf6dR6GwGfFhsmrbDnH25
         cu74WtsIpa7uVhTqi30Sfl6IouAZERaE+GQXHDAA=
Date:   Mon, 9 Nov 2020 13:01:51 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Tomi Valkeinen <tomi.valkeinen@ti.com>
Cc:     Sebastian Reichel <sre@kernel.org>,
        Nikhil Devshatwar <nikhil.nd@ti.com>,
        linux-omap@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Sekhar Nori <nsekhar@ti.com>, Tony Lindgren <tony@atomide.com>,
        "H . Nikolaus Schaller" <hns@goldelico.com>,
        Sebastian Reichel <sebastian.reichel@collabora.com>
Subject: Re: [PATCH v3 42/56] drm/omap: remove legacy DSS device operations
Message-ID: <20201109110151.GM6029@pendragon.ideasonboard.com>
References: <20201105120333.947408-1-tomi.valkeinen@ti.com>
 <20201105120333.947408-43-tomi.valkeinen@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20201105120333.947408-43-tomi.valkeinen@ti.com>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Tomi and Sebastian,

Thank you for the patch.

On Thu, Nov 05, 2020 at 02:03:19PM +0200, Tomi Valkeinen wrote:
> From: Sebastian Reichel <sebastian.reichel@collabora.com>
> 
> All DSS devices have been converted to bridge API, so
> the device operations are always NULL. This removes
> the device ops function pointers and all code using it.
> 
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
> ---
>  drivers/gpu/drm/omapdrm/dss/base.c       | 66 ------------------------
>  drivers/gpu/drm/omapdrm/dss/dss.c        |  8 ---
>  drivers/gpu/drm/omapdrm/dss/omapdss.h    | 34 ------------
>  drivers/gpu/drm/omapdrm/omap_connector.c | 29 -----------
>  drivers/gpu/drm/omapdrm/omap_encoder.c   | 40 --------------
>  5 files changed, 177 deletions(-)
> 
> diff --git a/drivers/gpu/drm/omapdrm/dss/base.c b/drivers/gpu/drm/omapdrm/dss/base.c
> index 8e08c49b4f97..c2791305c332 100644
> --- a/drivers/gpu/drm/omapdrm/dss/base.c
> +++ b/drivers/gpu/drm/omapdrm/dss/base.c
> @@ -161,8 +161,6 @@ int omapdss_device_connect(struct dss_device *dss,
>  			   struct omap_dss_device *src,
>  			   struct omap_dss_device *dst)
>  {
> -	int ret;
> -
>  	dev_dbg(&dss->pdev->dev, "connect(%s, %s)\n",
>  		src ? dev_name(src->dev) : "NULL",
>  		dst ? dev_name(dst->dev) : "NULL");
> @@ -181,14 +179,6 @@ int omapdss_device_connect(struct dss_device *dss,
>  
>  	dst->dss = dss;
>  
> -	if (dst->ops && dst->ops->connect) {
> -		ret = dst->ops->connect(src, dst);
> -		if (ret < 0) {
> -			dst->dss = NULL;
> -			return ret;
> -		}
> -	}
> -
>  	return 0;
>  }
>  EXPORT_SYMBOL_GPL(omapdss_device_connect);
> @@ -212,66 +202,10 @@ void omapdss_device_disconnect(struct omap_dss_device *src,
>  		return;
>  	}
>  
> -	WARN_ON(dst->state != OMAP_DSS_DISPLAY_DISABLED);
> -
> -	if (dst->ops && dst->ops->disconnect)
> -		dst->ops->disconnect(src, dst);
>  	dst->dss = NULL;
>  }
>  EXPORT_SYMBOL_GPL(omapdss_device_disconnect);
>  
> -void omapdss_device_pre_enable(struct omap_dss_device *dssdev)
> -{
> -	if (!dssdev)
> -		return;
> -
> -	omapdss_device_pre_enable(dssdev->next);
> -
> -	if (dssdev->ops && dssdev->ops->pre_enable)
> -		dssdev->ops->pre_enable(dssdev);
> -}
> -EXPORT_SYMBOL_GPL(omapdss_device_pre_enable);
> -
> -void omapdss_device_enable(struct omap_dss_device *dssdev)
> -{
> -	if (!dssdev)
> -		return;
> -
> -	if (dssdev->ops && dssdev->ops->enable)
> -		dssdev->ops->enable(dssdev);
> -
> -	omapdss_device_enable(dssdev->next);
> -
> -	dssdev->state = OMAP_DSS_DISPLAY_ACTIVE;
> -}
> -EXPORT_SYMBOL_GPL(omapdss_device_enable);
> -
> -void omapdss_device_disable(struct omap_dss_device *dssdev)
> -{
> -	if (!dssdev)
> -		return;
> -
> -	omapdss_device_disable(dssdev->next);
> -
> -	if (dssdev->ops && dssdev->ops->disable)
> -		dssdev->ops->disable(dssdev);
> -}
> -EXPORT_SYMBOL_GPL(omapdss_device_disable);
> -
> -void omapdss_device_post_disable(struct omap_dss_device *dssdev)
> -{
> -	if (!dssdev)
> -		return;
> -
> -	if (dssdev->ops && dssdev->ops->post_disable)
> -		dssdev->ops->post_disable(dssdev);
> -
> -	omapdss_device_post_disable(dssdev->next);
> -
> -	dssdev->state = OMAP_DSS_DISPLAY_DISABLED;
> -}
> -EXPORT_SYMBOL_GPL(omapdss_device_post_disable);
> -
>  /* -----------------------------------------------------------------------------
>   * Components Handling
>   */
> diff --git a/drivers/gpu/drm/omapdrm/dss/dss.c b/drivers/gpu/drm/omapdrm/dss/dss.c
> index 6e86f4e67a2c..6a160138bf88 100644
> --- a/drivers/gpu/drm/omapdrm/dss/dss.c
> +++ b/drivers/gpu/drm/omapdrm/dss/dss.c
> @@ -1565,15 +1565,7 @@ static int dss_remove(struct platform_device *pdev)
>  
>  static void dss_shutdown(struct platform_device *pdev)
>  {
> -	struct omap_dss_device *dssdev = NULL;
> -
>  	DSSDBG("shutdown\n");
> -
> -	for_each_dss_output(dssdev) {
> -		if (dssdev->state == OMAP_DSS_DISPLAY_ACTIVE &&
> -		    dssdev->ops && dssdev->ops->disable)
> -			dssdev->ops->disable(dssdev);
> -	}
>  }

Should we call drm_atomic_helper_shutdown() here (in another patch) ?

>  
>  static int dss_runtime_suspend(struct device *dev)
> diff --git a/drivers/gpu/drm/omapdrm/dss/omapdss.h b/drivers/gpu/drm/omapdrm/dss/omapdss.h
> index 42d1ec3aaf0c..5d6edec5a427 100644
> --- a/drivers/gpu/drm/omapdrm/dss/omapdss.h
> +++ b/drivers/gpu/drm/omapdrm/dss/omapdss.h
> @@ -123,11 +123,6 @@ enum omap_dss_dsi_mode {
>  	OMAP_DSS_DSI_VIDEO_MODE,
>  };
>  
> -enum omap_dss_display_state {
> -	OMAP_DSS_DISPLAY_DISABLED = 0,
> -	OMAP_DSS_DISPLAY_ACTIVE,
> -};
> -
>  enum omap_dss_rotation_type {
>  	OMAP_DSS_ROT_NONE	= 0,
>  	OMAP_DSS_ROT_TILER	= 1 << 0,
> @@ -281,24 +276,6 @@ struct omapdss_dsi_ops {
>  };
>  
>  struct omap_dss_device_ops {
> -	int (*connect)(struct omap_dss_device *dssdev,
> -			struct omap_dss_device *dst);
> -	void (*disconnect)(struct omap_dss_device *dssdev,
> -			struct omap_dss_device *dst);
> -
> -	void (*pre_enable)(struct omap_dss_device *dssdev);
> -	void (*enable)(struct omap_dss_device *dssdev);
> -	void (*disable)(struct omap_dss_device *dssdev);
> -	void (*post_disable)(struct omap_dss_device *dssdev);
> -
> -	int (*check_timings)(struct omap_dss_device *dssdev,
> -			     struct drm_display_mode *mode);
> -	void (*set_timings)(struct omap_dss_device *dssdev,
> -			    const struct drm_display_mode *mode);
> -
> -	int (*get_modes)(struct omap_dss_device *dssdev,
> -			 struct drm_connector *connector);
> -
>  	const struct omapdss_dsi_ops dsi;
>  };
>  
> @@ -342,8 +319,6 @@ struct omap_dss_device {
>  	unsigned long ops_flags;
>  	u32 bus_flags;
>  
> -	enum omap_dss_display_state state;
> -
>  	/* OMAP DSS output specific fields */
>  
>  	/* DISPC channel for this output */
> @@ -374,10 +349,6 @@ int omapdss_device_connect(struct dss_device *dss,
>  			   struct omap_dss_device *dst);
>  void omapdss_device_disconnect(struct omap_dss_device *src,
>  			       struct omap_dss_device *dst);
> -void omapdss_device_pre_enable(struct omap_dss_device *dssdev);
> -void omapdss_device_enable(struct omap_dss_device *dssdev);
> -void omapdss_device_disable(struct omap_dss_device *dssdev);
> -void omapdss_device_post_disable(struct omap_dss_device *dssdev);
>  
>  int omap_dss_get_num_overlay_managers(void);
>  
> @@ -397,11 +368,6 @@ int omap_dispc_unregister_isr(omap_dispc_isr_t isr, void *arg, u32 mask);
>  int omapdss_compat_init(void);
>  void omapdss_compat_uninit(void);
>  
> -static inline bool omapdss_device_is_enabled(struct omap_dss_device *dssdev)
> -{
> -	return dssdev->state == OMAP_DSS_DISPLAY_ACTIVE;
> -}
> -
>  enum dss_writeback_channel {
>  	DSS_WB_LCD1_MGR =	0,
>  	DSS_WB_LCD2_MGR =	1,
> diff --git a/drivers/gpu/drm/omapdrm/omap_connector.c b/drivers/gpu/drm/omapdrm/omap_connector.c
> index de95dc1b861c..c6d9b4268841 100644
> --- a/drivers/gpu/drm/omapdrm/omap_connector.c
> +++ b/drivers/gpu/drm/omapdrm/omap_connector.c
> @@ -43,24 +43,8 @@ static void omap_connector_destroy(struct drm_connector *connector)
>  
>  static int omap_connector_get_modes(struct drm_connector *connector)
>  {
> -	struct omap_connector *omap_connector = to_omap_connector(connector);
> -	struct omap_dss_device *dssdev = NULL;
> -	struct omap_dss_device *d;
> -
>  	DBG("%s", connector->name);
>  
> -	/*
> -	 * If the display pipeline reports modes (e.g. with a fixed resolution
> -	 * panel or an analog TV output), query it.
> -	 */
> -	for (d = omap_connector->output; d; d = d->next) {
> -		if (d->ops_flags & OMAP_DSS_DEVICE_OP_MODES)
> -			dssdev = d;
> -	}
> -
> -	if (dssdev)
> -		return dssdev->ops->get_modes(dssdev, connector);
> -
>  	/* We can't retrieve modes. The KMS core will add the default modes. */
>  	return 0;
>  }
> @@ -69,19 +53,6 @@ enum drm_mode_status omap_connector_mode_fixup(struct omap_dss_device *dssdev,
>  					const struct drm_display_mode *mode,
>  					struct drm_display_mode *adjusted_mode)
>  {
> -	int ret;
> -
> -	drm_mode_copy(adjusted_mode, mode);
> -
> -	for (; dssdev; dssdev = dssdev->next) {
> -		if (!dssdev->ops || !dssdev->ops->check_timings)
> -			continue;
> -
> -		ret = dssdev->ops->check_timings(dssdev, adjusted_mode);
> -		if (ret)
> -			return MODE_BAD;
> -	}
> -
>  	return MODE_OK;
>  }
>  
> diff --git a/drivers/gpu/drm/omapdrm/omap_encoder.c b/drivers/gpu/drm/omapdrm/omap_encoder.c
> index 10abe4d01b0b..abb3821de8b8 100644
> --- a/drivers/gpu/drm/omapdrm/omap_encoder.c
> +++ b/drivers/gpu/drm/omapdrm/omap_encoder.c
> @@ -115,11 +115,6 @@ static void omap_encoder_mode_set(struct drm_encoder *encoder,
>  
>  	/* Set timings for all devices in the display pipeline. */
>  	dss_mgr_set_timings(output, &vm);
> -
> -	for (dssdev = output; dssdev; dssdev = dssdev->next) {
> -		if (dssdev->ops && dssdev->ops->set_timings)
> -			dssdev->ops->set_timings(dssdev, adjusted_mode);
> -	}
>  }
>  
>  static void omap_encoder_disable(struct drm_encoder *encoder)
> @@ -129,25 +124,6 @@ static void omap_encoder_disable(struct drm_encoder *encoder)
>  	struct drm_device *dev = encoder->dev;
>  
>  	dev_dbg(dev->dev, "disable(%s)\n", dssdev->name);
> -
> -	/*
> -	 * Disable the chain of external devices, starting at the one at the
> -	 * internal encoder's output.
> -	 */
> -	omapdss_device_disable(dssdev->next);
> -
> -	/*
> -	 * Disable the internal encoder. This will disable the DSS output.
> -	 */
> -	if (dssdev->ops && dssdev->ops->disable)
> -		dssdev->ops->disable(dssdev);
> -	dssdev->state = OMAP_DSS_DISPLAY_DISABLED;
> -
> -	/*
> -	 * Perform the post-disable operations on the chain of external devices
> -	 * to complete the display pipeline disable.
> -	 */
> -	omapdss_device_post_disable(dssdev->next);
>  }
>  
>  static void omap_encoder_enable(struct drm_encoder *encoder)
> @@ -157,22 +133,6 @@ static void omap_encoder_enable(struct drm_encoder *encoder)
>  	struct drm_device *dev = encoder->dev;
>  
>  	dev_dbg(dev->dev, "enable(%s)\n", dssdev->name);
> -
> -	/* Prepare the chain of external devices for pipeline enable. */
> -	omapdss_device_pre_enable(dssdev->next);
> -
> -	/*
> -	 * Enable the internal encoder. This will enable the DSS output.
> -	 */
> -	if (dssdev->ops && dssdev->ops->enable)
> -		dssdev->ops->enable(dssdev);
> -	dssdev->state = OMAP_DSS_DISPLAY_ACTIVE;
> -
> -	/*
> -	 * Enable the chain of external devices, starting at the one at the
> -	 * internal encoder's output.
> -	 */
> -	omapdss_device_enable(dssdev->next);
>  }

Now that the enable and disable functions are empty, we can drop them
completely.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

>  
>  static int omap_encoder_atomic_check(struct drm_encoder *encoder,

-- 
Regards,

Laurent Pinchart
