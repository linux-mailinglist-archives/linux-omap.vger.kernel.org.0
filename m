Return-Path: <linux-omap+bounces-5406-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A849D0B511
	for <lists+linux-omap@lfdr.de>; Fri, 09 Jan 2026 17:42:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AB8D8306647F
	for <lists+linux-omap@lfdr.de>; Fri,  9 Jan 2026 16:37:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B90A435E551;
	Fri,  9 Jan 2026 16:37:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jP/yVYKq"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 608D430FF23;
	Fri,  9 Jan 2026 16:37:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767976650; cv=none; b=BYNDzYor1pIHDgUNnAV4AvhBBaXrA+gOGYZ1IIyquPDU1WuorChGiEFnWZDYBOYA7+pkZdVx1zcx0xRiHy+oPGdPk09J/2A29mnJNbRxECsLy5jl47tCa/vhQBYbnaL5+scJhHx7OjjFEyi/xWaOUif4W4otyhmivP8oSOm/bo0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767976650; c=relaxed/simple;
	bh=0dtgcgDCM4HTCVi/Oc9lrnWcXzHiq0gGhWKqr5iKGh0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Q4pa/Wir2HQfpRCCSMD5YRBezhs1z90AgDQ51/ijiTuoMpgYwqBQEp54VKqn8nvbP6CV2Aa3SCHo0K/QnNQvFw4jOjIKRsgd8dAwlB/rfYD5q2NXL8qURJ2x9l2YIT4vKxZjcsxK4ecm2PFP0diCuQdv5hpgtWjBY8EMXMX6UOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jP/yVYKq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3812C4CEF1;
	Fri,  9 Jan 2026 16:37:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767976650;
	bh=0dtgcgDCM4HTCVi/Oc9lrnWcXzHiq0gGhWKqr5iKGh0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jP/yVYKqSXvJ41w1AmxoWZgFMiCYdTrrMEgso6ss7jorxKTq7L1pYO0hom4WnGPiO
	 iLbNFtDGEDeidOMXCGTjd1vQlGx0tbn9rL/2/pzO2CiAD/YUB2Q/8ULbLIoIgV0y7v
	 RNaCR8Oz6ovq/6sHGnQL93NnTmbjJpzFzEDg3LRpxQpUhOU/bPtRB+QNE/8wt1o9/e
	 Ddxkeh61eL3tfo61QxD0CzeV/4IIWetSdDOI9E6nC2gquQAQaqEKR4LmqmQvjJveEJ
	 JGKvhgqVYGCct0/BYbHHwRRrFMvRGvUGQedDTZ8y8gIpmrFbsc3Luz/s0AkCeFFcpD
	 SbWpvHOiGkr6Q==
Date: Fri, 9 Jan 2026 16:37:25 +0000
From: Lee Jones <lee@kernel.org>
To: Johan Hovold <johan@kernel.org>
Cc: Aaro Koskinen <aaro.koskinen@iki.fi>,
	Andreas Kemnade <andreas@kemnade.info>,
	Kevin Hilman <khilman@baylibre.com>,
	Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>,
	linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] mfd: omap-usb-host: fix OF populate on driver rebind
Message-ID: <20260109163725.GB1808297@google.com>
References: <20251219110714.23919-1-johan@kernel.org>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251219110714.23919-1-johan@kernel.org>

On Fri, 19 Dec 2025, Johan Hovold wrote:

> Since commit c6e126de43e7 ("of: Keep track of populated platform
> devices") child devices will not be created by of_platform_populate()
> if the devices had previously been deregistered individually so that the
> OF_POPULATED flag is still set in the corresponding OF nodes.
> 
> Switch to using of_platform_depopulate() instead of open coding so that
> the child devices are created if the driver is rebound.
> 
> Fixes: c6e126de43e7 ("of: Keep track of populated platform devices")
> Cc: stable@vger.kernel.org	# 3.16
> Signed-off-by: Johan Hovold <johan@kernel.org>
> ---
>  drivers/mfd/omap-usb-host.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/mfd/omap-usb-host.c b/drivers/mfd/omap-usb-host.c
> index a77b6fc790f2..4d29a6e2ed87 100644
> --- a/drivers/mfd/omap-usb-host.c
> +++ b/drivers/mfd/omap-usb-host.c
> @@ -819,8 +819,10 @@ static void usbhs_omap_remove(struct platform_device *pdev)
>  {
>  	pm_runtime_disable(&pdev->dev);
>  
> -	/* remove children */
> -	device_for_each_child(&pdev->dev, NULL, usbhs_omap_remove_child);
> +	if (pdev->dev.of_node)
> +		of_platform_depopulate(&pdev->dev);

devm_of_platform_populate()?

> +	else
> +		device_for_each_child(&pdev->dev, NULL, usbhs_omap_remove_child);

What on earth is this driver even doing in MFD?

Nightmare - quick dig, bury it!

-- 
Lee Jones [李琼斯]

