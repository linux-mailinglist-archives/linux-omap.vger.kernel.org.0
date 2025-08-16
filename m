Return-Path: <linux-omap+bounces-4251-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C7EA9B28EA5
	for <lists+linux-omap@lfdr.de>; Sat, 16 Aug 2025 16:52:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4EF381C215FD
	for <lists+linux-omap@lfdr.de>; Sat, 16 Aug 2025 14:53:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C95312F39DF;
	Sat, 16 Aug 2025 14:52:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dominikbrodowski.net header.i=@dominikbrodowski.net header.b="zTtsWs7I"
X-Original-To: linux-omap@vger.kernel.org
Received: from isilmar-4.linta.de (isilmar-4.linta.de [136.243.71.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7F03145B3F;
	Sat, 16 Aug 2025 14:52:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=136.243.71.142
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755355950; cv=none; b=WLIyc90aHJUsOEcEEHcUgNO48aJ73ed0OKKgWutadR8uoURp/Wu/qJaNfcTV15J6eBpVkh5IDDVwI5nlWpC/tCw2lY8EO4yOZu9bfxQqLvx0xxNyn6Wj/NL2RtmZ5hmAwOAZOgkAIXUvGV6mYv+Bk4b7jZ8i3NW/JoYpEWqXsNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755355950; c=relaxed/simple;
	bh=eMxk3GbayUJW1JAPupzdQ4dkdxSkGIDON+spMHIA+3E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F1inmPZ5uLkhQIcidDWfJU2s1QgaC/OZR81loVKtpUWn80SOSFnLARSa6hqzlcYTgiPp8UmWettCKED6PSnT5iyWyS1OaRafWN1R9UOrzHGkTi2iy9myFXVlLjnfminp2o7eABLaL/Lgw+bHGgabLBiNp00QGaqZZLg6tRaCYAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dominikbrodowski.net; spf=pass smtp.mailfrom=dominikbrodowski.net; dkim=pass (2048-bit key) header.d=dominikbrodowski.net header.i=@dominikbrodowski.net header.b=zTtsWs7I; arc=none smtp.client-ip=136.243.71.142
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dominikbrodowski.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dominikbrodowski.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=dominikbrodowski.net;
	s=k19.isilmar-4; t=1755355415;
	bh=eMxk3GbayUJW1JAPupzdQ4dkdxSkGIDON+spMHIA+3E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=zTtsWs7Iff/U76XNVBhmkr0RimE1XKHoz7/cay212p9wMze/R69cadMf/wx7ZQe1k
	 4AKYSrMm5iith9TFey0SQzWZembSD3U6shajPZeNSY/BSETsvMg6E+LkMjw+12b4vq
	 VsCqNGwwSms1RJ013GOPs+mpq5huMShpnJfGh6mcQXCwnDBObhCJnw3m4XWhtBw+a9
	 ABw7rmirqSKimrLiS1OeEvC4isUVr26Ruw8DU5+icB9Ind6OYfnrikXm9n1sh2Ltgq
	 xVh6d2iAShZ0lDYTiGONQmcnrYnbULVEAloIsIBQ8VXitYyStZd3IppA93Lcdi80+x
	 7NEeY5rkLJEjw==
Received: from shine.dominikbrodowski.net (shine.brodo.linta [10.2.0.112])
	by isilmar-4.linta.de (Postfix) with ESMTPSA id 8B33A200724;
	Sat, 16 Aug 2025 14:43:35 +0000 (UTC)
Received: by shine.dominikbrodowski.net (Postfix, from userid 1000)
	id 17566A009A; Sat, 16 Aug 2025 16:41:52 +0200 (CEST)
Date: Sat, 16 Aug 2025 16:41:52 +0200
From: Dominik Brodowski <linux@dominikbrodowski.net>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Aaro Koskinen <aaro.koskinen@iki.fi>,
	Janusz Krzysztofik <jmkrzyszt@gmail.com>,
	Tony Lindgren <tony@atomide.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>,
	linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 resend] pcmcia: omap_cf: Mark driver struct with
 __refdata to prevent section mismatch
Message-ID: <aKCYsJnFIbAK2y8q@shine.dominikbrodowski.net>
References: <4937807c9d70644fae705459f36574bd24846d31.1755099931.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4937807c9d70644fae705459f36574bd24846d31.1755099931.git.geert+renesas@glider.be>

Applied to pcmcia-next, thanks!

Best,
	Dominik


Am Wed, Aug 13, 2025 at 05:50:14PM +0200 schrieb Geert Uytterhoeven:
> As described in the added code comment, a reference to .exit.text is ok
> for drivers registered via platform_driver_probe().  Make this explicit
> to prevent the following section mismatch warning
> 
>     WARNING: modpost: drivers/pcmcia/omap_cf: section mismatch in reference: omap_cf_driver+0x4 (section: .data) -> omap_cf_remove (section: .exit.text)
> 
> that triggers on an omap1_defconfig + CONFIG_OMAP_CF=m build.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Acked-by: Aaro Koskinen <aaro.koskinen@iki.fi>
> ---
> v2:
>   - Add Acked-by.
> ---
>  drivers/pcmcia/omap_cf.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/pcmcia/omap_cf.c b/drivers/pcmcia/omap_cf.c
> index 1b1dff56ec7b11f3..733777367c3b4505 100644
> --- a/drivers/pcmcia/omap_cf.c
> +++ b/drivers/pcmcia/omap_cf.c
> @@ -302,7 +302,13 @@ static void __exit omap_cf_remove(struct platform_device *pdev)
>  	kfree(cf);
>  }
>  
> -static struct platform_driver omap_cf_driver = {
> +/*
> + * omap_cf_remove() lives in .exit.text. For drivers registered via
> + * platform_driver_probe() this is ok because they cannot get unbound at
> + * runtime. So mark the driver struct with __refdata to prevent modpost
> + * triggering a section mismatch warning.
> + */
> +static struct platform_driver omap_cf_driver __refdata = {
>  	.driver = {
>  		.name	= driver_name,
>  	},
> -- 
> 2.43.0
> 
> 

