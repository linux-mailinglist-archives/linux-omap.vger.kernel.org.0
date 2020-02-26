Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C66A917016D
	for <lists+linux-omap@lfdr.de>; Wed, 26 Feb 2020 15:43:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727854AbgBZOnO (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 26 Feb 2020 09:43:14 -0500
Received: from muru.com ([72.249.23.125]:57640 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727362AbgBZOnO (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 26 Feb 2020 09:43:14 -0500
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id CB6A28022;
        Wed, 26 Feb 2020 14:43:56 +0000 (UTC)
Date:   Wed, 26 Feb 2020 06:43:08 -0800
From:   Tony Lindgren <tony@atomide.com>
To:     Lee Jones <lee.jones@linaro.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alan Cox <gnomes@lxorguk.ukuu.org.uk>,
        Jiri Slaby <jslaby@suse.cz>, Johan Hovold <johan@kernel.org>,
        Merlijn Wajer <merlijn@wizzup.org>,
        Pavel Machek <pavel@ucw.cz>,
        Peter Hurley <peter@hurleysoftware.com>,
        Rob Herring <robh@kernel.org>,
        Sebastian Reichel <sre@kernel.org>,
        linux-serial@vger.kernel.org, devicetree@vger.kernel.org,
        linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/4] mfd: motmdm: Add Motorola TS 27.010 serdev modem
 driver for droid4
Message-ID: <20200226144308.GM37466@atomide.com>
References: <20200220195943.15314-1-tony@atomide.com>
 <20200220195943.15314-3-tony@atomide.com>
 <20200226115548.GO3494@dell>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200226115548.GO3494@dell>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Lee Jones <lee.jones@linaro.org> [200226 11:56]:
> On Thu, 20 Feb 2020, Tony Lindgren wrote:
> 
> > Many Motorola phones are controlling the modem using a custom variant
> > of TS 27.010 serial line discipline. Devices on these modems have a
> > dedicated TS 27.010 channel for features like audio mixer, GNSS, voice
> > modem, SIM card reader and so on.
> > 
> > This driver allows using various devices on the modem. In order to do
> > that, we need to take care of the following three things:
> > 
> > 1. Provide /dev/motmdm* character devices for apps to use for talking
> >    to the various devices on the modem
> > 
> > 2. Handle Motorola custom protocol over TS 27.010 to make the channels
> >    usable for userspace
> > 
> > 3. Coordinate PM runtime with the USB PHY because of shared GPIO pins
> >    with the USB PHY
...
> > ---
> >  drivers/mfd/Kconfig        |    9 +
> >  drivers/mfd/Makefile       |    1 +
> >  drivers/mfd/motorola-mdm.c | 1200 ++++++++++++++++++++++++++++++++++++
> 
> I'm not even going to start reviewing this as I can see, without even
> looking at the code, that this has too much functionality (stuff that
> does stuff) contained.
> 
> Please move as much functionality out into the subsystems as
> possible.  Ideally, MFDs should be responsible for obtaining and
> registering shared resources and registering child devices.  Anything
> else should be shifted out to an appropriate subsystem.
> 
> MFD is not Misc.

OK good point. So this is a serdev consumer driver that eventually will
also provide serdev style access to few device drivers too for the
device within the modem after decoding the Motorola specific protocol.
No special need for this driver to be under drivers/mfd though.

How about we add drivers/tty/serdev/protocol or similar directory for
drivers like this?

Naturally the all consumer device drivers should be in their subsystems
like ALSA ASoC, GNSS and so on.

Regards,

Tony
