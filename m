Return-Path: <linux-omap+bounces-3340-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C631BA5566E
	for <lists+linux-omap@lfdr.de>; Thu,  6 Mar 2025 20:20:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F0736175C81
	for <lists+linux-omap@lfdr.de>; Thu,  6 Mar 2025 19:20:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B767326D5B8;
	Thu,  6 Mar 2025 19:19:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gPva8+Y/"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8BD520967A;
	Thu,  6 Mar 2025 19:19:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741288794; cv=none; b=ouy8rx0RiBY90zvYC8RXlApI6VU1NGQo888kaVTGtgu5LGUL7A+PSe6rGRy1x1a6d08YpDEdEUi3AHbS4BDLB33gZNKl/DVeuBPUYeyfNlWg0yaql5x0WpDW8VkUMcJwfHwlnXQuqG7h/KHJRljKtMuPVZYkVnoP09j/j+zMy+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741288794; c=relaxed/simple;
	bh=VCSeFIkK2OWdz1dEx4pV+Rw9hAHhlwzqN1Th+gTyRaM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aZ7uI01oIo09hCyrMRnHbOZcZey/eMUFz6PWx++VGCTulPQpiFfx1j6Efofo4qVZ+KuEUFZrwjmwyqG/6a6bPujRtdklxSr+Altm7BTfVp1qZiCWkh061zCpcz4YLS5bEaNPnSMBXCnH1+4KDdTdIgrx4fDsagyz+jsqdftbMgc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gPva8+Y/; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-43bc6a6aaf7so8384885e9.2;
        Thu, 06 Mar 2025 11:19:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741288791; x=1741893591; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/eOCz6p5uyWrnGjfkKjBisd5HzVXiT1RDyr/H3ZddfA=;
        b=gPva8+Y/HIbF9ckfctZAFHU+eQ43yTYmSyr9ncYhz9ZCHvsg6W5Y0xQ0Y8zB4zBK7S
         RWcpSDkc7WqUQiu7TVNZZxC2ziJA7vBetoO8Nv896/dCL4/HQCahp6JBX5dSx8j1SyRS
         MM8k5B0e47z1zQSNpMqViN/2ZiYDih+JjGtVunUj/oQkOLWviIMOJ567Va2gfeUaOEXn
         PGCh+JMr6UHrk+ativKlNHnM4vXdjyT2Pf3zhbX9uk3yR8y/HF2A5tAbndpnGO1tM/Tm
         scvqwpcGpli7SbL/lmT6vXLKB1h0CwusfQLIl8Zy1dbJH/tRhOxEbt6N5UkD/UjAFTCf
         2sfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741288791; x=1741893591;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/eOCz6p5uyWrnGjfkKjBisd5HzVXiT1RDyr/H3ZddfA=;
        b=PI67lrkTzv7ermuYVWEgNvyYw4gDuGgeknNLjgUpAf5ZKXBeu02EBBTxWUFG0tJqZG
         ikfVSIWNqjv5cgOwOySvdvq8uwxDhhbq+8AYhY53Dpkb4IbYaGSoYEQ0XS69aFgPylCE
         aVXwmghR6f6nth7CeQotTIcEmaU3ftS4R5Bjmjld0dnG6qZ8f4Zamtnb1wLKsixYM2lM
         fASl+V1irHsVbMD4Mt6R2BcA0qhn6fffsWVmNDcxSMUfj52BW39IcoaShpK5hgU7k+ks
         HHKlwSITwF6+1Ts6P+lm5h02kreYnEQqiNlCefN/mtGxTgRsWQ5GVtvO8zyhX3vbe4pD
         oOiw==
X-Forwarded-Encrypted: i=1; AJvYcCUAX2Ugqx1i2xDEttndz/In+rty5HgJBykwRNn7X6lkzpWQyKPsVMCXQvNJhUw+IDyqMYP4Umzocio=@vger.kernel.org, AJvYcCVVljmzJJPfRpZRF4fYzzr3O9jX+pnhXedczYDa5Otay5hMdDWllPfnWb2EMQrxMTUht71errnHi7dOug==@vger.kernel.org, AJvYcCVy10cOIV1UhHpgUUnQP0Fc/2PUMO+4/gEsdSEU3uoJ9KV65NSEPAR2MhJ9lB2JAcJP1OUw88LqBhvRn/8=@vger.kernel.org, AJvYcCXtbVhDYOfs4tM4xgOfHOC1U+TYz7TJ5cVBgJsTQnk9Dpud07aRcgmjKXR/jYnBEDIGgSQwHKgi05T8N0M=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy++M94SXdWFQOW7nF3e+i/Q1cDGlK/qbed5wjUMaXi4EHpCsye
	ybrUHmGguAdRYUKwD0GIhFVMGAyZ5E6cp3IeBj7qCSuV6cds79i8
X-Gm-Gg: ASbGnct9CKSoRkDxAl899uLkWyDXIawPB81G885CfI3ntdzkyP4llhATvFIXc819rJC
	q5NKokZyJlKYsVjK5M6B707FMQBIvbj5JWWQ5xKROMLMC/t41AIisrXhYvII2o7bnsDzlmMTPnf
	gRQ4IxkD46ylMbWsE48co9dboYgOMASnBCRjC+1+1cSHaAAbBgKB0Qq6hmfpaTaM6ZXZWZAXHff
	cRcY3DOU3SQur5UiQT8u9H4nRFHprpqAqgkgSWncKJk/RpmCfrBq2JCe+e6XI34XyDrdRIkFwcD
	Cj4FEw3Gwd34mdZKHGzHRwDm1nBcypypOo4+wJZhcbvbkcvxOcfHTm6sq7YSPlJQZz4PrI54WGo
	FKLxFimQfwECN8imP8KNNxmnY3wtDoSg=
X-Google-Smtp-Source: AGHT+IGlEvntMF2i7X6Axx8OQDb9BYfoARMqUag9hgvpN2gkfNJBXg+ADawzvsmbM+xjKyCC9YlPOA==
X-Received: by 2002:a05:600c:8a8:b0:43b:ca39:a9ca with SMTP id 5b1f17b1804b1-43c5a60e07amr7077505e9.16.1741288790433;
        Thu, 06 Mar 2025 11:19:50 -0800 (PST)
Received: from orome (p200300e41f3a9f00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f3a:9f00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43bdd8b0461sm30190845e9.4.2025.03.06.11.19.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Mar 2025 11:19:49 -0800 (PST)
Date: Thu, 6 Mar 2025 20:19:46 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Celeste Liu <uwu@coelacanthus.name>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Guo Ren <guoren@kernel.org>, Anup Patel <anup@brainfault.org>, 
	Heinrich Schuchardt <heinrich.schuchardt@canonical.com>, Huacai Chen <chenhuacai@kernel.org>, 
	WANG Xuerui <kernel@xen0n.name>, Yoshinori Sato <ysato@users.sourceforge.jp>, 
	Rich Felker <dalias@libc.org>, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, 
	Russell King <linux@armlinux.org.uk>, Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, Tony Lindgren <tony@atomide.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Aaro Koskinen <aaro.koskinen@iki.fi>, 
	Andreas Kemnade <andreas@kemnade.info>, Kevin Hilman <khilman@baylibre.com>, 
	Roger Quadros <rogerq@kernel.org>, Palmer Dabbelt <palmer@rivosinc.com>, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, loongarch@lists.linux.dev, 
	linux-sh@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rpi-kernel@lists.infradead.org, linux-omap@vger.kernel.org, linux-tegra@vger.kernel.org, 
	Stefan Wahren <wahrenst@gmx.net>, Thierry Reding <treding@nvidia.com>, soc@lists.linux.dev
Subject: Re: [PATCH v4 4/4] arm: defconfig: drop RT_GROUP_SCHED=y from
 bcm2835/tegra/omap2plus
Message-ID: <t2dustbykx2qd24wazjeiw5hch5nwr6z2ewmaf4srg6r2grwrf@rdw47chzkef2>
References: <20250115-fix-riscv-rt_group_sched-v4-0-607606fe73a5@coelacanthus.name>
 <20250115-fix-riscv-rt_group_sched-v4-4-607606fe73a5@coelacanthus.name>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="zlzxkvnluqa6wgik"
Content-Disposition: inline
In-Reply-To: <20250115-fix-riscv-rt_group_sched-v4-4-607606fe73a5@coelacanthus.name>


--zlzxkvnluqa6wgik
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v4 4/4] arm: defconfig: drop RT_GROUP_SCHED=y from
 bcm2835/tegra/omap2plus
MIME-Version: 1.0

On Wed, Jan 15, 2025 at 04:41:23AM +0800, Celeste Liu wrote:
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
> Acked-by: Thierry Reding <treding@nvidia.com>
> Signed-off-by: Celeste Liu <uwu@coelacanthus.name>
> ---
>  arch/arm/configs/bcm2835_defconfig   | 1 -
>  arch/arm/configs/omap2plus_defconfig | 1 -
>  arch/arm/configs/tegra_defconfig     | 1 -
>  3 files changed, 3 deletions(-)

Hi Arnd,

is this something that you could pick up? I think so far only the RISC-V
patch was picked up, but nobody seems to feel responsible for the ARM
patch here.

Thierry

--zlzxkvnluqa6wgik
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmfJ9VIACgkQ3SOs138+
s6EV1hAAmmOA9bt5ezD7ZL1JWnDlfosEhXQikLJbSz+gAvX+YGSrCEY9u9RhonZS
bc+6iwnvUoA0HbqdTecbWzifzHz/JqnPCAdrdoQwSspJ3onSZAnRPj1u8NRDv/gy
54LG7uX7qWZhH9OF/MHqQbjHo01dXl8OmaRrAUgUK3h2AgyzJldR0uOaQ+tQ3F4o
iPzt2JxJUBabJUImAV7wivSnMt3pPaGBS6BN203I26wIeGAY8ZuMKJrnQS/4Mmis
5lxuMl8dTaQaJ+WaJeKwRpZgI22JnMKabnDwaQ6nDuLOMY5/KOeAv2DXGZOZ8qRn
8LDhTlnir1RsuEbgf7b/CYHMNnZA4RSY6puetzCaAQ0WSb1ENMSyGcGM0HzZ49ps
6rrPpo+yWldcHVDQzbiiXIs6pWMeVvmNufpR8D/FweKG0gyqZSiDCZXJdEZjYgbu
gYp+qfQ9LiVjK1t2Z/MY0RkvaZBNhNfK29wX+oT4bPbhkV/Sep7wL1w8VCegqV/g
BzXxAu5HjRDRtfMdOzqBh3EGJfT5hmsJyH5nKD7uT5B7a8gYwUjB0pcX8cOJyCI+
oAd9Y7gS3IUWMLLOk7mFGWiIcPcO9so87NoMSlmNnVc/dZPpojNAvu/kcMgnpLSq
0Ss2JFGPVzSn+zgNVsP3A8TK/8JR41YyK/M+QEH18WZuNXQcH5o=
=P21d
-----END PGP SIGNATURE-----

--zlzxkvnluqa6wgik--

