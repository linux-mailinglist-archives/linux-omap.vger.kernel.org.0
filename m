Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E16AF55907
	for <lists+linux-omap@lfdr.de>; Tue, 25 Jun 2019 22:39:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727191AbfFYUjr (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 25 Jun 2019 16:39:47 -0400
Received: from asavdk3.altibox.net ([109.247.116.14]:60319 "EHLO
        asavdk3.altibox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726053AbfFYUjr (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 25 Jun 2019 16:39:47 -0400
Received: from ravnborg.org (unknown [158.248.194.18])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by asavdk3.altibox.net (Postfix) with ESMTPS id 812222002F;
        Tue, 25 Jun 2019 22:39:43 +0200 (CEST)
Date:   Tue, 25 Jun 2019 22:39:37 +0200
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
Subject: Re: [PATCH v3 1/5] drm/panel: simple: Add Sharp LQ070Y3DG3B panel
 support
Message-ID: <20190625203937.GB18595@ravnborg.org>
References: <cover.1559905870.git.hns@goldelico.com>
 <d16aaa1ac93e4f15c13cd7d621de95836257676a.1559905870.git.hns@goldelico.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d16aaa1ac93e4f15c13cd7d621de95836257676a.1559905870.git.hns@goldelico.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=dqr19Wo4 c=1 sm=1 tr=0
        a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
        a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=ztCEdXhiAAAA:8
        a=7gkXJVJtAAAA:8 a=e5mUnYsNAAAA:8 a=AypoIBVMmSo6Qq-R-C8A:9
        a=CjuIK1q_8ugA:10 a=nCm3ceeH17rKjHWsMeRo:22 a=E9Po1WZjFZOl8hwRPBS3:22
        a=Vxmtnl_E_bksehYqCbjh:22
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Fri, Jun 07, 2019 at 01:11:07PM +0200, H. Nikolaus Schaller wrote:
> The change adds support for the Sharp LQ070Y3DG3B 7.0" TFT LCD panel.
> 
> Tested on Letux7004.
> 
> Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
> ---
>  drivers/gpu/drm/panel/panel-simple.c | 30 ++++++++++++++++++++++++++++
>  1 file changed, 30 insertions(+)
> 
> diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
> index 569be4efd8d1..5b27829c5a78 100644
> --- a/drivers/gpu/drm/panel/panel-simple.c
> +++ b/drivers/gpu/drm/panel/panel-simple.c
> @@ -2204,6 +2204,33 @@ static const struct panel_desc samsung_ltn140at29_301 = {
>  	},
>  };
>  
> +static const struct drm_display_mode sharp_lq070y3dg3b_mode = {
> +	.clock = 33260,
> +	.hdisplay = 800,
> +	.hsync_start = 800 + 64,
> +	.hsync_end = 800 + 64 + 128,
> +	.htotal = 800 + 64 + 128 + 64,
> +	.vdisplay = 480,
> +	.vsync_start = 480 + 8,
> +	.vsync_end = 480 + 8 + 2,
> +	.vtotal = 480 + 8 + 2 + 35,
> +	.vrefresh = 60,
> +	.flags = DISPLAY_FLAGS_PIXDATA_POSEDGE,
> +};
> +
> +static const struct panel_desc sharp_lq070y3dg3b = {
> +	.modes = &sharp_lq070y3dg3b_mode,
> +	.num_modes = 1,
> +	.bpc = 8,
> +	.size = {
> +		.width = 152,	/* 152.4mm */
> +		.height = 91,	/* 91.4mm */
> +	},
> +	.bus_format = MEDIA_BUS_FMT_RGB888_1X24,
> +	.bus_flags = DRM_BUS_FLAG_DE_HIGH | DRM_BUS_FLAG_PIXDATA_POSEDGE |
> +		     DRM_BUS_FLAG_SYNC_DRIVE_POSEDGE,
> +};
> +
>  static const struct drm_display_mode sharp_lq035q7db03_mode = {
>  	.clock = 5500,
>  	.hdisplay = 240,
> @@ -2786,6 +2813,9 @@ static const struct of_device_id platform_of_match[] = {
>  	}, {
>  		.compatible = "sharp,lq035q7db03",
>  		.data = &sharp_lq035q7db03,
> +	}, {
> +		.compatible = "sharp,lq070y3dg3b",
> +		.data = &sharp_lq070y3dg3b,
>  	}, {
>  		.compatible = "sharp,lq101k1ly04",
>  		.data = &sharp_lq101k1ly04,
> -- 
> 2.19.1
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
