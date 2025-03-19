Return-Path: <linux-omap+bounces-3445-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EED7A68686
	for <lists+linux-omap@lfdr.de>; Wed, 19 Mar 2025 09:18:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BE5FD189BC37
	for <lists+linux-omap@lfdr.de>; Wed, 19 Mar 2025 08:18:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9FEF250C02;
	Wed, 19 Mar 2025 08:18:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b="9lBr+Fot"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail.andi.de1.cc (mail.andi.de1.cc [178.238.236.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6314250BF5;
	Wed, 19 Mar 2025 08:18:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.238.236.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742372283; cv=none; b=hNkO3e27xVGw1WecCj/R2lQ38vxHtT7Jm2y+BQQAWjZ3PnyzjG2m1EVhNtj0nTsb+KmYTLptwqOs9Op/9QEO33J0ZRIg1WxlL8joXBxVJW/bty9B7FTBbpSLCzz/QU9a61jLMsZJWIWUw0yveEhQG25gqMPxj+UdRNoKiVEAqx4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742372283; c=relaxed/simple;
	bh=suWOblxJjCIlwK+ohLsUpw6o4M+ZDDgLuq+5b/MsH0I=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Avz0/h48Na2YuHVAuP8Cej6NSHARfkurYw0P0uKwdbC/qY5TSDlS7J9WuIAtmlXYwDOkClfXLvgF/U7WrGQesK7H4SMgvYKYE8/XXjPTXy4gm5D5YvLcC9xBXJ+ivbawa+NFz9LhV3UZBFvk+C23mqstjnaWaQVLYuSqROlc0qg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info; spf=pass smtp.mailfrom=kemnade.info; dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b=9lBr+Fot; arc=none smtp.client-ip=178.238.236.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=References:In-Reply-To:Cc:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=7XeYcVS9FVFm02GFEdHde5eybyDZf9/feRSyPmVWNz0=; b=9lBr+FotJncvMTAk/A7MVTDyis
	7WvNiBGampXQO4CmiifG2P08yz0XlJGmhCY4u+EOs9NppfhXoUyEGvulLgaW0xxSHVl0S0ud5M/jN
	Y8KIfEUveHtB2YCe8L/vj5562tSArQAmOUTgY2Rq/4mo9W14M9sxyH7/GVRc2xOftPgrBdf9DOgCW
	pW7yHWN3MBnSYR9XiXeBwEwaoqdrjoky/m/shepafIFt/+M/WJKKF9hX882fyOm1SpiFVrb2Hem8S
	6HgVMyludaLwYK+RJdVD3gCkiqebUhc9xQdIVVuoQRjhQdnGJpUcDarJeRldE+vd9WekxMvoXwrG6
	vhKw0Nyw==;
Date: Wed, 19 Mar 2025 09:17:41 +0100
From: Andreas Kemnade <andreas@kemnade.info>
To: Tony Lindgren <tony@atomide.com>
Cc: "Sverdlin, Alexander" <alexander.sverdlin@siemens.com>,
 "rogerq@kernel.org" <rogerq@kernel.org>, "aaro.koskinen@iki.fi"
 <aaro.koskinen@iki.fi>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "linux-omap@vger.kernel.org"
 <linux-omap@vger.kernel.org>, "khilman@baylibre.com" <khilman@baylibre.com>
Subject: Re: [PATCH] Revert "bus: ti-sysc: Probe for l4_wkup and l4_cfg
 interconnect devices first"
Message-ID: <20250319091741.5488592b@akair>
In-Reply-To: <20250319035606.GA4957@atomide.com>
References: <20250313094708.1003092-1-alexander.sverdlin@siemens.com>
	<20250313202129.0dcfc44e@akair>
	<6348326299702a12ed4faa6ea25ee8bbe5e232aa.camel@siemens.com>
	<20250313230148.792f224b@akair>
	<20250319035606.GA4957@atomide.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Am Wed, 19 Mar 2025 05:56:06 +0200
schrieb Tony Lindgren <tony@atomide.com>:

> * Andreas Kemnade <andreas@kemnade.info> [250313 22:01]:
> > Am Thu, 13 Mar 2025 20:42:23 +0000
> > schrieb "Sverdlin, Alexander" <alexander.sverdlin@siemens.com>:
> >  =20
> > > Hi Andreas!
> > >=20
> > > On Thu, 2025-03-13 at 20:21 +0100, Andreas Kemnade wrote: =20
> > > > > This reverts commit 4700a00755fb5a4bb5109128297d6fd2d1272ee6.
> > > > >=20
> > > > > It brakes target-module@2b300050 ("ti,sysc-omap2") probe on AM62x=
 in a case
> > > > > when minimally-configured system tries to network-boot:
> > > > >    =20
> > > > brakes or breaks? To unterstand the severity of the issue...   =20
> > >=20
> > > Thanks for the correction, it should have been "breaks"...
> > >  =20
> > > > > [=C2=A0=C2=A0=C2=A0 6.888776] probe of 2b300050.target-module ret=
urned 517 after 258 usecs
> > > > > [=C2=A0=C2=A0 17.129637] probe of 2b300050.target-module returned=
 517 after 708 usecs
> > > > > [=C2=A0=C2=A0 17.137397] platform 2b300050.target-module: deferre=
d probe pending: (reason unknown)
> > > > > [=C2=A0=C2=A0 26.878471] Waiting up to 100 more seconds for netwo=
rk.
> > > > >=20
> > > > > Arbitrary 10 deferrals is really not a solution to any problem.  =
 =20
> > > >=20
> > > > So there is a point where no more probe of anything pending are
> > > > triggered and therefore things are not probed?   =20
> > >=20
> > > Because there is a point indeed (if we configure quite minimal set of=
 drivers just
> > > enough to mount NFS) when deferred probes are not triggered any longe=
r.
> > >  =20
> > > > > Stable mmc enumeration can be achiever by filling /aliases node p=
roperly
> > > > > (4700a00755fb commit's rationale).
> > > > >    =20
> > > > yes, it does not look like a clean solution. And we have the
> > > > proper aliases node in many places. What I am a bit wondering about=
 is
> > > > what kind of sleeping dogs we are going to wake up by this revert. =
So I
> > > > think this should be tested a lot esp. about possible pm issues.
> > > >=20
> > > > Not every dependency in the sysc probe area is properly defined.   =
=20
> > >=20
> > > But the patch I propose to revert is really not a solution for missing
> > > dependencies on syscons. I'm fine with not propagating this to stable,
> > > but reverting in master should give enough time for older SoCs to tes=
t,
> > > WDYT?
> > > =20
> > I am not against your revert proposal and not against propagating it
> > to stable, I would just like to see some Tested-Bys before it gets
> > applied to anything. If anything nasty pops up, it should be solved in a
> > cleaner way then with the offending patch. =20
>=20
> Sounds like for the AM62x problem there is simply some resource missing
> that needs to be configured. Did you track down which resource is causing
> the deferred probe without the revert?
>=20
I think you have not understand the real problem here. I guess, that
problem can be provoked on other systems, too, if you just limit the
devices to the absolute minimum required.
The problem is as far as I understand a bit different. The problem is
not a resource is missing totally, it is just the artificial deferral
here. If there are just a minimum devices configured, you can come to a
point where there is nothing to trigger a loop through all the deferred
devices causing them to never probe.
An arbitary, unrelated device with a driver popping up would unstall
that deferral.=20

I will just play around with the systems I have access to and if nothing
pops up, I will add a Tested-By/Reviewed-By. If more serious problems
pops up (I do not think so), another clean fix should get in before
getting this reverted.

> Reverting the commit does not really fix the root cause. It just ignores
> the problem of the hierarchy of the interconnect instances. Some of the
> interconnect instances are always-on, and contain devices providing
> resources for the other interconnect devices. So I would not consider
> patching MMC aliases all over the place as an alternative to fixing the
> real problem :)
>
So what is the real problem you wanted to fix? MMC aliases are there at
many places already. So is there anything besides MMC order?

Regards,
Andreas

