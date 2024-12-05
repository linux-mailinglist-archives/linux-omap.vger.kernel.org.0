Return-Path: <linux-omap+bounces-2782-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DF8889E60E0
	for <lists+linux-omap@lfdr.de>; Thu,  5 Dec 2024 23:51:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 93F5516628D
	for <lists+linux-omap@lfdr.de>; Thu,  5 Dec 2024 22:51:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1DC41CC89D;
	Thu,  5 Dec 2024 22:51:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b="X8c3LChe"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail.andi.de1.cc (mail.andi.de1.cc [178.238.236.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A743719D8B2;
	Thu,  5 Dec 2024 22:51:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.238.236.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733439077; cv=none; b=ps8GxcrmO1ns7wHoCbRJck3i0lfNK/6qvEEWC41BimcT78mtPPg81aFje1N7aPcbs7jIWLiU1yR6LcLbZ2Bg9Z0OCHoEh4HKEDGgsh3dachIzksJ6hs5wOSEI5O94sPhlX9gBh8wxqMox+ikanc9sWiGA5bguW9jU840/YpyNsg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733439077; c=relaxed/simple;
	bh=8ijS+ITobv+GsRKbZX8Z7wGLSJ4uPcgfXMWIQEL5lVU=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Q5RxBod6tfXG3Mo86AjojP88cMMlpdk8NsMYQITgh+mNmm56RhecWDQzdQvplM3+MWEuGCLOKZoBWME1RNA35l7XbvToG5jigexgKM0YP0Hu2N7iRBoXw97NjdaYPVzJDaEHSjQjV7q5AhR2jNyqAFQthCVEIKb/peLRyUwBqMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info; spf=pass smtp.mailfrom=kemnade.info; dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b=X8c3LChe; arc=none smtp.client-ip=178.238.236.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=References:In-Reply-To:Cc:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=LXgCfiKDJI0BTBlEwF4kcyyFHf2VWkOpvnbNBhqvwxQ=; b=X8c3LCheM4dStTinHAGLMMF9ra
	hdAig9828TLDWimJUA3DMIJLJlEYjKgCCj+k6s44jqRDCLcd+u8UO5xliEzye3j293GefmenAfDOc
	ZZHpCL6U7bd9lwzOCoWM2r4qW4c6olkLnnD1rXPoTjChR7HR8F2K4Ke/K9G8jB41PsUWQ3K3b4GZX
	TSWAOC6i1NeG147kb/BZXBWMB2HUt9eUq40VLMs2e19aOYlt282gLpNAChbaQAol+7Adb8NMniKBq
	pPHleXYNH1Djk3Oyv33b3U8+/cljpsOx7jmL47mXPfKOYgEThPeUnuZJs6wufxWuqRw5q0DlS9KWV
	niNiVjiA==;
Date: Thu, 5 Dec 2024 23:50:56 +0100
From: Andreas Kemnade <andreas@kemnade.info>
To: Karol P <karprzy7@gmail.com>
Cc: Roger Quadros <rogerq@kernel.org>, aaro.koskinen@iki.fi,
 khilman@baylibre.com, tony@atomide.com, lee@kernel.org,
 linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org,
 skhan@linuxfoundation.org
Subject: Re: [PATCH] mfd: omap-usb-tll: check clk_prepare return code
Message-ID: <20241205235056.44b6c980@akair>
In-Reply-To: <CAKwoAfrvqUxPat9a+4LjRKYx2LZ=n6Q2H+ir3KYkBBj+Rv_HWQ@mail.gmail.com>
References: <20241113211614.518439-1-karprzy7@gmail.com>
	<486d5734-aa02-4a5e-b2ee-fdbba65179a3@kernel.org>
	<20241119145622.2f1f0342@akair>
	<5d6ccb9f-a8f1-45eb-b54a-cd66e637a2cc@kernel.org>
	<20241126230647.68b20fcf@akair>
	<CAKwoAfrvqUxPat9a+4LjRKYx2LZ=n6Q2H+ir3KYkBBj+Rv_HWQ@mail.gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Am Thu, 5 Dec 2024 22:54:05 +0100
schrieb Karol P <karprzy7@gmail.com>:

> On Tue, 26 Nov 2024 at 23:06, Andreas Kemnade <andreas@kemnade.info> wrote:
> >
> > Am Tue, 19 Nov 2024 16:16:42 +0200
> > schrieb Roger Quadros <rogerq@kernel.org>:
> >  
> > > On 19/11/2024 15:56, Andreas Kemnade wrote:  
> > > > Am Tue, 19 Nov 2024 15:10:23 +0200
> > > > schrieb Roger Quadros <rogerq@kernel.org>:
> > > >  
> > > >> Hi,
> > > >>
> > > >> On 13/11/2024 23:16, Karol Przybylski wrote:  
> > > >>> clk_prepare() is called in usbtll_omap_probe to fill clk array.
> > > >>> Return code is not checked, leaving possible error condition unhandled.
> > > >>>
> > > >>> Added variable to hold return value from clk_prepare() and dev_dbg statement
> > > >>> when it's not successful.
> > > >>>
> > > >>> Found in coverity scan, CID 1594680
> > > >>>
> > > >>> Signed-off-by: Karol Przybylski <karprzy7@gmail.com>
> > > >>> ---
> > > >>>  drivers/mfd/omap-usb-tll.c | 11 +++++++----
> > > >>>  1 file changed, 7 insertions(+), 4 deletions(-)
> > > >>>
> > > >>> diff --git a/drivers/mfd/omap-usb-tll.c b/drivers/mfd/omap-usb-tll.c
> > > >>> index 0f7fdb99c809..2e9319ee1b74 100644
> > > >>> --- a/drivers/mfd/omap-usb-tll.c
> > > >>> +++ b/drivers/mfd/omap-usb-tll.c
> > > >>> @@ -202,7 +202,7 @@ static int usbtll_omap_probe(struct platform_device *pdev)
> > > >>>   struct device                           *dev =  &pdev->dev;
> > > >>>   struct usbtll_omap                      *tll;
> > > >>>   void __iomem                            *base;
> > > >>> - int                                     i, nch, ver;
> > > >>> + int                                     i, nch, ver, err;
> > > >>>
> > > >>>   dev_dbg(dev, "starting TI HSUSB TLL Controller\n");
> > > >>>
> > > >>> @@ -248,10 +248,13 @@ static int usbtll_omap_probe(struct platform_device *pdev)
> > > >>>                                   "usb_tll_hs_usb_ch%d_clk", i);
> > > >>>           tll->ch_clk[i] = clk_get(dev, clkname);
> > > >>>
> > > >>> -         if (IS_ERR(tll->ch_clk[i]))
> > > >>> +         if (IS_ERR(tll->ch_clk[i])) {
> > > >>>                   dev_dbg(dev, "can't get clock : %s\n", clkname);  
> > > >
> > > > if you want dev_err() later, then why not here?  
> > >
> > > Because clk is optional. If it is not there then we should not complain.
> > > But if it is there then it needs to be enabled successfully.
> > >  
> > I guess you mean *prepared*, the clock is enabled later (with error
> > checking). But your reasoning makes sense.
> >  
> > > >  
> > > >>> -         else
> > > >>> -                 clk_prepare(tll->ch_clk[i]);
> > > >>> +         } else {
> > > >>> +                 err = clk_prepare(tll->ch_clk[i]);
> > > >>> +                 if (err)
> > > >>> +                         dev_dbg(dev, "clock prepare error for: %s\n", clkname);  
> > > >>
> > > >> dev_err()?
> > > >>  
> > > > So why do you want a different return handling here? (I doubt there is
> > > > any clock having a real prepare() involved here)
> > > >
> > > > As said in an earlier incarnation of this patch, the real question is
> > > > whether having partial clocks available is a valid operating scenario.
> > > > If yes, then the error should be ignored. If no, then bailing out early
> > > > is a good idea.  
> > >
> > > In the DT binding, clocks is optional. So if it doesn't exist it is not
> > > an error condition.
> > >  
> > > >
> > > > clk_prepare() errors are catched by failing clk_enable() later,
> > > > ch_clk[i] is checked later, too.
> > > >  
> > > >> I think we should return the error in this case.
> > > >> (after unpreparing the prepared clocks and clk_put())
> > > >>  
> > > > and pm_runtime_put_sync(dev)  
> >
> > which can probably be done before dealing with the clocks. It is only
> > needed for the register access.  
> 
> I'm fairly new to this subsystem and I'm trying to understand the
> conclusion. In the end, we should add dev_err() here after
> clk_prepare() with appropriate handling?
> 
we must make sure pm_runtime_put/get are paired and _put is called in
any case. Looking around a bit:
I think a good solution would be along this lines:
https://lore.kernel.org/linux-omap/34ab5f0b78c2869cc43797a72d6a2f40d9b246f3.camel@siemens.com/T/#u

using devm_clk_get_prepared() things can be simplified.

Regards,
Andreas

