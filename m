Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4BD1E3211AA
	for <lists+linux-omap@lfdr.de>; Mon, 22 Feb 2021 08:57:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230306AbhBVH5C (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 22 Feb 2021 02:57:02 -0500
Received: from muru.com ([72.249.23.125]:36212 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230304AbhBVH5B (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 22 Feb 2021 02:57:01 -0500
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 08F3180C3;
        Mon, 22 Feb 2021 07:56:47 +0000 (UTC)
Date:   Mon, 22 Feb 2021 09:56:07 +0200
From:   Tony Lindgren <tony@atomide.com>
To:     Pavel Machek <pavel@ucw.cz>
Cc:     kernel list <linux-kernel@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        linux-omap@vger.kernel.org, sre@kernel.org, nekit1000@gmail.com,
        mpartap@gmx.net, merlijn@wizzup.org, martin_rysavy@centrum.cz,
        phone-devel@vger.kernel.org, maemo-leste@lists.dyne.org,
        Carl Philipp Klemm <philipp@uvos.xyz>
Subject: Re: Droid 4 charging
Message-ID: <YDNjl+4M/hrmsbIj@atomide.com>
References: <20210206131415.GA4499@amd>
 <YCn5+ZPdPojwCz8g@atomide.com>
 <20210219215752.GA31435@amd>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210219215752.GA31435@amd>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Pavel Machek <pavel@ucw.cz> [210219 21:58]:
> > > If I turn off charging with echo 0 > input_current_limit, 0.2 to 0.4A
> > > is drawn from USB, and battery is not discharged:
> > > 
> > > root@devuan-droid4:/sys/class/power_supply/usb# echo 0 >  input_current_limit
> > > root@devuan-droid4:/sys/class/power_supply/usb# cat current_now
> > > 0
> > 
> > Hmm so have you measured that setting the current limit to 0 actually
> > draws something from the USB?
> 
> Yes, it does, if I do the echo when charge is done. (I have small USB
> passthrough with volt and amp meters). It has been behaving weirdly in
> other cases.p

OK great, seems like we can just change the charger timeout then.

> > I recall clearing the ichrgr bits stops the vbus draw completely, but
> > I could be wrong.
> > 
> > > Is that a better way to handle full battery?
> > 
> > We could experiment with switching over to usb power when the battery is
> > full. Looking at the docs for mc1378 it might be possible that setting
> > CPCAP_REG_CRM_FET_OVRD and clearing CPCAP_REG_CRM_FET_CTRL after the
> > battery is full disables charging but still keep drawing power from
> > the usb. I'd assume the current limit still needs to be nonzero there
> > too? Totally untested..
> 
> I may be able to test patches...

Yeah this too might be worth testing on some donor device..

> > And switching back to battery power on usb disconnect will potentially
> > only give us very little time based on the different line length for
> > vbus and ground pins compared to data pins on the usb connector.. And
> > uvos had some concerns about the battery capacity putting it back online,
> > so adding him to Cc also.
>
> You mean, we'd have to take interrupt and switch registers in order to
> switch back to battery power, and system would crash if we did not
> make it in time?

Yes hopefully we don't need to do that. My guess is we should find some
FET_OVRD and FET_CTRL setting we can always keep enabled after charger
negotation. Maybe we already have the right settings based on your tests :)

Regards,

Tony


