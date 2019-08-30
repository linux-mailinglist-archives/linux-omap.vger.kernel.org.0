Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D0392A4093
	for <lists+linux-omap@lfdr.de>; Sat, 31 Aug 2019 00:30:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728143AbfH3WaP (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 30 Aug 2019 18:30:15 -0400
Received: from muru.com ([72.249.23.125]:59206 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728138AbfH3WaP (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Fri, 30 Aug 2019 18:30:15 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id C3E6080D4;
        Fri, 30 Aug 2019 22:30:44 +0000 (UTC)
Date:   Fri, 30 Aug 2019 15:30:12 -0700
From:   Tony Lindgren <tony@atomide.com>
To:     Pavel Machek <pavel@ucw.cz>
Cc:     Merlijn Wajer <merlijn@wizzup.org>,
        linux-omap <linux-omap@vger.kernel.org>,
        Sebastian Reichel <sre@kernel.org>, bencoh@notk.org
Subject: Re: Charging voltage for droid4 battery
Message-ID: <20190830223012.GH52127@atomide.com>
References: <4a845327-348f-5e4f-ec76-4c5d1f61c270@wizzup.org>
 <20190818183459.GA29779@amd>
 <20190819114609.GL52127@atomide.com>
 <20190819124422.GI21072@amd>
 <20190821113521.GN52127@atomide.com>
 <20190825092814.GB1644@amd>
 <20190826231259.GY5443@atomide.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190826231259.GY5443@atomide.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Tony Lindgren <tony@atomide.com> [190826 23:13]:
> * Pavel Machek <pavel@ucw.cz> [190825 09:28]:
...

> > > > +++ b/drivers/power/supply/cpcap-charger.c
> > > > @@ -440,7 +440,7 @@ static void cpcap_usb_detect(struct work_struct *work)
> > > >  			max_current = CPCAP_REG_CRM_ICHRG_0A532;
> > > >  
> > > >  		error = cpcap_charger_set_state(ddata,
> > > > -						CPCAP_REG_CRM_VCHRG_4V35,
> > > > +						CPCAP_REG_CRM_VCHRG_4V20,
> > > >  						max_current, 0);
> > > >  		if (error)
> > > >  			goto out_err;
> > > > 
> > > 
> > > So I think you also need to change the battery full to 4.2V too? Sure
> > > if Android charged to 4.35V, we show 15 minutes of over 100%..
> > 
> > Umm. I am not sure I need to change anything else _in the kernel_?
> 
> It's just the battery .info.voltage_max_design that I'm wondering
> about. But then again, that should be battery specific and we don't
> need to care about that for the initial fix.

Well since we don't have anything in place for capacity right now,
no need to worry about the battery configured voltage right now.

So for your one liner fix above:

Acked-by: Tony Lindgren <tony@atomide.com>

Sebastian may want you to resend that with proper description?

Regards,

Tony
