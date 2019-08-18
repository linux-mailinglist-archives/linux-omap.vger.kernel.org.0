Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A4AF391677
	for <lists+linux-omap@lfdr.de>; Sun, 18 Aug 2019 14:13:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726097AbfHRMNL (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sun, 18 Aug 2019 08:13:11 -0400
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:33729 "EHLO
        atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726005AbfHRMNL (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sun, 18 Aug 2019 08:13:11 -0400
Received: by atrey.karlin.mff.cuni.cz (Postfix, from userid 512)
        id CEB0A8138A; Sun, 18 Aug 2019 14:12:54 +0200 (CEST)
Date:   Sun, 18 Aug 2019 14:13:07 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Merlijn Wajer <merlijn@wizzup.org>
Cc:     linux-omap <linux-omap@vger.kernel.org>,
        Sebastian Reichel <sre@kernel.org>,
        Tony Lindgren <tony@atomide.com>, bencoh@notk.org
Subject: Re: Charging voltage for droid4 battery
Message-ID: <20190818121306.GC32205@amd>
References: <4a845327-348f-5e4f-ec76-4c5d1f61c270@wizzup.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="ZwgA9U+XZDXt4+m+"
Content-Disposition: inline
In-Reply-To: <4a845327-348f-5e4f-ec76-4c5d1f61c270@wizzup.org>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org


--ZwgA9U+XZDXt4+m+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun 2019-08-18 13:05:15, Merlijn Wajer wrote:
> Hi,
>=20
> Recently my Droid4 battery seems to be swelling up quite a bit. It could
> be of old age, but bencoh (CC) suggested that he changed the driver code
> in his kernel to charge until 4.2v, instead of the 4.35v that mainline
> currently seems to use. (After one of his batteries started to swell up t=
oo)

I use patches below that allow runtime config...

> I assume the 4.35v value was taken from Android?

Not sure, but it was not completely crazy when I checked.

Also D4 charges by 1A or so, which is known to be quite harsh to the
battery.

								Pavel
commit 47005e4fe4b429895d7036c65a033a787183b8e4
Author: Pavel <pavel@ucw.cz>
Date:   Sun Oct 28 13:48:08 2018 +0100

    d4: power: remove synthetic values, add control for charge current/volt=
age.
   =20
    Signed-off-by: Pavel Machek <pavel@ucw.cz>

diff --git a/drivers/power/supply/cpcap-battery.c b/drivers/power/supply/cp=
cap-battery.c
index 61d6447..ba09cd4 100644
--- a/drivers/power/supply/cpcap-battery.c
+++ b/drivers/power/supply/cpcap-battery.c
@@ -3,7 +3,7 @@
  *
  * Copyright (C) 2017 Tony Lindgren <tony@atomide.com>
  *
- * Some parts of the code based on earlie Motorola mapphone Linux kernel
+ * Some parts of the code based on earlier Motorola mapphone Linux kernel
  * drivers:
  *
  * Copyright (C) 2009-2010 Motorola, Inc.
@@ -492,24 +492,6 @@ static int cpcap_battery_get_property(struct power_sup=
ply *psy,
 	case POWER_SUPPLY_PROP_CHARGE_COUNTER:
 		val->intval =3D latest->counter_uah;
 		break;
-	case POWER_SUPPLY_PROP_POWER_NOW:
-		tmp =3D (latest->voltage / 10000) * latest->current_ua;
-		val->intval =3D div64_s64(tmp, 100);
-		break;
-	case POWER_SUPPLY_PROP_POWER_AVG:
-		sample =3D latest->cc.sample - previous->cc.sample;
-		if (!sample) {
-			tmp =3D cpcap_battery_cc_get_avg_current(ddata);
-			tmp *=3D (latest->voltage / 10000);
-			val->intval =3D div64_s64(tmp, 100);
-			break;
-		}
-		accumulator =3D latest->cc.accumulator - previous->cc.accumulator;
-		tmp =3D cpcap_battery_cc_to_ua(ddata, sample, accumulator,
-					     latest->cc.offset);
-		tmp *=3D ((latest->voltage + previous->voltage) / 20000);
-		val->intval =3D div64_s64(tmp, 100);
-		break;
 	case POWER_SUPPLY_PROP_CAPACITY_LEVEL:
 		if (cpcap_battery_full(ddata))
 			val->intval =3D POWER_SUPPLY_CAPACITY_LEVEL_FULL;
diff --git a/drivers/power/supply/cpcap-charger.c b/drivers/power/supply/cp=
cap-charger.c
index cc546bc..5e19ae7 100644
--- a/drivers/power/supply/cpcap-charger.c
+++ b/drivers/power/supply/cpcap-charger.c
@@ -85,6 +85,17 @@
 #define CPCAP_REG_CRM_VCHRG_4V42	CPCAP_REG_CRM_VCHRG(0xe)
 #define CPCAP_REG_CRM_VCHRG_4V44	CPCAP_REG_CRM_VCHRG(0xf)
=20
+static int voltage_to_register(int microvolt)
+{
+	switch (microvolt/1000) {
+	case 3800: return CPCAP_REG_CRM_VCHRG_3V80;
+	case 4100: return CPCAP_REG_CRM_VCHRG_4V10;
+	case 4200: return CPCAP_REG_CRM_VCHRG_4V20;
+	case 4350: return CPCAP_REG_CRM_VCHRG_4V35;
+	default: return -EINVAL;
+	}
+}
+
 /*
  * CPCAP_REG_CRM charge currents. These seem to match MC13783UG.pdf
  * values in "Table 8-3. Charge Path Regulator Current Limit
@@ -108,6 +119,18 @@
 #define CPCAP_REG_CRM_ICHRG_1A596	CPCAP_REG_CRM_ICHRG(0xe)
 #define CPCAP_REG_CRM_ICHRG_NO_LIMIT	CPCAP_REG_CRM_ICHRG(0xf)
=20
+static int current_to_register(int microamp)
+{
+	switch (microamp/1000) {
+	case 0:    return CPCAP_REG_CRM_ICHRG_0A000;
+	case 70:   return CPCAP_REG_CRM_ICHRG_0A070;
+	case 177:  return CPCAP_REG_CRM_ICHRG_0A177;
+	case 532:  return CPCAP_REG_CRM_ICHRG_0A532;
+	case 1596: return CPCAP_REG_CRM_ICHRG_1A596;
+	default: return -EINVAL;
+	}
+}
+
 enum {
 	CPCAP_CHARGER_IIO_BATTDET,
 	CPCAP_CHARGER_IIO_VOLTAGE,
@@ -134,6 +157,10 @@ struct cpcap_charger_ddata {
 	atomic_t active;
=20
 	int status;
+
+	int led_enabled;
+	int limit_current;
+	int limit_voltage;
 };
=20
 struct cpcap_interrupt_desc {
@@ -155,11 +182,17 @@ struct cpcap_charger_ints_state {
 	bool battdetb;
 };
=20
+#define POWER_SUPPLY_PROP_INDICATION POWER_SUPPLY_PROP_CHARGE_CONTROL_LIMIT
+
 static enum power_supply_property cpcap_charger_props[] =3D {
 	POWER_SUPPLY_PROP_STATUS,
 	POWER_SUPPLY_PROP_ONLINE,
 	POWER_SUPPLY_PROP_VOLTAGE_NOW,
 	POWER_SUPPLY_PROP_CURRENT_NOW,
+
+        POWER_SUPPLY_PROP_CONSTANT_CHARGE_CURRENT,
+	POWER_SUPPLY_PROP_CONSTANT_CHARGE_VOLTAGE,
+	POWER_SUPPLY_PROP_INDICATION,
 };
=20
 static bool cpcap_charger_battery_found(struct cpcap_charger_ddata *ddata)
@@ -221,6 +254,7 @@ static int cpcap_charger_get_property(struct power_supp=
ly *psy,
 		val->intval =3D ddata->status;
 		break;
 	case POWER_SUPPLY_PROP_VOLTAGE_NOW:
+		/* FIXME? Display voltage even when not charging? */
 		if (ddata->status =3D=3D POWER_SUPPLY_STATUS_CHARGING)
 			val->intval =3D cpcap_charger_get_charge_voltage(ddata) *
 				1000;
@@ -237,6 +271,50 @@ static int cpcap_charger_get_property(struct power_sup=
ply *psy,
 	case POWER_SUPPLY_PROP_ONLINE:
 		val->intval =3D ddata->status =3D=3D POWER_SUPPLY_STATUS_CHARGING;
 		break;
+	=09
+	case POWER_SUPPLY_PROP_CONSTANT_CHARGE_CURRENT:
+		// -> charger -- current limit
+		val->intval =3D ddata->limit_current;
+		break;
+	case POWER_SUPPLY_PROP_CONSTANT_CHARGE_VOLTAGE:
+		val->intval =3D ddata->limit_voltage;
+		break;
+	case POWER_SUPPLY_PROP_INDICATION:
+		val->intval =3D ddata->led_enabled;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int cpcap_charger_set_property(struct power_supply *psy,
+				      enum power_supply_property psp,
+				      const union power_supply_propval *val)
+{
+	struct cpcap_charger_ddata *ddata =3D dev_get_drvdata(psy->dev.parent);
+
+	switch (psp) {
+	case POWER_SUPPLY_PROP_CONSTANT_CHARGE_CURRENT:
+		printk("charge current: %d\n", val->intval);
+		if (current_to_register(val->intval) < 0)
+			return -EINVAL;
+		ddata->limit_current =3D val->intval;
+		schedule_delayed_work(&ddata->detect_work, 0);
+		break;
+	case POWER_SUPPLY_PROP_CONSTANT_CHARGE_VOLTAGE:
+		printk("charge voltage: %d\n", val->intval);
+		if (voltage_to_register(val->intval) < 0)
+			return -EINVAL;
+		ddata->limit_voltage =3D val->intval;
+		schedule_delayed_work(&ddata->detect_work, 0);
+		break;
+	case POWER_SUPPLY_PROP_INDICATION:
+		printk("hack indication: %d\n", val->intval);
+		ddata->led_enabled =3D !!val->intval;
+		schedule_delayed_work(&ddata->detect_work, 0);
+		break;
 	default:
 		return -EINVAL;
 	}
@@ -288,7 +366,7 @@ static int cpcap_charger_set_state(struct cpcap_charger=
_ddata *ddata,
 	}
=20
 	error =3D regmap_update_bits(ddata->reg, CPCAP_REG_CRM, 0x3fff,
-				   CPCAP_REG_CRM_CHRG_LED_EN |
+				   ddata->led_enabled * CPCAP_REG_CRM_CHRG_LED_EN |
 				   trickle_current |
 				   CPCAP_REG_CRM_FET_OVRD |
 				   CPCAP_REG_CRM_FET_CTRL |
@@ -432,16 +510,39 @@ static void cpcap_usb_detect(struct work_struct *work)
 		return;
=20
 	if (cpcap_charger_vbus_valid(ddata) && s.chrgcurr1) {
-		int max_current;
+		int m_voltage, m_current;
+		int reg_current, reg_voltage;
=20
 		if (cpcap_charger_battery_found(ddata))
-			max_current =3D CPCAP_REG_CRM_ICHRG_1A596;
+			m_current =3D 1596000;
 		else
-			max_current =3D CPCAP_REG_CRM_ICHRG_0A532;
+			m_current =3D 532000;
+
+		if (m_current > ddata->limit_current)
+			m_current =3D ddata->limit_current;
+	=09
+		m_voltage =3D 4350000;
+		if (m_voltage > ddata->limit_voltage)
+			m_voltage =3D ddata->limit_voltage;
+
+		if (printk_ratelimit())
+			printk("Charging, %d uV, %d uA\n", m_voltage, m_current);
+	=09
+		reg_voltage =3D voltage_to_register(m_voltage);
+		if (reg_voltage < 0) {
+			dev_err(ddata->dev, "%s impossible voltage\n", __func__);
+			return;
+		}
+		=09
+		reg_current =3D current_to_register(m_current);
+		if (reg_current < 0) {
+			dev_err(ddata->dev, "%s impossible current\n", __func__);
+			return;
+		}
=20
 		error =3D cpcap_charger_set_state(ddata,
-						CPCAP_REG_CRM_VCHRG_4V35,
-						max_current, 0);
+						reg_voltage,
+						reg_current, 0);
 		if (error)
 			goto out_err;
 	} else {
@@ -573,12 +674,27 @@ static int cpcap_charger_init_iio(struct cpcap_charge=
r_ddata *ddata)
 	return error;
 }
=20
+static int cpcap_charger_property_is_writeable(struct power_supply *psy,
+						 enum power_supply_property psp)
+{
+	switch (psp) {
+	case POWER_SUPPLY_PROP_CONSTANT_CHARGE_CURRENT:
+	case POWER_SUPPLY_PROP_CONSTANT_CHARGE_VOLTAGE:
+	case POWER_SUPPLY_PROP_INDICATION:
+		return 1;
+	default:
+		return 0;
+	}
+}
+
 static const struct power_supply_desc cpcap_charger_usb_desc =3D {
 	.name		=3D "usb",
 	.type		=3D POWER_SUPPLY_TYPE_USB,
 	.properties	=3D cpcap_charger_props,
 	.num_properties	=3D ARRAY_SIZE(cpcap_charger_props),
 	.get_property	=3D cpcap_charger_get_property,
+	.set_property	=3D cpcap_charger_set_property,
+	.property_is_writeable =3D cpcap_charger_property_is_writeable,
 };
=20
 #ifdef CONFIG_OF
@@ -613,6 +729,10 @@ static int cpcap_charger_probe(struct platform_device =
*pdev)
 	if (!ddata->reg)
 		return -ENODEV;
=20
+	ddata->limit_current =3D 1596000;
+	ddata->limit_voltage =3D 4350000;
+	ddata->led_enabled =3D 1;
+
 	INIT_LIST_HEAD(&ddata->irq_list);
 	INIT_DELAYED_WORK(&ddata->detect_work, cpcap_usb_detect);
 	INIT_DELAYED_WORK(&ddata->vbus_work, cpcap_charger_vbus_work);

commit dab3078670be9983873ce842028bf8058c5cb341
Author: Pavel <pavel@ucw.cz>
Date:   Sun Dec 9 19:24:29 2018 +0100

    cpcap-usb-power: Provide support more values for max voltage and current

diff --git a/drivers/power/supply/cpcap-charger.c b/drivers/power/supply/cp=
cap-charger.c
index 5e19ae7..daa17d5 100644
--- a/drivers/power/supply/cpcap-charger.c
+++ b/drivers/power/supply/cpcap-charger.c
@@ -66,6 +66,8 @@
  * CPCAP_REG_CRM charge voltages based on the ADC channel 1 values.
  * Note that these register bits don't match MC13783UG.pdf VCHRG
  * register bits.
+ *
+ * Above 4.10V, these are just 0.025V per step.
  */
 #define CPCAP_REG_CRM_VCHRG(val)	(((val) & 0xf) << 4)
 #define CPCAP_REG_CRM_VCHRG_3V80	CPCAP_REG_CRM_VCHRG(0x0)
@@ -87,19 +89,27 @@
=20
 static int voltage_to_register(int microvolt)
 {
-	switch (microvolt/1000) {
-	case 3800: return CPCAP_REG_CRM_VCHRG_3V80;
-	case 4100: return CPCAP_REG_CRM_VCHRG_4V10;
-	case 4200: return CPCAP_REG_CRM_VCHRG_4V20;
-	case 4350: return CPCAP_REG_CRM_VCHRG_4V35;
-	default: return -EINVAL;
-	}
+	int milivolt =3D microvolt/1000;
+	int res;
+=09
+	if (milivolt < 4100)
+		return CPCAP_REG_CRM_VCHRG_3V80;
+	if (milivolt > 4350)
+		return -EINVAL;
+
+	milivolt =3D milivolt - (4100 - 250);
+	res =3D milivolt / 250;
+	BUG_ON(res < 1);
+	BUG_ON(res > 0xb);
+	return CPCAP_REG_CRM_VCHRG(res);
 }
=20
 /*
  * CPCAP_REG_CRM charge currents. These seem to match MC13783UG.pdf
  * values in "Table 8-3. Charge Path Regulator Current Limit
  * Characteristics" for the nominal values.
+ *
+ * Except 70mA and 1.596A and unlimited, these are simply 88.7mA / step.
  */
 #define CPCAP_REG_CRM_ICHRG(val)	(((val) & 0xf) << 0)
 #define CPCAP_REG_CRM_ICHRG_0A000	CPCAP_REG_CRM_ICHRG(0x0)
@@ -121,14 +131,21 @@ static int voltage_to_register(int microvolt)
=20
 static int current_to_register(int microamp)
 {
-	switch (microamp/1000) {
-	case 0:    return CPCAP_REG_CRM_ICHRG_0A000;
-	case 70:   return CPCAP_REG_CRM_ICHRG_0A070;
-	case 177:  return CPCAP_REG_CRM_ICHRG_0A177;
-	case 532:  return CPCAP_REG_CRM_ICHRG_0A532;
-	case 1596: return CPCAP_REG_CRM_ICHRG_1A596;
-	default: return -EINVAL;
-	}
+	int miliamp =3D microamp/1000;
+	int res;
+	if (miliamp < 0)
+		return -EINVAL;
+	if (miliamp < 70)=20
+		return CPCAP_REG_CRM_ICHRG(0x0);
+	if (miliamp < 177)
+		return CPCAP_REG_CRM_ICHRG(0x1);
+	if (miliamp > 1596)
+		return CPCAP_REG_CRM_ICHRG(0xe);
+
+	res =3D microamp / 88666;
+	if (res > 0xd)
+		res =3D 0xd;
+	return CPCAP_REG_CRM_ICHRG(res);
 }
=20
 enum {




--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--ZwgA9U+XZDXt4+m+
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAl1ZQNIACgkQMOfwapXb+vKlCQCcCBmL7FlE6wcuR//l9uMHmL/r
tMoAn2Gel4un1+yBXsaK2EerXQsmK0uB
=XiQz
-----END PGP SIGNATURE-----

--ZwgA9U+XZDXt4+m+--
