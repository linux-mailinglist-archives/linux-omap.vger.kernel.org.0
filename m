Return-Path: <linux-omap+bounces-5196-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E250CCC754B
	for <lists+linux-omap@lfdr.de>; Wed, 17 Dec 2025 12:28:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 204F931064CF
	for <lists+linux-omap@lfdr.de>; Wed, 17 Dec 2025 11:22:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7EAF32BD5A2;
	Wed, 17 Dec 2025 11:21:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="qse9XG/9"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AB5229D269
	for <linux-omap@vger.kernel.org>; Wed, 17 Dec 2025 11:21:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765970476; cv=none; b=eqaSplDPATCJYhcIw6iym5gm3Vf7bdg6+Fwph5buJ9tkOe+Y1VRk5FAJgxlZg3mT2Cdhn5Hmyce+1oqnjyfb6980XZfwygLNLiYrH4LVxgVYmC4WiIuwDKRUH1qTnh3iG0Kg0cU71OVj3GcLrFZX+YuEwnrsWNZv/P/kdSqmg9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765970476; c=relaxed/simple;
	bh=3aboTaRHePZ9/cLV+Un0CuDgzqx12bpcgopv5sDLFbw=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kZpqHwc4S+qBDdguek9af0aZn40brNvOGkCNpe27LfBv2XUo7JUF5f8pw/0WECs5eVP9C97ri8ZZhQ0c0D+LOynt13IRkIgUX9UnRZY8Om+dijThYarFH3N6wCWpsQvnsQccXksNu/fSyJXJgwprde+x4zxHeUL8E0bFciXxerA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=qse9XG/9; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id A9562C1A596;
	Wed, 17 Dec 2025 11:20:46 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 239646072F;
	Wed, 17 Dec 2025 11:21:11 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 844CC119529B3;
	Wed, 17 Dec 2025 12:20:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1765970466; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=7rXJhv3+Qdp91MsCE8T/W/8GNjfbg1aKb91evT/R+gM=;
	b=qse9XG/9paLUuioJurweKejSg4mX4HikxkqxBeBa9ofGATh93137vpqHOYGYrCujih6tgU
	OxloSCrNU5QzvnBXefcA8mQXLr99qFipZ8cQUYE8iBwwdnSgLdmzcr1dVf7vvFX0ySrsQp
	eu5ERTNU3RED3iHjBz+pT0yi9+Zf6GjLcARYYnMwakEJSw4arShcw1FtC+EG7e4ubrAHWL
	CZA6uQhwaCH+OCWzu66mey9mLqD+IgJ7twR94o0eW+1/YgJyOj82sagjDnbdjfMdeiQhHD
	ex4Dkn432559Iq5uACTuel1E872z3EUTIxB67j0qUW3lrVUs81ORkyGB7oGs1A==
Date: Wed, 17 Dec 2025 12:20:54 +0100
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
 Schneider-Pargmann <msp@baylibre.com>, Bajjuri Praneeth <praneeth@ti.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>, Louis Chauvet
 <louis.chauvet@bootlin.com>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, Miguel Gazquez
 <miguel.gazquez@bootlin.com>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org
Subject: Re: [PATCH v2 01/20] dt-bindings: display: tilcdc: Convert to DT
 schema
Message-ID: <20251217122054.4682c6dd@kmaincent-XPS-13-7390>
In-Reply-To: <20251216-capable-eccentric-nightingale-b09037@quoll>
References: <20251211-feature_tilcdc-v2-0-f48bac3cd33e@bootlin.com>
	<20251211-feature_tilcdc-v2-1-f48bac3cd33e@bootlin.com>
	<20251216-capable-eccentric-nightingale-b09037@quoll>
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

On Tue, 16 Dec 2025 07:01:49 +0100
Krzysztof Kozlowski <krzk@kernel.org> wrote:

> On Thu, Dec 11, 2025 at 05:38:45PM +0100, Kory Maincent (TI.com) wrote:
> > diff --git a/Documentation/devicetree/bindings/display/tilcdc/tilcdc.ya=
ml
> > b/Documentation/devicetree/bindings/display/tilcdc/tilcdc.yaml new file
> > mode 100644 index 0000000000000..34ac1fd04d5c6
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/display/tilcdc/tilcdc.yaml =20
>=20
> Filename based on compatible, so for example ti,am33xx-tilcdc.yaml or
> worse case ti,tilcdc.yaml (see writing bindings and writing schema docs)

Oh indeed forgot that rule. Sorry.
=20
> > @@ -0,0 +1,96 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/display/tilcdc/tilcdc.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: TI LCD Controller, found on AM335x, DA850, AM18x and OMAP-L138
> > +
> > +maintainers:
> > +  - Kory Maincent <kory.maincent@bootlin.com>
> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - ti,am33xx-tilcdc
> > +      - ti,da850-tilcdc
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  interrupts:
> > +    maxItems: 1
> > +
> > +  port:
> > +    $ref: /schemas/graph.yaml#/properties/port
> > +
> > +  ti,hwmods:
> > +    $ref: /schemas/types.yaml#/definitions/string
> > +    description:
> > +      Name of the hwmod associated to the LCDC
> > +
> > +  max-bandwidth: =20
>=20
> constraints? Is '1' valid? Is INT_MAX valid as well?

These maximums values are kind of software only check. See:
https://elixir.bootlin.com/linux/v6.18.1/source/drivers/gpu/drm/tilcdc/tilc=
dc_crtc.c#L846
but there are no mainline devicetree using it. We have to keep them because
they were present in the text binding.

I think we can still add a maximum constraint matching the tilcdc maximum
resolution value.

...

> Drop unused label. Generic node name, e.g. "display-controller" or
> "lcd-controller".

Ok, thank you for the review!

Regards,
--=20
K=C3=B6ry Maincent, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

