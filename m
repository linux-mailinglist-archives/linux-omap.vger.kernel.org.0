Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8F835290D39
	for <lists+linux-omap@lfdr.de>; Fri, 16 Oct 2020 23:25:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2411179AbgJPVZR (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 16 Oct 2020 17:25:17 -0400
Received: from asavdk4.altibox.net ([109.247.116.15]:37496 "EHLO
        asavdk4.altibox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2411180AbgJPVXf (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 16 Oct 2020 17:23:35 -0400
X-Greylist: delayed 322 seconds by postgrey-1.27 at vger.kernel.org; Fri, 16 Oct 2020 17:23:34 EDT
Received: from ravnborg.org (unknown [188.228.123.71])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by asavdk4.altibox.net (Postfix) with ESMTPS id B450780627;
        Fri, 16 Oct 2020 23:18:08 +0200 (CEST)
Date:   Fri, 16 Oct 2020 23:18:07 +0200
From:   Sam Ravnborg <sam@ravnborg.org>
To:     Liu Shixin <liushixin2@huawei.com>
Cc:     Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        linux-fbdev@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH -next] omapfb: simplify the return expression of
 panel_dpi_connect
Message-ID: <20201016211807.GE1496366@ravnborg.org>
References: <20200921082443.2591721-1-liushixin2@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200921082443.2591721-1-liushixin2@huawei.com>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=fu7ymmwf c=1 sm=1 tr=0
        a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
        a=kj9zAlcOel0A:10 a=i0EeH86SAAAA:8 a=e5mUnYsNAAAA:8
        a=aI8o0Y8hUY2JQlYkRfwA:9 a=CjuIK1q_8ugA:10 a=Vxmtnl_E_bksehYqCbjh:22
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Liu Shixin

On Mon, Sep 21, 2020 at 04:24:43PM +0800, Liu Shixin wrote:
> Simplify the return expression.
> 
> Signed-off-by: Liu Shixin <liushixin2@huawei.com>

Thanks.
Applied this and the following two patches to drm-misc-next.
They will appear in -next in a few weeks.

	Sam

> ---
>  drivers/video/fbdev/omap2/omapfb/displays/panel-dpi.c | 7 +------
>  1 file changed, 1 insertion(+), 6 deletions(-)
> 
> diff --git a/drivers/video/fbdev/omap2/omapfb/displays/panel-dpi.c b/drivers/video/fbdev/omap2/omapfb/displays/panel-dpi.c
> index 37c9f5bfaefe..ff3d1e8e1e7b 100644
> --- a/drivers/video/fbdev/omap2/omapfb/displays/panel-dpi.c
> +++ b/drivers/video/fbdev/omap2/omapfb/displays/panel-dpi.c
> @@ -37,16 +37,11 @@ static int panel_dpi_connect(struct omap_dss_device *dssdev)
>  {
>  	struct panel_drv_data *ddata = to_panel_data(dssdev);
>  	struct omap_dss_device *in = ddata->in;
> -	int r;
>  
>  	if (omapdss_device_is_connected(dssdev))
>  		return 0;
>  
> -	r = in->ops.dpi->connect(in, dssdev);
> -	if (r)
> -		return r;
> -
> -	return 0;
> +	return in->ops.dpi->connect(in, dssdev);
>  }
>  
>  static void panel_dpi_disconnect(struct omap_dss_device *dssdev)
> -- 
> 2.25.1
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
