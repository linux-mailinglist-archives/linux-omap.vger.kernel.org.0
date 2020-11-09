Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5A37E2AB2AD
	for <lists+linux-omap@lfdr.de>; Mon,  9 Nov 2020 09:45:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726176AbgKIIpt (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 9 Nov 2020 03:45:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37518 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726127AbgKIIpt (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 9 Nov 2020 03:45:49 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6AC06C0613CF
        for <linux-omap@vger.kernel.org>; Mon,  9 Nov 2020 00:45:49 -0800 (PST)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id D3E812FE;
        Mon,  9 Nov 2020 09:45:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1604911548;
        bh=15aff/NnbwjQPBSjczg7dx8+GclOhtsYYmUqyp3hKN8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=tYeAktNMfT95CKaYJkw6WLWbTnrcPZPLXxcg6/QsRvIzBcfpHbEUHqkAp3mZNvl7a
         L+k/ukI/Ztbw8lfavc0RmGFik6M7tdOhdvEGa0jG61NroRDpViK/RorBktk6DYtqA8
         snvebvTERbW9Y8oUFrGlHyOcGFk65cQ+XL4jPTZ4=
Date:   Mon, 9 Nov 2020 10:45:44 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Tomi Valkeinen <tomi.valkeinen@ti.com>
Cc:     Sebastian Reichel <sre@kernel.org>,
        Nikhil Devshatwar <nikhil.nd@ti.com>,
        linux-omap@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Sekhar Nori <nsekhar@ti.com>, Tony Lindgren <tony@atomide.com>,
        "H . Nikolaus Schaller" <hns@goldelico.com>,
        Sebastian Reichel <sebastian.reichel@collabora.com>
Subject: Re: [PATCH v3 19/56] drm/omap: dsi: drop unused get_te()
Message-ID: <20201109084544.GP6029@pendragon.ideasonboard.com>
References: <20201105120333.947408-1-tomi.valkeinen@ti.com>
 <20201105120333.947408-20-tomi.valkeinen@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20201105120333.947408-20-tomi.valkeinen@ti.com>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Tomi and Sebastian,

Thank you for the patch.

On Thu, Nov 05, 2020 at 02:02:56PM +0200, Tomi Valkeinen wrote:
> From: Sebastian Reichel <sebastian.reichel@collabora.com>
> 
> The get_te() callback is not used, so we can drop the
> custom API.
> 
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>

You could squash this with the previous and next patches.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c | 13 -------------
>  drivers/gpu/drm/omapdrm/dss/omapdss.h           |  1 -
>  2 files changed, 14 deletions(-)
> 
> diff --git a/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c b/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c
> index dd9112ca76ba..92ac90035fec 100644
> --- a/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c
> +++ b/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c
> @@ -919,18 +919,6 @@ static int dsicm_enable_te(struct omap_dss_device *dssdev, bool enable)
>  	return r;
>  }
>  
> -static int dsicm_get_te(struct omap_dss_device *dssdev)
> -{
> -	struct panel_drv_data *ddata = to_panel_data(dssdev);
> -	int r;
> -
> -	mutex_lock(&ddata->lock);
> -	r = ddata->te_enabled;
> -	mutex_unlock(&ddata->lock);
> -
> -	return r;
> -}
> -
>  static void dsicm_ulps_work(struct work_struct *work)
>  {
>  	struct panel_drv_data *ddata = container_of(work, struct panel_drv_data,
> @@ -1002,7 +990,6 @@ static const struct omap_dss_driver dsicm_dss_driver = {
>  	.sync		= dsicm_sync,
>  
>  	.enable_te	= dsicm_enable_te,
> -	.get_te		= dsicm_get_te,
>  };
>  
>  static int dsicm_probe_of(struct mipi_dsi_device *dsi)
> diff --git a/drivers/gpu/drm/omapdrm/dss/omapdss.h b/drivers/gpu/drm/omapdrm/dss/omapdss.h
> index e67928373560..aa307f5ab9cf 100644
> --- a/drivers/gpu/drm/omapdrm/dss/omapdss.h
> +++ b/drivers/gpu/drm/omapdrm/dss/omapdss.h
> @@ -388,7 +388,6 @@ struct omap_dss_driver {
>  	int (*sync)(struct omap_dss_device *dssdev);
>  
>  	int (*enable_te)(struct omap_dss_device *dssdev, bool enable);
> -	int (*get_te)(struct omap_dss_device *dssdev);
>  };
>  
>  struct dss_device *omapdss_get_dss(void);

-- 
Regards,

Laurent Pinchart
