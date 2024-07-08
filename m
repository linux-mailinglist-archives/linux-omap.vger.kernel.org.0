Return-Path: <linux-omap+bounces-1741-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id F0B1392ACA4
	for <lists+linux-omap@lfdr.de>; Tue,  9 Jul 2024 01:49:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8D6A7B21903
	for <lists+linux-omap@lfdr.de>; Mon,  8 Jul 2024 23:49:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A94A152E0E;
	Mon,  8 Jul 2024 23:49:06 +0000 (UTC)
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0AD415098C
	for <linux-omap@vger.kernel.org>; Mon,  8 Jul 2024 23:49:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720482545; cv=none; b=OFDJvaL4g623bD5yCANrYP6+pO516GJl2ZVgQkNRglK1JUXAH6Y8uVd36i6nk5RscFPfKRRTyI7xiNr48Udt6I4Eucxsg4njegnj83FcjSe74XMY/s4iwfSyV4NmA9P+puDlssqpabcWmNMmDKXoPqsEafAm2jDTN0OcMMYXNoM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720482545; c=relaxed/simple;
	bh=585OTXLduml4b44q7SgXj9FJO/8XEJO2jUdcjWdYPno=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=TyTndczY1w8IkTS5XXHf07UIaQP2Ibkc2ElLOtg5McG/Q7EL5bq//fMfvtFE7MPqitbezOzlVI+gWMtRWR2i8zzTrg1g0VGBpchYyXI9HXdsWHmiEyTjPHMu71fFsZpAPM2K15lM2N70EbV53MgtyQcz4CfXG9Y4INmiCUXXMjo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=baylibre.com; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-2c2dee9d9cfso2593149a91.3
        for <linux-omap@vger.kernel.org>; Mon, 08 Jul 2024 16:49:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720482543; x=1721087343;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KTCvURDHt1Ehhy2ogJ4G2eNRAbN+TU2XGb1d5J/SBYc=;
        b=jZZ0HawxY6gJnTjNHOAneAqZTV33XoziNZQneDLg5N3LtZOXRO9Uo+cEpt3AQ0j54C
         b2OKcw43Bz7ezHiuEk2GqXq+tu8rBc1dnT40ia70O0yQSJ++tzoMwpGMXADFAmtXyALS
         BUPRa6TdDbr+lHic8TU/kPB5YtvmZjRklrKtJVCydW7cAWZsTCE0MKDtseyYVn89b8dP
         ZOUH/CjkipIu5cOxxgis88fNTNG4lGbT35oQYbt8ifeTEDCEJpdI2ZlF0By9c/R5OFzJ
         NjhpPUWQsuHzQKGDAq1tov0WwRN/muLNzkCF7P2isqMu5S4KHR0E+fWhkv2BRjdVZmFW
         FB9A==
X-Forwarded-Encrypted: i=1; AJvYcCXrPeaeJMm1cCY7gCqeA1GjzNMwNPrj1UsXs1L5Wh9PtIKIOJ4bxKmu2kUSxY9/0vlQwbSoA7wQB1cP3hAeQ1WZcKLhq7ic+l6Qog==
X-Gm-Message-State: AOJu0Yx2jJp7TIGGyp6WVYeMQuc8dKkEMWPM6ArNcxm2PHhpCS0wLA5w
	kgFmzUuXAtNgGefR8+ktdfQdLiIAqIOinKxVdTzhfFai02vV+4FIQWRwmy4LDPI=
X-Google-Smtp-Source: AGHT+IF2sRCcp1Qt2ncA7/dcBS7eQVYhbuVP4CESqTDlDqz8AWSIBYQ0ftySS6HXoODFEfyN2bXeTQ==
X-Received: by 2002:a17:90a:a10d:b0:2c4:dfa6:df00 with SMTP id 98e67ed59e1d1-2ca35be0661mr981011a91.8.1720482542878;
        Mon, 08 Jul 2024 16:49:02 -0700 (PDT)
Received: from localhost (97-126-77-189.tukw.qwest.net. [97.126.77.189])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2ca344c399csm596679a91.5.2024.07.08.16.49.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jul 2024 16:49:02 -0700 (PDT)
From: Kevin Hilman <khilman@kernel.org>
To: Celeste Liu <coelacanthushex@gmail.com>, Heinrich Schuchardt
 <heinrich.schuchardt@canonical.com>, Anup Patel <anup@brainfault.org>, Guo
 Ren <guoren@kernel.org>, Palmer Dabbelt <palmer@rivosinc.com>, Paul
 Walmsley <paul.walmsley@sifive.com>, Huacai Chen <chenhuacai@kernel.org>,
 WANG Xuerui <kernel@xen0n.name>, Thomas Bogendoerfer
 <tsbogend@alpha.franken.de>, Vladimir Kondratiev
 <vladimir.kondratiev@mobileye.com>, Gregory CLEMENT
 <gregory.clement@bootlin.com>, =?utf-8?Q?Th=C3=A9o?= Lebrun
 <theo.lebrun@bootlin.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin
 <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>,
 "Naveen N . Rao" <naveen.n.rao@linux.ibm.com>, Sven Joachim
 <svenjoac@gmx.de>, Yoshinori Sato <ysato@users.sourceforge.jp>, Rich
 Felker <dalias@libc.org>, John Paul Adrian Glaubitz
 <glaubitz@physik.fu-berlin.de>, Russell King <linux@armlinux.org.uk>,
 Florian Fainelli <florian.fainelli@broadcom.com>, Ray Jui
 <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, Broadcom
 internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Tony
 Lindgren <tony@atomide.com>, Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Arnd Bergmann <arnd@arndb.de>,
 Mykola Lysenko <mykolal@fb.com>, linux-riscv@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org,
 linux-rpi-kernel@lists.infradead.org, linux-omap@vger.kernel.org,
 linux-tegra@vger.kernel.org, loongarch@lists.linux.dev,
 linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-sh@vger.kernel.org
Cc: linux-kselftest@vger.kernel.org, bpf@vger.kernel.org,
 linux-kernel@vger.kernel.org, Lennart Poettering <lennart@poettering.net>,
 Icenowy Zheng <uwu@icenowy.me>, Celeste Liu <CoelacanthusHex@gmail.com>
Subject: Re: [PATCH 6/6] arm: defconfig: drop RT_GROUP_SCHED=y from
 bcm2855/tegra/omap2plus
In-Reply-To: <20240530111947.549474-14-CoelacanthusHex@gmail.com>
References: <20240530111947.549474-8-CoelacanthusHex@gmail.com>
 <20240530111947.549474-14-CoelacanthusHex@gmail.com>
Date: Mon, 08 Jul 2024 16:49:01 -0700
Message-ID: <7hv81f78cy.fsf@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Celeste Liu <coelacanthushex@gmail.com> writes:

> Commit 673ce00c5d6c ("ARM: omap2plus_defconfig: Add support for distros
> with systemd") said it's because of recommendation from systemd. But
> systemd changed their recommendation later.[1]
>
> For cgroup v1, if turned on, and there's any cgroup in the "cpu" hierarchy it
> needs an RT budget assigned, otherwise the processes in it will not be able to
> get RT at all. The problem with RT group scheduling is that it requires the
> budget assigned but there's no way we could assign a default budget, since the
> values to assign are both upper and lower time limits, are absolute, and need to
> be sum up to < 1 for each individal cgroup. That means we cannot really come up
> with values that would work by default in the general case.[2]
>
> For cgroup v2, it's almost unusable as well. If it turned on, the cpu controller
> can only be enabled when all RT processes are in the root cgroup. But it will
> lose the benefits of cgroup v2 if all RT process were placed in the same cgroup.
>
> Red Hat, Gentoo, Arch Linux and Debian all disable it. systemd also doesn't
> support it.
>
> [1]: https://github.com/systemd/systemd/commit/f4e74be1856b3ac058acbf1be321c31d5299f69f
> [2]: https://bugzilla.redhat.com/show_bug.cgi?id=1229700
>
> Signed-off-by: Celeste Liu <CoelacanthusHex@gmail.com>
> ---
>  arch/arm/configs/bcm2835_defconfig   | 1 -
>  arch/arm/configs/omap2plus_defconfig | 1 -
>  arch/arm/configs/tegra_defconfig     | 1 -

For omap2plus_defconfig:

Acked-by: Kevin Hilman <khilman@baylibre.com>


