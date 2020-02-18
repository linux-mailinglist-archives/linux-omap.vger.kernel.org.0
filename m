Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4A3661636EE
	for <lists+linux-omap@lfdr.de>; Wed, 19 Feb 2020 00:10:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726945AbgBRXKU (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 18 Feb 2020 18:10:20 -0500
Received: from jabberwock.ucw.cz ([46.255.230.98]:39736 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726820AbgBRXKU (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 18 Feb 2020 18:10:20 -0500
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 686E91C0357; Wed, 19 Feb 2020 00:10:17 +0100 (CET)
Date:   Wed, 19 Feb 2020 00:10:01 +0100
From:   Pavel Machek <pavel@ucw.cz>
To:     Tony Lindgren <tony@atomide.com>
Cc:     Lee Jones <lee.jones@linaro.org>,
        kernel list <linux-kernel@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        linux-omap@vger.kernel.org, sre@kernel.org, nekit1000@gmail.com,
        mpartap@gmx.net, merlijn@wizzup.org, martin_rysavy@centrum.cz,
        agx@sigxcpu.org, daniel.thompson@linaro.org, jingoohan1@gmail.com,
        dri-devel@lists.freedesktop.org, tomi.valkeinen@ti.com,
        jjhiblot@ti.com
Subject: Re: LED backlight on Droid 4 and others
Message-ID: <20200218231001.GA28817@amd>
References: <20200105183202.GA17784@duo.ucw.cz>
 <20200106084549.GA14821@dell>
 <20200211172900.GH64767@atomide.com>
 <20200212201638.GB20085@amd>
 <20200218135219.GC3494@dell>
 <20200218141452.GF35972@atomide.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="dDRMvlgZJXvWKvBx"
Content-Disposition: inline
In-Reply-To: <20200218141452.GF35972@atomide.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org


--dDRMvlgZJXvWKvBx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> > > > > > It would be good to get LED backlight to work in clean way for =
5.6
> > > > > > kernel.
> > > > ...
> > > > > > [If you have an idea what else is needed, it would be welcome; =
it
> > > > > > works for me in development tree but not in tree I'd like to
> > > > > > upstream.]
> > > > > >=20
> > > > > > Lee, would you be willing to take "backlight: add led-backlight
> > > > > > driver"? Would it help if I got "leds: Add managed API to get a=
 LED
> > > > > > from a device driver" and "leds: Add of_led_get() and led_put()=
" into
> > > > > > for_next tree of the LED subsystem?
> > > > >=20
> > > > > It looks like you have an open question from Tony on v10.
> > > > >=20
> > > > > Is that patch orthogonal, or are there depend{ants,encies}?
> > > >=20
> > > > Uhh looks like we messed up a bit with integration. Now droid4
> > > > LCD backlight can no longer be enabled at all manually in v5.6-rc1
> > > > without the "add led-backlight driver" patch.. Should we just
> > > > merge it to fix it rather than start scrambling with other
> > > > temporary hacks?
> > >=20
> > > We should just merge the "add led-backlight driver". Everything should
> > > be ready for it. I'm sorry if I broke something working, I was not
> > > aware it worked at all.
> > >=20
> > > Unfortunately, this is backlight code, not LED, so I can't just merge=
 it.
> >=20
> > Please go ahead.  Apply my Acked-by and merge away ASAP.
> >=20
> > Acked-by: Lee Jones <lee.jones@linaro.org>
>=20
> OK best to merge the driver via the LED tree:
>=20
> Acked-by: Tony Lindgren <tony@atomide.com>
> Tested-by: Tony Lindgren <tony@atomide.com>

Is the patch below the one both of you are talking about?

Hmm. I should s/default-brightness-level/default-brightness/
below.

Lee, I can of course take it (thanks), but won't Kconfig/Makefile
pieces cause rejects? It might be still better if you took it. I can
hand-edit it and submit it in form for easy application... tommorow.

Best regards,

									Pavel

commit 81a2daadf8dd6c8e0cbc3b60246932436be3c714
Author: Tomi Valkeinen <tomi.valkeinen@ti.com>
Date:   Thu Oct 3 10:28:12 2019 +0200

    backlight: add led-backlight driver
   =20
    This patch adds a led-backlight driver (led_bl), which is similar to
    pwm_bl except the driver uses a LED class driver to adjust the
    brightness in the HW. Multiple LEDs can be used for a single backlight.
   =20
    Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
    Signed-off-by: Jean-Jacques Hiblot <jjhiblot@ti.com>
    Acked-by: Pavel Machek <pavel@ucw.cz>
    Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>

diff --git a/drivers/video/backlight/Kconfig b/drivers/video/backlight/Kcon=
fig
index 4c8f73394aac..93836ef872f5 100644
--- a/drivers/video/backlight/Kconfig
+++ b/drivers/video/backlight/Kconfig
@@ -463,6 +463,13 @@ config BACKLIGHT_RAVE_SP
 	help
 	  Support for backlight control on RAVE SP device.
=20
+config BACKLIGHT_LED
+	tristate "Generic LED based Backlight Driver"
+	depends on LEDS_CLASS && OF
+	help
+	  If you have a LCD backlight adjustable by LED class driver, say Y
+	  to enable this driver.
+
 endif # BACKLIGHT_CLASS_DEVICE
=20
 endmenu
diff --git a/drivers/video/backlight/Makefile b/drivers/video/backlight/Mak=
efile
index 961fb553b9c0..5e13242f31d6 100644
--- a/drivers/video/backlight/Makefile
+++ b/drivers/video/backlight/Makefile
@@ -60,3 +60,4 @@ obj-$(CONFIG_BACKLIGHT_TPS65217)	+=3D tps65217_bl.o
 obj-$(CONFIG_BACKLIGHT_WM831X)		+=3D wm831x_bl.o
 obj-$(CONFIG_BACKLIGHT_ARCXCNN) 	+=3D arcxcnn_bl.o
 obj-$(CONFIG_BACKLIGHT_RAVE_SP)		+=3D rave-sp-backlight.o
+obj-$(CONFIG_BACKLIGHT_LED)		+=3D led_bl.o
diff --git a/drivers/video/backlight/led_bl.c b/drivers/video/backlight/led=
_bl.c
new file mode 100644
index 000000000000..3f66549997c8
--- /dev/null
+++ b/drivers/video/backlight/led_bl.c
@@ -0,0 +1,260 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2015-2019 Texas Instruments Incorporated -  http://www.ti=
=2Ecom/
+ * Author: Tomi Valkeinen <tomi.valkeinen@ti.com>
+ *
+ * Based on pwm_bl.c
+ */
+
+#include <linux/backlight.h>
+#include <linux/leds.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+
+struct led_bl_data {
+	struct device		*dev;
+	struct backlight_device	*bl_dev;
+	struct led_classdev	**leds;
+	bool			enabled;
+	int			nb_leds;
+	unsigned int		*levels;
+	unsigned int		default_brightness;
+	unsigned int		max_brightness;
+};
+
+static void led_bl_set_brightness(struct led_bl_data *priv, int level)
+{
+	int i;
+	int bkl_brightness;
+
+	if (priv->levels)
+		bkl_brightness =3D priv->levels[level];
+	else
+		bkl_brightness =3D level;
+
+	for (i =3D 0; i < priv->nb_leds; i++)
+		led_set_brightness(priv->leds[i], bkl_brightness);
+
+	priv->enabled =3D true;
+}
+
+static void led_bl_power_off(struct led_bl_data *priv)
+{
+	int i;
+
+	if (!priv->enabled)
+		return;
+
+	for (i =3D 0; i < priv->nb_leds; i++)
+		led_set_brightness(priv->leds[i], LED_OFF);
+
+	priv->enabled =3D false;
+}
+
+static int led_bl_update_status(struct backlight_device *bl)
+{
+	struct led_bl_data *priv =3D bl_get_data(bl);
+	int brightness =3D bl->props.brightness;
+
+	if (bl->props.power !=3D FB_BLANK_UNBLANK ||
+	    bl->props.fb_blank !=3D FB_BLANK_UNBLANK ||
+	    bl->props.state & BL_CORE_FBBLANK)
+		brightness =3D 0;
+
+	if (brightness > 0)
+		led_bl_set_brightness(priv, brightness);
+	else
+		led_bl_power_off(priv);
+
+	return 0;
+}
+
+static const struct backlight_ops led_bl_ops =3D {
+	.update_status	=3D led_bl_update_status,
+};
+
+static int led_bl_get_leds(struct device *dev,
+			   struct led_bl_data *priv)
+{
+	int i, nb_leds, ret;
+	struct device_node *node =3D dev->of_node;
+	struct led_classdev **leds;
+	unsigned int max_brightness;
+	unsigned int default_brightness;
+
+	ret =3D of_count_phandle_with_args(node, "leds", NULL);
+	if (ret < 0) {
+		dev_err(dev, "Unable to get led count\n");
+		return -EINVAL;
+	}
+
+	nb_leds =3D ret;
+	if (nb_leds < 1) {
+		dev_err(dev, "At least one LED must be specified!\n");
+		return -EINVAL;
+	}
+
+	leds =3D devm_kzalloc(dev, sizeof(struct led_classdev *) * nb_leds,
+			    GFP_KERNEL);
+	if (!leds)
+		return -ENOMEM;
+
+	for (i =3D 0; i < nb_leds; i++) {
+		leds[i] =3D devm_of_led_get(dev, i);
+		if (IS_ERR(leds[i]))
+			return PTR_ERR(leds[i]);
+	}
+
+	/* check that the LEDs all have the same brightness range */
+	max_brightness =3D leds[0]->max_brightness;
+	for (i =3D 1; i < nb_leds; i++) {
+		if (max_brightness !=3D leds[i]->max_brightness) {
+			dev_err(dev, "LEDs must have identical ranges\n");
+			return -EINVAL;
+		}
+	}
+
+	/* get the default brightness from the first LED from the list */
+	default_brightness =3D leds[0]->brightness;
+
+	priv->nb_leds =3D nb_leds;
+	priv->leds =3D leds;
+	priv->max_brightness =3D max_brightness;
+	priv->default_brightness =3D default_brightness;
+
+	return 0;
+}
+
+static int led_bl_parse_levels(struct device *dev,
+			   struct led_bl_data *priv)
+{
+	struct device_node *node =3D dev->of_node;
+	int num_levels;
+	u32 value;
+	int ret;
+
+	if (!node)
+		return -ENODEV;
+
+	num_levels =3D of_property_count_u32_elems(node, "brightness-levels");
+	if (num_levels > 1) {
+		int i;
+		unsigned int db;
+		u32 *levels =3D NULL;
+
+		levels =3D devm_kzalloc(dev, sizeof(u32) * num_levels,
+				      GFP_KERNEL);
+		if (!levels)
+			return -ENOMEM;
+
+		ret =3D of_property_read_u32_array(node, "brightness-levels",
+						levels,
+						num_levels);
+		if (ret < 0)
+			return ret;
+
+		/*
+		 * Try to map actual LED brightness to backlight brightness
+		 * level
+		 */
+		db =3D priv->default_brightness;
+		for (i =3D 0 ; i < num_levels; i++) {
+			if ((i && db > levels[i-1]) && db <=3D levels[i])
+				break;
+		}
+		priv->default_brightness =3D i;
+		priv->max_brightness =3D num_levels - 1;
+		priv->levels =3D levels;
+	} else if (num_levels >=3D 0)
+		dev_warn(dev, "Not enough levels defined\n");
+
+	ret =3D of_property_read_u32(node, "default-brightness-level", &value);
+	if (!ret && value <=3D priv->max_brightness)
+		priv->default_brightness =3D value;
+	else if (!ret  && value > priv->max_brightness)
+		dev_warn(dev, "Invalid default brightness. Ignoring it\n");
+
+	return 0;
+}
+
+static int led_bl_probe(struct platform_device *pdev)
+{
+	struct backlight_properties props;
+	struct led_bl_data *priv;
+	int ret, i;
+
+	priv =3D devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	platform_set_drvdata(pdev, priv);
+
+	priv->dev =3D &pdev->dev;
+
+	ret =3D led_bl_get_leds(&pdev->dev, priv);
+	if (ret)
+		return ret;
+
+	ret =3D led_bl_parse_levels(&pdev->dev, priv);
+	if (ret < 0) {
+		dev_err(&pdev->dev, "Failed to parse DT data\n");
+		return ret;
+	}
+
+	memset(&props, 0, sizeof(struct backlight_properties));
+	props.type =3D BACKLIGHT_RAW;
+	props.max_brightness =3D priv->max_brightness;
+	props.brightness =3D priv->default_brightness;
+	props.power =3D (priv->default_brightness > 0) ? FB_BLANK_POWERDOWN :
+		      FB_BLANK_UNBLANK;
+	priv->bl_dev =3D backlight_device_register(dev_name(&pdev->dev),
+			&pdev->dev, priv, &led_bl_ops, &props);
+	if (IS_ERR(priv->bl_dev)) {
+		dev_err(&pdev->dev, "Failed to register backlight\n");
+		return PTR_ERR(priv->bl_dev);
+	}
+
+	for (i =3D 0; i < priv->nb_leds; i++)
+		led_sysfs_disable(priv->leds[i]);
+
+	backlight_update_status(priv->bl_dev);
+
+	return 0;
+}
+
+static int led_bl_remove(struct platform_device *pdev)
+{
+	struct led_bl_data *priv =3D platform_get_drvdata(pdev);
+	struct backlight_device *bl =3D priv->bl_dev;
+	int i;
+
+	backlight_device_unregister(bl);
+
+	led_bl_power_off(priv);
+	for (i =3D 0; i < priv->nb_leds; i++)
+		led_sysfs_enable(priv->leds[i]);
+
+	return 0;
+}
+
+static const struct of_device_id led_bl_of_match[] =3D {
+	{ .compatible =3D "led-backlight" },
+	{ }
+};
+
+MODULE_DEVICE_TABLE(of, led_bl_of_match);
+
+static struct platform_driver led_bl_driver =3D {
+	.driver		=3D {
+		.name		=3D "led-backlight",
+		.of_match_table	=3D of_match_ptr(led_bl_of_match),
+	},
+	.probe		=3D led_bl_probe,
+	.remove		=3D led_bl_remove,
+};
+
+module_platform_driver(led_bl_driver);
+
+MODULE_DESCRIPTION("LED based Backlight Driver");
+MODULE_LICENSE("GPL");
+MODULE_ALIAS("platform:led-backlight");

--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--dDRMvlgZJXvWKvBx
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAl5MbskACgkQMOfwapXb+vJPOgCfRPbwsYCnPqglmm26GB4cfPSN
hlsAn16I3KGEcXZB16/neBQLfxWoyjUv
=NDCD
-----END PGP SIGNATURE-----

--dDRMvlgZJXvWKvBx--
