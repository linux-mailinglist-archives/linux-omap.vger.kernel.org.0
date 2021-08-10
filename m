Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4DC273E5A72
	for <lists+linux-omap@lfdr.de>; Tue, 10 Aug 2021 14:52:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240939AbhHJMwm convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-omap@lfdr.de>); Tue, 10 Aug 2021 08:52:42 -0400
Received: from muru.com ([72.249.23.125]:40850 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S240885AbhHJMwk (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 10 Aug 2021 08:52:40 -0400
Received: from localhost (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id DD17080CF;
        Tue, 10 Aug 2021 12:52:37 +0000 (UTC)
Date:   Tue, 10 Aug 2021 15:52:15 +0300
From:   Tony Lindgren <tony@atomide.com>
To:     Pavel Machek <pavel@denx.de>
Cc:     sashal@kernel.org, linux-omap@vger.kernel.org,
        Dave Gerlach <d-gerlach@ti.com>,
        Faiz Abbas <faiz_abbas@ti.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        Keerthy <j-keerthy@ti.com>, Nishanth Menon <nm@ti.com>,
        Suman Anna <s-anna@ti.com>, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Jarkko Nikula <jarkko.nikula@bitmer.com>
Subject: Re: [PATCH] bus: ti-sysc: Fix gpt12 system timer issue with reserved
 status
Message-ID: <YRJ2fyS6z1i/2W2e@atomide.com>
References: <20210611060224.36769-1-tony@atomide.com>
 <20210810124006.GA25121@amd>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: 8BIT
In-Reply-To: <20210810124006.GA25121@amd>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Pavel Machek <pavel@denx.de> [210810 12:40]:
> Hi!
> 
> I noticed the issue while reviewing stable kernels, as this is being
> backported.
> 
> > Jarkko Nikula <jarkko.nikula@bitmer.com> reported that Beagleboard
> > revision c2 stopped booting. Jarkko bisected the issue down to
> > commit 6cfcd5563b4f ("clocksource/drivers/timer-ti-dm: Fix suspend
> > and resume for am3 and am4").
> > 
> > Let's fix the issue by tagging system timers as reserved rather than
> > ignoring them. And let's not probe any interconnect target module child
> > devices for reserved modules.
> 
> +++ b/drivers/bus/ti-sysc.c
> > @@ -3093,8 +3095,8 @@ static int sysc_probe(struct platform_device *pdev)
> >  		return error;
> >  
> >  	error = sysc_check_active_timer(ddata);
> > -	if (error)
> > -		return error;
> > +	if (error == -EBUSY)
> > +		ddata->reserved = true;
> >  
> >  	error = sysc_get_clocks(ddata);
> >  	if (error)
> 
> What is going on here? First, we silently ignore errors other than
> EBUSY. Second, sysc_check_active_timer() can't return -EBUSY: it
> returns either 0 or -ENXIO. (I checked 5.10-stable, mainline and
> -next-20210806).

Thanks for spotting it, looks like there's now a conflict with commit
65fb73676112 ("bus: ti-sysc: suppress err msg for timers used as
clockevent/source"). It seems we should also check for -ENXIO here
too. And yeah it makes sens to return on other errors for sure.

Regards,

Tony
