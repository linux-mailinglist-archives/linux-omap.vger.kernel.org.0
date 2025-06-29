Return-Path: <linux-omap+bounces-3991-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E22F4AED1A7
	for <lists+linux-omap@lfdr.de>; Mon, 30 Jun 2025 00:39:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 14EFF3B4708
	for <lists+linux-omap@lfdr.de>; Sun, 29 Jun 2025 22:38:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3195222FE08;
	Sun, 29 Jun 2025 22:39:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="aCsLkVVa"
X-Original-To: linux-omap@vger.kernel.org
Received: from relay15.mail.gandi.net (relay15.mail.gandi.net [217.70.178.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8E45207A32;
	Sun, 29 Jun 2025 22:39:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.178.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751236745; cv=none; b=eO6Jd039LVZrzfadSddDfKiVH0jUZHYB29ZxcLP9bMjGvStci+Qr+vzrdtSN7EE3MyyoiqfmCz2EVTghqUXNCWnptHNRRdjvqtJN7Leop7Tkq/fdK+sd2bEh1VkpV75X5cljhg4J+Gz6K/BfhTeRZvgtrwfiVhi+Jtc/3V5J0pk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751236745; c=relaxed/simple;
	bh=RV2Ao9LrCXX4C6ZPYabE/JoQFUM+lMGNIBm5R3kM+Pk=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FLshDJX8Y3SY9TNRq1vH/L3CIU53TG64ju7d+JScMHHHcj4fhV26L/YliWiE3AN7CmxX7dK9wpJ2QZbD1UMcptu5DQ5iznBViKR2H8hrCMoFs36Zdz66dm0WtlyuCBdslDP8FvUXuXGOkgbfSpXWK14ehaeMLXoCl/rYTPvjvy8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=aCsLkVVa; arc=none smtp.client-ip=217.70.178.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 175E04317F;
	Sun, 29 Jun 2025 22:38:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1751236740;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RV2Ao9LrCXX4C6ZPYabE/JoQFUM+lMGNIBm5R3kM+Pk=;
	b=aCsLkVVacrBB0W2vMPwzfHp6ABwHsIWFTAqQ76GXLfApfoCWhqFZQmyRAHvjCmnnVhS2DD
	m4Q9/g6XtMp8KyaIPhtCqlGFnnC/8M4Hn6QS15BpNbBAyaR3XUH0xIn6+kPwNyTo44aNPR
	WBWSx4/quo6LIN10cDpRZZnqyBI7sH/X/qD0ymt8TIx8RN8zTpDkQ4xCIEekt1gReP7DHn
	ukoJLaBOvr5DuVxQziBKzysA484Pvs+wKOhrTKAZBlUuJl5VquFMzcMqs81V1LXtIePEhx
	nn9qa5hqV3441Vrg3YqE2RDLvHY8Rq0m9bf9n/m+yUyicd2qISF3WRHXbnp6YA==
Date: Mon, 30 Jun 2025 00:38:54 +0200
From: Kory Maincent <kory.maincent@bootlin.com>
To: Tony Lindgren <tony@atomide.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Aaro Koskinen <aaro.koskinen@iki.fi>, Andreas
 Kemnade <andreas@kemnade.info>, Kevin Hilman <khilman@baylibre.com>, Roger
 Quadros <rogerq@kernel.org>, Russell King <linux@armlinux.org.uk>, Paul
 Barker <paul.barker@sancloud.com>, Marc Murphy <marc.murphy@sancloud.com>
Cc: Jason Kridner <jkridner@gmail.com>, Andrew Davis <afd@ti.com>, Bajjuri
 Praneeth <praneeth@ti.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown
 <broonie@kernel.org>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 linux-omap@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Thomas
 Bonnefille <thomas.bonnefille@bootlin.com>, Romain Gantois
 <romain.gantois@bootlin.com>, Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v5 0/5] Add support for BeagleBone Green Eco board
Message-ID: <20250630003854.79d6d9c4@kmaincent-XPS-13-7390>
In-Reply-To: <20250620-bbg-v5-0-84f9b9a2e3a8@bootlin.com>
References: <20250620-bbg-v5-0-84f9b9a2e3a8@bootlin.com>
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
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddutddtgecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkjghfohfogggtgfesthhqredtredtjeenucfhrhhomhepmfhorhihucforghinhgtvghnthcuoehkohhrhidrmhgrihhntggvnhhtsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpefguddtfeevtddugeevgfevtdfgvdfhtdeuleetffefffffhffgteekvdefudeiieenucffohhmrghinhepsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegtsgdtrgemledtieefmegtlehfvdemledvvdgrmeeltdelvgemgehfgeelmeehtddutdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggstdgrmeeltdeifeemtgelfhdvmeelvddvrgemledtlegvmeegfhegleemhedtuddtpdhhvghlohepkhhmrghinhgtvghnthdqigfrufdqudefqdejfeeltddpmhgrihhlfhhrohhmpehkohhrhidrmhgrihhntggvnhhtsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvhedprhgtphhtthhopehtohhnhiesrghtohhmihguvgdrtghomhdprhgtphhtthhopehrohgshheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepkhhriihkodgutheskhgvr
 hhnvghlrdhorhhgpdhrtghpthhtoheptghonhhorhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegrrghrohdrkhhoshhkihhnvghnsehikhhirdhfihdprhgtphhtthhopegrnhgurhgvrghssehkvghmnhgruggvrdhinhhfohdprhgtphhtthhopehkhhhilhhmrghnsegsrgihlhhisghrvgdrtghomhdprhgtphhtthhopehrohhgvghrqheskhgvrhhnvghlrdhorhhg

Le Fri, 20 Jun 2025 10:15:51 +0200,
Kory Maincent <kory.maincent@bootlin.com> a =C3=A9crit :

> SeeedStudio BeagleBone Green Eco (BBGE) is a clone of the BeagleBone Green
> (BBG). It has minor differences from the BBG, such as a different PMIC,
> a different Ethernet PHY, and a larger eMMC.
>=20
> Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>

Hello,

Any news on this patch series?

Regards,
--=20
K=C3=B6ry Maincent, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

