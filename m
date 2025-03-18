Return-Path: <linux-omap+bounces-3425-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 810FCA67342
	for <lists+linux-omap@lfdr.de>; Tue, 18 Mar 2025 12:58:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1ABBC1776D5
	for <lists+linux-omap@lfdr.de>; Tue, 18 Mar 2025 11:58:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED77020B7FA;
	Tue, 18 Mar 2025 11:57:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VNZz+D/d"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8278B20B209;
	Tue, 18 Mar 2025 11:57:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742299076; cv=none; b=OuROhSnZM5ege2b0L/9ELVdzKhMCaGVkfsPngV+h7cm+VLpAtQKH+DfjaegNYP29t8ZWmKE0TvAzN8njsRNFe+ZV+EkKvWWQlXjBv/kGP/PbO7hl4np1Tj4mm6mrcsbMYgtyd0gQL3dAflVmVU0IxhREbJo/wJcA5AtDZeDjNKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742299076; c=relaxed/simple;
	bh=CIhTjH9kKlO1VYGiipc2V9drjBD3Ayt0OkD0U7KRb6w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mkX+QsufJkG5ESeDyS8MStZiypuvHgZ5nG5rtiru83QJN+WT9kcXnOAqINGMsq5+YAu1bMS3ANP4KEBI0GkKnXizDG0W/f6r8obtzT9twjis2uRbNnvPA+ap5cmh2IszKPTMaMvBNL8gESw2IsmDKJv4sTk9sIzrG/C6KkX+DFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VNZz+D/d; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54476C4CEF4;
	Tue, 18 Mar 2025 11:57:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742299076;
	bh=CIhTjH9kKlO1VYGiipc2V9drjBD3Ayt0OkD0U7KRb6w=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=VNZz+D/dtbyshE97W4HnLDn48vAHhWJ1qM3mL/ZcYLXzJCavmJHa91JYiiOlMNJbz
	 3UQHEcUGagflvTa1naQQ3WhxL7VDkHEqM2S7CkzCA9R2QNMrKsOF/87TV8TeAU7pag
	 JnyeHsFK4NM+n6Sd6iwRDBgTTtsst7XHqqi+SMHGvuW0tYLqcabFNOqlgCauzVkD73
	 FEV87vVnNi6+5cugxgHyXPjIWm09qmE4hdd7e5vWrscoz4DVCqYqP4MsFlrfEg/D+e
	 hisoP8e3IL/aZBRIfu7TRQITKlDjGtX7HEA5nLU4mGdskuoLTKP3Pn1CaVYbWjJBBQ
	 A9XO+vMkI9ejg==
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-5e677f59438so8669594a12.2;
        Tue, 18 Mar 2025 04:57:56 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUJn93+o9VThlJf248T8kDQN0A25pxlXD426wHkpSJ00P3nXOoDnyafmlQXi8g4RO1jV2w1+PHwdr13iq4=@vger.kernel.org, AJvYcCUQsv5tW7vwkMCEaajjS4tsu/CRPnrO21Tu2Vdiup8EhoC9mP/7yp/eN6USyp1IFV6xmtvvVcMF/8CMaA==@vger.kernel.org, AJvYcCXVWDtIkYsLnWBxymQTWh/RftqE3HUUANA66uM2rw6ONmrWYR8a87w9TMFGpmgiptUiuZGCspS1iTDkfCo=@vger.kernel.org, AJvYcCXf5pDmhbsiUMlSdYGefVs3+rbL9LuCwZsMOppZDeept2Jk1as5iU0h6+b9ztyq2D4QZN/yhDoypD4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwykM1XlCIEFflRUYmbznl9cYV/f8jcegCN+P7iUygQu6JIZWKj
	Y9mLOY1Faam2YLWclHhHVXYf7VDMBmhJxOw/WjzpWjd6PTIFKYiQKKBcVmh3BnE2FnfhZZ2PSlD
	+sqzRaWIRxQgDYCpKZnxPOcEySeU=
X-Google-Smtp-Source: AGHT+IHWKrMLWQmDlK3EXFGkIz3JuWrB7n/PbIZxnJSxvCf68cavwFPKlU+WgeLv6v2/CTfArLyeiik7sHtiA+Oo+58=
X-Received: by 2002:a17:907:1009:b0:ac3:3f10:e8e3 with SMTP id
 a640c23a62f3a-ac33f10ed5cmr1299294766b.1.1742299074804; Tue, 18 Mar 2025
 04:57:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250115-fix-riscv-rt_group_sched-v4-0-607606fe73a5@coelacanthus.name>
 <20250115-fix-riscv-rt_group_sched-v4-4-607606fe73a5@coelacanthus.name> <t2dustbykx2qd24wazjeiw5hch5nwr6z2ewmaf4srg6r2grwrf@rdw47chzkef2>
In-Reply-To: <t2dustbykx2qd24wazjeiw5hch5nwr6z2ewmaf4srg6r2grwrf@rdw47chzkef2>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Tue, 18 Mar 2025 19:57:44 +0800
X-Gmail-Original-Message-ID: <CAAhV-H4fTGs-7EXE0EcR=P6GqHF2fokRE-kEte+cDmhjy=FYsA@mail.gmail.com>
X-Gm-Features: AQ5f1Jo4W5NNqo2SfcBdxKCe2OFxQs4im7DaCODl6wEw6MnCM3-sp2pnyba2ZAw
Message-ID: <CAAhV-H4fTGs-7EXE0EcR=P6GqHF2fokRE-kEte+cDmhjy=FYsA@mail.gmail.com>
Subject: Re: [PATCH v4 4/4] arm: defconfig: drop RT_GROUP_SCHED=y from bcm2835/tegra/omap2plus
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Celeste Liu <uwu@coelacanthus.name>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Guo Ren <guoren@kernel.org>, 
	Anup Patel <anup@brainfault.org>, 
	Heinrich Schuchardt <heinrich.schuchardt@canonical.com>, WANG Xuerui <kernel@xen0n.name>, 
	Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>, 
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Russell King <linux@armlinux.org.uk>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, Tony Lindgren <tony@atomide.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Aaro Koskinen <aaro.koskinen@iki.fi>, 
	Andreas Kemnade <andreas@kemnade.info>, Kevin Hilman <khilman@baylibre.com>, 
	Roger Quadros <rogerq@kernel.org>, Palmer Dabbelt <palmer@rivosinc.com>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, loongarch@lists.linux.dev, 
	linux-sh@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rpi-kernel@lists.infradead.org, linux-omap@vger.kernel.org, 
	linux-tegra@vger.kernel.org, Stefan Wahren <wahrenst@gmx.net>, 
	Thierry Reding <treding@nvidia.com>, soc@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 7, 2025 at 3:19=E2=80=AFAM Thierry Reding <thierry.reding@gmail=
.com> wrote:
>
> On Wed, Jan 15, 2025 at 04:41:23AM +0800, Celeste Liu wrote:
> > Commit 673ce00c5d6c ("ARM: omap2plus_defconfig: Add support for distros
> > with systemd") said it's because of recommendation from systemd. But
> > systemd changed their recommendation later.[1]
> >
> > For cgroup v1, if turned on, and there's any cgroup in the "cpu" hierar=
chy it
> > needs an RT budget assigned, otherwise the processes in it will not be =
able to
> > get RT at all. The problem with RT group scheduling is that it requires=
 the
> > budget assigned but there's no way we could assign a default budget, si=
nce the
> > values to assign are both upper and lower time limits, are absolute, an=
d need to
> > be sum up to < 1 for each individal cgroup. That means we cannot really=
 come up
> > with values that would work by default in the general case.[2]
> >
> > For cgroup v2, it's almost unusable as well. If it turned on, the cpu c=
ontroller
> > can only be enabled when all RT processes are in the root cgroup. But i=
t will
> > lose the benefits of cgroup v2 if all RT process were placed in the sam=
e cgroup.
> >
> > Red Hat, Gentoo, Arch Linux and Debian all disable it. systemd also doe=
sn't
> > support it.
> >
> > [1]: https://github.com/systemd/systemd/commit/f4e74be1856b3ac058acbf1b=
e321c31d5299f69f
> > [2]: https://bugzilla.redhat.com/show_bug.cgi?id=3D1229700
> >
> > Tested-by: Stefan Wahren <wahrenst@gmx.net>
> > Acked-by: Kevin Hilman <khilman@baylibre.com>
> > Acked-by: Thierry Reding <treding@nvidia.com>
> > Signed-off-by: Celeste Liu <uwu@coelacanthus.name>
> > ---
> >  arch/arm/configs/bcm2835_defconfig   | 1 -
> >  arch/arm/configs/omap2plus_defconfig | 1 -
> >  arch/arm/configs/tegra_defconfig     | 1 -
> >  3 files changed, 3 deletions(-)
>
> Hi Arnd,
>
> is this something that you could pick up? I think so far only the RISC-V
> patch was picked up, but nobody seems to feel responsible for the ARM
> patch here.
I will take the LoongArch patch, but may be squashed to another one
about config file update.

Huacai

>
> Thierry

