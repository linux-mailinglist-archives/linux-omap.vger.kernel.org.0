Return-Path: <linux-omap+bounces-2308-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 22BAA98FF2E
	for <lists+linux-omap@lfdr.de>; Fri,  4 Oct 2024 11:01:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4C9D61C21813
	for <lists+linux-omap@lfdr.de>; Fri,  4 Oct 2024 09:01:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A21C2145341;
	Fri,  4 Oct 2024 09:01:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b="rNAbWE5l"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail.andi.de1.cc (mail.andi.de1.cc [178.238.236.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B141A12D20D;
	Fri,  4 Oct 2024 09:01:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.238.236.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728032479; cv=none; b=ffViNACex9kEpyhpdu4MgJ93H0usn+mhIeHv10n0CV0Qu2ktOeRgO+pZReXikKdJxvzn3Xa5Bmd3G1rHpCNasZNfg/xV+RUSRiyXsH0ANQeVE2RnojQd7rgeLldyC8j/Q1qAYPbyteBME1aRWMsUQ09PXFB8nqJzvAmZfd8azN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728032479; c=relaxed/simple;
	bh=W4GAHxyNiNKuPlq2+RXiCRq+1TQKeFjvCI65OjVVneE=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=E3Jni2Zo2lCWA8MwkBk3AqPIdqkl/Frk1jyZ9ksF0vo538WxWH3hXqzUyVvvb1qEQkrX1Mg1A988MdrJY30pFJDtldOW2aKEGjYjhZBK3sTWN4Jj6+D3DuFO5F4bm8faFv7CVclth/B9R6RHdDrW61NgB+StMLUHH6T8NKLXA2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info; spf=pass smtp.mailfrom=kemnade.info; dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b=rNAbWE5l; arc=none smtp.client-ip=178.238.236.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=References:In-Reply-To:Cc:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=H+G5CybCC2JMZtP4NDbstG6wlm8WTWPuUqRFjDgdgzI=; b=rNAbWE5lLRTXtQgm9xk9REWd+/
	bmSrgHqLgzxdXjDzt3g5krIluPhJCbpq+iCV+M/tt9EsL7TmWLr+VVin4i0jjF/WTEx4VpAyrKE61
	AIY+Vn8sujUTSh2A2Pb4l8kD6KS2Bdg6agTBGZwheibEXSDupiR9y6Hz/oY8gCVeRthUWUCgQSQtO
	UsJj81S1RJscGGBD/LFxRHMozAb+Gaaohdzmd8FmAKzs8yT7V4lwtrZQp235b0lqNj7WivFgpIwun
	qDskjoo1CAOPgDmYpZzYKgeEzSCg3C5UPN7HdLTgYMiT+Lw9YpA8AQ3SxqvzAI+tlFqqX/j3Bvmkz
	c1gCws6Q==;
Date: Fri, 4 Oct 2024 11:01:10 +0200
From: Andreas Kemnade <andreas@kemnade.info>
To: Roger Quadros <rogerq@kernel.org>
Cc: Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, linux-kernel@vger.kernel.org, Rob Herring
 <robh@kernel.org>, khilman@baylibre.com, devicetree@vger.kernel.org,
 tony@atomide.com, aaro.koskinen@iki.fi, linux-omap@vger.kernel.org
Subject: Re: [PATCH 2/4] ARM: dts: omap: omap4-epson-embt2ws: wire up
 regulators
Message-ID: <20241004110110.163db244@akair>
In-Reply-To: <79d9aeef-2b38-44c5-a371-f696f6ae1de3@kernel.org>
References: <20240930213008.159647-1-andreas@kemnade.info>
	<20240930213008.159647-3-andreas@kemnade.info>
	<79d9aeef-2b38-44c5-a371-f696f6ae1de3@kernel.org>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Am Fri, 4 Oct 2024 10:38:22 +0300
schrieb Roger Quadros <rogerq@kernel.org>:

> On 01/10/2024 00:30, Andreas Kemnade wrote:
> > Wire up the regulators where usage is plausible. Do not
> > wire them if purpose/usage is unclear like 5V for
> > many things requiring lower voltages.
> > 
> > Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
> > ---
> >  arch/arm/boot/dts/ti/omap/omap4-epson-embt2ws.dts | 11 ++++-------
> >  1 file changed, 4 insertions(+), 7 deletions(-)
> > 
> > diff --git a/arch/arm/boot/dts/ti/omap/omap4-epson-embt2ws.dts
> > b/arch/arm/boot/dts/ti/omap/omap4-epson-embt2ws.dts index
> > d6b0abba19f6..cc1b6080bf95 100644 ---
> > a/arch/arm/boot/dts/ti/omap/omap4-epson-embt2ws.dts +++
> > b/arch/arm/boot/dts/ti/omap/omap4-epson-embt2ws.dts @@ -20,13
> > +20,13 @@ memory@80000000 { backlight-left {
> >  		compatible = "pwm-backlight";
> >  		pwms = <&twl_pwm 1 7812500>;
> > -		power-supply = <&unknown_supply>;
> > +		power-supply = <&lb_v50>;  
> 
> This is probably wrong. I noticed this while reviewing patch 3.
> 
> you probably want to wire this to blc_l?
> 
No idea was blc_l is. I did not find any code handling blc_l.
looking at the vendor kernel:

$ grep -R BLC_L_GPIO *
arch/arm/mach-omap2/board-bt2ws.c:#define BLC_L_GPIO
16	/* LB LED GPIO */ arch/arm/mach-omap2/board-bt2ws.c:
{BLC_L_GPIO,   GPIOF_OUT_INIT_LOW,  "gpio_blc_l"   },
arch/arm/mach-omap2/board-bt2ws.c:	gpio_export(BLC_L_GPIO, 0);
arch/arm/mach-omap2/board-bt2ts.c:#define BLC_L_GPIO
16	/* LB LED GPIO */ arch/arm/mach-omap2/board-bt2ts.c:
{BLC_L_GPIO,   GPIOF_OUT_INIT_LOW,  "gpio_blc_l"   },
arch/arm/mach-omap2/board-bt2ts.c:	gpio_export(BLC_L_GPIO, 0);

These two gpios are exported. But they seem not to influence
backlight in any way. I just tested again to make sure. Maybe it is just
a leftover from earlier board revisions.

> >  	};
> >  
> >  	backlight-right {
> >  		compatible = "pwm-backlight";
> >  		pwms = <&twl_pwm 0 7812500>;
> > -		power-supply = <&unknown_supply>;
> > +		power-supply = <&lb_v50>;  
> 
> this one should be wired to blc_r?
>
Same as with blc_l.
$ grep -R BLC_R_GPIO *
arch/arm/mach-omap2/board-bt2ws.c:#define BLC_R_GPIO
17	/* LB LED GPIO */ arch/arm/mach-omap2/board-bt2ws.c:
{BLC_R_GPIO,   GPIOF_OUT_INIT_LOW,  "gpio_blc_r"   },
arch/arm/mach-omap2/board-bt2ws.c:	gpio_export(BLC_R_GPIO, 0);
arch/arm/mach-omap2/board-bt2ts.c:#define BLC_R_GPIO
17	/* LB LED GPIO */ arch/arm/mach-omap2/board-bt2ts.c:
{BLC_R_GPIO,   GPIOF_OUT_INIT_LOW,  "gpio_blc_r"   },
arch/arm/mach-omap2/board-bt2ts.c:	gpio_export(BLC_R_GPIO, 0);

Regards,
Andreas

