Return-Path: <linux-omap+bounces-5215-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 89D12CC8408
	for <lists+linux-omap@lfdr.de>; Wed, 17 Dec 2025 15:41:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 004FE30FBA09
	for <lists+linux-omap@lfdr.de>; Wed, 17 Dec 2025 14:36:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B3E4E354ACD;
	Wed, 17 Dec 2025 14:26:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="ZenrByKB"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 453C934FF6C;
	Wed, 17 Dec 2025 14:26:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765981596; cv=none; b=bVKGhkwt6AnPT/rpW/jvogc4HbGgHXG9gogU6ogOuGXJ3qHENRep0S1sKjofB+XFtMWQEIlTaWd/xm/65QozFqYWcE5e38MPu5UlR8W/6mofCIDNW8CfkIHZq+j2TcbDbnX8cY1tlMEP5Ido6ce6xzssclDaaU4YBKq1IYxKNaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765981596; c=relaxed/simple;
	bh=lIuE0WtPJvS2INuyaKV/4a3/NkoICAISHEWT1v/5f64=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=Swg0KvjYhuNvqJHGEd/2zUaRjkg+hqYICj0zteUFLPghFu5MffCmYEE6PTfn0r+UIHIFITfx3AEqDbionZzffTZXV4RvciK5reS862AdKwe9VDHIV/ZlZSkmZyNCvHw7NmihKSSyegJ/86JVaQm3OTq1lvm5gapKBWy4IycHClM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=ZenrByKB; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id E27361A2281;
	Wed, 17 Dec 2025 14:26:31 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B7D8A6072F;
	Wed, 17 Dec 2025 14:26:31 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4B086102F0AD6;
	Wed, 17 Dec 2025 15:26:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1765981586; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=LdI+WLhwoG2148T22JxuSuz6UiWPQZG056K2Vo9svR0=;
	b=ZenrByKB4riY+GKo1T8xP6/Mo8UDElSx1ICK6SOLZN83miOdDSFHFaydE0zYZ5UXZAPV25
	0546wAgP6BSD5ACbA9F26FI0aUxz5E7idXNqna2S+pOZrWuR8Xw9cQ5uF8J3i7W2izuwCF
	P7A1BViQr626iP1CwpG7zObQkDpJ5fkfTGpdUubKzxnaZXJhh6Mc+IStE1IcMUlGcMyybS
	MmrQ9HdN7ixAwdVcmebqpdqC9xW5jvF/mDiiV4GRb7mZon6O+IohZPiI5MlPrCdk3UlIG3
	Ttv/E3925xpvvK0hoNXB3OYw1dK5qMgnOFRlcBdtDZqq0LxsuEs+/F4X4l8qVQ==
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 17 Dec 2025 15:26:22 +0100
Message-Id: <DF0K83B46R5Y.387A8AWR3CDP5@bootlin.com>
Subject: Re: [PATCH v2 17/20] drm/bridge: tda998x: Move
 tda998x_create/destroy into probe and remove
Cc: "Markus Schneider-Pargmann" <msp@baylibre.com>, "Bajjuri Praneeth"
 <praneeth@ti.com>, "Louis Chauvet" <louis.chauvet@bootlin.com>, "Thomas
 Petazzoni" <thomas.petazzoni@bootlin.com>, "Miguel Gazquez"
 <miguel.gazquez@bootlin.com>, <dri-devel@lists.freedesktop.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-omap@vger.kernel.org>
To: "Kory Maincent (TI.com)" <kory.maincent@bootlin.com>, "Jyri Sarha"
 <jyri.sarha@iki.fi>, "Tomi Valkeinen" <tomi.valkeinen@ideasonboard.com>,
 "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime Ripard"
 <mripard@kernel.org>, "Thomas Zimmermann" <tzimmermann@suse.de>, "David
 Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Rob
 Herring" <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>, "Russell King"
 <linux@armlinux.org.uk>, "Bartosz Golaszewski" <brgl@bgdev.pl>, "Tony
 Lindgren" <tony@atomide.com>, "Andrzej Hajda" <andrzej.hajda@intel.com>,
 "Neil Armstrong" <neil.armstrong@linaro.org>, "Robert Foss"
 <rfoss@kernel.org>, "Laurent Pinchart" <Laurent.pinchart@ideasonboard.com>,
 "Jonas Karlman" <jonas@kwiboo.se>, "Jernej Skrabec"
 <jernej.skrabec@gmail.com>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
X-Mailer: aerc 0.20.1
References: <20251211-feature_tilcdc-v2-0-f48bac3cd33e@bootlin.com>
 <20251211-feature_tilcdc-v2-17-f48bac3cd33e@bootlin.com>
In-Reply-To: <20251211-feature_tilcdc-v2-17-f48bac3cd33e@bootlin.com>
X-Last-TLS-Session-Version: TLSv1.3

On Thu Dec 11, 2025 at 5:39 PM CET, Kory Maincent (TI.com) wrote:

Small nit:

> Now that tda998x_create and tda998x_destroy are called only in the probe
> function, there is no need for separate functions.
 ^ add "and remove" here

> Move the code into the tda998x_probe and tda998x_remove functions.
> Rewrite the cleanup path using goto calls in probe and reorder it in the
> remove function.
>
> Signed-off-by: Kory Maincent (TI.com) <kory.maincent@bootlin.com>
> ---
>  drivers/gpu/drm/bridge/tda998x_drv.c | 99 +++++++++++++++++++-----------=
------
>  1 file changed, 51 insertions(+), 48 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/tda998x_drv.c b/drivers/gpu/drm/bridg=
e/tda998x_drv.c
> index 865285ba2bd8c..4be49dd5bfc01 100644
> --- a/drivers/gpu/drm/bridge/tda998x_drv.c
> +++ b/drivers/gpu/drm/bridge/tda998x_drv.c
> @@ -1748,38 +1748,20 @@ static int tda998x_get_audio_ports(struct tda998x=
_priv *priv,
>  	return 0;
>  }
>
> -static void tda998x_destroy(struct device *dev)
> -{
> -	struct tda998x_priv *priv =3D dev_get_drvdata(dev);
> -
> -	drm_bridge_remove(&priv->bridge);
> -
> -	/* disable all IRQs and free the IRQ handler */
> -	cec_write(priv, REG_CEC_RXSHPDINTENA, 0);
> -	reg_clear(priv, REG_INT_FLAGS_2, INT_FLAGS_2_EDID_BLK_RD);
> -
> -	if (priv->audio_pdev)
> -		platform_device_unregister(priv->audio_pdev);
> -
> -	if (priv->hdmi->irq)
> -		free_irq(priv->hdmi->irq, priv);

Compared to the original code being removed...

> @@ -1956,26 +1941,44 @@ static int tda998x_create(struct device *dev)
>
>  	return 0;
>
> -fail:
> -	tda998x_destroy(dev);
> -err_irq:
> +unregister_dev:
> +	i2c_unregister_device(priv->cec);
> +notifier_conn_unregister:
> +	cec_notifier_conn_unregister(priv->cec_notify);
> +free_irq:
> +	if (client->irq) {
> +		free_irq(client->irq, priv);
> +		cec_write(priv, REG_CEC_RXSHPDINTENA, 0);
> +		reg_clear(priv, REG_INT_FLAGS_2, INT_FLAGS_2_EDID_BLK_RD);
> +	}

...here you moved free_irq() before writing registers. It should stay last,
as per free_irq() documentation.

[...]

> -static void tda998x_remove(struct i2c_client *client)
> -{
> -	tda998x_destroy(&client->dev);
> +	if (priv->audio_pdev)
> +		platform_device_unregister(priv->audio_pdev);
> +
> +	i2c_unregister_device(priv->cec);
> +
> +	cec_notifier_conn_unregister(priv->cec_notify);
> +
> +	/* disable all IRQs and free the IRQ handler */
> +	if (client->irq) {
> +		cec_write(priv, REG_CEC_RXSHPDINTENA, 0);
> +		reg_clear(priv, REG_INT_FLAGS_2, INT_FLAGS_2_EDID_BLK_RD);
> +		free_irq(priv->hdmi->irq, priv);
> +	}

Here the order is correct.

Otherwise looks good! With the above fixed and no other changes you can
add my Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

