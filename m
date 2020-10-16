Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BE9DD290D44
	for <lists+linux-omap@lfdr.de>; Fri, 16 Oct 2020 23:28:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390506AbgJPV2d (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 16 Oct 2020 17:28:33 -0400
Received: from asavdk4.altibox.net ([109.247.116.15]:38480 "EHLO
        asavdk4.altibox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387948AbgJPV2d (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 16 Oct 2020 17:28:33 -0400
Received: from ravnborg.org (unknown [188.228.123.71])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by asavdk4.altibox.net (Postfix) with ESMTPS id 2EDF380632;
        Fri, 16 Oct 2020 23:20:51 +0200 (CEST)
Date:   Fri, 16 Oct 2020 23:20:49 +0200
From:   Sam Ravnborg <sam@ravnborg.org>
To:     Qinglang Miao <miaoqinglang@huawei.com>
Cc:     Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        linux-fbdev@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH -next] omapfb: panel-sony-acx565akm: simplify the return
 expression of acx565akm_connect()
Message-ID: <20201016212049.GH1496366@ravnborg.org>
References: <20200921131052.92707-1-miaoqinglang@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200921131052.92707-1-miaoqinglang@huawei.com>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=fu7ymmwf c=1 sm=1 tr=0
        a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
        a=kj9zAlcOel0A:10 a=i0EeH86SAAAA:8 a=e5mUnYsNAAAA:8
        a=Y4obQtN_itIPxvlVp1MA:9 a=CjuIK1q_8ugA:10 a=Vxmtnl_E_bksehYqCbjh:22
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Qinglang Miao

On Mon, Sep 21, 2020 at 09:10:52PM +0800, Qinglang Miao wrote:
> Simplify the return expression.
> 
> Signed-off-by: Qinglang Miao <miaoqinglang@huawei.com>

Applied this and the following patch to drm-misc-next.
Note: I did not touch the drm/* patches, I expect someone else to pick
them up. As they are quite old maybe try to resend them.

	Sam

> ---
>  .../fbdev/omap2/omapfb/displays/panel-sony-acx565akm.c     | 7 +------
>  1 file changed, 1 insertion(+), 6 deletions(-)
> 
> diff --git a/drivers/video/fbdev/omap2/omapfb/displays/panel-sony-acx565akm.c b/drivers/video/fbdev/omap2/omapfb/displays/panel-sony-acx565akm.c
> index 1293515e4..8d8b5ff7d 100644
> --- a/drivers/video/fbdev/omap2/omapfb/displays/panel-sony-acx565akm.c
> +++ b/drivers/video/fbdev/omap2/omapfb/displays/panel-sony-acx565akm.c
> @@ -506,16 +506,11 @@ static int acx565akm_connect(struct omap_dss_device *dssdev)
>  {
>  	struct panel_drv_data *ddata = to_panel_data(dssdev);
>  	struct omap_dss_device *in = ddata->in;
> -	int r;
>  
>  	if (omapdss_device_is_connected(dssdev))
>  		return 0;
>  
> -	r = in->ops.sdi->connect(in, dssdev);
> -	if (r)
> -		return r;
> -
> -	return 0;
> +	return in->ops.sdi->connect(in, dssdev);
>  }
>  
>  static void acx565akm_disconnect(struct omap_dss_device *dssdev)
> -- 
> 2.23.0
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
