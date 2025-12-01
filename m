Return-Path: <linux-omap+bounces-5095-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id BEDA9C9966D
	for <lists+linux-omap@lfdr.de>; Mon, 01 Dec 2025 23:40:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 59A3E4E2186
	for <lists+linux-omap@lfdr.de>; Mon,  1 Dec 2025 22:40:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83338284662;
	Mon,  1 Dec 2025 22:40:23 +0000 (UTC)
X-Original-To: linux-omap@vger.kernel.org
Received: from lithops.sigma-star.at (mailout.nod.at [116.203.167.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43A8379CF;
	Mon,  1 Dec 2025 22:40:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=116.203.167.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764628823; cv=none; b=LGq9Ow90wgEMuVsweM7AcpkQC6kMklzVs5W9oW+ZHgVAP6+F6zlFLOPasj3JB9draoHqzJnanzCxE/Kf3I/pgYOiCH6ByLvj2LytjA+Y0VrdARk/ToHYqW6PiYMjUqvAMCmdNryD/Ly0RDBNPkTqxDrDD7+89S2t0d4sHzHuhko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764628823; c=relaxed/simple;
	bh=GzbdnygHwWJk87qWRVmt40NqZsFkZZozdsaOyLKJPuo=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=LSip+8Ysd0Ct8Qibxy4Xs2GXsR+ht0ChvC7WF7iH8026Vjn8Rd/ygSCKGgOzvHIKG/mhSVQwkQfURkKN+YSihis9+kfM5JgVYL8S/3JT3iXDOJ7mGTQU1t7QluVqXM+COSRCfiPWU/xZ72ybFOj4e2eS9LAwJc50ex8ZhIOf348=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nod.at; spf=fail smtp.mailfrom=nod.at; arc=none smtp.client-ip=116.203.167.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nod.at
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nod.at
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id BBB292CE365;
	Mon,  1 Dec 2025 23:40:17 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id QOoWhd2BASWw; Mon,  1 Dec 2025 23:40:17 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 5F92D2CE378;
	Mon,  1 Dec 2025 23:40:17 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id mm1WchJhuFoG; Mon,  1 Dec 2025 23:40:17 +0100 (CET)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
	by lithops.sigma-star.at (Postfix) with ESMTP id 004502CE365;
	Mon,  1 Dec 2025 23:40:16 +0100 (CET)
Date: Mon, 1 Dec 2025 23:40:16 +0100 (CET)
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
Message-ID: <453565649.12135.1764628816633.JavaMail.zimbra@nod.at>
In-Reply-To: <b89cf979-b2b2-4534-a633-648dc640e3ad@kernel.org>
References: <20251129142042.344359-1-richard@nod.at> <7d9fcf24-5ad5-48cf-b36d-83025976f3aa@kernel.org> <771947541.4509.1764430418744.JavaMail.zimbra@nod.at> <8b0e2b8a-314f-40ee-8f30-c281f3799705@kernel.org> <1810160052.4618.1764431802423.JavaMail.zimbra@nod.at> <c303a5f3-4283-445e-9e0e-053fab32a468@kernel.org> <2010740416.11902.1764624886863.JavaMail.zimbra@nod.at> <b89cf979-b2b2-4534-a633-648dc640e3ad@kernel.org>
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
Thread-Index: IaxBEQt6r6rF11GTvHeDkfo8bmAWDw==

----- Urspr=C3=BCngliche Mail -----
> Von: "Krzysztof Kozlowski" <krzk@kernel.org>
>> Long story short, please tell me how to model it in DT and I'll do so.
>=20
> I already told you:
>=20
> "...we had it in several devices and fixed drivers."
>=20
> "Fix the driver. In your case, the syscon driver."
>=20
> and finally:
>=20
> "BTW, the state of existing TI DRA code is so poor that you don't have
> many choices... or rather every choice has drawbacks. If this was proper
> DTS, then I would say - define register map, used by regmap, for your
> compatible either in syscon driver or dedicated driver (thus new driver
> will be the syscon provider for you, just like Google GS101 syscon is
> special)."
>=20
> What to say more? This is the instruction/proposal.

I'm still chewing.
Let me do more research before I come back with more questions.

Thanks,
//richard

