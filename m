Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AF30116C467
	for <lists+linux-omap@lfdr.de>; Tue, 25 Feb 2020 15:53:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730361AbgBYOx2 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 25 Feb 2020 09:53:28 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:60292 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730264AbgBYOx2 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 25 Feb 2020 09:53:28 -0500
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id A499643F;
        Tue, 25 Feb 2020 15:53:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1582642405;
        bh=ot5b8vS8Xbyr8RARRNOMj+IeET1tHlJZ1cxHEkFUO+Y=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=LTByP+Hlga3Kkabs4Wr5vp3lzrbU8OjHRNjv065nyihpW9W4VMdsEg5TwBmiVM4tt
         yGlYod/f9m4jOX7S1Omgr2tmP59MLIhHAnh7mBFUovKWKkz18gVFLaA77PIxhu/MVI
         TQkPs4qbGHucnJj6/tCBHHQ2E1TzVelsICE0T/rA=
Date:   Tue, 25 Feb 2020 16:53:05 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Sebastian Reichel <sebastian.reichel@collabora.com>
Cc:     Sebastian Reichel <sre@kernel.org>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Tony Lindgren <tony@atomide.com>,
        Merlijn Wajer <merlijn@wizzup.org>,
        "H. Nikolaus Schaller" <hns@goldelico.com>,
        Rob Herring <robh@kernel.org>, linux-omap@vger.kernel.org,
        dri-devel@lists.freedesktop.org, kernel@collabora.com
Subject: Re: [PATCHv2 09/56] drm/omap: dsi: unexport specific data transfer
 functions
Message-ID: <20200225145305.GH4764@pendragon.ideasonboard.com>
References: <20200224232126.3385250-1-sebastian.reichel@collabora.com>
 <20200224232126.3385250-10-sebastian.reichel@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200224232126.3385250-10-sebastian.reichel@collabora.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Sebastian,

Thank you for the patch.

On Tue, Feb 25, 2020 at 12:20:39AM +0100, Sebastian Reichel wrote:
> After converting all DSI drivers, unexport the specific transfer
> functions.
> 
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/gpu/drm/omapdrm/dss/dsi.c     | 12 ------------
>  drivers/gpu/drm/omapdrm/dss/omapdss.h | 20 --------------------
>  2 files changed, 32 deletions(-)
> 
> diff --git a/drivers/gpu/drm/omapdrm/dss/dsi.c b/drivers/gpu/drm/omapdrm/dss/dsi.c
> index 84e2eb0b51d7..0990777a42f7 100644
> --- a/drivers/gpu/drm/omapdrm/dss/dsi.c
> +++ b/drivers/gpu/drm/omapdrm/dss/dsi.c
> @@ -4941,18 +4941,6 @@ static const struct omap_dss_device_ops dsi_ops = {
>  		.release_vc = dsi_release_vc,
>  
>  		.transfer = omap_dsi_transfer,
> -
> -		.dcs_write = dsi_vc_dcs_write,
> -		.dcs_write_nosync = dsi_vc_dcs_write_nosync,
> -		.dcs_read = dsi_vc_dcs_read,
> -
> -		.gen_write = dsi_vc_generic_write,
> -		.gen_write_nosync = dsi_vc_generic_write_nosync,
> -		.gen_read = dsi_vc_generic_read,
> -
> -		.bta_sync = dsi_vc_send_bta_sync,
> -
> -		.set_max_rx_packet_size = dsi_vc_set_max_rx_packet_size,
>  	},
>  };
>  
> diff --git a/drivers/gpu/drm/omapdrm/dss/omapdss.h b/drivers/gpu/drm/omapdrm/dss/omapdss.h
> index ea7bf0970677..787e102eb068 100644
> --- a/drivers/gpu/drm/omapdrm/dss/omapdss.h
> +++ b/drivers/gpu/drm/omapdrm/dss/omapdss.h
> @@ -309,26 +309,6 @@ struct omapdss_dsi_ops {
>  	/* data transfer */
>  	ssize_t (*transfer)(struct omap_dss_device *dssdev,
>  			const struct mipi_dsi_msg *msg);
> -
> -	int (*dcs_write)(struct omap_dss_device *dssdev, int channel,
> -			const u8 *data, int len);
> -	int (*dcs_write_nosync)(struct omap_dss_device *dssdev, int channel,
> -			const u8 *data, int len);
> -	int (*dcs_read)(struct omap_dss_device *dssdev, int channel, u8 dcs_cmd,
> -			u8 *data, int len);
> -
> -	int (*gen_write)(struct omap_dss_device *dssdev, int channel,
> -			const u8 *data, int len);
> -	int (*gen_write_nosync)(struct omap_dss_device *dssdev, int channel,
> -			const u8 *data, int len);
> -	int (*gen_read)(struct omap_dss_device *dssdev, int channel,
> -			const u8 *reqdata, int reqlen,
> -			u8 *data, int len);
> -
> -	int (*bta_sync)(struct omap_dss_device *dssdev, int channel);
> -
> -	int (*set_max_rx_packet_size)(struct omap_dss_device *dssdev,
> -			int channel, u16 plen);
>  };
>  
>  struct omap_dss_device_ops {

-- 
Regards,

Laurent Pinchart
