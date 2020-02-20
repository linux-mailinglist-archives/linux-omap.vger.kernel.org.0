Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BC9D916607E
	for <lists+linux-omap@lfdr.de>; Thu, 20 Feb 2020 16:09:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728448AbgBTPJG (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 20 Feb 2020 10:09:06 -0500
Received: from muru.com ([72.249.23.125]:56274 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728176AbgBTPJG (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 20 Feb 2020 10:09:06 -0500
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id DE1ED8080;
        Thu, 20 Feb 2020 15:09:48 +0000 (UTC)
Date:   Thu, 20 Feb 2020 07:09:01 -0800
From:   Tony Lindgren <tony@atomide.com>
To:     Lee Jones <lee.jones@linaro.org>
Cc:     Pavel Machek <pavel@ucw.cz>,
        kernel list <linux-kernel@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        linux-omap@vger.kernel.org, sre@kernel.org, nekit1000@gmail.com,
        mpartap@gmx.net, merlijn@wizzup.org, martin_rysavy@centrum.cz,
        agx@sigxcpu.org, daniel.thompson@linaro.org, jingoohan1@gmail.com,
        dri-devel@lists.freedesktop.org, tomi.valkeinen@ti.com,
        jjhiblot@ti.com
Subject: Re: [PATCH] backlight: add led-backlight driver
Message-ID: <20200220150901.GG37466@atomide.com>
References: <20200219191412.GA15905@amd>
 <20200219194540.GD37466@atomide.com>
 <20200220074849.GF3494@dell>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200220074849.GF3494@dell>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Lee Jones <lee.jones@linaro.org> [200220 07:49]:
> On Wed, 19 Feb 2020, Tony Lindgren wrote:
> 
> > * Pavel Machek <pavel@ucw.cz> [200219 19:15]:
> > > From: Tomi Valkeinen <tomi.valkeinen@ti.com>
> > > 
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
> > > 
> > > Hi!
> > > 
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
> Please do.  You already have my Ack.

OK pushed out these two patches in omap-for-v5.6/droid4-lcd-fix.

Thanks,

Tony
