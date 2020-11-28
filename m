Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8214F2C6DDE
	for <lists+linux-omap@lfdr.de>; Sat, 28 Nov 2020 01:07:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731500AbgK1AFz (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 27 Nov 2020 19:05:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38050 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732433AbgK1AFe (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 27 Nov 2020 19:05:34 -0500
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8E2D4C0613D1
        for <linux-omap@vger.kernel.org>; Fri, 27 Nov 2020 16:05:33 -0800 (PST)
Received: by mail-wr1-x441.google.com with SMTP id r3so7203115wrt.2
        for <linux-omap@vger.kernel.org>; Fri, 27 Nov 2020 16:05:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=ask30rkCcxEwfDRluplRjJx9jj2tCEDJPuoiY4dzrEU=;
        b=TAXEVTKtCDoPUtQp9n2x5WKgPA+rDz5bae854cIShg+24zyp2JK+flsdc530Cu7Amj
         Bv0gZrhGCVGh30QLe4DHvFN3GWnEcf4EKhCBD9fE4Bn0buxOReLeZmrkYo7fGFfVMVbd
         Bd3i7ddKBNngnNgUfx+DkXMA9XYNNQMoBc8nz11hGHjKMh6nLbkgE4VeOU4yLN7xjwUp
         q0UMEKi52xPoeiZ5vfLIa8ZzQKZnXBPIVNtmkheBaiheX8y5caax5GO2sp4Y9ch4Fx1l
         EueHD74OM53JQ9Z7iDdoSeHVb5HY5tcq20liVgzfWyJpgGiKzHxD0UA3Gx5x1HibpYO+
         awQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=ask30rkCcxEwfDRluplRjJx9jj2tCEDJPuoiY4dzrEU=;
        b=hHmb5Z1Z9rmsiyM6fRFcCbis/LXbyb0qCo9k7FkGNMqrI92fA5A5QmCZDNrWWGhfuh
         fVwzEO8Z4jxkv4IalcKP1LLv0mjvvuh9CNuj0Pn3Nyk1gLNizssXISSLxjNCuuittcmH
         54p8l238Bbd3n4yJXplEdtajaO5SonQUS+6AdqSe0ZD9Kk2pq/DEqLG9HJoiHXliFDQk
         rcVxtz6X4UroHVlqVTK7obJU3fdxQRkPvd10rqyL1VZUJ5OrP7qkXQMcvRw2WiAqS62m
         +nG2eo7r//YdD+x398EpL2SNKvOHuI+mgrs5wx9VzOH3aKEOxhzdKCVzthSb6JeEFRxf
         ZbHg==
X-Gm-Message-State: AOAM531cqHA0pvwH6rZMQfNlbdujuEPSg3pDnjrU/dqDFiSHHOtLY/ff
        Yb+U7+f1nH8yHx5O9sMHbUQ=
X-Google-Smtp-Source: ABdhPJz8/3DNGbL+SIcOcaVF41BOm5EcTR/4qYvInjmmiYqK578TQziZLEV9cbKsVueURcJ4rWG60Q==
X-Received: by 2002:a5d:66c3:: with SMTP id k3mr13990772wrw.123.1606521932370;
        Fri, 27 Nov 2020 16:05:32 -0800 (PST)
Received: from [192.168.1.10] ([46.249.74.23])
        by smtp.googlemail.com with ESMTPSA id a131sm16416147wmh.30.2020.11.27.16.05.30
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 27 Nov 2020 16:05:31 -0800 (PST)
Subject: Re: [PATCH] drm/panel: sony-acx565akm: Fix race condition in probe
To:     Sebastian Reichel <sebastian.reichel@collabora.com>,
        dri-devel@lists.freedesktop.org,
        Thierry Reding <thierry.reding@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>
Cc:     linux-omap@vger.kernel.org, kernel@collabora.com,
        Jarkko Nikula <jarkko.nikula@bitmer.com>,
        Peter Ujfalusi <peter.ujfalusi@ti.com>,
        Tony Lindgren <tony@atomide.com>,
        Aaro Koskinen <aaro.koskinen@iki.fi>,
        Merlijn Wajer <merlijn@wizzup.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>
References: <20201127200429.129868-1-sebastian.reichel@collabora.com>
From:   Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>
Message-ID: <45fea8ad-233c-d227-70f2-66fe9f4fe808@gmail.com>
Date:   Sat, 28 Nov 2020 02:05:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Firefox/60.0 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20201127200429.129868-1-sebastian.reichel@collabora.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

You may add:

Tested-by: Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>

On 27.11.20 г. 22:04 ч., Sebastian Reichel wrote:
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
> ---
>   drivers/gpu/drm/panel/panel-sony-acx565akm.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-sony-acx565akm.c b/drivers/gpu/drm/panel/panel-sony-acx565akm.c
> index e95fdfb16b6c..ba0b3ead150f 100644
> --- a/drivers/gpu/drm/panel/panel-sony-acx565akm.c
> +++ b/drivers/gpu/drm/panel/panel-sony-acx565akm.c
> @@ -629,7 +629,7 @@ static int acx565akm_probe(struct spi_device *spi)
>   	lcd->spi = spi;
>   	mutex_init(&lcd->mutex);
>   
> -	lcd->reset_gpio = devm_gpiod_get(&spi->dev, "reset", GPIOD_OUT_LOW);
> +	lcd->reset_gpio = devm_gpiod_get(&spi->dev, "reset", GPIOD_OUT_HIGH);
>   	if (IS_ERR(lcd->reset_gpio)) {
>   		dev_err(&spi->dev, "failed to get reset GPIO\n");
>   		return PTR_ERR(lcd->reset_gpio);
> 
