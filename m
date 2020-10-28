Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 43F1B29E1FF
	for <lists+linux-omap@lfdr.de>; Thu, 29 Oct 2020 03:05:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726912AbgJ2CFM convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-omap@lfdr.de>); Wed, 28 Oct 2020 22:05:12 -0400
Received: from muru.com ([72.249.23.125]:47072 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727110AbgJ1Viw (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 28 Oct 2020 17:38:52 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 75D8780C0;
        Wed, 28 Oct 2020 08:42:30 +0000 (UTC)
Date:   Wed, 28 Oct 2020 10:42:22 +0200
From:   Tony Lindgren <tony@atomide.com>
To:     Bhushan Shah <bshah@kde.org>
Cc:     Bin Liu <b-liu@ti.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, linux-omap@vger.kernel.org,
        Merlijn Wajer <merlijn@wizzup.org>,
        Pavel Machek <pavel@ucw.cz>,
        Sebastian Reichel <sre@kernel.org>, clayton@craftyguy.net
Subject: Re: [PATCH] usb: musb: fix idling for suspend after disconnect
 interrupt
Message-ID: <20201028084222.GF5639@atomide.com>
References: <20191126034151.38154-1-tony@atomide.com>
 <20201027045519.GA947883@aquila.localdomain>
 <20201027061741.GD5639@atomide.com>
 <20201027075915.GA1064075@aquila.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: 8BIT
In-Reply-To: <20201027075915.GA1064075@aquila.localdomain>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Bhushan Shah <bshah@kde.org> [201027 07:59]:
> Hello!
> 
> On Tue, Oct 27, 2020 at 08:17:41AM +0200, Tony Lindgren wrote:
> > Hmm maybe we're just missing the check for suspend here. Maybe
> > give the following untested patch a try?
> > 
> > I'll give it a try here too but it might be few days.
> 
> Thanks for quick patch! I tested this on my device and I can confirm
> that it fixes issue for me.
> 
> So from my side,
> 
> Tested-by: Bhushan Shah <bshah@kde.org>

OK good to hear :) Will post a proper patch after testing here too.

Regards,

Tony

> > Seems like we might be able to eventually simplify the suspend and
> > quirk check stuff, but let's fix the $subject issue first.
> > 
> > Regards,
> > 
> > Tony
> > 
> > 8< ----------------------
> > diff --git a/drivers/usb/musb/musb_core.c b/drivers/usb/musb/musb_core.c
> > --- a/drivers/usb/musb/musb_core.c
> > +++ b/drivers/usb/musb/musb_core.c
> > @@ -2005,10 +2005,14 @@ static void musb_pm_runtime_check_session(struct musb *musb)
> >  		MUSB_DEVCTL_HR;
> >  	switch (devctl & ~s) {
> >  	case MUSB_QUIRK_B_DISCONNECT_99:
> > -		musb_dbg(musb, "Poll devctl in case of suspend after disconnect\n");
> > -		schedule_delayed_work(&musb->irq_work,
> > -				      msecs_to_jiffies(1000));
> > -		break;
> > +		if (musb->quirk_retries && !musb->flush_irq_work) {
> > +			musb_dbg(musb, "Poll devctl in case of suspend after disconnect\n");
> > +			schedule_delayed_work(&musb->irq_work,
> > +					      msecs_to_jiffies(1000));
> > +			musb->quirk_retries--;
> > +			break;
> > +		}
> > +		/* fall through */
> >  	case MUSB_QUIRK_B_INVALID_VBUS_91:
> >  		if (musb->quirk_retries && !musb->flush_irq_work) {
> >  			musb_dbg(musb,
> 
> -- 
> Bhushan Shah
> http://blog.bshah.in
> IRC Nick : bshah on Freenode
> GPG key fingerprint : 0AAC 775B B643 7A8D 9AF7 A3AC FE07 8411 7FBC E11D


