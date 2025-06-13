Return-Path: <linux-omap+bounces-3877-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C8A1AD93B6
	for <lists+linux-omap@lfdr.de>; Fri, 13 Jun 2025 19:22:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 840443A5B68
	for <lists+linux-omap@lfdr.de>; Fri, 13 Jun 2025 17:21:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2037B223DF6;
	Fri, 13 Jun 2025 17:21:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="R4LShqXi"
X-Original-To: linux-omap@vger.kernel.org
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AE242135DE;
	Fri, 13 Jun 2025 17:21:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749835309; cv=none; b=XX+DOTDdXs/XwpQcBqSNXKDc9qOIwSgVwwPveL7Zcm3jGW4cXNqnQTbn62kZsMtHh1j+nb6AS3P0FkX/AVy/Rg5jCXJa04BDkyOms+hZkM0POAXaW0kHhU7fug0vSn5MOr6uHJdghMgqDp//CJydT1ErRNnOYsO//Lrvl1hsKn0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749835309; c=relaxed/simple;
	bh=eRnKs8j9H4fFplY7rCQn3snlu+4OvYLtYMEVvRyx5C0=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qMjsEvnaDKlYymH4fOedHSknqpTRub+BrOkWMcfaqp5nnTazEOSu4WYeUKBmiGWvcnEfyf6IAa100MHFGMN1dp+MrFi81gdi98SIXaf2B6GUwt9oRpNNEjG29qbC3znVrpzIYgMQ41EzHDNMEScsyAeRr28NlidWVfL2ESUXXiY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=R4LShqXi; arc=none smtp.client-ip=217.70.183.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6E9F1439C1;
	Fri, 13 Jun 2025 17:21:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1749835305;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NFvaZPsj89bK1e6TtRA9hK2VWG2Z97VXIvjyuBUmYi8=;
	b=R4LShqXipvsxVDwypZ8S+KVkqWhF2zcN7yOVYmnFZ4hxx2Y8DOZ4uXur4lCcAQlDojkX9g
	t1EAsawwkCXD4DX0QytsDjPnRrCTMKKA2C7sLSYBYaMK9XTPv5NW/xsX9fiqeZlgamjfcM
	7Ea4r4rkM/YpFJVSVoBflTXPq09+dY3ABZGwpedgopieyujCQTQjOGNKkTASPzthHReBKS
	tfiu98+BOaIP/zYGC7GLMmUqlMzGA8uWwXjTCdEdc2RSACSRgC8VdrgCqyGr85cM3vzJ3g
	1LVCTjL2ZVcLAuJ78O/bIfPAEWL8+XVf3fJuxjktFiddNTIiEzv/PWTy5Z+qPQ==
Date: Fri, 13 Jun 2025 19:21:42 +0200
From: Kory Maincent <kory.maincent@bootlin.com>
To: Andrew Davis <afd@ti.com>
Cc: Tony Lindgren <tony@atomide.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Aaro Koskinen <aaro.koskinen@iki.fi>, Andreas
 Kemnade <andreas@kemnade.info>, Kevin Hilman <khilman@baylibre.com>, Roger
 Quadros <rogerq@kernel.org>, Russell King <linux@armlinux.org.uk>, Paul
 Barker <paul.barker@sancloud.com>, Marc Murphy <marc.murphy@sancloud.com>,
 Jason Kridner <jkridner@gmail.com>, Bajjuri Praneeth <praneeth@ti.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 <linux-omap@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v3 1/7] dt-bindings: omap: Add missing AM33xx compatible
 strings
Message-ID: <20250613192142.5077fc75@kmaincent-XPS-13-7390>
In-Reply-To: <db82d506-3d10-4f6d-a100-d29e3685ba46@ti.com>
References: <20250613-bbg-v3-0-514cdc768448@bootlin.com>
	<20250613-bbg-v3-1-514cdc768448@bootlin.com>
	<db82d506-3d10-4f6d-a100-d29e3685ba46@ti.com>
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
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugddukeehfecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkjghfohfogggtgfesthhqredtredtjeenucfhrhhomhepmfhorhihucforghinhgtvghnthcuoehkohhrhidrmhgrihhntggvnhhtsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpefguddtfeevtddugeevgfevtdfgvdfhtdeuleetffefffffhffgteekvdefudeiieenucffohhmrghinhepsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegtsgduleemkeehkeejmeejuddttdemfedttgefmeektgehsgemfhdtkegumeegfeegsgenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudelmeekheekjeemjedutddtmeeftdgtfeemkegthegsmehftdekugemgeefgegspdhhvghlohepkhhmrghinhgtvghnthdqigfrufdqudefqdejfeeltddpmhgrihhlfhhrohhmpehkohhrhidrmhgrihhntggvnhhtsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvvddprhgtphhtthhopegrfhgusehtihdrtghomhdprhgtphhtthhopehtohhnhiesrghtohhmihguvgdrtghomhdprhgtphhtthhopehrohgshheskhgvrhhnvghlrdhorhhgp
 dhrtghpthhtohepkhhriihkodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheptghonhhorhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegrrghrohdrkhhoshhkihhnvghnsehikhhirdhfihdprhgtphhtthhopegrnhgurhgvrghssehkvghmnhgruggvrdhinhhfohdprhgtphhtthhopehkhhhilhhmrghnsegsrgihlhhisghrvgdrtghomh
X-GND-Sasl: kory.maincent@bootlin.com

Le Fri, 13 Jun 2025 12:10:47 -0500,
Andrew Davis <afd@ti.com> a =C3=A9crit :

> On 6/13/25 10:49 AM, Kory Maincent wrote:
> > Add several compatible strings that were missing from the binding
> > documentation for AM33xx-based boards. Update vendor prefix from
> > "ti" to "beagle" for BeagleBone to match actual hardware vendors.
> >=20
> > Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
> > ---
> >=20
> > Change in v3:
> > - Change vendor prefix from ti to beagle
> > - Remove BeagleBone board variant description.
> >=20
> > Change in v2:
> > - New patch
> > ---
> >   Documentation/devicetree/bindings/arm/ti/omap.yaml | 22
> > +++++++++++++++++++++- 1 file changed, 21 insertions(+), 1 deletion(-)
> >=20
> > diff --git a/Documentation/devicetree/bindings/arm/ti/omap.yaml
> > b/Documentation/devicetree/bindings/arm/ti/omap.yaml index
> > 3603edd7361d..45fa1c61cafd 100644 ---
> > a/Documentation/devicetree/bindings/arm/ti/omap.yaml +++
> > b/Documentation/devicetree/bindings/arm/ti/omap.yaml @@ -104,12 +104,32=
 @@
> > properties:
> >         - description: TI AM33 based platform
> >           items:
> >             - enum:
> > +              - beagle,am335x-bone
> > +              - beagle,am335x-bone-black
> > +              - beagle,am335x-bone-black-wireless
> > +              - beagle,am335x-bone-blue
> > +              - beagle,am335x-pocketbeagle
> > +              - bosch,am335x-guardian
> >                 - compulab,cm-t335
> > +              - grinn,am335x-chiliboard
> > +              - grinn,am335x-chilisom
> > +              - gumstix,am335x-pepper
> > +              - isee,am335x-base0033
> > +              - moxa,uc-2101
> >                 - moxa,uc-8100-me-t
> > +              - myir,myc-am335x
> > +              - myir,myd-am335x
> >                 - novatech,am335x-lxm
> > -              - ti,am335x-bone
> > +              - oct,osd3358-sm-refdesign
> > +              - sancloud,am335x-boneenhanced
> > +              - seeed,am335x-bone-green
> > +              - seeed,am335x-bone-green-wireless
> > +              - tcl,am335x-sl50
> >                 - ti,am335x-evm
> > +              - ti,am335x-evmsk
> > +              - ti,am335x-shc =20
>=20
> SHC looks like a Bosch board.

Oh indeed it is, I missed that, thanks!

Regards,
--=20
K=C3=B6ry Maincent, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

