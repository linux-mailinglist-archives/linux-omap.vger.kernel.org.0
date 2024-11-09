Return-Path: <linux-omap+bounces-2650-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BA419C300F
	for <lists+linux-omap@lfdr.de>; Sun, 10 Nov 2024 00:30:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 45EDC1F215EF
	for <lists+linux-omap@lfdr.de>; Sat,  9 Nov 2024 23:30:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D08A1A00F8;
	Sat,  9 Nov 2024 23:30:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b="mo6OhtIK"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail.andi.de1.cc (mail.andi.de1.cc [178.238.236.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1C4F1E4BE;
	Sat,  9 Nov 2024 23:30:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.238.236.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731195017; cv=none; b=WBKRVRhUWxnjpj9NoiFOc71zYbv8byekwNbWmBcSvVE5ix3DQLhsllYlm05NzfOcohMGwDpad1YAnuoh1041coQDzW8qTvAhygmBvd5bIzHPSWhdzOyiQPDydaOeo6r4LcueSD//vFHoXi6l59z+tPF1a3eZ4OqNBjWr0y0A8hc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731195017; c=relaxed/simple;
	bh=uFNBYnwd1ia1RoOgCQ/MjHn/GJ65pILhrHkUFUBF1Cc=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DR0iQEL55yeplZcndDuQYTt9RTUFtiZQi/wx46ibJC+nRejV5f5kN05Fw1j3kgG5Yh/LhwB5WdCHW7DI3TqjhQjju4d2iDkTHPry/N2eWxtpNeMf79oZ6h9T/UW2L6nHP1Wyn7BiHDFgYdNTVWZCqgiUjDzIsHYo/HAfDRuiKOU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info; spf=pass smtp.mailfrom=kemnade.info; dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b=mo6OhtIK; arc=none smtp.client-ip=178.238.236.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=References:In-Reply-To:Cc:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=ktlnpyzsZf9FCUvE5aBD8IabGy9VTcpXU6wv6DgGIBI=; b=mo6OhtIKngXJ2w/AnfAcvyE6te
	Zg3yiePmUb7kwpQAbGxNklTS6vTBdmWM337hxiLTi8RHrVsumexa6P75JHVnQ7VVOJuRqyzaooCkN
	svl6jfZrOsLHd9z7AerqLL6nQw4lGseBXJ+jv7kVP92Bqx/eByENmUJPGiTMY1z/ZK0kQdnhzIsH+
	Yb7KgHPUmq+X6z0YpFc5jGe8Tgzu1NXaIXsoKSxFOLBKixgbbY1Lca+I4ivfrLGYPRecPDbgHwY+E
	a+8R4Xm5uQ+h2h3TYTb0hWQ8rnCHaH7I0uwZBYnKnVIVAcipyOJ1TkH2gfz3wuqIYmNE6QiyhowDH
	dYXHrr9A==;
Date: Sun, 10 Nov 2024 00:29:54 +0100
From: Andreas Kemnade <andreas@kemnade.info>
To: Karol P <karprzy7@gmail.com>
Cc: aaro.koskinen@iki.fi, khilman@baylibre.com, rogerq@kernel.org,
 tony@atomide.com, lee@kernel.org, linux-omap@vger.kernel.org,
 linux-kernel@vger.kernel.org, skhan@linuxfoundation.org
Subject: Re: [PATCH] mfd: omap-usb-tll: handle clk_prepare return code in
 usbtll_omap_probe
Message-ID: <20241110002954.1134398a@akair>
In-Reply-To: <CAKwoAfp6iPN0F_kfNbF8xbpX7+Qh+BS55KgmZ5nis0u00vOFhw@mail.gmail.com>
References: <20241106223324.479341-1-karprzy7@gmail.com>
	<20241107001507.5a304718@akair>
	<CAKwoAfp6iPN0F_kfNbF8xbpX7+Qh+BS55KgmZ5nis0u00vOFhw@mail.gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Am Thu, 7 Nov 2024 12:12:52 +0100
schrieb Karol P <karprzy7@gmail.com>:

> On Thu, 7 Nov 2024 at 00:15, Andreas Kemnade <andreas@kemnade.info> wrote:
> >
> > Am Wed,  6 Nov 2024 23:33:24 +0100
> > schrieb Karol Przybylski <karprzy7@gmail.com>:
> >  
> > > clk_prepare() is called in usbtll_omap_probe to fill clk array.
> > > Return code is not checked, leaving possible error condition unhandled.
> > >
> > > Added variable to hold return value from clk_prepare() and return statement
> > > when it's not successful.
> > >
> > > Found in coverity scan, CID 1594680
> > >
> > > Signed-off-by: Karol Przybylski <karprzy7@gmail.com>
> > > ---
> > >  drivers/mfd/omap-usb-tll.c | 8 ++++++--
> > >  1 file changed, 6 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/drivers/mfd/omap-usb-tll.c b/drivers/mfd/omap-usb-tll.c
> > > index 0f7fdb99c809..28446b082c85 100644
> > > --- a/drivers/mfd/omap-usb-tll.c
> > > +++ b/drivers/mfd/omap-usb-tll.c
> > > @@ -202,7 +202,7 @@ static int usbtll_omap_probe(struct platform_device *pdev)
> > >       struct device                           *dev =  &pdev->dev;
> > >       struct usbtll_omap                      *tll;
> > >       void __iomem                            *base;
> > > -     int                                     i, nch, ver;
> > > +     int                                     i, nch, ver, err;
> > >
> > >       dev_dbg(dev, "starting TI HSUSB TLL Controller\n");
> > >
> > > @@ -251,7 +251,11 @@ static int usbtll_omap_probe(struct platform_device *pdev)
> > >               if (IS_ERR(tll->ch_clk[i]))
> > >                       dev_dbg(dev, "can't get clock : %s\n", clkname);  
> >
> > if you add more intensive error checking, then why is this error
> > ignored and not returned?  
> 
> Thank you for the feedback. It does seem that elevated error checking
> is not the way
> to go in this case. 

As far as I can see everything checks ch_clk[i] for validity before
usage. Also clk_enable() called later is checked which would catch
clk_prepare() failures, if there were even possible here.

So the only question which I am not 100% sure about is whether having
ch_clk sparsly populated is normal operation. If that is the case, then
more error checking is not useful. If not, then it might let us better
sleep. As said as far as I can see errors are catched later.

@Roger: what is your opintion towards this?

BTW: If you do this kind of work, you could also use W=1 or
CONFIG_WERROR during compiling to catch easy things. At least I see new
compile warnings with your patch. 

Regards,
Andreas

