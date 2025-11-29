Return-Path: <linux-omap+bounces-5080-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id DE1B4C941DB
	for <lists+linux-omap@lfdr.de>; Sat, 29 Nov 2025 17:02:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 884B3345A26
	for <lists+linux-omap@lfdr.de>; Sat, 29 Nov 2025 16:02:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13E67219319;
	Sat, 29 Nov 2025 16:02:06 +0000 (UTC)
X-Original-To: linux-omap@vger.kernel.org
Received: from lithops.sigma-star.at (mailout.nod.at [116.203.167.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36E3D13A3ED;
	Sat, 29 Nov 2025 16:02:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=116.203.167.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764432125; cv=none; b=Mr4qKab0RjsyhhOplIO9ngs6t7D1uIW4BN7NAW0/ZZD3t4PlFi5Eq7oL56wzMUR+DuOxVJkPYJA3oNgr7cxfOxAPhtHTOwVHKT0qFk5yLP2gzntbefQrKFADtPlRo+eaM9DG1VIvrg/3GCFV2wbmxHnNC6GFskb+wwXUiCUBWCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764432125; c=relaxed/simple;
	bh=Vq4RXFLfSmcmUkrI/ejKDbI1jdYYwhiNlDYG0uoB/BI=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=pw/j6CtABoOLYf1LWEewr2hx7al1+dAh9QLAcE4/vB408iksQvVFNAZFFCNP0mnSrbN1r/Py2IiqZh8dfO3lWk+g3reeHjcZwFC8kmlgiDw6d4SxAeN103DZdvkuUl6e1CFnw8/4X3u5RnG4y7xOgmcNjO9U59E4ffBXP+leoKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nod.at; spf=fail smtp.mailfrom=nod.at; arc=none smtp.client-ip=116.203.167.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nod.at
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nod.at
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 1CC892C14AA;
	Sat, 29 Nov 2025 17:02:02 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id TdVUt62KZZxx; Sat, 29 Nov 2025 17:02:01 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 8C7E72C14AB;
	Sat, 29 Nov 2025 17:02:01 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id XaTjt9ymWFYN; Sat, 29 Nov 2025 17:02:01 +0100 (CET)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
	by lithops.sigma-star.at (Postfix) with ESMTP id 4038F2C14AA;
	Sat, 29 Nov 2025 17:02:01 +0100 (CET)
Date: Sat, 29 Nov 2025 17:02:01 +0100 (CET)
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
Message-ID: <69585772.4633.1764432121012.JavaMail.zimbra@nod.at>
In-Reply-To: <bbf2c52f-e067-431f-a031-b173bf2f19e9@kernel.org>
References: <20251129142042.344359-1-richard@nod.at> <20251129142042.344359-5-richard@nod.at> <e775d0be-d4d8-429b-bfd1-05872f141832@kernel.org> <880768638.4519.1764430531092.JavaMail.zimbra@nod.at> <bbf2c52f-e067-431f-a031-b173bf2f19e9@kernel.org>
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
Thread-Index: sjFlvCLhpb1c13cC0qygwI5LccSSbQ==

----- Urspr=C3=BCngliche Mail -----
> Von: "Krzysztof Kozlowski" <krzk@kernel.org>
>> Okay, I didn't know that the OMAP DT is in that bad shape.
>=20
> Heh, let me give you a piece of a spoiler of my OSS Japan talk in a
> week: TI (entire TI, not individual sub-platforms) for arm32 is 0%
> compliant, meaning EVERY board has issues, and TI has THE HIGHEST total
> number of warnings of all active mainline arm32 platforms.

Oh dear. :-S
=20
> TI ARM32 status is absolutely terrible... TI ARM64 is on quite different
> side. :)
>=20
> More of hall-of-shame on 9th of December...

Let's hope this helps to motivate some TI guys.
I can help with TI platforms I have access to but I don't consider
myself an TI SoC expert to do massive refactoring of their device trees.

Thanks,
//richard

