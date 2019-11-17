Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 278AFFFB77
	for <lists+linux-omap@lfdr.de>; Sun, 17 Nov 2019 20:23:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726082AbfKQTXY (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sun, 17 Nov 2019 14:23:24 -0500
Received: from mo4-p01-ob.smtp.rzone.de ([81.169.146.166]:33083 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726070AbfKQTXY (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sun, 17 Nov 2019 14:23:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1574018590;
        s=strato-dkim-0002; d=goldelico.com;
        h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=rgiZXi+ar+VnJzZLC/PH3gwZjuNS22z31UtkdK9GzIc=;
        b=BCmI7Hu8BmVODJxvYw8vKluPowZ2+/hARKUW3Jzez9Ep8PrdA3TCICgHrkdDdeVAzU
        rOjk2U+51yx5/2eIicqep+vGMp6KCG8ItnXmDgB+mMqpF7AV1cZAyVV36AZXFagyKUy7
        O0awa+nx74ZoiFxabq9ITF4v2jqr0yYcucRSxr94Mz86pdXpwB41y+eu6Iq+A6wFcjc6
        7DNMYFlF9nFPusuP5Rz8r735hN2wh5Lm9WEQRcG4vy/ld0a4NHXBVRpqpVP62FSRx3jb
        u5P35fjs9Xv2kQZBmKOVSoaoY0xKc/OdZCfHTIuYyYeS8bVXcRw841N4ETTcqUkvlJiN
        U4iQ==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj5Qpw97WFDlSaXA4JLWE="
X-RZG-CLASS-ID: mo00
Received: from imac.fritz.box
        by smtp.strato.de (RZmta 44.29.0 DYNA|AUTH)
        with ESMTPSA id L09db3vAHJN5P6e
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (curve secp521r1 with 521 ECDH bits, eq. 15360 bits RSA))
        (Client did not present a certificate);
        Sun, 17 Nov 2019 20:23:05 +0100 (CET)
Content-Type: text/plain; charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Subject: Re: [RFCv1 32/42] drm/omap: dsi: convert to drm_panel
From:   "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <20191117024028.2233-33-sebastian.reichel@collabora.com>
Date:   Sun, 17 Nov 2019 20:23:05 +0100
Cc:     Sebastian Reichel <sre@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Tony Lindgren <tony@atomide.com>,
        Merlijn Wajer <merlijn@wizzup.org>, linux-omap@vger.kernel.org,
        dri-devel@lists.freedesktop.org, kernel@collabora.com
Content-Transfer-Encoding: quoted-printable
Message-Id: <D109D867-1C8E-44F6-9C91-AF55BCB3FDD3@goldelico.com>
References: <20191117024028.2233-1-sebastian.reichel@collabora.com> <20191117024028.2233-33-sebastian.reichel@collabora.com>
To:     Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: Apple Mail (2.3124)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi,

> Am 17.11.2019 um 03:40 schrieb Sebastian Reichel =
<sebastian.reichel@collabora.com>:
>=20
> This converts the DSI module to expect common drm_panel display
> drivers instead of dssdev based ones.
>=20
> This commit is WIP. We somehow need to know the panels resolution
> in omap_dsi_host_attach(), so that we can properly configure the
> DSI bus clock before enabling the bus. The control bus must be
> enabled at this point, so that the panel can use it.
>=20
> Other drivers run drm_panel_attach() in their dsi host attach,
> which makes it possible to call drm_panel_get_modes() afterwards
> and the get the correct mode from the connector.
>=20
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> ---
> .../gpu/drm/omapdrm/displays/panel-dsi-cm.c   | 217 +++++++-----------
> drivers/gpu/drm/omapdrm/dss/dsi.c             | 141 ++++++++++--
> .../gpu/drm/omapdrm/dss/omapdss-boot-init.c   |   1 -
> drivers/gpu/drm/omapdrm/dss/omapdss.h         |  22 +-
> drivers/gpu/drm/omapdrm/omap_crtc.c           |  17 +-
> 5 files changed, 205 insertions(+), 193 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c =
b/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c
> index 18020ac43a83..84b0e79c025e 100644
> --- a/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c
> +++ b/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c
> @@ -6,8 +6,6 @@
>  * Author: Tomi Valkeinen <tomi.valkeinen@ti.com>
>  */
>=20
> -/* #define DEBUG */
> -
> #include <linux/backlight.h>
> #include <linux/delay.h>
> #include <linux/gpio/consumer.h>
> @@ -20,11 +18,14 @@
> #include <linux/regulator/consumer.h>
>=20
> #include <drm/drm_connector.h>
> +#include <drm/drm_mipi_dsi.h>
> +#include <drm/drm_panel.h>
> +#include <drm/drm_modes.h>
>=20
> +#include <video/display_timing.h>
> #include <video/mipi_display.h>
> #include <video/of_display_timing.h>
> -
> -#include "../dss/omapdss.h"
> +#include <video/videomode.h>
>=20
> #define DCS_READ_NUM_ERRORS	0x05
> #define DCS_GET_ID1		0xda
> @@ -35,11 +36,8 @@
>=20
> struct panel_drv_data {
> 	struct mipi_dsi_device *dsi;
> -
> -	struct omap_dss_device dssdev;
> -	struct omap_dss_device *src;
> -
> -	struct videomode vm;
> +	struct drm_panel panel;
> +	struct drm_display_mode mode;
>=20
> 	struct mutex lock;
>=20
> @@ -71,7 +69,11 @@ struct panel_drv_data {
> 	bool ulps_enabled;
> };
>=20
> -#define to_panel_data(p) container_of(p, struct panel_drv_data, =
dssdev)
> +
> +static inline struct panel_drv_data *panel_to_ddata(struct drm_panel =
*panel)
> +{
> +	return container_of(panel, struct panel_drv_data, panel);
> +}
>=20
> static int _dsicm_enable_te(struct panel_drv_data *ddata, bool =
enable);
>=20
> @@ -285,10 +287,15 @@ static void dsicm_hw_reset(struct panel_drv_data =
*ddata)
>=20
> static int dsicm_power_on(struct panel_drv_data *ddata)
> {
> -	struct omap_dss_device *src =3D ddata->src;
> 	u8 id1, id2, id3;
> 	int r;
>=20
> +	r =3D regulator_bulk_enable(DCS_REGULATOR_SUPPLY_NUM, =
ddata->supplies);
> +	if (r) {
> +		dev_err(&ddata->dsi->dev, "failed to enable supplies: =
%d\n", r);
> +		return r;
> +	}
> +
> 	dsicm_hw_reset(ddata);
>=20
> 	ddata->dsi->mode_flags |=3D MIPI_DSI_MODE_LPM;
> @@ -322,10 +329,6 @@ static int dsicm_power_on(struct panel_drv_data =
*ddata)
> 	if (r)
> 		goto err;
>=20
> -	r =3D src->ops->dsi.enable_video_output(src, =
ddata->dsi->channel);
> -	if (r)
> -		goto err;
> -
> 	ddata->enabled =3D 1;
>=20
> 	if (!ddata->intro_printed) {
> @@ -342,18 +345,17 @@ static int dsicm_power_on(struct panel_drv_data =
*ddata)
>=20
> 	dsicm_hw_reset(ddata);
>=20
> +	regulator_bulk_disable(DCS_REGULATOR_SUPPLY_NUM, =
ddata->supplies);
> +
> 	return r;
> }
>=20
> -static void dsicm_power_off(struct panel_drv_data *ddata)
> +static int dsicm_power_off(struct panel_drv_data *ddata)
> {
> -	struct omap_dss_device *src =3D ddata->src;
> 	int r;
>=20
> 	ddata->enabled =3D 0;
>=20
> -	src->ops->dsi.disable_video_output(src, ddata->dsi->channel);
> -
> 	r =3D mipi_dsi_dcs_set_display_off(ddata->dsi);
> 	if (!r)
> 		r =3D dsicm_sleep_in(ddata);
> @@ -363,52 +365,17 @@ static void dsicm_power_off(struct =
panel_drv_data *ddata)
> 				"error disabling panel, issuing HW =
reset\n");
> 		dsicm_hw_reset(ddata);
> 	}
> -}
>=20
> -static int dsicm_connect(struct omap_dss_device *src,
> -			 struct omap_dss_device *dst)
> -{
> -	struct panel_drv_data *ddata =3D to_panel_data(dst);
> -
> -	ddata->src =3D src;
> -	return 0;
> -}
> -
> -static void dsicm_disconnect(struct omap_dss_device *src,
> -			     struct omap_dss_device *dst)
> -{
> -	struct panel_drv_data *ddata =3D to_panel_data(dst);
> -
> -	ddata->src =3D NULL;
> -}
> -
> -static void dsicm_pre_enable(struct omap_dss_device *dssdev)
> -{
> -	struct panel_drv_data *ddata =3D to_panel_data(dssdev);
> -	struct omap_dss_device *src =3D ddata->src;
> -	int r;
> -	struct omap_dss_dsi_config dsi_config =3D {
> -		.vm =3D &ddata->vm,
> -		.hs_clk_min =3D 150000000,
> -		.hs_clk_max =3D 300000000,
> -		.lp_clk_min =3D 7000000,
> -		.lp_clk_max =3D 10000000,
> -	};
> -
> -	r =3D regulator_bulk_enable(DCS_REGULATOR_SUPPLY_NUM, =
ddata->supplies);
> -	if (r) {
> -		dev_err(&ddata->dsi->dev, "failed to enable supplies: =
%d\n", r);
> -	}
> +	r =3D regulator_bulk_disable(DCS_REGULATOR_SUPPLY_NUM, =
ddata->supplies);
> +	if (r)
> +		dev_err(&ddata->dsi->dev, "failed to disable supplies: =
%d\n", r);
>=20
> -	r =3D src->ops->dsi.set_config(src, &dsi_config);
> -	if (r) {
> -		dev_err(&ddata->dsi->dev, "failed to configure DSI\n");
> -	}
> +	return r;
> }
>=20
> -static void dsicm_enable(struct omap_dss_device *dssdev)
> +static int dsicm_prepare(struct drm_panel *panel)
> {
> -	struct panel_drv_data *ddata =3D to_panel_data(dssdev);
> +	struct panel_drv_data *ddata =3D panel_to_ddata(panel);
> 	int r;
>=20
> 	mutex_lock(&ddata->lock);
> @@ -421,33 +388,27 @@ static void dsicm_enable(struct omap_dss_device =
*dssdev)
>=20
> 	dsicm_bl_power(ddata, true);
>=20
> -	return;
> +	return 0;
> err:
> -	dev_dbg(&ddata->dsi->dev, "enable failed (%d)\n", r);
> +	dev_err(&ddata->dsi->dev, "enable failed (%d)\n", r);
> 	mutex_unlock(&ddata->lock);
> +	return r;
> }
>=20
> -static void dsicm_disable(struct omap_dss_device *dssdev)
> +static int dsicm_unprepare(struct drm_panel *panel)
> {
> -	struct panel_drv_data *ddata =3D to_panel_data(dssdev);
> +	struct panel_drv_data *ddata =3D panel_to_ddata(panel);
> +	int r;
>=20
> 	dsicm_bl_power(ddata, false);
>=20
> 	mutex_lock(&ddata->lock);
>=20
> -	dsicm_power_off(ddata);
> +	r =3D dsicm_power_off(ddata);
>=20
> 	mutex_unlock(&ddata->lock);
> -}
> -
> -static void dsicm_post_disable(struct omap_dss_device *dssdev)
> -{
> -	struct panel_drv_data *ddata =3D to_panel_data(dssdev);
> -	int r;
>=20
> -	r =3D regulator_bulk_disable(DCS_REGULATOR_SUPPLY_NUM, =
ddata->supplies);
> -	if (r)
> -		dev_err(&ddata->dsi->dev, "failed to disable supplies: =
%d\n", r);
> +	return r;
> }
>=20
> static int _dsicm_enable_te(struct panel_drv_data *ddata, bool enable)
> @@ -466,50 +427,35 @@ static int _dsicm_enable_te(struct =
panel_drv_data *ddata, bool enable)
> 	return r;
> }
>=20
> -static int dsicm_get_modes(struct omap_dss_device *dssdev,
> -			   struct drm_connector *connector)
> +static int dsicm_get_modes(struct drm_panel *panel)
> {
> -	struct panel_drv_data *ddata =3D to_panel_data(dssdev);
> -
> -	connector->display_info.width_mm =3D ddata->width_mm;
> -	connector->display_info.height_mm =3D ddata->height_mm;
> -
> -	return omapdss_display_get_modes(connector, &ddata->vm);
> -}
> -
> -static int dsicm_check_timings(struct omap_dss_device *dssdev,
> -			       struct drm_display_mode *mode)
> -{
> -	struct panel_drv_data *ddata =3D to_panel_data(dssdev);
> -	int ret =3D 0;
> +	struct panel_drv_data *ddata =3D panel_to_ddata(panel);
> +	struct drm_connector *connector =3D panel->connector;
> +	struct drm_display_mode *mode;
> +
> +	mode =3D drm_mode_duplicate(panel->drm, &ddata->mode);
> +	if (!mode) {
> +		dev_err(&ddata->dsi->dev, "failed to add mode =
%ux%ux@%u\n",
> +			ddata->mode.hdisplay, ddata->mode.vdisplay,
> +			ddata->mode.vrefresh);
> +		return -ENOMEM;
> +	}
>=20
> -	if (mode->hdisplay !=3D ddata->vm.hactive)
> -		ret =3D -EINVAL;
> +	drm_mode_set_name(mode);
>=20
> -	if (mode->vdisplay !=3D ddata->vm.vactive)
> -		ret =3D -EINVAL;
> +	mode->type =3D DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED;
> +	drm_mode_probed_add(connector, mode);
>=20
> -	if (ret) {
> -		dev_warn(dssdev->dev, "wrong resolution: %d x %d",
> -			 mode->hdisplay, mode->vdisplay);
> -		dev_warn(dssdev->dev, "panel resolution: %d x %d",
> -			 ddata->vm.hactive, ddata->vm.vactive);
> -	}
> +	connector->display_info.width_mm =3D ddata->width_mm;
> +	connector->display_info.height_mm =3D ddata->height_mm;
>=20
> -	return ret;
> +	return 1;
> }
>=20
> -static const struct omap_dss_device_ops dsicm_ops =3D {
> -	.connect	=3D dsicm_connect,
> -	.disconnect	=3D dsicm_disconnect,
> -
> -	.pre_enable	=3D dsicm_pre_enable,
> -	.enable		=3D dsicm_enable,
> -	.disable	=3D dsicm_disable,
> -	.post_disable	=3D dsicm_post_disable,
> -
> -	.get_modes	=3D dsicm_get_modes,
> -	.check_timings	=3D dsicm_check_timings,
> +static const struct drm_panel_funcs dsicm_panel_funcs =3D {
> +	.unprepare =3D dsicm_unprepare,
> +	.prepare =3D dsicm_prepare,
> +	.get_modes =3D dsicm_get_modes,
> };
>=20
> static int dsicm_probe_of(struct mipi_dsi_device *dsi)
> @@ -518,8 +464,12 @@ static int dsicm_probe_of(struct mipi_dsi_device =
*dsi)
> 	struct device_node *backlight;
> 	struct panel_drv_data *ddata =3D mipi_dsi_get_drvdata(dsi);
> 	struct display_timing timing;
> +	struct videomode vm;
> 	int err;
>=20
> +	vm.hactive =3D 864;
> +	vm.vactive =3D 480;
> +
> 	ddata->reset_gpio =3D devm_gpiod_get(&dsi->dev, "reset", =
GPIOD_OUT_LOW);
> 	if (IS_ERR(ddata->reset_gpio)) {
> 		err =3D PTR_ERR(ddata->reset_gpio);
> @@ -529,15 +479,16 @@ static int dsicm_probe_of(struct mipi_dsi_device =
*dsi)
>=20
> 	err =3D of_get_display_timing(node, "panel-timing", &timing);
> 	if (!err) {
> -		videomode_from_timing(&timing, &ddata->vm);
> -		if (!ddata->vm.pixelclock)
> -			ddata->vm.pixelclock =3D
> -				ddata->vm.hactive * ddata->vm.vactive * =
60;
> +		videomode_from_timing(&timing, &vm);
> 	} else {
> 		dev_warn(&dsi->dev,
> 			 "failed to get video timing, using =
defaults\n");
> 	}
>=20
> +	if (!vm.pixelclock)
> +		vm.pixelclock =3D vm.hactive * vm.vactive * 60;
> +	drm_display_mode_from_videomode(&vm, &ddata->mode);
> +
> 	ddata->width_mm =3D 0;
> 	of_property_read_u32(node, "width-mm", &ddata->width_mm);
>=20
> @@ -573,7 +524,6 @@ static int dsicm_probe(struct mipi_dsi_device =
*dsi)
> 	struct panel_drv_data *ddata;
> 	struct backlight_device *bldev =3D NULL;
> 	struct device *dev =3D &dsi->dev;
> -	struct omap_dss_device *dssdev;
> 	int r;
>=20
> 	dev_dbg(dev, "probe\n");
> @@ -585,33 +535,17 @@ static int dsicm_probe(struct mipi_dsi_device =
*dsi)
> 	mipi_dsi_set_drvdata(dsi, ddata);
> 	ddata->dsi =3D dsi;
>=20
> -	ddata->vm.hactive =3D 864;
> -	ddata->vm.vactive =3D 480;
> -	ddata->vm.pixelclock =3D 864 * 480 * 60;
> -
> 	r =3D dsicm_probe_of(dsi);
> 	if (r)
> 		return r;
>=20
> -	dssdev =3D &ddata->dssdev;
> -	dssdev->dev =3D dev;
> -	dssdev->ops =3D &dsicm_ops;
> -	dssdev->type =3D OMAP_DISPLAY_TYPE_DSI;
> -	dssdev->display =3D true;
> -	dssdev->owner =3D THIS_MODULE;
> -	dssdev->of_ports =3D BIT(0);
> -	dssdev->ops_flags =3D OMAP_DSS_DEVICE_OP_MODES;
> -
> -	dssdev->caps =3D OMAP_DSS_DISPLAY_CAP_MANUAL_UPDATE |
> -		OMAP_DSS_DISPLAY_CAP_TEAR_ELIM;
> -
> -	omapdss_display_init(dssdev);
> -	omapdss_device_register(dssdev);
> -
> 	mutex_init(&ddata->lock);
>=20
> 	dsicm_hw_reset(ddata);
>=20
> +	drm_panel_init(&ddata->panel, dev, &dsicm_panel_funcs,
> +		       DRM_MODE_CONNECTOR_DSI);
> +

This leads to

drivers/gpu/drm/panel/panel-dsi-cm.c: In function 'dsicm_probe':
drivers/gpu/drm/panel/panel-dsi-cm.c:552:2: error: too many arguments to =
function 'drm_panel_init'
  drm_panel_init(&ddata->panel, dev, &dsicm_panel_funcs,
  ^
In file included from drivers/gpu/drm/panel/panel-dsi-cm.c:22:0:
./include/drm/drm_panel.h:150:6: note: declared here
 void drm_panel_init(struct drm_panel *panel);
      ^

(when applied to v5.4-rc7)

> 	if (ddata->use_dsi_backlight) {
> 		struct backlight_properties props =3D { 0 };
> 		props.max_brightness =3D 255;
> @@ -643,6 +577,10 @@ static int dsicm_probe(struct mipi_dsi_device =
*dsi)
> 	if (ddata->ulps_enabled)
> 		dsi->mode_flags |=3D MIPI_DSI_MODE_ULPS_IDLE;
>=20
> +	r =3D drm_panel_add(&ddata->panel);
> +	if (r < 0)
> +		goto err_panel_add;
> +
> 	r =3D mipi_dsi_attach(dsi);
> 	if (r < 0)
> 		goto err_dsi_attach;
> @@ -650,6 +588,8 @@ static int dsicm_probe(struct mipi_dsi_device =
*dsi)
> 	return 0;
>=20
> err_dsi_attach:
> +	drm_panel_remove(&ddata->panel);
> +err_panel_add:
> 	sysfs_remove_group(&dsi->dev.kobj, &dsicm_attr_group);
> err_bl:
> 	if (ddata->extbldev)
> @@ -661,15 +601,12 @@ static int dsicm_probe(struct mipi_dsi_device =
*dsi)
> static int __exit dsicm_remove(struct mipi_dsi_device *dsi)
> {
> 	struct panel_drv_data *ddata =3D mipi_dsi_get_drvdata(dsi);
> -	struct omap_dss_device *dssdev =3D &ddata->dssdev;
>=20
> 	dev_dbg(&dsi->dev, "remove\n");
>=20
> 	mipi_dsi_detach(dsi);
>=20
> -	omapdss_device_unregister(dssdev);
> -
> -	omapdss_device_disconnect(ddata->src, dssdev);
> +	drm_panel_remove(&ddata->panel);
>=20
> 	sysfs_remove_group(&dsi->dev.kobj, &dsicm_attr_group);
>=20
> @@ -683,7 +620,7 @@ static int __exit dsicm_remove(struct =
mipi_dsi_device *dsi)
> }
>=20
> static const struct of_device_id dsicm_of_match[] =3D {
> -	{ .compatible =3D "omapdss,panel-dsi-cm", },
> +	{ .compatible =3D "panel-dsi-cm", },
> 	{},
> };
>=20
> diff --git a/drivers/gpu/drm/omapdrm/dss/dsi.c =
b/drivers/gpu/drm/omapdrm/dss/dsi.c
> index 66ad7dbc66a2..754815068927 100644
> --- a/drivers/gpu/drm/omapdrm/dss/dsi.c
> +++ b/drivers/gpu/drm/omapdrm/dss/dsi.c
> @@ -37,6 +37,7 @@
>=20
> #include <video/mipi_display.h>
> #include <drm/drm_mipi_dsi.h>
> +#include <drm/drm_panel.h>
>=20
> #include "omapdss.h"
> #include "dss.h"
> @@ -220,6 +221,8 @@ static int dsi_vc_send_null(struct dsi_data *dsi, =
int channel);
> static ssize_t _omap_dsi_host_transfer(struct dsi_data *dsi,
> 				       const struct mipi_dsi_msg *msg);
>=20
> +static void dsi_display_disable(struct omap_dss_device *dssdev);
> +
> /* DSI PLL HSDIV indices */
> #define HSDIV_DISPC	0
> #define HSDIV_DSI	1
> @@ -386,6 +389,7 @@ struct dsi_data {
> 	bool te_enabled;
> 	bool ulps_enabled;
> 	bool ulps_auto_idle;
> +	bool video_enabled;
>=20
> 	struct delayed_work ulps_work;
>=20
> @@ -426,6 +430,8 @@ struct dsi_data {
>=20
> 	unsigned int scp_clk_refcount;
>=20
> +	struct omap_dss_dsi_config config;
> +
> 	struct dss_lcd_mgr_config mgr_config;
> 	struct videomode vm;
> 	enum mipi_dsi_pixel_format pix_fmt;
> @@ -3629,7 +3635,7 @@ static int dsi_configure_pins(struct =
omap_dss_device *dssdev,
> 	return 0;
> }
>=20
> -static int dsi_enable_video_output(struct omap_dss_device *dssdev, =
int channel)
> +static void dsi_enable_video_output(struct omap_dss_device *dssdev, =
int channel)
> {
> 	struct dsi_data *dsi =3D to_dsi_data(dssdev);
> 	int bpp =3D mipi_dsi_pixel_format_to_bpp(dsi->pix_fmt);
> @@ -3638,8 +3644,10 @@ static int dsi_enable_video_output(struct =
omap_dss_device *dssdev, int channel)
> 	int r;
>=20
> 	r =3D dsi_display_init_dispc(dsi);
> -	if (r)
> -		return r;
> +	if (r) {
> +		dev_err(dsi->dev, "failed to init dispc!\n");
> +		return;
> +	}
>=20
> 	if (dsi->mode =3D=3D OMAP_DSS_DSI_VIDEO_MODE) {
> 		switch (dsi->pix_fmt) {
> @@ -3679,7 +3687,7 @@ static int dsi_enable_video_output(struct =
omap_dss_device *dssdev, int channel)
> 	if (r)
> 		goto err_mgr_enable;
>=20
> -	return 0;
> +	return;
>=20
> err_mgr_enable:
> 	if (dsi->mode =3D=3D OMAP_DSS_DSI_VIDEO_MODE) {
> @@ -3688,7 +3696,8 @@ static int dsi_enable_video_output(struct =
omap_dss_device *dssdev, int channel)
> 	}
> err_pix_fmt:
> 	dsi_display_uninit_dispc(dsi);
> -	return r;
> +	dev_err(dsi->dev, "failed to enable DSI encoder!\n");
> +	return;
> }
>=20
> static void dsi_disable_video_output(struct omap_dss_device *dssdev, =
int channel)
> @@ -3711,6 +3720,25 @@ static void dsi_disable_video_output(struct =
omap_dss_device *dssdev, int channel
> 	dsi_display_uninit_dispc(dsi);
> }
>=20
> +static void dsi_disable_video_outputs(struct omap_dss_device *dssdev)
> +{
> +	struct dsi_data *dsi =3D to_dsi_data(dssdev);
> +	int i;
> +
> +	dsi_bus_lock(dsi);
> +	dsi->video_enabled =3D false;
> +
> +	for (i =3D 0; i < 3; i++) {
> +		if (!dsi->vc[i].dest)
> +			continue;
> +		dsi_disable_video_output(dssdev, i);
> +	}
> +
> +	dsi_display_disable(dssdev);
> +
> +	dsi_bus_unlock(dsi);
> +}
> +
> static void dsi_update_screen_dispc(struct dsi_data *dsi)
> {
> 	unsigned int bytespp;
> @@ -3904,6 +3932,11 @@ static int dsi_update_channel(struct =
omap_dss_device *dssdev, int channel)
>=20
> 	dsi_bus_lock(dsi);
>=20
> +	if (!dsi->video_enabled) {
> +		r =3D -EIO;
> +		goto err;
> +	}
> +
> 	if (!dsi->vc[channel].dest) {
> 		r =3D -ENODEV;
> 		goto err;
> @@ -3949,7 +3982,7 @@ static int dsi_update_all(struct omap_dss_device =
*dssdev)
>=20
> 	for (i =3D 0; i < 4; i++) {
> 		r =3D dsi_update_channel(dssdev, i);
> -		if (r !=3D -ENODEV)
> +		if (r && r !=3D -ENODEV)
> 			return r;
> 	}
>=20
> @@ -4172,8 +4205,30 @@ static void dsi_display_enable(struct =
omap_dss_device *dssdev)
> {
> 	struct dsi_data *dsi =3D to_dsi_data(dssdev);
> 	DSSDBG("dsi_display_enable\n");
> -	dsi_bus_lock(dsi);
> +	WARN_ON(!dsi_bus_is_locked(dsi));
> +
> 	dsi_display_ulps_enable(dsi);
> +}
> +
> +static void dsi_enable_video_outputs(struct omap_dss_device *dssdev)
> +{
> +	struct dsi_data *dsi =3D to_dsi_data(dssdev);
> +	int i;
> +
> +	dsi_bus_lock(dsi);
> +
> +	dsi_display_enable(dssdev);
> +
> +	for (i =3D 0; i < 3; i++) {
> +		if (!dsi->vc[i].dest)
> +			continue;
> +		dsi_enable_video_output(dssdev, i);
> +	}
> +
> +	dsi->video_enabled =3D true;
> +
> +	dsi_set_ulps_auto(dsi, true);
> +
> 	dsi_bus_unlock(dsi);
> }
>=20
> @@ -4199,10 +4254,10 @@ static void dsi_display_ulps_disable(struct =
dsi_data *dsi,
> static void dsi_display_disable(struct omap_dss_device *dssdev)
> {
> 	struct dsi_data *dsi =3D to_dsi_data(dssdev);
> +	WARN_ON(!dsi_bus_is_locked(dsi));
> 	DSSDBG("dsi_display_disable\n");
> -	dsi_bus_lock(dsi);
> +
> 	dsi_display_ulps_disable(dsi, true, false);
> -	dsi_bus_unlock(dsi);
> }
>=20
> static int dsi_enable_te(struct dsi_data *dsi, bool enable)
> @@ -4732,15 +4787,26 @@ static bool dsi_vm_calc(struct dsi_data *dsi,
> 			dsi_vm_calc_pll_cb, ctx);
> }
>=20
> +static bool dsi_is_video_mode(struct omap_dss_device *dssdev)
> +{
> +	struct dsi_data *dsi =3D to_dsi_data(dssdev);
> +
> +	return (dsi->mode =3D=3D OMAP_DSS_DSI_VIDEO_MODE);
> +}
> +
> static int dsi_set_config(struct omap_dss_device *dssdev,
> -		const struct omap_dss_dsi_config *config)
> +		const struct drm_display_mode *mode)
> {
> 	struct dsi_data *dsi =3D to_dsi_data(dssdev);
> 	struct dsi_clk_calc_ctx ctx;
> -	struct omap_dss_dsi_config cfg =3D *config;
> +	struct videomode vm;
> +	struct omap_dss_dsi_config cfg =3D dsi->config;
> 	bool ok;
> 	int r;
>=20
> +	drm_display_mode_to_videomode(mode, &vm);
> +	cfg.vm =3D &vm;
> +
> 	mutex_lock(&dsi->lock);
>=20
> 	cfg.mode =3D dsi->mode;
> @@ -4903,9 +4969,15 @@ static ssize_t omap_dsi_host_transfer(struct =
mipi_dsi_host *host,
> 	int r;
>=20
> 	dsi_bus_lock(dsi);
> -	dsi_set_ulps_auto(dsi, false);
> -	r =3D _omap_dsi_host_transfer(dsi, msg);
> -	dsi_set_ulps_auto(dsi, true);
> +
> +	if (dsi->video_enabled) {
> +		dsi_set_ulps_auto(dsi, false);
> +		r =3D _omap_dsi_host_transfer(dsi, msg);
> +		dsi_set_ulps_auto(dsi, true);
> +	} else {
> +		r =3D -EIO;
> +	}
> +
> 	dsi_bus_unlock(dsi);
>=20
> 	return r;
> @@ -4926,6 +4998,23 @@ static int dsi_get_clocks(struct dsi_data *dsi)
> 	return 0;
> }
>=20
> +static void dsi_set_timings(struct omap_dss_device *dssdev,
> +			    const struct drm_display_mode *mode)
> +{
> +	DSSDBG("dsi_set_timings\n");
> +	dsi_set_config(dssdev, mode);
> +}
> +
> +static int dsi_check_timings(struct omap_dss_device *dssdev,
> +			     struct drm_display_mode *mode)
> +{
> +	DSSDBG("dsi_check_timings\n");
> +
> +	/* TODO */
> +
> +	return 0;
> +}
> +
> static int dsi_connect(struct omap_dss_device *src,
> 		       struct omap_dss_device *dst)
> {
> @@ -4941,16 +5030,15 @@ static void dsi_disconnect(struct =
omap_dss_device *src,
> static const struct omap_dss_device_ops dsi_ops =3D {
> 	.connect =3D dsi_connect,
> 	.disconnect =3D dsi_disconnect,
> -	.enable =3D dsi_display_enable,
> -	.disable =3D dsi_display_disable,
> -
> -	.dsi =3D {
> -		.set_config =3D dsi_set_config,
> +	.enable =3D dsi_enable_video_outputs,
> +	.disable =3D dsi_disable_video_outputs,
>=20
> -		.enable_video_output =3D dsi_enable_video_output,
> -		.disable_video_output =3D dsi_disable_video_output,
> +	.check_timings =3D dsi_check_timings,
> +	.set_timings =3D dsi_set_timings,
>=20
> +	.dsi =3D {
> 		.update =3D dsi_update_all,
> +		.is_video_mode =3D dsi_is_video_mode,
> 	},
> };
>=20
> @@ -5038,6 +5126,7 @@ int omap_dsi_host_attach(struct mipi_dsi_host =
*host,
> {
> 	struct dsi_data *dsi =3D host_to_omap(host);
> 	unsigned int channel =3D client->channel;
> +	struct drm_panel *panel;
> 	int r;
>=20
> 	if (channel > 3)
> @@ -5050,6 +5139,10 @@ int omap_dsi_host_attach(struct mipi_dsi_host =
*host,
>=20
> 	dsi_bus_lock(dsi);
>=20
> +	panel =3D of_drm_find_panel(client->dev.of_node);
> +	if (IS_ERR(panel))
> +		return PTR_ERR(panel);
> +
> 	atomic_set(&dsi->do_ext_te_update, 0);
>=20
> 	if (client->mode_flags & MIPI_DSI_MODE_VIDEO) {
> @@ -5070,8 +5163,12 @@ int omap_dsi_host_attach(struct mipi_dsi_host =
*host,
> 	INIT_DEFERRABLE_WORK(&dsi->ulps_work,
> 			     omap_dsi_ulps_work_callback);
>=20
> +	dsi->config.hs_clk_min =3D 150000000; // TODO: get from client?
> +	dsi->config.hs_clk_max =3D client->hs_rate;
> +	dsi->config.lp_clk_min =3D 7000000; // TODO: get from client?
> +	dsi->config.lp_clk_max =3D client->lp_rate;
> +
> 	dsi->ulps_auto_idle =3D !!(client->mode_flags & =
MIPI_DSI_MODE_ULPS_IDLE);
> -	dsi_set_ulps_auto(dsi, true);
>=20
> 	dsi_bus_unlock(dsi);
> 	return 0;
> diff --git a/drivers/gpu/drm/omapdrm/dss/omapdss-boot-init.c =
b/drivers/gpu/drm/omapdrm/dss/omapdss-boot-init.c
> index 31502857f013..05ac2e1cd77e 100644
> --- a/drivers/gpu/drm/omapdrm/dss/omapdss-boot-init.c
> +++ b/drivers/gpu/drm/omapdrm/dss/omapdss-boot-init.c
> @@ -176,7 +176,6 @@ static const struct of_device_id =
omapdss_of_match[] __initconst =3D {
> static const struct of_device_id omapdss_of_fixups_whitelist[] =
__initconst =3D {
> 	{ .compatible =3D "composite-video-connector" },
> 	{ .compatible =3D "hdmi-connector" },
> -	{ .compatible =3D "panel-dsi-cm" },
> 	{ .compatible =3D "svideo-connector" },
> 	{ .compatible =3D "ti,opa362" },
> 	{ .compatible =3D "ti,tpd12s015" },
> diff --git a/drivers/gpu/drm/omapdrm/dss/omapdss.h =
b/drivers/gpu/drm/omapdrm/dss/omapdss.h
> index 21601af29ee4..bfb402a88475 100644
> --- a/drivers/gpu/drm/omapdrm/dss/omapdss.h
> +++ b/drivers/gpu/drm/omapdrm/dss/omapdss.h
> @@ -122,11 +122,6 @@ enum omap_dss_dsi_mode {
> 	OMAP_DSS_DSI_VIDEO_MODE,
> };
>=20
> -enum omap_display_caps {
> -	OMAP_DSS_DISPLAY_CAP_MANUAL_UPDATE	=3D 1 << 0,
> -	OMAP_DSS_DISPLAY_CAP_TEAR_ELIM		=3D 1 << 1,
> -};
> -
> enum omap_dss_display_state {
> 	OMAP_DSS_DISPLAY_DISABLED =3D 0,
> 	OMAP_DSS_DISPLAY_ACTIVE,
> @@ -288,14 +283,7 @@ struct omapdss_hdmi_ops {
>=20
> struct omapdss_dsi_ops {
> 	int (*update)(struct omap_dss_device *dssdev);
> -
> -	/* legacy API used by omapdss panels */
> -	int (*set_config)(struct omap_dss_device *dssdev,
> -			const struct omap_dss_dsi_config *cfg);
> -
> -	int (*enable_video_output)(struct omap_dss_device *dssdev, int =
channel);
> -	void (*disable_video_output)(struct omap_dss_device *dssdev,
> -			int channel);
> +	bool (*is_video_mode)(struct omap_dss_device *dssdev);
> };
>=20
> struct omap_dss_device_ops {
> @@ -374,13 +362,10 @@ struct omap_dss_device {
>=20
> 	const char *name;
>=20
> -	const struct omap_dss_driver *driver;
> 	const struct omap_dss_device_ops *ops;
> 	unsigned long ops_flags;
> 	u32 bus_flags;
>=20
> -	enum omap_display_caps caps;
> -
> 	enum omap_dss_display_state state;
>=20
> 	/* OMAP DSS output specific fields */
> @@ -395,11 +380,6 @@ struct omap_dss_device {
> 	unsigned int of_ports;
> };
>=20
> -struct omap_dss_driver {
> -	int (*update)(struct omap_dss_device *dssdev,
> -			       u16 x, u16 y, u16 w, u16 h);
> -};
> -
> struct dss_device *omapdss_get_dss(void);
> void omapdss_set_dss(struct dss_device *dss);
> static inline bool omapdss_is_initialized(void)
> diff --git a/drivers/gpu/drm/omapdrm/omap_crtc.c =
b/drivers/gpu/drm/omapdrm/omap_crtc.c
> index a8d0543d1296..80ed1b15ba49 100644
> --- a/drivers/gpu/drm/omapdrm/omap_crtc.c
> +++ b/drivers/gpu/drm/omapdrm/omap_crtc.c
> @@ -495,8 +495,7 @@ static enum drm_mode_status =
omap_crtc_mode_valid(struct drm_crtc *crtc,
> 	 * valid DISPC mode. DSI will calculate and configure the
> 	 * proper DISPC mode later.
> 	 */
> -	if (omap_crtc->pipe->output->next =3D=3D NULL ||
> -	    omap_crtc->pipe->output->next->type !=3D =
OMAP_DISPLAY_TYPE_DSI) {
> +	if (omap_crtc->pipe->output->type !=3D OMAP_DISPLAY_TYPE_DSI) {
> 		r =3D priv->dispc_ops->mgr_check_timings(priv->dispc,
> 						       =
omap_crtc->channel,
> 						       &vm);
> @@ -548,17 +547,17 @@ static void omap_crtc_mode_set_nofb(struct =
drm_crtc *crtc)
> static bool omap_crtc_is_manually_updated(struct drm_crtc *crtc)
> {
> 	struct omap_crtc *omap_crtc =3D to_omap_crtc(crtc);
> -	struct omap_dss_device *display =3D =
omap_crtc->pipe->output->next;
> +	struct omap_dss_device *dssdev =3D omap_crtc->pipe->output;
>=20
> -	if (!display)
> +	if (dssdev->type !=3D OMAP_DISPLAY_TYPE_DSI ||
> +	    !dssdev->ops->dsi.is_video_mode)
> 		return false;
>=20
> -	if (display->caps & OMAP_DSS_DISPLAY_CAP_MANUAL_UPDATE) {
> -		DBG("detected manually updated display!");
> -		return true;
> -	}
> +	if (dssdev->ops->dsi.is_video_mode(dssdev))
> +		return false;
>=20
> -	return false;
> +	DBG("detected manually updated display!");
> +	return true;
> }
>=20
> static int omap_crtc_atomic_check(struct drm_crtc *crtc,
> --=20
> 2.24.0
>=20

Otherwise the patches compile fine and my work-in progress
DSI panel driver is probing, but not initializing.

BR,
Nikolaus

