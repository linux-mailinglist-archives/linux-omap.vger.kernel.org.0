Return-Path: <linux-omap+bounces-2082-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F423969DAF
	for <lists+linux-omap@lfdr.de>; Tue,  3 Sep 2024 14:34:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 67531B23D3C
	for <lists+linux-omap@lfdr.de>; Tue,  3 Sep 2024 12:34:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 215E41C986A;
	Tue,  3 Sep 2024 12:34:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b="woK6q5Ro"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail.andi.de1.cc (mail.andi.de1.cc [178.238.236.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01F041B12F0;
	Tue,  3 Sep 2024 12:34:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.238.236.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725366851; cv=none; b=Ph7UO2t5N/tiCqUZt4NSOkDlOQT321TSQjOTC49CLp8Nxl4TzFVSMNxvYA+DDvE/KbsVftaAeedvSnf5YGt9qlcq6tNvZoGf5sdr7ffDdjyFGXIaWJcp4T3vid5G2gj4Em+l9RgfP82F53NJlzuCJ8U9aA49NX0HLdTLBrKbKEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725366851; c=relaxed/simple;
	bh=SiWgR6Peib7WlhWUO98AWvrkTvEyVs3s6lWHMwz0cMQ=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SRKs/ZFELXItEFfU8/6vHGrW/gV4Dl6e/4MxccySGHIVHwDAaQAZEJFO1moelyQWjbwGShKZ7HnvP32FPC35pDwDzDQtvdn5gfYjbBzrqKN4ThG9yoGKhkZUeZ5DWzNundfkYNvYx+CUmYHN4xF2UjYK4qGA81MtAuPlsfQK1iQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info; spf=pass smtp.mailfrom=kemnade.info; dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b=woK6q5Ro; arc=none smtp.client-ip=178.238.236.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=References:In-Reply-To:Cc:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=8SZt66SCL+CHxXSRTJ++DcbJFimuD6NwOHrMPTPVYMo=; b=woK6q5RoG65QNGY6HhHuL0JE/X
	9T24IIMQyUb82tDr903PeWWsT8KIOeAJ3imB+Muzn3JADVEEFfOm6HFOWjvxmLVFWui730N7XfVuv
	wpvEwsq9Q5gGYAXqt5c6H25UULG6XqN9cZhycXVPQTsDyk6A4lbfhuDITieuBVoh12BMXOS1U4QAL
	Fdn8Vcvzuc+k41wFqAwPNoyIU/AvwFRnCdHL9TpSOvciZp2gioZfigwM8PB+IM3yePkkU/LoPIPty
	l2Kr6sgaQFd4YVS3apJK0nRYkegqXYRwL8ypsgXhfR30FBrOigltCGMvIyKcY5hAtdMPVgm4XMwKM
	jXm3G/0A==;
Date: Tue, 3 Sep 2024 14:33:57 +0200
From: Andreas Kemnade <andreas@kemnade.info>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-omap@vger.kernel.org, linux-clk@vger.kernel.org, "Russell King
 (Oracle)" <rmk+kernel@armlinux.org.uk>, Paul Walmsley <paul@pwsan.com>,
 Tony Lindgren <tony@atomide.com>
Subject: Re: clk mess on omap4460 with mpu clock
Message-ID: <20240903143357.2532258b@akair>
In-Reply-To: <CAMuHMdWU74DsWEZtZQJctQQog=9UCG_1LZu5yWvyxx0Zw4LQow@mail.gmail.com>
References: <20240603234139.280629b2@aktux>
	<CAMuHMdWU74DsWEZtZQJctQQog=9UCG_1LZu5yWvyxx0Zw4LQow@mail.gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Am Mon, 2 Sep 2024 15:53:07 +0200
schrieb Geert Uytterhoeven <geert@linux-m68k.org>:

> Hi Andreas,
>=20
> On Mon, Jun 3, 2024 at 11:41=E2=80=AFPM Andreas Kemnade
> <andreas@kemnade.info> wrote:
> > just stumbled across this on 6.10-rc1:
> >
> > [    1.475830] ocp:target-module@48210000:mpu:fck: device ID is
> > greater than 24 [    1.483154] ti-sysc ocp:target-module@48210000:
> > could not add child clock fck: -12 =20
>=20
> And on boneblack:
>=20
> 48000000.interconnect:segment@200000:target-module@0:mpu@0:fck: device
> ID is greater than 24
> target-module@4b000000:target-module@140000:pmu@0:fck: device ID is
> greater than 24
>=20
> > Maybe
> >         /*
> >          * Use clkdev_add() instead of clkdev_alloc() to avoid the
> > MAX_DEV_ID
> >          * limit for clk_get(). If cl ever needs to be freed, it
> > should be done
> >          * with clkdev_drop().
> >          */
> > in ti-sysc.c does not work anymore?
> >
> > The offending clock definition is in omap4.dtsi
> >
> > clocks =3D <&mpuss_clkctrl OMAP4_MPU_CLKCTRL 0>;
> >
> > Did not bisect that yet. =20
>=20
> Commit 8d532528ff6a6b1b ("clkdev: report over-sized strings when
> creating clkdev entries") in v6.10-rc1, with follow-up commit
> 616501eccb58615f ("clkdev: don't fail clkdev_alloc() if over-sized")
> in v6.10-rc4.
>=20
> I have no idea if these clkdev registrations are still necessary/used.
>=20
well, it might explain some mystery behavior in the past. Lets
see where it comes from. As the comment says, there should be a
workaround against that limitation. So the problem should not be there
in the first place. I have some strange problems with
clk_disable_unused.

I first thought it is a id < 24 issue and not a strlen(something) < 24.

Regards,
Andreas

