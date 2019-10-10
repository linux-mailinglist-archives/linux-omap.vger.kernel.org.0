Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 992E5D2B9D
	for <lists+linux-omap@lfdr.de>; Thu, 10 Oct 2019 15:44:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733114AbfJJNov (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 10 Oct 2019 09:44:51 -0400
Received: from muru.com ([72.249.23.125]:36886 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732912AbfJJNov (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 10 Oct 2019 09:44:51 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id EBC9180BB;
        Thu, 10 Oct 2019 13:45:23 +0000 (UTC)
Date:   Thu, 10 Oct 2019 06:44:47 -0700
From:   Tony Lindgren <tony@atomide.com>
To:     Andreas Kemnade <andreas@kemnade.info>
Cc:     Ulf Hansson <ulf.hansson@linaro.org>,
        linux-omap <linux-omap@vger.kernel.org>,
        =?utf-8?Q?Beno=C3=AEt?= Cousson <bcousson@baylibre.com>,
        DTML <devicetree@vger.kernel.org>,
        Anders Roxell <anders.roxell@linaro.org>,
        Eyal Reizer <eyalr@ti.com>, Guy Mishol <guym@ti.com>,
        John Stultz <john.stultz@linaro.org>
Subject: Re: [PATCH] ARM: dts: Use level interrupt for omap4 & 5 wlcore
Message-ID: <20191010134447.GT5610@atomide.com>
References: <20191009164344.41093-1-tony@atomide.com>
 <CAPDyKFqUL1Cso1H-sNcWFngWiLHLD76Uk9PtN2TkKS_Kd6TKJw@mail.gmail.com>
 <20191010122501.750d0485@kemnade.info>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191010122501.750d0485@kemnade.info>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Andreas Kemnade <andreas@kemnade.info> [191010 10:28]:
> On Thu, 10 Oct 2019 09:29:45 +0200
> Ulf Hansson <ulf.hansson@linaro.org> wrote:
> 
> > On Wed, 9 Oct 2019 at 18:43, Tony Lindgren <tony@atomide.com> wrote:
> > >
> > > Commit 572cf7d7b07d ("ARM: dts: Improve omap l4per idling with wlcore edge
> > > sensitive interrupt") changed wlcore interrupts to use edge interrupt based
> > > on what's specified in the wl1835mod.pdf data sheet.
> > >
> > > However, there are still cases where we can have lost interrupts as
> > > described in omap_gpio_unidle(). And using a level interrupt instead of edge
> > > interrupt helps as we avoid the check for untriggered GPIO interrupts in
> > > omap_gpio_unidle().
> > >
> > > And with commit e6818d29ea15 ("gpio: gpio-omap: configure edge detection
> > > for level IRQs for idle wakeup") GPIOs idle just fine with level interrupts.
> > >
> > > Let's change omap4 and 5 wlcore users back to using level interrupt
> > > instead of edge interrupt. Let's not change the others as I've only seen
> > > this on omap4 and 5, probably because the other SoCs don't have l4per idle
> > > independent of the CPUs.  
> > 
> > I assume this relates to the implementation for support of SDIO IRQs
> > (and wakeups) in the omap_hsmmc driver?

In the wlcore case, there's actually an out-of-band GPIO interrupt that
can be used. That is in addition to the SDIO bus DAT1 line, that is not
currently used for wlcore wake-up.

> > In any case, just wanted to share some experience in the field, feel
> > free to do whatever you want with the below information. :-)
> > 
> > So, while I was working for ST-Ericsson on ux500, we had a very
> > similar approach to re-route the SDIO bus DAT1 line to a GPIO IRQ as a
> > remote/system wakeup (vendor hack in the mmci driver). In other words,
> > while runtime suspending the mmc host controller, we configured a GPIO
> > IRQ, via an always on logic, to capture the IRQ instead. The point is,
> > I believe we may have ended up looking at similar problems as you have
> > been facing on OMAP.
> > 
> > In hindsight, I realized that we actually violated the SDIO spec by
> > using this approach. More precisely, during runtime suspend we do
> > clock gating and then re-routes the IRQ. However, clock gating isn't
> > allowed before the SDIO bus width have been changed back from 4-bit
> > into 1-bit. This last piece of action, would be an interesting change
> > to see if it could affect the behaviour, but unfortunately I have
> > never been able to check this.
> > 
> > The tricky part, is that we can't issue a command to change the bus to
> > 1-bit in omap_hsmmc ->runtime_suspend() callback (this needs to be
> > managed by the core in some way). However, we can make a simple test,
> > by simply always limit the bus width to 1-bit, as that should mean we
> > should conform to the SDIO spec.
> > 
> 
> somehow matches that with my experiences with libertas + omap3.
> SDIO irq seems to work only with runtime force-enabled in omap_hsmmc
> or using 1bit mode.
> And yes, I tried switching mode to 1bit in runtime_suspend() but as
> you said, that cannot easily done.

Yeah libertas still has a pending issue and we're missing the 1-bit
mode. From my experience, libertas is a power hog though when in use.

Meanwhile, mwifiex and wlcore SDIO have been behaving very nice with
PM for omap3 variants for many years. That is even without the 1-bit
change.

But on omap4 I've seen lost interrupts with wlcore GPIO interrupt,
while omap4 with mwifiex using SDIO DAT1 interrupt has been behaving.

The $subject patch fixes the lost wlcore GPIO interrupt issue, after
all the surrounding GPIO fixes done during this year.

FYI, my PM regression test is just ping -c1 an idle system over WLAN :)

Then based on the ping response time I know the device is idling
properly and the wake-up is working.

The test also confirms that all the surrounding stuff like
regulators, GPIOs, pinctrl wakeirq, and MMC layer are behaving.

Then a more advanced version of this test is to ssh to an idle system
and check the latency is OK for typing and measure power consumption
when idle.

Regards,

Tony
