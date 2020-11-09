Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5A6572AB25D
	for <lists+linux-omap@lfdr.de>; Mon,  9 Nov 2020 09:28:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726176AbgKII2h (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 9 Nov 2020 03:28:37 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:39366 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726127AbgKII2h (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 9 Nov 2020 03:28:37 -0500
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 36C022FE;
        Mon,  9 Nov 2020 09:28:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1604910514;
        bh=C/GtXYbOYhvwRx1udWBC4DdvMzjB9bHSIaLz/fzoQ7M=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=P5sgU9mK96ifpoiQUj68RdfH5QaAC2MsBKvMF6olCqAKBo+QSR6I/Fa2pMB05FYJR
         J01VRWoK8XlhdWGkkIMl3MI7mPO2Kp30vY6CBtTEUnxixNXlYLixfTFr4Ktrz4ZkKb
         zGmkQx+Qedma6Mt0bOIODagV2PbbI262R9f2IYZI=
Date:   Mon, 9 Nov 2020 10:28:31 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Tomi Valkeinen <tomi.valkeinen@ti.com>
Cc:     Sebastian Reichel <sre@kernel.org>,
        Nikhil Devshatwar <nikhil.nd@ti.com>,
        linux-omap@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Sekhar Nori <nsekhar@ti.com>, Tony Lindgren <tony@atomide.com>,
        "H . Nikolaus Schaller" <hns@goldelico.com>,
        Sebastian Reichel <sebastian.reichel@collabora.com>
Subject: Re: [PATCH v3 11/56] drm/omap: dsi: simplify read functions
Message-ID: <20201109082831.GH6029@pendragon.ideasonboard.com>
References: <20201105120333.947408-1-tomi.valkeinen@ti.com>
 <20201105120333.947408-12-tomi.valkeinen@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20201105120333.947408-12-tomi.valkeinen@ti.com>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Tomi and Sebastian,

Thank you for the patch.

On Thu, Nov 05, 2020 at 02:02:48PM +0200, Tomi Valkeinen wrote:
> From: Sebastian Reichel <sebastian.reichel@collabora.com>
> 
> Simplify the read related message handling by using the functionality
> provided by CONFIG_DRM_MIPI_DSI.
> 
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/gpu/drm/omapdrm/dss/dsi.c | 110 +++++++++---------------------
>  1 file changed, 34 insertions(+), 76 deletions(-)
> 
> diff --git a/drivers/gpu/drm/omapdrm/dss/dsi.c b/drivers/gpu/drm/omapdrm/dss/dsi.c
> index e1595c0608f2..bbdc52ee3559 100644
> --- a/drivers/gpu/drm/omapdrm/dss/dsi.c
> +++ b/drivers/gpu/drm/omapdrm/dss/dsi.c
> @@ -2742,60 +2742,6 @@ static int dsi_vc_write_common(struct omap_dss_device *dssdev,
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
> @@ -2904,13 +2850,18 @@ static int dsi_vc_read_rx_fifo(struct dsi_data *dsi, int channel, u8 *buf,
>  	return r;
>  }
>  
> -static int dsi_vc_dcs_read(struct omap_dss_device *dssdev, int channel, u8 dcs_cmd,
> -		u8 *buf, int buflen)
> +static int dsi_vc_dcs_read(struct omap_dss_device *dssdev,
> +			   const struct mipi_dsi_msg *msg)
>  {
>  	struct dsi_data *dsi = to_dsi_data(dssdev);
> +	u8 dcs_cmd = ((u8 *)msg->tx_buf)[0];
> +	u8 channel = msg->channel;
>  	int r;
>  
> -	r = dsi_vc_dcs_send_read_request(dsi, channel, dcs_cmd);
> +	if (dsi->debug_read)
> +		DSSDBG("%s(ch %d, cmd %x)\n", __func__, channel, dcs_cmd);
> +
> +	r = dsi_vc_send_short(dsi, channel, MIPI_DSI_DCS_READ, dcs_cmd, 0);
>  	if (r)
>  		goto err;
>  
> @@ -2918,47 +2869,58 @@ static int dsi_vc_dcs_read(struct omap_dss_device *dssdev, int channel, u8 dcs_c
>  	if (r)
>  		goto err;
>  
> -	r = dsi_vc_read_rx_fifo(dsi, channel, buf, buflen,
> +	r = dsi_vc_read_rx_fifo(dsi, channel, msg->rx_buf, msg->rx_len,
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
> +	DSSERR("%s(ch %d, cmd 0x%02x) failed\n", __func__, msg->channel, dcs_cmd);
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
> +	DSSERR("%s(ch %d, reqlen %d) failed\n", __func__,  msg->channel, msg->tx_len);
> +	return r;
>  }
>  
>  static int dsi_enter_ulps(struct dsi_data *dsi)
> @@ -4775,13 +4737,9 @@ static ssize_t omap_dsi_transfer(struct omap_dss_device *dssdev,
>  	case MIPI_DSI_GENERIC_READ_REQUEST_0_PARAM:
>  	case MIPI_DSI_GENERIC_READ_REQUEST_1_PARAM:
>  	case MIPI_DSI_GENERIC_READ_REQUEST_2_PARAM:
> -		return dsi_vc_generic_read(dssdev, msg->channel,
> -					   msg->tx_buf, msg->tx_len,
> -					   msg->rx_buf, msg->rx_len);
> +		return dsi_vc_generic_read(dssdev, msg);
>  	case MIPI_DSI_DCS_READ:
> -		return dsi_vc_dcs_read(dssdev, msg->channel,
> -				       ((u8 *)msg->tx_buf)[0],
> -				       msg->rx_buf, msg->rx_len);
> +		return dsi_vc_dcs_read(dssdev, msg);
>  	}
>  
>  	return -EINVAL;

-- 
Regards,

Laurent Pinchart
