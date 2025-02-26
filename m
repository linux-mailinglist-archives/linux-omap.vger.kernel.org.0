Return-Path: <linux-omap+bounces-3302-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BE6C8A4666E
	for <lists+linux-omap@lfdr.de>; Wed, 26 Feb 2025 17:20:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 615C817EB10
	for <lists+linux-omap@lfdr.de>; Wed, 26 Feb 2025 16:07:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 963A221D585;
	Wed, 26 Feb 2025 16:06:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b="pRDIhvQo"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail.andi.de1.cc (mail.andi.de1.cc [178.238.236.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D0EF20AF8E;
	Wed, 26 Feb 2025 16:06:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.238.236.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740586009; cv=none; b=G63utRH5oj9RetX8dHm+b7AfGAwLm+SPhlJUZ4An/9uenTpq07+Mkp89HIS7gADJppGFm2RcBpa6PseRg2y2ucEbnY9JSmX1YsB2szm3qe1ZVYCjxbapcLaVC/6OV675Wt0ZNXoObos2E1Clo6exepRPaiQQRyQ9EZMWyo2SQ1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740586009; c=relaxed/simple;
	bh=P3xfS1KnfHqF2nMkwhwhKYMHw2pM1Qk802J1/MMvXqY=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ULO6vZqjJ2CebQy032LhavAimFXxphNkqFWwsQZClgHmUpLnuVVg2Cytb978dy95nW85CYPdAiV/LaiwpRb3g/QSIid113Worja8g9D82H8WHGYsCwQn+SFcFNOFenOiC6wX2mMLyMgrzXHZSbKPmaVagFKXYOU3c5nnm1FIpyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info; spf=pass smtp.mailfrom=kemnade.info; dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b=pRDIhvQo; arc=none smtp.client-ip=178.238.236.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=References:In-Reply-To:Cc:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=P3xfS1KnfHqF2nMkwhwhKYMHw2pM1Qk802J1/MMvXqY=; b=pRDIhvQoPPcMLi3IXCKBaoPQAP
	VxzKs1SFVTmdFXHWNBPGoNoLHVvXi/F2iTtSKyVrNFEM2QOW5tf3uSInaPwO2cYV5ozB+2hP02dO+
	TMRfojnX4OXOSt8RgeS8Ka6S49uCL3C6XovwGDAwFbD16456r6y4lmDhbMt0I5Bji/aW4jU/WIfLb
	adpM8RAwehWDJqVA0B3L0MEhw553uAHBcn+qRLjp476XKv/xpdRt/uVKxKuXmFQ56Zgj+Tjxr6o0E
	wh0eYQD57toCTdT+mEtxoFiAxiDO3mqAaHLGTSYPrMABsIvvHIyj7Rfjv3APrCCUljkKMnpX7R1Q/
	FwN3TuMw==;
Date: Wed, 26 Feb 2025 17:06:14 +0100
From: Andreas Kemnade <andreas@kemnade.info>
To: Robert Nelson <robertcnelson@gmail.com>
Cc: Romain Naour <romain.naour@smile.fr>, Aaro Koskinen
 <aaro.koskinen@iki.fi>, Kevin Hilman <khilman@baylibre.com>, Roger Quadros
 <rogerq@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>, Jason Kridner
 <jkridner@beagleboard.org>, "Aldea, Andrei" <a-aldea@ti.com>, David
 <daowens01@gmail.com>, linux-omap@vger.kernel.org,
 linux-mmc@vger.kernel.org, Tony Lindgren <tony@atomide.com>
Subject: Re: sdhci-omap: additional PM issue since 5.16
Message-ID: <20250226170614.18a497f0@akair>
In-Reply-To: <CAOCHtYiujoMoPHfSmyTrv_48wUn3TfaoiPEcMFB=V++MZXvuuQ@mail.gmail.com>
References: <1c5f72c4-3d55-4d62-b690-8c68b76a15d2@gmail.com>
	<f6732c49-a5b1-4a13-b9f6-c2d552b5e7e8@smile.fr>
	<31717d89-432c-4b77-a974-99f7e6b97f97@gmail.com>
	<9168d127-06a7-46e6-a7a2-f2e60032a50e@gmail.com>
	<b1a369e2-938b-49ed-b743-6562f0bb46f9@smile.fr>
	<CAOCHtYiBFNY9nFjtqsFFpqRKdxUif_fC7MVqZ7cffeD8rLSe2A@mail.gmail.com>
	<CAOCHtYiujoMoPHfSmyTrv_48wUn3TfaoiPEcMFB=V++MZXvuuQ@mail.gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Am Wed, 26 Feb 2025 09:36:40 -0600
schrieb Robert Nelson <robertcnelson@gmail.com>:

> On Mon, Jan 27, 2025 at 3:20=E2=80=AFPM Robert Nelson <robertcnelson@gmai=
l.com> wrote:
> > =20
> > > Thanks for testing.
> > >
> > > I'm able to reproduce the issue locally (using a kernel 6.1.112).
> > > It fail after the first sleep 20...
> > >
> > > If I remove MMC_CAP_AGGRESSIVE_PM from the sdhci-omap driver the issu=
e is gone.
> > >
> > > About sdhci-omap driver, It's one of the only few enabling
> > > MMC_CAP_AGGRESSIVE_PM. I recently switched to a new project using a n=
ewer SoC
> > > but the eMMC driver doesn't event set MMC_CAP_AGGRESSIVE_PM.
> > >
> > > I'm wondering if MMC_CAP_AGGRESSIVE_PM is really safe (or compatible)=
 for
> > > HS200/HS400 eMMC speed. Indeed, MMC_CAP_AGGRESSIVE_PM has been added =
to
> > > sdhci-omap driver to support SDIO WLAN device PM [1].
> > >
> > > I've found another similar report on the Beaglebone-black (AM335x SoC=
) [2].
> > >
> > > It seems the MMC_CAP_AGGRESSIVE_PM feature should only be enabled to =
SDIO cards. =20
> >
> > We've been chasing this Bug in BeagleLand for a while. Had Kingston
> > run it thru their hardware debuggers.. On the BBB, once the eMMC is
> > suspended during idle, the proper 'wakeup' cmd is NOT sent over,
> > instead it forces a full reset. Eventually this kills the eMMC. Been
> > playing with this same revert for a day or so, with my personal setup,
> > it takes 3-4 Weeks (at idle every day) for it to finally die.. So i
> > won't be able to verify this 'really' fixes it till next month.. =20
>=20
> Okay, it survived 4 weeks.. We really need to revert:
> 3edf588e7fe00e90d1dc7fb9e599861b2c2cf442
>=20
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit=
/?id=3D3edf588e7fe00e90d1dc7fb9e599861b2c2cf442
>=20
> On every stable kernel back to v6.1.x, this commit is `killing`
> Kingston eMMC's on BeagleBone Black's in under 21 days.
>=20
> By reverting the commit, I finally have a board that's survived the 3
> week timeline, (and a week more) with no issues.
>=20
Is there any simple way to restrain it to only sdio devices to go
forward a bit?

Regards,
Andreas

