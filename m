Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A6C0520FB4C
	for <lists+linux-omap@lfdr.de>; Tue, 30 Jun 2020 20:04:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389578AbgF3SER (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 30 Jun 2020 14:04:17 -0400
Received: from muru.com ([72.249.23.125]:60076 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729105AbgF3SER (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 30 Jun 2020 14:04:17 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id D27D78164;
        Tue, 30 Jun 2020 18:05:06 +0000 (UTC)
Date:   Tue, 30 Jun 2020 11:04:11 -0700
From:   Tony Lindgren <tony@atomide.com>
To:     Pavel Machek <pavel@ucw.cz>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Pavel Machek <pavel@denx.de>,
        Merlijn Wajer <merlijn@wizzup.org>, jikos@suse.cz,
        vojtech@suse.cz,
        Sebastian Reichel <sebastian.reichel@collabora.com>,
        Beno??t Cousson <bcousson@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Borislav Petkov <bp@suse.de>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Mattias Jacobsson <2pi@mok.nu>,
        Mark Gross <mgross@linux.intel.com>,
        Russell King <rmk+kernel@armlinux.org.uk>,
        "open list:OMAP DEVICE TREE SUPPORT" <linux-omap@vger.kernel.org>,
        "open list:OMAP DEVICE TREE SUPPORT" <devicetree@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        "open list:INPUT (KEYBOARD, MOUSE, JOYSTICK, TOUCHSCREEN)..." 
        <linux-input@vger.kernel.org>
Subject: Re: input maintainer -- are you there? was Re: [PATCH 1/2] Input:
 add `SW_MACHINE_COVER`
Message-ID: <20200630180411.GE37466@atomide.com>
References: <20200612125402.18393-1-merlijn@wizzup.org>
 <20200612125402.18393-2-merlijn@wizzup.org>
 <20200616105045.GB1718@bug>
 <fef69c79-9943-7bd1-5c51-101f551cf2c8@wizzup.org>
 <20200629133644.GA22227@amd>
 <20200630052212.GH248110@dtor-ws>
 <20200630175853.GA15783@duo.ucw.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200630175853.GA15783@duo.ucw.cz>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Pavel Machek <pavel@ucw.cz> [200630 17:59]:
> Hi!
> 
> > > > Looks like we're blocking on this input patch.
> > > > 
> > > > On 16/06/2020 12:50, Pavel Machek wrote:
> > > > > On Fri 2020-06-12 14:53:58, Merlijn Wajer wrote:
> > > > >> This event code represents the state of a removable cover of a device.
> > > > >> Value 0 means that the cover is open or removed, value 1 means that the
> > > > >> cover is closed.
> > > > >>
> > > > >> Reviewed-by: Sebastian Reichel <sebastian.reichel@collabora.com> Acked-by: Tony Lindgren 
> > > > >> <tony@atomide.com> Signed-off-by: Merlijn Wajer <merlijn@wizzup.org> ---
> > > > > 
> > > > > Dmitry, can we get some kind of comment here, or better yet can we get you to apply this?
> > > > 
> > > > This is part of a patch series to resolve problems with the Nokia N900
> > > > not booting when the cover is removed (making the cover be the card
> > > > detect was also just weird IMHO). Just removing the card-detect from the
> > > > DTS is fine, but it was suggested that we expose the data instead as
> > > > input event. And that's gotten no response for about four months.
> > > > 
> > > > Should we just drop the feature and only remove the cd-gpios line from
> > > > the DTS, assuming upstream doesn't want this SW_MACHINE_COVER code?
> > > 
> > > I believe series is good, lets keep it. Changing now will only delay
> > > it a bit more. Let me try to get Dmitry's attention...
> > > 
> > > If that does not work, we can get Linus' attention :-).
> > > 
> > > If that does not work, umm, there are some other options.
> > 
> > Sorry, am really swamped the last couple months. I can pick up the input
> > code, do you want me to pick up DTS as well?
> 
> No problem, sorry for being pushy.
> 
> If you could pick up just the input one-liner, that would be best. It
> is not risky.
> 
> OMAP people will take care of the DTS, I believe, and we can iterate
> if it does not work at the first try.

I already acked the dts change a while back, please just queue them
together. Or if you want me to pick it up, please set up an immutable
branch for me against v5.8-rc1 to also merge in :)

Regards,

Tony
