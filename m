Return-Path: <linux-omap+bounces-143-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8111D8080FA
	for <lists+linux-omap@lfdr.de>; Thu,  7 Dec 2023 07:44:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B11991C20A0E
	for <lists+linux-omap@lfdr.de>; Thu,  7 Dec 2023 06:44:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EAA5512E42;
	Thu,  7 Dec 2023 06:44:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=atomide.com header.i=@atomide.com header.b="IrRFqxFx"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail5.25mail.st (mail5.25mail.st [74.50.62.9])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3467BD7F;
	Wed,  6 Dec 2023 22:44:22 -0800 (PST)
Received: from localhost (91-158-86-216.elisa-laajakaista.fi [91.158.86.216])
	by mail5.25mail.st (Postfix) with ESMTPSA id D55AE6045F;
	Thu,  7 Dec 2023 06:44:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=atomide.com;
	s=25mailst; t=1701931461;
	bh=nJmFuXQf9RfNTr9UuRgO4Hc4w3gZivv6FvKt1ZS32ng=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IrRFqxFxt9IwRGnDy4eKNbzra9+kK+MNCN5HzI7FE+tDi0u3uCDUfI2InxQ2Gk+q3
	 RMt6Ccx+vm9z0zZJkMeMuleUZRlAMKIfIFLRaGH0RyCuwfc7Eu9bpJi480d5bih1Zo
	 My/LD9Zn5wiUe5R/2EQ/8G/z4O6PQo+llw5/AWU7CzREV0wZvYOl8F3qrKIzvWAoqY
	 ZZLLQUDYR2EBmfWKukj9trCrpVv13ZkIsiCA6iZL4pyTNBpOqlHj397UCNzG+Td/ul
	 AZQATRAHMVmZc9RQhn+zthYvQxf9+xY+b1MT3MS5AR+g9KtBOUadRY5k0+mHtVLt+F
	 G09+T9e60N14g==
Date: Thu, 7 Dec 2023 08:43:59 +0200
From: Tony Lindgren <tony@atomide.com>
To: Adam Ford <aford173@gmail.com>
Cc: Andreas Kemnade <andreas@kemnade.info>, lee@kernel.org,
	robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org, bcousson@baylibre.com,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-omap@vger.kernel.org
Subject: Re: [PATCH v3 6/6] ARM: dts: omap: gta04: standardize
 system-power-controller
Message-ID: <20231207064359.GS5169@atomide.com>
References: <20231203222903.343711-1-andreas@kemnade.info>
 <20231203222903.343711-7-andreas@kemnade.info>
 <CAHCN7xKG6-vgnJ+mA8xt0aFK-jCBWOX-GkVmJGNERH43N0ikaw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHCN7xKG6-vgnJ+mA8xt0aFK-jCBWOX-GkVmJGNERH43N0ikaw@mail.gmail.com>

* Adam Ford <aford173@gmail.com> [231203 22:46]:
> On Sun, Dec 3, 2023 at 4:29 PM Andreas Kemnade <andreas@kemnade.info> wrote:
> >
> > Replace TI-specific property by generic one.
> >
> > Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
> > ---
> > cannot be applied independently of the other ones, so maybe simply delay
> > it.
> >
> >  arch/arm/boot/dts/ti/omap/omap3-gta04.dtsi | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/arch/arm/boot/dts/ti/omap/omap3-gta04.dtsi b/arch/arm/boot/dts/ti/omap/omap3-gta04.dtsi
> > index 3661340009e7a..5001c4ea35658 100644
> > --- a/arch/arm/boot/dts/ti/omap/omap3-gta04.dtsi
> > +++ b/arch/arm/boot/dts/ti/omap/omap3-gta04.dtsi
> > @@ -476,6 +476,7 @@ twl: twl@48 {
> >                 reg = <0x48>;
> >                 interrupts = <7>; /* SYS_NIRQ cascaded to intc */
> >                 interrupt-parent = <&intc>;
> > +               system-power-controller;
> 
> Could this go into the twl4030.dtsi file so we don't have every omap3
> board with this part duplicating this line?

Sounds good to me.

Regards,

Tony

