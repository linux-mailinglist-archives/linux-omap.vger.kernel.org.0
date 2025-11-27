Return-Path: <linux-omap+bounces-5062-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 90697C8D95A
	for <lists+linux-omap@lfdr.de>; Thu, 27 Nov 2025 10:38:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 1FE614E7116
	for <lists+linux-omap@lfdr.de>; Thu, 27 Nov 2025 09:38:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4FB91329C7A;
	Thu, 27 Nov 2025 09:37:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="As4k8cuN"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7A0B27FD5B
	for <linux-omap@vger.kernel.org>; Thu, 27 Nov 2025 09:37:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764236278; cv=none; b=VQo1mHq3dRxPW/TgyoMctQNE87v2wQrfkG3lPVwVIIJLBIWPxhUfzKc9zVQ+Cye3OzMAkKNxb04XCdqav1G2rRhsCB466rzwf+ayrUegICTE5jo9z6Mwc9GkMzcCaR5PyONzj3tvhd4dqqxKKCKtMXmPFBxIU1jNbLVcdeVknlo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764236278; c=relaxed/simple;
	bh=0umA7AV3QLPprkzNQBE18YPabiRf/OoQS7dKfXP9CJU=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=n30gpiaOxq6M5wtufnAfMF0AbQMywee9jY3ta72LAiXQwWrGDlCYzvhejXsIQ1ZNjrIzVGguejVUd2ewTFCdWzL91vVAfzCpGNmFlezCvaR9wDZPUAp/X9rOF3bjmiLG77dX68yIRyc31O3UcSB2NCFH6KonfeIICyW5ZiOypOU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=As4k8cuN; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 2723D4E41922;
	Thu, 27 Nov 2025 09:37:55 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id EDAD46068C;
	Thu, 27 Nov 2025 09:37:54 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4E220102F260E;
	Thu, 27 Nov 2025 10:37:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1764236273; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=L9S1rZGl/rz9YmM+17xHKDLknXmtbmaZyBYHTmnGq6Y=;
	b=As4k8cuN5pEobUrrB5p5aNhgjO75O4U+DBpJNotM5YUCxyK0GtFJZ4JzIIWdJEmCQ1PyX/
	Zp2y39HKpUoIchvF1tSu70/0a7GUdW8jtFoCOJNREtHW0x67OZXfM+cmUnVhUDoW+rzwlC
	qA3sX7z9yr4imuwTY/i/4M5dA+fAYPVgaYzJzurRGjpRcFIVx4qAz+9eFYTyryyHqHe8WU
	3vfBu/b8T96rzP4XrywexXFog2TH/83l4GEfzOouJQwTwk+0dhnDraNMm76UttUoAVNmUH
	dGQhhUfrG12gVjO74EWiTalQrmTEZa0iPtjz0M+O1hZCvSLkDvAseQCzeLQenw==
Date: Thu, 27 Nov 2025 10:37:45 +0100
From: Kory Maincent <kory.maincent@bootlin.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Jyri Sarha <jyri.sarha@iki.fi>, Tomi Valkeinen
 <tomi.valkeinen@ideasonboard.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Russell
 King <linux@armlinux.org.uk>, Bartosz Golaszewski <brgl@bgdev.pl>, Tony
 Lindgren <tony@atomide.com>, Andrzej Hajda <andrzej.hajda@intel.com>, Neil
 Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman
 <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, Markus
 Schneider-Pargmann <msp@baylibre.com>, Luca Ceresoli
 <luca.ceresoli@bootlin.com>, Louis Chauvet <louis.chauvet@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Miguel Gazquez
 <miguel.gazquez@bootlin.com>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org
Subject: Re: [PATCH 02/21] dt-bindings: display: tilcdc: Add fifo-threshold
 property
Message-ID: <20251127103745.7c5d55e6@kmaincent-XPS-13-7390>
In-Reply-To: <20251127-subtle-prophetic-corgi-68aab1@kuoka>
References: <20251126-feature_tilcdc-v1-0-49b9ef2e3aa0@bootlin.com>
	<20251126-feature_tilcdc-v1-2-49b9ef2e3aa0@bootlin.com>
	<20251127-subtle-prophetic-corgi-68aab1@kuoka>
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

On Thu, 27 Nov 2025 09:22:56 +0100
Krzysztof Kozlowski <krzk@kernel.org> wrote:

> On Wed, Nov 26, 2025 at 06:35:44PM +0100, Kory Maincent (TI.com) wrote:
> > Add the fifo-threshold property to control the DMA FIFO threshold level,
> > which specifies the number of words that must be loaded before the DMA
> > FIFO becomes ready.
> >=20
> > This property is needed to support the da850-evm board configuration
> > which requires a non-default FIFO threshold value. Currently, this value
> > is specified through the deprecated ti,tilcdc,panel binding. Adding this
> > property to the tilcdc binding allows for proper configuration while
> > migrating away from the non-standard panel binding.
> >=20
> > The default value is 8 words, with valid values being powers of 2 from
> > 8 to 512.
> >=20
> > Related commit: 55da73fa7a68c ("ARM: dts: davinci: da850-evm: Increase
> > fifo threshold") =20
>=20
> Please use syntax pointed out by checkpatch. The checkpatch error (not
> even a warning) is there for reason, so we can apply filter/grep
> easily.
>=20
> >=20
> > Signed-off-by: Kory Maincent (TI.com) <kory.maincent@bootlin.com>
> > ---
> >  Documentation/devicetree/bindings/display/tilcdc/tilcdc.yaml | 7 +++++=
++
> >  1 file changed, 7 insertions(+)
> >=20
> > diff --git a/Documentation/devicetree/bindings/display/tilcdc/tilcdc.ya=
ml
> > b/Documentation/devicetree/bindings/display/tilcdc/tilcdc.yaml index
> > 34ac1fd04d5c6..bf6d506e25e17 100644 ---
> > a/Documentation/devicetree/bindings/display/tilcdc/tilcdc.yaml +++
> > b/Documentation/devicetree/bindings/display/tilcdc/tilcdc.yaml @@ -46,6
> > +46,13 @@ properties: The maximum pixel clock that can be supported by =
the
> > lcd controller in KHz.
> > =20
> > +  fifo-threshold: =20
>=20
> Why this is not deducible from the compatible? Feels like a specific SoC
> issue.

This is indeed deductible from the compatible as ti,da850-tilcdc is only us=
e in
the related devicetree. Thanks for the pointer this will avoid adding a new=
 dt
parameter.

>=20
> Anyway, missing vendor prefix
>=20
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    enum: [8, 16, 32, 64, 128, 256, 512]
> > +    description:
> > +      Number of words loaded before the DMA fifo becomes ready. The de=
fault
> > +      value is 8. =20
>=20
> missing default and drop free form text in description.
>=20
> > +
> >    blue-and-red-wiring:
> >      enum: [straight, crossed]
> >      description:
> >=20
> > --=20
> > 2.43.0
> >  =20



--=20
K=C3=B6ry Maincent, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

