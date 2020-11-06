Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0F9BD2A8E82
	for <lists+linux-omap@lfdr.de>; Fri,  6 Nov 2020 05:57:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725830AbgKFE5X (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 5 Nov 2020 23:57:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39014 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725616AbgKFE5X (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 5 Nov 2020 23:57:23 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 92D5AC0613CF
        for <linux-omap@vger.kernel.org>; Thu,  5 Nov 2020 20:57:23 -0800 (PST)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 287BBB16;
        Fri,  6 Nov 2020 05:57:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1604638642;
        bh=cuDvMRu2tLgLJvPp04gS5eeeGDAihv+h/QN1Wkb6n1E=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=bY5Akb38B3rrmsFmC4WU7uRw8H5k6BKNRKSykv0fjHVSG2ip1urIvgckmGntidWUW
         Rz7W6XlkryUiFBtJUN7cdx7y+wD9W3f+TycfOA1LewXsTjF7nzhkdUnhP8qeJNxHac
         gaSOeOUJbt2PPhv9qUifcRRp1NNvR1iqvaC5DPqk=
Date:   Fri, 6 Nov 2020 06:57:20 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Tomi Valkeinen <tomi.valkeinen@ti.com>
Cc:     Sebastian Reichel <sre@kernel.org>,
        Nikhil Devshatwar <nikhil.nd@ti.com>,
        linux-omap@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Sekhar Nori <nsekhar@ti.com>, Tony Lindgren <tony@atomide.com>,
        "H . Nikolaus Schaller" <hns@goldelico.com>,
        Sebastian Reichel <sebastian.reichel@collabora.com>
Subject: Re: [PATCH v3 05/56] drm/omap: constify write buffers
Message-ID: <20201106045720.GF16469@pendragon.ideasonboard.com>
References: <20201105120333.947408-1-tomi.valkeinen@ti.com>
 <20201105120333.947408-6-tomi.valkeinen@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20201105120333.947408-6-tomi.valkeinen@ti.com>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Tomi and Sebastian,

Thank you for the patch.

On Thu, Nov 05, 2020 at 02:02:42PM +0200, Tomi Valkeinen wrote:
> From: Sebastian Reichel <sebastian.reichel@collabora.com>
> 
> The write buffers are not modified, so they can be constant.
> 
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/gpu/drm/omapdrm/dss/dsi.c     | 24 ++++++++++++------------
>  drivers/gpu/drm/omapdrm/dss/omapdss.h | 10 +++++-----
>  2 files changed, 17 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/gpu/drm/omapdrm/dss/dsi.c b/drivers/gpu/drm/omapdrm/dss/dsi.c
> index 86b9d435fb94..22d74d762a10 100644
> --- a/drivers/gpu/drm/omapdrm/dss/dsi.c
> +++ b/drivers/gpu/drm/omapdrm/dss/dsi.c
> @@ -2601,11 +2601,11 @@ static inline void dsi_vc_write_long_payload(struct dsi_data *dsi, int channel,
>  }
>  
>  static int dsi_vc_send_long(struct dsi_data *dsi, int channel, u8 data_type,
> -			    u8 *data, u16 len, u8 ecc)
> +			    const u8 *data, u16 len, u8 ecc)
>  {
>  	/*u32 val; */
>  	int i;
> -	u8 *p;
> +	const u8 *p;
>  	int r = 0;
>  	u8 b1, b2, b3, b4;
>  
> @@ -2698,7 +2698,7 @@ static int dsi_vc_send_null(struct dsi_data *dsi, int channel)
>  }
>  
>  static int dsi_vc_write_nosync_common(struct dsi_data *dsi, int channel,
> -				      u8 *data, int len,
> +				      const u8 *data, int len,
>  				      enum dss_dsi_content_type type)
>  {
>  	int r;
> @@ -2729,7 +2729,7 @@ static int dsi_vc_write_nosync_common(struct dsi_data *dsi, int channel,
>  }
>  
>  static int dsi_vc_dcs_write_nosync(struct omap_dss_device *dssdev, int channel,
> -		u8 *data, int len)
> +		const u8 *data, int len)
>  {
>  	struct dsi_data *dsi = to_dsi_data(dssdev);
>  
> @@ -2738,7 +2738,7 @@ static int dsi_vc_dcs_write_nosync(struct omap_dss_device *dssdev, int channel,
>  }
>  
>  static int dsi_vc_generic_write_nosync(struct omap_dss_device *dssdev, int channel,
> -		u8 *data, int len)
> +		const u8 *data, int len)
>  {
>  	struct dsi_data *dsi = to_dsi_data(dssdev);
>  
> @@ -2747,7 +2747,7 @@ static int dsi_vc_generic_write_nosync(struct omap_dss_device *dssdev, int chann
>  }
>  
>  static int dsi_vc_write_common(struct omap_dss_device *dssdev,
> -			       int channel, u8 *data, int len,
> +			       int channel, const u8 *data, int len,
>  			       enum dss_dsi_content_type type)
>  {
>  	struct dsi_data *dsi = to_dsi_data(dssdev);
> @@ -2776,15 +2776,15 @@ static int dsi_vc_write_common(struct omap_dss_device *dssdev,
>  	return r;
>  }
>  
> -static int dsi_vc_dcs_write(struct omap_dss_device *dssdev, int channel, u8 *data,
> -		int len)
> +static int dsi_vc_dcs_write(struct omap_dss_device *dssdev, int channel,
> +		const u8 *data, int len)
>  {
>  	return dsi_vc_write_common(dssdev, channel, data, len,
>  			DSS_DSI_CONTENT_DCS);
>  }
>  
> -static int dsi_vc_generic_write(struct omap_dss_device *dssdev, int channel, u8 *data,
> -		int len)
> +static int dsi_vc_generic_write(struct omap_dss_device *dssdev, int channel,
> +		const u8 *data, int len)
>  {
>  	return dsi_vc_write_common(dssdev, channel, data, len,
>  			DSS_DSI_CONTENT_GENERIC);
> @@ -2810,7 +2810,7 @@ static int dsi_vc_dcs_send_read_request(struct dsi_data *dsi, int channel,
>  }
>  
>  static int dsi_vc_generic_send_read_request(struct dsi_data *dsi, int channel,
> -					    u8 *reqdata, int reqlen)
> +					    const u8 *reqdata, int reqlen)
>  {
>  	u16 data;
>  	u8 data_type;
> @@ -2983,7 +2983,7 @@ static int dsi_vc_dcs_read(struct omap_dss_device *dssdev, int channel, u8 dcs_c
>  }
>  
>  static int dsi_vc_generic_read(struct omap_dss_device *dssdev, int channel,
> -		u8 *reqdata, int reqlen, u8 *buf, int buflen)
> +		const u8 *reqdata, int reqlen, u8 *buf, int buflen)
>  {
>  	struct dsi_data *dsi = to_dsi_data(dssdev);
>  	int r;
> diff --git a/drivers/gpu/drm/omapdrm/dss/omapdss.h b/drivers/gpu/drm/omapdrm/dss/omapdss.h
> index c4bc1f919ab4..8e96ab2f20b6 100644
> --- a/drivers/gpu/drm/omapdrm/dss/omapdss.h
> +++ b/drivers/gpu/drm/omapdrm/dss/omapdss.h
> @@ -309,18 +309,18 @@ struct omapdss_dsi_ops {
>  
>  	/* data transfer */
>  	int (*dcs_write)(struct omap_dss_device *dssdev, int channel,
> -			u8 *data, int len);
> +			const u8 *data, int len);
>  	int (*dcs_write_nosync)(struct omap_dss_device *dssdev, int channel,
> -			u8 *data, int len);
> +			const u8 *data, int len);
>  	int (*dcs_read)(struct omap_dss_device *dssdev, int channel, u8 dcs_cmd,
>  			u8 *data, int len);
>  
>  	int (*gen_write)(struct omap_dss_device *dssdev, int channel,
> -			u8 *data, int len);
> +			const u8 *data, int len);
>  	int (*gen_write_nosync)(struct omap_dss_device *dssdev, int channel,
> -			u8 *data, int len);
> +			const u8 *data, int len);
>  	int (*gen_read)(struct omap_dss_device *dssdev, int channel,
> -			u8 *reqdata, int reqlen,
> +			const u8 *reqdata, int reqlen,
>  			u8 *data, int len);
>  
>  	int (*bta_sync)(struct omap_dss_device *dssdev, int channel);

-- 
Regards,

Laurent Pinchart
