Return-Path: <linux-omap+bounces-5166-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 42C64CB561D
	for <lists+linux-omap@lfdr.de>; Thu, 11 Dec 2025 10:41:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7DD6330191B9
	for <lists+linux-omap@lfdr.de>; Thu, 11 Dec 2025 09:40:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 996CE2FB09A;
	Thu, 11 Dec 2025 09:40:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="N8BY+0RW"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E7622F8BD0;
	Thu, 11 Dec 2025 09:40:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765446040; cv=none; b=OHw0ygYMpk9Xif204jFSxuCK344AFME4KvrAFFbg/cqUJMQI5E99eHkCN7i3R/rB4YbHc/cgF+eMJEWUBFcbuyAQBCPPIXmyB8DK0dXWaYCp8qbfeq7ceTQUtGumiWBQucRcKlPoF7Ks+U47IehsjLwRgWrF6YyTCdY7DDCUSWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765446040; c=relaxed/simple;
	bh=Ix9SgrqDz4o3q5W0m+YSAf0FGjexUuirXLqG6HMqDi4=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ifo7KgdZZVo8JRkQTyhAKzlSlpFqZJkpupofSbDrFUslxJ4OCFJn9t40zD0rlB3hfzK6nvFT8s+S7xQ/BURhcRjYiZqRANd+dtVKNyDk+7+6Ez/lsajSAlyQyddGUgoO9rR0ksKxCRXmGJaeccf2JfVClPpVGK3xkiO5uaqTeGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=N8BY+0RW; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 17D594E41B6D;
	Thu, 11 Dec 2025 09:40:34 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id DF0096068C;
	Thu, 11 Dec 2025 09:40:33 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 14F2B103C8D53;
	Thu, 11 Dec 2025 10:40:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1765446032; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=WZVCcNfKSTt2Hd14gUawnCXPs39wl8U5m2GxT9YHICY=;
	b=N8BY+0RW1/KCWSmz1ejzT8wkU32hMHoROWuSW1FXKVX56lJPTLnrOG87aYRBJX3eLmwdQz
	ElonbiZKTB2yohpJE+9k8TDVw2t9dMGuu4ov3c9BVvflGTXLZViwe/G9lROCs1KMjA5Cg1
	HqAOW3glYucmbg2jWQCfC+vmSqV0f3bRAfIGwFYLKzsrZIZn5PifwpK4SdhZWFCK8zSDep
	NJinbhnm5mFm/zI9m2xrgrfv6TFXNgAyWJZmSCZG+MROAk2te2haBPin+EoimEwAAmRl4c
	665fBJnGyGTn7KpP/dBIwnBN6Ey1VxFEPONWoRQP8/KCoFPe22GeYDOR7es8FA==
Date: Thu, 11 Dec 2025 10:40:24 +0100
From: Kory Maincent <kory.maincent@bootlin.com>
To: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Cc: "Jyri Sarha" <jyri.sarha@iki.fi>, "Tomi Valkeinen"
 <tomi.valkeinen@ideasonboard.com>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Rob Herring"
 <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, "Russell King" <linux@armlinux.org.uk>,
 "Bartosz Golaszewski" <brgl@bgdev.pl>, "Tony Lindgren" <tony@atomide.com>,
 "Andrzej Hajda" <andrzej.hajda@intel.com>, "Neil Armstrong"
 <neil.armstrong@linaro.org>, "Robert Foss" <rfoss@kernel.org>, "Laurent
 Pinchart" <Laurent.pinchart@ideasonboard.com>, "Jonas Karlman"
 <jonas@kwiboo.se>, "Jernej Skrabec" <jernej.skrabec@gmail.com>, "Markus
 Schneider-Pargmann" <msp@baylibre.com>, "Louis Chauvet"
 <louis.chauvet@bootlin.com>, "Thomas Petazzoni"
 <thomas.petazzoni@bootlin.com>, "Miguel Gazquez"
 <miguel.gazquez@bootlin.com>, <dri-devel@lists.freedesktop.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-omap@vger.kernel.org>
Subject: Re: [PATCH 03/21] drm/tilcdc: Remove simulate_vesa_sync flag
Message-ID: <20251211104024.1e7d5c42@kmaincent-XPS-13-7390>
In-Reply-To: <DEUQM2HNEOQU.3K4ZPL44GVZAJ@bootlin.com>
References: <20251126-feature_tilcdc-v1-0-49b9ef2e3aa0@bootlin.com>
	<20251126-feature_tilcdc-v1-3-49b9ef2e3aa0@bootlin.com>
	<DEUQM2HNEOQU.3K4ZPL44GVZAJ@bootlin.com>
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

On Wed, 10 Dec 2025 19:10:45 +0100
"Luca Ceresoli" <luca.ceresoli@bootlin.com> wrote:

> Hi K=C3=B6ry,
>=20
> On Wed Nov 26, 2025 at 6:35 PM CET, Kory Maincent (TI.com) wrote:
> > The tilcdc hardware does not generate VESA-compliant sync signals. It
> > aligns the vertical sync (VS) on the second edge of the horizontal sync
> > (HS) instead of the first edge. To compensate for this hardware
> > behavior, the driver applies a timing adjustment in mode_fixup().
> >
> > Previously, this adjustment was conditional based on the simulate_vesa_=
sync
> > flag, which was only set when using external encoders. This appears
> > problematic because:
> >
> > 1. The timing adjustment seems needed for the hardware behavior regardl=
ess
> >    of whether an external encoder is used
> > 2. The external encoder infrastructure is driver-specific and being
> >    removed due to design issues
> > 3. Boards using tilcdc without bridges (e.g., am335x-evm, am335x-evmsk)
> >    may not be getting the necessary timing adjustments
> >
> > Remove the simulate_vesa_sync flag and apply the VESA sync timing
> > adjustment unconditionally, ensuring consistent behavior across all
> > configurations. While it's unclear if the previous conditional behavior
> > was causing actual issues, the unconditional adjustment better reflects
> > the hardware's characteristics.
> >
> > Signed-off-by: Kory Maincent (TI.com) <kory.maincent@bootlin.com>
> > ---
> >
> > Only few board currently use tilcdc not associated to a bridge like the
> > am335x_evm or the am335x-evmsk. =20
>=20
> Have you tested this change on any affected board?
>=20
> The change looks good to me but without some testing it would be risky.

I have tested it on few boards but not these mainline devicetree as I don't
have them.

I have tested a tilcdc with tda998x bridge (BeagleBone Black), a tilcdc with
ti,tilcdc,panel panel (BeagleBone with LCD cape), a tilcdc with it66121 bri=
dge
(new Beagle Bone Green Eco board with HDMI cape).
That's all the boards I have.

Regards,
--=20
K=C3=B6ry Maincent, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

