Return-Path: <linux-omap+bounces-3390-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CB98A603DC
	for <lists+linux-omap@lfdr.de>; Thu, 13 Mar 2025 23:02:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 122CA19C4C97
	for <lists+linux-omap@lfdr.de>; Thu, 13 Mar 2025 22:02:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45CAF1F63D6;
	Thu, 13 Mar 2025 22:01:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b="vFgcnF91"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail.andi.de1.cc (mail.andi.de1.cc [178.238.236.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 410CD7FBAC;
	Thu, 13 Mar 2025 22:01:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.238.236.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741903317; cv=none; b=X8zR3SnijwULf+DxTH7iC8u/qCIRBHJsPoivAWox96oevpb7MT/yEIMkE+OyKybxSd+2X2w/DkSA0j9B4ZusPqCt+RP/8/cTqnJL+DABASjNg6G9EaNIETgebMA2jwiKrEZdvvMy7zBUodftcKib0Z7ZVSMmeAPXOfhvx1GjTh0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741903317; c=relaxed/simple;
	bh=Xl5XZkRzyHK1ICtN1r6YQrbroSsa44PrhiPDBMEXYWY=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ObpqQOR6EIPpxsk/dCHBFrUmboifkXUScGm2p1tBySIi5jUm5St2uY3yfKXvKHrtbHExEVj25BO4Fdrn8f8TFHE90LlpuPxmeN9vjrkuWCMTn3rX9dCy4N9+K46NV0BPO1Bdjm3a0QtoVw5cwTEDVLnSNetxGzrKntdCRXMMHYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info; spf=pass smtp.mailfrom=kemnade.info; dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b=vFgcnF91; arc=none smtp.client-ip=178.238.236.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=References:In-Reply-To:Cc:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=rno9OMXiXAURQ7qP4ybw0rYOr4Xj/xylSi9vradBspI=; b=vFgcnF91xKT49B1jJtvYniByP/
	BBsCeh77OH1VaD+LpsV1Or85YgaYrAqZF3iWNbMAQkR2SN3aCv2WxkBUb0XWKcEPuOxWabVsDuUQc
	kvRJpe3ayVZlvrSf9lAOzr2ZJLkEYnD/80pce/vETN9fbpcYhNUCRj1AAFO+iGHNXW4GiVDH5V1hm
	Ptn4SMhx0TdkyI/3UD4exWGrnur1MkDE11Fz+d9XTomg/+ZB2AVVCufl7irLS5IGZtRH02ps0wYtt
	xg7+63HPSfu5SBKqo7B19V00sPb8fPzw8ZsuNQywmBG9Y0jHtdXxtE6UAn76Hkx5tmpyEmtTicWOK
	9jApPauA==;
Date: Thu, 13 Mar 2025 23:01:48 +0100
From: Andreas Kemnade <andreas@kemnade.info>
To: "Sverdlin, Alexander" <alexander.sverdlin@siemens.com>
Cc: "rogerq@kernel.org" <rogerq@kernel.org>, "tony@atomide.com"
 <tony@atomide.com>, "aaro.koskinen@iki.fi" <aaro.koskinen@iki.fi>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>,
 "khilman@baylibre.com" <khilman@baylibre.com>
Subject: Re: [PATCH] Revert "bus: ti-sysc: Probe for l4_wkup and l4_cfg
 interconnect devices first"
Message-ID: <20250313230148.792f224b@akair>
In-Reply-To: <6348326299702a12ed4faa6ea25ee8bbe5e232aa.camel@siemens.com>
References: <20250313094708.1003092-1-alexander.sverdlin@siemens.com>
	<20250313202129.0dcfc44e@akair>
	<6348326299702a12ed4faa6ea25ee8bbe5e232aa.camel@siemens.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Am Thu, 13 Mar 2025 20:42:23 +0000
schrieb "Sverdlin, Alexander" <alexander.sverdlin@siemens.com>:

> Hi Andreas!
>=20
> On Thu, 2025-03-13 at 20:21 +0100, Andreas Kemnade wrote:
> > > This reverts commit 4700a00755fb5a4bb5109128297d6fd2d1272ee6.
> > >=20
> > > It brakes target-module@2b300050 ("ti,sysc-omap2") probe on AM62x in =
a case
> > > when minimally-configured system tries to network-boot:
> > >  =20
> > brakes or breaks? To unterstand the severity of the issue... =20
>=20
> Thanks for the correction, it should have been "breaks"...
>=20
> > > [=C2=A0=C2=A0=C2=A0 6.888776] probe of 2b300050.target-module returne=
d 517 after 258 usecs
> > > [=C2=A0=C2=A0 17.129637] probe of 2b300050.target-module returned 517=
 after 708 usecs
> > > [=C2=A0=C2=A0 17.137397] platform 2b300050.target-module: deferred pr=
obe pending: (reason unknown)
> > > [=C2=A0=C2=A0 26.878471] Waiting up to 100 more seconds for network.
> > >=20
> > > Arbitrary 10 deferrals is really not a solution to any problem. =20
> >=20
> > So there is a point where no more probe of anything pending are
> > triggered and therefore things are not probed? =20
>=20
> Because there is a point indeed (if we configure quite minimal set of dri=
vers just
> enough to mount NFS) when deferred probes are not triggered any longer.
>=20
> > > Stable mmc enumeration can be achiever by filling /aliases node prope=
rly
> > > (4700a00755fb commit's rationale).
> > >  =20
> > yes, it does not look like a clean solution. And we have the
> > proper aliases node in many places. What I am a bit wondering about is
> > what kind of sleeping dogs we are going to wake up by this revert. So I
> > think this should be tested a lot esp. about possible pm issues.
> >=20
> > Not every dependency in the sysc probe area is properly defined. =20
>=20
> But the patch I propose to revert is really not a solution for missing
> dependencies on syscons. I'm fine with not propagating this to stable,
> but reverting in master should give enough time for older SoCs to test,
> WDYT?
>
I am not against your revert proposal and not against propagating it
to stable, I would just like to see some Tested-Bys before it gets
applied to anything. If anything nasty pops up, it should be solved in a
cleaner way then with the offending patch.

Regards,
Andreas

