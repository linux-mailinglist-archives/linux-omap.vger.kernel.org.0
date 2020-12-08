Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DEFEB2D2E87
	for <lists+linux-omap@lfdr.de>; Tue,  8 Dec 2020 16:44:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730191AbgLHPnY (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 8 Dec 2020 10:43:24 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:54486 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729457AbgLHPnY (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 8 Dec 2020 10:43:24 -0500
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 65742335;
        Tue,  8 Dec 2020 16:42:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1607442162;
        bh=bSTYM8+wSO0p71b5KCepk0WRcteaJGfSLe/NDv+Koco=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=icFZUYd8CWrgS6TDpOCwaKI3MBBpEjo1q5/Zd4X7INaCbttHd8hb+3e31OdOzxuGE
         CpHFHxVdLYgPjIPw478/37wzOGo2wwFgAzP9ivIFfs8pucbjLIHuJP5cdOYCRW2jtD
         5Prbk7mwtmVEiFxslgA3vfCO9J+Nl75/8MYqZV7s=
Date:   Tue, 8 Dec 2020 17:42:39 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Tomi Valkeinen <tomi.valkeinen@ti.com>
Cc:     Sebastian Reichel <sre@kernel.org>,
        Nikhil Devshatwar <nikhil.nd@ti.com>,
        dri-devel@lists.freedesktop.org, linux-omap@vger.kernel.org,
        Sekhar Nori <nsekhar@ti.com>, Tony Lindgren <tony@atomide.com>,
        hns@goldelico.com, Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v5 16/29] drm/panel: panel-dsi-cm: remove extra 'if'
Message-ID: <X8+e755PHCL+HxnN@pendragon.ideasonboard.com>
References: <20201208122855.254819-1-tomi.valkeinen@ti.com>
 <20201208122855.254819-17-tomi.valkeinen@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20201208122855.254819-17-tomi.valkeinen@ti.com>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Tomi,

Thank you for the patch.

On Tue, Dec 08, 2020 at 02:28:42PM +0200, Tomi Valkeinen wrote:
> We have a useless 'if' in the dsicm_bl_update_status(), a left over from
> the conversion to DRM model. Drop the if.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
> Reviewed-by: Sam Ravnborg <sam@ravnborg.org>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/gpu/drm/panel/panel-dsi-cm.c | 8 +++-----
>  1 file changed, 3 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-dsi-cm.c b/drivers/gpu/drm/panel/panel-dsi-cm.c
> index 556f9a2c5c0c..fa564aad7f25 100644
> --- a/drivers/gpu/drm/panel/panel-dsi-cm.c
> +++ b/drivers/gpu/drm/panel/panel-dsi-cm.c
> @@ -202,11 +202,9 @@ static int dsicm_bl_update_status(struct backlight_device *dev)
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
>  
>  	mutex_unlock(&ddata->lock);
>  

-- 
Regards,

Laurent Pinchart
