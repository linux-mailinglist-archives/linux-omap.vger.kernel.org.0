Return-Path: <linux-omap+bounces-507-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AD2384B66D
	for <lists+linux-omap@lfdr.de>; Tue,  6 Feb 2024 14:31:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2FAB5B25345
	for <lists+linux-omap@lfdr.de>; Tue,  6 Feb 2024 13:31:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36E54130E5F;
	Tue,  6 Feb 2024 13:31:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="jJt87ajW"
X-Original-To: linux-omap@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E253073195;
	Tue,  6 Feb 2024 13:31:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707226285; cv=none; b=bNaAUAn0LChORmO5kNRUcIHvUOKkf6NgC/ta5poAK8EsbggD2X3+1b/Dz5nrpcl4Nv+n2hzDVyU8Qbl8/JApPOGB8eVu1rebCKd0tnwX2bWHh5zSdQE1FJl1WM9b2Pt/0L+E6vII0B84ZFDKb4JGUfDPoTSpt2Dva1OjkQ9hGTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707226285; c=relaxed/simple;
	bh=KMA/bJybbnWogXygT+8vj+CljyBc90aEvqxIQixKXiE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l8zYCryeHi9a4SonNvEMEmm6C+BDvHPQXHWG4GH/VfoBkJdy0JkAIoVWIa4igrch0hm+ZXwUxtzW2U5wCXlWnGLUQlPfxfW7V+gcnon/+DFmxj6WzQpsFmByZNrOUZ0bZt6ejopG01iqrvk2PEkG2F+NvyGSI7/SjjeWYALMAis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=jJt87ajW; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (85-76-34-85-nat.elisa-mobile.fi [85.76.34.85])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id CAB3874A;
	Tue,  6 Feb 2024 14:29:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1707226198;
	bh=KMA/bJybbnWogXygT+8vj+CljyBc90aEvqxIQixKXiE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jJt87ajWVdK89Rfyb+jiky4gvmowtfZOCJZtCWAdBzrxqQjYl8RkDAWw1GjNPt3rj
	 Jenek9xQ8efrqfbQWdR/MAB0bf8AjF6cNDJomTaxkqGCx5MqRkTc5onD0kUQ+f/BDi
	 E1GhB9QNoRnXcHEKttDqnEeZ9R8xAGJsVuVXKMVI=
Date: Tue, 6 Feb 2024 15:31:22 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: "Lad,  Prabhakar" <prabhakar.csengg@gmail.com>,
	=?utf-8?Q?=22Uwe_Kleine-K=C3=B6nig=22?= <u.kleine-koenig@pengutronix.de>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Alexey Brodkin <abrodkin@synopsys.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Daniel Vetter <daniel@ffwll.ch>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	David Airlie <airlied@gmail.com>,
	Eugen Hristev <eugen.hristev@collabora.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Helge Deller <deller@gmx.de>,
	Hugues Fruchet <hugues.fruchet@foss.st.com>,
	Jacopo Mondi <jacopo@jmondi.org>,
	Jessica Zhang <quic_jesszhan@quicinc.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Maxime Ripard <mripard@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Russell King <linux@armlinux.org.uk>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Sam Ravnborg <sam@ravnborg.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Tim Harvey <tharvey@gateworks.com>, dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org, linux-fbdev@vger.kernel.org,
	linux-media@vger.kernel.org, linux-omap@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH 1/4] gpu: drm: replace of_graph_get_next_endpoint()
Message-ID: <20240206133122.GA2827@pendragon.ideasonboard.com>
References: <87ttmmnvzh.wl-kuninori.morimoto.gx@renesas.com>
 <87sf26nvy2.wl-kuninori.morimoto.gx@renesas.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <87sf26nvy2.wl-kuninori.morimoto.gx@renesas.com>

Hello Morimoto-san,

Thank you for the patch.

On Tue, Feb 06, 2024 at 02:55:01AM +0000, Kuninori Morimoto wrote:
> From DT point of view, in general, drivers should be asking for a
> specific port number because their function is fixed in the binding.
> 
> of_graph_get_next_endpoint() doesn't match to this concept.
> 
> Simply replace
> 
> 	- of_graph_get_next_endpoint(xxx, NULL);
> 	+ of_graph_get_endpoint_by_regs(xxx, 0, -1);
> 
> Link: https://lore.kernel.org/r/20240202174941.GA310089-robh@kernel.org
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---
>  drivers/gpu/drm/drm_of.c                              | 2 +-
>  drivers/gpu/drm/panel/panel-raspberrypi-touchscreen.c | 2 +-
>  drivers/gpu/drm/tiny/arcpgu.c                         | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_of.c b/drivers/gpu/drm/drm_of.c
> index 177b600895d3..c2eae9296012 100644
> --- a/drivers/gpu/drm/drm_of.c
> +++ b/drivers/gpu/drm/drm_of.c
> @@ -516,7 +516,7 @@ struct mipi_dsi_host *drm_of_get_dsi_bus(struct device *dev)
>  	/*
>  	 * Get first endpoint child from device.
>  	 */
> -	endpoint = of_graph_get_next_endpoint(dev->of_node, NULL);
> +	endpoint = of_graph_get_endpoint_by_regs(dev->of_node, 0, -1);

This assumes that the DSI device's port@0 will also be the input. That's
fine for current users of this function, but we should at least document
it.

diff --git a/drivers/gpu/drm/drm_of.c b/drivers/gpu/drm/drm_of.c
index 177b600895d3..012c4d04cf51 100644
--- a/drivers/gpu/drm/drm_of.c
+++ b/drivers/gpu/drm/drm_of.c
@@ -504,6 +504,8 @@ EXPORT_SYMBOL_GPL(drm_of_get_data_lanes_count_ep);
  * Gets parent DSI bus for a DSI device controlled through a bus other
  * than MIPI-DCS (SPI, I2C, etc.) using the Device Tree.
  *
+ * This function assumes that the device's port@0 is the DSI input.
+ *
  * Returns pointer to mipi_dsi_host if successful, -EINVAL if the
  * request is unsupported, -EPROBE_DEFER if the DSI host is found but
  * not available, or -ENODEV otherwise.

With this,

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

>  	if (!endpoint)
>  		return ERR_PTR(-ENODEV);
>  
> diff --git a/drivers/gpu/drm/panel/panel-raspberrypi-touchscreen.c b/drivers/gpu/drm/panel/panel-raspberrypi-touchscreen.c
> index 4618c892cdd6..e10e469aa7a6 100644
> --- a/drivers/gpu/drm/panel/panel-raspberrypi-touchscreen.c
> +++ b/drivers/gpu/drm/panel/panel-raspberrypi-touchscreen.c
> @@ -400,7 +400,7 @@ static int rpi_touchscreen_probe(struct i2c_client *i2c)
>  	rpi_touchscreen_i2c_write(ts, REG_POWERON, 0);
>  
>  	/* Look up the DSI host.  It needs to probe before we do. */
> -	endpoint = of_graph_get_next_endpoint(dev->of_node, NULL);
> +	endpoint = of_graph_get_endpoint_by_regs(dev->of_node, 0, -1);
>  	if (!endpoint)
>  		return -ENODEV;
>  
> diff --git a/drivers/gpu/drm/tiny/arcpgu.c b/drivers/gpu/drm/tiny/arcpgu.c
> index e5b10e41554a..04d0053b9315 100644
> --- a/drivers/gpu/drm/tiny/arcpgu.c
> +++ b/drivers/gpu/drm/tiny/arcpgu.c
> @@ -288,7 +288,7 @@ static int arcpgu_load(struct arcpgu_drm_private *arcpgu)
>  	 * There is only one output port inside each device. It is linked with
>  	 * encoder endpoint.
>  	 */
> -	endpoint_node = of_graph_get_next_endpoint(pdev->dev.of_node, NULL);
> +	endpoint_node = of_graph_get_endpoint_by_regs(pdev->dev.of_node, 0, -1);
>  	if (endpoint_node) {
>  		encoder_node = of_graph_get_remote_port_parent(endpoint_node);
>  		of_node_put(endpoint_node);

-- 
Regards,

Laurent Pinchart

