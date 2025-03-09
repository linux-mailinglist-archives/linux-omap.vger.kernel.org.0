Return-Path: <linux-omap+bounces-3351-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DC626A586B6
	for <lists+linux-omap@lfdr.de>; Sun,  9 Mar 2025 19:00:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 84EA37A6471
	for <lists+linux-omap@lfdr.de>; Sun,  9 Mar 2025 17:58:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BCC6A206F1F;
	Sun,  9 Mar 2025 17:58:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b="RtgwhM2u"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail.andi.de1.cc (mail.andi.de1.cc [178.238.236.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D9D21F8739;
	Sun,  9 Mar 2025 17:58:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.238.236.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741543114; cv=none; b=dICbB2VnmbOyzuzQUOxGMX0BIHJ3RNpJEIkIGLgFN0isvxSepd7+gkmXvmOf6xdsM/51toYGfZaZ+idbuFbgQII3T/yi/wS9VSY3YbYrl95oL8sp3/vLtxR8oVMiEimjyHg1V+RrkvtOfhCgvxM96wE0ZILF/l1jjTk2A4rIOAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741543114; c=relaxed/simple;
	bh=s86vpWnQgBnSj2xg/F3wIciz5Nloywe5JFagVAGuNw4=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=oXomYPzcUoHq3pzhTbO//KDI6AhZ6PLY8DQD2a8RJCyegVJQO14XsXXW11yAPU/Tzm1ovvm/3bR0vHokqDBIfsI106hl79D5vOhyipW1r+99KxQ1DNxEHLp1CKHaj6sX679k+OXffB8YTieI4+0xqr+boWdezkI+PmBS8zkrqsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info; spf=pass smtp.mailfrom=kemnade.info; dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b=RtgwhM2u; arc=none smtp.client-ip=178.238.236.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=References:In-Reply-To:Cc:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=elry/LZU2JVvpEh/qVlxwR7Sfkt1PtSVS42ycPHGmDo=; b=RtgwhM2uYaS9wvqDnIA8mSxKMH
	WonTV3QNULJdpTFE+2YkQrVGZoPT98G7862KXZXk5qNiEWtNAbDk0c1VUPRlFCASXOuuS8XyRjbgN
	mAl3LB0YhjTuiGJCehNyxMAGy0AOEk5ksZR9ytbhCoZGDZpKS3fwUcuLyxflfaiBXNmGNkSglyGGU
	KAK/kZOMTG4J+kBZnMX3lWqN8pk2l2c6GmXBDwKd3RoOqp/7p91a2kCCT6qu0yMD+VII/IZK0vGSg
	JX0QqQLtF+eRRxOB5+WWBiJSetSTJGey4YL6+Fb+WewaIA/gq/J2I+hu+abEXeP+hm8Pl7yreeVeF
	ZtX2+V8A==;
Date: Sun, 9 Mar 2025 18:58:11 +0100
From: Andreas Kemnade <andreas@kemnade.info>
To: Robert Nelson <robertcnelson@gmail.com>
Cc: Tony Lindgren <tony@atomide.com>, Romain Naour <romain.naour@smile.fr>,
 Aaro Koskinen <aaro.koskinen@iki.fi>, Kevin Hilman <khilman@baylibre.com>,
 Roger Quadros <rogerq@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>,
 Jason Kridner <jkridner@beagleboard.org>, "Aldea, Andrei" <a-aldea@ti.com>,
 David <daowens01@gmail.com>, linux-omap@vger.kernel.org,
 linux-mmc@vger.kernel.org
Subject: Re: sdhci-omap: additional PM issue since 5.16
Message-ID: <20250309185811.73aa1fc1@akair>
In-Reply-To: <CAOCHtYj-0KG2oMuyof1c35c=A8PaUfYPZFuLY_YDKmq-SV8h2g@mail.gmail.com>
References: <1c5f72c4-3d55-4d62-b690-8c68b76a15d2@gmail.com>
	<f6732c49-a5b1-4a13-b9f6-c2d552b5e7e8@smile.fr>
	<31717d89-432c-4b77-a974-99f7e6b97f97@gmail.com>
	<9168d127-06a7-46e6-a7a2-f2e60032a50e@gmail.com>
	<b1a369e2-938b-49ed-b743-6562f0bb46f9@smile.fr>
	<CAOCHtYiBFNY9nFjtqsFFpqRKdxUif_fC7MVqZ7cffeD8rLSe2A@mail.gmail.com>
	<CAOCHtYiujoMoPHfSmyTrv_48wUn3TfaoiPEcMFB=V++MZXvuuQ@mail.gmail.com>
	<20250226170614.18a497f0@akair>
	<20250307042822.GE23206@atomide.com>
	<CAOCHtYj-0KG2oMuyof1c35c=A8PaUfYPZFuLY_YDKmq-SV8h2g@mail.gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi,

Am Fri, 7 Mar 2025 08:42:02 -0600
schrieb Robert Nelson <robertcnelson@gmail.com>:

> On Thu, Mar 6, 2025 at 10:28=E2=80=AFPM Tony Lindgren <tony@atomide.com> =
wrote:
> >
> > Best to revert the patch first until the issue has been fixed.
> >
> > Based on the symptoms, it sounds like there might be a missing flush of
> > a posted write in the PM runtime suspend/resume path. This could cause
> > something in the sequence happen in the wrong order for some of the
> > related surrounding resources like power, clocks or interrupts.
> > =20
>=20
> Kington's hardware anaylizer said after CMD5/sleep in about 10us,
> instead of CMD5/wkup being called, it just resets the eMMC..  So
> someone deep within the sdhc/mmc layer might understand that. ;)
>=20
hmm, omap3/4/5 are using omap-hsmmc and are not switched towards sdhci
yet. So I guess that might be the reason why things are not coming to
light that easy. Also I am wondering whether we can start by destroying
SD cards rather then eMMC. So maybe we can do some stress-testing to
have the cycles shorter. Do we have an overview what is really working
reliable with that driver?


Regards,
Andreas

