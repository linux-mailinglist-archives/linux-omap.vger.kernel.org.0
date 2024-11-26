Return-Path: <linux-omap+bounces-2734-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E8319D9F15
	for <lists+linux-omap@lfdr.de>; Tue, 26 Nov 2024 23:07:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B7303166087
	for <lists+linux-omap@lfdr.de>; Tue, 26 Nov 2024 22:07:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27ADF1DF736;
	Tue, 26 Nov 2024 22:07:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b="MqxQ3LDq"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail.andi.de1.cc (mail.andi.de1.cc [178.238.236.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 252798831;
	Tue, 26 Nov 2024 22:07:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.238.236.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732658824; cv=none; b=CO28w+icTnyEMgGLPvvo2zbzN4LbFHV598rkpcbdu2Fgkvc63jx1ROex7N3JtDj++4g3YrMd8TiQKdfHzFtnIGlGRNOnXzvQfjA5dwQEjbU7iqga3ecfiyaFSzw0Ci+QTVruZSRc48rEvQf906lt6KzfgHPWYbY7TZ8/v4eCBYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732658824; c=relaxed/simple;
	bh=lOdQY8HxOsG9Q1TOzy4MizCth633tf7W9emmfvN9nSs=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=P+a/kyBOeLNTPPmCi69YNh73CDB2xRgr6iiwRq+2nDBHu78+1IdvDol8eF/vP1Yn9GKxuz+yg8PIqIEJv5Eky7Rgbb83c5aG9y1kzcO6ULbI/uGR2VKdI5TRTAJV6+zklaUo9l4EjAF0Qduk4T7FiQmohzW84Ze9kB/R+7FjWCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info; spf=pass smtp.mailfrom=kemnade.info; dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b=MqxQ3LDq; arc=none smtp.client-ip=178.238.236.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=References:In-Reply-To:Cc:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=QIMHlxhoyMIQp7pfAhf2ueBjuOVyLctWFnSGT0wKPJU=; b=MqxQ3LDq2GSOvuQY09ob0jSbHS
	GzhvofMbs74j341caMw3giO54M0Tu0OQcGRjxhayyp8aC2VVZW69i29uES7269nFOKFZpZYd2CPxl
	GlWsy1WW5lANSqXihbOlOkfWXQMX2nondCLdLKhubPjvmzEj4SXhnNjCFUpTtDJqFV10RY9zKe0zi
	JFktDB2Uuu1/WHxWvElpRm365mrAC7c5veg0MGZMEWIabr0xGn/U1MjvAniEd5IKgbdeVRMFGQO6E
	lJgemf5Va5/1OT0m0PT747lQAJTB6Vs69ZBkF+AVyfXDiUS53i7xvR7iHolGhRNOv24edtWZV0kot
	+EY2bgXA==;
Date: Tue, 26 Nov 2024 23:06:47 +0100
From: Andreas Kemnade <andreas@kemnade.info>
To: Roger Quadros <rogerq@kernel.org>
Cc: Karol Przybylski <karprzy7@gmail.com>, aaro.koskinen@iki.fi,
 khilman@baylibre.com, tony@atomide.com, lee@kernel.org,
 linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org,
 skhan@linuxfoundation.org
Subject: Re: [PATCH] mfd: omap-usb-tll: check clk_prepare return code
Message-ID: <20241126230647.68b20fcf@akair>
In-Reply-To: <5d6ccb9f-a8f1-45eb-b54a-cd66e637a2cc@kernel.org>
References: <20241113211614.518439-1-karprzy7@gmail.com>
	<486d5734-aa02-4a5e-b2ee-fdbba65179a3@kernel.org>
	<20241119145622.2f1f0342@akair>
	<5d6ccb9f-a8f1-45eb-b54a-cd66e637a2cc@kernel.org>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Am Tue, 19 Nov 2024 16:16:42 +0200
schrieb Roger Quadros <rogerq@kernel.org>:

> On 19/11/2024 15:56, Andreas Kemnade wrote:
> > Am Tue, 19 Nov 2024 15:10:23 +0200
> > schrieb Roger Quadros <rogerq@kernel.org>:
> >   
> >> Hi,
> >>
> >> On 13/11/2024 23:16, Karol Przybylski wrote:  
> >>> clk_prepare() is called in usbtll_omap_probe to fill clk array.
> >>> Return code is not checked, leaving possible error condition unhandled.
> >>>
> >>> Added variable to hold return value from clk_prepare() and dev_dbg statement
> >>> when it's not successful.
> >>>
> >>> Found in coverity scan, CID 1594680
> >>>
> >>> Signed-off-by: Karol Przybylski <karprzy7@gmail.com>
> >>> ---
> >>>  drivers/mfd/omap-usb-tll.c | 11 +++++++----
> >>>  1 file changed, 7 insertions(+), 4 deletions(-)
> >>>
> >>> diff --git a/drivers/mfd/omap-usb-tll.c b/drivers/mfd/omap-usb-tll.c
> >>> index 0f7fdb99c809..2e9319ee1b74 100644
> >>> --- a/drivers/mfd/omap-usb-tll.c
> >>> +++ b/drivers/mfd/omap-usb-tll.c
> >>> @@ -202,7 +202,7 @@ static int usbtll_omap_probe(struct platform_device *pdev)
> >>>  	struct device				*dev =  &pdev->dev;
> >>>  	struct usbtll_omap			*tll;
> >>>  	void __iomem				*base;
> >>> -	int					i, nch, ver;
> >>> +	int					i, nch, ver, err;
> >>>  
> >>>  	dev_dbg(dev, "starting TI HSUSB TLL Controller\n");
> >>>  
> >>> @@ -248,10 +248,13 @@ static int usbtll_omap_probe(struct platform_device *pdev)
> >>>  					"usb_tll_hs_usb_ch%d_clk", i);
> >>>  		tll->ch_clk[i] = clk_get(dev, clkname);
> >>>  
> >>> -		if (IS_ERR(tll->ch_clk[i]))
> >>> +		if (IS_ERR(tll->ch_clk[i])) {
> >>>  			dev_dbg(dev, "can't get clock : %s\n", clkname);  
> > 
> > if you want dev_err() later, then why not here?  
> 
> Because clk is optional. If it is not there then we should not complain.
> But if it is there then it needs to be enabled successfully.
> 
I guess you mean *prepared*, the clock is enabled later (with error
checking). But your reasoning makes sense.

> >   
> >>> -		else
> >>> -			clk_prepare(tll->ch_clk[i]);
> >>> +		} else {
> >>> +			err = clk_prepare(tll->ch_clk[i]);
> >>> +			if (err)
> >>> +				dev_dbg(dev, "clock prepare error for: %s\n", clkname);    
> >>
> >> dev_err()?
> >>  
> > So why do you want a different return handling here? (I doubt there is
> > any clock having a real prepare() involved here)
> > 
> > As said in an earlier incarnation of this patch, the real question is
> > whether having partial clocks available is a valid operating scenario.
> > If yes, then the error should be ignored. If no, then bailing out early
> > is a good idea.  
> 
> In the DT binding, clocks is optional. So if it doesn't exist it is not
> an error condition.
> 
> > 
> > clk_prepare() errors are catched by failing clk_enable() later,
> > ch_clk[i] is checked later, too.
> >   
> >> I think we should return the error in this case.
> >> (after unpreparing the prepared clocks and clk_put())
> >>  
> > and pm_runtime_put_sync(dev) 

which can probably be done before dealing with the clocks. It is only
needed for the register access. 

Regards,
Andreas

