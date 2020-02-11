Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 43A8D159623
	for <lists+linux-omap@lfdr.de>; Tue, 11 Feb 2020 18:29:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729353AbgBKR3F (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 11 Feb 2020 12:29:05 -0500
Received: from muru.com ([72.249.23.125]:54770 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727785AbgBKR3F (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 11 Feb 2020 12:29:05 -0500
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 861688198;
        Tue, 11 Feb 2020 17:29:47 +0000 (UTC)
Date:   Tue, 11 Feb 2020 09:29:00 -0800
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
Subject: Re: LED backlight on Droid 4 and others
Message-ID: <20200211172900.GH64767@atomide.com>
References: <20200105183202.GA17784@duo.ucw.cz>
 <20200106084549.GA14821@dell>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200106084549.GA14821@dell>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Lee Jones <lee.jones@linaro.org> [200106 08:46]:
> On Sun, 05 Jan 2020, Pavel Machek wrote:
> 
> > Hi!
> > 
> > It would be good to get LED backlight to work in clean way for 5.6
> > kernel.
...
> > [If you have an idea what else is needed, it would be welcome; it
> > works for me in development tree but not in tree I'd like to
> > upstream.]
> > 
> > Lee, would you be willing to take "backlight: add led-backlight
> > driver"? Would it help if I got "leds: Add managed API to get a LED
> > from a device driver" and "leds: Add of_led_get() and led_put()" into
> > for_next tree of the LED subsystem?
> 
> It looks like you have an open question from Tony on v10.
> 
> Is that patch orthogonal, or are there depend{ants,encies}?

Uhh looks like we messed up a bit with integration. Now droid4
LCD backlight can no longer be enabled at all manually in v5.6-rc1
without the "add led-backlight driver" patch.. Should we just
merge it to fix it rather than start scrambling with other
temporary hacks?

I don't care if we use "default-brightness", or if we use
"default-brightness-level". The binding merged says now
"default-brightness", so let's go with that one. That's what
other LED drivers are using too.

Regards,

Tony


