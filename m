Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7C0D11649FA
	for <lists+linux-omap@lfdr.de>; Wed, 19 Feb 2020 17:19:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726996AbgBSQTi (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 19 Feb 2020 11:19:38 -0500
Received: from muru.com ([72.249.23.125]:56018 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726882AbgBSQTi (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 19 Feb 2020 11:19:38 -0500
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id D5CCB80F3;
        Wed, 19 Feb 2020 16:20:19 +0000 (UTC)
Date:   Wed, 19 Feb 2020 08:19:32 -0800
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
Message-ID: <20200219161932.GK35972@atomide.com>
References: <20200105183202.GA17784@duo.ucw.cz>
 <20200106084549.GA14821@dell>
 <20200211172900.GH64767@atomide.com>
 <20200212201638.GB20085@amd>
 <20200218135219.GC3494@dell>
 <20200218141452.GF35972@atomide.com>
 <20200218231001.GA28817@amd>
 <20200219074730.GD3494@dell>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200219074730.GD3494@dell>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Lee Jones <lee.jones@linaro.org> [200219 07:47]:
> On Wed, 19 Feb 2020, Pavel Machek wrote:
> 
> > Hi!
> > 
> > > > > > > > It would be good to get LED backlight to work in clean way for 5.6
> > > > > > > > kernel.
> > > > > > ...
> > > > > > > > [If you have an idea what else is needed, it would be welcome; it
> > > > > > > > works for me in development tree but not in tree I'd like to
> > > > > > > > upstream.]
> > > > > > > > 
> > > > > > > > Lee, would you be willing to take "backlight: add led-backlight
> > > > > > > > driver"? Would it help if I got "leds: Add managed API to get a LED
> > > > > > > > from a device driver" and "leds: Add of_led_get() and led_put()" into
> > > > > > > > for_next tree of the LED subsystem?
> > > > > > > 
> > > > > > > It looks like you have an open question from Tony on v10.
> > > > > > > 
> > > > > > > Is that patch orthogonal, or are there depend{ants,encies}?
> > > > > > 
> > > > > > Uhh looks like we messed up a bit with integration. Now droid4
> > > > > > LCD backlight can no longer be enabled at all manually in v5.6-rc1
> > > > > > without the "add led-backlight driver" patch.. Should we just
> > > > > > merge it to fix it rather than start scrambling with other
> > > > > > temporary hacks?
> > > > > 
> > > > > We should just merge the "add led-backlight driver". Everything should
> > > > > be ready for it. I'm sorry if I broke something working, I was not
> > > > > aware it worked at all.
> > > > > 
> > > > > Unfortunately, this is backlight code, not LED, so I can't just merge it.
> > > > 
> > > > Please go ahead.  Apply my Acked-by and merge away ASAP.
> > > > 
> > > > Acked-by: Lee Jones <lee.jones@linaro.org>
> > > 
> > > OK best to merge the driver via the LED tree:
> > > 
> > > Acked-by: Tony Lindgren <tony@atomide.com>
> > > Tested-by: Tony Lindgren <tony@atomide.com>
> > 
> > Is the patch below the one both of you are talking about?
> > 
> > Hmm. I should s/default-brightness-level/default-brightness/
> > below.
> > 
> > Lee, I can of course take it (thanks), but won't Kconfig/Makefile
> > pieces cause rejects? It might be still better if you took it. I can
> > hand-edit it and submit it in form for easy application... tommorow.
> 
> My suggestion would be to send it to Linus ASAP.
> 
> Ideally it would get into the -rcs, as it 'fixes' things.

I agree. Pavel, the version of the patch you posted is all space
trashed. Can you please post again so I can verify the related dts
changes against it?

Regards,

Tony
