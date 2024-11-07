Return-Path: <linux-omap+bounces-2610-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CD1799C0F8C
	for <lists+linux-omap@lfdr.de>; Thu,  7 Nov 2024 21:06:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 41A51B22B9F
	for <lists+linux-omap@lfdr.de>; Thu,  7 Nov 2024 20:06:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF51A217F2A;
	Thu,  7 Nov 2024 20:06:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b="ZXMr5U7T"
X-Original-To: linux-omap@vger.kernel.org
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [185.185.170.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBF0F2178F2;
	Thu,  7 Nov 2024 20:06:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.185.170.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731009967; cv=pass; b=C7FdsDeSpUwADZwpyyUQ1nPp9x4RVKdo5cYMP9vFYSgU03QR64zEYVCci39tyGmM/Mxg94cMhEeqTNtEsnxNnG6u9p/qfQ0ydQxzAUAQB2wyQZyFKzfZjaS34KY1POCzw1HKjEEi8eSzP4Ysb0WkRabOhUP3/hHaynMOzxVOMZY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731009967; c=relaxed/simple;
	bh=bIWxZW3d05aEsbuRDiylftdf+NrqOX1D5MPeOPhUH6I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=synTQu2qvn2Tl/Jq91Ij2emeyyvIeHv4wDWmWgC3Ez0881SZLkMNFt6sSUWDIN4AhjYiCPyBPDfVrCLpCoEYnCtBKph/x6fvvjJ+3ey0Npea0/k+IcVz4QFLXrxIfiN/WG+l5Z6DEHXsUtVWba2mWU8nLoxXX1dH+Hnis+R8zyM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi; spf=pass smtp.mailfrom=iki.fi; dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b=ZXMr5U7T; arc=pass smtp.client-ip=185.185.170.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Received: from darkstar.musicnaut.iki.fi (85-76-164-62-nat.elisa-mobile.fi [85.76.164.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: aaro.koskinen)
	by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 4XktBg1zWDz49QDf;
	Thu,  7 Nov 2024 21:56:58 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
	t=1731009420;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=4YWtEjmtLE76qVSIEjq43uIzb418WRfFLv6WI08b71w=;
	b=ZXMr5U7TdoHKEQnX5yCtCeenN02OS8m4uNzYmTfsj/V7rhvvwks0rdEEp6udpzq68j30s2
	QqtP8nUrfQPZVJkFE788hgBYJ0/1r/pw3oh4SMeyvIKhU3yzts4A0KuIhlR5lVECI8RB2H
	JlSBtdBSsi1pdk8LZ71EO44u7LmoZJkM1q2ZRYbSCjfSbtd4bdpUuTnUaJtvPhFeJHoYj+
	Lu0p6RjgIGh7GI0Mlq+ePKyJaxqgFi/6JK9kM+VyH21SGF7Mng+4Os0Col3bMm89MmZ9lM
	DnESOG9cIDMtfP4IABR8oRjEMQRnYdA/Pg71eAmMQP/L+jWZ4NihLU4uMHq/vw==
ARC-Seal: i=1; s=lahtoruutu; d=iki.fi; t=1731009420; a=rsa-sha256;
	cv=none;
	b=jYjeIbuZYh6bowpd2ulbvyk8NgfBNEj8Vgox7pQIwNMLTlAt5tZGLoHCHGS5m/86sbnwTj
	r5irUxOrheTgSk8wwR9sJZiFqWaagXx50ONMvOcZofzVHdOpPaB/0QxCeyVWLx9ZLZtGgE
	i/nt5Z43UUXkB8OWwLSIHKg/i7WXgRUoc80vvt0HKG09+0LwW9qb9iEuEQPJ+wXU+zBs4d
	EeccxRsAkAQBbKBjKS0equa20ID/IR3Xp78ZWNuGmiK1YZcryNCRLIToLy7hUDSBb3PTiU
	TymG5itztfkTMTyYeAk1HXBC4OaNrleS4i4uMO40GRMPfuTf6+KvXdJx6BUfFg==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=aaro.koskinen smtp.mailfrom=aaro.koskinen@iki.fi
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=lahtoruutu; t=1731009420;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=4YWtEjmtLE76qVSIEjq43uIzb418WRfFLv6WI08b71w=;
	b=pXDE5b0ywTdJO6e8XbToSw/5nS/lGCAokh5lo4oklzU2K76OyFBAutXLSsbIr2rpKny+gU
	lVlfeynosp7XSxznXhIImGN6qZnAh2xEislkkYkRkrehOSDSbhDjsEdUayt2QUVSR/7+CV
	HAUFoEpZFJ3oQqhU5m+zqvyQrjofJ/lcCn06eUFFnlE/+cxjVy/YHD+WcuHKjTEzmactgY
	EUhTLYuOEbBh30BO1h+xFxVPyA75VDEExHi+G0xyo6Nu6U6oiD4Uo9EFwDZdWVUUdeBDqX
	6WhS3Rxdn6dFAmWpA3GiZx7PhG9Mrv6ZEW+nvSPekxMzYbA8AU59kzNAguc+aA==
Date: Thu, 7 Nov 2024 21:56:57 +0200
From: Aaro Koskinen <aaro.koskinen@iki.fi>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Dominik Brodowski <linux@dominikbrodowski.net>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>,
	Janusz Krzysztofik <jmkrzyszt@gmail.com>,
	Tony Lindgren <tony@atomide.com>, linux-omap@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] pcmcia: omap_cf: : Mark driver struct with __refdata to
 prevent section mismatch
Message-ID: <Zy0bicseNf0yqxlz@darkstar.musicnaut.iki.fi>
References: <9e56c0d03509d79736961ded7a1b90a361fd2e06.1730895069.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9e56c0d03509d79736961ded7a1b90a361fd2e06.1730895069.git.geert+renesas@glider.be>

Hi,

On Wed, Nov 06, 2024 at 01:13:57PM +0100, Geert Uytterhoeven wrote:
> As described in the added code comment, a reference to .exit.text is ok
> for drivers registered via platform_driver_probe().  Make this explicit
> to prevent the following section mismatch warning
> 
>     WARNING: modpost: drivers/pcmcia/omap_cf: section mismatch in reference: omap_cf_driver+0x4 (section: .data) -> omap_cf_remove (section: .exit.text)
> 
> that triggers on an omap1_defconfig + CONFIG_OMAP_CF=m build.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Acked-by: Aaro Koskinen <aaro.koskinen@iki.fi>

A.

> ---
>  drivers/pcmcia/omap_cf.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/pcmcia/omap_cf.c b/drivers/pcmcia/omap_cf.c
> index 80137c7afe0d9bcf..938fad9c12aa8a4e 100644
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
> 2.34.1
> 

