Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 76B0B31B4B3
	for <lists+linux-omap@lfdr.de>; Mon, 15 Feb 2021 05:36:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229940AbhBOEf6 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sun, 14 Feb 2021 23:35:58 -0500
Received: from muru.com ([72.249.23.125]:33412 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229931AbhBOEfz (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Sun, 14 Feb 2021 23:35:55 -0500
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 6508A80C7;
        Mon, 15 Feb 2021 04:35:34 +0000 (UTC)
Date:   Mon, 15 Feb 2021 06:35:05 +0200
From:   Tony Lindgren <tony@atomide.com>
To:     Pavel Machek <pavel@ucw.cz>
Cc:     kernel list <linux-kernel@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        linux-omap@vger.kernel.org, sre@kernel.org, nekit1000@gmail.com,
        mpartap@gmx.net, merlijn@wizzup.org, martin_rysavy@centrum.cz,
        phone-devel@vger.kernel.org, maemo-leste@lists.dyne.org,
        Carl Philipp Klemm <philipp@uvos.xyz>
Subject: Re: Droid 4 charging
Message-ID: <YCn5+ZPdPojwCz8g@atomide.com>
References: <20210206131415.GA4499@amd>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210206131415.GA4499@amd>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi,

* Pavel Machek <pavel@ucw.cz> [210206 13:14]:
> Hi!
> 
> (I'm using Leste 5.10 kernel here).
> 
> When battery is full, green light is off and 0.00A being drawn from
> USB.
> 
> But that means that phone is now powered from battery, discharging
> it... And soon charging starts again. (Pretty much immediately, for me)
> 
> That's bad ... right? It wears the battery out.

Well maintenance charging at 4.2V sure is better for the battery than
what android is doing charging it at 4.31V contantly..

> If I turn off charging with echo 0 > input_current_limit, 0.2 to 0.4A
> is drawn from USB, and battery is not discharged:
> 
> root@devuan-droid4:/sys/class/power_supply/usb# echo 0 >  input_current_limit
> root@devuan-droid4:/sys/class/power_supply/usb# cat current_now
> 0

Hmm so have you measured that setting the current limit to 0 actually
draws something from the USB?

I recall clearing the ichrgr bits stops the vbus draw completely, but
I could be wrong.

> Is that a better way to handle full battery?

We could experiment with switching over to usb power when the battery is
full. Looking at the docs for mc1378 it might be possible that setting
CPCAP_REG_CRM_FET_OVRD and clearing CPCAP_REG_CRM_FET_CTRL after the
battery is full disables charging but still keep drawing power from
the usb. I'd assume the current limit still needs to be nonzero there
too? Totally untested..

And switching back to battery power on usb disconnect will potentially
only give us very little time based on the different line length for
vbus and ground pins compared to data pins on the usb connector.. And
uvos had some concerns about the battery capacity putting it back online,
so adding him to Cc also.

Maybe just clearing ichrgr does all this already though and is enough.
It should be measured on the vbus line.

And then we still need to restart the charger at some point, but that
could happen based on much longer timeouts that what we currently have.

Regards,

Tony
