Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 579522D2E9B
	for <lists+linux-omap@lfdr.de>; Tue,  8 Dec 2020 16:49:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729665AbgLHPtb (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 8 Dec 2020 10:49:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49910 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729334AbgLHPta (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 8 Dec 2020 10:49:30 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 800E6C0613D6
        for <linux-omap@vger.kernel.org>; Tue,  8 Dec 2020 07:48:50 -0800 (PST)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id D8876DD;
        Tue,  8 Dec 2020 16:48:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1607442529;
        bh=ircV3matoefGm6nqpfoT4DSJsQhG9eBQ8I+vPoFc9dg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=GZy7jp5yuQp1GRaGSULZDWzNe17Np/ShICjhK3L8G5AWDL4Mv1MZMPtwTs2GcCJZE
         oypN8aEYodIDoY5TtqUncIuqtQM/ZVn3TA19mW7oLsA5I68t8LIqPTeuNuwm8O46qJ
         0X0s396R1pkqtRNakUoCiMrNYhia4tye55QlaZBg=
Date:   Tue, 8 Dec 2020 17:48:45 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Tomi Valkeinen <tomi.valkeinen@ti.com>
Cc:     Sebastian Reichel <sre@kernel.org>,
        Nikhil Devshatwar <nikhil.nd@ti.com>,
        dri-devel@lists.freedesktop.org, linux-omap@vger.kernel.org,
        Sekhar Nori <nsekhar@ti.com>, Tony Lindgren <tony@atomide.com>,
        hns@goldelico.com, Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v5 29/29] drm/omap: dsi: allow DSI commands to be sent
 early
Message-ID: <X8+gXWBwLItZA7gA@pendragon.ideasonboard.com>
References: <20201208122855.254819-1-tomi.valkeinen@ti.com>
 <20201208122855.254819-30-tomi.valkeinen@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20201208122855.254819-30-tomi.valkeinen@ti.com>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Tomi,

Thank you for the patch.

On Tue, Dec 08, 2020 at 02:28:55PM +0200, Tomi Valkeinen wrote:
> Panel drivers can send DSI commands in panel's prepare(), which happens
> before the bridge's enable() is called. The OMAP DSI driver currently
> only sets up the DSI interface at bridge's enable(), so prepare() cannot
> be used to send DSI commands.
> 
> This patch fixes the issue by making it possible to enable the DSI
> interface any time a command is about to be sent. Disabling the
> interface is be done via delayed work.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
> ---
>  drivers/gpu/drm/omapdrm/dss/dsi.c | 49 +++++++++++++++++++++++++++----
>  drivers/gpu/drm/omapdrm/dss/dsi.h |  3 ++
>  2 files changed, 47 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/omapdrm/dss/dsi.c b/drivers/gpu/drm/omapdrm/dss/dsi.c
> index 53a64bc91867..34f665aa9a59 100644
> --- a/drivers/gpu/drm/omapdrm/dss/dsi.c
> +++ b/drivers/gpu/drm/omapdrm/dss/dsi.c
> @@ -3503,6 +3503,9 @@ static void dsi_enable(struct dsi_data *dsi)
>  
>  	WARN_ON(!dsi_bus_is_locked(dsi));
>  
> +	if (WARN_ON(dsi->iface_enabled))
> +		return;
> +
>  	mutex_lock(&dsi->lock);
>  
>  	r = dsi_runtime_get(dsi);
> @@ -3515,6 +3518,8 @@ static void dsi_enable(struct dsi_data *dsi)
>  	if (r)
>  		goto err_init_dsi;
>  
> +	dsi->iface_enabled = true;
> +
>  	mutex_unlock(&dsi->lock);
>  
>  	return;
> @@ -3530,6 +3535,9 @@ static void dsi_disable(struct dsi_data *dsi)
>  {
>  	WARN_ON(!dsi_bus_is_locked(dsi));
>  
> +	if (WARN_ON(!dsi->iface_enabled))
> +		return;
> +
>  	mutex_lock(&dsi->lock);
>  
>  	dsi_sync_vc(dsi, 0);
> @@ -3541,6 +3549,8 @@ static void dsi_disable(struct dsi_data *dsi)
>  
>  	dsi_runtime_put(dsi);
>  
> +	dsi->iface_enabled = false;
> +
>  	mutex_unlock(&dsi->lock);
>  }
>  
> @@ -4229,10 +4239,12 @@ static ssize_t omap_dsi_host_transfer(struct mipi_dsi_host *host,
>  
>  	dsi_bus_lock(dsi);
>  
> -	if (dsi->video_enabled)
> -		r = _omap_dsi_host_transfer(dsi, vc, msg);
> -	else
> -		r = -EIO;
> +	if (!dsi->iface_enabled) {
> +		dsi_enable(dsi);
> +		schedule_delayed_work(&dsi->dsi_disable_work, msecs_to_jiffies(2000));
> +	}
> +
> +	r = _omap_dsi_host_transfer(dsi, vc, msg);
>  
>  	dsi_bus_unlock(dsi);
>  
> @@ -4397,6 +4409,14 @@ static int omap_dsi_host_detach(struct mipi_dsi_host *host,
>  	if (WARN_ON(dsi->dsidev != client))
>  		return -EINVAL;
>  
> +	cancel_delayed_work_sync(&dsi->dsi_disable_work);
> +
> +	if (dsi->iface_enabled) {
> +		dsi_bus_lock(dsi);
> +		dsi_disable(dsi);
> +		dsi_bus_unlock(dsi);
> +	}
> +
>  	omap_dsi_unregister_te_irq(dsi);
>  	dsi->dsidev = NULL;
>  	return 0;
> @@ -4632,9 +4652,12 @@ static void dsi_bridge_enable(struct drm_bridge *bridge)
>  	struct dsi_data *dsi = drm_bridge_to_dsi(bridge);
>  	struct omap_dss_device *dssdev = &dsi->output;
>  
> +	cancel_delayed_work_sync(&dsi->dsi_disable_work);
> +

Is there a risk of a race condition if omap_dsi_host_transfer() is
called right here, before locking the bus ? Or is there a guarantee that
the two functions can't be executed concurrently ? Same for
dsi_bridge_disable() below.

>  	dsi_bus_lock(dsi);
>  
> -	dsi_enable(dsi);
> +	if (!dsi->iface_enabled)
> +		dsi_enable(dsi);
>  
>  	dsi_enable_video_output(dssdev, VC_VIDEO);
>  
> @@ -4648,6 +4671,8 @@ static void dsi_bridge_disable(struct drm_bridge *bridge)
>  	struct dsi_data *dsi = drm_bridge_to_dsi(bridge);
>  	struct omap_dss_device *dssdev = &dsi->output;
>  
> +	cancel_delayed_work_sync(&dsi->dsi_disable_work);
> +
>  	dsi_bus_lock(dsi);
>  
>  	dsi->video_enabled = false;
> @@ -4840,6 +4865,18 @@ static const struct soc_device_attribute dsi_soc_devices[] = {
>  	{ /* sentinel */ }
>  };
>  
> +static void omap_dsi_disable_work_callback(struct work_struct *work)
> +{
> +	struct dsi_data *dsi = container_of(work, struct dsi_data, dsi_disable_work.work);
> +
> +	dsi_bus_lock(dsi);
> +
> +	if (dsi->iface_enabled && !dsi->video_enabled)
> +		dsi_disable(dsi);
> +
> +	dsi_bus_unlock(dsi);
> +}
> +
>  static int dsi_probe(struct platform_device *pdev)
>  {
>  	const struct soc_device_attribute *soc;
> @@ -4873,6 +4910,8 @@ static int dsi_probe(struct platform_device *pdev)
>  	INIT_DEFERRABLE_WORK(&dsi->framedone_timeout_work,
>  			     dsi_framedone_timeout_work_callback);
>  
> +	INIT_DEFERRABLE_WORK(&dsi->dsi_disable_work, omap_dsi_disable_work_callback);
> +
>  #ifdef DSI_CATCH_MISSING_TE
>  	timer_setup(&dsi->te_timer, dsi_te_timeout, 0);
>  #endif
> diff --git a/drivers/gpu/drm/omapdrm/dss/dsi.h b/drivers/gpu/drm/omapdrm/dss/dsi.h
> index de9411067ba2..601707c0ecc4 100644
> --- a/drivers/gpu/drm/omapdrm/dss/dsi.h
> +++ b/drivers/gpu/drm/omapdrm/dss/dsi.h
> @@ -394,6 +394,7 @@ struct dsi_data {
>  	atomic_t do_ext_te_update;
>  
>  	bool te_enabled;
> +	bool iface_enabled;
>  	bool video_enabled;
>  
>  	struct delayed_work framedone_timeout_work;
> @@ -443,6 +444,8 @@ struct dsi_data {
>  
>  	struct omap_dss_device output;
>  	struct drm_bridge bridge;
> +
> +	struct delayed_work dsi_disable_work;
>  };
>  
>  struct dsi_packet_sent_handler_data {

-- 
Regards,

Laurent Pinchart
