Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 892882C8165
	for <lists+linux-omap@lfdr.de>; Mon, 30 Nov 2020 10:51:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726298AbgK3Jvf (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 30 Nov 2020 04:51:35 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:57048 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725902AbgK3Jvf (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 30 Nov 2020 04:51:35 -0500
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 924F197E;
        Mon, 30 Nov 2020 10:50:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1606729853;
        bh=jgGcxDrGgvJfwj7QC6mhQ6E7qBS/ynmMBNEswr5RBiM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=jGAwx6bvSAt5aaqXjEgRqm7BUV3XQ5sphFyxcEG6bRySBY/xH2tIql+jPyt+hBxxA
         VeRSVMxmOmm5jVwOkduDZXZS9RBAyqxkUAw3j2uxmdSQtmGJCOc/fR4i/GdhTZV2Rp
         xhSSnIJ9QgLBCeukt1Gur039Z1+MsJR3Aj/wWBDI=
Date:   Mon, 30 Nov 2020 11:50:45 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Tomi Valkeinen <tomi.valkeinen@ti.com>
Cc:     Sebastian Reichel <sre@kernel.org>,
        Nikhil Devshatwar <nikhil.nd@ti.com>,
        linux-omap@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Sekhar Nori <nsekhar@ti.com>, Tony Lindgren <tony@atomide.com>,
        hns@goldelico.com
Subject: Re: [PATCH v4 55/80] drm/panel: panel-dsi-cm: use
 MIPI_DCS_GET_ERROR_COUNT_ON_DSI
Message-ID: <20201130095045.GG4141@pendragon.ideasonboard.com>
References: <20201124124538.660710-1-tomi.valkeinen@ti.com>
 <20201124124538.660710-56-tomi.valkeinen@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20201124124538.660710-56-tomi.valkeinen@ti.com>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Tomi,

Thank you for the patch.

On Tue, Nov 24, 2020 at 02:45:13PM +0200, Tomi Valkeinen wrote:
> Use the common MIPI_DCS_GET_ERROR_COUNT_ON_DSI define instead of
> driver's own.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/gpu/drm/panel/panel-dsi-cm.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-dsi-cm.c b/drivers/gpu/drm/panel/panel-dsi-cm.c
> index 35a0c7da1974..cb0d27a38555 100644
> --- a/drivers/gpu/drm/panel/panel-dsi-cm.c
> +++ b/drivers/gpu/drm/panel/panel-dsi-cm.c
> @@ -27,7 +27,6 @@
>  #include <video/of_display_timing.h>
>  #include <video/videomode.h>
>  
> -#define DCS_READ_NUM_ERRORS	0x05
>  #define DCS_GET_ID1		0xda
>  #define DCS_GET_ID2		0xdb
>  #define DCS_GET_ID3		0xdc
> @@ -225,7 +224,7 @@ static ssize_t num_dsi_errors_show(struct device *dev,
>  	mutex_lock(&ddata->lock);
>  
>  	if (ddata->enabled)
> -		r = dsicm_dcs_read_1(ddata, DCS_READ_NUM_ERRORS, &errors);
> +		r = dsicm_dcs_read_1(ddata, MIPI_DCS_GET_ERROR_COUNT_ON_DSI, &errors);
>  
>  	mutex_unlock(&ddata->lock);
>  

-- 
Regards,

Laurent Pinchart
