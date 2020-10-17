Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3B402291013
	for <lists+linux-omap@lfdr.de>; Sat, 17 Oct 2020 08:20:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2437027AbgJQGUt (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sat, 17 Oct 2020 02:20:49 -0400
Received: from asavdk4.altibox.net ([109.247.116.15]:59430 "EHLO
        asavdk4.altibox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2436912AbgJQGUt (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sat, 17 Oct 2020 02:20:49 -0400
Received: from ravnborg.org (unknown [188.228.123.71])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by asavdk4.altibox.net (Postfix) with ESMTPS id DD78680573;
        Sat, 17 Oct 2020 08:20:46 +0200 (CEST)
Date:   Sat, 17 Oct 2020 08:20:45 +0200
From:   Sam Ravnborg <sam@ravnborg.org>
To:     Liu Shixin <liushixin2@huawei.com>
Cc:     Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        linux-fbdev@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH -next] omapfb: connector-dvi: simplify the return
 expression of dvic_connect()
Message-ID: <20201017062045.GF2242298@ravnborg.org>
References: <20200915032627.1772517-1-liushixin2@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200915032627.1772517-1-liushixin2@huawei.com>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=fu7ymmwf c=1 sm=1 tr=0
        a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
        a=kj9zAlcOel0A:10 a=i0EeH86SAAAA:8 a=e5mUnYsNAAAA:8
        a=qyqJRru8iCNiQjncfiQA:9 a=CjuIK1q_8ugA:10 a=Vxmtnl_E_bksehYqCbjh:22
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Liu.

On Tue, Sep 15, 2020 at 11:26:27AM +0800, Liu Shixin wrote:
> Simplify the return expression.
> 
> Signed-off-by: Liu Shixin <liushixin2@huawei.com>

Thanks, also applied.
If you have other drm/fbdev patches pending then I have missed them.
So please resend if this is the case.

	Sam

> ---
>  drivers/video/fbdev/omap2/omapfb/displays/connector-dvi.c | 7 +------
>  1 file changed, 1 insertion(+), 6 deletions(-)
> 
> diff --git a/drivers/video/fbdev/omap2/omapfb/displays/connector-dvi.c b/drivers/video/fbdev/omap2/omapfb/displays/connector-dvi.c
> index b4a1aefff766..2fa436475b40 100644
> --- a/drivers/video/fbdev/omap2/omapfb/displays/connector-dvi.c
> +++ b/drivers/video/fbdev/omap2/omapfb/displays/connector-dvi.c
> @@ -51,16 +51,11 @@ static int dvic_connect(struct omap_dss_device *dssdev)
>  {
>  	struct panel_drv_data *ddata = to_panel_data(dssdev);
>  	struct omap_dss_device *in = ddata->in;
> -	int r;
>  
>  	if (omapdss_device_is_connected(dssdev))
>  		return 0;
>  
> -	r = in->ops.dvi->connect(in, dssdev);
> -	if (r)
> -		return r;
> -
> -	return 0;
> +	return in->ops.dvi->connect(in, dssdev);
>  }
>  
>  static void dvic_disconnect(struct omap_dss_device *dssdev)
> -- 
> 2.25.1
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
