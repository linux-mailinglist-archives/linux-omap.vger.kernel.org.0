Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 02AEC39B93E
	for <lists+linux-omap@lfdr.de>; Fri,  4 Jun 2021 14:54:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229718AbhFDM4m (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 4 Jun 2021 08:56:42 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:35102 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230025AbhFDM4m (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 4 Jun 2021 08:56:42 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: sre)
        with ESMTPSA id 87DE11F435FC
Received: by earth.universe (Postfix, from userid 1000)
        id 81B243C0C95; Fri,  4 Jun 2021 14:54:52 +0200 (CEST)
Date:   Fri, 4 Jun 2021 14:54:52 +0200
From:   Sebastian Reichel <sebastian.reichel@collabora.com>
To:     Carl Philipp Klemm <philipp@uvos.xyz>
Cc:     linux-omap@vger.kernel.org,
        Arthur Demchenkov <spinal.by@gmail.com>,
        Tony Lindgren <tony@atomide.com>,
        Merlijn Wajer <merlijn@wizzup.org>, Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH v2 1/2] power: supply: cpcap-battery: Add battery type
 auto detection for mapphone devices
Message-ID: <20210604125452.x7ui33ss37ekrvrr@earth.universe>
References: <20210423145543.d007e8aa9bd2fc91dc51caa5@uvos.xyz>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="7nkedkmhmyd4jz3b"
Content-Disposition: inline
In-Reply-To: <20210423145543.d007e8aa9bd2fc91dc51caa5@uvos.xyz>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org


--7nkedkmhmyd4jz3b
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, Apr 23, 2021 at 02:55:43PM +0200, Carl Philipp Klemm wrote:
> This allows cpcap-battery to detect whitch battery is inserted, HW4X or B=
W8X for
> xt875 and EB41 for xt894 by examining the battery nvmem. If no known batt=
ery is
> detected sane defaults are used.
>=20
> Signed-off-by: Carl Philipp Klemm <philipp@uvos.xyz>
> ---
>  drivers/power/supply/cpcap-battery.c | 131 ++++++++++++++++++++-------
>  1 file changed, 98 insertions(+), 33 deletions(-)
>=20
> diff --git a/drivers/power/supply/cpcap-battery.c b/drivers/power/supply/=
cpcap-battery.c
> index 6d5bcdb9f45d..386d269e699f 100644
> --- a/drivers/power/supply/cpcap-battery.c
> +++ b/drivers/power/supply/cpcap-battery.c
> @@ -28,6 +28,7 @@
>  #include <linux/power_supply.h>
>  #include <linux/reboot.h>
>  #include <linux/regmap.h>
> +#include <linux/nvmem-consumer.h>

You need to squash PATCH 2/2 into this patch. The kernel tree should
be bisectable and this patch adds the requirement for NVMEM.

>  #include <linux/moduleparam.h>
> =20
>  #include <linux/iio/consumer.h>
> @@ -73,6 +74,9 @@
> =20
>  #define CPCAP_BATTERY_CC_SAMPLE_PERIOD_MS	250
> =20
> +#define CPCAP_BATTERY_EB41_HW4X_ID 0x9E
> +#define CPCAP_BATTERY_BW8X_ID 0x98
> +
>  enum {
>  	CPCAP_BATTERY_IIO_BATTDET,
>  	CPCAP_BATTERY_IIO_VOLTAGE,
> @@ -97,6 +101,7 @@ struct cpcap_interrupt_desc {
> =20
>  struct cpcap_battery_config {
>  	int cd_factor;
> +	char id;

id is unused?

>  	struct power_supply_info info;
>  	struct power_supply_battery_info bat;
>  };
> @@ -138,6 +143,8 @@ struct cpcap_battery_ddata {
>  	int charge_full;
>  	int status;
>  	u16 vendor;
> +	bool check_nvmem;
> +	bool no_nvmem_warned;
>  	unsigned int is_full:1;
>  };
> =20
> @@ -354,6 +361,91 @@ cpcap_battery_read_accumulated(struct cpcap_battery_=
ddata *ddata,
>  				       ccd->offset);
>  }
> =20
> +
> +/*
> + * Based on the values from Motorola mapphone Linux kernel for the
> + * stock Droid 4 battery eb41. In the Motorola mapphone Linux
> + * kernel tree the value for pm_cd_factor is passed to the kernel
> + * via device tree. If it turns out to be something device specific
> + * we can consider that too later. These values are also fine for
> + * Bionic's hw4x.
> + *
> + * And looking at the battery full and shutdown values for the stock
> + * kernel on droid 4, full is 4351000 and software initiates shutdown
> + * at 3078000. The device will die around 2743000.
> + */
> +static const struct cpcap_battery_config cpcap_battery_eb41_data =3D {
> +	.cd_factor =3D 0x3cc,
> +	.info.technology =3D POWER_SUPPLY_TECHNOLOGY_LION,
> +	.info.voltage_max_design =3D 4351000,
> +	.info.voltage_min_design =3D 3100000,
> +	.info.charge_full_design =3D 1740000,
> +	.bat.constant_charge_voltage_max_uv =3D 4200000,
> +};
> +
> +/* Values for the extended Droid Bionic battery bw8x. */
> +static const struct cpcap_battery_config cpcap_battery_bw8x_data =3D {
> +	.cd_factor =3D 0x3cc,
> +	.info.technology =3D POWER_SUPPLY_TECHNOLOGY_LION,
> +	.info.voltage_max_design =3D 4200000,
> +	.info.voltage_min_design =3D 3200000,
> +	.info.charge_full_design =3D 2760000,
> +	.bat.constant_charge_voltage_max_uv =3D 4200000,
> +};
> +
> +/*
> + * Safe values for any lipo battery likely to fit into a mapphone
> + * battery bay.
> + */
> +static const struct cpcap_battery_config cpcap_battery_unkown_data =3D {
> +	.cd_factor =3D 0x3cc,
> +	.info.technology =3D POWER_SUPPLY_TECHNOLOGY_LION,
> +	.info.voltage_max_design =3D 4200000,
> +	.info.voltage_min_design =3D 3200000,
> +	.info.charge_full_design =3D 3000000,
> +	.bat.constant_charge_voltage_max_uv =3D 4200000,
> +};
> +
> +static int cpcap_battery_match_nvmem(struct device *dev, const void *dat=
a)
> +{
> +	if (strcmp(dev_name(dev), "89-500029ba0f73") =3D=3D 0)
> +		return 1;
> +	else
> +		return 0;
> +}
> +
> +static void cpcap_battery_detect_battery_type(struct cpcap_battery_ddata=
 *ddata)
> +{
> +	struct nvmem_device *nvmem;
> +	u8 battery_id =3D 0;
> +
> +	ddata->check_nvmem =3D false;
> +
> +	nvmem =3D nvmem_device_find(NULL, &cpcap_battery_match_nvmem);
> +	if (IS_ERR_OR_NULL(nvmem)) {
> +		ddata->check_nvmem =3D true;
> +		if (!ddata->no_nvmem_warned) {
> +			dev_info(ddata->dev, "Can not find battery nvmem device. Assuming gen=
eric lipo battery\n");
> +			ddata->no_nvmem_warned =3D true;
> +		}

Please use dev_info_once() and drop no_nvmem_warned.

> +	} else if (nvmem_device_read(nvmem, 2, 1, &battery_id) < 0) {
> +		battery_id =3D 0;
> +		ddata->check_nvmem =3D true;
> +		dev_warn(ddata->dev, "Can not read battery nvmem device. Assuming gene=
ric lipo battery\n");
> +	}
> +
> +	switch (battery_id) {
> +	case CPCAP_BATTERY_EB41_HW4X_ID:
> +		memcpy(&ddata->config, &cpcap_battery_eb41_data, sizeof(ddata->config)=
);
> +		break;
> +	case CPCAP_BATTERY_BW8X_ID:
> +		memcpy(&ddata->config, &cpcap_battery_bw8x_data, sizeof(ddata->config)=
);
> +		break;
> +	default:
> +		memcpy(&ddata->config, &cpcap_battery_unkown_data, sizeof(ddata->confi=
g));
> +	}

No need to use memcpy, you can just assign the struct and get free
type checking, e.g.:

ddata->config =3D cpcap_battery_eb41_data;

> +}
> +
>  /**
>   * cpcap_battery_cc_get_avg_current - read cpcap coulumb counter
>   * @ddata: cpcap battery driver device data
> @@ -571,6 +663,9 @@ static int cpcap_battery_get_property(struct power_su=
pply *psy,
>  	latest =3D cpcap_battery_latest(ddata);
>  	previous =3D cpcap_battery_previous(ddata);
> =20
> +	if (ddata->check_nvmem)
> +		cpcap_battery_detect_battery_type(ddata);
> +
>  	switch (psp) {
>  	case POWER_SUPPLY_PROP_PRESENT:
>  		if (latest->temperature > CPCAP_NO_BATTERY || ignore_temperature_probe)
> @@ -969,30 +1064,10 @@ static int cpcap_battery_calibrate(struct cpcap_ba=
ttery_ddata *ddata)
>  	return error;
>  }
> =20
> -/*
> - * Based on the values from Motorola mapphone Linux kernel. In the
> - * the Motorola mapphone Linux kernel tree the value for pm_cd_factor
> - * is passed to the kernel via device tree. If it turns out to be
> - * something device specific we can consider that too later.
> - *
> - * And looking at the battery full and shutdown values for the stock
> - * kernel on droid 4, full is 4351000 and software initiates shutdown
> - * at 3078000. The device will die around 2743000.
> - */
> -static const struct cpcap_battery_config cpcap_battery_default_data =3D {
> -	.cd_factor =3D 0x3cc,
> -	.info.technology =3D POWER_SUPPLY_TECHNOLOGY_LION,
> -	.info.voltage_max_design =3D 4351000,
> -	.info.voltage_min_design =3D 3100000,
> -	.info.charge_full_design =3D 1740000,
> -	.bat.constant_charge_voltage_max_uv =3D 4200000,
> -};
> -
>  #ifdef CONFIG_OF
>  static const struct of_device_id cpcap_battery_id_table[] =3D {
>  	{
>  		.compatible =3D "motorola,cpcap-battery",
> -		.data =3D &cpcap_battery_default_data,
>  	},
>  	{},
>  };
> @@ -1010,31 +1085,21 @@ static const struct power_supply_desc cpcap_charg=
er_battery_desc =3D {
>  	.external_power_changed =3D cpcap_battery_external_power_changed,
>  };
> =20
> +

spurious newline.

>  static int cpcap_battery_probe(struct platform_device *pdev)
>  {
>  	struct cpcap_battery_ddata *ddata;
> -	const struct of_device_id *match;
>  	struct power_supply_config psy_cfg =3D {};
>  	int error;
> =20
> -	match =3D of_match_device(of_match_ptr(cpcap_battery_id_table),
> -				&pdev->dev);
> -	if (!match)
> -		return -EINVAL;
> -
> -	if (!match->data) {
> -		dev_err(&pdev->dev, "no configuration data found\n");
> -
> -		return -ENODEV;
> -	}
> -
>  	ddata =3D devm_kzalloc(&pdev->dev, sizeof(*ddata), GFP_KERNEL);
>  	if (!ddata)
>  		return -ENOMEM;
> =20
> +	cpcap_battery_detect_battery_type(ddata);
> +
>  	INIT_LIST_HEAD(&ddata->irq_list);
>  	ddata->dev =3D &pdev->dev;
> -	memcpy(&ddata->config, match->data, sizeof(ddata->config));
> =20
>  	ddata->reg =3D dev_get_regmap(ddata->dev->parent, NULL);
>  	if (!ddata->reg)

Otherwise LGTM.

-- Sebastian

--7nkedkmhmyd4jz3b
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAmC6IpYACgkQ2O7X88g7
+pr3vQ/8Dw4OBW4dRZyLQqdopgYCKG3nQHfYUCaP/38DhOw28Q8cseWO1p2gqh0A
WuvfW2T04FFeZhs9whflk/1/3ZFDanCxM9WviHWR+UvOzUOioc7ybmtdqApJbB26
piwHu3kuyFVcYUyoUjJ5UfYPwEZfLxJWorn4LAbmDVwhrNcr2gr9Nb5MTX5n0Yrn
iOmaycCo20lf5b8e19M4HVMl5uNe40f+TgppTD4CJrhdcZ/ELynMrMVmi0eUG8Tm
mrl6bwnq/wsVU9+PN5my5pdgLOnrPUZ/uTOhcvwNGPboks1ebSyxXDVXZLjtlQdO
MlBn4wcAhNajm41SdHhNXVMkbVkJXH95HsWyw/At0Hpawe1zBifgSd3Un/c4iKce
WITf5+iPa6KsAbCQYJeyexFYETrNnNsNC5gupnUtQ7HYvliYTYp4Z+85umChz4SS
UzZr6BGv0Av4UIiuN7qzN6unYYHvBr9KHvkFT0meApshFEYFT6vePoaT9l1WjiMs
yeTmHrVq9hMJuoTU8p5pb39s5+/SRqy/+66fneC6D6colhZgsFXVKbm8jCP2WEop
5z0yFpeFboS/Pdl8N3ThIG3RLo4yUVA9UfZMWom6wXsNLbqCBFDYlUv7BvCuW5Rl
nK581VL9ffXeN/NH3hxWMJaCh5kHXS+bvB6B3hnEwO57f300eIQ=
=JsHk
-----END PGP SIGNATURE-----

--7nkedkmhmyd4jz3b--
