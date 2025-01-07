Return-Path: <linux-omap+bounces-3019-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B41D8A049B7
	for <lists+linux-omap@lfdr.de>; Tue,  7 Jan 2025 19:57:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4DBA41888A6C
	for <lists+linux-omap@lfdr.de>; Tue,  7 Jan 2025 18:57:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E96B71F37B4;
	Tue,  7 Jan 2025 18:56:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b="gxoVhXwa"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail.andi.de1.cc (mail.andi.de1.cc [178.238.236.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79603132111;
	Tue,  7 Jan 2025 18:56:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.238.236.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736276219; cv=none; b=oQwcCLH+IggYn+E6Hqch3i74zrru9kx5nnNMcyOoezBLBslwc9uQNkXJiAxdCnv9Q/rj0XfIMp4rWm0+yxY3hxAFWiOmE32r1T36xe34y4OPeVcFCUKUJAKbu8d0na2FjQmb+8evssyXmQo+GvY6YQkL1RNvOjMyfViBamri7co=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736276219; c=relaxed/simple;
	bh=DfjQnlQ0tZPZwOTIOrAS6T4xAGkpLkkqA92cRAjgUj0=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uWxdioSkGeceMYBrDI62uiQcg/5O5oXMn0S8wvp0ZpkPgFY2aaO1ACZOS4JUmNKlIhBy5aXvvV44XVKP2bl3izWI8PGI5PzEUPkDeq/nDbJJrpqmV7H1ZX5SN2pS32dGnzB74ubvl54cwims4XGn02ooZSZ/HqKg7fRh554LH4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info; spf=pass smtp.mailfrom=kemnade.info; dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b=gxoVhXwa; arc=none smtp.client-ip=178.238.236.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=References:In-Reply-To:Cc:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=4t+TziilY1KRCRxw3bDHfF7HB6EcGmX5ojBm8ZoOSZM=; b=gxoVhXwa7kGJHJHYzeRqeMeblt
	lyNdWoVvk2PNBNFguD7jzf1glTcv2PnnCGllOIhP5qnH3nXJhHJyvTPIcYx5mJZ0CRwkYGc5KB9nu
	k/DmCHDo3vXm1HLFHRCm97djdONgmBnQttEQfem00GK2ctWr7seU2BRyzacprDRbBUHFQdZ1nPFIV
	bijdUD31TAeUWGRqj3GeMe18mSORlQjGfQshwzLiSKpnW683EXVUKtNMA4J1g37CpbU9E0NqEWLd7
	3Vi8f/3fuJjEv75KCxlCODFWGSB1jdnaY7ZUuc6I1jF/CruD/aLRbID0O7gz3nQvTydqDQLQdiYl4
	wysYGDdA==;
Date: Tue, 7 Jan 2025 19:56:42 +0100
From: Andreas Kemnade <andreas@kemnade.info>
To: Roger Quadros <rogerq@kernel.org>
Cc: tony@atomide.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, linux-omap@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 khilman@baylibre.com, aaro.koskinen@iki.fi
Subject: Re: [PATCH] ARM: dts: ti/omap: omap4-serial: fix interrupts syntax
Message-ID: <20250107195642.0fa8eda2@akair>
In-Reply-To: <8a77f406-0886-4bb8-8452-de506f458d17@kernel.org>
References: <20241230195556.112118-1-andreas@kemnade.info>
	<3bde5a34-4bb8-42a3-ad5c-eeb495c6aa6d@kernel.org>
	<20250104192015.0a7a4f47@akair>
	<8a77f406-0886-4bb8-8452-de506f458d17@kernel.org>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Am Tue, 7 Jan 2025 14:15:14 +0200
schrieb Roger Quadros <rogerq@kernel.org>:

> On 04/01/2025 20:20, Andreas Kemnade wrote:
> > Am Sat, 4 Jan 2025 19:45:35 +0200
> > schrieb Roger Quadros <rogerq@kernel.org>:
> >   
> >> Hi Andreas,
> >>
> >> On 30/12/2024 21:55, Andreas Kemnade wrote:  
> >>> Usually interrupts are overwritten in the board file to specify a
> >>> mux-dependent dedicated wakeup irq, so there is interrupts and
> >>> interrupts-extended property which is not allowed. That has generated a
> >>> lot of noise during dts changes if just a phandle involved has randomly
> >>> changed.
> >>>
> >>> Avoid that mess by specifying interrupts-extended in the dtsi file.
> >>>
> >>> Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
> >>> Reported-by: Rob Herring <robh@kernel.org>
> >>> Closes: https://lore.kernel.org/linux-omap/173558214240.2262575.18233884215338168789.robh@kernel.org/
> >>> Closes: https://lore.kernel.org/linux-omap/172784021601.525825.18405282128990798038.robh@kernel.org/
> >>> ---
> >>>  arch/arm/boot/dts/ti/omap/omap4-l4.dtsi | 8 ++++----
> >>>  1 file changed, 4 insertions(+), 4 deletions(-)
> >>>
> >>> diff --git a/arch/arm/boot/dts/ti/omap/omap4-l4.dtsi b/arch/arm/boot/dts/ti/omap/omap4-l4.dtsi
> >>> index 3fcef3080eae..150dd84c9e0f 100644
> >>> --- a/arch/arm/boot/dts/ti/omap/omap4-l4.dtsi
> >>> +++ b/arch/arm/boot/dts/ti/omap/omap4-l4.dtsi
> >>> @@ -1414,7 +1414,7 @@ SYSC_OMAP2_SOFTRESET |
> >>>  			uart3: serial@0 {
> >>>  				compatible = "ti,omap4-uart";
> >>>  				reg = <0x0 0x100>;
> >>> -				interrupts = <GIC_SPI 74 IRQ_TYPE_LEVEL_HIGH>;
> >>> +				interrupts-extended = <&wakeupgen GIC_SPI 74 IRQ_TYPE_LEVEL_HIGH>;    
> >>
> >> At this point interrupts-extended is not applicable.
> >>  
> > we have it this way also in omap3. I do not understand what is the
> > problem with it. Do you have a pointer where it is forbidden?
> > At least
> > Documentation/devicetree/bindings/interrupt-controller/interrupts.txt
> > says nothing againt using it in such cases.  
> 
> Pasting the quoted text here for reference.
> 
> "The "interrupts-extended" property is a special form; useful when a node needs
> to reference multiple interrupt parents or a different interrupt parent than
> the inherited one."
> 
> I understood both were false so said that it is not applicable here.
> 
Ah, ok, I understood it a bit different: It is useful for that use
case (multiple interrupts with different parents). But nothing says that
it should be used *only* in that case.

Regards,
Anderas

