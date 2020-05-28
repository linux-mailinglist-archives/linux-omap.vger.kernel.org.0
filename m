Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 62CA31E7072
	for <lists+linux-omap@lfdr.de>; Fri, 29 May 2020 01:38:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2437561AbgE1XiY (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 28 May 2020 19:38:24 -0400
Received: from muru.com ([72.249.23.125]:56102 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2437447AbgE1XiY (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 28 May 2020 19:38:24 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 857E780BF;
        Thu, 28 May 2020 23:39:12 +0000 (UTC)
Date:   Thu, 28 May 2020 16:38:18 -0700
From:   Tony Lindgren <tony@atomide.com>
To:     Johan Hovold <johan@kernel.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Lee Jones <lee.jones@linaro.org>, Jiri Slaby <jslaby@suse.cz>,
        Merlijn Wajer <merlijn@wizzup.org>,
        Pavel Machek <pavel@ucw.cz>,
        Peter Hurley <peter@hurleysoftware.com>,
        Sebastian Reichel <sre@kernel.org>,
        linux-serial@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org
Subject: Re: [PATCH 5/6] gnss: motmdm: Add support for Motorola Mapphone
 MDM6600 modem
Message-ID: <20200528233818.GR37466@atomide.com>
References: <20200512214713.40501-1-tony@atomide.com>
 <20200512214713.40501-6-tony@atomide.com>
 <20200528130653.GG10358@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200528130653.GG10358@localhost>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi,

* Johan Hovold <johan@kernel.org> [200528 13:07]:
> On Tue, May 12, 2020 at 02:47:12PM -0700, Tony Lindgren wrote:
> > +/*
> > + * Motorola MDM GNSS device communicates over a dedicated TS 27.010 channel
> > + * using custom data packets. The packets look like AT commands embedded into
> > + * a Motorola invented packet using format like "U1234AT+MPDSTART=0,1,100,0".
> > + * But it's not an AT compatible serial interface, it's a packet interface
> > + * using AT like commands.
> > + */
> 
> So this shouldn't depend on TS 27.010 and instead be a generic gnss
> serial driver. 

Hmm not sure if it makes sense to try to represent packet data as
a virtual serial port :) But sure let's at least investigate it.

> What does the interface look like over the corresponding USB port?
> AT-commands without the U1234 prefix?

I don't know if it's using the same commands as the ttyUSB* GNSS device
seems disabled. From what I understand, gobi2000 has just $gps_start and
$gps_stop commands for the ttyUSB* GNSS device. Those don't exist
here. Also the command style seems to follow the modem firmware for
various other devices on the modem.

> No module parameters please. Either pick a good default or we need to
> come up with a generic (sysfs) interface for polled drivers like this
> one.

OK yeah this could be a generic sysfs option.

> How does your "aggressive pm" gsmmux implementation work with the gps if
> there are no other clients keeping the modem awake? It seems the modem
> would be suspended after 600 milliseconds after being woken up every 10
> seconds or so by the polling gnss driver?

Well we still have /dev/gnss open, so GNSS stays active and won't get
disabled until the device is closed. The shared GPIOs with the USB PHY
are used to signal port traffic.

> What happens to the satellite lock in between? Does the request block
> until the gps has an updated position?

It seems to regain the lock in about one or two seconds, so it's some
kind of modem PM state for allowing the SoC to idle it seems.

Regards,

Tony
