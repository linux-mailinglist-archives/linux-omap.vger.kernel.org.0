Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7FAFE16516B
	for <lists+linux-omap@lfdr.de>; Wed, 19 Feb 2020 22:15:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727291AbgBSVPS (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 19 Feb 2020 16:15:18 -0500
Received: from muru.com ([72.249.23.125]:56186 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726645AbgBSVPS (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 19 Feb 2020 16:15:18 -0500
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 09A4980F3;
        Wed, 19 Feb 2020 21:16:00 +0000 (UTC)
Date:   Wed, 19 Feb 2020 13:15:13 -0800
From:   Tony Lindgren <tony@atomide.com>
To:     Pavel Machek <pavel@ucw.cz>
Cc:     Lee Jones <lee.jones@linaro.org>,
        kernel list <linux-kernel@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        linux-omap@vger.kernel.org, sre@kernel.org, nekit1000@gmail.com,
        mpartap@gmx.net, merlijn@wizzup.org, martin_rysavy@centrum.cz,
        agx@sigxcpu.org, daniel.thompson@linaro.org, jingoohan1@gmail.com,
        dri-devel@lists.freedesktop.org, tomi.valkeinen@ti.com,
        jjhiblot@ti.com
Subject: Re: [PATCH] backlight: add led-backlight driver
Message-ID: <20200219211513.GE37466@atomide.com>
References: <20200219191412.GA15905@amd>
 <20200219194540.GD37466@atomide.com>
 <20200219205322.GA1227@duo.ucw.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200219205322.GA1227@duo.ucw.cz>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Pavel Machek <pavel@ucw.cz> [200219 20:54]:
> Hi!
> 
> > > This patch adds a led-backlight driver (led_bl), which is similar to
> > > pwm_bl except the driver uses a LED class driver to adjust the
> > > brightness in the HW. Multiple LEDs can be used for a single backlight.
> > > 
> > > Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
> > > Signed-off-by: Jean-Jacques Hiblot <jjhiblot@ti.com>
> > > Acked-by: Pavel Machek <pavel@ucw.cz>
> > > Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>
> > > Acked-by: Lee Jones <lee.jones@linaro.org>
> > > Acked-by: Tony Lindgren <tony@atomide.com>
> > > Tested-by: Tony Lindgren <tony@atomide.com>
> > > Signed-off-by: Pavel Machek <pavel@ucw.cz>
> > > ---
> > >  drivers/video/backlight/Kconfig  |   7 ++
> > >  drivers/video/backlight/Makefile |   1 +
> > >  drivers/video/backlight/led_bl.c | 260 +++++++++++++++++++++++++++++++++++++++
> > >  3 files changed, 268 insertions(+)
> > >  create mode 100644 drivers/video/backlight/led_bl.c
> 
> > > Here's the version of the driver I have. AFAICT
> > > default-brightness-level handling is ok, so does not need to be
> > > changed.
> > > 
> > > Lee, it would be easiest for me if you could apply it to your tree and
> > > push, but given enough time I can push it to Linus, too.
> > 
> > Oh you're using quoted-printable for patches.. Got it applied now,
> > and it still works. Below is also the related dts change that
> > I tested with.
> > 
> > Feel free to pick the dts change too, naturally that should
> > not be applied before the driver.
> > 
> > If you guys instead want me to pick these both into my fixes
> > branch, just let me know and I'll do the explaining why these
> > are needed as fixes. Basically we no longer have a way to enable
> > the LCD backlight for droid4 manually starting with v5.6-rc1
> > unlike earlier.
> 
> If you are willing to do that, it looks like good solution from my
> point of view.

OK. I'll apply them but won't push out yet in case Lee is already
applying the driver change..

Pavel, care to ack the dts patch?

Regards,

Tony
