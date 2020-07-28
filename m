Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 69DD3230586
	for <lists+linux-omap@lfdr.de>; Tue, 28 Jul 2020 10:36:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728222AbgG1IgY (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 28 Jul 2020 04:36:24 -0400
Received: from muru.com ([72.249.23.125]:38292 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728009AbgG1IgY (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 28 Jul 2020 04:36:24 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 61D5B8105;
        Tue, 28 Jul 2020 08:36:20 +0000 (UTC)
Date:   Tue, 28 Jul 2020 01:36:31 -0700
From:   Tony Lindgren <tony@atomide.com>
To:     Pavel Machek <pavel@denx.de>
Cc:     Johan Hovold <johan@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Alan Cox <gnomes@lxorguk.ukuu.org.uk>,
        Lee Jones <lee.jones@linaro.org>, Jiri Slaby <jslaby@suse.cz>,
        Merlijn Wajer <merlijn@wizzup.org>,
        Peter Hurley <peter@hurleysoftware.com>,
        Sebastian Reichel <sre@kernel.org>,
        linux-serial@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org
Subject: Re: [PATCHv8 0/6] n_gsm serdev support and GNSS driver for droid4
Message-ID: <20200728083631.GE2811@atomide.com>
References: <20200512214713.40501-1-tony@atomide.com>
 <20200528083918.GB10358@localhost>
 <20200726082520.GA16953@amd>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200726082520.GA16953@amd>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Pavel Machek <pavel@denx.de> [200726 08:25]:
> Hi!
> 
> > > Here's the updated set of these patches fixed up for Johan's and
> > > Pavel's earlier comments.
> > > 
> > > This series does the following:
> > > 
> > > 1. Adds functions to n_gsm.c for serdev-ngsm.c driver to use
> > > 
> > > 2. Adds a generic serdev-ngsm.c driver that brings up the TS 27.010
> > >    TTY ports configured in devicetree with help of n_gsm.c
> > > 
> > > 3. Allows the use of standard Linux device drivers for dedicated
> > >    TS 27.010 channels for devices like GNSS and ALSA found on some
> > >    modems for example
> > 
> > Unfortunately that does not seem to be the case just yet. Your gnss
> > driver is still aware that it's using n_gsm for the transport and calls
> > into the "parent" serdev-ngsm driver instead of using the serdev
> > interface (e.g. as if this was still and MFD driver).
> > 
> > If you model this right, the GNSS driver should work equally well
> > regardless of whether you use the serial interface (with n_gsm) or USB
> > (e.g. cdc-acm or usb-serial).
> 
> We are not going to see that protocol anywhere else, so why is that
> a good goal?

Yes it seems this GNSS implementation is different from the one
provided by gobi.

> Anyway, Tony, is there newer version of this patchset? It would be
> good to get something in...

Sorry it will likely be few more weeks before I can look at this
stuff again.

> Can I help somehow?

I think I'm pretty clear on what needs to be done regarding this
patchset. Probably taking a look at if we could implement a
minimal raw /dev/gsmtty* read/write access in ofono using ell
instead of gatchat would help most :)

So something that mbim modem is already doing I think, sorry have
not had a chance to look at that either.

The /dev/gsmtty* devices should not change even with the further
changes to this patchset.

Regards,

Tony
