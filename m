Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 89BFF2C723E
	for <lists+linux-omap@lfdr.de>; Sat, 28 Nov 2020 23:06:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732987AbgK1VuX (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sat, 28 Nov 2020 16:50:23 -0500
Received: from fgw23-4.mail.saunalahti.fi ([62.142.5.110]:43456 "EHLO
        fgw23-4.mail.saunalahti.fi" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1730033AbgK1SfB (ORCPT
        <rfc822;linux-omap@vger.kernel.org>);
        Sat, 28 Nov 2020 13:35:01 -0500
Received: from darkstar.musicnaut.iki.fi (85-76-71-224-nat.elisa-mobile.fi [85.76.71.224])
        by fgw23.mail.saunalahti.fi (Halon) with ESMTP
        id b02e7da9-31a1-11eb-8ccd-005056bdfda7;
        Sat, 28 Nov 2020 19:46:49 +0200 (EET)
Date:   Sat, 28 Nov 2020 19:46:47 +0200
From:   Aaro Koskinen <aaro.koskinen@iki.fi>
To:     Sebastian Reichel <sebastian.reichel@collabora.com>
Cc:     dri-devel@lists.freedesktop.org,
        Thierry Reding <thierry.reding@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>, linux-omap@vger.kernel.org,
        kernel@collabora.com, Jarkko Nikula <jarkko.nikula@bitmer.com>,
        Peter Ujfalusi <peter.ujfalusi@ti.com>,
        Tony Lindgren <tony@atomide.com>,
        Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>,
        Merlijn Wajer <merlijn@wizzup.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: Re: [PATCH] drm/panel: sony-acx565akm: Fix race condition in probe
Message-ID: <20201128174647.GE551434@darkstar.musicnaut.iki.fi>
References: <20201127200429.129868-1-sebastian.reichel@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201127200429.129868-1-sebastian.reichel@collabora.com>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi,

On Fri, Nov 27, 2020 at 09:04:29PM +0100, Sebastian Reichel wrote:
> The probe routine acquires the reset GPIO using GPIOD_OUT_LOW. Directly
> afterwards it calls acx565akm_detect(), which sets the GPIO value to
> HIGH. If the bootloader initialized the GPIO to HIGH before the probe
> routine was called, there is only a very short time period of a few
> instructions where the reset signal is LOW. Exact time depends on
> compiler optimizations, kernel configuration and alignment of the stars,
> but I expect it to be always way less than 10us. There are no public
> datasheets for the panel, but acx565akm_power_on() has a comment with
> timings and reset period should be at least 10us. So this potentially
> brings the panel into a half-reset state.
> 
> The result is, that panel may not work after boot and can get into a
> working state by re-enabling it (e.g. by blanking + unblanking), since
> that does a clean reset cycle. This bug has recently been hit by Ivaylo
> Dimitrov, but there are some older reports which are probably the same
> bug. At least Tony Lindgren, Peter Ujfalusi and Jarkko Nikula have
> experienced it in 2017 describing the blank/unblank procedure as
> possible workaround.
> 
> Note, that the bug really goes back in time. It has originally been
> introduced in the predecessor of the omapfb driver in 3c45d05be382
> ("OMAPDSS: acx565akm panel: handle gpios in panel driver") in 2012.
> That driver eventually got replaced by a newer one, which had the bug
> from the beginning in 84192742d9c2 ("OMAPDSS: Add Sony ACX565AKM panel
> driver") and still exists in fbdev world. That driver has later been
> copied to omapdrm and then was used as a basis for this driver. Last
> but not least the omapdrm specific driver has been removed in
> 45f16c82db7e ("drm/omap: displays: Remove unused panel drivers").
> 
> Reported-by: Jarkko Nikula <jarkko.nikula@bitmer.com>
> Reported-by: Peter Ujfalusi <peter.ujfalusi@ti.com>
> Reported-by: Tony Lindgren <tony@atomide.com>
> Reported-by: Aaro Koskinen <aaro.koskinen@iki.fi>
> Reported-by: Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>
> Cc: Merlijn Wajer <merlijn@wizzup.org>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Tomi Valkeinen <tomi.valkeinen@ti.com>
> Fixes: 1c8fc3f0c5d2 ("drm/panel: Add driver for the Sony ACX565AKM panel")
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>

Tested-by: Aaro Koskinen <aaro.koskinen@iki.fi>

Thanks,

A.

> ---
>  drivers/gpu/drm/panel/panel-sony-acx565akm.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-sony-acx565akm.c b/drivers/gpu/drm/panel/panel-sony-acx565akm.c
> index e95fdfb16b6c..ba0b3ead150f 100644
> --- a/drivers/gpu/drm/panel/panel-sony-acx565akm.c
> +++ b/drivers/gpu/drm/panel/panel-sony-acx565akm.c
> @@ -629,7 +629,7 @@ static int acx565akm_probe(struct spi_device *spi)
>  	lcd->spi = spi;
>  	mutex_init(&lcd->mutex);
>  
> -	lcd->reset_gpio = devm_gpiod_get(&spi->dev, "reset", GPIOD_OUT_LOW);
> +	lcd->reset_gpio = devm_gpiod_get(&spi->dev, "reset", GPIOD_OUT_HIGH);
>  	if (IS_ERR(lcd->reset_gpio)) {
>  		dev_err(&spi->dev, "failed to get reset GPIO\n");
>  		return PTR_ERR(lcd->reset_gpio);
> -- 
> 2.29.2
> 
