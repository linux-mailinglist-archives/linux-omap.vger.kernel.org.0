Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C4C882AB5D7
	for <lists+linux-omap@lfdr.de>; Mon,  9 Nov 2020 12:05:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729446AbgKILFX (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 9 Nov 2020 06:05:23 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:41272 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727077AbgKILFW (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 9 Nov 2020 06:05:22 -0500
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 67647B2B;
        Mon,  9 Nov 2020 12:05:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1604919920;
        bh=tdFpQi0p3bCo+B/lrNtcTVZ2O5tTAfaVyITiCcu1u5A=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=gO0ceIxHoueI443gwMNL22a3702nrXv2E9FrVmScY1ZBPB9ssTk8HOzHJ0ImyjVW1
         YS96aavb73sM94o6tLUzS1aZ/srHXPLfRcQgKWWty4Jrbkq5DDUA7Idx8jaeMUt5vw
         En3A5PnQYgWk7FgsBB62gGSfKDg9VBv88jcJJb/4=
Date:   Mon, 9 Nov 2020 13:05:17 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Tomi Valkeinen <tomi.valkeinen@ti.com>
Cc:     Sebastian Reichel <sre@kernel.org>,
        Nikhil Devshatwar <nikhil.nd@ti.com>,
        linux-omap@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Sekhar Nori <nsekhar@ti.com>, Tony Lindgren <tony@atomide.com>,
        "H . Nikolaus Schaller" <hns@goldelico.com>,
        Sebastian Reichel <sebastian.reichel@collabora.com>
Subject: Re: [PATCH v3 46/56] drm/omap: drop empty omap_encoder helper
 functions
Message-ID: <20201109110517.GQ6029@pendragon.ideasonboard.com>
References: <20201105120333.947408-1-tomi.valkeinen@ti.com>
 <20201105120333.947408-47-tomi.valkeinen@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20201105120333.947408-47-tomi.valkeinen@ti.com>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Tomi and Sebastian,

Thank you for the patch.

On Thu, Nov 05, 2020 at 02:03:23PM +0200, Tomi Valkeinen wrote:
> From: Sebastian Reichel <sebastian.reichel@collabora.com>
> 
> Cleanup empty functions for encoder enable, disable and atomic check.
> 
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/gpu/drm/omapdrm/omap_encoder.c | 28 --------------------------
>  1 file changed, 28 deletions(-)
> 
> diff --git a/drivers/gpu/drm/omapdrm/omap_encoder.c b/drivers/gpu/drm/omapdrm/omap_encoder.c
> index 5f5fa01240a7..e24411fb9dac 100644
> --- a/drivers/gpu/drm/omapdrm/omap_encoder.c
> +++ b/drivers/gpu/drm/omapdrm/omap_encoder.c
> @@ -113,36 +113,8 @@ static void omap_encoder_mode_set(struct drm_encoder *encoder,
>  	dss_mgr_set_timings(output, &vm);
>  }
>  
> -static void omap_encoder_disable(struct drm_encoder *encoder)
> -{
> -	struct omap_encoder *omap_encoder = to_omap_encoder(encoder);
> -	struct omap_dss_device *dssdev = omap_encoder->output;
> -	struct drm_device *dev = encoder->dev;
> -
> -	dev_dbg(dev->dev, "disable(%s)\n", dssdev->name);
> -}
> -
> -static void omap_encoder_enable(struct drm_encoder *encoder)
> -{
> -	struct omap_encoder *omap_encoder = to_omap_encoder(encoder);
> -	struct omap_dss_device *dssdev = omap_encoder->output;
> -	struct drm_device *dev = encoder->dev;
> -
> -	dev_dbg(dev->dev, "enable(%s)\n", dssdev->name);
> -}
> -
> -static int omap_encoder_atomic_check(struct drm_encoder *encoder,
> -				     struct drm_crtc_state *crtc_state,
> -				     struct drm_connector_state *conn_state)
> -{
> -	return 0;
> -}
> -
>  static const struct drm_encoder_helper_funcs omap_encoder_helper_funcs = {
>  	.mode_set = omap_encoder_mode_set,
> -	.disable = omap_encoder_disable,
> -	.enable = omap_encoder_enable,
> -	.atomic_check = omap_encoder_atomic_check,
>  };
>  
>  /* initialize encoder */

-- 
Regards,

Laurent Pinchart
