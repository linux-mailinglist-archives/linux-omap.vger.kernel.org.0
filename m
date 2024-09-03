Return-Path: <linux-omap+bounces-2096-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 4096E96A55B
	for <lists+linux-omap@lfdr.de>; Tue,  3 Sep 2024 19:22:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CDBCCB251C2
	for <lists+linux-omap@lfdr.de>; Tue,  3 Sep 2024 17:22:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DAA6F18CC15;
	Tue,  3 Sep 2024 17:22:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b="ERvdCeY3"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail.andi.de1.cc (mail.andi.de1.cc [178.238.236.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EB971C14;
	Tue,  3 Sep 2024 17:22:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.238.236.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725384133; cv=none; b=uT7zbZ3BYanvP82m36tH2b+F8/vqVJgF8eXAvci6YJdc68ox0Ezi2WdfKTu+ud6obmqPt6gQMoM/c52V7AzcKjtj1t3GzHAW3dybmXn5JLleNpNPrmFtoa5j3EqtuPeesYQQ4uDuMojqCRTzIwOlUhqyG65NXRbXsmMMdiBrn7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725384133; c=relaxed/simple;
	bh=C9bQo6BZRmskul4pq2KlfcmHJoR8PwbBMRKgq8T0cYY=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=d6isPUAo550PcPtG/LN2XikeLxrfIfU9bnEoZ1gbNh/7+HkjPQjH+tIEd2gOAxJzkXuKyfoWULvoEkNwEC3NFkuu+RMW4TXCZk5o7dHj5LEis5NlOflMh+BAy9LKT8b7sFzF509iyO7p++TNBeRFwqZwYR52CtKf2Zilw3tQHss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info; spf=pass smtp.mailfrom=kemnade.info; dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b=ERvdCeY3; arc=none smtp.client-ip=178.238.236.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=References:In-Reply-To:Cc:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=1nVpfiMbP80zNrBKm7C99QqYeZsP8+vHtkH4PS6Ayko=; b=ERvdCeY3pIPywEQA9IM3MqM81W
	+K8C/MollpnWosQ07xL85yTf9fdNiIEsfCxTI78KU7lBez7Bq9DS6QDvUaF9KdDH9JngrCd7IfLDk
	vTQQb2ebwE3rHlI5zcXdgJxN2cbZaVsxx5u5qZ0OpS/TWIr8l0N0OzGH50gK6QFW2UMb2Tey6J85k
	Cf4qG+g560kpp5EnUwzNTqvb9KWwoJj3MnQthUYYPKuY2VTV0OdUBNayacNsCtvSxbdKX3HCzz0GH
	9Y+dch/go0hnthxUXqgz4AkXrNcxK3sC4eB7BPVpiCe97Mto29Ek7kJet5di5ua1S9djwgkcKQvEh
	Sja1LVOA==;
Date: Tue, 3 Sep 2024 19:22:03 +0200
From: Andreas Kemnade <andreas@kemnade.info>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-omap@vger.kernel.org, linux-clk@vger.kernel.org, "Russell King
 (Oracle)" <rmk+kernel@armlinux.org.uk>, Paul Walmsley <paul@pwsan.com>,
 Tony Lindgren <tony@atomide.com>
Subject: Re: clk mess on omap4460 with mpu clock
Message-ID: <20240903192203.1dddbf0d@akair>
In-Reply-To: <CAMuHMdWF4G5Uon1=6TMzBogN2CX8EuiVBMuCPtAAMPNa-DtiOw@mail.gmail.com>
References: <20240603234139.280629b2@aktux>
	<CAMuHMdWU74DsWEZtZQJctQQog=9UCG_1LZu5yWvyxx0Zw4LQow@mail.gmail.com>
	<20240903143357.2532258b@akair>
	<CAMuHMdWF4G5Uon1=6TMzBogN2CX8EuiVBMuCPtAAMPNa-DtiOw@mail.gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Am Tue, 3 Sep 2024 14:36:05 +0200
schrieb Geert Uytterhoeven <geert@linux-m68k.org>:

> Hi Andreas,
>=20
> On Tue, Sep 3, 2024 at 2:34=E2=80=AFPM Andreas Kemnade <andreas@kemnade.i=
nfo>
> wrote:
> > Am Mon, 2 Sep 2024 15:53:07 +0200
> > schrieb Geert Uytterhoeven <geert@linux-m68k.org>: =20
> > > On Mon, Jun 3, 2024 at 11:41=E2=80=AFPM Andreas Kemnade
> > > <andreas@kemnade.info> wrote: =20
> > > > just stumbled across this on 6.10-rc1:
> > > >
> > > > [    1.475830] ocp:target-module@48210000:mpu:fck: device ID is
> > > > greater than 24 [    1.483154] ti-sysc
> > > > ocp:target-module@48210000: could not add child clock fck: -12 =20
> > >
> > > And on boneblack:
> > >
> > > 48000000.interconnect:segment@200000:target-module@0:mpu@0:fck:
> > > device ID is greater than 24
> > > target-module@4b000000:target-module@140000:pmu@0:fck: device ID
> > > is greater than 24
> > > =20
> > > > Maybe
> > > >         /*
> > > >          * Use clkdev_add() instead of clkdev_alloc() to avoid
> > > > the MAX_DEV_ID
> > > >          * limit for clk_get(). If cl ever needs to be freed, it
> > > > should be done
> > > >          * with clkdev_drop().
> > > >          */
> > > > in ti-sysc.c does not work anymore?
> > > >
> > > > The offending clock definition is in omap4.dtsi
> > > >
> > > > clocks =3D <&mpuss_clkctrl OMAP4_MPU_CLKCTRL 0>;
> > > >
> > > > Did not bisect that yet. =20
> > >
> > > Commit 8d532528ff6a6b1b ("clkdev: report over-sized strings when
> > > creating clkdev entries") in v6.10-rc1, with follow-up commit
> > > 616501eccb58615f ("clkdev: don't fail clkdev_alloc() if
> > > over-sized") in v6.10-rc4.
> > >
> > > I have no idea if these clkdev registrations are still
> > > necessary/used.=20
> > well, it might explain some mystery behavior in the past. Lets
> > see where it comes from. As the comment says, there should be a
> > workaround against that limitation. So the problem should not be
> > there in the first place. I have some strange problems with
> > clk_disable_unused.
> >
> > I first thought it is a id < 24 issue and not a strlen(something) <
> > 24. =20
>=20
> Me too :-(
>=20
Ok, setting
MAX_DEV_ID to 64 in clkdev.c lets the warnings disappear. ti-sys.c
has at one place precautions for overlong dev_ids, but on another place
it happily calls clkdev_create() running into this issue.=20

The follow-up commit then again at least does not cause a failure for
dev registration. I am still unsure what the consequences are. Between
6.10 and 6.11 something interesting happened which makes the bt200
reliably boot with near-mainline u-boot+spl even without
clk_ignore_unused. So no frankenstein-boot (vendor X-Loader + new
U-boot) anymore.

Regards,
Andreas

