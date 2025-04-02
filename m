Return-Path: <linux-omap+bounces-3529-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 79658A794CD
	for <lists+linux-omap@lfdr.de>; Wed,  2 Apr 2025 20:06:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 941B43AF90E
	for <lists+linux-omap@lfdr.de>; Wed,  2 Apr 2025 18:06:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE0901C5F07;
	Wed,  2 Apr 2025 18:06:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b="M70sHcsc"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail.andi.de1.cc (mail.andi.de1.cc [178.238.236.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A475819DF81;
	Wed,  2 Apr 2025 18:06:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.238.236.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743617190; cv=none; b=jsK7MANC2gPruxiEFr8F4DvW+Se0AXyyzcO2gZxI4RrNB29ExoNympkCt6Q0BIp4b6cLHKU4I+vnEKn3FWo24VtpJstJJRFjWhpbZn4Dn/wgR/CZCjL+1ojJ6pcZwDnzbWa4YGdR+IQXEHIgKE4xtuzu4rVQMSzikURirHxxkq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743617190; c=relaxed/simple;
	bh=9pQGGuSouKXoS8qG0zRttHnAPodUpm8bR+nFZgvVr3Y=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GHSoSp6+UgkSt9OVpiGAdiBv6jJZNU2fjH21k397CMvSJmztXz/uqUybq4H8J2nGeNl61NojefrTtgoA5agLzlBxY1gkIX/oO30/dOYPmdbk13d5JE+ik8zNMJdNt7LfZhLQlZdTDVYvpqxWk+3Zl0yotlN5H7Za0mfrHHWWQnI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info; spf=pass smtp.mailfrom=kemnade.info; dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b=M70sHcsc; arc=none smtp.client-ip=178.238.236.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=References:In-Reply-To:Cc:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=7VdTECC2N6MiKQNDMTygCmE5/bjawPj1l5VgBhhTh2I=; b=M70sHcsc8pTsjpaScMMBOWc044
	1pcXqmpoQpvbfg4oMB/RNHpvOWrAyTPjzw8BVQJHCah/JbAvFTahgtmAC8Z/+2sABBefFRE7GX6Bb
	DWbA6aNY2EqdGlrmpiEqC25OKbfhTiXX8JyJT1UhHBBU02qGEFFJn5bh/mPh3jsxbcvaTn+qh41Zr
	DyeNo+Noj4MZP7qpPLSnulbI5OKGKYjeqb+Wut+zg6SN77lgRZe3pw93qJKqn4IXfKlTQ0y1jfPaI
	yTqwcKb3bTU29592SPyuFjQoIU5F01ExwAQJcfzDP36scINgw/WuM+8A1daAaYBKsRLkWQvuvmuUL
	l/zZFzJQ==;
Date: Wed, 2 Apr 2025 20:06:17 +0200
From: Andreas Kemnade <andreas@kemnade.info>
To: Roger Quadros <rogerq@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 linux-omap@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 linux-kernel@vger.kernel.org, Aaro Koskinen <aaro.koskinen@iki.fi>,
 devicetree@vger.kernel.org, Tony Lindgren <tony@atomide.com>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>
Subject: Re: [PATCH v2 2/2] ARM: dts: omap4: panda: cleanup bluetooth
Message-ID: <20250402200617.0482a150@akair>
In-Reply-To: <aded0940-45d8-4063-a1a2-f0763d509095@kernel.org>
References: <20250330151401.444956-1-andreas@kemnade.info>
	<20250330151401.444956-3-andreas@kemnade.info>
	<aded0940-45d8-4063-a1a2-f0763d509095@kernel.org>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Am Wed, 2 Apr 2025 14:54:12 +0300
schrieb Roger Quadros <rogerq@kernel.org>:

> Hi Andreas,
> 
> On 30/03/2025 18:14, Andreas Kemnade wrote:
> > Bluetooth is available on the other Panda board versions, too, so move
> > stuff to common and specify the needed clock properly.
> > 
> > Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
> > ---
> >  .../boot/dts/ti/omap/omap4-panda-common.dtsi  | 31 ++++++++++++++++--
> >  arch/arm/boot/dts/ti/omap/omap4-panda-es.dts  | 32 -------------------
> >  2 files changed, 28 insertions(+), 35 deletions(-)
> > 
> > diff --git a/arch/arm/boot/dts/ti/omap/omap4-panda-common.dtsi b/arch/arm/boot/dts/ti/omap/omap4-panda-common.dtsi
> > index c860b590142a..05c871d31d7b 100644
> > --- a/arch/arm/boot/dts/ti/omap/omap4-panda-common.dtsi
> > +++ b/arch/arm/boot/dts/ti/omap/omap4-panda-common.dtsi
> > @@ -367,10 +367,8 @@ OMAP4_IOPAD(0x130, PIN_INPUT_PULLUP | MUX_MODE0)	/* i2c4_sda */
> >  	 */
> >  	wl12xx_gpio: wl12xx-gpio-pins {
> >  		pinctrl-single,pins = <
> > -			OMAP4_IOPAD(0x066, PIN_OUTPUT | MUX_MODE3)		/* gpmc_a19.gpio_43 */
> > -			OMAP4_IOPAD(0x06c, PIN_OUTPUT | MUX_MODE3)		/* gpmc_a22.gpio_46 */
> > +			OMAP4_IOPAD(0x066, PIN_OUTPUT | MUX_MODE3)		/* gpmc_a19.gpio_43 - WLAN_EN */
> >  			OMAP4_IOPAD(0x070, PIN_OUTPUT_PULLUP | MUX_MODE3)	/* gpmc_a24.gpio_48 */  
> 
> Apparently GPIO 48 is FM audio related and has nothing to do with wl12xx?
> So should we drop it from here?
> 
Well, FM audio is part of the wl12xx, so it is a bit related. There is
no driver for the FM part upstream. It is a bit suboptimal, so feel
free to submit a patch to put it somewhere else.

Regards,
Andreas

