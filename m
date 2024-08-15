Return-Path: <linux-omap+bounces-1913-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CBC2953B22
	for <lists+linux-omap@lfdr.de>; Thu, 15 Aug 2024 21:53:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AF0B51C24F3E
	for <lists+linux-omap@lfdr.de>; Thu, 15 Aug 2024 19:53:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37BDC13C90F;
	Thu, 15 Aug 2024 19:53:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eQJE1z4v"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D4E07E107;
	Thu, 15 Aug 2024 19:53:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723751626; cv=none; b=Y0Y1bCXWOCle/z+pOt8KuIZoCcpnM7L/MGcBTbtpJfbzLiETZV08H+ukreBnjc3E5DDYhDs86d2hqrS3jPZsrhyb0RntZ5XpHwfhKvLe07i+M10YOQcNpXf3AZpoTCcVkaX+iGdBqj8Hyidi8F6jCbjc2UgyeuhT2N3B3DlwdWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723751626; c=relaxed/simple;
	bh=MAZujTYwAmQXUe1+2BFze16BYrJqanpZwfb15WFviIo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cz9X6cLV0rABd03AYuWGStZpNHMEAEng/Y0lpEs/oFwSb1XQIsxwUrUDqIIP63t0rJRYNFJA11qsEyDsCOvxrb2M71S6fS+b3xsqnxrxu9lCJwMO+jairTnzYtNPW91zB7B6zJ5arDm6JRxk2Xw2SJB9iwT5uc6D17/e28IjotY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jeremypeper.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eQJE1z4v; arc=none smtp.client-ip=209.85.210.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jeremypeper.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f46.google.com with SMTP id 46e09a7af769-7091558067eso646002a34.3;
        Thu, 15 Aug 2024 12:53:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723751623; x=1724356423; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kX+e5rSxihbTvjSe1DavLWfqSJBAz8X9OHf/N6SEge0=;
        b=eQJE1z4voqwmMFg4nDR7AK5IJZgypBiJhh//zcAp+qEozaH5d7SVDBluScZwZTAC/r
         qvOxqWO+a4xxboSyp+WA9PSYBBTJWVyUgFpwLkkL7r/oinq/ij5FHN7FuavgHAc/Zh7X
         j7z0Lltm+0qS75ebk0Q7yMtdL7ansPkej3uOQxq7IDY0O0zlNBrKFk+/FclIlwMuIbNL
         nvdTrEg87laNhsyp2+mZaCqZmpJrKxG+SfUquQZkQSTaP9xVs/Nyinr1hLQrI6/OcvQJ
         iuxaTRHIoMDp3R5bzTYDcYRxQ7EMMyVUNw1GiHGMuLvsU6fBso8ezrXr6tFJQpthdXkl
         +NqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723751623; x=1724356423;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kX+e5rSxihbTvjSe1DavLWfqSJBAz8X9OHf/N6SEge0=;
        b=fuh1UKXjur460ZwbniVdaGwTebaLpFI1QTaboZHMBGKJs6s3KvU7pHgB1JbO1/jd0s
         aSkL2zyne2GX9cGHhiRWWrkaBHFY+ZQ3AP8gtXEQbOp7mwRu6aGzFwGz5iaWThEXKWZB
         +cspihnU0rp4iR5RWW57qjiE0Cksh+YqO4PtR/mfs6SpkZ4fMlIRIb5ypzAG1BWPT6bX
         5j8Myj6GuJ0g7S6dfW1c3XVRGBW0YEyeTjn1trSYrGTqpkyVjnTSsIaAmMclsg0zP6OG
         CjK/lFS3+vm+AxiB11zwFnRe/kPOMQTzZLNzVmNpxtx+UO8v1GcQlvJvZGsVFVRKf+7b
         +YoA==
X-Forwarded-Encrypted: i=1; AJvYcCX963nglsfAbqMrfEsokaYeDVMknsZZcWDeJ4bkFNt3tnurkr1NVTE12SEIsX8fo0SAamWaAkngvQGVX3+vMew9OAzCJngrN4s3I+JW2j5tHqkF1obJkU9RtgnN9rCtnmdl2gdTh1e/MHDswLdf
X-Gm-Message-State: AOJu0Yy6cF55P1lx5MxqIUDg0gmei+1lZ0BiZ+5E6Wl/joffWv78R3Ou
	NKHFTGZzukwv9khCpd5CACTB0eWiIToEFKbI//DBbivSwRHjnTHZ
X-Google-Smtp-Source: AGHT+IG7YE6D0Eh9PAMwIETHDh7HaDtucfJCyCZ7kYx/Gg6sg2xQ/MO7QmclDIkUXhcPOFw+2dEupQ==
X-Received: by 2002:a05:6830:6d8d:b0:709:27c7:9bce with SMTP id 46e09a7af769-70cac859a6emr795956a34.18.1723751623276;
        Thu, 15 Aug 2024 12:53:43 -0700 (PDT)
Received: from earth.localnet (97-127-48-199.mpls.qwest.net. [97.127.48.199])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4ccd6e7c057sm693450173.6.2024.08.15.12.53.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Aug 2024 12:53:42 -0700 (PDT)
Sender: Jeremy <jeremypeper@gmail.com>
From: jeremy@jeremypeper.com
To: linux-arm-kernel@lists.infradead.org, Arnd Bergmann <arnd@arndb.de>
Cc: linux-kernel@vger.kernel.org, Russell King <linux@armlinux.org.uk>,
 Linus Walleij <linus.walleij@linaro.org>,
 Richard Earnshaw <richard.earnshaw@arm.com>,
 Richard Sandiford <richard.sandiford@arm.com>,
 Ramana Radhakrishnan <ramanara@nvidia.com>, Nicolas Pitre <nico@fluxnic.net>,
 Krzysztof Kozlowski <krzk@kernel.org>, Mark Brown <broonie@kernel.org>,
 Kristoffer Ericson <kristoffer.ericson@gmail.com>,
 Robert Jarzmik <robert.jarzmik@free.fr>,
 Aaro Koskinen <aaro.koskinen@iki.fi>,
 Janusz Krzysztofik <jmkrzyszt@gmail.com>, Tony Lindgren <tony@atomide.com>,
 linux-omap@vger.kernel.org, Nikita Shubin <nikita.shubin@maquefel.me>,
 linux-samsung-soc@vger.kernel.org, Andrew Lunn <andrew@lunn.ch>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 Gregory Clement <gregory.clement@bootlin.com>,
 "Jeremy J. Peper" <jeremy@jeremypeper.com>, debian-arm@lists.debian.org,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Subject: Re: [RFC} arm architecture board/feature deprecation timeline
Date: Thu, 15 Aug 2024 14:53:40 -0500
Message-ID: <3413899.e9J7NaK4W3@earth>
In-Reply-To: <2831c5a6-cfbf-4fe0-b51c-0396e5b0aeb7@app.fastmail.com>
References: <2831c5a6-cfbf-4fe0-b51c-0396e5b0aeb7@app.fastmail.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

For the Buffalo devices we still have a lot of folks using Marvell Kirkwood, 
Orion5x and MV78100 NAS devices. In a world where SATA provides the cheapest $ 
per TB storage and Gigabit Ethernet is still standard they end up being 
surprisingly relevant for hobbyists.  

The two pre-DTB device files that we're still using are:
mach-mv78xx0/buffalo-wxl-setup.c
mach-orion5x/terastation_pro2-setup.c

If those can stick around for the next LTS kernel that should give me sufficient 
time to try converting them to DTS like the other Orion5x/Kirkwood devices.

Thank you for your attention,
-Jeremy


On Wednesday, July 31, 2024 12:29:29 PM CDT Arnd Bergmann wrote:
> We removed a lot of the unused board files at the beginning of
> 2023, and I'd like to plan ahead for other hardware and feature
> support that can be removed after the next stable kernel
> (linux-6.12).
> 
> TL;DR: I think we can deprecate toolchain support for ARMv4
> (pre-thumb), iWMMXt, BE32 and OABI (-mabi=apcs-gnu) *if* that
> helps gcc-15, as we'll likely not need those any more after
> gcc-14 will be too old to build new kernels (ca. 2030).
> 
> I hope we can keep reducing the number of non-DT board files a
> lot further, but I still expect this to take several more years
> before it is DT-only. Please reply here if you are using any
> of them so we can spare them once more.
> 
> 
> == Architectural features ==
> 
> These are features that require support from gcc, which in
> turn may benefit from dropping it.
> 
> === ARMv3 ===
> 
> This was removed in gcc-9, so it will eventually get removed
> from the kernel as we raise the minimum compiler versions.
> Only RiscPC relies on building with -march=armv3, despite using
> an ARMv4 StrongARM CPU.
> 
> === ARMv4 ===
> 
> This is used for both StrongARM and FA526 CPUs, which are still
> used on a small number of boards. Even the newest chips (moxa
> art, ) are close to 20 years olds but were still in use a few years
> ago. The last Debian release for these was Lenny (5.0).
> 
> Dropping compiler support now would be appropriate IMHO, and
> we can drop kernel support in a few years.
> 
> === ARMv4T ===
> 
> We still support six SoC families with ARMv4T cores (ARM720T,
> ARM920T and ARM922T). These are equally old to the ARMv4 ones,
> but have more users and developers working on them than the
> ARMv4 ones. Debian Stretch (9.0) last supported these.
> EP93xx in particular is used in some products with long
> support cycles, so we may end up supporting these in the
> kernel as long as ARMv5.
> 
> === ARMv5 ===
> 
> About one third of all supported platforms use ARMv5,
> but most of these are near their end of support. Notably
> there are still new SAM9 variants from Microchip that are
> meant as backward-compatible replacements for their
> older variants.
> 
> Debian still supports these, but the lack of FPU and
> atomics makes this harder, so I expect this to become
> an unofficial port in the future.
> 
> === early ARMv6 ===
> 
> This is the ARM1136r0p in NXP i.MX31 and OMAP24xx, which in
> practice means just the Nokia N8xx tablet.
> It causes a lot of pain to support in the kernel since it
> requires special hacks to support in SMP-enabled kernels.
> I have a patch series that moves ARMv6 from being ARMv7
> compatible to being ARMv5 compatible inside the kernel,
> which should help, but that needs more work.
> 
> === ARMv6K ===
> 
> We dropped ARM11MPcore support last year, but still
> support ARM1176 (Raspberry Pi 1, AST2500) and ARM1136r1.
> These are easy to keep supporting in the kernel.
> Distro support is getting harder since they are slightly
> too old for the common armv7-a+vfpv3-d16 level.
> 
> === ARMv7-M ===
> 
> Cortex-M3/M4/M7 are the only cores we support without an
> MMU, currently on 5 microcontroller platforms. Upstream work
> on NOMMU kernels has pretty much stopped in 2017 when everyone
> moved to open-source RTOS variants like Zephyr. I expect that
> we can drop support ten years later in 2027, but gcc will
> still have to support them on other operating systems.
> 
> === iWMMXt ===
> 
> I'm not aware of any remaining users for iWMMXt, and we dropped
> support for ARMv7 PJ4 CPUs (MMP2, Berlin) already, so the
> only supported hardware that even has this is Intel/Marvell
> PXA and MMP1.
> 
> Dropping support from gcc is probably a good idea now,
> it is already unsupported in clang.
> 
> === big endian ARMv5 (BE32) kernel ===
> 
> There is one SoC that uses this, the Intel IXP4xx. Older versions
> of Debian supported this chip in little-endian mode, but the device
> drivers are known to be broken for LE now and would require someone
> to spend time on fixing them.
> 
> I would suggest dropping support from gcc, which still gives
> us a few years to fix the ixp4xx support, or drop it when
> gcc-14 support is dropped from the kernel. Curiously, support
> was added in clang not long ago.
> 
> === big-endian ARMv7 (BE8) kernel ===
> 
> This is very different from BE32 mode in making more sense
> from a kernel point of view. In theory any ARMv7 hardware
> should work, though a lot of drivers are buggy. I am not
> aware of any actual use cases, though in theory it can be
> helpful for testing big-endian userspace when one has
> access to Arm hardware but no other big-endian machine.
> 
> We should probably keep this a few more years in both
> toolchain and kernel, unless it starts causing actual
> problems. I don't think anyone is testing it any more
> though.
> 
> Side-note: netbsd has a armv7+be8 variant, so clang will
> likely keep supporting be8 even if gcc ends up dropping it
> in the future.
> 
> 
> 
> == Kernel features ==
> 
> === pre-ATAGS param_struct ===
> 
> This was deprecated in 2001, to be removed in "5 years
> from now", which was a while ago. We can probably
> remove it now, or keep it around until the two platforms
> using it (RiscPC and Footbridge) are gone.
> 
> === ATAGS based board files ===
> 
> After the previous cleanup, there are board 29 files in
> 10 SoC platforms remaining. I would hope we can reduce this
> significantly again, but need to go through the platforms
> individually. ep93xx is getting converted to DT, but the
> others have made no progress towards that.
> 
> === OABI kernels ===
> 
> Practically everyone uses EABI today, and OABI support was
> dropped as a userspace target in gcc-4.8. The kernel still
> however allows being built as OABI by passing "-mabi=apcs-gnu",
> and this is used as the default for armv4/armv5 kernels.
> 
> This is a frequent source for bugs as driver writers are
> unaware of the unusual struct padding, alignment and enum
> usage. I've stopped testing it in my randconfig builds
> a while ago because of random bugs.
> 
> I would propose to leave the feature in the kernel but
> make it harder to enable by accident, changing the default
> for all targets to EABI and adding a dependency on
> 'CPU_32v4 || EXPERT'.
> 
> For the compiler, I think removing support for -mabi=apcs
> makes sense, unless there are non-Linux targets that still
> use this.
> 
> === OABI compat mode ===
> 
> This is the other way of running OABI binaries, using a
> normal EABI kernel. It suffers from a different set of
> bugs, as the kernel itself is fine, but driver specific
> structure layouts with user interfaces (usually ioctl)
> may be incompatible.
> 
> The maintenance cost in the kernel is much lower than
> native OABI kernels, but I suspect there are even
> fewer users.
> 
> Since there was never an EABI desktop distro for
> ARMv4, we probably want to keep at least one of the
> two (OABI or OABI_COMPAT) around as long as we
> support StrongARM machines.
> 
> === NWFPE ===
> 
> Russell had a patch set to remove this 11 years ago,
> but ended up keeping it. This is fundamentally tied
> to OABI userland, so we'll likely need to keep it for
> as long as either OABI or OABI_COMPAT remains.
> 
> See the discussion at
> https://lore.kernel.org/linux-arm-kernel/20130410191206.GM14496@n2100.arm.l
> inux.org.uk/
> 
> === Highmem ===
> 
> Most Arm machines are fine without highmem support and can
> use something like CONFIG_VMSPLIT_2GB to address up to 2GB
> of physical memory. Machines larger than only popped up
> around the time of the Cortex-A15 in 2012 and for the most
> part got replaced by 64-bit chips within a short time.
> In addition, there are also a handful of Cortex-A9 and
> Marvell CPU based machines that have either more than 2GB
> of RAM or a very sparse memory map that requires highmem
> support.
> 
> Linus Walleij has done some work towards being able to use
> up to 4GB of RAM with LPAE (Cortex-A7/A15 and later)
> machines, which I think still needs to be finished before
> we can remove support for highmem.
> 
> === Sparsemem ===
> 
> There is a new discussion about removing support for
> traditional sparsemem support, see
> https://lwn.net/Articles/974517/.
> 
> This also relates to machines that currently need highmem
> support in order to use all of their RAM even if the
> total size would fit into the lowmem area, e.g. on
> Renesas R-Car SoCs. In theory it should  be possible to
> move the indirection layer from __page_to_pfn() to
> __pfn_to_phys() and support discontiguous lowmem
> that way, but I don't think anyone is working on that,
> and I don't know if that addresses the concerns with
> today's sparsemem implementation.
> 
> 
> 
> == Platform support ==
> 
> === RiscPC ===
> 
> This is the oldest supported platform, and it will
> eventually have to get removed as it no longer works
> with gcc-9 or higher because of the ARMv3 removal.
> 
> As far as I know, nobody aside from Russell has booted
> this machine in many years, so if he's stops upgrading
> his kernels, we could also remove it earlier.
> 
> === SA1100, Footbridge ===
> 
> These are the other StrongARM based platforms, which
> like RiscPC are only relevant for nostalgia. When we
> removed the board files for 6.3, a couple of StrongARM
> machines were left that someone said they were interested
> in getting working again, and converting to DT. I don't
> think there has been any progress on this, so it seems
> unlikely to happen in the future. The last StrongARM
> machine that got added and that is still supported was
> the ipaq h3600 in linux-2.4.13.
> 
> There are also machines that Russell is (was?) using:
> sa1100/assabet, footbridge/netwinder and footbridge/ebsa285.
> 
> Being able to remove these would get rid of a lot of
> complexity both from the hardware being unusual and
> from them not using DT.
> 
> Need input from Russell.
> 
> === Gemini, Moxart ===
> 
> These both use the Faraday FA526 CPU core that like
> StrongARM implements ARMv4 rather than ARMv4T with thumb.
> 
> The chips are also over 20 years old, but the kernel
> code has been updated and is not a maintenance burden
> by itself, so there is no value in removing these
> machines until StrongARM is also gone.
> 
> On the other hand, removing both FA526 and StrongARM
> platforms means we can probably remove ARMv4 (non-T),
> OABI and NWFPE support more quickly if we want, or
> we can wait until a few years after gcc drops ARMv4.
> 
> OpenWRT lists the gemini platform as supported in
> https://openwrt.org/docs/techref/targets/gemini, but
> none of the individual machines have builds for the
> current release.
> 
> Need input from Linus Walleij.
> 
> === PXA board files ===
> 
> There are two board files left in the PXA code that
> we did not remove two years ago, in the hope that this
> would help the DT conversion.  Nothing happened
> since then, though qemu removed support for their
> releases.
> 
> Unless someone has specific plans to work on them,
> I would remove these in early 2025.
> 
> There is also DT support for some PXA boards, which
> would likely stay around.
> 
> === OMAP1 ===
> 
> This is now the only ARMv4T/ARMv5 platform with no
> DT support, making it a target for removal at some
> point. Unlike PXA, there are still users, but it seems
> there are no current plans for a DT conversion.
> 
> I would suggest going through the five boards
> individually to see which ones we can remove in 2025
> and keep the remaining ones for the moment.
> 
> === Nspire, AT91RM9200, CLPS711X, EP93xx, iMX1 ===
> 
> These are the other ARMv4T targets. Nikita is in
> the process of finishing up the DT support for EP93xx,
> after that these are very cheap to maintain in the
> kernel since the platform code is all up to date.
> 
> Unless there is a specific reason to drop these, I
> expect them to stay around as long as ARMv5, probably
> to the end of this decade.
> 
> === OMAP24xx ===
> 
> This is the one ARMv6 (non-K) platform that has active
> users. The platform support is fine, so it depends on
> what we do with arm1136r0 CPU support. If my patch
> for armv6 support in the armv5 kernel works out, we
> can treat it as a v5 variant and keep it as long as
> v5 itself, otherwise it would be nice to remove the
> kernel complexity by dropping arm1136r0 support like
> we did with arm11mpcore.
> 
> === iMX31, realview/integrator with 1136r0 ===
> 
> I'm not aware of any users, but these don't get in
> the way as long as OMAP2 is there. Whatever we do
> with OMAP2 can also happen with these.
> 
> === S3C64xx (Cragganmore) ===
> 
> This is the only ARMv6K board without devicetree
> support, and the board file contains about a similar
> amount of complexity as all other board files
> combined.
> 
> arch/arm/mach-s3c/Kconfig.s3c64xx lists it as scheduled
> for removal early next year, which would allow a large
> amount of cleanup in platform and driver infrastructure.
> 
> However, Mark Brown is actively using this machine
> as a testbed for audio codecs, which is what it was
> designed for by Wolfson (now Cirrus).
> 
> There is no satisfying outcome of this that I see,
> my best idea is to delay the removal until Mark has
> moved on to something else.
> 
> TODO: find out if Cirrus have a replacement that
> Mark can migrate to.
> 
> === Orion5x, mv78xx0, dove board files ===
> 
> Like PXA, these were left behind in the hope that there
> would be progress towards DT conversion, but none of that
> happened aside from a small set of mv78xx0 bugfixes.
> On the contrary, Debian has now dropped the
> orion5x kernel binary citing lack of users, so it seems
> much less likely to ever complete. Out of the machines
> about half the orion5x ones have DT support, mv78xx0
> has none, and dove DT support exists but is less
> complete than the board file.
> 
> There is still a community around running Debian
> on some of these devices at
> https://github.com/1000001101000/Debian_on_Buffalo/wiki
> 
> I would suggest removing all these board files in early
> 2025 to still allow building a 3rd-party kernel using
> the Debian 13 release sources. The orion5x DT support
> can get merged into mach-mvebu then.
> 
> === iMX35, WM8750, AST2500, BCM2835 ===
> 
> These four are all ARMv6K platforms and fairly well
> supported, though only AST2500 and BCM2835 have an
> active user base. Support for ARMv6K is likely to
> stay around at last as long as ARMv5, so there are
> no plans for removing these.
> 
> Most distros that had Raspberry Pi 1 armv6k-hardfloat
> support have dropped that now, but some minor ones
> still exist, while Debian and others runs ARMv5-softfloat
> userspace on them.
> 
> === stm32f4/f7/h7 microcontrollers ===
> 
> These are the only MMU-less Arm chips that see any
> continued development, as ST keeps supporting their
> existing customers. There are also newer MCUs based
> on Cortex-M33 and up, but those don't run Linux
> as far as I know. Let's keep until at least 2026
> before we start discussing deprecation.
> 
> All other MCUs (IMXRT, SAMV7, LPC18xx, MPS2) are
> used much less than STM32F and can probably follow
> the same path once they get in the way of dropping
> v7m support.





