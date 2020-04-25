Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 30D511B8729
	for <lists+linux-omap@lfdr.de>; Sat, 25 Apr 2020 16:51:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726100AbgDYOva (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sat, 25 Apr 2020 10:51:30 -0400
Received: from muru.com ([72.249.23.125]:51402 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726087AbgDYOva (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Sat, 25 Apr 2020 10:51:30 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id C45DA8108;
        Sat, 25 Apr 2020 14:52:16 +0000 (UTC)
Date:   Sat, 25 Apr 2020 07:51:26 -0700
From:   Tony Lindgren <tony@atomide.com>
To:     Lokesh Vutla <lokeshvutla@ti.com>
Cc:     Suman Anna <s-anna@ti.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org,
        Tero Kristo <t-kristo@ti.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        "H . Nikolaus Schaller" <hns@goldelico.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Keerthy <j-keerthy@ti.com>,
        Ladislav Michl <ladis@linux-mips.org>,
        Pavel Machek <pavel@ucw.cz>, Sebastian Reichel <sre@kernel.org>
Subject: Re: [PATCH] clocksource: timer-ti-dm: Drop bogus
 omap_dm_timer_of_set_source()
Message-ID: <20200425145126.GN37466@atomide.com>
References: <20200213053504.22638-1-s-anna@ti.com>
 <7debff4f-8f64-ee7c-2fdd-879649e35eb0@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7debff4f-8f64-ee7c-2fdd-879649e35eb0@ti.com>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Lokesh Vutla <lokeshvutla@ti.com> [200425 09:15]:
> Hi Tony, Suman,
> 
> On 13/02/20 11:05 AM, Suman Anna wrote:
> > The function omap_dm_timer_of_set_source() was originally added in
> > commit 31a7448f4fa8a ("ARM: OMAP: dmtimer: Add clock source from DT"),
> > and is designed to set a clock source from DT using the clocks property
> > of a timer node. This design choice is okay for clk provider nodes but
> > otherwise is a bad design as typically the clocks property is used to
> > specify the functional clocks for a device, and not its parents.
> > 
> > The timer nodes now all define a timer functional clock after the
> > conversion to ti-sysc and the new clkctrl layout, and this results
> > in an attempt to set the same functional clock as its parent when a
> > consumer driver attempts to acquire any of these timers in the
> > omap_dm_timer_prepare() function. This was masked and worked around
> > in commit 983a5a43ec25 ("clocksource: timer-ti-dm: Fix pwm dmtimer
> > usage of fck reparenting"). Fix all of this by simply dropping the
> > entire function.
> > 
> > Any DT configuration of clock sources should be achieved using
> > assigned-clocks and assigned-clock-parents properties provided
> > by the Common Clock Framework.
> > 
> > Cc: Tony Lindgren <tony@atomide.com>
> > Cc: Tero Kristo <t-kristo@ti.com>
> > Cc: Neil Armstrong <narmstrong@baylibre.com>
> > Cc: H. Nikolaus Schaller <hns@goldelico.com>
> > Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> > Cc: Keerthy <j-keerthy@ti.com>
> > Cc: Ladislav Michl <ladis@linux-mips.org>
> > Cc: Pavel Machek <pavel@ucw.cz>
> > Cc: Sebastian Reichel <sre@kernel.org>
> > Signed-off-by: Suman Anna <s-anna@ti.com>
> > ---
> > Hi Tony,
> > 
> > Do you have the history of why the 32 KHz source is set as parent during
> > prepare? One of the current side-affects of this patch is that now instead
> > of bailing out, the 32 KHz source is set, and consumers will still need
> > to select their appropriate parent. Dropping that call should actually
> > allow us to select the parents in the consumer nodes in dts files using
> > the assigned-clocks and assigned-clock-parents properties. I prefer to
> > drop it if you do not foresee any issues. For now, I do not anticipate
> > any issues with omap-pwm-dmtimer with this patch.
> > 
> 
> Sorry to bring up an old thread. But ping on this question by Suman. prepare()
> is over writing any parent set by DT to 32KHz. Is it possible to know why
> prepare is doing it? If there is no proper reason can we drop this setting all
> together?

For devicetree configured machines we should just configure the source
clock with assigned-clock-parents as there may be device specific need
for a specific source. So yeah, I'm all for dropping that code for device
tree booting machines. For the old omap1 devices, the clock code still
needs to configure it probably.

The reason why the 32k source is the default is that it's always on and
works for power management unlike the system clock which may be shut off
during idle.

Regards,

Tony
