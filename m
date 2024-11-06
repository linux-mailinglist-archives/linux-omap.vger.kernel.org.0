Return-Path: <linux-omap+bounces-2601-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EDF19BF9D2
	for <lists+linux-omap@lfdr.de>; Thu,  7 Nov 2024 00:15:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1C65FB226E3
	for <lists+linux-omap@lfdr.de>; Wed,  6 Nov 2024 23:15:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33E0E20D4EB;
	Wed,  6 Nov 2024 23:15:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b="j+0enVEu"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail.andi.de1.cc (mail.andi.de1.cc [178.238.236.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E67381917D7;
	Wed,  6 Nov 2024 23:15:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.238.236.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730934922; cv=none; b=TJxm4GdUy1nGrfYVrDFBYB/OzYsLhPUlIT/2tdIeeHO0k5+ut6uaEIWAj7Nt1nyvubD1LDAUy0kavjITgiFENah5qLkzCPlWN2+dxavdPSyKApvG7kFmFRsuLN1bF3AVVCa/rZkUEuB5cjA8fIXIqdSRMssinoFhnbtjHCEwfwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730934922; c=relaxed/simple;
	bh=RklpY0ho7e5h9yEsoAeXRqDqiPFyDB71S0/UpX+1GHg=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=u5GTwjCF18dA20rsh3MlmgPhwVH3lVj3cCtgKm6ejxIy+mL7AMv4ErQYnbt4cDgPNwDk9/HOHrgbezAn8wVErsAhXU9SNFvvPGJVUBvUTgpiyR87h5xVK3bD6AYWFFBeSHpyw7zLlDFuqOMar03F2nStcH74ZQXVQc4JefdVlZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info; spf=pass smtp.mailfrom=kemnade.info; dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b=j+0enVEu; arc=none smtp.client-ip=178.238.236.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=References:In-Reply-To:Cc:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=IdBQrcnG0vKQk+mv8lytmh9KFhAd9jGWElx6mC9Vt2s=; b=j+0enVEuyRS7rqmyI5F8oOoDL8
	8ZE+qUYdylU4+OWJuo7hSR8sbf7g3w/Z5JOKS/8GNVH7x5R36++LC92/37oWrwdpAo2XJhGrb+oYg
	Q/nwmoZr8nffw4K5UQr2XVHzgh+mIV/I7cDNTWOSEEg5DYGBhWaN10Z9WMCexjlzoaeXObwGXOvxN
	zxta0JjycEGhSv0HyKT5NJkBNq3O0i3VmQuUtlGfoIkg6Iwy72xOvxjFojSeHAcHm37DgwIU0lcBl
	oRXMZbWRJQcd9F89ExlJzIxajivN8+IANIoWhuP+rAXuJBSA5MOvguR6pXdp4uDmaq7j8lsTvdQGQ
	KqrTq0yg==;
Date: Thu, 7 Nov 2024 00:15:07 +0100
From: Andreas Kemnade <andreas@kemnade.info>
To: Karol Przybylski <karprzy7@gmail.com>
Cc: aaro.koskinen@iki.fi, khilman@baylibre.com, rogerq@kernel.org,
 tony@atomide.com, lee@kernel.org, linux-omap@vger.kernel.org,
 linux-kernel@vger.kernel.org, skhan@linuxfoundation.org
Subject: Re: [PATCH] mfd: omap-usb-tll: handle clk_prepare return code in
 usbtll_omap_probe
Message-ID: <20241107001507.5a304718@akair>
In-Reply-To: <20241106223324.479341-1-karprzy7@gmail.com>
References: <20241106223324.479341-1-karprzy7@gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Am Wed,  6 Nov 2024 23:33:24 +0100
schrieb Karol Przybylski <karprzy7@gmail.com>:

> clk_prepare() is called in usbtll_omap_probe to fill clk array.
> Return code is not checked, leaving possible error condition unhandled.
> 
> Added variable to hold return value from clk_prepare() and return statement
> when it's not successful.
> 
> Found in coverity scan, CID 1594680
> 
> Signed-off-by: Karol Przybylski <karprzy7@gmail.com>
> ---
>  drivers/mfd/omap-usb-tll.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/mfd/omap-usb-tll.c b/drivers/mfd/omap-usb-tll.c
> index 0f7fdb99c809..28446b082c85 100644
> --- a/drivers/mfd/omap-usb-tll.c
> +++ b/drivers/mfd/omap-usb-tll.c
> @@ -202,7 +202,7 @@ static int usbtll_omap_probe(struct platform_device *pdev)
>  	struct device				*dev =  &pdev->dev;
>  	struct usbtll_omap			*tll;
>  	void __iomem				*base;
> -	int					i, nch, ver;
> +	int					i, nch, ver, err;
>  
>  	dev_dbg(dev, "starting TI HSUSB TLL Controller\n");
>  
> @@ -251,7 +251,11 @@ static int usbtll_omap_probe(struct platform_device *pdev)
>  		if (IS_ERR(tll->ch_clk[i]))
>  			dev_dbg(dev, "can't get clock : %s\n", clkname);

if you add more intensive error checking, then why is this error
ignored and not returned?

>  		else
> -			clk_prepare(tll->ch_clk[i]);
> +			err = clk_prepare(tll->ch_clk[i]);
> +			if (err) {
unnatural braces, if (err) is not in the else branch ?!
> +				dev_err(dev, "Unable to prepare clock\n");
> +				return err;
> +	}
>  	}
>  
>  	pm_runtime_put_sync(dev);
and this one is not called if you return early.

Regards,
Andreas

