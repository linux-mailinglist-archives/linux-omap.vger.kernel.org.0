Return-Path: <linux-omap+bounces-2482-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 99BA09AED60
	for <lists+linux-omap@lfdr.de>; Thu, 24 Oct 2024 19:12:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2C4AF28762F
	for <lists+linux-omap@lfdr.de>; Thu, 24 Oct 2024 17:12:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7385A1FAF1E;
	Thu, 24 Oct 2024 17:10:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ifUgwEqS"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DD451F76DC;
	Thu, 24 Oct 2024 17:10:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729789831; cv=none; b=rVMHu47r8kKA6/ku9J0VZ+KHO96l6r3x0CYYM7KnyM3hcH84BT1wU+F3oCPvnvVh/m3vgc/ae7Z0rJ1kca/twcY8M9d5N3ACLS4iblBMoWcJLqtuuiD5YwYnSd931asgJ+7c08CsfGW//+5JDUqAxL0JCxlipcr8WXvYx9/+QTY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729789831; c=relaxed/simple;
	bh=qzyA85RlVv5b1+7j63HwIxCokuuE9Z6WzA34gaCnMFU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EpvvuFPwwLnlY+ybENuIViYzjcjbwIXCICiiMlocVaVUx/5PZkKoMy0Q+5efWSh16R1YPMZeFIimh8gHdB4k7UQqvPe4PHNodMqjuXW5ONBXmBSyy7v65fnX3akJ9FbXXt9fxBM8UAdLU0xTAm01pczuULnLUFOAHWacFD9Gq1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ifUgwEqS; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2fabb837ddbso18709771fa.1;
        Thu, 24 Oct 2024 10:10:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729789826; x=1730394626; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=FTKrnBluD4JxPICdqME0ajZ+Fx27J0/+WYJKBnAywrU=;
        b=ifUgwEqSiytVMwYHhTkhKn2v0Xx37v4N7KCZ4KZ3VgDyFpS6MPuZXTJrBu1Yjxi7rL
         6MYO0VXKvBQ6kroLZcwvMwwgVGksWmOQm0pZTs0puhsCJ+MQG61W0MMbJU6rNLT1Ty3B
         s+trImFKOWzEZASw7EGpOsvpk8OIgarMqkKyKLFR4wfqe3lvoLbEaoNhnT/v8aT/5Ba5
         QiVmhcm8c6udZqQVq04YoLWFitZybMzt394FLOEj9qd/n81yV1epo/uUhpDPlncLqkXD
         kEbuRsVgDLu/g/uSZke0GHmDaP+q/zQfEsaKphOQLNe/0om6ZNnOL/u3wqEhZnhXe7HF
         xBug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729789826; x=1730394626;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FTKrnBluD4JxPICdqME0ajZ+Fx27J0/+WYJKBnAywrU=;
        b=jp84mokp/9ZlFZ2PWHSkmF6VoArnHVjou9etiKNklyiyqZhs1hQsk+VOPZJucBICpa
         nwgH2x1P3y6r0Zxs+wskl6FRbVD51kXVje2o9+N0y8PNv0+9bpqfh4V50S/fv7QUmiYM
         FdyIzjZkCIod1IitEJVDV593geq+lPk0vTTEAzJQZ92SC+yWWgzLocVVHOpSUrFl5FU5
         Ww6lWdPLSdxKWMCtrjq0fh38rMZlA21LtcKUNog6fEQa7CkXc0gEpOAtb2+I/h5zrDGD
         +Di0EoOZQ8k8lcDRVt4sqy4IiEr2/kG6BiRsqqCrODcmse5ckmco9OhsgqJu0FOTFaQY
         NRBw==
X-Forwarded-Encrypted: i=1; AJvYcCVKzoHnISE18jGzdRKNH9prh/fXwBPzZzP6STQd3JIZnvsOBpBNur8q3/h9wLOUsp43izcleu8ZAqQ=@vger.kernel.org, AJvYcCVbH1I6gAQCZ3lYW/ohlkk6BDKF1JavrHLDavg+mWYL2aDa0z5scI9jpuIkW4Z1thJCj6tgjC+VGVOz83A=@vger.kernel.org, AJvYcCWRRzwbOyG0NG9IZ4fnFevraVeG+YQ7RfjbGmFpmFY37bJOCjL8Az0wXzfHntMewfkZKRnbSBbVdGi88fs=@vger.kernel.org, AJvYcCXQ9eQ4wYmC4Jsp84uatUvV17C4YXoqADp6iwRcExDa+/sR9u1TCs20Gshp6R43Q/+YIs66zMBieHG8Ew==@vger.kernel.org
X-Gm-Message-State: AOJu0YxESBFzB9KgZok5SicunOV+sRJ4nEP0JitMnUgJEJXygxfAUDzB
	neNOtjJkvHt02xXNjTn4Y9AvjdTOf7yWUmdgKzoJqPA4USXTRfGq
X-Google-Smtp-Source: AGHT+IE6fiv+vs26SxlA2LCU8dr7H03wlCXlCxw07cHtczrt07/pTtUnxZ56Zdpp4aB7P5gDnnkT3Q==
X-Received: by 2002:a05:651c:1545:b0:2fb:3960:9667 with SMTP id 38308e7fff4ca-2fc9d31b55bmr61721431fa.14.1729789825771;
        Thu, 24 Oct 2024 10:10:25 -0700 (PDT)
Received: from orome (p200300e41f26ec00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f26:ec00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9a91370e75sm641392466b.130.2024.10.24.10.10.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Oct 2024 10:10:25 -0700 (PDT)
Date: Thu, 24 Oct 2024 19:10:23 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Celeste Liu <coelacanthushex@gmail.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Guo Ren <guoren@kernel.org>, 
	Anup Patel <anup@brainfault.org>, Heinrich Schuchardt <heinrich.schuchardt@canonical.com>, 
	Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
	Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>, 
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Russell King <linux@armlinux.org.uk>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, Tony Lindgren <tony@atomide.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Palmer Dabbelt <palmer@rivosinc.com>, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, loongarch@lists.linux.dev, 
	linux-sh@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rpi-kernel@lists.infradead.org, linux-omap@vger.kernel.org, linux-tegra@vger.kernel.org, 
	Stefan Wahren <wahrenst@gmx.net>, Kevin Hilman <khilman@baylibre.com>
Subject: Re: [PATCH v3 4/4] arm: defconfig: drop RT_GROUP_SCHED=y from
 bcm2835/tegra/omap2plus
Message-ID: <6m77wg6b76abyk2ebfniayxvrabvzur7onwar4isajb6tvfxbv@7a24p2xkmevj>
References: <20240910-fix-riscv-rt_group_sched-v3-0-486e75e5ae6d@gmail.com>
 <20240910-fix-riscv-rt_group_sched-v3-4-486e75e5ae6d@gmail.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="mgvujidfj33lw4eo"
Content-Disposition: inline
In-Reply-To: <20240910-fix-riscv-rt_group_sched-v3-4-486e75e5ae6d@gmail.com>


--mgvujidfj33lw4eo
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v3 4/4] arm: defconfig: drop RT_GROUP_SCHED=y from
 bcm2835/tegra/omap2plus
MIME-Version: 1.0

On Tue, Sep 10, 2024 at 08:51:10PM +0800, Celeste Liu wrote:
> Commit 673ce00c5d6c ("ARM: omap2plus_defconfig: Add support for distros
> with systemd") said it's because of recommendation from systemd. But
> systemd changed their recommendation later.[1]
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
> support it.
>=20
> [1]: https://github.com/systemd/systemd/commit/f4e74be1856b3ac058acbf1be3=
21c31d5299f69f
> [2]: https://bugzilla.redhat.com/show_bug.cgi?id=3D1229700
>=20
> Tested-by: Stefan Wahren <wahrenst@gmx.net>
> Acked-by: Kevin Hilman <khilman@baylibre.com>
> Signed-off-by: Celeste Liu <CoelacanthusHex@gmail.com>
> ---
>  arch/arm/configs/bcm2835_defconfig   | 1 -
>  arch/arm/configs/omap2plus_defconfig | 1 -
>  arch/arm/configs/tegra_defconfig     | 1 -
>  3 files changed, 3 deletions(-)

Any idea who will want to pick this up? Probably something the ARM SoC
maintainers can do directly, in which case:

Acked-by: Thierry Reding <treding@nvidia.com>

--mgvujidfj33lw4eo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmcaf38ACgkQ3SOs138+
s6Eb2RAAph/IveI76N2c7lk/cbmWs1cQoFHZmyzXgY26ZBU9nc81ILsjchLmkF85
h1M3kPkxMquC56MplXj0gSQGCIQIuLlbJf/cR4bL+PPOw7ecV5Dwg3cvg17do6+w
7+zAVkx+pXA8HbBAqVpHuQcP+YyPN4GEFDy8L8bdOa3GrAdpFKehSTCvr0cmvZCD
LtNd8P4xocqpMrxdGbH3YcOT/eJtbwlmRCYbeWavOtFfdiiIuNH73drj1L67sOjv
A0rgJOdsEtMCQG/sCtMkGd7KY62fZCE4nTu9RUM4/ett8nlROC674VgvJrpCW6Ym
hSZmJaRPXSInSFk9olAC3wWChah4WncpBj7qEfZ8g8dwMchFeGwgYTxxmCUIV7o8
A1Q1pbb1BMAS64SRaLv2bRkuWJ0FdI0bll+pihc7MSYtiWAuP5muOxK6QWdbr/ig
tTpYEh0PSsBkBAJ4zswAfXggM0HOUzqUOVsGDW0ky95K9pVDuDF9LVIY1FuEMgDw
72WHhE1zsbgVlfzTIOC0s8cD9ghl6e49g/TIl+BHxLh3xEWz2DOY8yLyj5M2OCgk
2Y+9jS20AREVOhtvxmeW5MDJavSj+4LXvqQE/7G63JDamadu/N1GYPfCqmQxQSiW
WaSdrnjknZjngwZWPQ+1p4LgKnlEr78OUc/jCnsSMyYXnBb3EzA=
=YCp7
-----END PGP SIGNATURE-----

--mgvujidfj33lw4eo--

