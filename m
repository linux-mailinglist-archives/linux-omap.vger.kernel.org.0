Return-Path: <linux-omap+bounces-3184-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 195B2A19AD4
	for <lists+linux-omap@lfdr.de>; Wed, 22 Jan 2025 23:23:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6126B167683
	for <lists+linux-omap@lfdr.de>; Wed, 22 Jan 2025 22:23:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E1EE1BBBFE;
	Wed, 22 Jan 2025 22:22:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b="bSO3bQ5Z"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail.andi.de1.cc (mail.andi.de1.cc [178.238.236.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C56FB1AF0BB;
	Wed, 22 Jan 2025 22:22:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.238.236.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737584576; cv=none; b=BeqFp4heH3HdAB79p39J7P47u+w1baXOwbc1tde692PzV4x/YgvbLb5nXxMeEMJfy6cMjIVDK3E1z+s2utcJcUXagcessJHn1m1nmfrA0r5EKwNRGFq/WocAPV7d5nQsFTA7UBwuyWyOPDMCV+sxsp06YNQMOsxUacdgmcMTvuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737584576; c=relaxed/simple;
	bh=Zzl/0GS7Stt1QQq0cZu8iTSF3BbpxhfcfsD6St5uyfA=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nGh08CKwt0jmI+0yM0wzVpkI4g8mslRPIFiL33MV+wjUNJOeJAongtcAb1avS+pKRqep7Y8qqYJ0paGNrNuyANLRQECVNAWbvkt70o1DSc53z3KH7A/FWdb+pykS8bPspU+SYTohI6wqglfdCYdvE6ddod9wJvCEp0amy0nsSOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info; spf=pass smtp.mailfrom=kemnade.info; dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b=bSO3bQ5Z; arc=none smtp.client-ip=178.238.236.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=References:In-Reply-To:Cc:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=Zzl/0GS7Stt1QQq0cZu8iTSF3BbpxhfcfsD6St5uyfA=; b=bSO3bQ5ZpWuC2UZltvmany2MxJ
	dAMpZRLZilUMWDP3u8/JtfP637FZwqxAwdl1Ky6vkIaLY8RkrJhUY8Ib3s9bmP1LEs/bycjmh48+r
	3OideQU9JUoTAGJ9NHsJJ6bUqQZOa1yIM1XU0nJwZ1zfreqSj+LBnYBQkIWm21c/lzUs45dcnjUkP
	rA1WtPUWrhHiVfAqfSXgJ10hQjYRiEjG9Qm7glBpRTzT/IERmTHcpuXTcsAbc2pETTW4TStU9nUMo
	d5nViWqLlA1Wn6dYCCeNi7LXvwGvgjhCY7VlMfHWirqP9KNS6Z0y64PvDRAi7YBc/8Np5d5zm9YYX
	L2UTbezw==;
Date: Wed, 22 Jan 2025 23:22:38 +0100
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
Message-ID: <20250122232238.72ab25e9@akair>
In-Reply-To: <20250122211014.GB60249@bill-the-cat>
References: <20250121200749.4131923-1-trini@konsulko.com>
	<7hmsfjn5mm.fsf@baylibre.com>
	<20250122000824.GJ3476@bill-the-cat>
	<20250122214604.79e1e829@akair>
	<CAOCHtYj3LumO4pViSOyTwjNxvG1E-DX=JA0-m4Usi1qL+jw21g@mail.gmail.com>
	<20250122211014.GB60249@bill-the-cat>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Am Wed, 22 Jan 2025 15:10:14 -0600
schrieb Tom Rini <trini@konsulko.com>:

> On Wed, Jan 22, 2025 at 02:56:19PM -0600, Robert Nelson wrote:
> > On Wed, Jan 22, 2025 at 2:46=E2=80=AFPM Andreas Kemnade <andreas@kemnad=
e.info> wrote: =20
> > >
> > > Hi,
> > >
> > > Am Tue, 21 Jan 2025 18:08:24 -0600
> > > schrieb Tom Rini <trini@konsulko.com>:
> > > =20
> > > > > If keeping it is just this binding update, then I'd say we keep i=
t, but
> > > > > if it gets any more paninful to maintain, I'm also not going to a=
rgue
> > > > > very hard to keep it. =20
> > > >
> > > > I'm not in the position to see if any of the Pandaboards work at th=
is
> > > > point, so I don't know if they're otherwise functional or a huge pi=
le of
> > > > problems. =20
> > >
> > > I am still testing stuff with pandaboards. But I do not have the a4
> > > one. So yes they are functional. Compared with other devices still in
> > > use using the same SoC, here you can play around with everything, know
> > > the device. so it is a reference for keeping the really interesting
> > > devices working.
> > >
> > > Regarding the a4: I think it is better to keep that one in, just that
> > > nobody gets confused if he/she digs out his panda board for some
> > > comparison test and uses a wrong board revision. =20
> >=20
> > Do you want an a4? I could dig one or two out! ;) =20
>=20
> Unless I'm missing something, the a4 hasn't been bootable by upstream in
> about 10 years now... There's no top-level compatible, so there's no
> match in the generic board code. I can't recall if the A4 versions were
> available to anyone other than maintainers and beagleboard.org folks
> themselves as part of bring-up/testing. I know I had one and ewasted it
> a while ago.
>=20
So, yes if they are not really officially spread, then removing them
and add a comment about them in the common file or the panda.dts is
also a way to go.

Regards,
Andreas

