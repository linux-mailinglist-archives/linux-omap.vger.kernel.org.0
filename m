Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4EF3A1B87D9
	for <lists+linux-omap@lfdr.de>; Sat, 25 Apr 2020 18:58:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726174AbgDYQ62 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sat, 25 Apr 2020 12:58:28 -0400
Received: from muru.com ([72.249.23.125]:51424 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726155AbgDYQ62 (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Sat, 25 Apr 2020 12:58:28 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 7877F8108;
        Sat, 25 Apr 2020 16:59:14 +0000 (UTC)
Date:   Sat, 25 Apr 2020 09:58:23 -0700
From:   Tony Lindgren <tony@atomide.com>
To:     Johan Hovold <johan@kernel.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Alan Cox <gnomes@lxorguk.ukuu.org.uk>,
        Lee Jones <lee.jones@linaro.org>, Jiri Slaby <jslaby@suse.cz>,
        Merlijn Wajer <merlijn@wizzup.org>,
        Pavel Machek <pavel@ucw.cz>,
        Peter Hurley <peter@hurleysoftware.com>,
        Sebastian Reichel <sre@kernel.org>,
        linux-serial@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org
Subject: Re: [PATCHv6 0/4] n_gsm serdev support and protocol driver for
 droid4 modem
Message-ID: <20200425165823.GO37466@atomide.com>
References: <20200421232752.3070-1-tony@atomide.com>
 <20200423114326.GQ18608@localhost>
 <20200423153756.GE37466@atomide.com>
 <20200423232722.GG37466@atomide.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200423232722.GG37466@atomide.com>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Tony Lindgren <tony@atomide.com> [200423 23:28]:
> * Tony Lindgren <tony@atomide.com> [200423 15:38]:
> > * Johan Hovold <johan@kernel.org> [200423 11:44]:
> > > I'd rather see a generic implementation which can be used with other
> > > modems and that continues to expose a /dev/gsmttyN interface to which we
> > > could attach serdev clients instead (and not create a motmdm serdev
> > > replica of sorts).
> > 
> > Yeah this should be doable quite easily actually without really any of
> > the motorola driver code. It's a separate driver though, and not
> > usable for this case because of the custom layer.
> 
> Well here's a first take at the such a generic serdev-ngsm driver
> that depends on patch 1/4 of this series. All this does is configure
> a serial port for TS 27.010 adaption1, and brings up 16 /dev/gsmtty*
> devices. So no custom options for the binding so far, and no support
> for adding channel specific device drivers. But all that can be added
> naturally later on.

Just to clarify the difference between the generic serdev-ngsm case
and this modem..

In the generic case, channel specific Linux device drivers can just
use gsm_serdev_write() directly for things like GNSS driver, SIM
file system, audio and whatever the modems might have on separate
channels.

This Motorola modem needs custom read and write functions because
of the custom Motorola packet format on top of TS 27.010. So for
example, the motmdm_write() function stuffs the packet header, and
then just calls gsm_serdev_write().

So for the generic channel specific drivers, the driver just needs
to be able to do something like:

Configure devicetree for the drivers/tty/serdev/serdev-ngsm.c
to bring up the TS 27.010 port based on the compatible and
whatever port specific properties we may want use.

And then have the channel specific device drivers do something
like this:

gsm_serdev_ngsm_register();	/* TBD to add to serdev-ngsm.c */
gsm_serdev_register_dlci();	/* Already patched for n_gsm.c */
gsm_serdev_write();		/* Already patched for n_gsm.c */
...
gsm_serdev_unregister_dlci();	/* Already patched for n_gsm.c */
gsm_serdev_ngsm_unregister();	/* TBD to add to serdev-ngsm.c */

So I think we can limit the code in the generic serdev-ngsm.c to bring
up the TS 27.010, and then allow whatever channel specific device
drivers to register with it. I guess that should do for the generic
API.

Anybody got better suggestions?

Regards,

Tony
