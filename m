Return-Path: <linux-omap+bounces-5407-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EC892D0B583
	for <lists+linux-omap@lfdr.de>; Fri, 09 Jan 2026 17:45:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8F2DE30ECA74
	for <lists+linux-omap@lfdr.de>; Fri,  9 Jan 2026 16:39:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 279B08F49;
	Fri,  9 Jan 2026 16:39:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FCgnkZPM"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4E78364022;
	Fri,  9 Jan 2026 16:39:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767976784; cv=none; b=dHZz0Kp+jq8yVUMIwpqPckNX8Jthe7QCJCZZF7G1ExqreJLeM9QYBeMBK6pQPnttVPws50Hf+q2BWKO+aY2WfJdDtLoiY3shBG/oye5e5Ra+pCwGBZ5cmee+F3juoTHEfH7wYdw+iwVLWcGEz1CluvM+oTFvdYY4+RewApmAyi0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767976784; c=relaxed/simple;
	bh=NvBUETpJzVjtlrKtXgpeoF5isYgT00Uiw6BOs/OZSQ4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kIhJwGRzHDyM9ZWDWzal7rki0FE3e+hqu0UK+T219vH3rLjeeXiFbY99+Yr16OtCLa5FFFt1blYsqcM2Ay7ojQGKBMSHLbU9dUX/3fF5oUNyFYaoJ3uBNaV2ODaTIlqJFOvoM1zOX51YDOtuBcUdvizxrp8l/7EDgJKZKDuhg00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FCgnkZPM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2831AC4CEF1;
	Fri,  9 Jan 2026 16:39:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767976784;
	bh=NvBUETpJzVjtlrKtXgpeoF5isYgT00Uiw6BOs/OZSQ4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FCgnkZPMXqPMO91nJEM/4+1hQFFQD4MXuLhEjK+ORrWvvY6+YaRwhpdiuihgIY8GU
	 hX5N2RWG6Wf7ZRqsVLm+sKWPXD0XZe7eA+CF3H6reL3h19KVF0hMoeJ19bvdb6NM0/
	 EGS0/gkXnWKbmAgYA5pxDZD4O72y6AlVZ8ky5JgKnt7we2KXG6nzEP/yrJfIBt0PUN
	 PSBq+QtaSYKBSj6gOaiWvRZOqVEqgWLioL5QqD3RzIm8Gr3/mqYWLczhebxAwdFD0o
	 leONP0SxdP7j266x6sr7lkaq8ubZu5EbJ+2IUZcbQX+jdPCPLe3c0ZHUMTbHIWoOGm
	 0/JfZG54YqOcQ==
Date: Fri, 9 Jan 2026 16:39:39 +0000
From: Lee Jones <lee@kernel.org>
To: Johan Hovold <johan@kernel.org>
Cc: Aaro Koskinen <aaro.koskinen@iki.fi>,
	Andreas Kemnade <andreas@kemnade.info>,
	Kevin Hilman <khilman@baylibre.com>,
	Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>,
	linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] mfd: omap-usb-host: fix OF populate on driver rebind
Message-ID: <20260109163939.GC1808297@google.com>
References: <20251219110714.23919-1-johan@kernel.org>
 <20260109163725.GB1808297@google.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260109163725.GB1808297@google.com>

On Fri, 09 Jan 2026, Lee Jones wrote:

> On Fri, 19 Dec 2025, Johan Hovold wrote:
> 
> > Since commit c6e126de43e7 ("of: Keep track of populated platform
> > devices") child devices will not be created by of_platform_populate()
> > if the devices had previously been deregistered individually so that the
> > OF_POPULATED flag is still set in the corresponding OF nodes.
> > 
> > Switch to using of_platform_depopulate() instead of open coding so that
> > the child devices are created if the driver is rebound.
> > 
> > Fixes: c6e126de43e7 ("of: Keep track of populated platform devices")
> > Cc: stable@vger.kernel.org	# 3.16
> > Signed-off-by: Johan Hovold <johan@kernel.org>
> > ---
> >  drivers/mfd/omap-usb-host.c | 6 ++++--
> >  1 file changed, 4 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/mfd/omap-usb-host.c b/drivers/mfd/omap-usb-host.c
> > index a77b6fc790f2..4d29a6e2ed87 100644
> > --- a/drivers/mfd/omap-usb-host.c
> > +++ b/drivers/mfd/omap-usb-host.c
> > @@ -819,8 +819,10 @@ static void usbhs_omap_remove(struct platform_device *pdev)
> >  {
> >  	pm_runtime_disable(&pdev->dev);
> >  
> > -	/* remove children */
> > -	device_for_each_child(&pdev->dev, NULL, usbhs_omap_remove_child);
> > +	if (pdev->dev.of_node)
> > +		of_platform_depopulate(&pdev->dev);
> 
> devm_of_platform_populate()?
> 
> > +	else
> > +		device_for_each_child(&pdev->dev, NULL, usbhs_omap_remove_child);
> 
> What on earth is this driver even doing in MFD?
> 
> Nightmare - quick dig, bury it!

Is the old platform method even supported anymore?

$ git grep \"usbhs_omap\""
drivers/mfd/omap-usb-host.c:#define USBHS_DRIVER_NAME   "usbhs_omap"

-- 
Lee Jones [李琼斯]

