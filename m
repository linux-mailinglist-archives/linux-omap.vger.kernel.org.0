Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 25EEDA4ADD
	for <lists+linux-omap@lfdr.de>; Sun,  1 Sep 2019 19:26:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729092AbfIARZ4 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sun, 1 Sep 2019 13:25:56 -0400
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:39709 "EHLO
        atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728570AbfIARZ4 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sun, 1 Sep 2019 13:25:56 -0400
Received: by atrey.karlin.mff.cuni.cz (Postfix, from userid 512)
        id EA403817CB; Sun,  1 Sep 2019 19:25:40 +0200 (CEST)
Date:   Sun, 1 Sep 2019 19:25:53 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Tony Lindgren <tony@atomide.com>
Cc:     Merlijn Wajer <merlijn@wizzup.org>,
        linux-omap <linux-omap@vger.kernel.org>,
        Sebastian Reichel <sre@kernel.org>, bencoh@notk.org
Subject: Re: Charging voltage for droid4 battery
Message-ID: <20190901172553.GE1047@bug>
References: <4a845327-348f-5e4f-ec76-4c5d1f61c270@wizzup.org>
 <20190818183459.GA29779@amd>
 <20190819114609.GL52127@atomide.com>
 <20190819124422.GI21072@amd>
 <20190821113521.GN52127@atomide.com>
 <20190825092814.GB1644@amd>
 <20190826231259.GY5443@atomide.com>
 <20190830223012.GH52127@atomide.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190830223012.GH52127@atomide.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi!

> > > > > +++ b/drivers/power/supply/cpcap-charger.c
> > > > > @@ -440,7 +440,7 @@ static void cpcap_usb_detect(struct work_struct *work)
> > > > >  			max_current = CPCAP_REG_CRM_ICHRG_0A532;
> > > > >  
> > > > >  		error = cpcap_charger_set_state(ddata,
> > > > > -						CPCAP_REG_CRM_VCHRG_4V35,
> > > > > +						CPCAP_REG_CRM_VCHRG_4V20,
> > > > >  						max_current, 0);
> > > > >  		if (error)
> > > > >  			goto out_err;
> > > > > 
> > > > 
> > > > So I think you also need to change the battery full to 4.2V too? Sure
> > > > if Android charged to 4.35V, we show 15 minutes of over 100%..
> > > 
> > > Umm. I am not sure I need to change anything else _in the kernel_?
> > 
> > It's just the battery .info.voltage_max_design that I'm wondering
> > about. But then again, that should be battery specific and we don't
> > need to care about that for the initial fix.
> 
> Well since we don't have anything in place for capacity right now,
> no need to worry about the battery configured voltage right now.
> 
> So for your one liner fix above:
> 
> Acked-by: Tony Lindgren <tony@atomide.com>
> 
> Sebastian may want you to resend that with proper description?

I can do that, I guess... but I'm still not 100% sure it is good idea.

You can take responsibility and submit a patch :-).

Or I can submit the full patch, make it configurable, and shift
reponsibility to the user.

Best regards,
									Pavel
-- 
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blog.html
