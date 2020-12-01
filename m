Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ACE742C93CB
	for <lists+linux-omap@lfdr.de>; Tue,  1 Dec 2020 01:20:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729632AbgLAATg (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 30 Nov 2020 19:19:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54946 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729464AbgLAATg (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 30 Nov 2020 19:19:36 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 15308C0613D2
        for <linux-omap@vger.kernel.org>; Mon, 30 Nov 2020 16:18:56 -0800 (PST)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9ACBB45D;
        Tue,  1 Dec 2020 01:18:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1606781934;
        bh=34k77f7FdN4H2ZHL3+aEnNGB4NhXZrHet1Y8lbQPGIQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=bRI9xPQ627ONFqEif3d4774IAGZ8ZdSGWBADY+rJnrLpdcKTnwKwhKpf4OAgW+KXD
         pWumj7NWk9z6TCWHIkoTag/zcTTZZwqExuW2aemuChEcuzxNB1Z0oVt/uSwo5JZCUf
         MBtZoSbl6kfV/FApsBNEV9omTRyT6vMO16OchczE=
Date:   Tue, 1 Dec 2020 02:18:46 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Tomi Valkeinen <tomi.valkeinen@ti.com>
Cc:     Sebastian Reichel <sre@kernel.org>,
        Nikhil Devshatwar <nikhil.nd@ti.com>,
        linux-omap@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Sekhar Nori <nsekhar@ti.com>, Tony Lindgren <tony@atomide.com>,
        hns@goldelico.com
Subject: Re: [PATCH v4 65/80] drm/omap: dsi: skip dsi_vc_enable_hs when
 already in correct mode
Message-ID: <20201201001846.GJ25713@pendragon.ideasonboard.com>
References: <20201124124538.660710-1-tomi.valkeinen@ti.com>
 <20201124124538.660710-66-tomi.valkeinen@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20201124124538.660710-66-tomi.valkeinen@ti.com>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Tomi,

Thank you for the patch.

On Tue, Nov 24, 2020 at 02:45:23PM +0200, Tomi Valkeinen wrote:
> Simplify and optimize dsi_vc_enable_hs() so that it can be called
> without checking the current HS/LP mode. Make dsi_vc_enable_hs() return
> if the VC is already in the correct mode.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
> ---
>  drivers/gpu/drm/omapdrm/dss/dsi.c | 10 ++++------
>  1 file changed, 4 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/omapdrm/dss/dsi.c b/drivers/gpu/drm/omapdrm/dss/dsi.c
> index 4ac82166edc3..c3f13226ac26 100644
> --- a/drivers/gpu/drm/omapdrm/dss/dsi.c
> +++ b/drivers/gpu/drm/omapdrm/dss/dsi.c
> @@ -341,7 +341,6 @@ struct dsi_data {
>  	int irq;
>  
>  	bool is_enabled;
> -	bool in_lp_mode;
>  
>  	struct clk *dss_clk;
>  	struct regmap *syscon;
> @@ -2441,6 +2440,9 @@ static void dsi_vc_enable_hs(struct omap_dss_device *dssdev, int vc,
>  
>  	DSSDBG("dsi_vc_enable_hs(%d, %d)\n", vc, enable);
>  
> +	if (REG_GET(dsi, DSI_VC_CTRL(vc), 9, 9) == enable)
> +		return;
> +

I tend to prefer cached state instead of reading it back from the
hardware, as it's (marginally) more efficient. In either case,

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

>  	WARN_ON(!dsi_bus_is_locked(dsi));
>  
>  	dsi_vc_enable(dsi, vc, 0);
> @@ -2456,8 +2458,6 @@ static void dsi_vc_enable_hs(struct omap_dss_device *dssdev, int vc,
>  	/* start the DDR clock by sending a NULL packet */
>  	if (dsi->vm_timings.ddr_clk_always_on && enable)
>  		dsi_vc_send_null(dsi, vc, dsi->dsidev->channel);
> -
> -	dsi->in_lp_mode = !enable;
>  }
>  
>  static void dsi_vc_flush_long_data(struct dsi_data *dsi, int vc)
> @@ -4886,9 +4886,7 @@ static ssize_t _omap_dsi_host_transfer(struct dsi_data *dsi, int vc,
>  	struct omap_dss_device *dssdev = &dsi->output;
>  	int r;
>  
> -	if (!!(msg->flags & MIPI_DSI_MSG_USE_LPM) != dsi->in_lp_mode)
> -		dsi_vc_enable_hs(dssdev, vc,
> -				 !(msg->flags & MIPI_DSI_MSG_USE_LPM));
> +	dsi_vc_enable_hs(dssdev, vc, !(msg->flags & MIPI_DSI_MSG_USE_LPM));
>  
>  	switch (msg->type) {
>  	case MIPI_DSI_GENERIC_SHORT_WRITE_0_PARAM:

-- 
Regards,

Laurent Pinchart
