Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DC2582C7BF5
	for <lists+linux-omap@lfdr.de>; Mon, 30 Nov 2020 00:16:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726293AbgK2XQE (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sun, 29 Nov 2020 18:16:04 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:52614 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725950AbgK2XQE (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sun, 29 Nov 2020 18:16:04 -0500
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id DD2FE97E;
        Mon, 30 Nov 2020 00:15:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1606691722;
        bh=1gmJ8FD0rO7A1+h32o5aMZJ6hT0SptCs8bO+zmLJSzo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=hp8JEJmCbQEY77m6iLbKfnx6dcPOuZltndcWEXxBLEXInSg0/88o5D5+gn9F92oED
         wF54OYK686Yr1VGDvEPSEeB6LeCs9c6F1/qB3ytaV6ZYpsvoH6OBP6x/t32HmaZ+W7
         8ONqPb9DxhJ/yS+5BCyLFnBusktcKNqPQjvKMfRA=
Date:   Mon, 30 Nov 2020 01:15:13 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Sebastian Reichel <sre@kernel.org>
Cc:     dri-devel@lists.freedesktop.org,
        Thierry Reding <thierry.reding@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>, linux-omap@vger.kernel.org,
        kernel@collabora.com, Jarkko Nikula <jarkko.nikula@bitmer.com>,
        Peter Ujfalusi <peter.ujfalusi@ti.com>,
        Tony Lindgren <tony@atomide.com>,
        Aaro Koskinen <aaro.koskinen@iki.fi>,
        Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>,
        Merlijn Wajer <merlijn@wizzup.org>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: Re: [PATCH] drm/panel: sony-acx565akm: Fix race condition in probe
Message-ID: <20201129231513.GA5893@pendragon.ideasonboard.com>
References: <20201127200429.129868-1-sebastian.reichel@collabora.com>
 <20201128220847.GC3865@pendragon.ideasonboard.com>
 <20201129005331.z45f5uqjwxki4wwz@earth.universe>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20201129005331.z45f5uqjwxki4wwz@earth.universe>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Sebastian,

On Sun, Nov 29, 2020 at 01:53:31AM +0100, Sebastian Reichel wrote:
> On Sun, Nov 29, 2020 at 12:08:47AM +0200, Laurent Pinchart wrote:
> > On Fri, Nov 27, 2020 at 09:04:29PM +0100, Sebastian Reichel wrote:
> > > The probe routine acquires the reset GPIO using GPIOD_OUT_LOW. Directly
> > > afterwards it calls acx565akm_detect(), which sets the GPIO value to
> > > HIGH. If the bootloader initialized the GPIO to HIGH before the probe
> > > routine was called, there is only a very short time period of a few
> > > instructions where the reset signal is LOW. Exact time depends on
> > > compiler optimizations, kernel configuration and alignment of the stars,
> > > but I expect it to be always way less than 10us. There are no public
> > > datasheets for the panel, but acx565akm_power_on() has a comment with
> > > timings and reset period should be at least 10us. So this potentially
> > > brings the panel into a half-reset state.
> > 
> > Good catch.
> > 
> > Looks like we got the reset polarity wrong in the driver though.
> > GPIOD_OUT_LOW should mean de-asserted, but the driver expects it to mean
> > low level. We can't fix that as it would require changing the device
> > tree :-(
> 
> Yes, polarity is wrong unfortunately.
> 
> > > The result is, that panel may not work after boot and can get into a
> > > working state by re-enabling it (e.g. by blanking + unblanking), since
> > > that does a clean reset cycle. This bug has recently been hit by Ivaylo
> > > Dimitrov, but there are some older reports which are probably the same
> > > bug. At least Tony Lindgren, Peter Ujfalusi and Jarkko Nikula have
> > > experienced it in 2017 describing the blank/unblank procedure as
> > > possible workaround.
> > > 
> > > Note, that the bug really goes back in time. It has originally been
> > > introduced in the predecessor of the omapfb driver in 3c45d05be382
> > > ("OMAPDSS: acx565akm panel: handle gpios in panel driver") in 2012.
> > > That driver eventually got replaced by a newer one, which had the bug
> > > from the beginning in 84192742d9c2 ("OMAPDSS: Add Sony ACX565AKM panel
> > > driver") and still exists in fbdev world. That driver has later been
> > > copied to omapdrm and then was used as a basis for this driver. Last
> > > but not least the omapdrm specific driver has been removed in
> > > 45f16c82db7e ("drm/omap: displays: Remove unused panel drivers").
> > > 
> > > Reported-by: Jarkko Nikula <jarkko.nikula@bitmer.com>
> > > Reported-by: Peter Ujfalusi <peter.ujfalusi@ti.com>
> > > Reported-by: Tony Lindgren <tony@atomide.com>
> > > Reported-by: Aaro Koskinen <aaro.koskinen@iki.fi>
> > > Reported-by: Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>
> > > Cc: Merlijn Wajer <merlijn@wizzup.org>
> > > Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > Cc: Tomi Valkeinen <tomi.valkeinen@ti.com>
> > > Fixes: 1c8fc3f0c5d2 ("drm/panel: Add driver for the Sony ACX565AKM panel")
> > > Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> > > ---
> > >  drivers/gpu/drm/panel/panel-sony-acx565akm.c | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > 
> > > diff --git a/drivers/gpu/drm/panel/panel-sony-acx565akm.c b/drivers/gpu/drm/panel/panel-sony-acx565akm.c
> > > index e95fdfb16b6c..ba0b3ead150f 100644
> > > --- a/drivers/gpu/drm/panel/panel-sony-acx565akm.c
> > > +++ b/drivers/gpu/drm/panel/panel-sony-acx565akm.c
> > > @@ -629,7 +629,7 @@ static int acx565akm_probe(struct spi_device *spi)
> > >  	lcd->spi = spi;
> > >  	mutex_init(&lcd->mutex);
> > >  
> > > -	lcd->reset_gpio = devm_gpiod_get(&spi->dev, "reset", GPIOD_OUT_LOW);
> > > +	lcd->reset_gpio = devm_gpiod_get(&spi->dev, "reset", GPIOD_OUT_HIGH);
> > 
> > Wouldn't it be better to instead add a delay here (or in
> > acx565akm_detect()) ? If the panel is in a wrong state at
> > boot time, a real reset can help.
> 
> acx565akm_detect() reads some registers to detect a previously
> enabled panel and then driver handles this case properly. If we
> reset the panel before the detection code, any detection code
> would be useless (panel is obviously not enabled after a reset).
> 
> I think this detection code is only needed to avoid flickering
> when a bootsplash is shown. So by accepting a bit of flickering
> we can simplify the driver by dropping that code and make it a
> bit more robust by doing a reset. It's a tradeoff and I don't
> have strong feelings for either option.
> 
> But I think, that this fix should be applied to fixes branch
> (and backported to stable). Removing panel enable detection
> should not be applied as fix IMHO.

Agreed.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

-- 
Regards,

Laurent Pinchart
