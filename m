Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AE03B2C93DD
	for <lists+linux-omap@lfdr.de>; Tue,  1 Dec 2020 01:24:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388336AbgLAAXe (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 30 Nov 2020 19:23:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55586 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388331AbgLAAXe (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 30 Nov 2020 19:23:34 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B75DAC0613CF
        for <linux-omap@vger.kernel.org>; Mon, 30 Nov 2020 16:22:53 -0800 (PST)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id B457745D;
        Tue,  1 Dec 2020 01:22:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1606782171;
        bh=Kneg9nNkvX3Ek8BPh/XyI0mn11bKL4QfpqWbZj8Y2us=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=t1TvD1HabTRAZCk1E94vRyRg1rx0UG+q5RpuEJ5Bo391yxUd8SOFyEex+7R/9F9hh
         G4NZNXUJGb8/TAuG8JqbXIwTjD5J9zoosQx5fbpz0GBcwpXOtKHNBLF9xKTXhGb8ox
         Yy1Wiy3uFNuVrF/rsADY3cHHmoHDlcSvgEUdAGiA=
Date:   Tue, 1 Dec 2020 02:22:43 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Tomi Valkeinen <tomi.valkeinen@ti.com>
Cc:     Sebastian Reichel <sre@kernel.org>,
        Nikhil Devshatwar <nikhil.nd@ti.com>,
        linux-omap@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Sekhar Nori <nsekhar@ti.com>, Tony Lindgren <tony@atomide.com>,
        hns@goldelico.com
Subject: Re: [PATCH v4 68/80] drm/panel: panel-dsi-cm: remove extra 'if'
Message-ID: <20201201002243.GM25713@pendragon.ideasonboard.com>
References: <20201124124538.660710-1-tomi.valkeinen@ti.com>
 <20201124124538.660710-69-tomi.valkeinen@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20201124124538.660710-69-tomi.valkeinen@ti.com>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Tomi,

Thank you for the patch.

On Tue, Nov 24, 2020 at 02:45:26PM +0200, Tomi Valkeinen wrote:
> We have a useless 'if' in the dsicm_bl_update_status(), a left over from
> the conversion to DRM model. Drop the if.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
> ---
>  drivers/gpu/drm/panel/panel-dsi-cm.c | 10 ++++------
>  1 file changed, 4 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-dsi-cm.c b/drivers/gpu/drm/panel/panel-dsi-cm.c
> index 1e7f73340736..c17ed728c695 100644
> --- a/drivers/gpu/drm/panel/panel-dsi-cm.c
> +++ b/drivers/gpu/drm/panel/panel-dsi-cm.c
> @@ -194,7 +194,7 @@ static int dsicm_set_update_window(struct panel_drv_data *ddata)
>  static int dsicm_bl_update_status(struct backlight_device *dev)
>  {
>  	struct panel_drv_data *ddata = dev_get_drvdata(&dev->dev);
> -	int r = 0;
> +	int r;
>  	int level;
>  
>  	if (dev->props.fb_blank == FB_BLANK_UNBLANK &&
> @@ -207,11 +207,9 @@ static int dsicm_bl_update_status(struct backlight_device *dev)
>  
>  	mutex_lock(&ddata->lock);
>  
> -	if (ddata->enabled) {
> -		if (!r)
> -			r = dsicm_dcs_write_1(
> -				ddata, MIPI_DCS_SET_DISPLAY_BRIGHTNESS, level);
> -	}
> +	if (ddata->enabled)
> +		r = dsicm_dcs_write_1(ddata, MIPI_DCS_SET_DISPLAY_BRIGHTNESS,
> +				      level);

If !ddata->enabled, won't r be uninitialized ?

>  
>  	mutex_unlock(&ddata->lock);
>  

-- 
Regards,

Laurent Pinchart
