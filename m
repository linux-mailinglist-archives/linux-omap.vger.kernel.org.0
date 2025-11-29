Return-Path: <linux-omap+bounces-5075-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 99D02C9413F
	for <lists+linux-omap@lfdr.de>; Sat, 29 Nov 2025 16:35:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 06BD834790E
	for <lists+linux-omap@lfdr.de>; Sat, 29 Nov 2025 15:35:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E788F1F4262;
	Sat, 29 Nov 2025 15:35:36 +0000 (UTC)
X-Original-To: linux-omap@vger.kernel.org
Received: from lithops.sigma-star.at (mailout.nod.at [116.203.167.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01AA71A9FAC;
	Sat, 29 Nov 2025 15:35:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=116.203.167.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764430536; cv=none; b=oZQQmTTLdotnuPetPzBr5CM+JYZbckO4b1H8NfXB68y1JT6W1GmaA6CgYJELSzYrj/Ps9bbHBaBo6ciN5YXkrQDfY7duU9bOYCFeO4X9lCiCZhWJXTgbxJVLFFlkx017yivVs9+ZJRUGbTLFwc2vpi9SCS24Jf0cEJD1z7eZ9zc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764430536; c=relaxed/simple;
	bh=raRvO+qGal7+IZ9UnjCJiCYp8YFBXZGAs+PQAdDTBXA=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=urydHWsfYVJXQyRDIXFP/FITxq4BqOu47icEDn2S4/A4xAKnAHujgWmfpsEtuYhaqX//b154VVjEOv1Z661E+hybGQN3+cGS6bX2GyAZMkoYaLwOHbQ8UIfVlhxAjirLlJQiDBIVStEtBU/eXVSxpH29nXOn23SqdbASx3hsSME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nod.at; spf=fail smtp.mailfrom=nod.at; arc=none smtp.client-ip=116.203.167.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nod.at
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nod.at
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 295B92C14AA;
	Sat, 29 Nov 2025 16:35:33 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id Yxi-JcYtBMcp; Sat, 29 Nov 2025 16:35:31 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 9ECFA11C05F;
	Sat, 29 Nov 2025 16:35:31 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id vXwdCyCXh6Ow; Sat, 29 Nov 2025 16:35:31 +0100 (CET)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
	by lithops.sigma-star.at (Postfix) with ESMTP id 5B94A2ABFDC;
	Sat, 29 Nov 2025 16:35:31 +0100 (CET)
Date: Sat, 29 Nov 2025 16:35:31 +0100 (CET)
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
Message-ID: <880768638.4519.1764430531092.JavaMail.zimbra@nod.at>
In-Reply-To: <e775d0be-d4d8-429b-bfd1-05872f141832@kernel.org>
References: <20251129142042.344359-1-richard@nod.at> <20251129142042.344359-5-richard@nod.at> <e775d0be-d4d8-429b-bfd1-05872f141832@kernel.org>
Subject: Re: [PATCH 4/4] arm: dts: omap: Mark various register maps as
 dangerous
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF144 (Linux)/8.8.12_GA_3809)
Thread-Topic: omap: Mark various register maps as dangerous
Thread-Index: 2W+CvruUo9yar8W6L06fXuwjmjLqAQ==

----- Urspr=C3=BCngliche Mail -----
> Von: "Krzysztof Kozlowski" <krzk@kernel.org>
> An: "richard" <richard@nod.at>, "linux-kernel" <linux-kernel@vger.kernel.=
org>
> CC: "linux-omap" <linux-omap@vger.kernel.org>, "devicetree" <devicetree@v=
ger.kernel.org>, "Arnd Bergmann"
> <arnd@arndb.de>, "Lee Jones" <lee@kernel.org>, "dakr" <dakr@kernel.org>, =
"Rafael J. Wysocki" <rafael@kernel.org>, "Greg
> Kroah-Hartman" <gregkh@linuxfoundation.org>, "Mark Brown" <broonie@kernel=
.org>, "tony" <tony@atomide.com>, "rogerq"
> <rogerq@kernel.org>, "khilman" <khilman@baylibre.com>, "Andreas Kemnade" =
<andreas@kemnade.info>, "aaro koskinen"
> <aaro.koskinen@iki.fi>, "Conor Dooley" <conor+dt@kernel.org>, "Krzysztof =
Kozlowski" <krzk+dt@kernel.org>, "robh"
> <robh@kernel.org>
> Gesendet: Samstag, 29. November 2025 16:26:19
> Betreff: Re: [PATCH 4/4] arm: dts: omap: Mark various register maps as da=
ngerous

> On 29/11/2025 15:20, Richard Weinberger wrote:
>> index 711ce4c31bb1f..1b1f31608d37e 100644
>> --- a/arch/arm/boot/dts/ti/omap/dra7.dtsi
>> +++ b/arch/arm/boot/dts/ti/omap/dra7.dtsi
>> @@ -359,6 +359,7 @@ bandgap: bandgap@4a0021e0 {
>>  =09=09dsp1_system: dsp_system@40d00000 {
>>  =09=09=09compatible =3D "syscon";
>=20
> Oh, no no, sorry, but buggy/incomplete/legacy DT is not an excuse for
> new properties. You cannot have such compatible alone in the first place.

Okay, I didn't know that the OMAP DT is in that bad shape.
Is somebody working on a solution?

Thanks,
//richard

