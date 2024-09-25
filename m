Return-Path: <linux-omap+bounces-2245-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DC55C985515
	for <lists+linux-omap@lfdr.de>; Wed, 25 Sep 2024 10:06:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9E8E928129C
	for <lists+linux-omap@lfdr.de>; Wed, 25 Sep 2024 08:06:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1498158D9C;
	Wed, 25 Sep 2024 08:06:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b="LO206aC1"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail.andi.de1.cc (mail.andi.de1.cc [178.238.236.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F60B158A26;
	Wed, 25 Sep 2024 08:06:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.238.236.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727251578; cv=none; b=VoMdBLavECE53/hIMU322PHkTY65nTcy8a9/nVeOC7j1nBp82INJ12rV4YerTx9YE4hVkw/gMB+o6LyWSaPIGIn0rwFDnr/ZKw25MzYnRurAgM9oRLtRr+ek0VvOV2Sa9aOxaa3CGEu35iuJhnPzoVD3deZbY8xvuqiVDsgmG7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727251578; c=relaxed/simple;
	bh=pfI77LU2eox0cmMD3zp6as+u8VALvLVt/tg8dlAL3wc=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NmssRioSa6YB2q3zXXexdpQIAZpp5xTck2NqhM1QOyAXgwuVa9yD3PV4feCUk6Xp7t3Wf40i/zhB1rZEmj+BupIP7Sy4gnD2uw7nGyqBsrt3luD8E2au0Vk/T4C/p1qKfEWo+1s/H7doXRUDNa/8LjWv/CnkzFM3P0ilyXjh3+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info; spf=pass smtp.mailfrom=kemnade.info; dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b=LO206aC1; arc=none smtp.client-ip=178.238.236.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=References:In-Reply-To:Cc:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=e4Rgcmwcz3lr2vNozPSESKQBhKfA4rwgyNTTb9qHIOI=; b=LO206aC1tm4HrUsK7OK/hojjkW
	828fCZ6snVF6zFlYE8Iajge3YD6PCPlqn5Ihp5GsRMCJtjS5Z2sXTcfftB6DwP+ZpQ9ya54wS1i59
	u23bBXH4Ew1fNottWlTBSFR9xbFPljEmVDz+zLvZ+OirbRqRhE/4IKsBKKc9tnfewV7G5b7tARU5Y
	iIA81DutqPKTArvr7q8LMpZpE6TaJJOzonqsSTEyczomHdIHsFaDZPw1QCe2aKnHmBuWdxtaTy+cq
	d7S7fxPHbsUSRMWw0YSDohyrXEQMrcviJviWkR7cg2gx7MFHx8Nrz99ElpxxYZsjUK7TLjVho95dT
	llODI5rA==;
Date: Wed, 25 Sep 2024 10:06:03 +0200
From: Andreas Kemnade <andreas@kemnade.info>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, linux-omap@vger.kernel.org,
 linux-clk@vger.kernel.org, Paul Walmsley <paul@pwsan.com>, Tony Lindgren
 <tony@atomide.com>
Subject: Re: clk mess on omap4460 with mpu clock
Message-ID: <20240925100603.4cba9176@akair>
In-Reply-To: <ZvLufU15ZJ4CKuuv@shell.armlinux.org.uk>
References: <20240603234139.280629b2@aktux>
	<CAMuHMdWU74DsWEZtZQJctQQog=9UCG_1LZu5yWvyxx0Zw4LQow@mail.gmail.com>
	<20240903143357.2532258b@akair>
	<CAMuHMdWF4G5Uon1=6TMzBogN2CX8EuiVBMuCPtAAMPNa-DtiOw@mail.gmail.com>
	<20240903192203.1dddbf0d@akair>
	<ZtdQ+Ay9DKAooahN@shell.armlinux.org.uk>
	<20240923140447.60c5efff@akair>
	<ZvLufU15ZJ4CKuuv@shell.armlinux.org.uk>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Am Tue, 24 Sep 2024 17:53:17 +0100
schrieb "Russell King (Oracle)" <linux@armlinux.org.uk>:

> On Mon, Sep 23, 2024 at 02:04:47PM +0200, Andreas Kemnade wrote:
> > So the way forward is to check whether that registration is really
> > needed at:
> > https://elixir.bootlin.com/linux/v6.11/source/drivers/bus/ti-sysc.c#L2380
> > If yes, then
> > a) increade the size of the name in the clk subsystem or
> > b) workaround like
> > https://elixir.bootlin.com/linux/v6.11/source/drivers/bus/ti-sysc.c#L353
> >  
> 
> I'll also mention that if one is using DT, then the clkdev tables
> should not be relevant - the lookups of clocks should be done by
> parsing the clocks property in the description of the device.
> 
I played around to ensure I know really what I am doing and what I am
messing around with:
we have in i2c-omap.c:
      
fclk = clk_get(omap->dev, "fck");
just for getting the module clock rate to configure i2c accordingly
That only works if
https://elixir.bootlin.com/linux/v6.11/source/drivers/bus/ti-sysc.c#L2380

is working. Here some clk_get(omap->dev->parent, ...) would also just
work without said line in ti-sysc.c because then dt lookup kicks in.

In the omap3 case, there are several devices using the older hwmod
mechanism and are not converted to ti-sysc yet. Then the clock gets
registered here:
https://elixir.bootlin.com/linux/v6.11/source/arch/arm/mach-omap2/omap_device.c#L116

In the case, a clk_get(omap->dev->parent, ...) in e.g. i2c-omap.c would
fail. No dt lookup can kick in.

The background of this is to ensure to keep soc-specific pm out of the
drivers and do it in a common place.

Regards,
Andreas

