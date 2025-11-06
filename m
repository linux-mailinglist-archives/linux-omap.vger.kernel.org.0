Return-Path: <linux-omap+bounces-4866-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8629EC39D5B
	for <lists+linux-omap@lfdr.de>; Thu, 06 Nov 2025 10:35:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EE5DB3BD957
	for <lists+linux-omap@lfdr.de>; Thu,  6 Nov 2025 09:35:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9FF2727280B;
	Thu,  6 Nov 2025 09:34:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="qCsqc/gN"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE8442FFF99
	for <linux-omap@vger.kernel.org>; Thu,  6 Nov 2025 09:34:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762421699; cv=none; b=MuNwh7iQrmz7LWYn0qcjJs4j5eSK/LEiiMy4Te9F4rbf3N/BAjcT0bqNV4DeIb/r7MeKmSu7lAgZDp8cYNGLc0JVIPeh8GHtRQydLSi7LypOor0ffpoAc8sR0J+Dj50C9JECSCztkZfekE4ndwbKm/C34byjkZZJKp8unDIXNis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762421699; c=relaxed/simple;
	bh=BcSUbe1FLBVvgu0toOxV5tGQeQD6E+zZ+WL5+xBbXLI=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bXJd1TeaHPtq46V+nz2hNvlFRXr8FrEI6zQsKJ1/4bESS7dDPsGOx+xGnnMjEd0y7kvGdR2X+E77OMgmoRVKUuyaBrOdlTzsgLVxgpid8B0r2kWd2WLpcT2+jKBPV9cv6CBe+19UXmsQlIAEB7/kK110ievufuXQEV1poznMQb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=qCsqc/gN; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 482ED1A18EF;
	Thu,  6 Nov 2025 09:34:49 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 163646068C;
	Thu,  6 Nov 2025 09:34:49 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4297F118507A6;
	Thu,  6 Nov 2025 10:34:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1762421688; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=T0xdNB7d2ITgGZMXcwNGx6G80Kkw5PtD6gU/B/S5C+E=;
	b=qCsqc/gN6+CJQIhyqUhRuKmvHVWW73kdVRuBPWDjLGyVVNrrkq9NY7ruBwVBZFI+D+II+i
	23nBi9N0azUpFtZEYIKo08gyRnEegXJrGHtFQ05a5f83mbu057iiMeTun3PkR73asIjZCg
	tF/pLrFeb5CpVKduAxcSew6kbrDcJTod7C/housywQOlJicWNJEwbhHsVdBZtHmNqjZchr
	x7nFyWYHENN5gAIdcTvnr7ZZkOcf+DU8bEN31bEYSZPG2ZWJ9ttro6x1CM47u7MobhxZwY
	+KnOpupTw5ecWG0qI2vN9yLRi9MOAUNuuny+8npjeN8h4uqaLIeyjyQLNK4vNA==
Date: Thu, 6 Nov 2025 10:34:43 +0100
From: Kory Maincent <kory.maincent@bootlin.com>
To: Andrew Davis <afd@ti.com>
Cc: <linux-omap@vger.kernel.org>, <linux-kernel@vger.kernel.org>, Bajjuri
 Praneeth <praneeth@ti.com>, Ramamoorthy Shree <s-ramamoorthy@ti.com>,
 <thomas.petazzoni@bootlin.com>, Aaro Koskinen <aaro.koskinen@iki.fi>,
 Andreas Kemnade <andreas@kemnade.info>, Kevin Hilman
 <khilman@baylibre.com>, Roger Quadros <rogerq@kernel.org>, Tony Lindgren
 <tony@atomide.com>, Lee Jones <lee@kernel.org>
Subject: Re: [PATCH] mfd: tps65219: Implement LOCK register handling for
 TPS65214
Message-ID: <20251106103443.607c8276@kmaincent-XPS-13-7390>
In-Reply-To: <cadef564-3ef2-435a-9611-ac007f32c10d@ti.com>
References: <20251105174735.1465461-1-kory.maincent@bootlin.com>
	<cadef564-3ef2-435a-9611-ac007f32c10d@ti.com>
Organization: bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3

On Wed, 5 Nov 2025 14:52:21 -0600
Andrew Davis <afd@ti.com> wrote:

> On 11/5/25 11:47 AM, Kory Maincent wrote:
> > From: "Kory Maincent (TI.com)" <kory.maincent@bootlin.com>
> >=20
> > The TPS65214 PMIC variant has a LOCK_REG register that prevents writes =
to
> > nearly all registers.
> >=20
> > Implement custom regmap operations that automatically unlock before wri=
tes
> > and re-lock afterwards for TPS65214, while leaving other chip variants
> > unaffected.
> >=20
> > The implementation follows the regmap-i2c design pattern.
> >=20
> > Signed-off-by: Kory Maincent (TI.com) <kory.maincent@bootlin.com>
> > ---
> >   drivers/mfd/tps65219.c       | 53 +++++++++++++++++++++++++++++++++++-
> >   include/linux/mfd/tps65219.h |  3 ++
> >   2 files changed, 55 insertions(+), 1 deletion(-)
> >=20
> > diff --git a/drivers/mfd/tps65219.c b/drivers/mfd/tps65219.c
> > index 65a952555218d..1d8a06afb1048 100644
> > --- a/drivers/mfd/tps65219.c
> > +++ b/drivers/mfd/tps65219.c
> > @@ -473,6 +473,55 @@ static const struct tps65219_chip_data
> > chip_info_table[] =3D { },
> >   };
> >  =20
> > +static int tps65219_reg_write(void *context, unsigned int reg, unsigned
> > int val) +{
> > +	struct i2c_client *i2c =3D context;
> > +	struct tps65219 *tps;
> > +	int ret;
> > +
> > +	if (val > 0xff || reg > 0xff)
> > +		return -EINVAL;
> > +
> > +	tps =3D i2c_get_clientdata(i2c);
> > +	if (tps->chip_id =3D=3D TPS65214) {
> > +		ret =3D i2c_smbus_write_byte_data(i2c, TPS65214_REG_LOCK,
> > +						TPS65214_LOCK_ACCESS_CMD);
> > +		if (ret)
> > +			return ret;
> > +	}
> > +
> > +	ret =3D i2c_smbus_write_byte_data(i2c, reg, val);
> > +	if (ret)
> > +		return ret;
> > +
> > +	if (tps->chip_id =3D=3D TPS65214)
> > +		return i2c_smbus_write_byte_data(i2c, TPS65214_REG_LOCK,
> > 0); +
> > +	return 0;
> > +}
> > +
> > +static int tps65219_reg_read(void *context, unsigned int reg, unsigned=
 int
> > *val) +{
> > +	struct i2c_client *i2c =3D context;
> > +	int ret;
> > +
> > +	if (reg > 0xff)
> > +		return -EINVAL;
> > +
> > +	ret =3D i2c_smbus_read_byte_data(i2c, reg);
> > +	if (ret < 0)
> > +		return ret;
> > +
> > +	*val =3D ret;
> > +
> > +	return 0;
> > +}
> > +
> > +static const struct regmap_bus tps65219_regmap_bus =3D {
> > +	.reg_write =3D tps65219_reg_write,
> > +	.reg_read =3D tps65219_reg_read,
> > +};
> > +
> >   static int tps65219_probe(struct i2c_client *client)
> >   {
> >   	struct tps65219 *tps;
> > @@ -490,8 +539,10 @@ static int tps65219_probe(struct i2c_client *clien=
t)
> >   	tps->dev =3D &client->dev;
> >   	chip_id =3D (uintptr_t)i2c_get_match_data(client);
> >   	pmic =3D &chip_info_table[chip_id];
> > +	tps->chip_id =3D chip_id;
> >  =20
> > -	tps->regmap =3D devm_regmap_init_i2c(client,
> > &tps65219_regmap_config);
> > +	tps->regmap =3D devm_regmap_init(&client->dev, &tps65219_regmap_bus,
> > client,
> > +				       &tps65219_regmap_config); =20
>=20
> Why not do the (tps->chip_id =3D=3D TPS65214) check here and only setup t=
he
> special regmap_bus for the TPS65214. Then you don't need to do the checks
> every time reg_write is called.

Yes indeed that's a better idea!

Thanks,
--=20
K=C3=B6ry Maincent, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

