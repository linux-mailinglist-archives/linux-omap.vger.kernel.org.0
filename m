Return-Path: <linux-omap+bounces-2985-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id F292FA01666
	for <lists+linux-omap@lfdr.de>; Sat,  4 Jan 2025 19:42:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CEB15162E91
	for <lists+linux-omap@lfdr.de>; Sat,  4 Jan 2025 18:42:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1FC791D5175;
	Sat,  4 Jan 2025 18:42:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b="IhckhlhS"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail.andi.de1.cc (mail.andi.de1.cc [178.238.236.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AF4B1A8F61;
	Sat,  4 Jan 2025 18:42:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.238.236.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736016123; cv=none; b=uXkgAiROqWcqN6330B70Q/A1rOJ6KOVFWYqI73Y91rA/UTDEVpez03J2qBIwp1zt2WdxGu7pPs2RM668HVuQ2FsDv1yaUMiy5oaMvikt07kf384HRyYFy5ZEryXysncYohvvAahus9/Fc9J7Y3goGUv7IuCXtxTROtLczPIH6Zk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736016123; c=relaxed/simple;
	bh=ELeAXpMaYjpRLd9Lf9P1VuOtJgktNupxVZPH5LB7T3s=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pB3vH1kzOSjDYsw3/ySf2P8LNk9DPJoMncVeh80QRbrO0VqCMb/z1CbN6wlFfVut33d9h9vsI4is1jToeimsEFaIbYx2mOMCFWWbGbm164xbLBqyMDB0f7rzPIBTIbPTKZ+oOKbs/hywv6ypdbiRE5I7gJbXDiIrzGcoA0+wons=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info; spf=pass smtp.mailfrom=kemnade.info; dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b=IhckhlhS; arc=none smtp.client-ip=178.238.236.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=References:In-Reply-To:Cc:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=7t2bi2cuevs3+uhIVFRPC0UTtPS4aHzUdCMVqB/75DY=; b=IhckhlhSP+fzopgUmnFpe29nXG
	mRMFyQya3brEh29rVQM51MOws87UeaWTsq2IbUWL0jdhntXt+6uG5mlJ+tlzhy7qEADaZNOwyE/i8
	SXLFN+bv3Gp7xrlWHsDNg/1rwBiX4Jyl0NvioMjvsX9qd7cYOU5UtgeRMsewrDUPmVmCiWNl1YoiF
	uQgOfxDcZPMMbPwoAM/sjrB1lnlsow49odusglnY2ZK8O8+nGw7lx4TJU5T+D4RTOMCLc6AZTA2ZC
	mZenmZDcmHfsbcqV2r+ks83JP01gMmpM5Fkifx5V9+YLqpAqH3GXkErOJvGAdSW1Xry33DD6M4M4J
	Ax3tu8mw==;
Date: Sat, 4 Jan 2025 19:41:58 +0100
From: Andreas Kemnade <andreas@kemnade.info>
To: Roger Quadros <rogerq@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org, Aaro Koskinen
 <aaro.koskinen@iki.fi>, Kevin Hilman <khilman@baylibre.com>,
 devicetree@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>, Tony
 Lindgren <tony@atomide.com>
Subject: Re: [PATCH 2/2] ARM: dts: omap4: panda: cleanup bluetooth
Message-ID: <20250104194158.06449a3e@akair>
In-Reply-To: <64d14e8f-a1d5-4e04-afa7-c129cee29dc2@kernel.org>
References: <20241229230125.85787-1-andreas@kemnade.info>
	<20241229230125.85787-3-andreas@kemnade.info>
	<64d14e8f-a1d5-4e04-afa7-c129cee29dc2@kernel.org>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Hello Roger,

Am Sat, 4 Jan 2025 19:29:44 +0200
schrieb Roger Quadros <rogerq@kernel.org>:

> Hello Andreas,
> 
> On 30/12/2024 01:01, Andreas Kemnade wrote:
> > Bluetooth is available on the other Panda board versions, too, so move
> > stuff to common and specify the needed clock properly.
> > 
> > Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
> > ---
> >  .../boot/dts/ti/omap/omap4-panda-common.dtsi  | 30 +++++++++++++++--
> >  arch/arm/boot/dts/ti/omap/omap4-panda-es.dts  | 32 -------------------
> >  2 files changed, 28 insertions(+), 34 deletions(-)
> > 
> > diff --git a/arch/arm/boot/dts/ti/omap/omap4-panda-common.dtsi b/arch/arm/boot/dts/ti/omap/omap4-panda-common.dtsi
> > index c860b590142a..c048ab9af053 100644
> > --- a/arch/arm/boot/dts/ti/omap/omap4-panda-common.dtsi
> > +++ b/arch/arm/boot/dts/ti/omap/omap4-panda-common.dtsi
> > @@ -368,9 +368,7 @@ OMAP4_IOPAD(0x130, PIN_INPUT_PULLUP | MUX_MODE0)	/* i2c4_sda */
> >  	wl12xx_gpio: wl12xx-gpio-pins {
> >  		pinctrl-single,pins = <
> >  			OMAP4_IOPAD(0x066, PIN_OUTPUT | MUX_MODE3)		/* gpmc_a19.gpio_43 */  
> 
> We could add function name in comment? e.g. /* gpmc_a19.gpio_43 - WLAN_EN */
> 
This is about existing code, there is still a lot of room to cleanup
other stuff. 

> > -			OMAP4_IOPAD(0x06c, PIN_OUTPUT | MUX_MODE3)		/* gpmc_a22.gpio_46 */
> >  			OMAP4_IOPAD(0x070, PIN_OUTPUT_PULLUP | MUX_MODE3)	/* gpmc_a24.gpio_48 */  
> 
> This one is FM_EN and has nothing to do with WLAN.
> 
same here.
> > -			OMAP4_IOPAD(0x072, PIN_OUTPUT_PULLUP | MUX_MODE3)	/* gpmc_a25.gpio_49 */  
> >  		>;  
> >  	};
> >  
> > @@ -393,6 +391,22 @@ button_pins: button-pins {
> >  			OMAP4_IOPAD(0x114, PIN_INPUT_PULLUP | MUX_MODE3)	/* gpio_121 */  
> >  		>;  
> >  	};
> > +
> > +	bt_pins: bt-pins {
> > +		pinctrl-single,pins = <
> > +			OMAP4_IOPAD(0x06c, PIN_OUTPUT | MUX_MODE3)	  /* BTEN */
> > +			OMAP4_IOPAD(0x072, PIN_OUTPUT_PULLUP | MUX_MODE3) /* BTWAKEUP */  
> 
> Could we please use comment style <pin name>.<pinmux name> - Function
> 			OMAP4_IOPAD(0x06c, PIN_OUTPUT | MUX_MODE3)		/* gpmc_a22.gpio_46 - BTEN */
> 			OMAP4_IOPAD(0x072, PIN_OUTPUT_PULLUP | MUX_MODE3)	/* gpmc_a25.gpio_49 - BTWAKEUP */
>
I was a bit lazy with checkpatch.pl. Your proposal generates a lot of
noise there, so I was too lazy to filter that noise, so I disabled that
noise. I had it first that way.

Regards,
Andreas

