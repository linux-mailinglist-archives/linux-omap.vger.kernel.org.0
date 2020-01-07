Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1A5B5132E4E
	for <lists+linux-omap@lfdr.de>; Tue,  7 Jan 2020 19:24:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728235AbgAGSYE (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 7 Jan 2020 13:24:04 -0500
Received: from muru.com ([72.249.23.125]:50420 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727925AbgAGSYD (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 7 Jan 2020 13:24:03 -0500
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 3D8498022;
        Tue,  7 Jan 2020 18:24:44 +0000 (UTC)
Date:   Tue, 7 Jan 2020 10:24:00 -0800
From:   Tony Lindgren <tony@atomide.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Lee Jones <lee.jones@linaro.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Mark Brown <broonie@kernel.org>,
        Sebastian Reichel <sre@kernel.org>, linux-omap@vger.kernel.org
Subject: Re: [PATCH] mfd: motorola-cpcap: Do not hardcode SPI mode flags
Message-ID: <20200107182400.GG5885@atomide.com>
References: <20191204231931.21378-1-linus.walleij@linaro.org>
 <20191219170409.GH35479@atomide.com>
 <CACRpkdYm2b7G6dvmY5VCSSQCK6DMEYMYRqnoMpH6jaumkQL3Xg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACRpkdYm2b7G6dvmY5VCSSQCK6DMEYMYRqnoMpH6jaumkQL3Xg@mail.gmail.com>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Linus Walleij <linus.walleij@linaro.org> [200107 09:58]:
> On Thu, Dec 19, 2019 at 6:04 PM Tony Lindgren <tony@atomide.com> wrote:
> 
> > * Linus Walleij <linus.walleij@linaro.org> [700101 00:00]:
> > > The current use of mode flags to us SPI_MODE_0 and
> > > SPI_CS_HIGH is fragile: it overwrites anything already
> > > assigned by the SPI core. Change it thusly:
> > >
> > > - Just |= the SPI_MODE_0 so we keep other flags
> > > - Assign ^= SPI_CS_HIGH since we might be active high
> > >   already, and that is usually the case with GPIOs used
> > >   for chip select, even if they are in practice active low.
> > >
> > > Add a comment clarifying why ^= SPI_CS_HIGH is the right
> > > choice here.
> >
> > Looks like this breaks booting for droid4 with a cpcap
> > PMIC, probably as regulators won't work. There's no GPIO
> > controller involved in this case for the chip select, the
> > pins are directly controlled by the spi-omap2-mcspi.c
> > driver.
> >
> > From the pin muxing setup we see there's a pull-down on
> > mcspi1_cs0 pin meaning it's active high:
> >
> > /* 0x4a100138 mcspi1_cs0.mcspi1_cs0 ae23 */
> > OMAP4_IOPAD(0x138, PIN_INPUT_PULLDOWN | MUX_MODE0)
> >
> > My guess a similar issue is with similar patches for
> > all non-gpio spi controllers?
> >
> > Let me know if you want me to test some other changes,
> > or if this patch depends on some other changes.
> 
> So this must mean that something else is setting SPI_CS_HIGH
> for this driver, such as the device tree, right?

Hmm yes we have "spi-cs-high" property set in the dts.

But looking at drivers/spi/spi-omap2-mcspi.c, it also
provides an option to use a GPIO for chip select in
omap2_mcspi_setup(). That does not seem to be used though
based on a quick grep though.

> And the |= SPI_CS_HIGH assignment in the driver is just
> surplus and we should just delete this code instead.
> 
> Would that be right?

Sorry I don't know, maybe. If you have some test patch to
try I can easily test.

Regards,

Tony
