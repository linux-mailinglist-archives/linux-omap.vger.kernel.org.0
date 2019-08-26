Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0F2C19D9CC
	for <lists+linux-omap@lfdr.de>; Tue, 27 Aug 2019 01:13:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726466AbfHZXNE (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 26 Aug 2019 19:13:04 -0400
Received: from muru.com ([72.249.23.125]:58794 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726307AbfHZXND (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 26 Aug 2019 19:13:03 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 21A1880AA;
        Mon, 26 Aug 2019 23:13:32 +0000 (UTC)
Date:   Mon, 26 Aug 2019 16:13:00 -0700
From:   Tony Lindgren <tony@atomide.com>
To:     Pavel Machek <pavel@ucw.cz>
Cc:     Merlijn Wajer <merlijn@wizzup.org>,
        linux-omap <linux-omap@vger.kernel.org>,
        Sebastian Reichel <sre@kernel.org>, bencoh@notk.org
Subject: Re: Charging voltage for droid4 battery
Message-ID: <20190826231259.GY5443@atomide.com>
References: <4a845327-348f-5e4f-ec76-4c5d1f61c270@wizzup.org>
 <20190818183459.GA29779@amd>
 <20190819114609.GL52127@atomide.com>
 <20190819124422.GI21072@amd>
 <20190821113521.GN52127@atomide.com>
 <20190825092814.GB1644@amd>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190825092814.GB1644@amd>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Pavel Machek <pavel@ucw.cz> [190825 09:28]:
> Hi!
> 
> > * Pavel Machek <pavel@ucw.cz> [190819 12:44]:
> > > Hmm. Related changes make it harder, not easier but.. here you
> > > go... But... while this is simple... you are applying it at your own
> > > risk. Untested. One potential problem is that while mainline will charge
> > > to 4.2V, "power off charging" and Adroid will still charge to 4.35V,
> > > leading to charge/discharge cycles even while charging is connected.
> > 
> > I guess not much we can do about Android charging at 4.35V.
> 
> Well, true. 
> 
> > > > Then later on we may want to optionally consider implementing
> > > > support for 4.35V charge voltages assuming we scale down the
> > > > charge voltage to 4.2V after reaching full charge.
> > > 
> > > Not sure how that would work / why we'd want to do that / what do you
> > > consider to be full charge.
> > 
> > Well that would be if we wanted to make use of the extra capacity..
> > 
> > > https://secondlifestorage.com/t-Li-ion-4-35V-How-much-do-we-lose-by-charging-it-at-4-20V
> > > https://batteryuniversity.com/learn/article/confusion_with_voltages
> > 
> > .. but yeah I don't know what we should consider full. I guess it's
> > a 3.8V/4.35V battery vs 3.7V/4.2V battery.. To me it seems safest
> > to set charge voltage to 4.2V and battery full to 4.2V until we
> > we have some better ideas.
> 
> Well, feel free to apply the one-liner. Plus you can have a full patch
> to make current and voltage configurable...

Well for the initial patch, should we still keep battery
.info.voltage_max_design at 4.35V?

Anyways after that I like the idea of making current and voltage
configurable. But it should only be configurable within a range
speciefied by the battery somehow.

> > > +++ b/drivers/power/supply/cpcap-charger.c
> > > @@ -440,7 +440,7 @@ static void cpcap_usb_detect(struct work_struct *work)
> > >  			max_current = CPCAP_REG_CRM_ICHRG_0A532;
> > >  
> > >  		error = cpcap_charger_set_state(ddata,
> > > -						CPCAP_REG_CRM_VCHRG_4V35,
> > > +						CPCAP_REG_CRM_VCHRG_4V20,
> > >  						max_current, 0);
> > >  		if (error)
> > >  			goto out_err;
> > > 
> > 
> > So I think you also need to change the battery full to 4.2V too? Sure
> > if Android charged to 4.35V, we show 15 minutes of over 100%..
> 
> Umm. I am not sure I need to change anything else _in the kernel_?

It's just the battery .info.voltage_max_design that I'm wondering
about. But then again, that should be battery specific and we don't
need to care about that for the initial fix.

Regards,

Tony

