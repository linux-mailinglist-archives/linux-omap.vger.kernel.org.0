Return-Path: <linux-omap+bounces-2709-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F81C9D2775
	for <lists+linux-omap@lfdr.de>; Tue, 19 Nov 2024 14:56:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 59A5A1F23123
	for <lists+linux-omap@lfdr.de>; Tue, 19 Nov 2024 13:56:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BFF791CCEFA;
	Tue, 19 Nov 2024 13:56:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b="1af2ZuAN"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail.andi.de1.cc (mail.andi.de1.cc [178.238.236.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BC3D1C1738;
	Tue, 19 Nov 2024 13:56:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.238.236.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732024600; cv=none; b=eZeYnbIauXc9Wy3kl5e0wDbkIR7zEwAa8wh7rKjAf4AeuST/Rx7EvytwXkHfPlampebd0XsyrsSps7ooIXaJp5Z17PvDw8Qn8EqskouO2F7oM1vhoM3oJMNgnqrWFeLWjZDhW2DXLtCjm7qOz95pBaZjaWhovOmeYZqCyfKEZzU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732024600; c=relaxed/simple;
	bh=IFNSOaXC53Vk5ymzX9aHzgHTGb2sW8fU/HW2IUPD01Q=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jbYy4Lpy0u3To+sdGo6n4tmlxCcRFpe/kFI3Nnb3eGRwZdchmJ0x8EhMkJYccufBkK0CC4OJ3X2jsQgjB6nL6Tacb9rVK3rOIsa5Lu8rM/IY518rRHHxGVsSUSQo1NEyzn8hk4s2+4i8Da3DayyGJXso0MaYQ3weRAZGyC8G7CI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info; spf=pass smtp.mailfrom=kemnade.info; dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b=1af2ZuAN; arc=none smtp.client-ip=178.238.236.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=References:In-Reply-To:Cc:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=85AnupwyflwJMv3Hm2iZZW0mYdCSfermzCbpbXSZWWs=; b=1af2ZuANu0+tpeQ3dCcm0znurA
	mgd2wLcaEedi/3RnwS2v5CLb/dxevDBRzbWN22hv2AgqI2LS9BMgbYNtoDWazobQy8eg2BX0NShV3
	XMRbhXNg8PYXM9NqJdcT2Vz0w4nyuOMbYtONsIw/yzE0Ni+Kq085aJiY/x2kZosjaVg5kq2qG6PJv
	bUBi9P4TxOw+/ndcMkG1DcquXDqNTyuJyz0POVdBfxPU5st6JSgj+0FGjhgJesR94VN0iWv5ZK7CQ
	Jcsle2nLNutShikZyljMaRV0Nq9SuLuo8IClKTtYDuL8d+W0YQbIJxAKw/2qoKp4W279RbOjm+ag1
	FDuWasrg==;
Date: Tue, 19 Nov 2024 14:56:22 +0100
From: Andreas Kemnade <andreas@kemnade.info>
To: Roger Quadros <rogerq@kernel.org>
Cc: Karol Przybylski <karprzy7@gmail.com>, aaro.koskinen@iki.fi,
 khilman@baylibre.com, tony@atomide.com, lee@kernel.org,
 linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org,
 skhan@linuxfoundation.org
Subject: Re: [PATCH] mfd: omap-usb-tll: check clk_prepare return code
Message-ID: <20241119145622.2f1f0342@akair>
In-Reply-To: <486d5734-aa02-4a5e-b2ee-fdbba65179a3@kernel.org>
References: <20241113211614.518439-1-karprzy7@gmail.com>
	<486d5734-aa02-4a5e-b2ee-fdbba65179a3@kernel.org>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Am Tue, 19 Nov 2024 15:10:23 +0200
schrieb Roger Quadros <rogerq@kernel.org>:

> Hi,
> 
> On 13/11/2024 23:16, Karol Przybylski wrote:
> > clk_prepare() is called in usbtll_omap_probe to fill clk array.
> > Return code is not checked, leaving possible error condition unhandled.
> > 
> > Added variable to hold return value from clk_prepare() and dev_dbg statement
> > when it's not successful.
> > 
> > Found in coverity scan, CID 1594680
> > 
> > Signed-off-by: Karol Przybylski <karprzy7@gmail.com>
> > ---
> >  drivers/mfd/omap-usb-tll.c | 11 +++++++----
> >  1 file changed, 7 insertions(+), 4 deletions(-)
> > 
> > diff --git a/drivers/mfd/omap-usb-tll.c b/drivers/mfd/omap-usb-tll.c
> > index 0f7fdb99c809..2e9319ee1b74 100644
> > --- a/drivers/mfd/omap-usb-tll.c
> > +++ b/drivers/mfd/omap-usb-tll.c
> > @@ -202,7 +202,7 @@ static int usbtll_omap_probe(struct platform_device *pdev)
> >  	struct device				*dev =  &pdev->dev;
> >  	struct usbtll_omap			*tll;
> >  	void __iomem				*base;
> > -	int					i, nch, ver;
> > +	int					i, nch, ver, err;
> >  
> >  	dev_dbg(dev, "starting TI HSUSB TLL Controller\n");
> >  
> > @@ -248,10 +248,13 @@ static int usbtll_omap_probe(struct platform_device *pdev)
> >  					"usb_tll_hs_usb_ch%d_clk", i);
> >  		tll->ch_clk[i] = clk_get(dev, clkname);
> >  
> > -		if (IS_ERR(tll->ch_clk[i]))
> > +		if (IS_ERR(tll->ch_clk[i])) {
> >  			dev_dbg(dev, "can't get clock : %s\n", clkname);

if you want dev_err() later, then why not here?

> > -		else
> > -			clk_prepare(tll->ch_clk[i]);
> > +		} else {
> > +			err = clk_prepare(tll->ch_clk[i]);
> > +			if (err)
> > +				dev_dbg(dev, "clock prepare error for: %s\n", clkname);  
> 
> dev_err()?
> 
So why do you want a different return handling here? (I doubt there is
any clock having a real prepare() involved here)

As said in an earlier incarnation of this patch, the real question is
whether having partial clocks available is a valid operating scenario.
If yes, then the error should be ignored. If no, then bailing out early
is a good idea.

clk_prepare() errors are catched by failing clk_enable() later,
ch_clk[i] is checked later, too.

> I think we should return the error in this case.
> (after unpreparing the prepared clocks and clk_put())
>
and pm_runtime_put_sync(dev) 

Regards,
Andreas

