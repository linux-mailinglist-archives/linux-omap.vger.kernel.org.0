Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 73C012AB5BF
	for <lists+linux-omap@lfdr.de>; Mon,  9 Nov 2020 12:03:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729168AbgKILDs (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 9 Nov 2020 06:03:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58954 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727311AbgKILDs (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 9 Nov 2020 06:03:48 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 05F7FC0613CF
        for <linux-omap@vger.kernel.org>; Mon,  9 Nov 2020 03:03:48 -0800 (PST)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6EC70B2B;
        Mon,  9 Nov 2020 12:03:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1604919826;
        bh=b+vOTMVp88TQXSCdD0UnHPHbMtdpOOe+ETl+qP/YvDE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=TBWYK2L8X5PP28HSZyIJShwmBW+xzBquRnbIvtLgo5cLA/Z4wM5OIYMptLFVJ1d7X
         Qfr0uqWTQb7y1Sv81bJnfCwSTjC75EKN9By/mc57ljWtrYiB80b/+g0kLKdh0ySlJu
         Ms02fzDtBz4wZXHvLt5Ob7gWodr+Z5OHqEJvF5P4=
Date:   Mon, 9 Nov 2020 13:03:43 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Tomi Valkeinen <tomi.valkeinen@ti.com>
Cc:     Sebastian Reichel <sre@kernel.org>,
        Nikhil Devshatwar <nikhil.nd@ti.com>,
        linux-omap@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Sekhar Nori <nsekhar@ti.com>, Tony Lindgren <tony@atomide.com>,
        "H . Nikolaus Schaller" <hns@goldelico.com>,
        Sebastian Reichel <sebastian.reichel@collabora.com>
Subject: Re: [PATCH v3 44/56] drm/omap: simplify omap_display_id
Message-ID: <20201109110343.GO6029@pendragon.ideasonboard.com>
References: <20201105120333.947408-1-tomi.valkeinen@ti.com>
 <20201105120333.947408-45-tomi.valkeinen@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20201105120333.947408-45-tomi.valkeinen@ti.com>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Tomi and Sebastian,

Thank you for the patch.

On Thu, Nov 05, 2020 at 02:03:21PM +0200, Tomi Valkeinen wrote:
> From: Sebastian Reichel <sebastian.reichel@collabora.com>
> 
> We no longer need to check for the DSS API, since all encoders,
> panels and connectors have been converted to the bridge API.
> 
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/gpu/drm/omapdrm/omap_drv.c | 9 +--------
>  1 file changed, 1 insertion(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/omapdrm/omap_drv.c b/drivers/gpu/drm/omapdrm/omap_drv.c
> index 20b5b4e9071c..dbb8e95234b3 100644
> --- a/drivers/gpu/drm/omapdrm/omap_drv.c
> +++ b/drivers/gpu/drm/omapdrm/omap_drv.c
> @@ -206,14 +206,7 @@ static int omap_display_id(struct omap_dss_device *output)
>  {
>  	struct device_node *node = NULL;
>  
> -	if (output->next) {
> -		struct omap_dss_device *display = output;
> -
> -		while (display->next)
> -			display = display->next;
> -
> -		node = display->dev->of_node;
> -	} else if (output->bridge) {
> +	if (output->bridge) {
>  		struct drm_bridge *bridge = output->bridge;
>  
>  		while (drm_bridge_get_next_bridge(bridge))
> 

-- 
Regards,

Laurent Pinchart
