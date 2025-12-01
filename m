Return-Path: <linux-omap+bounces-5092-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ECCB7C992F3
	for <lists+linux-omap@lfdr.de>; Mon, 01 Dec 2025 22:35:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ABD323A47F7
	for <lists+linux-omap@lfdr.de>; Mon,  1 Dec 2025 21:35:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CDD47274FEF;
	Mon,  1 Dec 2025 21:35:00 +0000 (UTC)
X-Original-To: linux-omap@vger.kernel.org
Received: from lithops.sigma-star.at (mailout.nod.at [116.203.167.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8027D1E3DED;
	Mon,  1 Dec 2025 21:34:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=116.203.167.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764624900; cv=none; b=qYIrMO1We2/e+yBdvbMUAzyWeNxgDwQWXq/VuFWvSnRs24CCi4i+S2Q1+hoIMzYiqsfqE8F/9z8eqT9ePY2xaATj7aVmAiOmmS5bg3O7CKrLsJU6OhUEkfMPcNK4gKmopgpqAF4RzB6MuV7FFoCwwQ8en2CTpqIkyIfimZU0h70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764624900; c=relaxed/simple;
	bh=zwfk/25xOFSDWC2KwAr9y83Wr04bK1M28Zaxfy2HmdA=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=k/VtA0LquwlTl0EydLMbPaUUbBj84Hz6xG082cn9wxWHzyaQWz2o/R9gGqsBW+HIJbOGOLAvbGnaEKEwdmiGpSzz11J6yLBUJGFPBUM74K6L2FsxCmivnsEsgInANCR8ke+gZ8j9euAD+S1fnBU6Lq5cpAzR5j2S7/fgq2WGM4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nod.at; spf=fail smtp.mailfrom=nod.at; arc=none smtp.client-ip=116.203.167.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nod.at
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nod.at
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id C7E7B11C038;
	Mon,  1 Dec 2025 22:34:48 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id wlcMB6fWRIpW; Mon,  1 Dec 2025 22:34:47 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 5288C2ABFDC;
	Mon,  1 Dec 2025 22:34:47 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id SI9weaq8LT06; Mon,  1 Dec 2025 22:34:47 +0100 (CET)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
	by lithops.sigma-star.at (Postfix) with ESMTP id 126D411C038;
	Mon,  1 Dec 2025 22:34:47 +0100 (CET)
Date: Mon, 1 Dec 2025 22:34:46 +0100 (CET)
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
Message-ID: <2010740416.11902.1764624886863.JavaMail.zimbra@nod.at>
In-Reply-To: <c303a5f3-4283-445e-9e0e-053fab32a468@kernel.org>
References: <20251129142042.344359-1-richard@nod.at> <20251129142042.344359-2-richard@nod.at> <7d9fcf24-5ad5-48cf-b36d-83025976f3aa@kernel.org> <771947541.4509.1764430418744.JavaMail.zimbra@nod.at> <8b0e2b8a-314f-40ee-8f30-c281f3799705@kernel.org> <1810160052.4618.1764431802423.JavaMail.zimbra@nod.at> <c303a5f3-4283-445e-9e0e-053fab32a468@kernel.org>
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
Thread-Index: pQQN9ocrW7HjRbxVTVNaLA3sT0UvTg==

----- Urspr=C3=BCngliche Mail -----
> Von: "Krzysztof Kozlowski" <krzk@kernel.org>
>>>> What solution do you propose?
>>>> Splitting reg =3D <0x0 0x1400> into many tiny fractions and not using =
an mfd
>>>> anymore?
>>>
>>> Fix the driver. In your case, the syscon driver.
>>=20
>> Please help me to understand what the desired behavior of the driver is.
>>=20
>> Currently syscon creates one regmap for everything and passes this regma=
p
>> to the individual syscon users.
>> These users have to know what offset within the regmap is their playgrou=
nd.
>> If I understand correctly, it would be better if every syscon user would
>> register their own regmap?
>=20
> I don't think so. This device driver, so the syscon, creates the regmap
> and knows EXACTLY which registers are valid or not. It is not
> responsibility of the consumer to tell the syscon what this syscon is.
> Syscon knows that...

How to configure this in syscon?
AFAIK it takes only a single reg property.
Are you suggesting to add many more syscon nodes to the DT to skip the hole=
s?

Currently the scm_conf@0 DT node defines the first 0x1400 bytes
of the CTRL_MODULE_CORE register[0].

Reading from register 0x180 triggers an async data abort here.
The manual describes it as "RESERVED" of type "R".
Lots of other offsets in CTRL_MODULE_CORE are reserved, but reading works.

Long story short, please tell me how to model it in DT and I'll do so.

Thanks,
//richard

[0] https://www.ti.com/lit/ug/spruhz6l/spruhz6l.pdf 18.5.2.1 CTRL_MODULE_CO=
RE Register Summary

