Return-Path: <linux-omap+bounces-1896-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AB4294D1C8
	for <lists+linux-omap@lfdr.de>; Fri,  9 Aug 2024 16:07:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C80E3283889
	for <lists+linux-omap@lfdr.de>; Fri,  9 Aug 2024 14:07:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DCF4F195FFA;
	Fri,  9 Aug 2024 14:06:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="s+qvF8sC"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76EA11957FF;
	Fri,  9 Aug 2024 14:06:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723212414; cv=none; b=EawcI5IijBv43Qzu86KNQrKDTTRBwCysje6/gk6OIzv7lUvJ6JeHiKxQjvEP7GySM7/mPoq4scXOIPrOS02QEt2ry/o0QcrrMzNIIdCEI5duDe11cN4yFamlaFNJUV9fWiSjjqQeZCklNlddiFR9yqWKmDF2DZwl0EqIj7kRG6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723212414; c=relaxed/simple;
	bh=evwGZM4eri1U2eONrdZCQoX8mPAcQhXgLT4ZmuyFzRc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Gr/P0bTxFUP8MZaBqpTc24bnw5pS+jbCDm8CcisdHDKPUSMYbOXJxl3xDFf7a0sgKRqi2kDGdbyIkEy9s6U9fTFTwBmJMyjomxRDmg0b030tGEn0lStIOgyTwz4w/ABK+aN01EPMpnp5uGcTUXu8UsBxRBH6pyRoHGA78HT+8tE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=s+qvF8sC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EAB26C4AF14;
	Fri,  9 Aug 2024 14:06:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723212414;
	bh=evwGZM4eri1U2eONrdZCQoX8mPAcQhXgLT4ZmuyFzRc=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=s+qvF8sCtTwyHF56WPQ3eeP2cl8zaXyGa9z49t8SyXv/r7gWKxYShMecPk6ykQVnZ
	 n4kXCa2PTcoMeq17unwFqmzXgPR7MMu/5lFWXv5TXVXCvgne8conJzRw+WgtCDqSFt
	 75MSJbIMMSsLhlOUf8VzdsVtTD7ZHCffuRMDXZF8GqHtWOyIEGM37x0ZYrMqvzPWzV
	 GrdDai06QRpYTPF+2EDN60xa2yY6LakkeFlhW+p1X4ce420yzSZuej2hKmjX3c1dQt
	 YP6bD7GqRN2fGNGcnQGGFQBzK28lY0exqwq1+aVhvdTDCxi/VbsBU2TgGSOtF9Xbf4
	 +haFnWpWIs1Uw==
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-52f024f468bso2412855e87.1;
        Fri, 09 Aug 2024 07:06:53 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXfDS7HgcDjSwKVqyHrzVm98wcfTO+gSDa8S2M3Pt3Krdh+eFQczKO9Ok7fRO8WTznNXnoF3XULuyGc3p8lsdSNrgb+AGKZeOtQg6EE/zmiygfd9o/UsWrXSuiTyuOPSghbQOJSVwL/p6TvMYfTYc6QQSEzWABOKmNabCgewbG5Gr4Kufk=
X-Gm-Message-State: AOJu0Yx0DkLi1aEN6ahdwqwYmLSPluMGQ6tXDR4v/+YPqa26POyp0slo
	6IgX1UGiRGbGR/Vim1YllC+Bb4h56f8ZVHF0sUeC/IyT5ZYjSZqo6rcoSm93ymKI3M5/huGeTtm
	GojrrEUuy/Z0l7IpisA9vUycXVQ==
X-Google-Smtp-Source: AGHT+IFQIYRhSbBm0KnlMj4fnTjoQ3tTreJgwt28LbqvrHl4ZHzIAIYZ/MVmHdZ+lof70cxLYPm635tiKaTvUDOAZSg=
X-Received: by 2002:a05:6512:3c98:b0:530:e228:77ae with SMTP id
 2adb3069b0e04-530eea14613mr1284391e87.40.1723212412160; Fri, 09 Aug 2024
 07:06:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240808164941.1407327-1-robh@kernel.org> <22384730.EfDdHjke4D@steina-w>
In-Reply-To: <22384730.EfDdHjke4D@steina-w>
From: Rob Herring <robh@kernel.org>
Date: Fri, 9 Aug 2024 08:06:37 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+tyKxaDsM2ThXctHhXLXUjCAbDH+90gqDrmMV_-z5PvQ@mail.gmail.com>
Message-ID: <CAL_Jsq+tyKxaDsM2ThXctHhXLXUjCAbDH+90gqDrmMV_-z5PvQ@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: Fix undocumented LM75 compatible nodes
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: soc@kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>, 
	Dinh Nguyen <dinguyen@kernel.org>, Andrew Lunn <andrew@lunn.ch>, 
	Gregory Clement <gregory.clement@bootlin.com>, 
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Avi Fishman <avifishman70@gmail.com>, 
	Tomer Maimon <tmaimon77@gmail.com>, Tali Perry <tali.perry1@gmail.com>, 
	Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>, 
	Benjamin Fair <benjaminfair@google.com>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Vladimir Zapolskiy <vz@mleia.com>, Mark Jackson <mpfj@newflow.co.uk>, 
	Tony Lindgren <tony@atomide.com>, Michal Simek <michal.simek@amd.com>, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
	openbmc@lists.ozlabs.org, imx@lists.linux.dev, linux-omap@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 9, 2024 at 1:51=E2=80=AFAM Alexander Stein
<alexander.stein@ew.tq-group.com> wrote:
>
> Am Donnerstag, 8. August 2024, 18:49:38 CEST schrieb Rob Herring (Arm):
> > "lm75" without any vendor is undocumented. It works with the Linux
> > kernel since the I2C subsystem will do matches of the compatible string
> > without a vendor prefix to the i2c_device_id and/or driver name.
> >
> > Mostly replace "lm75" with "national,lm75" as that's the original part
> > vendor and the compatible which matches what "lm75" matched with. In a
> > couple of cases the node name or compatible gives a clue to the actual
> > part and vendor and a more specific compatible can be used. In these
> > cases, it does change the variant the kernel picks.
> >
> > "nct75" is an OnSemi part which is compatible with TI TMP75C based on
> > a comparison of the OnSemi NCT75 datasheet and configuration the Linux
> > driver uses. Adding an OnSemi compatible would be an ABI change.
> >
> > "nxp,lm75" is most likely an NXP part. NXP makes a LM75A and LM75B.
> > Both are 11-bit resolution and 100ms sample time, so "national,lm75b" i=
s
> > the closest match.
> >
> > While we're here, fix the node names to use the generic name
> > "temperature-sensor".
> >
> > Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> > ---
> > SoC maintainers, Please take this directly.
> > ---
> >  .../aspeed/aspeed-bmc-facebook-greatlakes.dts |  2 +-
> >  .../socfpga/socfpga_cyclone5_vining_fpga.dts  |  4 +--
> >  .../dts/marvell/armada-385-clearfog-gtr.dtsi  |  8 ++---
> >  .../boot/dts/nuvoton/nuvoton-npcm730-kudo.dts | 32 +++++++++----------
> >  .../boot/dts/nuvoton/nuvoton-npcm750-evb.dts  |  6 ++--
> >  arch/arm/boot/dts/nxp/imx/imx53-mba53.dts     |  4 +--
> >  arch/arm/boot/dts/nxp/imx/imx53-tqma53.dtsi   |  4 +--
> >  .../dts/nxp/lpc/lpc4357-ea4357-devkit.dts     |  4 +--
> >  .../boot/dts/nxp/lpc/lpc4357-myd-lpc4357.dts  |  2 +-
> >  arch/arm/boot/dts/ti/omap/am335x-nano.dts     |  2 +-
> >  .../boot/dts/xilinx/zynq-zturn-common.dtsi    |  4 +--
> >  11 files changed, 36 insertions(+), 36 deletions(-)
> >
> < [snip]
> > diff --git a/arch/arm/boot/dts/nxp/imx/imx53-mba53.dts b/arch/arm/boot/=
dts/nxp/imx/imx53-mba53.dts
> > index 2117de872703..d155b3ec22ef 100644
> > --- a/arch/arm/boot/dts/nxp/imx/imx53-mba53.dts
> > +++ b/arch/arm/boot/dts/nxp/imx/imx53-mba53.dts
> > @@ -175,8 +175,8 @@ expander: pca9554@20 {
> >               gpio-controller;
> >       };
> >
> > -     sensor2: lm75@49 {
> > -             compatible =3D "lm75";
> > +     sensor2: temperature-sensor@49 {
> > +             compatible =3D "national,lm75";
>
> I checked the old schematics. This is an NXP LM75A, so 'national,lm75a'
> would be the correct compatible.

Thanks for checking. That doesn't change the configuration in the
driver. lm75 and lm75a are treated the same as both are 9-bit
resolution. The NXP LM75A is 11-bit resolution and 10Hz which
corresponds to lm75b in the driver. Though it looks to me like the
original lm75b was also 9-bit resolution.

Rob

