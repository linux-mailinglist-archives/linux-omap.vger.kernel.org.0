Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6F82C2AB5DB
	for <lists+linux-omap@lfdr.de>; Mon,  9 Nov 2020 12:05:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727311AbgKILF6 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 9 Nov 2020 06:05:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59298 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727303AbgKILF6 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 9 Nov 2020 06:05:58 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 79C62C0613CF
        for <linux-omap@vger.kernel.org>; Mon,  9 Nov 2020 03:05:58 -0800 (PST)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 07D19B2B;
        Mon,  9 Nov 2020 12:05:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1604919957;
        bh=yR+FJS+EMGk55NqrMdnRZsoI0hJ4UY8G3wXckFU05Tg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=W6RF530D51FYa/PE3WYHj6tsEwnjCbWWJRxXSt/4AnBw3sgx3QlN9r9tDbGtslvox
         eWNfDSd61pmkgTKBBRkT9onpS6sjY4Y5UlRRQciuhlIwkh1aX+S/01x+fQnsAhcVUO
         OeMBgnfEo5XlZ7ertRvhqRIdupEzLuo9mb8eniWQ=
Date:   Mon, 9 Nov 2020 13:05:53 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Tomi Valkeinen <tomi.valkeinen@ti.com>
Cc:     Sebastian Reichel <sre@kernel.org>,
        Nikhil Devshatwar <nikhil.nd@ti.com>,
        linux-omap@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Sekhar Nori <nsekhar@ti.com>, Tony Lindgren <tony@atomide.com>,
        "H . Nikolaus Schaller" <hns@goldelico.com>,
        Sebastian Reichel <sebastian.reichel@collabora.com>
Subject: Re: [PATCH v3 47/56] drm/omap: drop DSS ops_flags
Message-ID: <20201109110553.GR6029@pendragon.ideasonboard.com>
References: <20201105120333.947408-1-tomi.valkeinen@ti.com>
 <20201105120333.947408-48-tomi.valkeinen@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20201105120333.947408-48-tomi.valkeinen@ti.com>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Tomi and Sebastian,

Thank you for the patch.

On Thu, Nov 05, 2020 at 02:03:24PM +0200, Tomi Valkeinen wrote:
> From: Sebastian Reichel <sebastian.reichel@collabora.com>
> 
> The omapdss device's ops_flags field is no longer
> used and can be dropped.
> 
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/gpu/drm/omapdrm/dss/omapdss.h | 9 ---------
>  drivers/gpu/drm/omapdrm/dss/venc.c    | 1 -
>  2 files changed, 10 deletions(-)
> 
> diff --git a/drivers/gpu/drm/omapdrm/dss/omapdss.h b/drivers/gpu/drm/omapdrm/dss/omapdss.h
> index 1f02d3e406dc..916c55101629 100644
> --- a/drivers/gpu/drm/omapdrm/dss/omapdss.h
> +++ b/drivers/gpu/drm/omapdrm/dss/omapdss.h
> @@ -279,14 +279,6 @@ struct omap_dss_device_ops {
>  	const struct omapdss_dsi_ops dsi;
>  };
>  
> -/**
> - * enum omap_dss_device_ops_flag - Indicates which device ops are supported
> - * @OMAP_DSS_DEVICE_OP_MODES: The device supports reading modes
> - */
> -enum omap_dss_device_ops_flag {
> -	OMAP_DSS_DEVICE_OP_MODES = BIT(3),
> -};
> -
>  struct omap_dss_device {
>  	struct device *dev;
>  
> @@ -315,7 +307,6 @@ struct omap_dss_device {
>  	const char *name;
>  
>  	const struct omap_dss_device_ops *ops;
> -	unsigned long ops_flags;
>  	u32 bus_flags;
>  
>  	/* OMAP DSS output specific fields */
> diff --git a/drivers/gpu/drm/omapdrm/dss/venc.c b/drivers/gpu/drm/omapdrm/dss/venc.c
> index 5c027c81760f..6e418a0f7572 100644
> --- a/drivers/gpu/drm/omapdrm/dss/venc.c
> +++ b/drivers/gpu/drm/omapdrm/dss/venc.c
> @@ -732,7 +732,6 @@ static int venc_init_output(struct venc_device *venc)
>  	out->dispc_channel = OMAP_DSS_CHANNEL_DIGIT;
>  	out->owner = THIS_MODULE;
>  	out->of_port = 0;
> -	out->ops_flags = OMAP_DSS_DEVICE_OP_MODES;
>  
>  	r = omapdss_device_init_output(out, &venc->bridge);
>  	if (r < 0) {

-- 
Regards,

Laurent Pinchart
