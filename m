Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EB0C51B5F7D
	for <lists+linux-omap@lfdr.de>; Thu, 23 Apr 2020 17:38:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729206AbgDWPiC (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 23 Apr 2020 11:38:02 -0400
Received: from muru.com ([72.249.23.125]:51076 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729201AbgDWPiC (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 23 Apr 2020 11:38:02 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id A080A8022;
        Thu, 23 Apr 2020 15:38:47 +0000 (UTC)
Date:   Thu, 23 Apr 2020 08:37:56 -0700
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
Message-ID: <20200423153756.GE37466@atomide.com>
References: <20200421232752.3070-1-tony@atomide.com>
 <20200423114326.GQ18608@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200423114326.GQ18608@localhost>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Johan Hovold <johan@kernel.org> [200423 11:44]:
> Hi Tony,
> 
> On Tue, Apr 21, 2020 at 04:27:48PM -0700, Tony Lindgren wrote:
> > Hi all,
> > 
> > Here's v4 set of n_gsm serdev support patches, and the related protocol
> > driver for the modem found on Motorola Mapphone phones and tablets
> > like droid4.
> > 
> > This series only adds basic character device support for the serdev
> > driver. Other serdev consumer drivers for specific devices will be
> > posted separately.
> 
> I'm still missing an architectural (design) overview here -- reviewer
> time is a scarce resource.

OK, so for this series it would be roughly:

1. Allow serdev drivers configure and use n_gsm for TS 27.010

2. Add support for a motorola modem with a custom protocol on
   top of TS 27.010 with only chardev support initially

3. Start adding TS 27.010 channel specific device drivers as
   regular Linux device drivers later on

> I also suggested earlier that you include, at least as an RFC, one or
> more of your child-device drivers so that we can see how this ends up
> being used in the end (including an example devicetree).

Well I left that out intentionally to keep the series smaller. But yeah,
I guess that part is really what people want. I'll add a basic GNSS
driver for the next version.

> Some high-level comments until then:
> 
> I'm not sure that a plain chardev interface for the mux channels is the
> right interface. The n_gsm ldisc exposes tty devices and I think your
> serdev adaptation should continue to do that.

That's what I started with, but was not happy at all because of the
custom motorola protocol layer on top of TS 27.010.

A generic n_gsm serdev driver should work easily though. Roughly, the
n_gsm serdev driver(s) wanting to use just the n_gsm tty devices would
just call the n_gsm config functions only, and configure no custom
callbacks. Maybe some flag is needed for n_gsm tty. This needs to
be checked again though as I have not done that for a while.

Then for the custom n_gsm serdev implementations, like this modem,
we have packet data from n_gsm. I don't think stuffing the packet data
back into tty devices helps for these cases.

> On that note; you're not actually adding general TS 27.010 serdev
> support, but rather some hooks and a custom driver and interface (mfd +
> /dev/motmdmN) for one particular modem.

A generic n_gsm serdev driver would just use a subset of these same
functions.

> I'd rather see a generic implementation which can be used with other
> modems and that continues to expose a /dev/gsmttyN interface to which we
> could attach serdev clients instead (and not create a motmdm serdev
> replica of sorts).

Yeah this should be doable quite easily actually without really any of
the motorola driver code. It's a separate driver though, and not
usable for this case because of the custom layer.

> I know the location of this driver has been up for discussion already,
> but drivers/tty/serdev/protocol still isn't right (e.g. we don't have an
> drivers/i2c/protocol directory where we stuff random i2c client
> drivers).

Argh, the location of driver again.. So we do have the custom motorola
layer to deal with on top of TS 27.010, but the custom handling is
contained within the driver. So maybe just drivers/serial for the
custom driver then.

> It's an mfd + custom chardev driver for a modem and related to n_gsm
> (even more if you add generic serdev support). Currently, drivers/mfd or
> drivers/misc appear to be better choices. Otherwise, n_gsm lives in
> drivers/tty since it's a line discipline, but it could be moved to a new
> drivers/modem if needed (cf. the bluetooth hci ldisc).

The n_gsm suport is not limited to modems only. Probably best to
not move it. And I'd avoid drivers/modem until we actually have three
similar use cases based on the late David "Mr.Bus" Brownell rule of
thumb :)

> Last, it seems you've based the serdev-ngsm-motmdm.c chardev
> implementation on a more or less verbatim copy of drivers/gnss/core.c.
> I'd appreciate if you could mention that in the file header and
> reproduce the copyright notice if you end up keeping that interface.

Oh yes indeed, thanks for pointing that out. I'll add it to the next
version. The chardev code is for sure based on drivers/gnss.

To explain my ignorance, I added the chardev support initially as an
experiment to see if I can handle the motorola packet layer better
that way compared to the n_gsm ttys and userspace handling. It ended
up working quite nicely, so I kept it but then I accidentally left
out references to the source. Sorry about that.

Regards,

Tony
