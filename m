Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 68AD42AB5E0
	for <lists+linux-omap@lfdr.de>; Mon,  9 Nov 2020 12:06:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729228AbgKILGq (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 9 Nov 2020 06:06:46 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:41324 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727303AbgKILGq (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 9 Nov 2020 06:06:46 -0500
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4B396B2B;
        Mon,  9 Nov 2020 12:06:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1604920003;
        bh=2svvc5akzhW3ySNEkMyY8/uJ46WMYi73daZ2k2u4S5w=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=IyyCOFHw8G3lg/gj7I5BydgUJ3jWkaqQ3MJlYr1gSnZii61Zml9U4oCCztjb69u7g
         nM2JWUWjZaCnK12AKb81UPlWVf4Qg2cE9562mGFu5RAMkU/AEGZq3+xCkmOKTyosQV
         LkXPGNwZhJZES+sYJkFwGwn8lBIINxG9isP3umWU=
Date:   Mon, 9 Nov 2020 13:06:40 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Tomi Valkeinen <tomi.valkeinen@ti.com>
Cc:     Sebastian Reichel <sre@kernel.org>,
        Nikhil Devshatwar <nikhil.nd@ti.com>,
        linux-omap@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Sekhar Nori <nsekhar@ti.com>, Tony Lindgren <tony@atomide.com>,
        "H . Nikolaus Schaller" <hns@goldelico.com>,
        Sebastian Reichel <sebastian.reichel@collabora.com>
Subject: Re: [PATCH v3 48/56] drm/omap: drop dssdev display field
Message-ID: <20201109110640.GS6029@pendragon.ideasonboard.com>
References: <20201105120333.947408-1-tomi.valkeinen@ti.com>
 <20201105120333.947408-49-tomi.valkeinen@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20201105120333.947408-49-tomi.valkeinen@ti.com>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Tomi and Sebastian,

Thank you for the patch.

On Thu, Nov 05, 2020 at 02:03:25PM +0200, Tomi Valkeinen wrote:
> From: Sebastian Reichel <sebastian.reichel@collabora.com>
> 
> All displays are using drm_panel instead off dssdev

drm_panel or a drm_bridge that models the connected.

> now, so this field is always 0 and can be dropped.
> 
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/gpu/drm/omapdrm/dss/base.c    | 2 +-
>  drivers/gpu/drm/omapdrm/dss/omapdss.h | 6 ------
>  2 files changed, 1 insertion(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/omapdrm/dss/base.c b/drivers/gpu/drm/omapdrm/dss/base.c
> index d62713b241d2..d9a5e7b9d401 100644
> --- a/drivers/gpu/drm/omapdrm/dss/base.c
> +++ b/drivers/gpu/drm/omapdrm/dss/base.c
> @@ -198,7 +198,7 @@ void omapdss_device_disconnect(struct omap_dss_device *src,
>  	}
>  
>  	if (!dst->id && !omapdss_device_is_connected(dst)) {
> -		WARN_ON(!dst->display);
> +		WARN_ON(1);
>  		return;
>  	}
>  
> diff --git a/drivers/gpu/drm/omapdrm/dss/omapdss.h b/drivers/gpu/drm/omapdrm/dss/omapdss.h
> index 916c55101629..c2199c4946ec 100644
> --- a/drivers/gpu/drm/omapdrm/dss/omapdss.h
> +++ b/drivers/gpu/drm/omapdrm/dss/omapdss.h
> @@ -298,12 +298,6 @@ struct omap_dss_device {
>  	 */
>  	enum omap_display_type type;
>  
> -	/*
> -	 * True if the device is a display (panel or connector) at the end of
> -	 * the pipeline, false otherwise.
> -	 */
> -	bool display;
> -
>  	const char *name;
>  
>  	const struct omap_dss_device_ops *ops;

-- 
Regards,

Laurent Pinchart
