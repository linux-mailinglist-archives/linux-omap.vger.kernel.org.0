Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C82EA2C941D
	for <lists+linux-omap@lfdr.de>; Tue,  1 Dec 2020 01:41:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728457AbgLAAlZ (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 30 Nov 2020 19:41:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58350 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726316AbgLAAlZ (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 30 Nov 2020 19:41:25 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 701B3C0613CF
        for <linux-omap@vger.kernel.org>; Mon, 30 Nov 2020 16:40:45 -0800 (PST)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 068FF31D;
        Tue,  1 Dec 2020 01:40:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1606783244;
        bh=8sve7zmvqAe3Z+4/N4WQsLh+Z5+v4sFLsIUAEN5CPAo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=slC5TUH+OmcptusG5xfP4G2Gvw69eTzWByIyVAhTOrfuhWUZjYbmoA3LzNPZ+LaEt
         6kJ1AOgU1hpAXWX4YgTdS7ECxVZrZIH033s44vnO/Hn/N5VVl4IPzGVRtVU8MGubft
         ff92CEWBtiFmWfVTqsjyVVejEjI+XI0M2IKT8jsE=
Date:   Tue, 1 Dec 2020 02:40:35 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Tomi Valkeinen <tomi.valkeinen@ti.com>
Cc:     Sebastian Reichel <sre@kernel.org>,
        Nikhil Devshatwar <nikhil.nd@ti.com>,
        linux-omap@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Sekhar Nori <nsekhar@ti.com>, Tony Lindgren <tony@atomide.com>,
        hns@goldelico.com
Subject: Re: [PATCH v4 80/80] drm/omap: dsi: fix DCS_CMD_ENABLE
Message-ID: <20201201004035.GD4315@pendragon.ideasonboard.com>
References: <20201124124538.660710-1-tomi.valkeinen@ti.com>
 <20201124124538.660710-81-tomi.valkeinen@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20201124124538.660710-81-tomi.valkeinen@ti.com>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Tomi,

Thank you for the patch.

On Tue, Nov 24, 2020 at 02:45:38PM +0200, Tomi Valkeinen wrote:
> We only need to set VC_CTRL:DCS_CMD_ENABLE for command mode panels when
> the HW has DSI_QUIRK_DCS_CMD_CONFIG_VC quirk. The old code did this
> right by accident, but now we set DCS_CMD_ENABLE for video mode panels
> too.
> 
> Fix this by skipping the set for video mode.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/gpu/drm/omapdrm/dss/dsi.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/omapdrm/dss/dsi.c b/drivers/gpu/drm/omapdrm/dss/dsi.c
> index ffecacd7350a..d52bef0c7aa2 100644
> --- a/drivers/gpu/drm/omapdrm/dss/dsi.c
> +++ b/drivers/gpu/drm/omapdrm/dss/dsi.c
> @@ -3401,7 +3401,8 @@ static void dsi_setup_dsi_vcs(struct dsi_data *dsi)
>  	REG_FLD_MOD(dsi, DSI_VC_CTRL(VC_VIDEO), 1, 1, 1); /* SOURCE_VP */
>  	dsi->vc[VC_VIDEO].source = DSI_VC_SOURCE_VP;
>  
> -	if (dsi->data->quirks & DSI_QUIRK_DCS_CMD_CONFIG_VC)
> +	if ((dsi->data->quirks & DSI_QUIRK_DCS_CMD_CONFIG_VC) &&
> +	    !(dsi->dsidev->mode_flags & MIPI_DSI_MODE_VIDEO))
>  		REG_FLD_MOD(dsi, DSI_VC_CTRL(VC_VIDEO), 1, 30, 30); /* DCS_CMD_ENABLE */
>  
>  	dsi_vc_enable(dsi, VC_CMD, 1);

-- 
Regards,

Laurent Pinchart
