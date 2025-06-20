Return-Path: <linux-omap+bounces-3941-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 259A8AE1D47
	for <lists+linux-omap@lfdr.de>; Fri, 20 Jun 2025 16:26:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0FA1F5A5CCB
	for <lists+linux-omap@lfdr.de>; Fri, 20 Jun 2025 14:26:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B79EF290BB4;
	Fri, 20 Jun 2025 14:26:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="pyiYwSye"
X-Original-To: linux-omap@vger.kernel.org
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5151F28DF13;
	Fri, 20 Jun 2025 14:26:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750429584; cv=none; b=DEV7gsG7DeTlmQIEvfsWuf1BGWxzyNE2rj4TxZQrlHkITxbr6nLs+RzNZYz356mjv2oEtRA0yqTwUpxceUZGYXRmebJHiOQ5PJY212H7pNOXy/7DQoiegASML6+62SldukOM8DMu2qVE6wVy1d5KIraHJj0bda+bDhmLA57c5Qo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750429584; c=relaxed/simple;
	bh=T7hfxqmvCpIulQZg+01QJvlBj01j7zvJNa1eGn6sMpQ=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IpQWLcsbxG2Uvw9SkLkRaH8bNSDhjfr4VIbVAjb+JizXQRtmdT5xlz6tOjVAqMPUg1iLhpg0lTBahq8uaLePd0ylYZoZ++JanwAHecp4DJFS781drVXf+DUZq67+5iXNmjQJlsNW2JV63X06cW6mq8c2NUgsQOLHyd15YeTCXug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=pyiYwSye; arc=none smtp.client-ip=217.70.183.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 339FC438D4;
	Fri, 20 Jun 2025 14:26:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1750429579;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=T7hfxqmvCpIulQZg+01QJvlBj01j7zvJNa1eGn6sMpQ=;
	b=pyiYwSye7z61Bzoc2A81BmvZSwFMJ4mCZ57BIZe5j7PiT2OEVJIHro0KyO00WlSmf9dBfN
	qzof31ifNG7ulXDjRpQORBi+C4nIr1I76nZrg0P9gSMqZDh+CnhJjVrxDfkmw6nwWl05cU
	Ua9bO4wVxhuOcVLqm4Fq2UeaOSfZC3Xo3JGWNMTlvbrS+/M3kD6oHGjcxfSpgm8UPEw+lz
	ECAXaUvLmiWSV3kzGG8qGNGQ7vsAomIQzyWiMW6F3orcBvsNsf0TtA98LDJSM4Tqp1hXQw
	O1WsdETQf1biUqOJF2/4BbSgo4Q4O3lHaHZpDvSJGfmN3EgGypNtA4zzNYNfhQ==
Date: Fri, 20 Jun 2025 16:26:17 +0200
From: Kory Maincent <kory.maincent@bootlin.com>
To: Conor Dooley <conor@kernel.org>
Cc: Aaro Koskinen <aaro.koskinen@iki.fi>, Andreas Kemnade
 <andreas@kemnade.info>, Kevin Hilman <khilman@baylibre.com>, Roger Quadros
 <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Paul Barker <paul.barker@sancloud.com>, Marc Murphy
 <marc.murphy@sancloud.com>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, linux-omap@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Romain Gantois
 <romain.gantois@bootlin.com>, Thomas Bonnefille
 <thomas.bonnefille@bootlin.com>, Bajjuri Praneeth <praneeth@ti.com>, Andrew
 Davis <afd@ti.com>
Subject: Re: [PATCH 1/2] dt-bindings: omap: Add missing AM33xx compatible
 strings
Message-ID: <20250620162617.50ca0a7f@kmaincent-XPS-13-7390>
In-Reply-To: <20250620-widow-licorice-66fbd43b18b0@spud>
References: <20250620-ti_dts_clean-v1-0-786a3059bca7@bootlin.com>
	<20250620-ti_dts_clean-v1-1-786a3059bca7@bootlin.com>
	<20250620-mortally-fifteen-7a2566545a5d@spud>
	<20250620-widow-licorice-66fbd43b18b0@spud>
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
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddvgdekieegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtqhertdertdejnecuhfhrohhmpefmohhrhicuofgrihhntggvnhhtuceokhhorhihrdhmrghinhgtvghnthessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhephfduveekuedtvdeiffduleetvdegteetveetvdelteehhfeuhfegvdeuuedtleegnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghdpsghoohhtlhhinhdrtghomhenucfkphepledtrdekledrudeifedruddvjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeeltddrkeelrdduieefrdduvdejpdhhvghlohepkhhmrghinhgtvghnthdqigfrufdqudefqdejfeeltddpmhgrihhlfhhrohhmpehkohhrhidrmhgrihhntggvnhhtsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvtddprhgtphhtthhopegtohhnohhrsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegrrghrohdrkhhoshhkihhnvghnsehikhhirdhfihdprhgtphhtthhopegrnhgurhgvrghssehkvghmnhgruggvrdhinhhfohdprhgtphhtthhopehkhhhilhhmrghnsegsrgihlhhisghrvgdrtghom
 hdprhgtphhtthhopehrohhgvghrqheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepthhonhihsegrthhomhhiuggvrdgtohhmpdhrtghpthhtoheprhhosghhsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehkrhiikhdoughtsehkvghrnhgvlhdrohhrgh
X-GND-Sasl: kory.maincent@bootlin.com

Le Fri, 20 Jun 2025 15:09:41 +0100,
Conor Dooley <conor@kernel.org> a =C3=A9crit :

> On Fri, Jun 20, 2025 at 03:08:24PM +0100, Conor Dooley wrote:
> > On Fri, Jun 20, 2025 at 10:24:08AM +0200, Kory Maincent wrote: =20
> > > Add several compatible strings that were missing from the binding
> > > documentation for AM33xx-based boards. Update vendor prefix from
> > > "ti" to "beagle" for BeagleBone to match actual hardware vendors.
> > >=20
> > > Reviewed-by: Andrew Davis <afd@ti.com>
> > > Signed-off-by: Kory Maincent <kory.maincent@bootlin.com> =20
> >=20
> > This is a v1 apparently, what is the relationship between this patch and
> > https://lore.kernel.org/all/20250617-bbg-v4-1-827cbd606db6@bootlin.com/
> > ? =20
>=20
> (I ask because at a scan I didn't see differences and I had acked the
> last one, which doesn't show here even though Andrew's r-b does)

Oh, you acked-by was lost in the void during the patch series split sorry f=
or
that.

Regards,
--=20
K=C3=B6ry Maincent, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

