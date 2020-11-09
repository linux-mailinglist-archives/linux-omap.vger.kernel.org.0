Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 492FD2AB2A2
	for <lists+linux-omap@lfdr.de>; Mon,  9 Nov 2020 09:44:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726176AbgKIIo2 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 9 Nov 2020 03:44:28 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:39572 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726127AbgKIIo2 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 9 Nov 2020 03:44:28 -0500
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id C92482FE;
        Mon,  9 Nov 2020 09:44:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1604911467;
        bh=uil22SZmzLA9OiW5GKh7qc4WY2JG3YWY5xYTjmchaiY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=fI18fIhWap6DfiPeFKFnX8BXjk9WukyWLqPFmgaTbFtsAGD2MDDJA32X3LwkZOOTF
         bf7Awh6KeK0zdWniFBAFDs6DFwZZVbjsIXexAbplhG8ekXiNImIuuYKMgxB9OG0otf
         0g6dBxbSS0cxVASnxm4mwEVcV4f8Dczbt1FmORPM=
Date:   Mon, 9 Nov 2020 10:44:23 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Tomi Valkeinen <tomi.valkeinen@ti.com>
Cc:     Sebastian Reichel <sre@kernel.org>,
        Nikhil Devshatwar <nikhil.nd@ti.com>,
        linux-omap@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Sekhar Nori <nsekhar@ti.com>, Tony Lindgren <tony@atomide.com>,
        "H . Nikolaus Schaller" <hns@goldelico.com>,
        Sebastian Reichel <sebastian.reichel@collabora.com>
Subject: Re: [PATCH v3 17/56] drm/omap: panel-dsi-cm: use common MIPI DCS 1.3
 defines
Message-ID: <20201109084423.GN6029@pendragon.ideasonboard.com>
References: <20201105120333.947408-1-tomi.valkeinen@ti.com>
 <20201105120333.947408-18-tomi.valkeinen@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20201105120333.947408-18-tomi.valkeinen@ti.com>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Tomi and Sebastian,

Thank you for the patch.

On Thu, Nov 05, 2020 at 02:02:54PM +0200, Tomi Valkeinen wrote:
> From: Sebastian Reichel <sebastian.reichel@collabora.com>
> 
> Drop local definition of common MIPI DCS 1.3 defines.
> 
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
> ---
>  drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c b/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c
> index 25183744a61d..a7236d9c3046 100644
> --- a/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c
> +++ b/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c
> @@ -28,8 +28,6 @@
>  #include "../dss/omapdss.h"
>  
>  #define DCS_READ_NUM_ERRORS	0x05
> -#define DCS_BRIGHTNESS		0x51
> -#define DCS_CTRL_DISPLAY	0x53
>  #define DCS_GET_ID1		0xda
>  #define DCS_GET_ID2		0xdb
>  #define DCS_GET_ID3		0xdc
> @@ -333,8 +331,10 @@ static int dsicm_bl_update_status(struct backlight_device *dev)
>  		src->ops->dsi.bus_lock(src);
>  
>  		r = dsicm_wake_up(ddata);
> -		if (!r)
> -			r = dsicm_dcs_write_1(ddata, DCS_BRIGHTNESS, level);
> +		if (!r) {
> +			r = dsicm_dcs_write_1(ddata,
> +				MIPI_DCS_SET_DISPLAY_BRIGHTNESS, level);
> +		}

Weird indentation, and no need for curly brackets, but no big deal.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

>  
>  		src->ops->dsi.bus_unlock(src);
>  	}
> @@ -597,11 +597,11 @@ static int dsicm_power_on(struct panel_drv_data *ddata)
>  	if (r)
>  		goto err;
>  
> -	r = dsicm_dcs_write_1(ddata, DCS_BRIGHTNESS, 0xff);
> +	r = dsicm_dcs_write_1(ddata, MIPI_DCS_SET_DISPLAY_BRIGHTNESS, 0xff);
>  	if (r)
>  		goto err;
>  
> -	r = dsicm_dcs_write_1(ddata, DCS_CTRL_DISPLAY,
> +	r = dsicm_dcs_write_1(ddata, MIPI_DCS_WRITE_CONTROL_DISPLAY,
>  			(1<<2) | (1<<5));	/* BL | BCTRL */
>  	if (r)
>  		goto err;

-- 
Regards,

Laurent Pinchart
