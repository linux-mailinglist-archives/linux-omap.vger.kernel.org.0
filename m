Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8171A2C93BD
	for <lists+linux-omap@lfdr.de>; Tue,  1 Dec 2020 01:15:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730650AbgLAAPP (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 30 Nov 2020 19:15:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54280 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725870AbgLAAPO (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 30 Nov 2020 19:15:14 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 85F05C0613CF
        for <linux-omap@vger.kernel.org>; Mon, 30 Nov 2020 16:14:34 -0800 (PST)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id F2E4B45D;
        Tue,  1 Dec 2020 01:14:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1606781673;
        bh=bp/jKcjuawrEpNsQkKheCqxJ3yqTyJ/4xaFlHTjRFjA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=aBjwG075lKbbeZs48mr7i6UnPvhS+eOlztgbzYvMPjq7eQhuEsTnjIYudWnb/vrV/
         Ne5SuRoe+VBsrxSZ5erT8WQI1Tl+pd3+r8n/AQvGG/G4g3jo6I5SzOBHZAdgb78OjM
         EJxzFjt2yFxc79mkoroVLvRrLK0FI3xcYdt06X88=
Date:   Tue, 1 Dec 2020 02:14:24 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Tomi Valkeinen <tomi.valkeinen@ti.com>
Cc:     Sebastian Reichel <sre@kernel.org>,
        Nikhil Devshatwar <nikhil.nd@ti.com>,
        linux-omap@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Sekhar Nori <nsekhar@ti.com>, Tony Lindgren <tony@atomide.com>,
        hns@goldelico.com
Subject: Re: [PATCH v4 63/80] drm/omap: dsi: drop useless channel checks
Message-ID: <20201201001424.GH25713@pendragon.ideasonboard.com>
References: <20201124124538.660710-1-tomi.valkeinen@ti.com>
 <20201124124538.660710-64-tomi.valkeinen@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20201124124538.660710-64-tomi.valkeinen@ti.com>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Tomi,

Thank you for the patch.

On Tue, Nov 24, 2020 at 02:45:21PM +0200, Tomi Valkeinen wrote:
> A DSI peripheral can have virtual channel ID of 0-3. This should be
> always the case, and there's no need in the driver to validate the
> channel.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/gpu/drm/omapdrm/dss/dsi.c | 11 -----------
>  1 file changed, 11 deletions(-)
> 
> diff --git a/drivers/gpu/drm/omapdrm/dss/dsi.c b/drivers/gpu/drm/omapdrm/dss/dsi.c
> index 63338324c564..fbf05097612f 100644
> --- a/drivers/gpu/drm/omapdrm/dss/dsi.c
> +++ b/drivers/gpu/drm/omapdrm/dss/dsi.c
> @@ -3902,9 +3902,6 @@ static int dsi_update_channel(struct omap_dss_device *dssdev, int channel)
>  	struct dsi_data *dsi = to_dsi_data(dssdev);
>  	int r;
>  
> -	if (channel > 3)
> -		return -EINVAL;
> -
>  	dsi_bus_lock(dsi);
>  
>  	if (!dsi->video_enabled) {
> @@ -5063,12 +5060,8 @@ static int omap_dsi_host_attach(struct mipi_dsi_host *host,
>  				struct mipi_dsi_device *client)
>  {
>  	struct dsi_data *dsi = host_to_omap(host);
> -	unsigned int channel = client->channel;
>  	int r;
>  
> -	if (channel > 3)
> -		return -EINVAL;
> -
>  	if (dsi->dsidev) {
>  		DSSERR("dsi client already attached\n");
>  		return -EBUSY;
> @@ -5118,10 +5111,6 @@ static int omap_dsi_host_detach(struct mipi_dsi_host *host,
>  				struct mipi_dsi_device *client)
>  {
>  	struct dsi_data *dsi = host_to_omap(host);
> -	unsigned int channel = client->channel;
> -
> -	if (channel > 3)
> -		return -EINVAL;
>  
>  	if (WARN_ON(dsi->dsidev != client))
>  		return -EINVAL;

-- 
Regards,

Laurent Pinchart
