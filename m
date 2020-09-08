Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 43D70260E08
	for <lists+linux-omap@lfdr.de>; Tue,  8 Sep 2020 10:51:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730104AbgIHIvQ (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 8 Sep 2020 04:51:16 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:54674 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729999AbgIHIvQ (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 8 Sep 2020 04:51:16 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 1296C1C0B7F; Tue,  8 Sep 2020 10:51:12 +0200 (CEST)
Date:   Tue, 8 Sep 2020 10:51:11 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Tony Lindgren <tony@atomide.com>
Cc:     Nick Dyer <nick@shmanahar.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Henrik Rydberg <rydberg@bitmath.org>,
        Arthur Demchenkov <spinal.by@gmail.com>,
        Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>,
        Merlijn Wajer <merlijn@wizzup.org>,
        Sebastian Reichel <sre@kernel.org>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-omap@vger.kernel.org
Subject: Re: [PATCH 1/3] Input: atmel_mxt_ts - use runtime PM instead of
 custom functions
Message-ID: <20200908085111.GA31609@duo.ucw.cz>
References: <20200318230938.31573-1-tony@atomide.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="5vNYLRcllDrimb99"
Content-Disposition: inline
In-Reply-To: <20200318230938.31573-1-tony@atomide.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org


--5vNYLRcllDrimb99
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> Let's use standard runtime PM functions instead of custom start and stop
> functions. This way we can implement runtime idle mode using runtime PM
> autosuspend in the following patches.

This is not in recent kernel. What needs to be done here?

Best regards,
								Pavel
							=09
> +++ b/drivers/input/touchscreen/atmel_mxt_ts.c
> @@ -21,6 +21,7 @@
>  #include <linux/input/mt.h>
>  #include <linux/interrupt.h>
>  #include <linux/of.h>
> +#include <linux/pm_runtime.h>
>  #include <linux/property.h>
>  #include <linux/slab.h>
>  #include <linux/gpio/consumer.h>
> @@ -2927,58 +2928,27 @@ static const struct attribute_group mxt_attr_grou=
p =3D {
>  	.attrs =3D mxt_attrs,
>  };
> =20
> -static void mxt_start(struct mxt_data *data)
> +static int mxt_input_open(struct input_dev *input_dev)
>  {
> -	switch (data->suspend_mode) {
> -	case MXT_SUSPEND_T9_CTRL:
> -		mxt_soft_reset(data);
> -
> -		/* Touch enable */
> -		/* 0x83 =3D SCANEN | RPTEN | ENABLE */
> -		mxt_write_object(data,
> -				MXT_TOUCH_MULTI_T9, MXT_T9_CTRL, 0x83);
> -		break;
> -
> -	case MXT_SUSPEND_DEEP_SLEEP:
> -	default:
> -		mxt_set_t7_power_cfg(data, MXT_POWER_CFG_RUN);
> -
> -		/* Recalibrate since chip has been in deep sleep */
> -		mxt_t6_command(data, MXT_COMMAND_CALIBRATE, 1, false);
> -		break;
> -	}
> -}
> -
> -static void mxt_stop(struct mxt_data *data)
> -{
> -	switch (data->suspend_mode) {
> -	case MXT_SUSPEND_T9_CTRL:
> -		/* Touch disable */
> -		mxt_write_object(data,
> -				MXT_TOUCH_MULTI_T9, MXT_T9_CTRL, 0);
> -		break;
> +	struct mxt_data *data =3D input_get_drvdata(input_dev);
> +	struct device *dev =3D &data->client->dev;
> +	int error;
> =20
> -	case MXT_SUSPEND_DEEP_SLEEP:
> -	default:
> -		mxt_set_t7_power_cfg(data, MXT_POWER_CFG_DEEPSLEEP);
> -		break;
> +	error =3D pm_runtime_get_sync(dev);
> +	if (error < 0) {
> +		pm_runtime_put_noidle(dev);
> +		return error;
>  	}
> -}
> -
> -static int mxt_input_open(struct input_dev *dev)
> -{
> -	struct mxt_data *data =3D input_get_drvdata(dev);
> -
> -	mxt_start(data);
> =20
>  	return 0;
>  }
> =20
> -static void mxt_input_close(struct input_dev *dev)
> +static void mxt_input_close(struct input_dev *input_dev)
>  {
> -	struct mxt_data *data =3D input_get_drvdata(dev);
> +	struct mxt_data *data =3D input_get_drvdata(input_dev);
> +	struct device *dev =3D &data->client->dev;
> =20
> -	mxt_stop(data);
> +	pm_runtime_put_sync(dev);
>  }
> =20
>  static int mxt_parse_device_properties(struct mxt_data *data)
> @@ -3036,6 +3006,7 @@ static const struct dmi_system_id chromebook_T9_sus=
pend_dmi[] =3D {
>  static int mxt_probe(struct i2c_client *client, const struct i2c_device_=
id *id)
>  {
>  	struct mxt_data *data;
> +	struct device *dev;
>  	int error;
> =20
>  	/*
> @@ -3070,6 +3041,7 @@ static int mxt_probe(struct i2c_client *client, con=
st struct i2c_device_id *id)
>  	snprintf(data->phys, sizeof(data->phys), "i2c-%u-%04x/input0",
>  		 client->adapter->nr, client->addr);
> =20
> +	dev =3D &client->dev;
>  	data->client =3D client;
>  	data->irq =3D client->irq;
>  	i2c_set_clientdata(client, data);
> @@ -3109,20 +3081,23 @@ static int mxt_probe(struct i2c_client *client, c=
onst struct i2c_device_id *id)
>  		msleep(MXT_RESET_INVALID_CHG);
>  	}
> =20
> +	pm_runtime_enable(dev);
> +
>  	error =3D mxt_initialize(data);
>  	if (error)
> -		return error;
> +		goto err_disable;
> =20
>  	error =3D sysfs_create_group(&client->dev.kobj, &mxt_attr_group);
>  	if (error) {
>  		dev_err(&client->dev, "Failure %d creating sysfs group\n",
>  			error);
> -		goto err_free_object;
> +		goto err_disable;
>  	}
> =20
>  	return 0;
> =20
> -err_free_object:
> +err_disable:
> +	pm_runtime_disable(dev);
>  	mxt_free_input_device(data);
>  	mxt_free_object_table(data);
>  	return error;
> @@ -3131,11 +3106,69 @@ static int mxt_probe(struct i2c_client *client, c=
onst struct i2c_device_id *id)
>  static int mxt_remove(struct i2c_client *client)
>  {
>  	struct mxt_data *data =3D i2c_get_clientdata(client);
> +	struct device *dev =3D &data->client->dev;
> =20
>  	disable_irq(data->irq);
>  	sysfs_remove_group(&client->dev.kobj, &mxt_attr_group);
>  	mxt_free_input_device(data);
>  	mxt_free_object_table(data);
> +	pm_runtime_disable(dev);
> +
> +	return 0;
> +}
> +
> +static int __maybe_unused mxt_runtime_suspend(struct device *dev)
> +{
> +	struct i2c_client *client =3D to_i2c_client(dev);
> +	struct mxt_data *data =3D i2c_get_clientdata(client);
> +	struct input_dev *input_dev =3D data->input_dev;
> +
> +	if (!input_dev)
> +		return 0;
> +
> +	switch (data->suspend_mode) {
> +	case MXT_SUSPEND_T9_CTRL:
> +		/* Touch disable */
> +		mxt_write_object(data,
> +				 MXT_TOUCH_MULTI_T9, MXT_T9_CTRL, 0);
> +		break;
> +
> +	case MXT_SUSPEND_DEEP_SLEEP:
> +	default:
> +		mxt_set_t7_power_cfg(data, MXT_POWER_CFG_DEEPSLEEP);
> +		break;
> +	}
> +
> +	return 0;
> +}
> +
> +static int __maybe_unused mxt_runtime_resume(struct device *dev)
> +{
> +	struct i2c_client *client =3D to_i2c_client(dev);
> +	struct mxt_data *data =3D i2c_get_clientdata(client);
> +	struct input_dev *input_dev =3D data->input_dev;
> +
> +	if (!input_dev)
> +		return 0;
> +
> +	switch (data->suspend_mode) {
> +	case MXT_SUSPEND_T9_CTRL:
> +		mxt_soft_reset(data);
> +
> +		/* Touch enable */
> +		/* 0x83 =3D SCANEN | RPTEN | ENABLE */
> +		mxt_write_object(data,
> +				 MXT_TOUCH_MULTI_T9, MXT_T9_CTRL, 0x83);
> +		break;
> +
> +	case MXT_SUSPEND_DEEP_SLEEP:
> +	default:
> +		mxt_set_t7_power_cfg(data, MXT_POWER_CFG_RUN);
> +
> +		/* Recalibrate since chip has been in deep sleep */
> +		mxt_t6_command(data, MXT_COMMAND_CALIBRATE, 1, false);
> +		break;
> +	}
> =20
>  	return 0;
>  }
> @@ -3152,7 +3185,7 @@ static int __maybe_unused mxt_suspend(struct device=
 *dev)
>  	mutex_lock(&input_dev->mutex);
> =20
>  	if (input_dev->users)
> -		mxt_stop(data);
> +		mxt_runtime_suspend(dev);
> =20
>  	mutex_unlock(&input_dev->mutex);
> =20
> @@ -3175,14 +3208,17 @@ static int __maybe_unused mxt_resume(struct devic=
e *dev)
>  	mutex_lock(&input_dev->mutex);
> =20
>  	if (input_dev->users)
> -		mxt_start(data);
> +		mxt_runtime_resume(dev);
> =20
>  	mutex_unlock(&input_dev->mutex);
> =20
>  	return 0;
>  }
> =20
> -static SIMPLE_DEV_PM_OPS(mxt_pm_ops, mxt_suspend, mxt_resume);
> +const struct dev_pm_ops mxt_pm_ops =3D {
> +	SET_SYSTEM_SLEEP_PM_OPS(mxt_suspend, mxt_resume)
> +	SET_RUNTIME_PM_OPS(mxt_runtime_suspend, mxt_runtime_resume, NULL)
> +};
> =20
>  static const struct of_device_id mxt_of_match[] =3D {
>  	{ .compatible =3D "atmel,maxtouch", },
> -

--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--5vNYLRcllDrimb99
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCX1dF/wAKCRAw5/Bqldv6
8ry4AJ9+U8VvV+Jlu52A++JvLKDnd+GRFQCgj/tHEWx8mCSlyLZF+IDhmt/qBz8=
=VlX6
-----END PGP SIGNATURE-----

--5vNYLRcllDrimb99--
