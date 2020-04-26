Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3D8EB1B94A3
	for <lists+linux-omap@lfdr.de>; Mon, 27 Apr 2020 01:25:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726316AbgDZXZ0 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sun, 26 Apr 2020 19:25:26 -0400
Received: from muru.com ([72.249.23.125]:51484 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726202AbgDZXZ0 (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Sun, 26 Apr 2020 19:25:26 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id CD61C8107;
        Sun, 26 Apr 2020 23:26:11 +0000 (UTC)
Date:   Sun, 26 Apr 2020 16:25:20 -0700
From:   Tony Lindgren <tony@atomide.com>
To:     Pavel Machek <pavel@ucw.cz>
Cc:     Pavel Machek <pavel@denx.de>, Johan Hovold <johan@kernel.org>,
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
Message-ID: <20200426232520.GP37466@atomide.com>
References: <20200421232752.3070-1-tony@atomide.com>
 <20200423114326.GQ18608@localhost>
 <20200424215040.GA14087@amd>
 <20200424221515.GM37466@atomide.com>
 <20200426200718.GA22980@amd>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200426200718.GA22980@amd>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Pavel Machek <pavel@ucw.cz> [200426 20:08]:
> Hi!
> 
> > > > > Here's v4 set of n_gsm serdev support patches, and the related protocol
> > > > > driver for the modem found on Motorola Mapphone phones and tablets
> > > > > like droid4.
> > > > > 
> > > > > This series only adds basic character device support for the serdev
> > > > > driver. Other serdev consumer drivers for specific devices will be
> > > > > posted separately.
> > > > 
> > > > I'm still missing an architectural (design) overview here -- reviewer
> > > > time is a scarce resource.
> > > > 
> > > > I also suggested earlier that you include, at least as an RFC, one or
> > > > more of your child-device drivers so that we can see how this ends up
> > > > being used in the end (including an example devicetree).
> > > 
> > > Note that this is useful on its own: we have ofonod running on the top
> > > of this doing calls and SMSes.
> > 
> > Yup.
> > 
> > > Tony: I know you have drivers depending on this somewhere (audio
> > > routing and GPS), but I can't find them. It is not droid4-pending-v5.6
> > > AFAICT. Do you have a pointer / could you publish them somewhere?
> > 
> > Hmm they should be there in droid4-pending-v5.6 branch [0]:
> > 
> > $ git log --abbrev=12 --pretty=format:"%h (\"%s\")" \
> > 	v5.6..droid4-pending-v5.6 | grep -i -e gsm -e mot -e mdm
> > e09590a260a4 ("mfd: motmdm: Fix oops on unload of motorola-mdm")
> > f9252f9ff6bd ("mfd: motmdm: Revert bad list change")
> > d733dcaf4416 ("mfd: motmdm: Fix issue with receiving data before ddata is set")
> > 452d2b5d4c95 ("n_gsm: Build fixes for make randconfig build")
> > 6882b27ea92a ("phy: mapphone-mdm6600: Fix write timeouts with shorter GPIO toggle interval")
> > 58ff58c4b520 ("mfd: motmdm: Add basic DTMF support")
> > e92b6f30e5ae ("ASoC: audio-graph-card: Add audio mixer for motorold mdm6600")
> > c2caea5767d5 ("gnss: mot-mdm6600: Add support for Motorola Mapphone MDM6600 modem")
> > a5f73b7b06f6 ("mfd: motmdm: Add Motorola TS 27.010 serdev driver for devices like droid4")
> > 6c311d5aeb0a ("dt-bindings: mfd: motmdm: Add binding for motorola-mdm")
> > cd02274b920e ("tty: n_gsm: Add support for serdev drivers")
> > a73a48321c98 ("phy: mapphone-mdm6600: Fix timeouts by adding wake-up handling")
> 
> Here's better try at getting gnss to work on top of linux-next... but
> still no luck.

Hmm that's about all it should take. Presumably you already tried
diffing the related files against droid4-pending-v5.6 branch.

I'm moving around things to work with a generic serdev-ngsm.c driver
so I'm inbetween patches right now and don't have it working either
probably for a few more days.

Regards,

Tony
