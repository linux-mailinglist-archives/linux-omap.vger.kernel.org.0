Return-Path: <linux-omap+bounces-49-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A67997FB6A1
	for <lists+linux-omap@lfdr.de>; Tue, 28 Nov 2023 11:04:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DBB6EB21284
	for <lists+linux-omap@lfdr.de>; Tue, 28 Nov 2023 10:04:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C79264C3DC;
	Tue, 28 Nov 2023 10:04:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=atomide.com header.i=@atomide.com header.b="NQWZqh1u"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail5.25mail.st (mail5.25mail.st [74.50.62.9])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 431A5BF
	for <linux-omap@vger.kernel.org>; Tue, 28 Nov 2023 02:04:16 -0800 (PST)
Received: from localhost (91-158-86-216.elisa-laajakaista.fi [91.158.86.216])
	by mail5.25mail.st (Postfix) with ESMTPSA id 4D81560872;
	Tue, 28 Nov 2023 10:04:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=atomide.com;
	s=25mailst; t=1701165855;
	bh=HeyH3p6BoYa6/6vT3QzXr4Vq4qotM/Io0Sa4zRMxT3E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NQWZqh1ufIkaOgy/U+/ukIGNqUGXffQQiy3wqSadJHfvdDQzVJSvQPruh2e3xLn1O
	 dyTaEqQFo11dnjgYxPq1iKcB9oz0szThZKKShrhuRSxBAes2JJbTKuvieCKCuNt0yY
	 HGZVuaRMR0pfhMjmFs7sS6HGDtp/8CcCnGU0QHrSrQZRoY66B1caQ/NX6qnIpfj5gH
	 U/j4ZhHmKzj9tLklMJOyu0elHIPw73pleZj7tZ/H+jbAu8VSWG+vKlgE+tKyT/04F/
	 C9mK+XC/Y1+yXo3rUDjwMOKG4I04Pk6vRjgoLtwzqV6A86Tz7B2I0ERup2ZNSzhbmr
	 ZiK9vAFT21oDg==
Date: Tue, 28 Nov 2023 12:04:09 +0200
From: Tony Lindgren <tony@atomide.com>
To: Andreas Kemnade <andreas@kemnade.info>
Cc: linux-omap@vger.kernel.org
Subject: Re: ti-sysc: probe of 4a318000.target-module failed with error -16
Message-ID: <20231128100409.GR5169@atomide.com>
References: <20231029101249.2cc84607@akair>
 <20231031070708.GA44202@atomide.com>
 <20231105005323.0238c461@akair>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231105005323.0238c461@akair>

* Andreas Kemnade <andreas@kemnade.info> [231104 23:53]:
> Am Tue, 31 Oct 2023 09:07:08 +0200
> schrieb Tony Lindgren <tony@atomide.com>:
> 
> > * Andreas Kemnade <andreas@kemnade.info> [231029 09:13]:
> > > I am seeing the error message from $subject on omap4 devices
> > > regularly, on omap4430-panda and on the epson bt200 (omap4460).
> > > While not having the timer seems not critical in itself. I am
> > > wondering whether something nasty is behind it which might cause
> > > more severe problems.
> > > Is this really seen everywhere?  
> > 
> > That should be for gptimer1 that is used as a clocksource by the
> > drivers/clocksource/timer-ti-dm-systimer.c driver, and ti-sysc will
> > ignore it.
> > 
> hmm, it is about this I think:
> 
>        timer1_target: target-module@8000 {     /* 0x4a318000, ap 9 1c.0
>        */ compatible = "ti,sysc-omap2-timer", "ti,sysc";
> 
> but I see no ti,no-reset-on-init or ti,no-idle as checked by
> sysc_check_active_timer(). It is a bit strange. Well, we have some
> alwon below. 
> It sysc-omap2-timer here right instead of sysc-omap4-timer?

For timers in the wkup domain yes they are "ti,sysc-omap2-timer",
that's typically timer1 and possibly timer2. On some devies also
possibly timer12.

> > Maybe we should not show the error for timers, or change it to
> > dev_info if EBUSY and timer?
> > 
> Well, I am not sure yet whether I understand that 
> -ENXIO vs. -EBUSY business there fully.
> I want to really have a checkmark behind that issue in my head...

Seems we should change it to dev_info saying something like "timer
already in use as a system timer".

Regards,

Tony

