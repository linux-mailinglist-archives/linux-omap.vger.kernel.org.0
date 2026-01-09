Return-Path: <linux-omap+bounces-5410-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id F3720D0BBEB
	for <lists+linux-omap@lfdr.de>; Fri, 09 Jan 2026 18:48:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id D6B0A303DFDC
	for <lists+linux-omap@lfdr.de>; Fri,  9 Jan 2026 17:43:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DFD9436829F;
	Fri,  9 Jan 2026 17:43:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="C7V2xH3m"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83AC950095F;
	Fri,  9 Jan 2026 17:43:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767980596; cv=none; b=mDd3AyGSd2Nv8iyI+O1OMtvlxEmzomSF+yM8kYRRGp5Dh+/7gAKrvML7lTVNIMWO9+jz2Qx09aPGYvvEMjOc16I4wL3PFHwITvJOtcmlpdW31oFPhVX10N4AQshYqano2O1nKk6GC+R1ZI8VKYO9v4gXnEpq4BKQPdOghnUeWy4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767980596; c=relaxed/simple;
	bh=/pgV5wcm1dvqwhnHcHdbw9DAL2YyW2Z4NwZDud03cPY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rufPpHS3wSLgulPLRECw2lEuCuKEy9bJiLi+Gr4VmoWeX2hwf1CLk9qkRgcjls95T/CPL7xIEw/ZCBrQ7zzSu2TmOCLjTJKbL1oL7b+4gvjhiqRh80ybJwNZGhHWcdOWL3uR82ljB8jEp1SwpjIArqzhBa3CJQcr1cIRv4M5RQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=C7V2xH3m; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE15FC4CEF1;
	Fri,  9 Jan 2026 17:43:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767980596;
	bh=/pgV5wcm1dvqwhnHcHdbw9DAL2YyW2Z4NwZDud03cPY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=C7V2xH3m80zg7RB3eLRAqOtBbfrfqRFpMPqIGujuV8hGEUP3dXEhq4RU3VgZay1gA
	 FvMAnWqUA+CCTxhr8q7oWlfX+lXsDg7HWtfn9dLE5gEsAf1Cu3cCLUTW9Lcjpk2HlR
	 t1yU8d1ID2wqV+Pj9Mz3rqRZtW4oMmYSFtEKO3y2PlkN+QPRGNP6OwVRmz6dwcBHxL
	 pySH7SaJOP/gSOnB+1Drem3EBw5V+kKhVSra6p0wV3CIl8oESPi+uQ0qIbbcpFo+Om
	 5OD5BjdlQnLG/dqDhmIfVzW3NCwTSctWuG6gKQp+3U2fj85t3dfSYcMSP1N5jExdPv
	 NZ0Vn5TnxqlWQ==
Date: Fri, 9 Jan 2026 17:43:10 +0000
From: Lee Jones <lee@kernel.org>
To: Andreas Kemnade <andreas@kemnade.info>
Cc: Johan Hovold <johan@kernel.org>, Aaro Koskinen <aaro.koskinen@iki.fi>,
	Kevin Hilman <khilman@baylibre.com>,
	Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>,
	linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] mfd: omap-usb-host: fix OF populate on driver rebind
Message-ID: <20260109174310.GA1893402@google.com>
References: <20251219110714.23919-1-johan@kernel.org>
 <20260109163725.GB1808297@google.com>
 <20260109163939.GC1808297@google.com>
 <20260109181839.58ec0802@kemnade.info>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260109181839.58ec0802@kemnade.info>

On Fri, 09 Jan 2026, Andreas Kemnade wrote:

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

That's the new "DT" method.

What about the old "usbhs_omap" one?

Looks to me like support was removed by Tony in 2016:

  9080b8dc761a ("ARM: OMAP2+: Remove legacy usb-host.c platform init code")

-- 
Lee Jones [李琼斯]

