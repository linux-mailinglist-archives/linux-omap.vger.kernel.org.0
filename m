Return-Path: <linux-omap+bounces-2399-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FF2E999FDB
	for <lists+linux-omap@lfdr.de>; Fri, 11 Oct 2024 11:12:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E253E280EEC
	for <lists+linux-omap@lfdr.de>; Fri, 11 Oct 2024 09:12:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 928E220CCE5;
	Fri, 11 Oct 2024 09:12:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b="lm+kYWHO"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail.andi.de1.cc (mail.andi.de1.cc [178.238.236.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79B8F20C46C;
	Fri, 11 Oct 2024 09:12:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.238.236.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728637943; cv=none; b=kmwQ5lMWQuoWNiHhvpGy0mfX0t0bdbVcaCWC9fpgNiOjTvOFgofadEEwvAoBEf6cJa4FOm9hzuavEcFgngIXDXS08h0yQOaTUNUqr2UmCdtw2V71/4roBTX7pZpLLoRR4NS2Qv540zpnaZyzjsCXONwCikUVH735a48NX/cCXyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728637943; c=relaxed/simple;
	bh=bLHgUxnHnm6nAbuqDcwCWdMNYnyXNokEveeBOy9gnl0=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ml0RVNTmjFLIzFMQYPsn6DN2qIlEJhdhuG9+Zuhtf7r0kbb7dFgcIMxCSJbMSHDVs0ocPFcTSeaTa7MRaaBDWBgG+qmf+FBd7qiUo9I5bnMpG792Wo7UVRTGpghdrWeWrJt7Ok5cuigrGMlhvz05EzUzod5gtgY5gXBrYL8AS/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info; spf=pass smtp.mailfrom=kemnade.info; dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b=lm+kYWHO; arc=none smtp.client-ip=178.238.236.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=References:In-Reply-To:Cc:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=RNqNpxGxeeBAwX+19iC/FZZJ/fILbxplvkx/pcESrjA=; b=lm+kYWHOOUhxM9U8xqgQql7VVt
	8UzoIxp7jYv2/pVOqdSp03IqQD9mfa6UEp6rEcvd8y/BT5AxnAw7ta3slMIcEZhFlX+6FSa6EuUQZ
	dOVOHXV0ilTh38756LLGBxl/wQhWO1PEuWuW+gHfeiT12bIq88s/XIrI4UjRB/+lPTI7CdFmele2v
	m9SYWrhmKvzOUUKWQoMVlMpht+lxV5k0l7SQMdflEwO/3nHdfYhohJibm/N5IM1hARXrA7VZp0Nfy
	l6O91Ja4MfbWXLTcpVf/wAwDXgDWIPhFHkcpHOWe4BT0XaU6qw2nMXSZHnRZDmTJnwO4kybRvHiOg
	/IY4hWwQ==;
Date: Fri, 11 Oct 2024 11:12:12 +0200
From: Andreas Kemnade <andreas@kemnade.info>
To: Roger Quadros <rogerq@kernel.org>
Cc: linux-kernel@vger.kernel.org, Rob Herring <robh@kernel.org>,
 linux-omap@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 tony@atomide.com, devicetree@vger.kernel.org, khilman@baylibre.com, Conor
 Dooley <conor+dt@kernel.org>, aaro.koskinen@iki.fi
Subject: Re: [PATCH v2 3/4] ARM: dts: omap: omap4-epson-embt2ws: add unknown
 gpio outputs
Message-ID: <20241011111212.1b935eb8@akair>
In-Reply-To: <7cde7090-639b-4115-8240-88a63c760d93@kernel.org>
References: <20241010122957.85164-1-andreas@kemnade.info>
	<20241010122957.85164-4-andreas@kemnade.info>
	<7cde7090-639b-4115-8240-88a63c760d93@kernel.org>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Am Thu, 10 Oct 2024 23:15:51 +0300
schrieb Roger Quadros <rogerq@kernel.org>:

> On 10/10/2024 15:29, Andreas Kemnade wrote:
> > Set them to the state seen in a running system, initialized
> > by vendor u-boot or kernel. Add line names where they are defined
> > in the vendor kernel.
> > gpio15 resets something in the display, otherwise meaning of the
> > gpios is not known.
> > 
> > Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
> > ---
> >  .../boot/dts/ti/omap/omap4-epson-embt2ws.dts  | 92
> > +++++++++++++++++++ 1 file changed, 92 insertions(+)
> > 
> > diff --git a/arch/arm/boot/dts/ti/omap/omap4-epson-embt2ws.dts
> > b/arch/arm/boot/dts/ti/omap/omap4-epson-embt2ws.dts index
> > 7684868a2eed..983a21d95db3 100644 ---
> > a/arch/arm/boot/dts/ti/omap/omap4-epson-embt2ws.dts +++
> > b/arch/arm/boot/dts/ti/omap/omap4-epson-embt2ws.dts @@ -115,6
> > +115,73 @@ wl12xx_vmmc: wl12xx-vmmc { };
> >  };
> >  
> > +&gpio1 {
> > +	pinctrl-names = "default";
> > +	pinctrl-0 = <&gpio1_hog_pins &gpio1wk_hog_pins>;
> > +
> > +	lb-reset-hog {
> > +		gpio-hog;
> > +		gpios = <9 GPIO_ACTIVE_HIGH>;
> > +		output-low;
> > +		line-name = "lb_reset";
> > +	};
> > +
> > +	power-en-hog {
> > +		gpio-hog;
> > +		gpios = <10 GPIO_ACTIVE_HIGH>;
> > +		output-high;
> > +		line-name = "power_en";
> > +	};  
> 
> As GPIO 9 and 10 come form the Wake-up domain, my guess is 
> they are used as wake-up input source. Reset button / Power off/wake
> button? From pinmux they seem to be Input. So why do we need to force
> them to a certain output state?

Interesting reasoning and good to bring up those thoughts.

Vendor v3.0 kernel:
shell@android:/sys/kernel/debug # cat gpio 
GPIOs 0-31, gpio:
[...]
 gpio-9   (gpio_lb_reset       ) out lo
 gpio-10  (gpio_power_en       ) out hi

So they are configured as output.
There is one power button. It can be handled via the TWL6032 (driver
not upstreamed yet). There is also one reset button resetting the SoC.

I do not see a reason why to deviate from vendor kernel.
 
> Can you please confirm if everything works as usual without this hog?
> 
Well, if everything is working well, I would agree to optimize
these things. But not now. There are races in the boot process
and I would like to rule out that any random or strange behavior has
anything to do with some gpio setting.

Regards,
Andreas

