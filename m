Return-Path: <linux-omap+bounces-2229-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1525097EB40
	for <lists+linux-omap@lfdr.de>; Mon, 23 Sep 2024 14:05:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4729C1C215A5
	for <lists+linux-omap@lfdr.de>; Mon, 23 Sep 2024 12:05:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D76A5195980;
	Mon, 23 Sep 2024 12:05:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b="NU6ilw1s"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail.andi.de1.cc (mail.andi.de1.cc [178.238.236.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 715D27641D;
	Mon, 23 Sep 2024 12:04:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.238.236.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727093101; cv=none; b=WwtW/6hQMucdJZY6ePh/qN8+frlYU1NVFUJiA+H/xvLenuQ3dG8rDGjQL5EatfCsuGJpn56WCdwDBz15ouxN6mXCW8B6yx0k0wvisQtv5waIyYaWJIc7LqZwD1bG1SoUjl/8hHNNyAHVUU8bhGsPvY+FV63mp9aC2csUw3bST8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727093101; c=relaxed/simple;
	bh=qi1PjlEounPLmGZYg7mFt0VV1DkZCSccR1+CiRtSriA=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ngtPBVup0iV8ecF16drQBG18mlGaUfFAfpURb0asYHuo4Il+iNOhypbVyfJkV0UdPe7XQCso4O+20OqgcFHEsZHun2uh/HA3pOUz4PQaOtyX7rZIw1qoaoAX8kWqOcsX1KQbdI8DUKifxECkLVyE0ZhDj7O1XG1/srzDO3S1Chk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info; spf=pass smtp.mailfrom=kemnade.info; dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b=NU6ilw1s; arc=none smtp.client-ip=178.238.236.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=References:In-Reply-To:Cc:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=944JnV41oDL5cWaTC4YkKMMn7PnL1zs+tDD23HR6gmU=; b=NU6ilw1scRJqTBU9WERjk0Lais
	fWLooE72b+yK18VuzcpbrqHOSeEjlibWqZ9dXkNQpOhCCbUzcHAClurvjhQEC0ue2QhDec2YD0V0o
	tGOzf+mKnmNXX4BQ0BnkfWJwrt3uDnKslDmKvkauCWyiOz8cXyueqOrfDFBilnk0b9TpRUpOrUmO7
	ZKsLVxG4qSkxut/Eh4Jpk20skQhykd5K6bLYhA6JzGYnRFWBLCGnfli6WhzcGEjk4ndIZSdCV32kK
	NDOtc5hcqmdPHepBopaJwIqTJ98XIIpc5qJvl1nlQUuPEXpgY3alX6RIIVWnLiyHDatsl8JPs0PxB
	O+JUB4hA==;
Date: Mon, 23 Sep 2024 14:04:47 +0200
From: Andreas Kemnade <andreas@kemnade.info>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, linux-omap@vger.kernel.org,
 linux-clk@vger.kernel.org, Paul Walmsley <paul@pwsan.com>, Tony Lindgren
 <tony@atomide.com>
Subject: Re: clk mess on omap4460 with mpu clock
Message-ID: <20240923140447.60c5efff@akair>
In-Reply-To: <ZtdQ+Ay9DKAooahN@shell.armlinux.org.uk>
References: <20240603234139.280629b2@aktux>
	<CAMuHMdWU74DsWEZtZQJctQQog=9UCG_1LZu5yWvyxx0Zw4LQow@mail.gmail.com>
	<20240903143357.2532258b@akair>
	<CAMuHMdWF4G5Uon1=6TMzBogN2CX8EuiVBMuCPtAAMPNa-DtiOw@mail.gmail.com>
	<20240903192203.1dddbf0d@akair>
	<ZtdQ+Ay9DKAooahN@shell.armlinux.org.uk>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Am Tue, 3 Sep 2024 19:10:00 +0100
schrieb "Russell King (Oracle)" <linux@armlinux.org.uk>:

> On Tue, Sep 03, 2024 at 07:22:03PM +0200, Andreas Kemnade wrote:
> > Am Tue, 3 Sep 2024 14:36:05 +0200
> > schrieb Geert Uytterhoeven <geert@linux-m68k.org>:
> >  =20
> > > Hi Andreas,
> > >=20
> > > On Tue, Sep 3, 2024 at 2:34=E2=80=AFPM Andreas Kemnade
> > > <andreas@kemnade.info> wrote: =20
> > > > Am Mon, 2 Sep 2024 15:53:07 +0200
> > > > schrieb Geert Uytterhoeven <geert@linux-m68k.org>:   =20
> > > > > On Mon, Jun 3, 2024 at 11:41=E2=80=AFPM Andreas Kemnade
> > > > > <andreas@kemnade.info> wrote:   =20
> > > > > > just stumbled across this on 6.10-rc1:
> > > > > >
> > > > > > [    1.475830] ocp:target-module@48210000:mpu:fck: device
> > > > > > ID is greater than 24 [    1.483154] ti-sysc
> > > > > > ocp:target-module@48210000: could not add child clock fck:
> > > > > > -12   =20
> > > > >
> > > > > And on boneblack:
> > > > >
> > > > > 48000000.interconnect:segment@200000:target-module@0:mpu@0:fck:
> > > > > device ID is greater than 24
> > > > > target-module@4b000000:target-module@140000:pmu@0:fck: device
> > > > > ID is greater than 24
> > > > >   =20
> > > > > > Maybe
> > > > > >         /*
> > > > > >          * Use clkdev_add() instead of clkdev_alloc() to
> > > > > > avoid the MAX_DEV_ID
> > > > > >          * limit for clk_get(). If cl ever needs to be
> > > > > > freed, it should be done
> > > > > >          * with clkdev_drop().
> > > > > >          */
> > > > > > in ti-sysc.c does not work anymore?
> > > > > >
> > > > > > The offending clock definition is in omap4.dtsi
> > > > > >
> > > > > > clocks =3D <&mpuss_clkctrl OMAP4_MPU_CLKCTRL 0>;
> > > > > >
> > > > > > Did not bisect that yet.   =20
> > > > >
> > > > > Commit 8d532528ff6a6b1b ("clkdev: report over-sized strings
> > > > > when creating clkdev entries") in v6.10-rc1, with follow-up
> > > > > commit 616501eccb58615f ("clkdev: don't fail clkdev_alloc() if
> > > > > over-sized") in v6.10-rc4.
> > > > >
> > > > > I have no idea if these clkdev registrations are still
> > > > > necessary/used.  =20
> > > > well, it might explain some mystery behavior in the past. Lets
> > > > see where it comes from. As the comment says, there should be a
> > > > workaround against that limitation. So the problem should not be
> > > > there in the first place. I have some strange problems with
> > > > clk_disable_unused.
> > > >
> > > > I first thought it is a id < 24 issue and not a
> > > > strlen(something) < 24.   =20
> > >=20
> > > Me too :-(
> > >  =20
> > Ok, setting
> > MAX_DEV_ID to 64 in clkdev.c lets the warnings disappear. ti-sys.c
> > has at one place precautions for overlong dev_ids, but on another
> > place it happily calls clkdev_create() running into this issue.=20
> >=20
> > The follow-up commit then again at least does not cause a failure
> > for dev registration. I am still unsure what the consequences are.
> > Between 6.10 and 6.11 something interesting happened which makes
> > the bt200 reliably boot with near-mainline u-boot+spl even without
> > clk_ignore_unused. So no frankenstein-boot (vendor X-Loader + new
> > U-boot) anymore. =20
>=20
> The bottom line: if you are getting warnings that the strings exceed
> the existing sizes, then _any_ lookups using clkdev will have been
> failing. Nothing has changed with that. The only thing that changed
> recently was to print a warning for this case, and initially to fail
> the attempt to register with clkdev. However, that broke stuff, so it
> was made not to fail, but still report the problem.
>=20
yes, understood. The main question what bothers me is whether we have
some real problems behind it. The warning message is just an indicator
of something odd which was already odd before the message was
introduced.
I have seen something working with some u-boot and some other not,
so things might not get properly initialized...=20

So the way forward is to check whether that registration is really
needed at:
https://elixir.bootlin.com/linux/v6.11/source/drivers/bus/ti-sysc.c#L2380
If yes, then
a) increade the size of the name in the clk subsystem or
b) workaround like
https://elixir.bootlin.com/linux/v6.11/source/drivers/bus/ti-sysc.c#L353

Regards,
Andreas

