Return-Path: <linux-omap+bounces-5409-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D27EDD0BBC1
	for <lists+linux-omap@lfdr.de>; Fri, 09 Jan 2026 18:44:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E2A2C305CD2C
	for <lists+linux-omap@lfdr.de>; Fri,  9 Jan 2026 17:38:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0FDC233BBC6;
	Fri,  9 Jan 2026 17:38:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b="YcxwBzbA"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail.andi.de1.cc (mail.andi.de1.cc [178.238.236.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 537E8500952;
	Fri,  9 Jan 2026 17:37:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.238.236.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767980279; cv=none; b=AJ/Z/8UhTSqS7YSrNN9IzGoQDUOUbeAU+Hhg+kw9F6m2mdrRHnGWqnHKSQGj3Xzw6gpSC/L1rAdOdpbtDgXgUqjvxOkqf+8uObKYU+RB6hSGSU2JnJC18uyakrVIwlzywHaHUWeDbPT+Xqn+0wddnZEvp08X3a+qv1lo7YzPZ7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767980279; c=relaxed/simple;
	bh=j+t9uWIRyl/3HBXy/byBKLRvQNSpGnjARvCu3WvX6JM=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ewpdzWMZ1hiWt2WYsfvqIXPgbml2CGG1UUAbY+YyyibU6onjTsynveXdvQbVx40mRbIPhU9A9Nv7Qy43CngKK8IHxaEomBnM8lyig5a1hHt6xzfSArdNdKKes7o8aRGvsua6xOjFrz5n9kNLXpDVIK1Yg96YIYn1iDAFceRuhsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info; spf=pass smtp.mailfrom=kemnade.info; dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b=YcxwBzbA; arc=none smtp.client-ip=178.238.236.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=References:In-Reply-To:Cc:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=1N5YSAXbBszofAADbY2ttsCRUeOtXxy51jfA6e/vtaQ=; b=YcxwBzbAj8oUYZoljSmuSEnW3f
	FeEN55T3efkIK/JOJ6+OpS1qfZ9e0qDxUVVcCoJt7oQ2OvtvYrJy1oaNknYJrQe+EVmx8WbE75e66
	OgdjuC/oFXwXg83UTfCLAQc9b8oFOOimug9gmmMwMKjWthKLaXCPRKHdK1jAIh/35XmSDD1JKPAOM
	yut8DZ1CPkrXz5ruWnPN9xnesleOKDeu1sT5GbEBO5mgcyr67Q4wYjUpZD6WSkI2gqX9dFsVB4mAf
	C4szkoZKAcsplOJW5llatY+SevSSwlU9FBhnFdnJ7/wI2cxSB2krX1ZifVghmZ59A36M+MCQtGBy7
	G6fmrucA==;
Date: Fri, 9 Jan 2026 18:37:50 +0100
From: Andreas Kemnade <andreas@kemnade.info>
To: Lee Jones <lee@kernel.org>
Cc: Johan Hovold <johan@kernel.org>, Aaro Koskinen <aaro.koskinen@iki.fi>,
 Kevin Hilman <khilman@baylibre.com>, Roger Quadros <rogerq@kernel.org>,
 Tony Lindgren <tony@atomide.com>, linux-omap@vger.kernel.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] mfd: omap-usb-host: fix OF populate on driver rebind
Message-ID: <20260109183750.0d638710@kemnade.info>
In-Reply-To: <20260109181839.58ec0802@kemnade.info>
References: <20251219110714.23919-1-johan@kernel.org>
	<20260109163725.GB1808297@google.com>
	<20260109163939.GC1808297@google.com>
	<20260109181839.58ec0802@kemnade.info>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; aarch64-unknown-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 9 Jan 2026 18:18:39 +0100
Andreas Kemnade <andreas@kemnade.info> wrote:

> On Fri, 9 Jan 2026 16:39:39 +0000
> Lee Jones <lee@kernel.org> wrote:
> 
> > On Fri, 09 Jan 2026, Lee Jones wrote:
> >   
> > > On Fri, 19 Dec 2025, Johan Hovold wrote:
> > >     
> > > > Since commit c6e126de43e7 ("of: Keep track of populated platform
> > > > devices") child devices will not be created by of_platform_populate()
> > > > if the devices had previously been deregistered individually so that the
> > > > OF_POPULATED flag is still set in the corresponding OF nodes.
> > > > 
> > > > Switch to using of_platform_depopulate() instead of open coding so that
> > > > the child devices are created if the driver is rebound.
> > > > 
> > > > Fixes: c6e126de43e7 ("of: Keep track of populated platform devices")
> > > > Cc: stable@vger.kernel.org	# 3.16
> > > > Signed-off-by: Johan Hovold <johan@kernel.org>
> > > > ---
> > > >  drivers/mfd/omap-usb-host.c | 6 ++++--
> > > >  1 file changed, 4 insertions(+), 2 deletions(-)
> > > > 
> > > > diff --git a/drivers/mfd/omap-usb-host.c b/drivers/mfd/omap-usb-host.c
> > > > index a77b6fc790f2..4d29a6e2ed87 100644
> > > > --- a/drivers/mfd/omap-usb-host.c
> > > > +++ b/drivers/mfd/omap-usb-host.c
> > > > @@ -819,8 +819,10 @@ static void usbhs_omap_remove(struct platform_device *pdev)
> > > >  {
> > > >  	pm_runtime_disable(&pdev->dev);
> > > >  
> > > > -	/* remove children */
> > > > -	device_for_each_child(&pdev->dev, NULL, usbhs_omap_remove_child);
> > > > +	if (pdev->dev.of_node)
> > > > +		of_platform_depopulate(&pdev->dev);    
> > > 
> > > devm_of_platform_populate()?
> > >     
> > > > +	else
> > > > +		device_for_each_child(&pdev->dev, NULL, usbhs_omap_remove_child);    
> > > 
> > > What on earth is this driver even doing in MFD?
> > > 
> > > Nightmare - quick dig, bury it!    
> > 
> > Is the old platform method even supported anymore?
> > 
> > $ git grep \"usbhs_omap\""
> > drivers/mfd/omap-usb-host.c:#define USBHS_DRIVER_NAME   "usbhs_omap"
> >   
> :~/linux/arch/arm/boot/dts/ti/omap$ grep ti,usbhs-host *.dtsi
> omap3.dtsi:			compatible = "ti,usbhs-host";
> omap4-l4.dtsi:				compatible = "ti,usbhs-host";
> omap5-l4.dtsi:				compatible = "ti,usbhs-host";
> 
> So it is still in use.
> 
ok, that was just answering in panic mode to prevent removal of a needed
driver. Reading it again: I think omap2/3/4/5 without devicetree will not work
anyway, so we can remove anything done on !dev->of_node.

Regards,
Andreas

