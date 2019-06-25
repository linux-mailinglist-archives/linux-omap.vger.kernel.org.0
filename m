Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4610C5590D
	for <lists+linux-omap@lfdr.de>; Tue, 25 Jun 2019 22:40:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726772AbfFYUkF (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 25 Jun 2019 16:40:05 -0400
Received: from asavdk3.altibox.net ([109.247.116.14]:60333 "EHLO
        asavdk3.altibox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726053AbfFYUkF (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 25 Jun 2019 16:40:05 -0400
Received: from ravnborg.org (unknown [158.248.194.18])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by asavdk3.altibox.net (Postfix) with ESMTPS id 86EE32002F;
        Tue, 25 Jun 2019 22:40:01 +0200 (CEST)
Date:   Tue, 25 Jun 2019 22:40:00 +0200
From:   Sam Ravnborg <sam@ravnborg.org>
To:     "H. Nikolaus Schaller" <hns@goldelico.com>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, tomi.valkeinen@ti.com,
        imirkin@alum.mit.edu, marek.belisko@gmail.com,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        letux-kernel@openphoenux.org
Subject: Re: [PATCH v3 2/5] drm/panel: simple: Add Ortustech COM37H3M panel
 support
Message-ID: <20190625204000.GC18595@ravnborg.org>
References: <cover.1559905870.git.hns@goldelico.com>
 <43b47034b618cff26cea0484591c6deafb7f0685.1559905870.git.hns@goldelico.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <43b47034b618cff26cea0484591c6deafb7f0685.1559905870.git.hns@goldelico.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=dqr19Wo4 c=1 sm=1 tr=0
        a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
        a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=ztCEdXhiAAAA:8
        a=7gkXJVJtAAAA:8 a=e5mUnYsNAAAA:8 a=mnJRnKJ8Oc643HJHjbEA:9
        a=CjuIK1q_8ugA:10 a=nCm3ceeH17rKjHWsMeRo:22 a=E9Po1WZjFZOl8hwRPBS3:22
        a=Vxmtnl_E_bksehYqCbjh:22
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Fri, Jun 07, 2019 at 01:11:08PM +0200, H. Nikolaus Schaller wrote:
> The change adds support for the Ortustech COM37H3M05DTC/99DTC 3.7" TFT LCD panel.
> 
> Tested on Letux3704.
> 
> Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
> ---
>  drivers/gpu/drm/panel/panel-simple.c | 33 ++++++++++++++++++++++++++++
>  1 file changed, 33 insertions(+)
> 
> diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
> index 5b27829c5a78..1fb74908a269 100644
> --- a/drivers/gpu/drm/panel/panel-simple.c
> +++ b/drivers/gpu/drm/panel/panel-simple.c
> @@ -2007,6 +2007,33 @@ static const struct panel_desc ontat_yx700wv03 = {
>  	.bus_format = MEDIA_BUS_FMT_RGB666_1X18,
>  };
>  
> +static const struct drm_display_mode ortustech_com37h3m_mode  = {
> +	.clock = 22153,
> +	.hdisplay = 480,
> +	.hsync_start = 480 + 8,
> +	.hsync_end = 480 + 8 + 10,
> +	.htotal = 480 + 8 + 10 + 10,
> +	.vdisplay = 640,
> +	.vsync_start = 640 + 4,
> +	.vsync_end = 640 + 4 + 3,
> +	.vtotal = 640 + 4 + 3 + 4,
> +	.vrefresh = 60,
> +	.flags = DRM_MODE_FLAG_NVSYNC | DRM_MODE_FLAG_NHSYNC,
> +};
> +
> +static const struct panel_desc ortustech_com37h3m = {
> +	.modes = &ortustech_com37h3m_mode,
> +	.num_modes = 1,
> +	.bpc = 8,
> +	.size = {
> +		.width = 56,	/* 56.16mm */
> +		.height = 75,	/* 74.88mm */
> +	},
> +	.bus_format = MEDIA_BUS_FMT_RGB888_1X24,
> +	.bus_flags = DRM_BUS_FLAG_DE_HIGH | DRM_BUS_FLAG_PIXDATA_POSEDGE |
> +		     DRM_BUS_FLAG_SYNC_DRIVE_POSEDGE,
> +};
> +
>  static const struct drm_display_mode ortustech_com43h4m85ulc_mode  = {
>  	.clock = 25000,
>  	.hdisplay = 480,
> @@ -2786,6 +2813,12 @@ static const struct of_device_id platform_of_match[] = {
>  	}, {
>  		.compatible = "ontat,yx700wv03",
>  		.data = &ontat_yx700wv03,
> +	}, {
> +		.compatible = "ortustech,com37h3m05dtc",
> +		.data = &ortustech_com37h3m,
> +	}, {
> +		.compatible = "ortustech,com37h3m99dtc",
> +		.data = &ortustech_com37h3m,
>  	}, {
>  		.compatible = "ortustech,com43h4m85ulc",
>  		.data = &ortustech_com43h4m85ulc,
> -- 
> 2.19.1
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
