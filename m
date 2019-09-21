Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7CD15B9F87
	for <lists+linux-omap@lfdr.de>; Sat, 21 Sep 2019 21:07:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732367AbfIUTHq (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sat, 21 Sep 2019 15:07:46 -0400
Received: from asavdk3.altibox.net ([109.247.116.14]:60597 "EHLO
        asavdk3.altibox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732366AbfIUTHp (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sat, 21 Sep 2019 15:07:45 -0400
Received: from ravnborg.org (unknown [158.248.194.18])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by asavdk3.altibox.net (Postfix) with ESMTPS id 85F402002D;
        Sat, 21 Sep 2019 21:07:43 +0200 (CEST)
Date:   Sat, 21 Sep 2019 21:07:42 +0200
From:   Sam Ravnborg <sam@ravnborg.org>
To:     Adam Ford <aford173@gmail.com>
Cc:     dri-devel@lists.freedesktop.org, linux-omap@vger.kernel.org,
        adam.ford@logicpd.com, Thierry Reding <thierry.reding@gmail.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] drm/panel: simple: Add Logic PD Type 28 display
 support
Message-ID: <20190921190742.GC32133@ravnborg.org>
References: <20190917161214.2913-1-aford173@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190917161214.2913-1-aford173@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=dqr19Wo4 c=1 sm=1 tr=0
        a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
        a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=pGLkceISAAAA:8
        a=7gkXJVJtAAAA:8 a=xK0do9HAD_rHnancwdkA:9 a=BOiP-fhdRgDUoPr4:21
        a=UG9U2V4UWY7noxTK:21 a=CjuIK1q_8ugA:10 a=E9Po1WZjFZOl8hwRPBS3:22
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Adam.

On Tue, Sep 17, 2019 at 11:12:11AM -0500, Adam Ford wrote:
> Previously, there was an omap panel-dpi driver that would
> read generic timings from the device tree and set the display
> timing accordingly.  This driver was removed so the screen
> no longer functions.  This patch modifies the panel-simple
> file to setup the timings to the same values previously used.
> 
> Fixes: 8bf4b1621178 ("drm/omap: Remove panel-dpi driver")
> 
> Signed-off-by: Adam Ford <aford173@gmail.com>

Patch looks good.
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
> 
> diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
> index 5a93c4edf1e4..c86c30f3a8a1 100644
> --- a/drivers/gpu/drm/panel/panel-simple.c
> +++ b/drivers/gpu/drm/panel/panel-simple.c
> @@ -1900,6 +1900,40 @@ static const struct drm_display_mode mitsubishi_aa070mc01_mode = {
>  	.flags = DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC,
>  };
>  
> +static const struct drm_display_mode logicpd_type_28_mode = {
> +	.clock = 9000,
> +	.hdisplay = 480,
> +	.hsync_start = 480 + 3,
> +	.hsync_end = 480 + 3 + 42,
> +	.htotal = 480 + 3 + 42 + 2,
> +
> +	.vdisplay = 272,
> +	.vsync_start = 272 + 2,
> +	.vsync_end = 272 + 2 + 11,
> +	.vtotal = 272 + 2 + 11 + 3,
> +	.vrefresh = 60,
> +	.flags = DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC,
> +};
> +
> +static const struct panel_desc logicpd_type_28 = {
> +	.modes = &logicpd_type_28_mode,
> +	.num_modes = 1,
> +	.bpc = 8,
> +	.size = {
> +		.width = 105,
> +		.height = 67,
> +	},
> +	.delay = {
> +		.prepare = 200,
> +		.enable = 200,
> +		.unprepare = 200,
> +		.disable = 200,
> +	},
> +	.bus_format = MEDIA_BUS_FMT_RGB888_1X24,
> +	.bus_flags = DRM_BUS_FLAG_DE_HIGH | DRM_BUS_FLAG_PIXDATA_DRIVE_POSEDGE |
> +		     DRM_BUS_FLAG_SYNC_DRIVE_NEGEDGE,
> +};
> +
>  static const struct panel_desc mitsubishi_aa070mc01 = {
>  	.modes = &mitsubishi_aa070mc01_mode,
>  	.num_modes = 1,
> @@ -2948,6 +2982,9 @@ static const struct of_device_id platform_of_match[] = {
>  	}, {
>  		.compatible = "lg,lp129qe",
>  		.data = &lg_lp129qe,
> +	}, {
> +		.compatible = "logicpd,type28",
> +		.data = &logicpd_type_28,
>  	}, {
>  		.compatible = "mitsubishi,aa070mc01-ca1",
>  		.data = &mitsubishi_aa070mc01,
> -- 
> 2.17.1
