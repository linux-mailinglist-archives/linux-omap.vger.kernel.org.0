Return-Path: <linux-omap+bounces-2151-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DE3389718C1
	for <lists+linux-omap@lfdr.de>; Mon,  9 Sep 2024 13:54:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 96E082813F8
	for <lists+linux-omap@lfdr.de>; Mon,  9 Sep 2024 11:54:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF5591B6539;
	Mon,  9 Sep 2024 11:54:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="h9w5RVGK"
X-Original-To: linux-omap@vger.kernel.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0618F17BB04;
	Mon,  9 Sep 2024 11:54:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.154.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725882861; cv=none; b=QiZu4ADPv+9Qc5svFOFlfELFjPtImInBPYOwOJOIqTn3LaDmhdNOYcG2ToxTGmusEu8545+uXk4+NSSDTpnvAW+nQkFHdZqAqHhWaSDuGRdhzDqE8GGD/jv/I/Bw9xg0X8Equk5EtmdkmjzOlbTLNVjEpDB2BmahVArK1/teDy4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725882861; c=relaxed/simple;
	bh=S/0Gvcdwc9czGIGZ/KN+mgXrysiIL6aDrU9W19Ga/ZE=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pKbgQJwuBrnARVRUytO8nmmmFrrqLOH3ytIKt/NPBv19JV8SbDktlAVR+7mmtNG3xe2vBJ1QsHZtRqLfaPjTB+lB4hzoN8JSqbXZAYl6u9h77tjXjnQZ5uiX8Ey5zdeeLfXsMKtJesDW0ukYnzw/azxArHqnYVRUwWBIThgn9iY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=h9w5RVGK; arc=none smtp.client-ip=68.232.154.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1725882859; x=1757418859;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=S/0Gvcdwc9czGIGZ/KN+mgXrysiIL6aDrU9W19Ga/ZE=;
  b=h9w5RVGKp8A/YMgL8zgEtbXena/cWIWEdeH9IOGbgGc4KxM5KLuxaAg7
   tgx3ImNnN0ZC9eZI9Bhp1hhUrqhJy/S24m69g9qwfOMyRdVvVQEWzz2Zi
   Oi164IJzZODTJsavTZg27WGHk1UGefXPWmp316CyqhvUo1HBm3wP6Hc2E
   sIVVv1R1wUWTGoVilrakRujDJu+QzEfYvsQWCC155a++RklOulE68XqMO
   3OY77aEwy7tT2yOgVZUdZqZR9nB+up/yu9C6cTf4RDuZCLBvwTtnfF+5s
   R7DPjzONhYmIN37guh+yfaHeDMn9MmDfJd0sL+v+KV6g2CxaYQPrOAf5y
   Q==;
X-CSE-ConnectionGUID: Ke3+C3CXR++lxv0xXUTyow==
X-CSE-MsgGUID: Jln5HjirQm6z9i/EpH+Fiw==
X-IronPort-AV: E=Sophos;i="6.10,214,1719903600"; 
   d="asc'?scan'208";a="32144688"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 09 Sep 2024 04:54:17 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 9 Sep 2024 04:53:54 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex02.mchp-main.com (10.10.85.144)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35 via Frontend
 Transport; Mon, 9 Sep 2024 04:53:50 -0700
Date: Mon, 9 Sep 2024 12:53:17 +0100
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
Message-ID: <20240909-gave-celtic-af2ea8bc38d5@wendy>
References: <20240823-fix-riscv-rt_group_sched-v2-0-e4dbae24f7e1@gmail.com>
 <20240823-fix-riscv-rt_group_sched-v2-1-e4dbae24f7e1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="SUs/mhM/C8VTfn2w"
Content-Disposition: inline
In-Reply-To: <20240823-fix-riscv-rt_group_sched-v2-1-e4dbae24f7e1@gmail.com>

--SUs/mhM/C8VTfn2w
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 23, 2024 at 01:43:26AM +0800, Celeste Liu wrote:
> Commit ba6cfef057e1 ("riscv: enable Docker requirements in defconfig")
> introduced it because of Docker, but Docker has removed this requirement
> since [1] (2023-04-19).
>=20
> For cgroup v1, if turned on, and there's any cgroup in the "cpu" hierarch=
y it
> needs an RT budget assigned, otherwise the processes in it will not be ab=
le to
> get RT at all. The problem with RT group scheduling is that it requires t=
he
> budget assigned but there's no way we could assign a default budget, sinc=
e the
> values to assign are both upper and lower time limits, are absolute, and =
need to
> be sum up to < 1 for each individal cgroup. That means we cannot really c=
ome up
> with values that would work by default in the general case.[2]
>=20
> For cgroup v2, it's almost unusable as well. If it turned on, the cpu con=
troller
> can only be enabled when all RT processes are in the root cgroup. But it =
will
> lose the benefits of cgroup v2 if all RT process were placed in the same =
cgroup.
>=20
> Red Hat, Gentoo, Arch Linux and Debian all disable it. systemd also doesn=
't
> support it.[3]
>=20
> [1]: https://github.com/moby/moby/commit/005150ed69c540fb0b5323e0f2208608=
c1204536
> [2]: https://bugzilla.redhat.com/show_bug.cgi?id=3D1229700
> [3]: https://github.com/systemd/systemd/issues/13781#issuecomment-5491643=
83
>=20
> Fixes: ba6cfef057e1 ("riscv: enable Docker requirements in defconfig")

I don't think this fixes tag is suitable, the commit you cite in
moby/docker is a year younger than the one in the fixes tag, so it was
correct at the time it was written. I think the fixes tag should just be
removed, since that commit was not wrong. Or am I missing something?

> Signed-off-by: Celeste Liu <CoelacanthusHex@gmail.com>
> ---
>  arch/riscv/configs/defconfig | 1 -
>  1 file changed, 1 deletion(-)
>=20
> diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
> index 12dc8c73a8ac..de85c3ab261e 100644
> --- a/arch/riscv/configs/defconfig
> +++ b/arch/riscv/configs/defconfig
> @@ -9,7 +9,6 @@ CONFIG_CGROUPS=3Dy
>  CONFIG_MEMCG=3Dy
>  CONFIG_CGROUP_SCHED=3Dy
>  CONFIG_CFS_BANDWIDTH=3Dy
> -CONFIG_RT_GROUP_SCHED=3Dy
>  CONFIG_CGROUP_PIDS=3Dy
>  CONFIG_CGROUP_FREEZER=3Dy
>  CONFIG_CGROUP_HUGETLB=3Dy
>=20
> --=20
> 2.46.0
>=20

--SUs/mhM/C8VTfn2w
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZt7hrQAKCRB4tDGHoIJi
0ucHAQCjkWwsUr+Tf13mvf/NIW8TxI0fFZYidIvfu2FZrQ6WAQEA74PlsEXjODkK
cpamVx+2CMaasJI43MaDxnWfquAS/QU=
=+ur3
-----END PGP SIGNATURE-----

--SUs/mhM/C8VTfn2w--

