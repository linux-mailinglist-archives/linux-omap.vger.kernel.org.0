Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5B2DC2D2E82
	for <lists+linux-omap@lfdr.de>; Tue,  8 Dec 2020 16:43:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730180AbgLHPmy (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 8 Dec 2020 10:42:54 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:54454 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730167AbgLHPmy (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 8 Dec 2020 10:42:54 -0500
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id C87CFDD;
        Tue,  8 Dec 2020 16:42:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1607442133;
        bh=41IRw5dax42zDIhwooYf8UOz+N5DNrVW4XK4GxMZH+s=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=IteqodYsZr1LUQbD1mKmIX9elzNtB7Iitaeh718oqsw+eiq1qhz9NLCbb2NBOJR7c
         sF40mRBqa7brGyDPKW3fm3n7ajecAmLxRnoMaL7wdqOaCc/yMgxq3aZkq9l8uXA2cg
         RcPdWLZfMjr7BQpBi7RU0jOX7td38wGut5w42Do0=
Date:   Tue, 8 Dec 2020 17:42:09 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Tomi Valkeinen <tomi.valkeinen@ti.com>
Cc:     Sebastian Reichel <sre@kernel.org>,
        Nikhil Devshatwar <nikhil.nd@ti.com>,
        dri-devel@lists.freedesktop.org, linux-omap@vger.kernel.org,
        Sekhar Nori <nsekhar@ti.com>, Tony Lindgren <tony@atomide.com>,
        hns@goldelico.com, Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v5 14/29] drm/omap: dsi: enable HS before sending the
 frame
Message-ID: <X8+e0a9n8JBvPvhC@pendragon.ideasonboard.com>
References: <20201208122855.254819-1-tomi.valkeinen@ti.com>
 <20201208122855.254819-15-tomi.valkeinen@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20201208122855.254819-15-tomi.valkeinen@ti.com>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Tomi,

Thank you for the patch.

On Tue, Dec 08, 2020 at 02:28:40PM +0200, Tomi Valkeinen wrote:
> We currently use a single VC for sending commands and pixel data. The
> LP/HS mode for pixel data is correctly set to HS by accident, as we have
> set the VC to HS already earlier.
> 
> However, if we use a different VC for video data, the VC is in LP mode.
> Fix this by always enabling HS mode before starting a frame update.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/gpu/drm/omapdrm/dss/dsi.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/gpu/drm/omapdrm/dss/dsi.c b/drivers/gpu/drm/omapdrm/dss/dsi.c
> index 544f5f1eed91..9d210a020916 100644
> --- a/drivers/gpu/drm/omapdrm/dss/dsi.c
> +++ b/drivers/gpu/drm/omapdrm/dss/dsi.c
> @@ -3918,6 +3918,8 @@ static int dsi_update_channel(struct omap_dss_device *dssdev, int vc)
>  
>  	dsi_set_ulps_auto(dsi, false);
>  
> +	dsi_vc_enable_hs(dssdev, vc, true);
> +
>  	/*
>  	 * Send NOP between the frames. If we don't send something here, the
>  	 * updates stop working. This is probably related to DSI spec stating

-- 
Regards,

Laurent Pinchart
