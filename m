Return-Path: <linux-omap+bounces-2153-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B47B971A58
	for <lists+linux-omap@lfdr.de>; Mon,  9 Sep 2024 15:07:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id ADBE81F23793
	for <lists+linux-omap@lfdr.de>; Mon,  9 Sep 2024 13:07:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA7A61B9B33;
	Mon,  9 Sep 2024 13:07:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="Y1dafvuv"
X-Original-To: linux-omap@vger.kernel.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 838FC1B9B24;
	Mon,  9 Sep 2024 13:07:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.154.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725887254; cv=none; b=XSoZkEtsTUWBxrebhaYmlZITJZYBl2hApfB6s/MqmBvQ3Urs5HfDw1ocqghRJd4VJBIl00z+aLMR5DMp+x7JtAoiVZTMro8AA/oMA+gd4bdsyWxkXrkWH1QbsxvDqxs1pqF7bTtP//46s5PkpGISgR4j+k0WQT9gfunHjOTofkA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725887254; c=relaxed/simple;
	bh=E4RRuE/i/qRg5/oov9kgzW8yHUJaA1SH34naXvnk51U=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fxnuDp6PkG+ZU+ivPyYsuJHR7QidUOusrGUuPpWeOkSh2xeCbFlLm5z0+TuGLFdT0qIDNsOaHO6aCvjEDHFqIm3QzNMesUfqiQXGj0VXqZeAMNBKfvm4ur+lFxtxcOzEdsdhQnT4VOeEOO8OCLCQtmQbpOik4xqoIi2Yx9IZ+Uw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=Y1dafvuv; arc=none smtp.client-ip=68.232.154.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1725887252; x=1757423252;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=E4RRuE/i/qRg5/oov9kgzW8yHUJaA1SH34naXvnk51U=;
  b=Y1dafvuvBV5oGZ+mxyrVRjj3mBIwaiVLKdLvxfCkVmWL9ia89vgyZHUC
   nJ1XJQVD7iRfRDuZxzQN9+mQsrEOzYnwxiOehaAGXUgXCoa6ammTX0pvz
   Vva4qujIlCWDXMMh5xYamXbL7mARYL2PmtzIFeuenPVVPm69lk5ku4QrG
   bEiPBMG2va9GhyjObW5FrusD6UDnCxMDmIzTVNBXsogKD8KbxIyyDTREW
   g49flZmrofK1g8E+3ma53bcD9q1g6KukQTpoj4L+GwAZC0crMza3SjK3e
   r8XFmgdatr7nATUiy8SCwGXSCX/mgw1cvnRWWdMaqDNVt7Qlzr9vhkB7m
   A==;
X-CSE-ConnectionGUID: 3dr8ppBdTSqlMqiZcvwtew==
X-CSE-MsgGUID: 7eQd4TXpT4qDo4RNMd5DoA==
X-IronPort-AV: E=Sophos;i="6.10,214,1719903600"; 
   d="asc'?scan'208";a="198949684"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 09 Sep 2024 06:07:30 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 9 Sep 2024 06:07:25 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex01.mchp-main.com (10.10.85.143)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35 via Frontend
 Transport; Mon, 9 Sep 2024 06:07:21 -0700
Date: Mon, 9 Sep 2024 14:06:48 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Celeste Liu <coelacanthushex@gmail.com>
CC: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
	<palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Guo Ren
	<guoren@kernel.org>, Anup Patel <anup@brainfault.org>, Heinrich Schuchardt
	<heinrich.schuchardt@canonical.com>, Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>, Yoshinori Sato <ysato@users.sourceforge.jp>,
	Rich Felker <dalias@libc.org>, John Paul Adrian Glaubitz
	<glaubitz@physik.fu-berlin.de>, Russell King <linux@armlinux.org.uk>, Florian
 Fainelli <florian.fainelli@broadcom.com>, Broadcom internal kernel review
 list <bcm-kernel-feedback-list@broadcom.com>, Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>, Tony Lindgren <tony@atomide.com>,
	Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter
	<jonathanh@nvidia.com>, Palmer Dabbelt <palmer@rivosinc.com>,
	<linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<loongarch@lists.linux.dev>, <linux-sh@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>,
	<linux-rpi-kernel@lists.infradead.org>, <linux-omap@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>
Subject: Re: [PATCH v2 1/4] riscv: defconfig: drop RT_GROUP_SCHED=y
Message-ID: <20240909-arguable-detection-02445bd1cc89@wendy>
References: <20240823-fix-riscv-rt_group_sched-v2-0-e4dbae24f7e1@gmail.com>
 <20240823-fix-riscv-rt_group_sched-v2-1-e4dbae24f7e1@gmail.com>
 <20240909-gave-celtic-af2ea8bc38d5@wendy>
 <9e364ae4-dc2c-4efa-8611-462218402a5d@gmail.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="0hp6eR1gUAB5lPpR"
Content-Disposition: inline
In-Reply-To: <9e364ae4-dc2c-4efa-8611-462218402a5d@gmail.com>

--0hp6eR1gUAB5lPpR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 09, 2024 at 08:14:16PM +0800, Celeste Liu wrote:
> On 2024-09-09 19:53, Conor Dooley wrote:
>=20
> > On Fri, Aug 23, 2024 at 01:43:26AM +0800, Celeste Liu wrote:
> >> Commit ba6cfef057e1 ("riscv: enable Docker requirements in defconfig")
> >> introduced it because of Docker, but Docker has removed this requireme=
nt
> >> since [1] (2023-04-19).
> >>
> >> For cgroup v1, if turned on, and there's any cgroup in the "cpu" hiera=
rchy it
> >> needs an RT budget assigned, otherwise the processes in it will not be=
 able to
> >> get RT at all. The problem with RT group scheduling is that it require=
s the
> >> budget assigned but there's no way we could assign a default budget, s=
ince the
> >> values to assign are both upper and lower time limits, are absolute, a=
nd need to
> >> be sum up to < 1 for each individal cgroup. That means we cannot reall=
y come up
> >> with values that would work by default in the general case.[2]
> >>
> >> For cgroup v2, it's almost unusable as well. If it turned on, the cpu =
controller
> >> can only be enabled when all RT processes are in the root cgroup. But =
it will
> >> lose the benefits of cgroup v2 if all RT process were placed in the sa=
me cgroup.
> >>
> >> Red Hat, Gentoo, Arch Linux and Debian all disable it. systemd also do=
esn't
> >> support it.[3]
> >>
> >> [1]: https://github.com/moby/moby/commit/005150ed69c540fb0b5323e0f2208=
608c1204536
> >> [2]: https://bugzilla.redhat.com/show_bug.cgi?id=3D1229700
> >> [3]: https://github.com/systemd/systemd/issues/13781#issuecomment-5491=
64383
> >>
> >> Fixes: ba6cfef057e1 ("riscv: enable Docker requirements in defconfig")
> >=20
> > I don't think this fixes tag is suitable, the commit you cite in
> > moby/docker is a year younger than the one in the fixes tag, so it was
> > correct at the time it was written. I think the fixes tag should just be
> > removed, since that commit was not wrong. Or am I missing something?
>=20
> The Docker commit I cited introduce the fix, not the bug. So it should be=
 later
> than commit in fixes tag, otherwise Heinrich Schuchardt won't pick the wr=
ong
> config from upstream.
>=20
> Timeline is:
> 1) 2015-06-19 Qiang Huang introduce RT_GROUP_SCHED check in Docker.[1]
> 2) 2022-06-08 Heinrich Schuchardt pick this to defconfig in commit
>               in fixes tag.
> 3) 2023-04-19 Florian Schmaus remove this requirement from Docker in
>               commit I cited.

Yes, this is the way I understood things to be. IOW, when Heinrich wrote
ba6cfef057e1 ("riscv: enable Docker requirements in defconfig"), it was
a requirement for docker. The requirement later being removed doesn't
make his patch incorrect, which is why I don't think this is a fix.

--0hp6eR1gUAB5lPpR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZt7y6AAKCRB4tDGHoIJi
0iy2AQDO+J8hujJIKzDG3Tt61SU7uY4jZrPVSF7Wt04GvnnrUAD/R5bugsa3nUum
Fkt27iTRmJcCAdjr+VwrO5JvzhczMQo=
=mCFv
-----END PGP SIGNATURE-----

--0hp6eR1gUAB5lPpR--

