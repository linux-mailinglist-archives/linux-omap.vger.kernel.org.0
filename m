Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C3ABF2AB559
	for <lists+linux-omap@lfdr.de>; Mon,  9 Nov 2020 11:48:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727906AbgKIKsm (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 9 Nov 2020 05:48:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56568 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726646AbgKIKsm (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 9 Nov 2020 05:48:42 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8E623C0613CF
        for <linux-omap@vger.kernel.org>; Mon,  9 Nov 2020 02:48:42 -0800 (PST)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 06C3BB2B;
        Mon,  9 Nov 2020 11:48:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1604918921;
        bh=zlUHVoOUWGx1rKdSviLG7dzZwgmtkT7iGapWHY4fBVE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=INy48GvkJCqk+f21b6KOe2TDBaduhhqOYSFqQnQ1aCm2YdvGIioqiGG43iDdoLxmf
         8ue4c3u/Uzft3VRiNKaa7Mwq14+luZmeWuqSWaWJlsK11g+V774UKPGwieRqyimoT9
         1eTGw4n/tYsiZdkjYEjxYsp+IR0/6NWlHZqEkBzc=
Date:   Mon, 9 Nov 2020 12:48:37 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Tomi Valkeinen <tomi.valkeinen@ti.com>
Cc:     Sebastian Reichel <sre@kernel.org>,
        Nikhil Devshatwar <nikhil.nd@ti.com>,
        linux-omap@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Sekhar Nori <nsekhar@ti.com>, Tony Lindgren <tony@atomide.com>,
        "H . Nikolaus Schaller" <hns@goldelico.com>,
        Sebastian Reichel <sebastian.reichel@collabora.com>
Subject: Re: [PATCH v3 36/56] drm/omap: panel-dsi-cm: use DEVICE_ATTR_RO
Message-ID: <20201109104837.GG6029@pendragon.ideasonboard.com>
References: <20201105120333.947408-1-tomi.valkeinen@ti.com>
 <20201105120333.947408-37-tomi.valkeinen@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20201105120333.947408-37-tomi.valkeinen@ti.com>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Tomi and Sebastian,

Thank you for the patch.

On Thu, Nov 05, 2020 at 02:03:13PM +0200, Tomi Valkeinen wrote:
> From: Sebastian Reichel <sebastian.reichel@collabora.com>
> 
> Use DEVICE_ATTR_RO helper instead of plain DEVICE_ATTR,
> which makes the code a bit shorter and easier to read.
> 
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
> ---

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

>  drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c b/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c
> index 3668b3f0aff2..5159dd51a353 100644
> --- a/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c
> +++ b/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c
> @@ -219,7 +219,7 @@ static const struct backlight_ops dsicm_bl_ops = {
>  	.update_status  = dsicm_bl_update_status,
>  };
>  
> -static ssize_t dsicm_num_errors_show(struct device *dev,
> +static ssize_t num_dsi_errors_show(struct device *dev,
>  		struct device_attribute *attr, char *buf)
>  {
>  	struct panel_drv_data *ddata = dev_get_drvdata(dev);
> @@ -239,7 +239,7 @@ static ssize_t dsicm_num_errors_show(struct device *dev,
>  	return snprintf(buf, PAGE_SIZE, "%d\n", errors);
>  }
>  
> -static ssize_t dsicm_hw_revision_show(struct device *dev,
> +static ssize_t hw_revision_show(struct device *dev,
>  		struct device_attribute *attr, char *buf)
>  {
>  	struct panel_drv_data *ddata = dev_get_drvdata(dev);
> @@ -259,8 +259,8 @@ static ssize_t dsicm_hw_revision_show(struct device *dev,
>  	return snprintf(buf, PAGE_SIZE, "%02x.%02x.%02x\n", id1, id2, id3);
>  }
>  
> -static DEVICE_ATTR(num_dsi_errors, S_IRUGO, dsicm_num_errors_show, NULL);
> -static DEVICE_ATTR(hw_revision, S_IRUGO, dsicm_hw_revision_show, NULL);
> +static DEVICE_ATTR_RO(num_dsi_errors);
> +static DEVICE_ATTR_RO(hw_revision);
>  
>  static struct attribute *dsicm_attrs[] = {
>  	&dev_attr_num_dsi_errors.attr,

-- 
Regards,

Laurent Pinchart
