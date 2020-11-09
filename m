Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 181902AB250
	for <lists+linux-omap@lfdr.de>; Mon,  9 Nov 2020 09:21:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726176AbgKIIVk (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 9 Nov 2020 03:21:40 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:39298 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726127AbgKIIVk (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 9 Nov 2020 03:21:40 -0500
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6FDB52FE;
        Mon,  9 Nov 2020 09:21:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1604910097;
        bh=HFuCQlQb3e//HwYGDRaat93UPv0IRl3wQvioLnwwow8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=iEAxQEWbHiQ/QQkufMiJyKe5MbZH+XsWNpscmwbOQbZB8nr+PiS8PuJuL2l6hzI4D
         eHgXWweXZqgloWFAb/76YW6m6Lw9n0KSSbNjWbulXNsJw0H26sAintJxb6goTC1An1
         BDDfgBZno1qu+7qrBAg4ZnLoSs5TgCSBJo+uaxHQ=
Date:   Mon, 9 Nov 2020 10:21:34 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Tomi Valkeinen <tomi.valkeinen@ti.com>
Cc:     Sebastian Reichel <sre@kernel.org>,
        Nikhil Devshatwar <nikhil.nd@ti.com>,
        linux-omap@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Sekhar Nori <nsekhar@ti.com>, Tony Lindgren <tony@atomide.com>,
        "H . Nikolaus Schaller" <hns@goldelico.com>,
        Sebastian Reichel <sebastian.reichel@collabora.com>
Subject: Re: [PATCH v3 10/56] drm/omap: dsi: simplify write function
Message-ID: <20201109082134.GG6029@pendragon.ideasonboard.com>
References: <20201105120333.947408-1-tomi.valkeinen@ti.com>
 <20201105120333.947408-11-tomi.valkeinen@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20201105120333.947408-11-tomi.valkeinen@ti.com>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Tomi and Sebastian,

Thank you for the patch.

On Thu, Nov 05, 2020 at 02:02:47PM +0200, Tomi Valkeinen wrote:
> From: Sebastian Reichel <sebastian.reichel@collabora.com>
> 
> Simplify the write related messages handling by using the functionality
> provided by CONFIG_DRM_MIPI_DSI.
> 
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
> ---
>  drivers/gpu/drm/omapdrm/dss/Kconfig |   1 +
>  drivers/gpu/drm/omapdrm/dss/dsi.c   | 146 +++++++---------------------
>  2 files changed, 34 insertions(+), 113 deletions(-)
> 
> diff --git a/drivers/gpu/drm/omapdrm/dss/Kconfig b/drivers/gpu/drm/omapdrm/dss/Kconfig
> index 2658c521b702..fd7dfa28ce97 100644
> --- a/drivers/gpu/drm/omapdrm/dss/Kconfig
> +++ b/drivers/gpu/drm/omapdrm/dss/Kconfig
> @@ -95,6 +95,7 @@ config OMAP2_DSS_SDI
>  config OMAP2_DSS_DSI
>  	bool "DSI support"
>  	default n
> +	select DRM_MIPI_DSI
>  	help
>  	  MIPI DSI (Display Serial Interface) support.
>  
> diff --git a/drivers/gpu/drm/omapdrm/dss/dsi.c b/drivers/gpu/drm/omapdrm/dss/dsi.c
> index 348be32505a2..e1595c0608f2 100644
> --- a/drivers/gpu/drm/omapdrm/dss/dsi.c
> +++ b/drivers/gpu/drm/omapdrm/dss/dsi.c
> @@ -2696,97 +2696,50 @@ static int dsi_vc_send_null(struct dsi_data *dsi, int channel)
>  	return dsi_vc_send_long(dsi, channel, MIPI_DSI_NULL_PACKET, NULL, 0, 0);
>  }
>  
> -static int dsi_vc_write_nosync_common(struct dsi_data *dsi, int channel,
> -				      const u8 *data, int len,
> -				      enum dss_dsi_content_type type)
> -{
> -	int r;
> -
> -	if (len == 0) {
> -		BUG_ON(type == DSS_DSI_CONTENT_DCS);
> -		r = dsi_vc_send_short(dsi, channel,
> -				MIPI_DSI_GENERIC_SHORT_WRITE_0_PARAM, 0, 0);
> -	} else if (len == 1) {
> -		r = dsi_vc_send_short(dsi, channel,
> -				type == DSS_DSI_CONTENT_GENERIC ?
> -				MIPI_DSI_GENERIC_SHORT_WRITE_1_PARAM :
> -				MIPI_DSI_DCS_SHORT_WRITE, data[0], 0);
> -	} else if (len == 2) {
> -		r = dsi_vc_send_short(dsi, channel,
> -				type == DSS_DSI_CONTENT_GENERIC ?
> -				MIPI_DSI_GENERIC_SHORT_WRITE_2_PARAM :
> -				MIPI_DSI_DCS_SHORT_WRITE_PARAM,
> -				data[0] | (data[1] << 8), 0);
> -	} else {
> -		r = dsi_vc_send_long(dsi, channel,
> -				type == DSS_DSI_CONTENT_GENERIC ?
> -				MIPI_DSI_GENERIC_LONG_WRITE :
> -				MIPI_DSI_DCS_LONG_WRITE, data, len, 0);
> -	}
> -
> -	return r;
> -}
> -
> -static int dsi_vc_dcs_write_nosync(struct omap_dss_device *dssdev, int channel,
> -		const u8 *data, int len)
> +static int dsi_vc_write_common(struct omap_dss_device *dssdev,
> +			       const struct mipi_dsi_msg *msg)
>  {
>  	struct dsi_data *dsi = to_dsi_data(dssdev);
> +	struct mipi_dsi_packet packet;
> +	int r;
>  
> -	return dsi_vc_write_nosync_common(dsi, channel, data, len,
> -			DSS_DSI_CONTENT_DCS);
> -}
> +	r = mipi_dsi_create_packet(&packet, msg);
> +	if (r < 0)
> +		return r;
>  
> -static int dsi_vc_generic_write_nosync(struct omap_dss_device *dssdev, int channel,
> -		const u8 *data, int len)
> -{
> -	struct dsi_data *dsi = to_dsi_data(dssdev);
> +	if (mipi_dsi_packet_format_is_short(msg->type)) {
> +		u16 data = packet.header[1] | (packet.header[2] << 8);

packet is only used here, should the variable and
mipi_dsi_create_packet() call be moved to this branch of the if ? Feel
free to ignore if a patch further down the series makes use of packet in
different locations.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

>  
> -	return dsi_vc_write_nosync_common(dsi, channel, data, len,
> -			DSS_DSI_CONTENT_GENERIC);
> -}
> +		r = dsi_vc_send_short(dsi, msg->channel, msg->type, data, 0);
> +	} else {
> +		r = dsi_vc_send_long(dsi, msg->channel, msg->type,
> +				     msg->tx_buf, msg->tx_len, 0);
> +	}
>  
> -static int dsi_vc_write_common(struct omap_dss_device *dssdev,
> -			       int channel, const u8 *data, int len,
> -			       enum dss_dsi_content_type type)
> -{
> -	struct dsi_data *dsi = to_dsi_data(dssdev);
> -	int r;
> +	if (r < 0)
> +		return r;
>  
> -	r = dsi_vc_write_nosync_common(dsi, channel, data, len, type);
> -	if (r)
> -		goto err;
> +	/*
> +	 * TODO: we do not always have to do the BTA sync, for example
> +	 * we can improve performance by setting the update window
> +	 * information without sending BTA sync between the commands.
> +	 * In that case we can return early.
> +	 */
>  
> -	r = dsi_vc_send_bta_sync(dssdev, channel);
> -	if (r)
> -		goto err;
> +	r = dsi_vc_send_bta_sync(dssdev, msg->channel);
> +	if (r) {
> +		DSSERR("bta sync failed\n");
> +		return r;
> +	}
>  
>  	/* RX_FIFO_NOT_EMPTY */
> -	if (REG_GET(dsi, DSI_VC_CTRL(channel), 20, 20)) {
> +	if (REG_GET(dsi, DSI_VC_CTRL(msg->channel), 20, 20)) {
>  		DSSERR("rx fifo not empty after write, dumping data:\n");
> -		dsi_vc_flush_receive_data(dsi, channel);
> -		r = -EIO;
> -		goto err;
> +		dsi_vc_flush_receive_data(dsi, msg->channel);
> +		return -EIO;
>  	}
>  
>  	return 0;
> -err:
> -	DSSERR("dsi_vc_write_common(ch %d, cmd 0x%02x, len %d) failed\n",
> -			channel, data[0], len);
> -	return r;
> -}
> -
> -static int dsi_vc_dcs_write(struct omap_dss_device *dssdev, int channel,
> -		const u8 *data, int len)
> -{
> -	return dsi_vc_write_common(dssdev, channel, data, len,
> -			DSS_DSI_CONTENT_DCS);
> -}
> -
> -static int dsi_vc_generic_write(struct omap_dss_device *dssdev, int channel,
> -		const u8 *data, int len)
> -{
> -	return dsi_vc_write_common(dssdev, channel, data, len,
> -			DSS_DSI_CONTENT_GENERIC);
>  }
>  
>  static int dsi_vc_dcs_send_read_request(struct dsi_data *dsi, int channel,
> @@ -3008,15 +2961,6 @@ static int dsi_vc_generic_read(struct omap_dss_device *dssdev, int channel,
>  	return 0;
>  }
>  
> -static int dsi_vc_set_max_rx_packet_size(struct omap_dss_device *dssdev, int channel,
> -		u16 len)
> -{
> -	struct dsi_data *dsi = to_dsi_data(dssdev);
> -
> -	return dsi_vc_send_short(dsi, channel,
> -			MIPI_DSI_SET_MAXIMUM_RETURN_PACKET_SIZE, len, 0);
> -}
> -
>  static int dsi_enter_ulps(struct dsi_data *dsi)
>  {
>  	DECLARE_COMPLETION_ONSTACK(completion);
> @@ -4817,36 +4761,17 @@ static void dsi_release_vc(struct omap_dss_device *dssdev, int channel)
>  static ssize_t omap_dsi_transfer(struct omap_dss_device *dssdev,
>  				 const struct mipi_dsi_msg *msg)
>  {
> -	/*
> -	 * no_sync can be used to optimize performance by sending e.g. column
> -	 * and page information without syncing in between. It's not absolutley
> -	 * required, so postpone this feature for now.
> -	 */
> -	bool no_sync = false;
> -	u16 val;
> -
>  	switch (msg->type) {
>  	case MIPI_DSI_GENERIC_SHORT_WRITE_0_PARAM:
>  	case MIPI_DSI_GENERIC_SHORT_WRITE_1_PARAM:
>  	case MIPI_DSI_GENERIC_SHORT_WRITE_2_PARAM:
>  	case MIPI_DSI_GENERIC_LONG_WRITE:
> -		if (no_sync)
> -			return dsi_vc_generic_write_nosync(dssdev, msg->channel,
> -							   msg->tx_buf,
> -							   msg->tx_len);
> -		else
> -			return dsi_vc_generic_write(dssdev, msg->channel,
> -						    msg->tx_buf, msg->tx_len);
>  	case MIPI_DSI_DCS_SHORT_WRITE:
>  	case MIPI_DSI_DCS_SHORT_WRITE_PARAM:
>  	case MIPI_DSI_DCS_LONG_WRITE:
> -		if (no_sync)
> -			return dsi_vc_dcs_write_nosync(dssdev, msg->channel,
> -						       msg->tx_buf,
> -						       msg->tx_len);
> -		else
> -			return dsi_vc_dcs_write(dssdev, msg->channel,
> -						msg->tx_buf, msg->tx_len);
> +	case MIPI_DSI_SET_MAXIMUM_RETURN_PACKET_SIZE:
> +	case MIPI_DSI_NULL_PACKET:
> +		return dsi_vc_write_common(dssdev, msg);
>  	case MIPI_DSI_GENERIC_READ_REQUEST_0_PARAM:
>  	case MIPI_DSI_GENERIC_READ_REQUEST_1_PARAM:
>  	case MIPI_DSI_GENERIC_READ_REQUEST_2_PARAM:
> @@ -4857,11 +4782,6 @@ static ssize_t omap_dsi_transfer(struct omap_dss_device *dssdev,
>  		return dsi_vc_dcs_read(dssdev, msg->channel,
>  				       ((u8 *)msg->tx_buf)[0],
>  				       msg->rx_buf, msg->rx_len);
> -	case MIPI_DSI_SET_MAXIMUM_RETURN_PACKET_SIZE:
> -		val = le16_to_cpu(*((__le16 *)msg->tx_buf));
> -		return dsi_vc_set_max_rx_packet_size(dssdev, msg->channel, val);
> -	case MIPI_DSI_NULL_PACKET:
> -		return dsi_vc_send_null(to_dsi_data(dssdev), msg->channel);
>  	}
>  
>  	return -EINVAL;

-- 
Regards,

Laurent Pinchart
