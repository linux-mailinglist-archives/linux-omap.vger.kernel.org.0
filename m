Return-Path: <linux-omap+bounces-2287-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7992298C66A
	for <lists+linux-omap@lfdr.de>; Tue,  1 Oct 2024 22:00:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9E2021C220EF
	for <lists+linux-omap@lfdr.de>; Tue,  1 Oct 2024 20:00:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7CF3E1CDFD4;
	Tue,  1 Oct 2024 20:00:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="dOvEmBvP"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF2F11CDFBE;
	Tue,  1 Oct 2024 20:00:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727812812; cv=none; b=TvnNSn7BrlNSmeRtYkgVKJSif76oP0+D/O50sL7TAocJA+7i7WKXhmkEHFROgmrIUtH8fHb1QwWLtsrNoB/JtZxxH9y6CuYQx+7H9PP5XCHxlyhkSx/+9naGwlae7TXgtGIlAXWmXDE/BXWsMGFl/bz6t+mInGsC0eoWnhCYsJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727812812; c=relaxed/simple;
	bh=9nxNhpLrx3HJEq9JhEouMSM4YNgGI4tmenEeJnI7KaI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uv3R5UQQFHXY4/67gY2qRHQb+mwRPUm3qcOsVmfUDEEcZVtVOt8oQ/WURwSl0yTqJLLneMGENwRtqOYM/oHnRU0UYRWe7Wl01C78Gj57mHI0i1PYOj669xWpRdebsWaSrFHuXvgS4PHfbCD8JyhSiNgmAe0Rd365/lWom24HPwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com; spf=pass smtp.mailfrom=googlemail.com; dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b=dOvEmBvP; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-20b7259be6fso32127965ad.0;
        Tue, 01 Oct 2024 13:00:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1727812810; x=1728417610; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Txj9X25LmbjQ//MeIX5ksz2p7RxnM6sQFO6w2mk7FrQ=;
        b=dOvEmBvPamriXlYTdJUeJ9JQvPEsV1ben9lzbzUIZ9HHbp6mjkLrFvfD57QabzUaJB
         V2gdZu8k7TzvpK1KuHoS66KnKzlZ4wK2VqJax/ZHSS6mL7dwbpAvl/nuUn/62/XS90Em
         Aka6+MMWmkYEcsQrU0LBKhoBgKANnIR56KLtUEJEwSdnIzTsF8IXVODbKlZrDC27FHdz
         92s05d8QmhKxpJRxydrQZJCGamh98WDF5Kn0yY5W9Z24feRNEAZjvpGZ5iKozCenWnMt
         HWXYrAL/qpaKMZEZCgcPN/jWYKXsLUdhRpC+7WGmeXgOe4gmcI7Zp4SNUuUEogol/UTU
         zlVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727812810; x=1728417610;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Txj9X25LmbjQ//MeIX5ksz2p7RxnM6sQFO6w2mk7FrQ=;
        b=XkRfivHwdkmMi4gaWKS6ihyScQy1pq8M4cuvzfsN5myCGFebeqFNIAGN0hOsrxKY6Q
         2uM3YS0WcW2alRxhqlonuHvmHPmBj307DYpNym7eauCFb9sTqxAGbN/rsyHbVBFe8VOq
         gxdAGpZ5/0HGnPQ4fFCEfur+TJis2+zvXuz1zuIWzRgBscCaLviGkCJ2+DJKylsIVNBz
         +xe5HmSsvwW3u6HI5fLkH6XMW7JnCwMj3hQZCkm1ROPPS/ehZ/M5M92R4M+YfWGSLsUt
         03m8fEBVOEnmsJBgwPjLsvjtd+4fHLGvs8DrYtQEHBt8WfBlcUs3lFuLks5Vx/4byG+d
         j2Uw==
X-Forwarded-Encrypted: i=1; AJvYcCUm2Ob+/N7wM2+qQiEIpr8YY8foSjEtEq5QVt7yPWbdiPyCw24khEGCuGLnq3DPkvyVZgL5wKA5mshODPFO8lWEh5s=@vger.kernel.org, AJvYcCUvP2ABPXHjVCEHtiTZXMISl7fM4EIV6M5sSQp3lH7j4BsUFhuUZxfuBI/PxGw9p7swPmtdJsNmx6F3KH60TqCR3g8=@vger.kernel.org, AJvYcCVnyPRPZW3NyGU+cogkxCaN5uaKZpP2zQUfA2Lp9qk+gaigz7rfwqChBNU7eBXsytc+g9H1JtohGyBCoS2ssA==@vger.kernel.org, AJvYcCXQSogziQtb+6seRW1XzSswGYxW2/6Wwq/HmJ406haVaerMnqdy3ZAhA1xFqDaZ0OW93wM268qAI2H+oCue@vger.kernel.org, AJvYcCXhvF4W249EWiW+p19ai52nZrFS2WWM6U/od8qEwHJA8BY7L1I3He302PNsrxCHiK7BIqjONqtyza1Csg==@vger.kernel.org, AJvYcCXp0UkWtIuxP2TqvPclKZ9AvVCpjzlZBonvD+AXzpV5OVyhH7bP5XgksugCpFUteSFdPjJ+2sKRmsjezBw=@vger.kernel.org, AJvYcCXyTT7hSFmdWLNJLiMj+BcLHPz+eEqUisava0LsHpnFPBM60zi/66AzJxmdYtyeDIMc5HFPzIvxSZfc@vger.kernel.org
X-Gm-Message-State: AOJu0Yz19uYRHGJY3WLqWa6hEI580EU49boq0L+G2N0VOfw/13iQj+hj
	OhiWQSusLBL81ZHkQPqhoM/tL53k7Jl0IbEFx/7+Nq82eDNAF4GYBfjR9aOb+r8BRXUbRqRJjbP
	vR44ZFJERoWVzKcTKioZrcpKoDAo=
X-Google-Smtp-Source: AGHT+IEzN68oFH6UETNrpbvCGpopcDsigqPvgYKygFNF7D6FUqPz4x1zQ8ZA7UoZNXXUi84OPMM6AhdceSvhM1DdNJ4=
X-Received: by 2002:a17:902:e550:b0:20b:720d:734 with SMTP id
 d9443c01a7336-20bc5a5cd06mr11151925ad.41.1727812809889; Tue, 01 Oct 2024
 13:00:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240930223550.353882-1-rosenp@gmail.com> <20240930223550.353882-3-rosenp@gmail.com>
In-Reply-To: <20240930223550.353882-3-rosenp@gmail.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 1 Oct 2024 21:59:58 +0200
Message-ID: <CAFBinCB1Rz+C=Tj+RJAL5KZbk9K7cnpF_uR6rKkMeqyCuDBo4A@mail.gmail.com>
Subject: Re: [PATCH 2/2] ARM: dts: assign reg to memory nodes
To: Rosen Penev <rosenp@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Antoine Tenart <atenart@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Linus Walleij <linus.walleij@linaro.org>, Joel Stanley <joel@jms.id.au>, 
	Andrew Jeffery <andrew@codeconstruct.com.au>, Jesper Nilsson <jesper.nilsson@axis.com>, 
	Lars Persson <lars.persson@axis.com>, Florian Fainelli <florian.fainelli@broadcom.com>, 
	Viresh Kumar <vireshk@kernel.org>, Shiraz Hashim <shiraz.linux.kernel@gmail.com>, 
	"maintainer:SPEAR PLATFORM/CLOCK/PINCTRL SUPPORT" <soc@kernel.org>, Marek Vasut <marex@denx.de>, Jisheng Zhang <jszhang@kernel.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, David Lechner <david@lechnology.com>, Nishanth Menon <nm@ti.com>, 
	Santosh Shilimkar <ssantosh@kernel.org>, Tony Lindgren <tony@atomide.com>, 
	Enric Balletbo i Serra <eballetbo@gmail.com>, Javier Martinez Canillas <javier@dowhile0.org>, 
	Alexey Charkov <alchark@gmail.com>, Denis Burkov <hitechshell@mail.ru>, Arnd Bergmann <arnd@arndb.de>, 
	Stefan Wahren <wahrenst@gmx.net>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Dave Stevenson <dave.stevenson@raspberrypi.com>, 
	=?UTF-8?Q?Duje_Mihanovi=C4=87?= <duje.mihanovic@skole.hr>, 
	Nicolas Chauvet <kwizart@gmail.com>, Tomasz Maciej Nowak <tmn505@gmail.com>, 
	Robert Eckelmann <longnoserob@gmail.com>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, 
	"open list:ARM/Allwinner sunXi SoC support" <linux-sunxi@lists.linux.dev>, open list <linux-kernel@vger.kernel.org>, 
	"open list:ARM/Amlogic Meson SoC support" <linux-amlogic@lists.infradead.org>, 
	"moderated list:ARM/ASPEED MACHINE SUPPORT" <linux-aspeed@lists.ozlabs.org>, 
	"moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE" <linux-rpi-kernel@lists.infradead.org>, 
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, 
	"moderated list:ARM/NUVOTON NPCM ARCHITECTURE" <openbmc@lists.ozlabs.org>, 
	"open list:TEGRA ARCHITECTURE SUPPORT" <linux-tegra@vger.kernel.org>, 
	"open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <imx@lists.linux.dev>, 
	"open list:TQ SYSTEMS BOARD & DRIVER SUPPORT" <linux@ew.tq-group.com>, 
	"open list:DH ELECTRONICS IMX6 DHCOM/DHCOR BOARD SUPPORT" <kernel@dh-electronics.com>, 
	"moderated list:ARM/STM32 ARCHITECTURE" <linux-stm32@st-md-mailman.stormreply.com>, 
	"open list:ARM/QUALCOMM SUPPORT" <linux-arm-msm@vger.kernel.org>, 
	"open list:ARM/RISC-V/RENESAS ARCHITECTURE" <linux-renesas-soc@vger.kernel.org>, 
	"open list:ARM/Rockchip SoC support" <linux-rockchip@lists.infradead.org>, 
	"open list:ARM/SAMSUNG S3C, S5P AND EXYNOS ARM ARCHITECTURES" <linux-samsung-soc@vger.kernel.org>, 
	"open list:OMAP DEVICE TREE SUPPORT" <linux-omap@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Rosen,

when you re-send this, please drop the Amlogic files.

On Tue, Oct 1, 2024 at 12:36=E2=80=AFAM Rosen Penev <rosenp@gmail.com> wrot=
e:
[...]
>  arch/arm/boot/dts/amlogic/meson6-atv1200.dts                    | 2 +-
This file was dropped with [0]

>  arch/arm/boot/dts/amlogic/meson8-minix-neo-x8.dts               | 2 +-
>  arch/arm/boot/dts/amlogic/meson8b-ec100.dts                     | 2 +-
>  arch/arm/boot/dts/amlogic/meson8b-mxq.dts                       | 2 +-
>  arch/arm/boot/dts/amlogic/meson8b-odroidc1.dts                  | 2 +-
>  arch/arm/boot/dts/amlogic/meson8m2-mxiii-plus.dts               | 2 +-
These got updated with [1]


[0] https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git/commi=
t/?h=3Dv6.13/arm-dt&id=3De2a3f11ae11c9f9ee780bf49f00a69f12dce3529
[1] https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git/commi=
t/?h=3Dv6.13/arm-dt&id=3D7947fd2d350e6057e7514459c7ee2db39d1096a2

