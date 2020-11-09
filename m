Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BAFFA2AB289
	for <lists+linux-omap@lfdr.de>; Mon,  9 Nov 2020 09:38:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729614AbgKIIiQ (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 9 Nov 2020 03:38:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36344 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729514AbgKIIiQ (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 9 Nov 2020 03:38:16 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C47DC0613CF
        for <linux-omap@vger.kernel.org>; Mon,  9 Nov 2020 00:38:16 -0800 (PST)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 409041243;
        Mon,  9 Nov 2020 09:38:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1604911094;
        bh=c7AmivbXSP6pMtMibZhY90yDSzoedV9tYZWmTUrkuOk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=nV5Qu5ruqB0L1Gt65bw1gkxj5vy3aWG2ef+f2Z+VCaVqlQtcvBOoPHRSGJvtvvJaT
         BDZB7M7hvnBg33IZK/k5QIlYA4PnI4bfTJ8z/QS8bROa/ZZz3YwjXVwNrz5GMNCxks
         le1g/C+I0glwI3iRkYc85VGQzh+aA2/LuuCjHr5E=
Date:   Mon, 9 Nov 2020 10:38:10 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Tomi Valkeinen <tomi.valkeinen@ti.com>
Cc:     Sebastian Reichel <sre@kernel.org>,
        Nikhil Devshatwar <nikhil.nd@ti.com>,
        linux-omap@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Sekhar Nori <nsekhar@ti.com>, Tony Lindgren <tony@atomide.com>,
        "H . Nikolaus Schaller" <hns@goldelico.com>,
        Sebastian Reichel <sebastian.reichel@collabora.com>
Subject: Re: [PATCH v3 13/56] drm/omap: dsi: introduce mipi_dsi_host
Message-ID: <20201109083810.GJ6029@pendragon.ideasonboard.com>
References: <20201105120333.947408-1-tomi.valkeinen@ti.com>
 <20201105120333.947408-14-tomi.valkeinen@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20201105120333.947408-14-tomi.valkeinen@ti.com>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Tomi and Sebastian,

Thank you for the patch.

On Thu, Nov 05, 2020 at 02:02:50PM +0200, Tomi Valkeinen wrote:
> From: Sebastian Reichel <sebastian.reichel@collabora.com>
> 
> This moves from custom platform driver infrastructure to mipi_dsi_host
> and mipi_dsi_device. Note, that this is a graduate step and the driver
> only uses the devices types and transfer function, but not yet the new
> device binding style or drm_panel.
> 
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
> ---
>  .../gpu/drm/omapdrm/displays/panel-dsi-cm.c   | 121 +++++++++---------
>  drivers/gpu/drm/omapdrm/dss/dsi.c             |  54 ++++++--
>  drivers/gpu/drm/omapdrm/dss/omapdss.h         |   4 -
>  3 files changed, 103 insertions(+), 76 deletions(-)
> 
> diff --git a/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c b/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c
> index ea76a89d1833..c3190223d192 100644
> --- a/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c
> +++ b/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c
> @@ -14,7 +14,6 @@
>  #include <linux/interrupt.h>
>  #include <linux/jiffies.h>
>  #include <linux/module.h>
> -#include <linux/platform_device.h>
>  #include <linux/sched/signal.h>
>  #include <linux/slab.h>
>  #include <linux/workqueue.h>
> @@ -39,13 +38,13 @@
>  #define DCS_GET_ID3		0xdc
>  
>  struct panel_drv_data {
> +	struct mipi_dsi_device *dsi;
> +
>  	struct omap_dss_device dssdev;
>  	struct omap_dss_device *src;
>  
>  	struct videomode vm;
>  
> -	struct platform_device *pdev;
> -
>  	struct mutex lock;
>  
>  	struct backlight_device *bldev;
> @@ -139,7 +138,7 @@ static void hw_guard_wait(struct panel_drv_data *ddata)
>  
>  static int dsicm_dcs_read_1(struct panel_drv_data *ddata, u8 dcs_cmd, u8 *data)
>  {
> -	struct omap_dss_device *src = ddata->src;
> +	struct mipi_dsi_device *dsi = ddata->dsi;
>  	const struct mipi_dsi_msg msg = {
>  		.channel = ddata->channel,
>  		.type = MIPI_DSI_DCS_READ,
> @@ -149,12 +148,12 @@ static int dsicm_dcs_read_1(struct panel_drv_data *ddata, u8 dcs_cmd, u8 *data)
>  		.rx_buf = data
>  	};
>  
> -	return src->ops->dsi.transfer(src, &msg);
> +	return dsi->host->ops->transfer(dsi->host, &msg);
>  }
>  
>  static int dsicm_dcs_write_0(struct panel_drv_data *ddata, u8 dcs_cmd)
>  {
> -	struct omap_dss_device *src = ddata->src;
> +	struct mipi_dsi_device *dsi = ddata->dsi;
>  	const struct mipi_dsi_msg msg = {
>  		.channel = ddata->channel,
>  		.type = MIPI_DSI_DCS_SHORT_WRITE,
> @@ -162,12 +161,12 @@ static int dsicm_dcs_write_0(struct panel_drv_data *ddata, u8 dcs_cmd)
>  		.tx_len = 1,
>  	};
>  
> -	return src->ops->dsi.transfer(src, &msg);
> +	return dsi->host->ops->transfer(dsi->host, &msg);
>  }
>  
>  static int dsicm_dcs_write_1(struct panel_drv_data *ddata, u8 dcs_cmd, u8 param)
>  {
> -	struct omap_dss_device *src = ddata->src;
> +	struct mipi_dsi_device *dsi = ddata->dsi;
>  	const u8 buf[] = { dcs_cmd, param };
>  	const struct mipi_dsi_msg msg = {
>  		.channel = ddata->channel,
> @@ -176,13 +175,13 @@ static int dsicm_dcs_write_1(struct panel_drv_data *ddata, u8 dcs_cmd, u8 param)
>  		.tx_len = 2,
>  	};
>  
> -	return src->ops->dsi.transfer(src, &msg);
> +	return dsi->host->ops->transfer(dsi->host, &msg);
>  }
>  
>  static int dsicm_sleep_in(struct panel_drv_data *ddata)
>  
>  {
> -	struct omap_dss_device *src = ddata->src;
> +	struct mipi_dsi_device *dsi = ddata->dsi;
>  	int r;
>  	const u8 cmd = MIPI_DCS_ENTER_SLEEP_MODE;
>  	const struct mipi_dsi_msg msg = {
> @@ -194,7 +193,7 @@ static int dsicm_sleep_in(struct panel_drv_data *ddata)
>  
>  	hw_guard_wait(ddata);
>  
> -	r = src->ops->dsi.transfer(src, &msg);
> +	r = dsi->host->ops->transfer(dsi->host, &msg);
>  	if (r)
>  		return r;
>  
> @@ -242,7 +241,7 @@ static int dsicm_get_id(struct panel_drv_data *ddata, u8 *id1, u8 *id2, u8 *id3)
>  static int dsicm_set_update_window(struct panel_drv_data *ddata,
>  		u16 x, u16 y, u16 w, u16 h)
>  {
> -	struct omap_dss_device *src = ddata->src;
> +	struct mipi_dsi_device *dsi = ddata->dsi;
>  	int r;
>  	u16 x1 = x;
>  	u16 x2 = x + w - 1;
> @@ -279,11 +278,11 @@ static int dsicm_set_update_window(struct panel_drv_data *ddata,
>  		.tx_len = 5,
>  	};
>  
> -	r = src->ops->dsi.transfer(src, &msgX);
> +	r = dsi->host->ops->transfer(dsi->host, &msgX);
>  	if (r)
>  		return r;
>  
> -	r = src->ops->dsi.transfer(src, &msgY);
> +	r = dsi->host->ops->transfer(dsi->host, &msgY);
>  	if (r)
>  		return r;
>  
> @@ -326,7 +325,7 @@ static int dsicm_enter_ulps(struct panel_drv_data *ddata)
>  	return 0;
>  
>  err:
> -	dev_err(&ddata->pdev->dev, "enter ULPS failed");
> +	dev_err(&ddata->dsi->dev, "enter ULPS failed");
>  	dsicm_panel_reset(ddata);
>  
>  	ddata->ulps_enabled = false;
> @@ -349,7 +348,7 @@ static int dsicm_exit_ulps(struct panel_drv_data *ddata)
>  
>  	r = _dsicm_enable_te(ddata, true);
>  	if (r) {
> -		dev_err(&ddata->pdev->dev, "failed to re-enable TE");
> +		dev_err(&ddata->dsi->dev, "failed to re-enable TE");
>  		goto err2;
>  	}
>  
> @@ -363,7 +362,7 @@ static int dsicm_exit_ulps(struct panel_drv_data *ddata)
>  	return 0;
>  
>  err2:
> -	dev_err(&ddata->pdev->dev, "failed to exit ULPS");
> +	dev_err(&ddata->dsi->dev, "failed to exit ULPS");
>  
>  	r = dsicm_panel_reset(ddata);
>  	if (!r) {
> @@ -400,7 +399,7 @@ static int dsicm_bl_update_status(struct backlight_device *dev)
>  	else
>  		level = 0;
>  
> -	dev_dbg(&ddata->pdev->dev, "update brightness to %d\n", level);
> +	dev_dbg(&ddata->dsi->dev, "update brightness to %d\n", level);
>  
>  	mutex_lock(&ddata->lock);
>  
> @@ -637,7 +636,7 @@ static int dsicm_power_on(struct panel_drv_data *ddata)
>  	if (ddata->vpnl) {
>  		r = regulator_enable(ddata->vpnl);
>  		if (r) {
> -			dev_err(&ddata->pdev->dev,
> +			dev_err(&ddata->dsi->dev,
>  				"failed to enable VPNL: %d\n", r);
>  			return r;
>  		}
> @@ -646,7 +645,7 @@ static int dsicm_power_on(struct panel_drv_data *ddata)
>  	if (ddata->vddi) {
>  		r = regulator_enable(ddata->vddi);
>  		if (r) {
> -			dev_err(&ddata->pdev->dev,
> +			dev_err(&ddata->dsi->dev,
>  				"failed to enable VDDI: %d\n", r);
>  			goto err_vpnl;
>  		}
> @@ -654,7 +653,7 @@ static int dsicm_power_on(struct panel_drv_data *ddata)
>  
>  	r = src->ops->dsi.set_config(src, &dsi_config);
>  	if (r) {
> -		dev_err(&ddata->pdev->dev, "failed to configure DSI\n");
> +		dev_err(&ddata->dsi->dev, "failed to configure DSI\n");
>  		goto err_vddi;
>  	}
>  
> @@ -701,7 +700,7 @@ static int dsicm_power_on(struct panel_drv_data *ddata)
>  	ddata->enabled = true;
>  
>  	if (!ddata->intro_printed) {
> -		dev_info(&ddata->pdev->dev, "panel revision %02x.%02x.%02x\n",
> +		dev_info(&ddata->dsi->dev, "panel revision %02x.%02x.%02x\n",
>  			id1, id2, id3);
>  		ddata->intro_printed = true;
>  	}
> @@ -710,7 +709,7 @@ static int dsicm_power_on(struct panel_drv_data *ddata)
>  
>  	return 0;
>  err:
> -	dev_err(&ddata->pdev->dev, "error while enabling panel, issuing HW reset\n");
> +	dev_err(&ddata->dsi->dev, "error while enabling panel, issuing HW reset\n");
>  
>  	dsicm_hw_reset(ddata);
>  
> @@ -737,7 +736,7 @@ static void dsicm_power_off(struct panel_drv_data *ddata)
>  		r = dsicm_sleep_in(ddata);
>  
>  	if (r) {
> -		dev_err(&ddata->pdev->dev,
> +		dev_err(&ddata->dsi->dev,
>  				"error disabling panel, issuing HW reset\n");
>  		dsicm_hw_reset(ddata);
>  	}
> @@ -754,7 +753,7 @@ static void dsicm_power_off(struct panel_drv_data *ddata)
>  
>  static int dsicm_panel_reset(struct panel_drv_data *ddata)
>  {
> -	dev_err(&ddata->pdev->dev, "performing LCD reset\n");
> +	dev_err(&ddata->dsi->dev, "performing LCD reset\n");
>  
>  	dsicm_power_off(ddata);
>  	dsicm_hw_reset(ddata);
> @@ -765,7 +764,7 @@ static int dsicm_connect(struct omap_dss_device *src,
>  			 struct omap_dss_device *dst)
>  {
>  	struct panel_drv_data *ddata = to_panel_data(dst);
> -	struct device *dev = &ddata->pdev->dev;
> +	struct device *dev = &ddata->dsi->dev;
>  	int r;
>  
>  	r = src->ops->dsi.request_vc(src, ddata->channel);
> @@ -810,7 +809,7 @@ static void dsicm_enable(struct omap_dss_device *dssdev)
>  
>  	return;
>  err:
> -	dev_dbg(&ddata->pdev->dev, "enable failed (%d)\n", r);
> +	dev_dbg(&ddata->dsi->dev, "enable failed (%d)\n", r);
>  	mutex_unlock(&ddata->lock);
>  }
>  
> @@ -842,7 +841,7 @@ static void dsicm_framedone_cb(int err, void *data)
>  	struct panel_drv_data *ddata = data;
>  	struct omap_dss_device *src = ddata->src;
>  
> -	dev_dbg(&ddata->pdev->dev, "framedone, err %d\n", err);
> +	dev_dbg(&ddata->dsi->dev, "framedone, err %d\n", err);
>  	src->ops->dsi.bus_unlock(src);
>  }
>  
> @@ -866,7 +865,7 @@ static irqreturn_t dsicm_te_isr(int irq, void *data)
>  
>  	return IRQ_HANDLED;
>  err:
> -	dev_err(&ddata->pdev->dev, "start update failed\n");
> +	dev_err(&ddata->dsi->dev, "start update failed\n");
>  	src->ops->dsi.bus_unlock(src);
>  	return IRQ_HANDLED;
>  }
> @@ -877,7 +876,7 @@ static void dsicm_te_timeout_work_callback(struct work_struct *work)
>  					te_timeout_work.work);
>  	struct omap_dss_device *src = ddata->src;
>  
> -	dev_err(&ddata->pdev->dev, "TE not received for 250ms!\n");
> +	dev_err(&ddata->dsi->dev, "TE not received for 250ms!\n");
>  
>  	atomic_set(&ddata->do_update, 0);
>  	src->ops->dsi.bus_unlock(src);
> @@ -890,7 +889,7 @@ static int dsicm_update(struct omap_dss_device *dssdev,
>  	struct omap_dss_device *src = ddata->src;
>  	int r;
>  
> -	dev_dbg(&ddata->pdev->dev, "update %d, %d, %d x %d\n", x, y, w, h);
> +	dev_dbg(&ddata->dsi->dev, "update %d, %d, %d x %d\n", x, y, w, h);
>  
>  	mutex_lock(&ddata->lock);
>  	src->ops->dsi.bus_lock(src);
> @@ -935,14 +934,14 @@ static int dsicm_sync(struct omap_dss_device *dssdev)
>  	struct panel_drv_data *ddata = to_panel_data(dssdev);
>  	struct omap_dss_device *src = ddata->src;
>  
> -	dev_dbg(&ddata->pdev->dev, "sync\n");
> +	dev_dbg(&ddata->dsi->dev, "sync\n");
>  
>  	mutex_lock(&ddata->lock);
>  	src->ops->dsi.bus_lock(src);
>  	src->ops->dsi.bus_unlock(src);
>  	mutex_unlock(&ddata->lock);
>  
> -	dev_dbg(&ddata->pdev->dev, "sync done\n");
> +	dev_dbg(&ddata->dsi->dev, "sync done\n");
>  
>  	return 0;
>  }
> @@ -1019,7 +1018,7 @@ static int dsicm_set_max_rx_packet_size(struct omap_dss_device *dssdev,
>  					u16 size)
>  {
>  	struct panel_drv_data *ddata = to_panel_data(dssdev);
> -	struct omap_dss_device *src = ddata->src;
> +	struct mipi_dsi_device *dsi = ddata->dsi;
>  
>  	const u8 buf[] = {
>  		size & 0xff,
> @@ -1033,7 +1032,7 @@ static int dsicm_set_max_rx_packet_size(struct omap_dss_device *dssdev,
>  		.tx_len = 2,
>  	};
>  
> -	return src->ops->dsi.transfer(src, &msg);
> +	return dsi->host->ops->transfer(dsi->host, &msg);
>  }
>  
>  static int dsicm_memory_read(struct omap_dss_device *dssdev,
> @@ -1041,6 +1040,7 @@ static int dsicm_memory_read(struct omap_dss_device *dssdev,
>  		u16 x, u16 y, u16 w, u16 h)
>  {
>  	struct panel_drv_data *ddata = to_panel_data(dssdev);
> +	struct mipi_dsi_device *dsi = ddata->dsi;
>  	struct omap_dss_device *src = ddata->src;
>  	int r;
>  	int first = 1;
> @@ -1092,7 +1092,7 @@ static int dsicm_memory_read(struct omap_dss_device *dssdev,
>  		};
>  		first = 0;
>  
> -		r = src->ops->dsi.transfer(src, &msg);
> +		r = dsi->host->ops->transfer(dsi->host, &msg);
>  		if (r < 0) {
>  			dev_err(dssdev->dev, "read error\n");
>  			goto err3;
> @@ -1101,12 +1101,12 @@ static int dsicm_memory_read(struct omap_dss_device *dssdev,
>  		buf_used += r;
>  
>  		if (r < plen) {
> -			dev_err(&ddata->pdev->dev, "short read\n");
> +			dev_err(&ddata->dsi->dev, "short read\n");
>  			break;
>  		}
>  
>  		if (signal_pending(current)) {
> -			dev_err(&ddata->pdev->dev, "signal pending, "
> +			dev_err(&ddata->dsi->dev, "signal pending, "
>  					"aborting memory read\n");
>  			r = -ERESTARTSYS;
>  			goto err3;
> @@ -1200,28 +1200,28 @@ static const struct omap_dss_driver dsicm_dss_driver = {
>  	.memory_read	= dsicm_memory_read,
>  };
>  
> -static int dsicm_probe_of(struct platform_device *pdev)
> +static int dsicm_probe_of(struct mipi_dsi_device *dsi)
>  {
> -	struct device_node *node = pdev->dev.of_node;
> +	struct device_node *node = dsi->dev.of_node;
>  	struct backlight_device *backlight;
> -	struct panel_drv_data *ddata = platform_get_drvdata(pdev);
> +	struct panel_drv_data *ddata = mipi_dsi_get_drvdata(dsi);
>  	struct display_timing timing;
>  	int err;
>  
>  	ddata->channel = TCH;
>  
> -	ddata->reset_gpio = devm_gpiod_get(&pdev->dev, "reset", GPIOD_OUT_LOW);
> +	ddata->reset_gpio = devm_gpiod_get(&dsi->dev, "reset", GPIOD_OUT_LOW);
>  	if (IS_ERR(ddata->reset_gpio)) {
>  		err = PTR_ERR(ddata->reset_gpio);
> -		dev_err(&pdev->dev, "reset gpio request failed: %d", err);
> +		dev_err(&dsi->dev, "reset gpio request failed: %d", err);
>  		return err;
>  	}
>  
> -	ddata->ext_te_gpio = devm_gpiod_get_optional(&pdev->dev, "te",
> +	ddata->ext_te_gpio = devm_gpiod_get_optional(&dsi->dev, "te",
>  						     GPIOD_IN);
>  	if (IS_ERR(ddata->ext_te_gpio)) {
>  		err = PTR_ERR(ddata->ext_te_gpio);
> -		dev_err(&pdev->dev, "TE gpio request failed: %d", err);
> +		dev_err(&dsi->dev, "TE gpio request failed: %d", err);
>  		return err;
>  	}
>  
> @@ -1232,7 +1232,7 @@ static int dsicm_probe_of(struct platform_device *pdev)
>  			ddata->vm.pixelclock =
>  				ddata->vm.hactive * ddata->vm.vactive * 60;
>  	} else {
> -		dev_warn(&pdev->dev,
> +		dev_warn(&dsi->dev,
>  			 "failed to get video timing, using defaults\n");
>  	}
>  
> @@ -1242,7 +1242,7 @@ static int dsicm_probe_of(struct platform_device *pdev)
>  	ddata->height_mm = 0;
>  	of_property_read_u32(node, "height-mm", &ddata->height_mm);
>  
> -	ddata->vpnl = devm_regulator_get_optional(&pdev->dev, "vpnl");
> +	ddata->vpnl = devm_regulator_get_optional(&dsi->dev, "vpnl");
>  	if (IS_ERR(ddata->vpnl)) {
>  		err = PTR_ERR(ddata->vpnl);
>  		if (err == -EPROBE_DEFER)
> @@ -1250,7 +1250,7 @@ static int dsicm_probe_of(struct platform_device *pdev)
>  		ddata->vpnl = NULL;
>  	}
>  
> -	ddata->vddi = devm_regulator_get_optional(&pdev->dev, "vddi");
> +	ddata->vddi = devm_regulator_get_optional(&dsi->dev, "vddi");
>  	if (IS_ERR(ddata->vddi)) {
>  		err = PTR_ERR(ddata->vddi);
>  		if (err == -EPROBE_DEFER)
> @@ -1258,7 +1258,7 @@ static int dsicm_probe_of(struct platform_device *pdev)
>  		ddata->vddi = NULL;
>  	}
>  
> -	backlight = devm_of_find_backlight(&pdev->dev);
> +	backlight = devm_of_find_backlight(&dsi->dev);
>  	if (IS_ERR(backlight))
>  		return PTR_ERR(backlight);
>  
> @@ -1273,11 +1273,11 @@ static int dsicm_probe_of(struct platform_device *pdev)
>  	return 0;
>  }
>  
> -static int dsicm_probe(struct platform_device *pdev)
> +static int dsicm_probe(struct mipi_dsi_device *dsi)
>  {
>  	struct panel_drv_data *ddata;
>  	struct backlight_device *bldev = NULL;
> -	struct device *dev = &pdev->dev;
> +	struct device *dev = &dsi->dev;
>  	struct omap_dss_device *dssdev;
>  	int r;
>  
> @@ -1287,14 +1287,14 @@ static int dsicm_probe(struct platform_device *pdev)
>  	if (!ddata)
>  		return -ENOMEM;
>  
> -	platform_set_drvdata(pdev, ddata);
> -	ddata->pdev = pdev;
> +	mipi_dsi_set_drvdata(dsi, ddata);
> +	ddata->dsi = dsi;
>  
>  	ddata->vm.hactive = 864;
>  	ddata->vm.vactive = 480;
>  	ddata->vm.pixelclock = 864 * 480 * 60;
>  
> -	r = dsicm_probe_of(pdev);
> +	r = dsicm_probe_of(dsi);
>  	if (r)
>  		return r;
>  
> @@ -1376,12 +1376,12 @@ static int dsicm_probe(struct platform_device *pdev)
>  	return r;
>  }
>  
> -static int __exit dsicm_remove(struct platform_device *pdev)
> +static int __exit dsicm_remove(struct mipi_dsi_device *dsi)
>  {
> -	struct panel_drv_data *ddata = platform_get_drvdata(pdev);
> +	struct panel_drv_data *ddata = mipi_dsi_get_drvdata(dsi);
>  	struct omap_dss_device *dssdev = &ddata->dssdev;
>  
> -	dev_dbg(&pdev->dev, "remove\n");
> +	dev_dbg(&dsi->dev, "remove\n");
>  
>  	omapdss_device_unregister(dssdev);
>  
> @@ -1389,7 +1389,7 @@ static int __exit dsicm_remove(struct platform_device *pdev)
>  		dsicm_disable(dssdev);
>  	omapdss_device_disconnect(ddata->src, dssdev);
>  
> -	sysfs_remove_group(&pdev->dev.kobj, &dsicm_attr_group);
> +	sysfs_remove_group(&dsi->dev.kobj, &dsicm_attr_group);
>  
>  	if (ddata->extbldev)
>  		put_device(&ddata->extbldev->dev);
> @@ -1410,7 +1410,7 @@ static const struct of_device_id dsicm_of_match[] = {
>  
>  MODULE_DEVICE_TABLE(of, dsicm_of_match);
>  
> -static struct platform_driver dsicm_driver = {
> +static struct mipi_dsi_driver dsicm_driver = {
>  	.probe = dsicm_probe,
>  	.remove = __exit_p(dsicm_remove),
>  	.driver = {
> @@ -1419,8 +1419,7 @@ static struct platform_driver dsicm_driver = {
>  		.suppress_bind_attrs = true,
>  	},
>  };
> -
> -module_platform_driver(dsicm_driver);
> +module_mipi_dsi_driver(dsicm_driver);
>  
>  MODULE_AUTHOR("Tomi Valkeinen <tomi.valkeinen@ti.com>");
>  MODULE_DESCRIPTION("Generic DSI Command Mode Panel Driver");
> diff --git a/drivers/gpu/drm/omapdrm/dss/dsi.c b/drivers/gpu/drm/omapdrm/dss/dsi.c
> index 6fa7833e32ad..d1187a8af37f 100644
> --- a/drivers/gpu/drm/omapdrm/dss/dsi.c
> +++ b/drivers/gpu/drm/omapdrm/dss/dsi.c
> @@ -334,6 +334,8 @@ struct dsi_data {
>  	struct regmap *syscon;
>  	struct dss_device *dss;
>  
> +	struct mipi_dsi_host host;
> +
>  	struct dispc_clock_info user_dispc_cinfo;
>  	struct dss_pll_clock_info user_dsi_cinfo;
>  
> @@ -432,6 +434,11 @@ static inline struct dsi_data *to_dsi_data(struct omap_dss_device *dssdev)
>  	return dev_get_drvdata(dssdev->dev);
>  }
>  
> +static inline struct dsi_data *host_to_omap(struct mipi_dsi_host *host)
> +{
> +	return container_of(host, struct dsi_data, host);
> +}
> +
>  static inline void dsi_write_reg(struct dsi_data *dsi,
>  				 const struct dsi_reg idx, u32 val)
>  {
> @@ -4711,9 +4718,12 @@ static void dsi_release_vc(struct omap_dss_device *dssdev, int channel)
>  	}
>  }
>  
> -static ssize_t omap_dsi_transfer(struct omap_dss_device *dssdev,
> -				 const struct mipi_dsi_msg *msg)
> +static ssize_t omap_dsi_host_transfer(struct mipi_dsi_host *host,
> +				      const struct mipi_dsi_msg *msg)
>  {
> +	struct dsi_data *dsi = host_to_omap(host);
> +	struct omap_dss_device *dssdev = &dsi->output;
> +
>  	switch (msg->type) {
>  	case MIPI_DSI_GENERIC_SHORT_WRITE_0_PARAM:
>  	case MIPI_DSI_GENERIC_SHORT_WRITE_1_PARAM:
> @@ -4787,11 +4797,30 @@ static const struct omap_dss_device_ops dsi_ops = {
>  
>  		.request_vc = dsi_request_vc,
>  		.release_vc = dsi_release_vc,
> -
> -		.transfer = omap_dsi_transfer,
>  	},
>  };
>  
> +static int omap_dsi_host_attach(struct mipi_dsi_host *host,
> +			 struct mipi_dsi_device *dsi)
> +{
> +	/* TODO: convert driver from custom binding method to this one */
> +	return 0;
> +}
> +
> +static int omap_dsi_host_detach(struct mipi_dsi_host *host,
> +			 struct mipi_dsi_device *dsi)
> +{
> +	/* TODO: convert driver from custom binding method to this one */
> +	return 0;
> +}
> +
> +static const struct mipi_dsi_host_ops omap_dsi_host_ops = {
> +	.attach = omap_dsi_host_attach,
> +	.detach = omap_dsi_host_detach,
> +	.transfer = omap_dsi_host_transfer,
> +};
> +
> +

A single blank line is enough.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

>  /* -----------------------------------------------------------------------------
>   * PLL
>   */
> @@ -5260,15 +5289,18 @@ static int dsi_probe(struct platform_device *pdev)
>  		dsi->num_lanes_supported = 3;
>  	}
>  
> -	r = of_platform_populate(dev->of_node, NULL, NULL, dev);
> -	if (r) {
> -		DSSERR("Failed to populate DSI child devices: %d\n", r);
> +	dsi->host.ops = &omap_dsi_host_ops;
> +	dsi->host.dev = &pdev->dev;
> +
> +	r = mipi_dsi_host_register(&dsi->host);
> +	if (r < 0) {
> +		dev_err(&pdev->dev, "failed to register DSI host: %d\n", r);
>  		goto err_pm_disable;
>  	}
>  
>  	r = dsi_init_output(dsi);
>  	if (r)
> -		goto err_of_depopulate;
> +		goto err_dsi_host_unregister;
>  
>  	r = dsi_probe_of(dsi);
>  	if (r) {
> @@ -5284,8 +5316,8 @@ static int dsi_probe(struct platform_device *pdev)
>  
>  err_uninit_output:
>  	dsi_uninit_output(dsi);
> -err_of_depopulate:
> -	of_platform_depopulate(dev);
> +err_dsi_host_unregister:
> +	mipi_dsi_host_unregister(&dsi->host);
>  err_pm_disable:
>  	pm_runtime_disable(dev);
>  	return r;
> @@ -5299,7 +5331,7 @@ static int dsi_remove(struct platform_device *pdev)
>  
>  	dsi_uninit_output(dsi);
>  
> -	of_platform_depopulate(&pdev->dev);
> +	mipi_dsi_host_unregister(&dsi->host);
>  
>  	pm_runtime_disable(&pdev->dev);
>  
> diff --git a/drivers/gpu/drm/omapdrm/dss/omapdss.h b/drivers/gpu/drm/omapdrm/dss/omapdss.h
> index 40e1ce9e256e..8cd2c800922e 100644
> --- a/drivers/gpu/drm/omapdrm/dss/omapdss.h
> +++ b/drivers/gpu/drm/omapdrm/dss/omapdss.h
> @@ -304,10 +304,6 @@ struct omapdss_dsi_ops {
>  
>  	int (*request_vc)(struct omap_dss_device *dssdev, int channel);
>  	void (*release_vc)(struct omap_dss_device *dssdev, int channel);
> -
> -	/* data transfer */
> -	ssize_t (*transfer)(struct omap_dss_device *dssdev,
> -			    const struct mipi_dsi_msg *msg);
>  };
>  
>  struct omap_dss_device_ops {

-- 
Regards,

Laurent Pinchart
