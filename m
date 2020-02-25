Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4D4C616EB3D
	for <lists+linux-omap@lfdr.de>; Tue, 25 Feb 2020 17:21:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728762AbgBYQVV (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 25 Feb 2020 11:21:21 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:60680 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728051AbgBYQVV (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 25 Feb 2020 11:21:21 -0500
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2731943F;
        Tue, 25 Feb 2020 17:21:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1582647678;
        bh=VkEAMhmHn/ec4VA1nRnQq41vMy0zB0nuxEJDxRMm06M=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Lcomu91fXiHOv9QNkV1EmDTP1bhVF/oZLdg3A0rCp0CUFIkbiNHlWdA/o64UL+aHF
         4aKCQ1NfVywgT78Tl8EY52dZXs5s2Bl7bZopTkQCb9BgXHhNBF5+Nz8kl6m5ZsuMaO
         CMuv4zwIAAQeB8prQjOE39KmKKNrclwzNEojUg/g=
Date:   Tue, 25 Feb 2020 18:20:57 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Sebastian Reichel <sebastian.reichel@collabora.com>
Cc:     Sebastian Reichel <sre@kernel.org>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Tony Lindgren <tony@atomide.com>,
        Merlijn Wajer <merlijn@wizzup.org>,
        "H. Nikolaus Schaller" <hns@goldelico.com>,
        Rob Herring <robh@kernel.org>, linux-omap@vger.kernel.org,
        dri-devel@lists.freedesktop.org, kernel@collabora.com
Subject: Re: [PATCHv2 12/56] drm/omap: dsi: simplify read functions
Message-ID: <20200225162057.GL4764@pendragon.ideasonboard.com>
References: <20200224232126.3385250-1-sebastian.reichel@collabora.com>
 <20200224232126.3385250-13-sebastian.reichel@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200224232126.3385250-13-sebastian.reichel@collabora.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Sebastian,

Thank you for the patch.

On Tue, Feb 25, 2020 at 12:20:42AM +0100, Sebastian Reichel wrote:
> Simplify the read related message handling by using the functionality
> provided by CONFIG_DRM_MIPI_DSI.
> 
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> ---
>  drivers/gpu/drm/omapdrm/dss/dsi.c | 109 +++++++++---------------------
>  1 file changed, 33 insertions(+), 76 deletions(-)
> 
> diff --git a/drivers/gpu/drm/omapdrm/dss/dsi.c b/drivers/gpu/drm/omapdrm/dss/dsi.c
> index e5589e615808..9b5b078beb6d 100644
> --- a/drivers/gpu/drm/omapdrm/dss/dsi.c
> +++ b/drivers/gpu/drm/omapdrm/dss/dsi.c
> @@ -2741,60 +2741,6 @@ static int dsi_vc_write_common(struct omap_dss_device *dssdev,
>  	return 0;
>  }
>  
> -static int dsi_vc_dcs_send_read_request(struct dsi_data *dsi, int channel,
> -					u8 dcs_cmd)
> -{
> -	int r;
> -
> -	if (dsi->debug_read)
> -		DSSDBG("dsi_vc_dcs_send_read_request(ch%d, dcs_cmd %x)\n",
> -			channel, dcs_cmd);
> -

Do you plan to drop debug_read ? I don't really mind, but it can have
its uses. If this wasn't done on purpose, you may want to move those
messages to dsi_vc_dcs_read() and dsi_vc_generic_read().

> -	r = dsi_vc_send_short(dsi, channel, MIPI_DSI_DCS_READ, dcs_cmd, 0);
> -	if (r) {
> -		DSSERR("dsi_vc_dcs_send_read_request(ch %d, cmd 0x%02x)"
> -			" failed\n", channel, dcs_cmd);
> -		return r;
> -	}
> -
> -	return 0;
> -}
> -
> -static int dsi_vc_generic_send_read_request(struct dsi_data *dsi, int channel,
> -					    const u8 *reqdata, int reqlen)
> -{
> -	u16 data;
> -	u8 data_type;
> -	int r;
> -
> -	if (dsi->debug_read)
> -		DSSDBG("dsi_vc_generic_send_read_request(ch %d, reqlen %d)\n",
> -			channel, reqlen);
> -
> -	if (reqlen == 0) {
> -		data_type = MIPI_DSI_GENERIC_READ_REQUEST_0_PARAM;
> -		data = 0;
> -	} else if (reqlen == 1) {
> -		data_type = MIPI_DSI_GENERIC_READ_REQUEST_1_PARAM;
> -		data = reqdata[0];
> -	} else if (reqlen == 2) {
> -		data_type = MIPI_DSI_GENERIC_READ_REQUEST_2_PARAM;
> -		data = reqdata[0] | (reqdata[1] << 8);
> -	} else {
> -		BUG();
> -		return -EINVAL;
> -	}
> -
> -	r = dsi_vc_send_short(dsi, channel, data_type, data, 0);
> -	if (r) {
> -		DSSERR("dsi_vc_generic_send_read_request(ch %d, reqlen %d)"
> -			" failed\n", channel, reqlen);
> -		return r;
> -	}
> -
> -	return 0;
> -}
> -
>  static int dsi_vc_read_rx_fifo(struct dsi_data *dsi, int channel, u8 *buf,
>  			       int buflen, enum dss_dsi_content_type type)
>  {
> @@ -2903,61 +2849,75 @@ static int dsi_vc_read_rx_fifo(struct dsi_data *dsi, int channel, u8 *buf,
>  	return r;
>  }
>  
> -static int dsi_vc_dcs_read(struct omap_dss_device *dssdev, int channel, u8 dcs_cmd,
> -		u8 *buf, int buflen)
> +static int dsi_vc_dcs_read(struct omap_dss_device *dssdev,
> +			   const struct mipi_dsi_msg *msg)
>  {
>  	struct dsi_data *dsi = to_dsi_data(dssdev);
>  	int r;
> +	u8 dcs_cmd = ((u8*) msg->tx_buf)[0];

Nitpicking, dcs_cmd before r ?

>  
> -	r = dsi_vc_dcs_send_read_request(dsi, channel, dcs_cmd);
> +	r = dsi_vc_send_short(dsi, msg->channel, MIPI_DSI_DCS_READ, dcs_cmd, 0);
>  	if (r)
>  		goto err;
>  
> -	r = dsi_vc_send_bta_sync(dssdev, channel);
> +	r = dsi_vc_send_bta_sync(dssdev, msg->channel);
>  	if (r)
>  		goto err;
>  
> -	r = dsi_vc_read_rx_fifo(dsi, channel, buf, buflen,
> +	r = dsi_vc_read_rx_fifo(dsi, msg->channel, msg->rx_buf, msg->rx_len,
>  		DSS_DSI_CONTENT_DCS);
>  	if (r < 0)
>  		goto err;
>  
> -	if (r != buflen) {
> +	if (r != msg->rx_len) {
>  		r = -EIO;
>  		goto err;
>  	}
>  
>  	return 0;
>  err:
> -	DSSERR("dsi_vc_dcs_read(ch %d, cmd 0x%02x) failed\n", channel, dcs_cmd);
> +	DSSERR("dsi_vc_dcs_read(ch %d, cmd 0x%02x) failed\n",
> +		msg->channel, dcs_cmd);
>  	return r;
>  }
>  
> -static int dsi_vc_generic_read(struct omap_dss_device *dssdev, int channel,
> -		const u8 *reqdata, int reqlen, u8 *buf, int buflen)
> +static int dsi_vc_generic_read(struct omap_dss_device *dssdev,
> +			       const struct mipi_dsi_msg *msg)
>  {
>  	struct dsi_data *dsi = to_dsi_data(dssdev);
> +	struct mipi_dsi_packet packet;
> +	u16 data;
>  	int r;
>  
> -	r = dsi_vc_generic_send_read_request(dsi, channel, reqdata, reqlen);
> +	r = mipi_dsi_create_packet(&packet, msg);
> +	if (r < 0)
> +		goto err;
> +
> +	data = packet.header[1] | (packet.header[2] << 8);

As with the previous patch, I think you can compute data manually if the
only use of the packet structure is to get this information.

> +
> +	r = dsi_vc_send_short(dsi, msg->channel, msg->type, data, 0);
>  	if (r)
> -		return r;
> +		goto err;
>  
> -	r = dsi_vc_send_bta_sync(dssdev, channel);
> +	r = dsi_vc_send_bta_sync(dssdev, msg->channel);
>  	if (r)
> -		return r;
> +		goto err;
>  
> -	r = dsi_vc_read_rx_fifo(dsi, channel, buf, buflen,
> +	r = dsi_vc_read_rx_fifo(dsi, msg->channel, msg->rx_buf, msg->rx_len,
>  		DSS_DSI_CONTENT_GENERIC);
>  	if (r < 0)
> -		return r;
> +		goto err;
>  
> -	if (r != buflen) {
> +	if (r != msg->rx_len) {
>  		r = -EIO;
> -		return r;
> +		goto err;
>  	}
>  
>  	return 0;
> +err:
> +	DSSERR("dsi_vc_generic_read(ch %d, reqlen %d) failed\n",
> +		msg->channel, msg->tx_len);
> +	return r;
>  }
>  
>  static int dsi_enter_ulps(struct dsi_data *dsi)
> @@ -4768,12 +4728,9 @@ static ssize_t omap_dsi_transfer(struct omap_dss_device *dssdev,
>  	case MIPI_DSI_GENERIC_READ_REQUEST_0_PARAM:
>  	case MIPI_DSI_GENERIC_READ_REQUEST_1_PARAM:
>  	case MIPI_DSI_GENERIC_READ_REQUEST_2_PARAM:
> -		return dsi_vc_generic_read(dssdev, msg->channel, msg->tx_buf,
> -				msg->tx_len, msg->rx_buf, msg->rx_len);
> +		return dsi_vc_generic_read(dssdev, msg);
>  	case MIPI_DSI_DCS_READ:
> -		return dsi_vc_dcs_read(dssdev, msg->channel,
> -				((u8*) msg->tx_buf)[0],
> -				msg->rx_buf, msg->rx_len);
> +		return dsi_vc_dcs_read(dssdev, msg);
>  	}
>  
>  	return -EINVAL;

-- 
Regards,

Laurent Pinchart
