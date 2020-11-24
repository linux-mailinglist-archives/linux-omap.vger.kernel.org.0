Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2EB152C2E92
	for <lists+linux-omap@lfdr.de>; Tue, 24 Nov 2020 18:32:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390773AbgKXRaq (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 24 Nov 2020 12:30:46 -0500
Received: from asavdk4.altibox.net ([109.247.116.15]:49526 "EHLO
        asavdk4.altibox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390725AbgKXRap (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 24 Nov 2020 12:30:45 -0500
Received: from ravnborg.org (unknown [188.228.123.71])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by asavdk4.altibox.net (Postfix) with ESMTPS id BFB66806DD;
        Tue, 24 Nov 2020 18:30:42 +0100 (CET)
Date:   Tue, 24 Nov 2020 18:30:41 +0100
From:   Sam Ravnborg <sam@ravnborg.org>
To:     Tomi Valkeinen <tomi.valkeinen@ti.com>
Cc:     Sebastian Reichel <sre@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Nikhil Devshatwar <nikhil.nd@ti.com>,
        linux-omap@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Tony Lindgren <tony@atomide.com>, hns@goldelico.com,
        Sekhar Nori <nsekhar@ti.com>
Subject: Re: [PATCH v4 60/80] drm/panel: panel-dsi-cm: set column & page at
 setup
Message-ID: <20201124173041.GB56262@ravnborg.org>
References: <20201124124538.660710-1-tomi.valkeinen@ti.com>
 <20201124124538.660710-61-tomi.valkeinen@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201124124538.660710-61-tomi.valkeinen@ti.com>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=VafZwmh9 c=1 sm=1 tr=0
        a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
        a=kj9zAlcOel0A:10 a=sozttTNsAAAA:8 a=7gkXJVJtAAAA:8 a=e5mUnYsNAAAA:8
        a=wJgYVcbUXup5GoREIi4A:9 a=CjuIK1q_8ugA:10 a=aeg5Gbbo78KNqacMgKqU:22
        a=E9Po1WZjFZOl8hwRPBS3:22 a=Vxmtnl_E_bksehYqCbjh:22
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Tue, Nov 24, 2020 at 02:45:18PM +0200, Tomi Valkeinen wrote:
> Set the column & page address once during setup, instead of relying the
> DSI host driver to set those.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>

But one comment below.

> ---
>  drivers/gpu/drm/panel/panel-dsi-cm.c | 24 ++++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
> 
> diff --git a/drivers/gpu/drm/panel/panel-dsi-cm.c b/drivers/gpu/drm/panel/panel-dsi-cm.c
> index 59e8e6b18e97..1e7f73340736 100644
> --- a/drivers/gpu/drm/panel/panel-dsi-cm.c
> +++ b/drivers/gpu/drm/panel/panel-dsi-cm.c
> @@ -171,6 +171,26 @@ static int dsicm_get_id(struct panel_drv_data *ddata, u8 *id1, u8 *id2, u8 *id3)
>  	return 0;
>  }
>  
> +static int dsicm_set_update_window(struct panel_drv_data *ddata)
> +{
> +	struct mipi_dsi_device *dsi = ddata->dsi;
> +	int r;
> +	u16 x1 = 0;
> +	u16 x2 = ddata->mode.hdisplay - 1;
> +	u16 y1 = 0;
> +	u16 y2 = ddata->mode.vdisplay - 1;

It does not help the readability with the variables.

Using

	r = mipi_dsi_dcs_set_column_address(dsi, 0, ddata->mode.hdisplay - 1);

would IMO be easier to parse.

Then the pointless assignment of x1 and y1 are dropped too.

But nitpicking, ignore if think the current code is better.

	Sam


> +
> +	r = mipi_dsi_dcs_set_column_address(dsi, x1, x2);
> +	if (r < 0)
> +		return r;
> +
> +	r = mipi_dsi_dcs_set_page_address(dsi, y1, y2);
> +	if (r < 0)
> +		return r;
> +
> +	return 0;
> +}
> +
>  static int dsicm_bl_update_status(struct backlight_device *dev)
>  {
>  	struct panel_drv_data *ddata = dev_get_drvdata(&dev->dev);
> @@ -308,6 +328,10 @@ static int dsicm_power_on(struct panel_drv_data *ddata)
>  	if (r)
>  		goto err;
>  
> +	r = dsicm_set_update_window(ddata);
> +	if (r)
> +		goto err;
> +
>  	r = mipi_dsi_dcs_set_display_on(ddata->dsi);
>  	if (r)
>  		goto err;
> -- 
> Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
> Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
