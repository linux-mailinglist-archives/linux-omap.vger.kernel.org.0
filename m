Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5A46A2C816B
	for <lists+linux-omap@lfdr.de>; Mon, 30 Nov 2020 10:52:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728349AbgK3Jw2 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 30 Nov 2020 04:52:28 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:57064 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727272AbgK3Jw2 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 30 Nov 2020 04:52:28 -0500
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id A745597E;
        Mon, 30 Nov 2020 10:51:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1606729906;
        bh=AKEHU3dP0wNBPbEjiXFcjEZ7/oG4coxrRJ4tWBtzFm4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=B0N9NIMXjpk4eJlAQ8ZH68eIBPvlAp6oJPki1XiVdVkTTvyyetBlTZovWz+AjKv6E
         Le3rvZx16wgp57Q3PIP+4krmE/MDT5dvV2BNpAU5FnIDwUdqze6k7o5w88VWZAly5k
         V1x36A7USlvXfAJ1IpNd4tdRSLJo1sNCnBcvMHvU=
Date:   Mon, 30 Nov 2020 11:51:38 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Tomi Valkeinen <tomi.valkeinen@ti.com>
Cc:     Sebastian Reichel <sre@kernel.org>,
        Nikhil Devshatwar <nikhil.nd@ti.com>,
        linux-omap@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Sekhar Nori <nsekhar@ti.com>, Tony Lindgren <tony@atomide.com>,
        hns@goldelico.com
Subject: Re: [PATCH v4 56/80] drm/panel: panel-dsi-cm: cleanup tear enable
Message-ID: <20201130095138.GH4141@pendragon.ideasonboard.com>
References: <20201124124538.660710-1-tomi.valkeinen@ti.com>
 <20201124124538.660710-57-tomi.valkeinen@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20201124124538.660710-57-tomi.valkeinen@ti.com>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Tomi,

Thank you for the patch.

On Tue, Nov 24, 2020 at 02:45:14PM +0200, Tomi Valkeinen wrote:
> Simplify the code by moving code from _dsicm_enable_te() into
> dsicm_power_on().
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/gpu/drm/panel/panel-dsi-cm.c | 23 ++++-------------------
>  1 file changed, 4 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-dsi-cm.c b/drivers/gpu/drm/panel/panel-dsi-cm.c
> index cb0d27a38555..59e8e6b18e97 100644
> --- a/drivers/gpu/drm/panel/panel-dsi-cm.c
> +++ b/drivers/gpu/drm/panel/panel-dsi-cm.c
> @@ -69,8 +69,6 @@ static inline struct panel_drv_data *panel_to_ddata(struct drm_panel *panel)
>  	return container_of(panel, struct panel_drv_data, panel);
>  }
>  
> -static int _dsicm_enable_te(struct panel_drv_data *ddata, bool enable);
> -
>  static void dsicm_bl_power(struct panel_drv_data *ddata, bool enable)
>  {
>  	struct backlight_device *backlight;
> @@ -314,10 +312,13 @@ static int dsicm_power_on(struct panel_drv_data *ddata)
>  	if (r)
>  		goto err;
>  
> -	r = _dsicm_enable_te(ddata, true);
> +	r = mipi_dsi_dcs_set_tear_on(ddata->dsi, MIPI_DSI_DCS_TEAR_MODE_VBLANK);
>  	if (r)
>  		goto err;
>  
> +	/* possible panel bug */
> +	msleep(100);
> +
>  	ddata->enabled = true;
>  
>  	if (!ddata->intro_printed) {
> @@ -418,22 +419,6 @@ static int dsicm_disable(struct drm_panel *panel)
>  	return r;
>  }
>  
> -static int _dsicm_enable_te(struct panel_drv_data *ddata, bool enable)
> -{
> -	struct mipi_dsi_device *dsi = ddata->dsi;
> -	int r;
> -
> -	if (enable)
> -		r = mipi_dsi_dcs_set_tear_on(dsi, MIPI_DSI_DCS_TEAR_MODE_VBLANK);
> -	else
> -		r = mipi_dsi_dcs_set_tear_off(dsi);
> -
> -	/* possible panel bug */
> -	msleep(100);
> -
> -	return r;
> -}
> -
>  static int dsicm_get_modes(struct drm_panel *panel,
>  			   struct drm_connector *connector)
>  {

-- 
Regards,

Laurent Pinchart
