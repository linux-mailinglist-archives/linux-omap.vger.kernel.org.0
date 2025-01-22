Return-Path: <linux-omap+bounces-3187-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9559BA19B07
	for <lists+linux-omap@lfdr.de>; Wed, 22 Jan 2025 23:41:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D1ABF16BAD6
	for <lists+linux-omap@lfdr.de>; Wed, 22 Jan 2025 22:41:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 60A631CAA6C;
	Wed, 22 Jan 2025 22:41:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b="e/FShezb"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail.andi.de1.cc (mail.andi.de1.cc [178.238.236.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 831EA1C5D4F;
	Wed, 22 Jan 2025 22:41:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.238.236.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737585698; cv=none; b=FjZEy8p663DbTGvHky8DI6Tr60WqhifNUwld5hTGDCxGhw4IQigrDafQTCTklozgAcE51hlT9PL3GYlLlfVc4gzimVLMEp+8ViutJuGfMB1tTZoKVI9TYeItXBUgiYqLSncak0lX65lsHEfM9r7UkVrsekq0MoCN6YcnJ5e9jac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737585698; c=relaxed/simple;
	bh=LEazAn8h2c22eV9409j3Y07wkvhWsDwiSa7rhEF223Y=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bIv9rVXycLJ0Inm5zMtevdOKykLNvZpEKrdy+ETTOYtG2FyJhbL67yWptm9b51uimU50sqSqYGVfW8UsJcNkONDZKLoLfcBKq+51RtmybAYgfMEiKD8HQMlhRZ2cQRUXq9tW9L+vJKPBj/0C1oAa0dSelkmm/VJdsmSb6bbMlAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info; spf=pass smtp.mailfrom=kemnade.info; dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b=e/FShezb; arc=none smtp.client-ip=178.238.236.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=References:In-Reply-To:Cc:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=WYiygwqQsDUI+mRLPh/otnMV55e+vZS9FcV06LU2G7I=; b=e/FShezbPwoYBaIpkDQhhhaeae
	HSA/gfwRB7EwMgMiZDW5y7UPBbCTMHWWKGiMz9UyfwGFr0xE8XcegJ/ihsl4rObF9egm2GYeiaz6J
	3RBUGjCQRlVgTOiR/RWRhWM7pXMUCl5pS5oSolY15AjFHDYppJPs6Afg2ywfeqewiKwI43zpCy1AC
	5i0T3WC+w3zu089IDp5s4izYawLMNczYk9n7f/p7/lhUe4ugebD8ipEuK05giYj+FrehXyqR2vq5C
	hjdGKShhbILuZYfH7fFDtLMPUDLHsXdw40nVNBCqZz52uK9OiLXfOkkYBZ6wiRCP6xCFQ31jZOyak
	OormG4AA==;
Date: Wed, 22 Jan 2025 23:41:19 +0100
From: Andreas Kemnade <andreas@kemnade.info>
To: Tom Rini <trini@konsulko.com>
Cc: Robert Nelson <robertcnelson@gmail.com>, Kevin Hilman
 <khilman@kernel.org>, linux-kernel@vger.kernel.org, Nishanth Menon
 <nm@ti.com>, Tony Lindgren <tony@atomide.com>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-omap@vger.kernel.org,
 devicetree@vger.kernel.org
Subject: Re: [PATCH] ARM: dts: omap4-panda-a4: Add missing model and
 compatible properties
Message-ID: <20250122234119.0913cb4f@akair>
In-Reply-To: <20250122221843.GE60249@bill-the-cat>
References: <20250121200749.4131923-1-trini@konsulko.com>
	<7hmsfjn5mm.fsf@baylibre.com>
	<20250122000824.GJ3476@bill-the-cat>
	<20250122214604.79e1e829@akair>
	<CAOCHtYj3LumO4pViSOyTwjNxvG1E-DX=JA0-m4Usi1qL+jw21g@mail.gmail.com>
	<20250122211014.GB60249@bill-the-cat>
	<CAOCHtYjQtPvun-YTf6KT3Pw+jn3PS0tKM5uz1to3C6+Usjcq5Q@mail.gmail.com>
	<20250122221843.GE60249@bill-the-cat>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Am Wed, 22 Jan 2025 16:18:43 -0600
schrieb Tom Rini <trini@konsulko.com>:

> On Wed, Jan 22, 2025 at 03:52:47PM -0600, Robert Nelson wrote:
> > On Wed, Jan 22, 2025 at 3:10=E2=80=AFPM Tom Rini <trini@konsulko.com> w=
rote: =20
> > >
> > > On Wed, Jan 22, 2025 at 02:56:19PM -0600, Robert Nelson wrote: =20
> > > > On Wed, Jan 22, 2025 at 2:46=E2=80=AFPM Andreas Kemnade <andreas@ke=
mnade.info> wrote: =20
> > > > >
> > > > > Hi,
> > > > >
> > > > > Am Tue, 21 Jan 2025 18:08:24 -0600
> > > > > schrieb Tom Rini <trini@konsulko.com>:
> > > > > =20
> > > > > > > If keeping it is just this binding update, then I'd say we ke=
ep it, but
> > > > > > > if it gets any more paninful to maintain, I'm also not going =
to argue
> > > > > > > very hard to keep it. =20
> > > > > >
> > > > > > I'm not in the position to see if any of the Pandaboards work a=
t this
> > > > > > point, so I don't know if they're otherwise functional or a hug=
e pile of
> > > > > > problems. =20
> > > > >
> > > > > I am still testing stuff with pandaboards. But I do not have the =
a4
> > > > > one. So yes they are functional. Compared with other devices stil=
l in
> > > > > use using the same SoC, here you can play around with everything,=
 know
> > > > > the device. so it is a reference for keeping the really interesti=
ng
> > > > > devices working.
> > > > >
> > > > > Regarding the a4: I think it is better to keep that one in, just =
that
> > > > > nobody gets confused if he/she digs out his panda board for some
> > > > > comparison test and uses a wrong board revision. =20
> > > >
> > > > Do you want an a4? I could dig one or two out! ;) =20
> > >
> > > Unless I'm missing something, the a4 hasn't been bootable by upstream=
 in
> > > about 10 years now... There's no top-level compatible, so there's no
> > > match in the generic board code. I can't recall if the A4 versions we=
re
> > > available to anyone other than maintainers and beagleboard.org folks
> > > themselves as part of bring-up/testing. I know I had one and ewasted =
it
> > > a while ago. =20
> >=20
> > PandaBoard EA1->A3  =3D omap4-panda.dtb
> > PandaBoard A4->+ (non ES) =3D omap4-panda-a4.dtb
> >=20
> > A4 was the final production version of the non ES Panda.. =20
>=20
> Oh! My memory sucks here, sorry for the confusion. But it's also still
> the case that omap4-panda-a4.dtb hasn't had a top-level compatible
> string, so can it even be functionally used?
>=20
maybe people just revert to omap4-panda.dtb, it should not hurt having
internal and external pullups. I have the A2.

Regards,
Andreas

