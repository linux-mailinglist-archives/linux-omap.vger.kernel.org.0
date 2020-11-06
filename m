Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B968D2A8E72
	for <lists+linux-omap@lfdr.de>; Fri,  6 Nov 2020 05:41:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726103AbgKFEla (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 5 Nov 2020 23:41:30 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:59388 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725842AbgKFEla (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 5 Nov 2020 23:41:30 -0500
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id CA4E5B16;
        Fri,  6 Nov 2020 05:41:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1604637688;
        bh=rMwUdWUtHi3sIZJYwTwbgP35duWhK1QVbKXTRTZIzDU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=HRkdmtYzhrZdYAM9HC2zz7MP8M1+eGJtiAIQXOE60Q9vsg9t4N6tEeq8/PzW6O1U5
         Et/7xznSGg1uS97+5maW/mMcZDIi5oXLGUgX6PYX0tj3tf1V5jYmfzP8lYhA04sEzp
         vshw24H6tvWqRvRRPeUJW0wzmPMw3Ifg7Xe50olM=
Date:   Fri, 6 Nov 2020 06:41:26 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Tomi Valkeinen <tomi.valkeinen@ti.com>
Cc:     Sebastian Reichel <sre@kernel.org>,
        Nikhil Devshatwar <nikhil.nd@ti.com>,
        linux-omap@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Sekhar Nori <nsekhar@ti.com>, Tony Lindgren <tony@atomide.com>,
        "H . Nikolaus Schaller" <hns@goldelico.com>,
        Sebastian Reichel <sebastian.reichel@collabora.com>
Subject: Re: [PATCH v3 01/56] drm/dsi: add MIPI_DSI_MODE_ULPS_IDLE
Message-ID: <20201106044126.GB16469@pendragon.ideasonboard.com>
References: <20201105120333.947408-1-tomi.valkeinen@ti.com>
 <20201105120333.947408-2-tomi.valkeinen@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20201105120333.947408-2-tomi.valkeinen@ti.com>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Tomi and Sebastian,

Thank you for the patch.

On Thu, Nov 05, 2020 at 02:02:38PM +0200, Tomi Valkeinen wrote:
> From: Sebastian Reichel <sebastian.reichel@collabora.com>
> 
> DSI command mode panels are self-refreshing displays, that
> can be updated very rarely for static images. For this kind
> of scenario some panels support, that the DSI bus switches
> into ULPS mode until the panel needs to be refreshed.
> 
> This is problematic on some panels, so introduce a flag to
> signal the DSI host implementation that the panel allows
> going into ULPS mode.
> 
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  include/drm/drm_mipi_dsi.h | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/include/drm/drm_mipi_dsi.h b/include/drm/drm_mipi_dsi.h
> index 360e6377e84b..f36f89c14b4a 100644
> --- a/include/drm/drm_mipi_dsi.h
> +++ b/include/drm/drm_mipi_dsi.h
> @@ -132,6 +132,8 @@ struct mipi_dsi_host *of_find_mipi_dsi_host_by_node(struct device_node *node);
>  #define MIPI_DSI_CLOCK_NON_CONTINUOUS	BIT(10)
>  /* transmit data in low power */
>  #define MIPI_DSI_MODE_LPM		BIT(11)
> +/* allow going into ULPS mode while command mode panel is not updated */
> +#define MIPI_DSI_MODE_ULPS_IDLE		BIT(12)
>  
>  enum mipi_dsi_pixel_format {
>  	MIPI_DSI_FMT_RGB888,

-- 
Regards,

Laurent Pinchart
