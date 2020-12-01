Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C191E2C940A
	for <lists+linux-omap@lfdr.de>; Tue,  1 Dec 2020 01:34:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389110AbgLAAdt (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 30 Nov 2020 19:33:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57180 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389108AbgLAAdt (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 30 Nov 2020 19:33:49 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1BAB5C0613D2
        for <linux-omap@vger.kernel.org>; Mon, 30 Nov 2020 16:33:09 -0800 (PST)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 18AE831D;
        Tue,  1 Dec 2020 01:33:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1606782787;
        bh=zHkFpFJk1EHrcOyzIYV3F+ExzvqPuUphPS1SQfgLM0E=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=YYCkRCmVWkRdDQG//iQz4n26oHvkFoBjx4R//UCZ6/SQdwtGMnUbvANtI7IeSD/xs
         q16EYkjIVQSfNzHzZWF2Ohdf5oO3Jh35ELQTQAKoZXR73L3RRfqxeSi5NO8lbmRWBh
         PS7vUnL1bpg4W5uVnvE+VB+me5z1d5iF3CdssNKc=
Date:   Tue, 1 Dec 2020 02:32:57 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Tomi Valkeinen <tomi.valkeinen@ti.com>
Cc:     Sebastian Reichel <sre@kernel.org>,
        Nikhil Devshatwar <nikhil.nd@ti.com>,
        linux-omap@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Sekhar Nori <nsekhar@ti.com>, Tony Lindgren <tony@atomide.com>,
        hns@goldelico.com
Subject: Re: [PATCH v4 73/80] drm/omap: dsi: display_enable cleanup
Message-ID: <20201201003257.GR25713@pendragon.ideasonboard.com>
References: <20201124124538.660710-1-tomi.valkeinen@ti.com>
 <20201124124538.660710-74-tomi.valkeinen@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20201124124538.660710-74-tomi.valkeinen@ti.com>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Tomi,

Thank you for the patch.

On Tue, Nov 24, 2020 at 02:45:31PM +0200, Tomi Valkeinen wrote:
> We can drop dsi_display_enable(), which just calls
> _dsi_display_enable(), and rename _dsi_display_enable() to
> dsi_display_enable().

How about adding a comment here to explain why the WARN_ON() is needed
anymore ?

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
> ---
>  drivers/gpu/drm/omapdrm/dss/dsi.c | 16 +++-------------
>  1 file changed, 3 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/gpu/drm/omapdrm/dss/dsi.c b/drivers/gpu/drm/omapdrm/dss/dsi.c
> index 4f79d6c664ff..e50418db71ef 100644
> --- a/drivers/gpu/drm/omapdrm/dss/dsi.c
> +++ b/drivers/gpu/drm/omapdrm/dss/dsi.c
> @@ -3738,7 +3738,7 @@ static void dsi_display_uninit_dsi(struct dsi_data *dsi, bool disconnect_lanes,
>  	}
>  }
>  
> -static void _dsi_display_enable(struct dsi_data *dsi)
> +static void dsi_display_enable(struct dsi_data *dsi)
>  {
>  	int r;
>  
> @@ -3767,16 +3767,6 @@ static void _dsi_display_enable(struct dsi_data *dsi)
>  	DSSDBG("dsi_display_ulps_enable FAILED\n");
>  }
>  
> -static void dsi_display_enable(struct omap_dss_device *dssdev)
> -{
> -	struct dsi_data *dsi = to_dsi_data(dssdev);
> -	DSSDBG("dsi_display_enable\n");
> -
> -	WARN_ON(!dsi_bus_is_locked(dsi));
> -
> -	_dsi_display_enable(dsi);
> -}
> -
>  static void _dsi_display_disable(struct dsi_data *dsi,
>  		bool disconnect_lanes, bool enter_ulps)
>  {
> @@ -3851,7 +3841,7 @@ static void dsi_set_ulps_auto(struct dsi_data *dsi, bool enable)
>  			return;
>  
>  		dsi_bus_lock(dsi);
> -		_dsi_display_enable(dsi);
> +		dsi_display_enable(dsi);
>  		dsi_enable_te(dsi, true);
>  		dsi_bus_unlock(dsi);
>  	}
> @@ -4942,7 +4932,7 @@ static void dsi_bridge_enable(struct drm_bridge *bridge)
>  
>  	dsi_bus_lock(dsi);
>  
> -	dsi_display_enable(dssdev);
> +	dsi_display_enable(dsi);
>  
>  	dsi_enable_video_output(dssdev, VC_VIDEO);
>  

-- 
Regards,

Laurent Pinchart
