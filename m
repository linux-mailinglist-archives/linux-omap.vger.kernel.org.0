Return-Path: <linux-omap+bounces-2659-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A0D289C4635
	for <lists+linux-omap@lfdr.de>; Mon, 11 Nov 2024 20:57:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6414528273C
	for <lists+linux-omap@lfdr.de>; Mon, 11 Nov 2024 19:57:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AEC631AB6CD;
	Mon, 11 Nov 2024 19:57:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b="wiJCwiNY"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail.andi.de1.cc (mail.andi.de1.cc [178.238.236.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 935A4132103;
	Mon, 11 Nov 2024 19:57:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.238.236.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731355038; cv=none; b=sB1hUj4zFxCiSDp4Nmwgqdyz1e0sUR8fajH+nSpV0KgkWJcQfjw/yCy0N3uLp20/DdsMVwIlTkQ6HY/4KTo1V6tTCa5SpGMdP/qrztiGlV7M2fKF/hzMWdchtW1f06Ca2F4lYKkLtr5T6Xr+9Wwc4whnrm1y/tr9Vs14Tz8wRa0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731355038; c=relaxed/simple;
	bh=wJirKgmJ/fb4yraM+GmtmRES6+6VaVOWDGwoLoNMk2Q=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Q6wNIA5odycDnZgs3HXc4DA5iFAXrqNKl1/xikNt/9zR1ecdy3dt9bhCjrtN9i9NNRJMaW4MMe6jWnVxKcL6DQaAigkdydQDGklBKaiqQMVFD15VNrf2QPWe9nBOwBgPzPB4m3YbwZQ24eGaK0mUd0odJnDJZ1MErRe2lP/0xAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info; spf=pass smtp.mailfrom=kemnade.info; dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b=wiJCwiNY; arc=none smtp.client-ip=178.238.236.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=References:In-Reply-To:Cc:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=y129Aooyw/ghztagVQ8SsBTcstPYEFT7YpGgQUvc4p0=; b=wiJCwiNYQGYJa83vZ9u65ZYbBE
	teyRW/4QSn1TtS+iMcR7Xg/PHy6K2R/w5I0KL3PvBlP15b7PZdW3hQHlR13aezMZ0VkfycatNSmHo
	b+C5sfPHbeMsQ3wcRQnenE3/LeCKGcB+IxBpxt5cfyyFNsoTkmfD+JiuB7Jd6aUWyoNDmIsSO1ja+
	UWpFKPPRSSX9X/a+bpFKlDIuUIxjr4gg9XHPdU/CwVngvTIcy96FS0yvOZxWBm8R0+2r0b5AnnutM
	c4ZYdjFa8iIus4OfUOjJJapuiX3E5dFWyzJNF1OPPrSvIvwvpspzUI0xAz/4I2h2L5luHvXKXDDV5
	x5+fTqeQ==;
Date: Mon, 11 Nov 2024 20:57:08 +0100
From: Andreas Kemnade <andreas@kemnade.info>
To: Roger Quadros <rogerq@kernel.org>
Cc: Karol P <karprzy7@gmail.com>, aaro.koskinen@iki.fi,
 khilman@baylibre.com, tony@atomide.com, lee@kernel.org,
 linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org,
 skhan@linuxfoundation.org
Subject: Re: [PATCH] mfd: omap-usb-tll: handle clk_prepare return code in
 usbtll_omap_probe
Message-ID: <20241111205708.562abb1c@akair>
In-Reply-To: <cd915c18-7230-4c38-a860-d2a777223147@kernel.org>
References: <20241106223324.479341-1-karprzy7@gmail.com>
	<20241107001507.5a304718@akair>
	<CAKwoAfp6iPN0F_kfNbF8xbpX7+Qh+BS55KgmZ5nis0u00vOFhw@mail.gmail.com>
	<20241110002954.1134398a@akair>
	<cd915c18-7230-4c38-a860-d2a777223147@kernel.org>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Am Mon, 11 Nov 2024 16:41:47 +0200
schrieb Roger Quadros <rogerq@kernel.org>:

> Hi,
> 
> On 10/11/2024 01:29, Andreas Kemnade wrote:
> > Am Thu, 7 Nov 2024 12:12:52 +0100
> > schrieb Karol P <karprzy7@gmail.com>:
> >   
> >> On Thu, 7 Nov 2024 at 00:15, Andreas Kemnade <andreas@kemnade.info> wrote:  
> >>>
> >>> Am Wed,  6 Nov 2024 23:33:24 +0100
> >>> schrieb Karol Przybylski <karprzy7@gmail.com>:
> >>>    
> >>>> clk_prepare() is called in usbtll_omap_probe to fill clk array.
> >>>> Return code is not checked, leaving possible error condition unhandled.
> >>>>
> >>>> Added variable to hold return value from clk_prepare() and return statement
> >>>> when it's not successful.
> >>>>
> >>>> Found in coverity scan, CID 1594680
> >>>>
> >>>> Signed-off-by: Karol Przybylski <karprzy7@gmail.com>
> >>>> ---
> >>>>  drivers/mfd/omap-usb-tll.c | 8 ++++++--
> >>>>  1 file changed, 6 insertions(+), 2 deletions(-)
> >>>>
> >>>> diff --git a/drivers/mfd/omap-usb-tll.c b/drivers/mfd/omap-usb-tll.c
> >>>> index 0f7fdb99c809..28446b082c85 100644
> >>>> --- a/drivers/mfd/omap-usb-tll.c
> >>>> +++ b/drivers/mfd/omap-usb-tll.c
> >>>> @@ -202,7 +202,7 @@ static int usbtll_omap_probe(struct platform_device *pdev)
> >>>>       struct device                           *dev =  &pdev->dev;
> >>>>       struct usbtll_omap                      *tll;
> >>>>       void __iomem                            *base;
> >>>> -     int                                     i, nch, ver;
> >>>> +     int                                     i, nch, ver, err;
> >>>>
> >>>>       dev_dbg(dev, "starting TI HSUSB TLL Controller\n");
> >>>>
> >>>> @@ -251,7 +251,11 @@ static int usbtll_omap_probe(struct platform_device *pdev)
> >>>>               if (IS_ERR(tll->ch_clk[i]))
> >>>>                       dev_dbg(dev, "can't get clock : %s\n", clkname);    
> >>>
> >>> if you add more intensive error checking, then why is this error
> >>> ignored and not returned?    
> >>
> >> Thank you for the feedback. It does seem that elevated error checking
> >> is not the way
> >> to go in this case.   
> > 
> > As far as I can see everything checks ch_clk[i] for validity before
> > usage. Also clk_enable() called later is checked which would catch
> > clk_prepare() failures, if there were even possible here.
> > 
> > So the only question which I am not 100% sure about is whether having
> > ch_clk sparsly populated is normal operation. If that is the case, then
> > more error checking is not useful. If not, then it might let us better
> > sleep. As said as far as I can see errors are catched later.
> > 
> > @Roger: what is your opintion towards this?  
> 
> I don't see usb_tll_hs_usb_ch?_clk in any of the OMAP device trees.
> Could it be that they are optional?
> If so then we could convert it to devm_clk_get_optional()?
> 
They live in drivers/clk/ti/clk-[54]4xx.c
But nothing about omap3. So apparently we can have valid use cases
where these clocks are not available. So no real need more anything
more than dev_dbg output here. 

Regards,
Andreas

