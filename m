Return-Path: <linux-omap+bounces-5098-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id A7296C9AEB3
	for <lists+linux-omap@lfdr.de>; Tue, 02 Dec 2025 10:45:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 52DF93483A7
	for <lists+linux-omap@lfdr.de>; Tue,  2 Dec 2025 09:44:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 209DD30CDAF;
	Tue,  2 Dec 2025 09:43:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="luL3/4bR"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF3B830DEC6
	for <linux-omap@vger.kernel.org>; Tue,  2 Dec 2025 09:42:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764668580; cv=none; b=qb8HYpBIyf94deXvkHCEBbG+TJCgUMhuA7koBYfg9mmX6+ZFUD369cM2zGx99XFxib6yjZ8IPHtvDTReKwEEWY9yCK+3ZeXac2AjRYv/DPL13l7AFjhOZgECf3LGuDUl+CZnfy/rO0OoVmW+d9J8iSqNfq1DUj14a/DGrT66fyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764668580; c=relaxed/simple;
	bh=9VMtElwae+gvb7FRLkWkwNTHWFoiYVQbGclquUJ28xQ=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=T10N+qLRmNJJhv/i8y713Vgqsa0lBElWIhuNw5JdgVl5aJxfxJ39L7qKXYAcMZIdG6AFPiey21KldLzS3UnbhjSBumBzVGUsJzWOBQibVqz8RooD3sW3X3z/VpuypsuT/eHdRb9uNoRdhnBImca7vU9q3xoWlHFHcDCKpT05izw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=luL3/4bR; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id E11804E419D6;
	Tue,  2 Dec 2025 09:42:55 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id AB700606D3;
	Tue,  2 Dec 2025 09:42:55 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4D1331191926E;
	Tue,  2 Dec 2025 10:42:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1764668574; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=/nc88QLJ8slhOZGqyb1L1tn4ejxMI+zK58HeNRPD/E8=;
	b=luL3/4bRTXFIbWvIwBfEed7pUNN7/ssl5FuJjKODqCSo0tPivEZGF1V67Il+A3Yd++cPeJ
	Jg5//gi3Ff8QjsPmqcFnotj76TblUPueFxRUHphX9oUzyKB9ZZUrZZGbT1e1nFtP0xekaW
	AFgZ38nzpFtzQAkeV1fXucv8UCauxYzWUU7su/NPjHnJ+8roc8d5sgNU1PFSfsjqo3rh7x
	SXYFaEH2FuArbM3b7RLuJEth00k8dflo6mbYRHtWTxTjcmoMJsTk3YP3kJKz3eGJYj2xb0
	x4UxIxtk4gMViAXbvOLITkaZveVuMCf8XG/yPhAsbtC9Gk6tWmkpwLUYBaOBCg==
Date: Tue, 2 Dec 2025 10:42:44 +0100
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
Message-ID: <20251202104244.59a9e83d@kmaincent-XPS-13-7390>
In-Reply-To: <3bc5bf92-05c3-4841-ab28-9bab2bb31cd5@kernel.org>
References: <20251126-feature_tilcdc-v1-0-49b9ef2e3aa0@bootlin.com>
	<20251126-feature_tilcdc-v1-5-49b9ef2e3aa0@bootlin.com>
	<96b1b7bf-ddbe-4213-a201-dc89cf2998dd@ideasonboard.com>
	<3bc5bf92-05c3-4841-ab28-9bab2bb31cd5@kernel.org>
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

On Mon, 1 Dec 2025 22:46:01 +0100
Krzysztof Kozlowski <krzk@kernel.org> wrote:

> On 01/12/2025 15:13, Tomi Valkeinen wrote:
> > Hi Kory,
> >=20
> > On 26/11/2025 19:35, Kory Maincent (TI.com) wrote: =20
> >> Use panel-dpi driver instead of the deprecated tilcdc-panel driver in
> >> preparation for removing the tilcdc-panel driver and binding.
> >>
> >> Signed-off-by: Kory Maincent (TI.com) <kory.maincent@bootlin.com>
> >> ---
> >>
> >> This patch is not tested. It would be nice if someone with one of this
> >> board could test and validate it.
> >> ---
> >>  arch/arm/boot/dts/ti/davinci/da850-evm.dts    | 26
> >> +++++++++++++------------- arch/arm/boot/dts/ti/omap/am335x-guardian.d=
ts |
> >> 25 +++++++++---------------- arch/arm/boot/dts/ti/omap/am335x-pdu001.d=
ts
> >> | 21 ++++++++++----------- arch/arm/boot/dts/ti/omap/am335x-pepper.dts=
   |
> >> 22 +++++++++++----------- arch/arm/boot/dts/ti/omap/am335x-sbc-t335.dt=
s |
> >> 25 +++++++++++++------------ arch/arm/boot/dts/ti/omap/am335x-sl50.dts
> >> | 25 ++++++++++++------------- 6 files changed, 68 insertions(+), 76
> >> deletions(-)=20
> >=20
> > Doesn't this, or rather the following patches, break DTB compatibility
> > with all the above boards? =20

Yes, I know this but I still wanted to try and begin a discussion on this, =
as I
really thought it is not a good idea to add and maintain an new non-standard
panel driver solely for this tilcdc panel binding.
I have gathered more arguments on this topic on next patch.=20
=20
> Stuffing DTS change in the middle of the driver change tries to hide
> impact, which is not nice on its own.

As it needs driver change before the removal for not breaking things it can=
't
be done at the beginning of the series.

Regards,
--=20
K=C3=B6ry Maincent, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

