Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B877472F23
	for <lists+linux-omap@lfdr.de>; Wed, 24 Jul 2019 14:45:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726574AbfGXMpf (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 24 Jul 2019 08:45:35 -0400
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:53744 "EHLO
        atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725776AbfGXMpf (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 24 Jul 2019 08:45:35 -0400
Received: by atrey.karlin.mff.cuni.cz (Postfix, from userid 512)
        id 6AB8380250; Wed, 24 Jul 2019 14:45:20 +0200 (CEST)
Date:   Wed, 24 Jul 2019 14:45:31 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Dan Murphy <dmurphy@ti.com>
Cc:     linux-omap@vger.kernel.org, tony@atomide.com, sre@kernel.org,
        nekit1000@gmail.com, mpartap@gmx.net, merlijn@wizzup.org,
        jacek.anaszewski@gmail.com, linux-kernel@vger.kernel.org,
        linux-leds@vger.kernel.org
Subject: Re: Backlight in motorola Droid 4
Message-ID: <20190724124530.GA30211@amd>
References: <20181219162626.12297-1-dmurphy@ti.com>
 <20190722205921.GA24787@amd>
 <b8fbc94f-c087-2c9d-4532-ea423f1626e6@ti.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="3V7upXqbjpZ4EhLz"
Content-Disposition: inline
In-Reply-To: <b8fbc94f-c087-2c9d-4532-ea423f1626e6@ti.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org


--3V7upXqbjpZ4EhLz
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> >So now the backlight LED can be controlled. Good. (And thanks!)
> >
> >But I seem to remember that backlight had range from "is it really on?"
> >to "very bright"; now it seems to have range from "bright" to "very
> >bright".
> >
> >Any ideas what goes on there?
>=20
> In the LM3552 driver we are changing the Full scale brightness registers =
for
> the
>=20
> specific control bank.
>=20
> #define LM3532_REG_CTRL_A_BRT=A0=A0=A0 0x17
> #define LM3532_REG_CTRL_B_BRT=A0=A0=A0 0x19
> #define LM3532_REG_CTRL_C_BRT=A0=A0=A0 0x1b
>=20
> In the ti-lmu code the ALS zones were being modified not the control bank
> brightness.
>=20
> #define LM3532_REG_BRT_A=A0=A0=A0 =A0=A0=A0 =A0=A0=A0 0x70=A0=A0=A0 /* zo=
ne 0 */
> #define LM3532_REG_BRT_B=A0=A0=A0 =A0=A0=A0 =A0=A0=A0 0x76=A0=A0=A0 /* zo=
ne 1 */
> #define LM3532_REG_BRT_C=A0=A0=A0 =A0=A0=A0 =A0=A0=A0 0x7C=A0=A0=A0 /* zo=
ne 2 */
>=20
> Not sure how the ALS is attached in the system if it reports to the host =
and
> the host manages
>=20
> the back light or if the the ALS is connected directly to the LM3532.
>=20
> Maybe the ALS zone targets need to be updated to allow a fuller range.=A0=
 The
> LM3532 may be stuck
>=20
> in a certain zone.
>=20
> Probably should set up the ALS properties in the device tree.

I came with this so far.
									Pavel

diff --git a/arch/arm/boot/dts/omap4-droid4-xt894.dts b/arch/arm/boot/dts/o=
map4-droid4-xt894.dts
index 62af1b8..752952e 100644
--- a/arch/arm/boot/dts/omap4-droid4-xt894.dts
+++ b/arch/arm/boot/dts/omap4-droid4-xt894.dts
@@ -422,6 +422,7 @@
 			led-sources =3D <2>;
 			ti,led-mode =3D <0>;
 			label =3D ":backlight";
+			default-state =3D "on";
 			linux,default-trigger =3D "backlight";
 		};
=20
diff --git a/drivers/base/regmap/regmap-debugfs.c b/drivers/base/regmap/reg=
map-debugfs.c
index e5e1b3a..2baeacd 100644
--- a/drivers/base/regmap/regmap-debugfs.c
+++ b/drivers/base/regmap/regmap-debugfs.c
@@ -288,7 +288,7 @@ static ssize_t regmap_map_read_file(struct file *file, =
char __user *user_buf,
 				   count, ppos);
 }
=20
-#undef REGMAP_ALLOW_WRITE_DEBUGFS
+#define REGMAP_ALLOW_WRITE_DEBUGFS
 #ifdef REGMAP_ALLOW_WRITE_DEBUGFS
 /*
  * This can be dangerous especially when we have clients such as
diff --git a/drivers/leds/leds-gpio.c b/drivers/leds/leds-gpio.c
index bdc98dd..db6e382 100644
--- a/drivers/leds/leds-gpio.c
+++ b/drivers/leds/leds-gpio.c
@@ -172,6 +172,7 @@ static struct gpio_leds_priv *gpio_leds_create(struct p=
latform_device *pdev)
 				led.default_state =3D LEDS_GPIO_DEFSTATE_ON;
 			else
 				led.default_state =3D LEDS_GPIO_DEFSTATE_OFF;
+			/* FIXME: else ... warn about bad device tree */
 		}
=20
 		if (fwnode_property_present(child, "retain-state-suspended"))
diff --git a/drivers/leds/leds-lm3532.c b/drivers/leds/leds-lm3532.c
index 180895b..365a22a5 100644
--- a/drivers/leds/leds-lm3532.c
+++ b/drivers/leds/leds-lm3532.c
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0
 // TI LM3532 LED driver
 // Copyright (C) 2019 Texas Instruments Incorporated - http://www.ti.com/
+// http://www.ti.com/lit/ds/symlink/lm3532.pdf
=20
 #include <linux/i2c.h>
 #include <linux/leds.h>
@@ -23,7 +24,7 @@
 #define LM3532_REG_PWM_B_CFG	0x14
 #define LM3532_REG_PWM_C_CFG	0x15
 #define LM3532_REG_ZONE_CFG_A	0x16
-#define LM3532_REG_CTRL_A_BRT	0x17
+#define LM3532_REG_CTRL_A_BRT	0x17 /* Called "Control A Full-Scale Current=
 " in documentation */
 #define LM3532_REG_ZONE_CFG_B	0x18
 #define LM3532_REG_CTRL_B_BRT	0x19
 #define LM3532_REG_ZONE_CFG_C	0x1a
@@ -38,6 +39,7 @@
 #define LM3532_REG_ZN_2_LO	0x65
 #define LM3532_REG_ZN_3_HI	0x66
 #define LM3532_REG_ZN_3_LO	0x67
+#define LM3532_REG_ZN_TARGET	0x70
 #define LM3532_REG_MAX		0x7e
=20
 /* Contorl Enable */
@@ -302,7 +304,7 @@ static int lm3532_led_disable(struct lm3532_led *led_da=
ta)
 	int ret;
=20
 	ret =3D regmap_update_bits(led_data->priv->regmap, LM3532_REG_ENABLE,
-					 ctrl_en_val, ~ctrl_en_val);
+					 ctrl_en_val, 0);
 	if (ret) {
 		dev_err(led_data->priv->dev, "Failed to set ctrl:%d\n", ret);
 		return ret;
@@ -321,6 +323,7 @@ static int lm3532_brightness_set(struct led_classdev *l=
ed_cdev,
=20
 	mutex_lock(&led->priv->lock);
=20
+	/* Actually, I don't think this is acceptable */
 	if (led->mode =3D=3D LM3532_BL_MODE_ALS) {
 		if (brt_val > LED_OFF)
 			ret =3D lm3532_led_enable(led);
@@ -339,11 +342,23 @@ static int lm3532_brightness_set(struct led_classdev =
*led_cdev,
 	if (ret)
 		goto unlock;
=20
+	/* This driver is sick. It manipulates maximum current register (5-bit),
+	   but fails to control 8-bit brightness register... which is exponential
+	   so it allows >8 bit of control */
+
 	brightness_reg =3D LM3532_REG_CTRL_A_BRT + led->control_bank * 2;
-	brt_val =3D brt_val / LM3532_BRT_VAL_ADJUST;
+	brt_val =3D 255 / LM3532_BRT_VAL_ADJUST;
=20
 	ret =3D regmap_write(led->priv->regmap, brightness_reg, brt_val);
=20
+	brightness_reg =3D 0x70 + led->control_bank * 5;
+
+	ret =3D regmap_write(led->priv->regmap, brightness_reg, brt_val);
+	ret =3D regmap_write(led->priv->regmap, brightness_reg+1, brt_val);
+	ret =3D regmap_write(led->priv->regmap, brightness_reg+2, brt_val);
+	ret =3D regmap_write(led->priv->regmap, brightness_reg+3, brt_val);
+	ret =3D regmap_write(led->priv->regmap, brightness_reg+4, brt_val);
+
 unlock:
 	mutex_unlock(&led->priv->lock);
 	return ret;
@@ -382,7 +397,7 @@ static int lm3532_als_configure(struct lm3532_data *pri=
v,
 	struct lm3532_als_data *als =3D priv->als_data;
 	u32 als_vmin, als_vmax, als_vstep;
 	int zone_reg =3D LM3532_REG_ZN_0_HI;
-	int brightnes_config_reg;
+	int brightness_config_reg;
 	int ret;
 	int i;
=20
@@ -415,10 +430,10 @@ static int lm3532_als_configure(struct lm3532_data *p=
riv,
 	if (ret)
 		return ret;
=20
-	brightnes_config_reg =3D LM3532_REG_ZONE_CFG_A + led->control_bank * 2;
+	brightness_config_reg =3D LM3532_REG_ZONE_CFG_A + led->control_bank * 2;
=20
-	return regmap_update_bits(priv->regmap, brightnes_config_reg,
-				  LM3532_I2C_CTRL, LM3532_ALS_CTRL);
+	return regmap_update_bits(priv->regmap, brightness_config_reg,
+				  LM3532_I2C_CTRL | LM3532_ALS_CTRL, LM3532_ALS_CTRL);
 }
=20
 static int lm3532_parse_als(struct lm3532_data *priv)
@@ -483,6 +498,34 @@ static int lm3532_parse_als(struct lm3532_data *priv)
 	return ret;
 }
=20
+static void init_default_brightness(struct led_classdev *cdev, const char =
*tmp)
+{
+	if (!strcmp(tmp, "on")) {
+		cdev->brightness_set_blocking(cdev, cdev->max_brightness);
+		return;
+	}
+	if (!strcmp(tmp, "off")) {
+		cdev->brightness_set_blocking(cdev, 0);
+		return;
+	}
+	if (!strcmp(tmp, "keep"))
+		return;
+	printk("Invalid value for default brightness\n");
+}
+
+static void fwnode_default_brightness(struct led_classdev *cdev, struct fw=
node_handle *child)
+{
+	const char *tmp;
+
+	if (!fwnode_property_read_string(child, "default-state", &tmp)) {
+	  printk("Do not have default state\n");
+	  init_default_brightness(cdev, "on");
+		return;
+	}
+
+	init_default_brightness(cdev, tmp);
+}
+
 static int lm3532_parse_node(struct lm3532_data *priv)
 {
 	struct fwnode_handle *child =3D NULL;
@@ -536,11 +579,13 @@ static int lm3532_parse_node(struct lm3532_data *priv)
 		ret =3D fwnode_property_read_u32(child, "ti,led-mode",
 					       &led->mode);
 		if (ret) {
+		  /* FIXME: should just default to non-als mod */
 			dev_err(&priv->client->dev, "ti,led-mode property missing\n");
 			fwnode_handle_put(child);
 			goto child_out;
 		}
=20
+		/* FIXME: check for invalid ti,led-mode s? */
 		if (led->mode =3D=3D LM3532_BL_MODE_ALS) {
 			ret =3D lm3532_parse_als(priv);
 			if (ret)
@@ -554,7 +599,7 @@ static int lm3532_parse_node(struct lm3532_data *priv)
 							       NULL, 0);
=20
 		if (led->num_leds > LM3532_MAX_LED_STRINGS) {
-			dev_err(&priv->client->dev, "To many LED string defined\n");
+			dev_err(&priv->client->dev, "Too many LED strings defined\n");
 			continue;
 		}
=20
@@ -582,6 +627,8 @@ static int lm3532_parse_node(struct lm3532_data *priv)
 		led->led_dev.name =3D led->label;
 		led->led_dev.brightness_set_blocking =3D lm3532_brightness_set;
=20
+		lm3532_init_registers(led);
+
 		ret =3D devm_led_classdev_register(priv->dev, &led->led_dev);
 		if (ret) {
 			dev_err(&priv->client->dev, "led register err: %d\n",
@@ -590,7 +637,7 @@ static int lm3532_parse_node(struct lm3532_data *priv)
 			goto child_out;
 		}
=20
-		lm3532_init_registers(led);
+		fwnode_default_brightness(&led->led_dev, child);
=20
 		i++;
 	}
diff --git a/drivers/leds/leds-spi-byte.c b/drivers/leds/leds-spi-byte.c
index b231b56..692e10d 100644
--- a/drivers/leds/leds-spi-byte.c
+++ b/drivers/leds/leds-spi-byte.c
@@ -118,6 +118,7 @@ static int spi_byte_probe(struct spi_device *spi)
 			led->ldev.brightness =3D led->ldev.max_brightness;
 		} else if (strcmp(state, "off")) {
 			/* all other cases except "off" */
+		  /* Wrong; want keep, too */
 			dev_err(dev, "default-state can only be 'on' or 'off'");
 			return -EINVAL;
 		}

--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--3V7upXqbjpZ4EhLz
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAl04UuoACgkQMOfwapXb+vLlaACeKqEYcJMvsuU6iBOV8lbCRi0t
NyEAn0QxLGJXfN1DzT0qE28K93vEpYRX
=GNqL
-----END PGP SIGNATURE-----

--3V7upXqbjpZ4EhLz--
