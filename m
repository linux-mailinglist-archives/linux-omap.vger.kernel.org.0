Return-Path: <linux-omap+bounces-5382-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C5EBBCFD197
	for <lists+linux-omap@lfdr.de>; Wed, 07 Jan 2026 11:05:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 7E26D301266D
	for <lists+linux-omap@lfdr.de>; Wed,  7 Jan 2026 10:05:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26813328270;
	Wed,  7 Jan 2026 09:57:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="2UzXf6Hc"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4064B31AAA7;
	Wed,  7 Jan 2026 09:57:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767779846; cv=none; b=V20ytukFNNPJ6MO9V6pIUQLjEb+PB4F3ERnw2gFiLxWAHtjmsrl9vj4ZR8r4cHKeM+CmzAz8hfMYfR9GncieaBvSlCqFsBCmAa5RyznUKtRijTckZBaulTLpaOSwFvdF68YNWVKVqnC9Onxq2c9Z0/hLsOH2lcVQwa0eIM3iPME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767779846; c=relaxed/simple;
	bh=bYnHbIlt6gsfOBRoMXxzBRTUqVsCEybtr8SzQBvorlI=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hy4HOFXaBpIFNdeOUSzlJluEuRPvi67TlvBwOwgE0jsH4O3cBtf4bSV8aMI8zx4+JqafKdMynmPBRcdzMcK9z3gnlCeLBmL8tqKBxyOKv8g1I8C/gq0mDM9murLgrNNENhWl2ZLeLAipJPy+6w5XabJcKBassEQVq1aWBovCiZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=2UzXf6Hc; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id B75AD4E41FCE;
	Wed,  7 Jan 2026 09:57:23 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 88429606F8;
	Wed,  7 Jan 2026 09:57:23 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E7BC0103C870F;
	Wed,  7 Jan 2026 10:57:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1767779842; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=izEt2/WHjpbUY6bvrm2DFgvpbob63v2XG6b5/OiY5fc=;
	b=2UzXf6HcDzAgbztIJOykxawHaptLE25s9Qc4dGZepcyM+1O6as1FwDlGlxF8q1micYDkff
	7bEKF3deZbVQX/7P7NDrMGD1+0+65WOFYpO/i4BrS4U6YdUeRazLG35r8Hca7NKoi8wBJo
	40RXHmUlCEO7ELu9SUIhiGLhcKW9KkAwmNkBsG8Zguj4NHDwcZL2x0uNKK/GAqHBePss3u
	7cjdQxtDhsvYllsXWbFa9/E7jKJliP1IEV8j44ADSBZB51q+SVNvV0/99LDACYipr5vr5M
	vNZAhYLEw9FSdhyjtqWuG10meoqdFiOZsl7nL3SzPnKFxAf7AFpwrgzo2y6kDw==
Date: Wed, 7 Jan 2026 10:57:11 +0100
From: Kory Maincent <kory.maincent@bootlin.com>
To: Andrew Davis <afd@ti.com>
Cc: Jyri Sarha <jyri.sarha@iki.fi>, Tomi Valkeinen
 <tomi.valkeinen@ideasonboard.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Russell
 King <linux@armlinux.org.uk>, "Bartosz Golaszewski" <brgl@bgdev.pl>, Tony
 Lindgren <tony@atomide.com>, Andrzej Hajda <andrzej.hajda@intel.com>, Neil
 Armstrong <neil.armstrong@linaro.org>, "Robert Foss" <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman
 <jonas@kwiboo.se>, "Jernej Skrabec" <jernej.skrabec@gmail.com>, Markus
 Schneider-Pargmann <msp@baylibre.com>, Bajjuri Praneeth <praneeth@ti.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>, Louis Chauvet
 <louis.chauvet@bootlin.com>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, Miguel Gazquez
 <miguel.gazquez@bootlin.com>, Herve Codina <herve.codina@bootlin.com>,
 <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-omap@vger.kernel.org>
Subject: Re: [PATCH v3 05/22] drm/tilcdc: Convert legacy panel binding via
 DT overlay at boot time
Message-ID: <20260107105711.695a9c12@kmaincent-XPS-13-7390>
In-Reply-To: <897ee11b-442c-4d09-95fa-f3cb9cec612b@ti.com>
References: <20260106-feature_tilcdc-v3-0-9bad0f742164@bootlin.com>
	<20260106-feature_tilcdc-v3-5-9bad0f742164@bootlin.com>
	<897ee11b-442c-4d09-95fa-f3cb9cec612b@ti.com>
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

On Tue, 6 Jan 2026 13:38:37 -0600
Andrew Davis <afd@ti.com> wrote:

> On 1/6/26 11:42 AM, Kory Maincent (TI.com) wrote:
> > To maintain backward compatibility while removing the deprecated
> > tilcdc_panel driver, add a tilcdc_panel_legacy subdriver that converts
> > the legacy "ti,tilcdc,panel" devicetree binding to the standard
> > panel-dpi binding at early boot.

...

> > +	dtbo_start =3D __dtbo_tilcdc_panel_legacy_begin;
> > +	dtbo_size =3D __dtbo_tilcdc_panel_legacy_end -
> > +		    __dtbo_tilcdc_panel_legacy_begin;
> > +
> > +	ret =3D of_overlay_fdt_apply(dtbo_start, dtbo_size, &ovcs_id, NULL);
> > +	if (ret)
> > +		return ret; =20
>=20
> Looking over the users of `of_overlay_fdt_apply()` they all seem
> to start with a begin and end address, then have to convert to start
> and size. I wonder if this function should be converted to just take
> begin and end addresses instead.. (not a problem for this series, just
> thinking out loud).

Indeed, I think you are right.

Regards,
--=20
K=C3=B6ry Maincent, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

