Return-Path: <linux-omap+bounces-4907-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F230C52570
	for <lists+linux-omap@lfdr.de>; Wed, 12 Nov 2025 13:56:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8C8721883F91
	for <lists+linux-omap@lfdr.de>; Wed, 12 Nov 2025 12:52:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5884C32C95D;
	Wed, 12 Nov 2025 12:52:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="JJCX+6L8"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36BE8330317;
	Wed, 12 Nov 2025 12:52:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762951941; cv=none; b=dOYiDU2rW9FrW+X+yRLBvaO5gLRl28hJYmxEOUS3MkWgSn5YERhQDkJp9uNPsTW8C4jA1FxrnriN7nY/6yih5JDbi4TWL6B+rQQUnWgxJUxJkUWqVn3G44qJGcmzqUA3Oc54p8R/Oz4lLhrPV5gYmafkQ9CZoCXSXTbrUSlQGs0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762951941; c=relaxed/simple;
	bh=XIZi7QICnCQAIPVE0rgrZwfPhgCJFmBbSp9UzfIZVao=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FCyScB4w3s+aw/kVmZm5C45n7uq/6VXmmqTLgolfqLUNYqecO5Ld2U/uIYghzcddD0eiJ539ZfMiF6SJAH2O7pqpjn4pDARe61ku1W0Hyqi4I5dA0I5uYOLZIHFvQ/t+0X7Up/XQA+OkBCRNqEG13rH8WPE6BMN6oUK6YGO0Ce8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=JJCX+6L8; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id D7C20C0F556;
	Wed, 12 Nov 2025 12:51:48 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 53A7A6070B;
	Wed, 12 Nov 2025 12:52:10 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 12CD2102F16E0;
	Wed, 12 Nov 2025 13:52:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1762951929; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=AYZ/cx5fZ6HcCKpGtjExhhhcWre3YYt/qaExsF1NtNw=;
	b=JJCX+6L8rNUn8S1HwGa0GHynwmndXy5LNh/UFW9QhKmhH7HR/d3ZVm/cevAjqRItHi6QmD
	QUpjUT29qs/tE1U4NRAvbYjjXRkD/BSQD13wfPTFKrfrEeGFqKdh9WSTFNAisWm339vwMz
	kQsI13fW3wCISQ9exDKFlW0EwBRZBDlhLrDnDEEPDqISlVSib18CPrnlzxDpOseC1zHqwB
	rqWxLl4hGCujJIrTOeArSQHQotTxQeCWjaqns0pDWLmgrG5K5j6ZewbFdP0KfJvLIgBCe0
	zfy8JhWoxXubkA5u0T+md4Ro4C2hq/cVenC6iXKCWB1i0DhPER8+Jv506/Ij7w==
Date: Wed, 12 Nov 2025 13:52:03 +0100
From: Kory Maincent <kory.maincent@bootlin.com>
To: Aaro Koskinen <aaro.koskinen@iki.fi>, Andreas Kemnade
 <andreas@kemnade.info>, Kevin Hilman <khilman@baylibre.com>, Roger Quadros
 <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>, Lee Jones
 <lee@kernel.org>, Shree Ramamoorthy <s-ramamoorthy@ti.com>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>
Cc: Andrew Davis <afd@ti.com>, Bajjuri Praneeth <praneeth@ti.com>, Thomas
 Petazzoni <thomas.petazzoni@bootlin.com>, linux-omap@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 stable@vger.kernel.org
Subject: Re: [PATCH v3 1/2] mfd: tps65219: Implement LOCK register handling
 for TPS65214
Message-ID: <20251112135203.4a4c4c85@kmaincent-XPS-13-7390>
In-Reply-To: <20251112-fix_tps65219-v3-1-e49bab4c01ce@bootlin.com>
References: <20251112-fix_tps65219-v3-0-e49bab4c01ce@bootlin.com>
	<20251112-fix_tps65219-v3-1-e49bab4c01ce@bootlin.com>
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

On Wed, 12 Nov 2025 10:45:24 +0100
"Kory Maincent (TI.com)" <kory.maincent@bootlin.com> wrote:

> The TPS65214 PMIC variant has a LOCK_REG register that prevents writes to
> nearly all registers.
>=20
> Implement custom regmap operations that automatically unlock before writes
> and re-lock afterwards for TPS65214, while leaving other chip variants
> unaffected.
>=20
> The implementation follows the regmap-i2c design pattern.

After some thought and internal discussions, I think it is better to unlock=
 the
registers only one time in the probe instead of adding burden in each regmap
write. I will rewrite this patch.
Shree I will remove your reviewed-by due to the change.

pw-bot: cr

>=20
> Cc: stable@vger.kernel.org
> Fixes: 7947219ab1a2d ("mfd: tps65219: Add support for TI TPS65214 PMIC")
> Reviewed-by: Shree Ramamoorthy <s-ramamoorthy@ti.com>
> Signed-off-by: Kory Maincent (TI.com) <kory.maincent@bootlin.com>
> ---
>=20
> Changes in v3:
> - Removed unused variable.
>=20
> Changes in v2:
> - Setup a custom regmap_bus only for the TPS65214 instead of checking
>   the chip_id every time reg_write is called.
> ---
>  drivers/mfd/tps65219.c       | 49
> +++++++++++++++++++++++++++++++++++++++++++- include/linux/mfd/tps65219.h=
 |
> 2 ++ 2 files changed, 50 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/mfd/tps65219.c b/drivers/mfd/tps65219.c
> index 65a952555218d..d31e808faab1f 100644
> --- a/drivers/mfd/tps65219.c
> +++ b/drivers/mfd/tps65219.c
> @@ -473,6 +473,48 @@ static const struct tps65219_chip_data chip_info_tab=
le[]
> =3D { },
>  };
> =20
> +static int tps65214_reg_write(void *context, unsigned int reg, unsigned =
int
> val) +{
> +	struct i2c_client *i2c =3D context;
> +	int ret;
> +
> +	if (val > 0xff || reg > 0xff)
> +		return -EINVAL;
> +
> +	ret =3D i2c_smbus_write_byte_data(i2c, TPS65214_REG_LOCK,
> +					TPS65214_LOCK_ACCESS_CMD);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D i2c_smbus_write_byte_data(i2c, reg, val);
> +	if (ret)
> +		return ret;
> +
> +	return i2c_smbus_write_byte_data(i2c, TPS65214_REG_LOCK, 0);
> +}
> +
> +static int tps65214_reg_read(void *context, unsigned int reg, unsigned i=
nt
> *val) +{
> +	struct i2c_client *i2c =3D context;
> +	int ret;
> +
> +	if (reg > 0xff)
> +		return -EINVAL;
> +
> +	ret =3D i2c_smbus_read_byte_data(i2c, reg);
> +	if (ret < 0)
> +		return ret;
> +
> +	*val =3D ret;
> +
> +	return 0;
> +}
> +
> +static const struct regmap_bus tps65214_regmap_bus =3D {
> +	.reg_write =3D tps65214_reg_write,
> +	.reg_read =3D tps65214_reg_read,
> +};
> +
>  static int tps65219_probe(struct i2c_client *client)
>  {
>  	struct tps65219 *tps;
> @@ -491,7 +533,12 @@ static int tps65219_probe(struct i2c_client *client)
>  	chip_id =3D (uintptr_t)i2c_get_match_data(client);
>  	pmic =3D &chip_info_table[chip_id];
> =20
> -	tps->regmap =3D devm_regmap_init_i2c(client, &tps65219_regmap_config);
> +	if (chip_id =3D=3D TPS65214)
> +		tps->regmap =3D devm_regmap_init(&client->dev,
> +					       &tps65214_regmap_bus, client,
> +					       &tps65219_regmap_config);
> +	else
> +		tps->regmap =3D devm_regmap_init_i2c(client,
> &tps65219_regmap_config); if (IS_ERR(tps->regmap)) {
>  		ret =3D PTR_ERR(tps->regmap);
>  		dev_err(tps->dev, "Failed to allocate register map: %d\n",
> ret); diff --git a/include/linux/mfd/tps65219.h b/include/linux/mfd/tps65=
219.h
> index 55234e771ba73..198ee319dd1db 100644
> --- a/include/linux/mfd/tps65219.h
> +++ b/include/linux/mfd/tps65219.h
> @@ -149,6 +149,8 @@ enum pmic_id {
>  #define TPS65215_ENABLE_LDO2_EN_MASK                    BIT(5)
>  #define TPS65214_ENABLE_LDO1_EN_MASK			BIT(5)
>  #define TPS65219_ENABLE_LDO4_EN_MASK			BIT(6)
> +/* Register Lock */
> +#define TPS65214_LOCK_ACCESS_CMD			0x5a
>  /* power ON-OFF sequence slot */
>  #define TPS65219_BUCKS_LDOS_SEQUENCE_OFF_SLOT_MASK	GENMASK(3, 0)
>  #define TPS65219_BUCKS_LDOS_SEQUENCE_ON_SLOT_MASK	GENMASK(7, 4)
>=20



--=20
K=C3=B6ry Maincent, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

