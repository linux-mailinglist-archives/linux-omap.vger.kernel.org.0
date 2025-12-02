Return-Path: <linux-omap+bounces-5100-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BB20C9B354
	for <lists+linux-omap@lfdr.de>; Tue, 02 Dec 2025 11:44:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 806393A20D3
	for <lists+linux-omap@lfdr.de>; Tue,  2 Dec 2025 10:44:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EEBF030F553;
	Tue,  2 Dec 2025 10:44:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="FtnTHSwh"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 753A3230BCC
	for <linux-omap@vger.kernel.org>; Tue,  2 Dec 2025 10:44:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764672271; cv=none; b=JteNxOcjxqYiBaLN4NEfAobs82utY6wEYCic1kELFcStx/9WJ5QcuqSAE4IrDqlHpDTMgSu0VygIwX1k2ufoofx+RvVmaameSvZPr3t9EhOEYTiIzg0gvgzL9WNg6Ody5/8pGx6ipOJUXjQkqFG9qh116Q1EGOexSl3+dVFkIMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764672271; c=relaxed/simple;
	bh=WPvw+75u2p76ML/wGeaDrFONxIod9RELjNB6w1RDLAU=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QekvCShifmzOu7eqv2SJWEbEw9qCzyOidTCCAkDdjIwO0fpPYtcI6FyPkvx9+Atzh/mNxQalkY1ACXJWj/BCLzxgDW+ZNd71P6Kn7SQyBSQ6p/Zv4DIEHPWNnYWJq7Hzm5zHKgnFfKP48173KPM7qSwSLMIFyQ7wuuQHf4sCSIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=FtnTHSwh; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id B98AC1A1EC4;
	Tue,  2 Dec 2025 10:44:27 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 7A15E606D3;
	Tue,  2 Dec 2025 10:44:27 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id CE85011919314;
	Tue,  2 Dec 2025 11:44:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1764672266; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=/WArC6OL7B5oE8PIh2iIwHlwHZM8BzUleCfIFcquPlo=;
	b=FtnTHSwh6bzVp73JDyCQFjgNMIlM5eLYd+3FXKT7elsm4qRBny30F1dBtB29Suhn3NgITk
	diL67dbtxwV+ZPjgkzDG1R71lWJ95juqtacKFa4RU8WskRM38yVS6cimNXjdODZa5F+uKr
	ov/cCVLaIGzi2a/T6Y/zf41/fM0V50MKqlOdR54nbNh2gTE4R8A51GanPP2Jh09yUkQDu7
	n67eXSZUpENq/FSdx8XqY+zmY5iiiyAdOJ+KNmYc5qif1zZs9KkJLtW7QCdaKTehC65iXZ
	CqFMog159pU4iZOSB4kdfjknae5dRsK0v4OViBEBmHYY9YvJaupvVg9xd9NB9A==
Date: Tue, 2 Dec 2025 11:44:16 +0100
From: Kory Maincent <kory.maincent@bootlin.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, Markus
 Schneider-Pargmann <msp@baylibre.com>, Luca Ceresoli
 <luca.ceresoli@bootlin.com>, Louis Chauvet <louis.chauvet@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Miguel Gazquez
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
Message-ID: <20251202114416.09624a4b@kmaincent-XPS-13-7390>
In-Reply-To: <d7515cd3-5488-4d15-82dc-d2b98cfa2bed@kernel.org>
References: <20251126-feature_tilcdc-v1-0-49b9ef2e3aa0@bootlin.com>
	<20251126-feature_tilcdc-v1-5-49b9ef2e3aa0@bootlin.com>
	<96b1b7bf-ddbe-4213-a201-dc89cf2998dd@ideasonboard.com>
	<3bc5bf92-05c3-4841-ab28-9bab2bb31cd5@kernel.org>
	<20251202104244.59a9e83d@kmaincent-XPS-13-7390>
	<d7515cd3-5488-4d15-82dc-d2b98cfa2bed@kernel.org>
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

On Tue, 2 Dec 2025 11:28:55 +0100
Krzysztof Kozlowski <krzk@kernel.org> wrote:

> On 02/12/2025 10:42, Kory Maincent wrote:
> >   =20
> >> Stuffing DTS change in the middle of the driver change tries to hide
> >> impact, which is not nice on its own. =20
> >=20
> > As it needs driver change before the removal for not breaking things it
> > can't be done at the beginning of the series. =20
>=20
> And that is the problem which should stop you there and rethink how to
> organize it without impacting users. DTS cannot go via DRM. If that was
> your intention, that's my:
>=20
> NAK

My intention was to raise discussion over the ugly and legacy tilcdc-panel
binding and what to do with it. But it seems you don't want to, that's a sh=
ame.

Regards,
--=20
K=C3=B6ry Maincent, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

