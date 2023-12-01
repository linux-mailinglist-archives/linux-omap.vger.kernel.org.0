Return-Path: <linux-omap+bounces-83-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id ABF5D80048C
	for <lists+linux-omap@lfdr.de>; Fri,  1 Dec 2023 08:18:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 684D228161B
	for <lists+linux-omap@lfdr.de>; Fri,  1 Dec 2023 07:18:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5419714F69;
	Fri,  1 Dec 2023 07:17:57 +0000 (UTC)
X-Original-To: linux-omap@vger.kernel.org
Received: from mail.andi.de1.cc (mail.andi.de1.cc [IPv6:2a02:c205:3004:2154::1])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 88295171A
	for <linux-omap@vger.kernel.org>; Thu, 30 Nov 2023 23:17:53 -0800 (PST)
Received: from [45.156.240.107] (helo=akair)
	by mail.andi.de1.cc with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <andreas@kemnade.info>)
	id 1r8xmZ-006twK-K6; Fri, 01 Dec 2023 08:17:51 +0100
Date: Fri, 1 Dec 2023 08:17:47 +0100
From: Andreas Kemnade <andreas@kemnade.info>
To: Tony Lindgren <tony@atomide.com>
Cc: linux-omap@vger.kernel.org
Subject: Re: ti-sysc: probe of 4a318000.target-module failed with error -16
Message-ID: <20231201073744.054a1ab7@akair>
In-Reply-To: <20231128100409.GR5169@atomide.com>
References: <20231029101249.2cc84607@akair>
	<20231031070708.GA44202@atomide.com>
	<20231105005323.0238c461@akair>
	<20231128100409.GR5169@atomide.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.37; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Hi Tony,

Am Tue, 28 Nov 2023 12:04:09 +0200
schrieb Tony Lindgren <tony@atomide.com>:

> > hmm, it is about this I think:
> > 
> >        timer1_target: target-module@8000 {     /* 0x4a318000, ap 9
> > 1c.0 */ compatible = "ti,sysc-omap2-timer", "ti,sysc";
> > 
> > but I see no ti,no-reset-on-init or ti,no-idle as checked by
> > sysc_check_active_timer(). It is a bit strange. Well, we have some
> > alwon below. 
> > It sysc-omap2-timer here right instead of sysc-omap4-timer?  
> 
> For timers in the wkup domain yes they are "ti,sysc-omap2-timer",
> that's typically timer1 and possibly timer2. On some devies also
> possibly timer12.
>
ok, then at least omap2 vs. omap4 timer is no problem. I will check what
happens in check_active_timer.
The background of all this is that I am scrutinizing everything
in that area due to my bt200 mainline spl xs. ancient xloader
trouble. I think now with my success in GPS I will have enough mental
power to start it doing something there again.
 
> > > Maybe we should not show the error for timers, or change it to
> > > dev_info if EBUSY and timer?
> > >   
> > Well, I am not sure yet whether I understand that 
> > -ENXIO vs. -EBUSY business there fully.
> > I want to really have a checkmark behind that issue in my head...  
> 
> Seems we should change it to dev_info saying something like "timer
> already in use as a system timer".

Yes, if the cause of -EBUSY is really an active timer.

Regards,
Andreas

