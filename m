Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4DEDF2E2561
	for <lists+linux-omap@lfdr.de>; Thu, 24 Dec 2020 09:04:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727621AbgLXID0 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 24 Dec 2020 03:03:26 -0500
Received: from muru.com ([72.249.23.125]:40270 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726159AbgLXID0 (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 24 Dec 2020 03:03:26 -0500
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 779C580C2;
        Thu, 24 Dec 2020 08:02:51 +0000 (UTC)
Date:   Thu, 24 Dec 2020 10:02:39 +0200
From:   Tony Lindgren <tony@atomide.com>
To:     Pavel Machek <pavel@ucw.cz>
Cc:     Johan Hovold <johan@kernel.org>, phone-devel@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Alan Cox <gnomes@lxorguk.ukuu.org.uk>,
        Lee Jones <lee.jones@linaro.org>, Jiri Slaby <jslaby@suse.cz>,
        Merlijn Wajer <merlijn@wizzup.org>,
        Peter Hurley <peter@hurleysoftware.com>,
        Sebastian Reichel <sre@kernel.org>,
        linux-serial@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org
Subject: Re: [PATCHv6 0/4] n_gsm serdev support and protocol driver for
 droid4 modem
Message-ID: <20201224080239.GF26857@atomide.com>
References: <20200421232752.3070-1-tony@atomide.com>
 <20200423114326.GQ18608@localhost>
 <20200423153756.GE37466@atomide.com>
 <20200528082420.GA10358@localhost>
 <20201220224816.GA28213@duo.ucw.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201220224816.GA28213@duo.ucw.cz>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi,

* Pavel Machek <pavel@ucw.cz> [201220 22:48]:
> Hi!
> 
> > Sorry about the late reply on this.
> 
> I'm afraid I'll need some more answers in near future, but for now:
> 
> Tony, do you remember / can you figure out what gsmtty GPS is on? I
> never used it on that interface, and I can't seem to figure it out.
> 
> My notes say:
> 
> /dev/motmdm1 -- basic support, calls, on/off                                    
> /dev/motmdm3 -- send sms interface                                              
> /dev/motmdm9 -- receive sms interface                                           
>
> (and gsmtty numbering is same)

Yes I have not had a chance to look at these for several months now,
but have the latest set in droid4-pending-v5.10 branch in my github
tree.

The gnss device is at /dev/gsmtty6, see the current droid4-agps tool
to upload the almanac also on github. That's has turned out to be a
pretty good gsm serdev test too :)

> For now I converted gnss driver to use serdev interface, and n_gsm to
> provide it... Not yet finished but I believe I'm walking in the right
> direction.

Great, sounds good to me if you got things working with just serdev
calls :) I'll try to take a look at this stuff again after I have
the other pending droid4 issues out of the way like v5.12 charger
and keyboard stuff.

Regards,

Tony
