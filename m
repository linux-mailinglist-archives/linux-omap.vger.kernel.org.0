Return-Path: <linux-omap+bounces-5079-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E6C6C941C3
	for <lists+linux-omap@lfdr.de>; Sat, 29 Nov 2025 16:56:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 23C133474AC
	for <lists+linux-omap@lfdr.de>; Sat, 29 Nov 2025 15:56:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B0EB217F31;
	Sat, 29 Nov 2025 15:56:47 +0000 (UTC)
X-Original-To: linux-omap@vger.kernel.org
Received: from lithops.sigma-star.at (mailout.nod.at [116.203.167.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13997156236;
	Sat, 29 Nov 2025 15:56:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=116.203.167.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764431807; cv=none; b=r+d2SDoUU0RZCBuGg/HYIeupiq/e+Ky6I5n5epWATaGxnk6nsruwQe4i/TKG6ZsZ845UUVuxnpRay9YN32Z63XkiucjZ/Aq0/rHtjjzX+4lOGg5XBVknDYgNg6O6kFsj4dt7/WhD9McnjEBhn0CIInffD0YRqYxRzcutJb8WoHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764431807; c=relaxed/simple;
	bh=VDxtp79stW75f39QHpyjzPFMaMHWY3HXUmpciKY1Hlk=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=Tzy4QntUftOFmSj58MSIb8qk04RbD7IlLbBdG8pneHT1Os2aWnRl3Ksv/429gELpY8/FkTB1tMgAQNY85Zkb8482BgVoZAUe22x8bfdEd2KBQXGWm8yDuTf26JpKwMTssCUQo/TdMzkeH1ugRpA5T9AntHlO+fHbkS84bECrSAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nod.at; spf=fail smtp.mailfrom=nod.at; arc=none smtp.client-ip=116.203.167.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nod.at
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nod.at
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 3A5C72C14AA;
	Sat, 29 Nov 2025 16:56:43 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id Z-3cH1qonMHT; Sat, 29 Nov 2025 16:56:42 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id C049F11C05F;
	Sat, 29 Nov 2025 16:56:42 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id XCfzYpeUzcee; Sat, 29 Nov 2025 16:56:42 +0100 (CET)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
	by lithops.sigma-star.at (Postfix) with ESMTP id 8705B2ABFDC;
	Sat, 29 Nov 2025 16:56:42 +0100 (CET)
Date: Sat, 29 Nov 2025 16:56:42 +0100 (CET)
From: Richard Weinberger <richard@nod.at>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-kernel <linux-kernel@vger.kernel.org>, 
	linux-omap <linux-omap@vger.kernel.org>, 
	devicetree <devicetree@vger.kernel.org>, 
	Arnd Bergmann <arnd@arndb.de>, Lee Jones <lee@kernel.org>, 
	dakr <dakr@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Mark Brown <broonie@kernel.org>, tony <tony@atomide.com>, 
	rogerq <rogerq@kernel.org>, khilman <khilman@baylibre.com>, 
	Andreas Kemnade <andreas@kemnade.info>, 
	aaro koskinen <aaro.koskinen@iki.fi>, 
	Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, robh <robh@kernel.org>
Message-ID: <1810160052.4618.1764431802423.JavaMail.zimbra@nod.at>
In-Reply-To: <8b0e2b8a-314f-40ee-8f30-c281f3799705@kernel.org>
References: <20251129142042.344359-1-richard@nod.at> <20251129142042.344359-2-richard@nod.at> <7d9fcf24-5ad5-48cf-b36d-83025976f3aa@kernel.org> <771947541.4509.1764430418744.JavaMail.zimbra@nod.at> <8b0e2b8a-314f-40ee-8f30-c281f3799705@kernel.org>
Subject: Re: [PATCH 1/4] dt-bindings: Document new common property:
 has-inaccessible-regs
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF144 (Linux)/8.8.12_GA_3809)
Thread-Topic: dt-bindings: Document new common property: has-inaccessible-regs
Thread-Index: 9t9BQYV2+QR0bsFpSpYZSxU0i2ogtg==

----- Urspr=C3=BCngliche Mail -----
> Von: "Krzysztof Kozlowski" <krzk@kernel.org>
>> So, drivers like ti,pbias-dra7 or ti,dra7xx-phy-gmii-sel touch only regi=
sters
>> they know about and this works well.
>> But syscon manages the whole register map via regmap, and regmap exposes=
 it all
>> via debugfs.
>>=20
>> What solution do you propose?
>> Splitting reg =3D <0x0 0x1400> into many tiny fractions and not using an=
 mfd
>> anymore?
>=20
> Fix the driver. In your case, the syscon driver.

Please help me to understand what the desired behavior of the driver is.

Currently syscon creates one regmap for everything and passes this regmap
to the individual syscon users.
These users have to know what offset within the regmap is their playground.
If I understand correctly, it would be better if every syscon user would re=
gister their own regmap?

Lee, Arnd, what do you think?

Thanks,
//richard


