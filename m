Return-Path: <linux-omap+bounces-5142-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A3F7CAF9B2
	for <lists+linux-omap@lfdr.de>; Tue, 09 Dec 2025 11:19:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C210630BC52D
	for <lists+linux-omap@lfdr.de>; Tue,  9 Dec 2025 10:15:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C14C82EB5A1;
	Tue,  9 Dec 2025 10:15:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="QOxbIGad"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3706922F01;
	Tue,  9 Dec 2025 10:15:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765275344; cv=none; b=ftNsY8QdoFtZ0u8t0fHSmOVrQylKJ+NOTcJQG/E1KeQLmRvQukeNWnDYCCUsXqEI3mTEysM+RB9pCcXXy+3HjVmgW7R+wDeTFgtQYygV/fkq7fTSPg+MP4Vney1NMJXdKLFuiKBZfWfmR0Qs6jXlkH8AbtGHD4gojzbfGXYl0IM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765275344; c=relaxed/simple;
	bh=KPjrS6GxnPYzHDMYAk6YLBITqRSwjAmUJFXSpNs2EAI=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hE//NeZDQw6Sdln69mxsC+z9U73B4KiDmwmTb8CXHzYP/p7iwrBuMwsUpQ4WGXos92WhLgadqWSmVG2qAN2/LNw7Oz1f5v7ucliYhNwqMY/14CVU0qzknccoDH8QnlA4Rg2tSCt7tWP/oSyKwPglL0RAU9IhMWPVlR4WLMcLawE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=QOxbIGad; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 8116D1A2065;
	Tue,  9 Dec 2025 10:15:40 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 4FA71606E2;
	Tue,  9 Dec 2025 10:15:40 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6A40D119303C5;
	Tue,  9 Dec 2025 11:15:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1765275339; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=4au7Cml72l2Aobo8eDvZUTdmfZek/y9FC5ZuTwey5gQ=;
	b=QOxbIGadVzDsKQpR0ymqhWpOYmOpGFmE3Oqr5CcYvGSSM5OdbEm8hC7IF5GBurQj/3TGBp
	38HLxKZnVfJUm64F+csENXDWnqcFc+Cx9MElPSt9jnNiUprkiNpKasFNGGUnFhPmWgQFhH
	hV+JAdjf/zgLN9JN0Sa0bvR+vGZtUQM9dgA0q/BagIT98GpjC8BS/p0tvEuIWmsLKQtih8
	0SkHFkpbg5KfCyatzPNAq9wZZ3A0hRfueL4JD1g5JsB/+cUMW6TzAfAOB5poPWdXFxCTwf
	Gtp75XIUm1WcCWyZ46jykdL0stwU0qgqMxrqvo3IQ4PD3iPm/osl1YcVCt9alw==
Date: Tue, 9 Dec 2025 11:15:34 +0100
From: Kory Maincent <kory.maincent@bootlin.com>
To: Kevin Hilman <khilman@baylibre.com>
Cc: Aaro Koskinen <aaro.koskinen@iki.fi>, Andreas Kemnade
 <andreas@kemnade.info>, Roger Quadros <rogerq@kernel.org>, Tony Lindgren
 <tony@atomide.com>, Lee Jones <lee@kernel.org>, Shree Ramamoorthy
 <s-ramamoorthy@ti.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Andrew Davis
 <afd@ti.com>, Bajjuri Praneeth <praneeth@ti.com>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, linux-omap@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 stable@vger.kernel.org
Subject: Re: [PATCH v4 0/2] Enable 1GHz OPP am335x-bonegreen-eco
Message-ID: <20251209111534.0f871a04@kmaincent-XPS-13-7390>
In-Reply-To: <7hsedk73ly.fsf@baylibre.com>
References: <20251112-fix_tps65219-v4-0-696a0f55d5d8@bootlin.com>
	<20251127144138.400d1dcd@kmaincent-XPS-13-7390>
	<7hsedk73ly.fsf@baylibre.com>
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

On Mon, 08 Dec 2025 19:09:45 -0800
Kevin Hilman <khilman@baylibre.com> wrote:

> Kory Maincent <kory.maincent@bootlin.com> writes:
>=20
> > On Wed, 12 Nov 2025 16:14:19 +0100
> > "Kory Maincent (TI.com)" <kory.maincent@bootlin.com> wrote:
> > =20
> >> The vdd_mpu regulator maximum voltage was previously limited to 1.2985=
V,
> >> which prevented the CPU from reaching the 1GHz operating point. This
> >> limitation was put in place because voltage changes were not working
> >> correctly, causing the board to stall when attempting higher frequenci=
es.
> >> Increase the maximum voltage to 1.3515V to allow the full 1GHz OPP to =
be
> >> used.
> >>=20
> >> Add a TPS65219 PMIC driver fixes that properly implement the LOCK regi=
ster
> >> handling, to make voltage transitions work reliably. =20
> >
> > Hello,
> >
> > What is the status on this series?
> > Is there anything that could prevent it from being merged? =20
>=20
> Nothing technical.  I'll start queuing things up after the merge window
> closes and -rc1 (or maybe -rc2) is out.

Ok, thank you!

Regards,
--=20
K=C3=B6ry Maincent, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

