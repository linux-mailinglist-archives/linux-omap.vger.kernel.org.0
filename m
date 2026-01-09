Return-Path: <linux-omap+bounces-5408-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id D6656D0BA89
	for <lists+linux-omap@lfdr.de>; Fri, 09 Jan 2026 18:31:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 60A0430E101F
	for <lists+linux-omap@lfdr.de>; Fri,  9 Jan 2026 17:21:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E97C636C5A1;
	Fri,  9 Jan 2026 17:18:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b="PFfpv9+k"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail.andi.de1.cc (mail.andi.de1.cc [178.238.236.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0717E36C595;
	Fri,  9 Jan 2026 17:18:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.238.236.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767979135; cv=none; b=Hl/FH+6yarsVh3nTtZj8Z37LTDO/FvnRAAjGrkv9xrdHCvnO5OrUyfMooDIn6lE2WYZUrTnIb10lES+9OYQQXMlEYlEUOyfOcbVXxaA7d0zsJ0lxBpNfhIcaDwT4kOFr+m4aZcnPobh2c+opBg+4IuStbgFyljUYAsH4vaHA6lM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767979135; c=relaxed/simple;
	bh=vqFvY8aZZm1076+rFe+8Ar9hzHvJ09+D07mW9l2VxVg=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KR+6tyVb0wouFhhfNqftZxIa1jxj5aODCiX5nQh4ymlZp8Yaa/FiQ1Zda7q+Mh+XJWewvTfbgcmAAGPvLhpbO3xNXAk2w0A6wrzvsKd7+iBBApPH/6xXkRNkIagLJZjmxOgx+sZpkPu29SVUs7Pqs/Msl9gLaN8kOKRkYAsfxhA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info; spf=pass smtp.mailfrom=kemnade.info; dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b=PFfpv9+k; arc=none smtp.client-ip=178.238.236.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=References:In-Reply-To:Cc:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=zsoJl9QFT6lB2tvMX9foCwnsyxHgvWSU5kf9CkJLzMY=; b=PFfpv9+kxOZMuMoz/hl6ikeL1T
	5xpDMVbKoEI2Ix8nEflv1Cy/IjIClBVilrLg+DXy5/74vbnTYuKcW9fBXyiNctq0ZGpCrdPMxyFFg
	rpf1pMwmuLjjLorOt++ywgPc8GrV9+S8E7Hj7ep1wVYsiwH0dDcaZu31v7HWuDCEhtIFXR3lEgnCY
	88sMxC0s4qLe2azNaB+JdU68PJ7yZA8COYJ2rP6pNAI2x6HByz0Qkzt/lyG5x9UXlxxvOL8qW1WIQ
	TN2uPngw3C9Pktnhk6Gv8LrQOe9fREpFsugFc+H6S7YSY6PlQ3RmTLP84AYHQNH12VBZxPoCpLLqp
	dUTjJGBw==;
Date: Fri, 9 Jan 2026 18:18:39 +0100
From: Andreas Kemnade <andreas@kemnade.info>
To: Lee Jones <lee@kernel.org>
Cc: Johan Hovold <johan@kernel.org>, Aaro Koskinen <aaro.koskinen@iki.fi>,
 Kevin Hilman <khilman@baylibre.com>, Roger Quadros <rogerq@kernel.org>,
 Tony Lindgren <tony@atomide.com>, linux-omap@vger.kernel.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] mfd: omap-usb-host: fix OF populate on driver rebind
Message-ID: <20260109181839.58ec0802@kemnade.info>
In-Reply-To: <20260109163939.GC1808297@google.com>
References: <20251219110714.23919-1-johan@kernel.org>
	<20260109163725.GB1808297@google.com>
	<20260109163939.GC1808297@google.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; aarch64-unknown-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 9 Jan 2026 16:39:39 +0000
Lee Jones <lee@kernel.org> wrote:

> On Fri, 09 Jan 2026, Lee Jones wrote:
> 
> > On Fri, 19 Dec 2025, Johan Hovold wrote:
> >   
> > > Since commit c6e126de43e7 ("of: Keep track of populated platform
> > > devices") child devices will not be created by of_platform_populate()
> > > if the devices had previously been deregistered individually so that the
> > > OF_POPULATED flag is still set in the corresponding OF nodes.
> > > 
> > > Switch to using of_platform_depopulate() instead of open coding so that
> > > the child devices are created if the driver is rebound.
> > > 
> > > Fixes: c6e126de43e7 ("of: Keep track of populated platform devices")
> > > Cc: stable@vger.kernel.org	# 3.16
> > > Signed-off-by: Johan Hovold <johan@kernel.org>
> > > ---
> > >  drivers/mfd/omap-usb-host.c | 6 ++++--
> > >  1 file changed, 4 insertions(+), 2 deletions(-)
> > > 
> > > diff --git a/drivers/mfd/omap-usb-host.c b/drivers/mfd/omap-usb-host.c
> > > index a77b6fc790f2..4d29a6e2ed87 100644
> > > --- a/drivers/mfd/omap-usb-host.c
> > > +++ b/drivers/mfd/omap-usb-host.c
> > > @@ -819,8 +819,10 @@ static void usbhs_omap_remove(struct platform_device *pdev)
> > >  {
> > >  	pm_runtime_disable(&pdev->dev);
> > >  
> > > -	/* remove children */
> > > -	device_for_each_child(&pdev->dev, NULL, usbhs_omap_remove_child);
> > > +	if (pdev->dev.of_node)
> > > +		of_platform_depopulate(&pdev->dev);  
> > 
> > devm_of_platform_populate()?
> >   
> > > +	else
> > > +		device_for_each_child(&pdev->dev, NULL, usbhs_omap_remove_child);  
> > 
> > What on earth is this driver even doing in MFD?
> > 
> > Nightmare - quick dig, bury it!  
> 
> Is the old platform method even supported anymore?
> 
> $ git grep \"usbhs_omap\""
> drivers/mfd/omap-usb-host.c:#define USBHS_DRIVER_NAME   "usbhs_omap"
> 
:~/linux/arch/arm/boot/dts/ti/omap$ grep ti,usbhs-host *.dtsi
omap3.dtsi:			compatible = "ti,usbhs-host";
omap4-l4.dtsi:				compatible = "ti,usbhs-host";
omap5-l4.dtsi:				compatible = "ti,usbhs-host";

So it is still in use.

Regards,
Andreas

