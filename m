Return-Path: <linux-omap+bounces-5411-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 871E5D0BBF3
	for <lists+linux-omap@lfdr.de>; Fri, 09 Jan 2026 18:49:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DABBE3025711
	for <lists+linux-omap@lfdr.de>; Fri,  9 Jan 2026 17:49:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D7EC3101A7;
	Fri,  9 Jan 2026 17:49:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TT6wTkwX"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8F301FF7C8;
	Fri,  9 Jan 2026 17:49:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767980950; cv=none; b=Fpuo5jdRBc7IsdJ73A6Y6Ustfa8bmnByx55+d2fkKEgOVZA+ysvQJjKfYNC1o8zlXEguYz4TLlGNTbI9TMTrYeovHQQfymg7pzW+JF2Wx9mAER3oI3DXzoaa4PHsG/88F5FwskugY/pXzL2ZdIWA3q9ka5uyVd6BUThohzr6J9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767980950; c=relaxed/simple;
	bh=KqANF+/8+hFMayQW41t7F0PMYhy7fGU+vcCNFcFd13Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KPx/heu5d7DzGDaJ6ijXxM/fs+dfizQ6tKnEkfiTxp9a9ewGqvaB5eKyWKkLuaSvLx6ijd0NeGl3CNdAQl0tfY7K8JumW04QGMCINxZS25/DSXluVRQxmyBPnFXq5XXqguQbqPHbffSZkrcgy6eXQZkqID5siN0vsoB6CC9s9SQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TT6wTkwX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5CEDBC4CEF1;
	Fri,  9 Jan 2026 17:49:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767980950;
	bh=KqANF+/8+hFMayQW41t7F0PMYhy7fGU+vcCNFcFd13Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TT6wTkwXNQ3LgMOt4T2uW5f4FGwYnNaJ3voxrJD0/J1a+eHcTw2ZDtea0uK4Wml8q
	 Ymtk0eiC4leJhhpsE5NXAPVtn1ZGonAs+YQ/PEWh52hfXYnfCfhCCTHtgcCSSVomOr
	 2uvvpRqByi2TpYxTmWGE7R+Eu6znZSbSNPO7w3WUy3MwxrTTpJ+MM3wXaO9k6rNug7
	 d9Ht3rWbX48s+I7eEfSaW6IHAhj/pe7uAe7VyStqF9Nzv9NZ+c7fiWmpLkYQlc5lGK
	 z14zKFW5orFmVWcMUMuGJBx07/EliaU8fsmQ1bAu3UHkSG3QlgI8WqKiCfLHsbQQtA
	 9Bw0FdN0Ovpbg==
Date: Fri, 9 Jan 2026 17:49:05 +0000
From: Lee Jones <lee@kernel.org>
To: Andreas Kemnade <andreas@kemnade.info>
Cc: Johan Hovold <johan@kernel.org>, Aaro Koskinen <aaro.koskinen@iki.fi>,
	Kevin Hilman <khilman@baylibre.com>,
	Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>,
	linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] mfd: omap-usb-host: fix OF populate on driver rebind
Message-ID: <20260109174905.GB1893402@google.com>
References: <20251219110714.23919-1-johan@kernel.org>
 <20260109163725.GB1808297@google.com>
 <20260109163939.GC1808297@google.com>
 <20260109181839.58ec0802@kemnade.info>
 <20260109183750.0d638710@kemnade.info>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260109183750.0d638710@kemnade.info>

On Fri, 09 Jan 2026, Andreas Kemnade wrote:

> On Fri, 9 Jan 2026 18:18:39 +0100
> Andreas Kemnade <andreas@kemnade.info> wrote:
> 
> > On Fri, 9 Jan 2026 16:39:39 +0000
> > Lee Jones <lee@kernel.org> wrote:
> > 
> > > On Fri, 09 Jan 2026, Lee Jones wrote:
> > >   
> > > > On Fri, 19 Dec 2025, Johan Hovold wrote:
> > > >     
> > > > > Since commit c6e126de43e7 ("of: Keep track of populated platform
> > > > > devices") child devices will not be created by of_platform_populate()
> > > > > if the devices had previously been deregistered individually so that the
> > > > > OF_POPULATED flag is still set in the corresponding OF nodes.
> > > > > 
> > > > > Switch to using of_platform_depopulate() instead of open coding so that
> > > > > the child devices are created if the driver is rebound.
> > > > > 
> > > > > Fixes: c6e126de43e7 ("of: Keep track of populated platform devices")
> > > > > Cc: stable@vger.kernel.org	# 3.16
> > > > > Signed-off-by: Johan Hovold <johan@kernel.org>
> > > > > ---
> > > > >  drivers/mfd/omap-usb-host.c | 6 ++++--
> > > > >  1 file changed, 4 insertions(+), 2 deletions(-)
> > > > > 
> > > > > diff --git a/drivers/mfd/omap-usb-host.c b/drivers/mfd/omap-usb-host.c
> > > > > index a77b6fc790f2..4d29a6e2ed87 100644
> > > > > --- a/drivers/mfd/omap-usb-host.c
> > > > > +++ b/drivers/mfd/omap-usb-host.c
> > > > > @@ -819,8 +819,10 @@ static void usbhs_omap_remove(struct platform_device *pdev)
> > > > >  {
> > > > >  	pm_runtime_disable(&pdev->dev);
> > > > >  
> > > > > -	/* remove children */
> > > > > -	device_for_each_child(&pdev->dev, NULL, usbhs_omap_remove_child);
> > > > > +	if (pdev->dev.of_node)
> > > > > +		of_platform_depopulate(&pdev->dev);    
> > > > 
> > > > devm_of_platform_populate()?
> > > >     
> > > > > +	else
> > > > > +		device_for_each_child(&pdev->dev, NULL, usbhs_omap_remove_child);    
> > > > 
> > > > What on earth is this driver even doing in MFD?
> > > > 
> > > > Nightmare - quick dig, bury it!    
> > > 
> > > Is the old platform method even supported anymore?
> > > 
> > > $ git grep \"usbhs_omap\""
> > > drivers/mfd/omap-usb-host.c:#define USBHS_DRIVER_NAME   "usbhs_omap"
> > >   
> > :~/linux/arch/arm/boot/dts/ti/omap$ grep ti,usbhs-host *.dtsi
> > omap3.dtsi:			compatible = "ti,usbhs-host";
> > omap4-l4.dtsi:				compatible = "ti,usbhs-host";
> > omap5-l4.dtsi:				compatible = "ti,usbhs-host";
> > 
> > So it is still in use.
> > 
> ok, that was just answering in panic mode to prevent removal of a needed
> driver. Reading it again: I think omap2/3/4/5 without devicetree will not work
> anyway, so we can remove anything done on !dev->of_node.

Okay, leave it with me.

-- 
Lee Jones [李琼斯]

