Return-Path: <linux-omap+bounces-5081-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 55914C9445F
	for <lists+linux-omap@lfdr.de>; Sat, 29 Nov 2025 17:48:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id CAEC7345C39
	for <lists+linux-omap@lfdr.de>; Sat, 29 Nov 2025 16:48:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4274B30EF6C;
	Sat, 29 Nov 2025 16:48:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b="0Ne7sPiO"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail.andi.de1.cc (mail.andi.de1.cc [178.238.236.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60B561D86FF;
	Sat, 29 Nov 2025 16:48:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.238.236.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764434922; cv=none; b=hgQ6PI8T21ayn3lx5Oi17NynYoDN6n6MzGJMNZSdVzgcUjBW1bgz8m8odY7E03vYavc5BNbtplP5HRfxVSQQTeSfKtVgTViXG+zXpcPq8/vnnDImBC7R0NDeRz6uE1FdLjiihARmK4V9+WQLFZpTUQAn6fbreA4Iym7VmS2//m4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764434922; c=relaxed/simple;
	bh=sOAHrrgHAyO4w7Ijp3L4p3syT2JCAl5IRTdOkCBZAtM=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HHYGjtaktfCFfN59azNs6bkC2U4ls432Xw+c7eUoA++xAKgMlLVRr+3jbunhb9SVx4qUbjX4xqDhPRrwDWI4vjZkTSlNyTQHiF2tNUchiHWDdZrkKOwFmDXW2aw6NGVsRLrM91NpImCCOU6mlcytlzMvpN5yfEo/t5sqk8dxVHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info; spf=pass smtp.mailfrom=kemnade.info; dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b=0Ne7sPiO; arc=none smtp.client-ip=178.238.236.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=References:In-Reply-To:Cc:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=K6gYjzHJGtIqPzSDgYsPh3z8hnBEjmiE7+2EUwaHRqg=; b=0Ne7sPiOGQTEjH/fFpy7RdReBk
	ulMQxcAGAP4zs67PpDgl0ubIxoLfsi9SeJp8TesSjVYpHqg6A+kG4XcsVFCzkKaj9D2vULc0GGWB7
	1yvB6oiBjoQWTH2s6uMH30Zn7Wb1M8DNbbXG+/JoyWizEU2uU6VcrAaWAMKoDr80ZjQZ4ZAXdA3gh
	VhA0BBPdnQkKs3hoyRmmaz/+N7g6+Hqk3KZ36Jzm4LsKW8WJss5cG5BSCFT9BM6MiL2L3kWnk3vDy
	2rcM6Ypzz1I+eHzRCA+tf277RfOCMJ6B4MkZwrX9/BilSg43TOfPUr5/T/iTL2/zpKzkl0uzgeJHJ
	ZkUPszdQ==;
Date: Sat, 29 Nov 2025 17:48:33 +0100
From: Andreas Kemnade <andreas@kemnade.info>
To: Richard Weinberger <richard@nod.at>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-kernel
 <linux-kernel@vger.kernel.org>, linux-omap <linux-omap@vger.kernel.org>,
 devicetree <devicetree@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, Lee
 Jones <lee@kernel.org>, dakr <dakr@kernel.org>, "Rafael J. Wysocki"
 <rafael@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Mark
 Brown <broonie@kernel.org>, tony <tony@atomide.com>, rogerq
 <rogerq@kernel.org>, khilman <khilman@baylibre.com>, aaro koskinen
 <aaro.koskinen@iki.fi>, Conor Dooley <conor+dt@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, robh <robh@kernel.org>
Subject: Re: [PATCH 4/4] arm: dts: omap: Mark various register maps as
 dangerous
Message-ID: <20251129174833.24b9356c@kemnade.info>
In-Reply-To: <880768638.4519.1764430531092.JavaMail.zimbra@nod.at>
References: <20251129142042.344359-1-richard@nod.at>
	<20251129142042.344359-5-richard@nod.at>
	<e775d0be-d4d8-429b-bfd1-05872f141832@kernel.org>
	<880768638.4519.1764430531092.JavaMail.zimbra@nod.at>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; aarch64-unknown-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Sat, 29 Nov 2025 16:35:31 +0100 (CET)
Richard Weinberger <richard@nod.at> wrote:

> ----- Urspr=C3=BCngliche Mail -----
> > Von: "Krzysztof Kozlowski" <krzk@kernel.org>
> > An: "richard" <richard@nod.at>, "linux-kernel" <linux-kernel@vger.kerne=
l.org>
> > CC: "linux-omap" <linux-omap@vger.kernel.org>, "devicetree" <devicetree=
@vger.kernel.org>, "Arnd Bergmann"
> > <arnd@arndb.de>, "Lee Jones" <lee@kernel.org>, "dakr" <dakr@kernel.org>=
, "Rafael J. Wysocki" <rafael@kernel.org>, "Greg
> > Kroah-Hartman" <gregkh@linuxfoundation.org>, "Mark Brown" <broonie@kern=
el.org>, "tony" <tony@atomide.com>, "rogerq"
> > <rogerq@kernel.org>, "khilman" <khilman@baylibre.com>, "Andreas Kemnade=
" <andreas@kemnade.info>, "aaro koskinen"
> > <aaro.koskinen@iki.fi>, "Conor Dooley" <conor+dt@kernel.org>, "Krzyszto=
f Kozlowski" <krzk+dt@kernel.org>, "robh"
> > <robh@kernel.org>
> > Gesendet: Samstag, 29. November 2025 16:26:19
> > Betreff: Re: [PATCH 4/4] arm: dts: omap: Mark various register maps as =
dangerous =20
>=20
> > On 29/11/2025 15:20, Richard Weinberger wrote: =20
> >> index 711ce4c31bb1f..1b1f31608d37e 100644
> >> --- a/arch/arm/boot/dts/ti/omap/dra7.dtsi
> >> +++ b/arch/arm/boot/dts/ti/omap/dra7.dtsi
> >> @@ -359,6 +359,7 @@ bandgap: bandgap@4a0021e0 {
> >>  		dsp1_system: dsp_system@40d00000 {
> >>  			compatible =3D "syscon"; =20
> >=20
> > Oh, no no, sorry, but buggy/incomplete/legacy DT is not an excuse for
> > new properties. You cannot have such compatible alone in the first plac=
e. =20
>=20
> Okay, I didn't know that the OMAP DT is in that bad shape.
> Is somebody working on a solution?
>=20
well, it is an arduous work, piece by piece work. But things are getting be=
tter
slowly. I convert bindings from time to time, mostly the ones
needed by omap3-5 parts, not the active am3/5 parts.

compare
https://gitlab.com/robherring/linux-dt/-/jobs/5620809910#L5618

to the newer
https://gitlab.com/robherring/linux-dt/-/jobs/12112550529#L5156


Regards,
Andreas

