Return-Path: <linux-omap+bounces-3872-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E11EAD926E
	for <lists+linux-omap@lfdr.de>; Fri, 13 Jun 2025 18:05:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7563D188BAA4
	for <lists+linux-omap@lfdr.de>; Fri, 13 Jun 2025 16:04:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C8EF1FC0FE;
	Fri, 13 Jun 2025 16:04:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K7aG2+U4"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3DC22E11D5;
	Fri, 13 Jun 2025 16:04:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749830646; cv=none; b=uB98rYn96ZWN6n8Kgn6wHlC3Vw5S4zu3RnAG5zKv6X5tuDgVkNDh+3H9XsSNb0NpIVUbejqxiDCQKwATeDq8OBAbD4VS20grHlo0hFsBnapgXJyCFb29Nt2S5NgsIuF12j0hvNl0fA0UUXeg6kSsDyycn3YPohFcTpv0FCtPL6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749830646; c=relaxed/simple;
	bh=0n5QzoiMfCLdBOr7a1+45mwTEFhEEf0kM4ULFWDUNiQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=s7pZF/c/uwHRKhN7SeZbvKw7vQLNRZ8argIFV0Vakk3f7VIRnmQHjFGCev/u93Rj9XnPhVpVUe5h5S+1MokTEHqRR6YkYfHH01pwuLL7wIwuJOYqH5srO6euJRtMbHyAfyk3wy17SUFgWIxo2UipNpnh5oqc9/im3ghKfZC4iIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K7aG2+U4; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-311ef4fb43dso1917220a91.3;
        Fri, 13 Jun 2025 09:04:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749830644; x=1750435444; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LIx/s1fLM7oASpmGNlYR11nYoIb2Cm/n5JB6pYZptGc=;
        b=K7aG2+U4QGd12cix4iO9QOGAHRixqSQavKK74EUzr0aAdNvtvtPPGQI8fWVfctUFbJ
         3NiO1qDCz5G5u7kuZza50yGRDjN1meHGc+gy7J5ISynOafLY32fTZQZUO8QVGVsOmRMa
         nN6hzhLsXxNCh6Ya5sKVS9ttrDuu+Hrnw0S4fwx6ibcSSzh88bMjAPSMrN/V5z5ddR0O
         8imy9RVMtUDRAeuboJSWigoYstiED1nw5to4Jr02rP1jQvUiwAhp2Wj+W9MUkT50GcHU
         AbBGZHCng436fB7N1bLko9DyTmwcQbTTS1Nj/GWZ/UJlrqMWMReAy4e50BiviM1gXLsU
         LtAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749830644; x=1750435444;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LIx/s1fLM7oASpmGNlYR11nYoIb2Cm/n5JB6pYZptGc=;
        b=GlP+Cfh6TKcC2QjIhvhsJlJB46iZtzUt60nDbLFYwKiELRK16Ie0PhD+0ivBBf7GbX
         YTwuPm40fzfcwIb1dhToJ5CUuosrKG1lM+2UrYvILogmTlmORPzaVxcXnRmCm3DBC2by
         /JEMiUF/xp3nKMBeLDN2R08HKoFxhWF/QNeJipAZgy7F6XUZ73NzA6JEHhLY5I80qTSZ
         ySoPtlQV4k8OdS/d90T3XGhpwNybY9W+ggjVt7vTlcov4c5cVkr0mp1u3wolPfYTASry
         LS8OqSuyJKzyt8VkTfOV+cYcId5OuDzAg9nZuzSz1s47T52HFJqnuEu9z/Ff9pwcXl+5
         bI9g==
X-Forwarded-Encrypted: i=1; AJvYcCU31D5eW3r7tPkGVHEhsWlarbdlCfURRr841ewugim+d5ukjbxvl+1Vm1gVndivk84GvBMtkY0zh8Ww@vger.kernel.org, AJvYcCV0vy1hqj3JTr0ALF8Yf9tEhelJJfIR/lBBtUEbv3OJuSadw1iz/BPYqd8neFnK2URT7+RLxIlKLfwBkppJ@vger.kernel.org, AJvYcCXJi26VvxIzSMyvxHtSRL7d+UedCBLR5s9/yeDOCFSIZhE+eFG2SGQExVT3R0dzzhkIR4j0u1aByKXmTA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8t9cezrdQ3dAUropSG94epX2QSTZh0I97Q2Rdvxjp8QsysqqR
	Q6UOLttAdpUrtrgffwy6SdZHhVufguLUG2q9bbdRKuhgREmRUssYj/zUYwQsiQFqn55058uvRqM
	+7ywF2kVxWTBJMXyRUresl0PFTVjnG6Y=
X-Gm-Gg: ASbGncuhdVHahw+9Nvo655y2aVQCbZCCmw+tljabp/yW/9l1irYPs90mhBBPHl1aDIV
	Z0Wib7TaLUyVtvOKu/YdAUfFJ8OsMiNM/OWyVqfRAP81l8deSaTtajJY9oBxjws5ygFG3xcBT6/
	YgbDctn7RkJvtQ2nEWejlaz9gHU7qbPdJZmHwBowqvc0Wm
X-Google-Smtp-Source: AGHT+IHFgiH5HjETXUszXCCwzEfhtW8cTqAP7ltCqcNEVDNkL6tPknfSKyxzH3jtTc/k4SqGh4wjfftSKNIbMh9mxWM=
X-Received: by 2002:a17:90b:5150:b0:312:1143:cf8c with SMTP id
 98e67ed59e1d1-313f1cafae6mr392935a91.16.1749830643828; Fri, 13 Jun 2025
 09:04:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250613-bbg-v3-0-514cdc768448@bootlin.com> <20250613-bbg-v3-5-514cdc768448@bootlin.com>
In-Reply-To: <20250613-bbg-v3-5-514cdc768448@bootlin.com>
From: Robert Nelson <robertcnelson@gmail.com>
Date: Fri, 13 Jun 2025 11:03:34 -0500
X-Gm-Features: AX0GCFurF1g54l3WTWzQbUwvJlyASryoeejULyaNk0cqsLvcLVcw9tytAa-3sIo
Message-ID: <CAOCHtYj8QsnzEKV8qG2_8CDuYzN-fUCdoN=YEE_EZ37yvEQ0yw@mail.gmail.com>
Subject: Re: [PATCH v3 5/7] arm: dts: omap: Add support for BeagleBone Green
 Eco board
To: Kory Maincent <kory.maincent@bootlin.com>
Cc: Tony Lindgren <tony@atomide.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Aaro Koskinen <aaro.koskinen@iki.fi>, Andreas Kemnade <andreas@kemnade.info>, 
	Kevin Hilman <khilman@baylibre.com>, Roger Quadros <rogerq@kernel.org>, 
	Russell King <linux@armlinux.org.uk>, Paul Barker <paul.barker@sancloud.com>, 
	Marc Murphy <marc.murphy@sancloud.com>, Jason Kridner <jkridner@gmail.com>, Andrew Davis <afd@ti.com>, 
	Bajjuri Praneeth <praneeth@ti.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linux-omap@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 13, 2025 at 10:50=E2=80=AFAM Kory Maincent
<kory.maincent@bootlin.com> wrote:
>
> SeeedStudio BeagleBone Green Eco (BBGE) is a clone of the BeagleBone Gree=
n
> (BBG). It has minor differences from the BBG, such as a different PMIC,
> a different Ethernet PHY, and a larger eMMC.
>
> Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
> ---
>
> Changes in v3:
> - Move the omap.yaml binding change in another patch.
>
> Changes in v2:
> - Used generic pmic node name.
> - Add regulator prefix to fixed regulator node name.
> - Add the compatible to omap.yaml binding
> ---
>  arch/arm/boot/dts/ti/omap/Makefile                 |   1 +
>  arch/arm/boot/dts/ti/omap/am335x-bonegreen-eco.dts | 169 +++++++++++++++=
++++++
>  2 files changed, 170 insertions(+)
>
> diff --git a/arch/arm/boot/dts/ti/omap/Makefile b/arch/arm/boot/dts/ti/om=
ap/Makefile
> index 95c68135dd0c..1aef60eef671 100644
> --- a/arch/arm/boot/dts/ti/omap/Makefile
> +++ b/arch/arm/boot/dts/ti/omap/Makefile
> @@ -93,6 +93,7 @@ dtb-$(CONFIG_SOC_AM33XX) +=3D \
>         am335x-boneblue.dtb \
>         am335x-bonegreen.dtb \
>         am335x-bonegreen-wireless.dtb \
> +       am335x-bonegreen-eco.dtb \
>         am335x-chiliboard.dtb \
>         am335x-cm-t335.dtb \
>         am335x-evm.dtb \
> diff --git a/arch/arm/boot/dts/ti/omap/am335x-bonegreen-eco.dts b/arch/ar=
m/boot/dts/ti/omap/am335x-bonegreen-eco.dts
> new file mode 100644
> index 000000000000..2e6050bd2da1
> --- /dev/null
> +++ b/arch/arm/boot/dts/ti/omap/am335x-bonegreen-eco.dts
> @@ -0,0 +1,169 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (C) 2025 Bootlin
> + */
> +/dts-v1/;
> +
> +#include "am33xx.dtsi"
> +#include "am335x-bone-common.dtsi"
> +#include "am335x-bonegreen-common.dtsi"
> +#include <dt-bindings/net/ti-dp83867.h>
> +
> +/ {
> +       model =3D "TI AM335x BeagleBone Green Eco";
> +       compatible =3D "seeed,am335x-bone-green-eco", "ti,am33xx";

Based on [2/7] ARM: dts: omap: Remove incorrect compatible strings
from device trees  this should be???

> +       model =3D "Seeed AM335x BeagleBone Green Eco";
> +       compatible =3D "seeed,am335x-bone-green-eco", "ti,am33xx";

I feel bad as I'm the one who wrote most of these wrong in the first
place that you are claning up for me!

Regards,

--=20
Robert Nelson
https://rcn-ee.com/

