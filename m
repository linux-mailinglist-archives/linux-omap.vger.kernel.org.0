Return-Path: <linux-omap+bounces-5107-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A279C9B881
	for <lists+linux-omap@lfdr.de>; Tue, 02 Dec 2025 13:56:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AE4043A7575
	for <lists+linux-omap@lfdr.de>; Tue,  2 Dec 2025 12:56:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C75543128D0;
	Tue,  2 Dec 2025 12:56:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="ffvFEagv"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E121F27E7EC;
	Tue,  2 Dec 2025 12:56:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764680182; cv=none; b=eLfFu3uQG5y6fnabEtb75JDMCX7YrUDfTw1Q2grtsLBUnfCIru7q2GgNtQ2wGX9an4S9Wj8SA171CuzxVKLyN5UAq14q6aHmZKvsTXf8Mg7vA4/LmCS8R5dJhbGJDZ2vNvkPLDcTOceAhE2hkrQraDwg+qVmt9I2cS7eA9WhI6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764680182; c=relaxed/simple;
	bh=QFgcSxDwjQGmQohC290QGXRTuVmXVyuOEalaNkjC4ws=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UEMwG8LjW1tqIBhLFv2tuSe2ZTfgjOqsOoY8N5zl8wtkBzBa13YxHqTr3Fh1zK44zxGoFg4er9F7jE4uVyhgRY9jv0Hd1KW6sP2YPLydEexfmf37/TTCp51ws0vq92VZKbPqFJzRGAiohFPbV67eZCONiCvEE8EQP74bCpuKLxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=ffvFEagv; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 28A3B1A1EC8;
	Tue,  2 Dec 2025 12:56:18 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E0331606D3;
	Tue,  2 Dec 2025 12:56:17 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id BDFCC119197A7;
	Tue,  2 Dec 2025 13:56:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1764680176; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=QFgcSxDwjQGmQohC290QGXRTuVmXVyuOEalaNkjC4ws=;
	b=ffvFEagvHMxcxYiWtdroyPQNdvLv1ifz3VFkmfX4Ma1/lCwCnkcQ1z5TloYCThJtsNEbVR
	Tl/HXf05ZSSsQobwVSpvnrzOwTaoF2ngm/scJqKUw4cv0uYRkdxjpM1gD8kqvNzOsB7587
	mJ0C7A89FtwW3hcIYb3WEx0KSbOMoDe2FjigWHBimIoYM7Y08gzh8unAKgbBlc/8Y2Ts11
	Apq5W3jhmeRmm2svhWKmIIw4sHHpyUfjA7BCBRKtOdMPEnAR6VoYOa4zbh4TFL1Dd15DKi
	1nAQwvVkD6UErGkIJJIuJwWxon9Z21z/34FWPZaLONeELfD6Cis5CRYWNdejRw==
Date: Tue, 2 Dec 2025 13:56:05 +0100
From: Kory Maincent <kory.maincent@bootlin.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Markus Schneider-Pargmann
 <msp@baylibre.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>, Louis
 Chauvet <louis.chauvet@bootlin.com>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, Miguel Gazquez
 <miguel.gazquez@bootlin.com>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org, Jyri
 Sarha <jyri.sarha@iki.fi>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Russell
 King <linux@armlinux.org.uk>, Bartosz Golaszewski <brgl@bgdev.pl>, Tony
 Lindgren <tony@atomide.com>, Andrzej Hajda <andrzej.hajda@intel.com>, Neil
 Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman
 <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: Re: [PATCH 05/21] ARM: dts: omap: Bind panel to panel-dpi instead
 of ti,tilcdc,panel driver
Message-ID: <20251202135605.053ada96@kmaincent-XPS-13-7390>
In-Reply-To: <1d9a9269-bfda-4d43-938b-2df6b82b9369@ideasonboard.com>
References: <20251126-feature_tilcdc-v1-0-49b9ef2e3aa0@bootlin.com>
	<20251126-feature_tilcdc-v1-5-49b9ef2e3aa0@bootlin.com>
	<96b1b7bf-ddbe-4213-a201-dc89cf2998dd@ideasonboard.com>
	<3bc5bf92-05c3-4841-ab28-9bab2bb31cd5@kernel.org>
	<20251202104244.59a9e83d@kmaincent-XPS-13-7390>
	<d7515cd3-5488-4d15-82dc-d2b98cfa2bed@kernel.org>
	<20251202114416.09624a4b@kmaincent-XPS-13-7390>
	<94e254fa-289d-41ed-909f-1742cfbb2690@kernel.org>
	<20251202121856.0da62885@kmaincent-XPS-13-7390>
	<1d9a9269-bfda-4d43-938b-2df6b82b9369@ideasonboard.com>
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

On Tue, 2 Dec 2025 13:51:59 +0200
Tomi Valkeinen <tomi.valkeinen@ideasonboard.com> wrote:

> Hi Kory,
>=20
> On 02/12/2025 13:18, Kory Maincent wrote:
> > On Tue, 2 Dec 2025 11:47:40 +0100
> > Krzysztof Kozlowski <krzk@kernel.org> wrote:

> I will not NAK, removing bindings and breaking users is under some
> conditions acceptable. You just need to come with the reasons and impact.
>=20
> Reason "is ugly" is usually not good enough. Especially if things were
> working.

Thanks for you reply.

> >>
> >> DTS cannot go to drm, which means you either need to separate the chan=
ge
> >> and make entire work bisectable and backwards compatible for some time
> >> OR at least document clearly the impact as we always ask. =20
> >=20
> > The thing is, if I split it, it has to be in 3. One for the of DRM bus =
flags
> > support, a second for the the devicetree and binding change and a third=
 for
> > the whole tilcdc and tda998x cleaning stuff. I think I will go for one
> > series, with better documentation.
> >=20
> > Now, what is your point of view on my question. Will you nak any binding
> > removal even if the binding is ugly and legacy and imply maintaining an
> > non-standard tilcdc panel driver? I know it breaks DTB compatibility but
> > there is several argument to not keep it. See patch 6. =20
> The binding being ugly and having to maintain non-standard tilcdc panel
> driver may be nice things for us, the users don't care. The users care
> if their board no longer works.

Yes I understand but then I have another question. At what cost should we
continue to support legacy binding?

Just figured out this case already happened, ti,tilcdc,slave binding was
removed from the tilcdc driver:
739acd85ffdb7 ("drm/tilcdc: Remove obsolete "ti,tilcdc,slave" dts binding
support")

Even if there is still one mainline device tree that uses it:
am335x-base0033.dts. :/

> And how does this sync with u-boot? It also has code for at least for a
> few of these boards.

U-boot has indeed a driver for the ti,tilcdc,panel binding.
Changing this devicetree would beak display for these board in U-boot as it
currently does not support the "panel-dpi" binding.

> Are there even users for these boards? If not, maybe they can be just
> removed? I'm personally not familiar with these boards, so I have no
> idea of their age or distribution.

These boards are quite old (>10 years) but I don't know if they are still u=
sed
by people. After a quick look they seem not available on the market.

> One trick that can be done is to modify the loaded DTB at boot time,
> detecting the old format, converting it to the new one, so that when the
> drivers are probed they only see the new DTB.

Yes, indeed that could do the trick. The things is, I don't have one of
theses board to test it. I will try to look for an other way to test it.

Regards,
--=20
K=C3=B6ry Maincent, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

