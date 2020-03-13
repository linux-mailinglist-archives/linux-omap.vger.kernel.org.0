Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 96AC318404B
	for <lists+linux-omap@lfdr.de>; Fri, 13 Mar 2020 06:23:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726328AbgCMFX2 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 13 Mar 2020 01:23:28 -0400
Received: from mail-wr1-f52.google.com ([209.85.221.52]:44731 "EHLO
        mail-wr1-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726642AbgCMFX2 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 13 Mar 2020 01:23:28 -0400
Received: by mail-wr1-f52.google.com with SMTP id l18so10419906wru.11
        for <linux-omap@vger.kernel.org>; Thu, 12 Mar 2020 22:23:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=mrcDIsFA3/Ta2hSNkBuRQyW3SXqePmFTf5/RuwyDgf0=;
        b=T033ZgKZpnqFjHfXAEFb0AEsRtRaYebeV9C1f2YT14kIgYN+8PTQoAU0w+haEbxL8y
         DXCxtkDjXHhvfpTxIlAb28RhlckBsfTmsbQzy6ENDO0RyxJ0lHSBqI/xuYnBZoSzQOM7
         KRybo2ev0s+wtQmlA046zJefT0ztT4EgIDc/a2nTgWEAu+WXI3Ng9LjBYz43sdUwb9vB
         XthnUncXLvYxEJIrXDMtX+RARF8ouAa5WloaLsdcTDj+k7X+H5zfHLId5OFQjx0OgEvd
         UUxpClGXIa5nN+K6BKvSJQhyREaZgTfXYLvYJLUHO+KUh2MGWUeuuGjx3BkxM16m3Ag4
         inwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=mrcDIsFA3/Ta2hSNkBuRQyW3SXqePmFTf5/RuwyDgf0=;
        b=mpIn8wl5kGqIqWVO7eBEWorRIAs87hdHnlulrFSg+LILWz1GQpvGIMk2mxMj1/yH5H
         tHwjaWYvSPhOGoSyfKhX33YPY8u/2SY89FRBpdF7MmScAbmCBEPlknTuYZRChjcPVPBk
         LoKfjvNFYXX/SRp88/pVavBET8WZVtPzgEiDKMPYxGeEsBnKnTLakUf8cJ1E6lAKamyM
         +tM8sWbFgGYdJ3jiRkq+On/Otmp4r7sVcWnBy6KP1+7Uf4SHzQajdwBQ3DTGpx9SAAy4
         naGUkSBS5nUCcs5xfAAlL5ICa5HSsZn3UlmON9lpjpR3df8UioPzqpfLWoMF2CrITQ5l
         /3jw==
X-Gm-Message-State: ANhLgQ1WykeGLFT5hh/ufJKzOVy5hWFwIZpqK4febdLqrTQ8XLDnDYxY
        EHclRX7WbBjzGIdgHeJNv+XW2h76bPvZPOzvtdp+7w==
X-Google-Smtp-Source: ADFU+vu8XbuHhTjM2eMcjPe1xL331sZ9RctJL1gttvaszdk47W25THe5EffgXN+vdgE8ZJeTHmOkppyis+f41CbjibI=
X-Received: by 2002:a05:6000:10c5:: with SMTP id b5mr15708804wrx.203.1584077006978;
 Thu, 12 Mar 2020 22:23:26 -0700 (PDT)
MIME-Version: 1.0
References: <CAEf4M_Du6Egn-3nZHtSnMMwohc+-DyEdtWU5DqSJi71+nDthFw@mail.gmail.com>
 <CACRpkdaPoMGZ7jGh6j4dYexx+qCcoMQ37vS7kbpf=3TtcA9zQQ@mail.gmail.com> <CAEf4M_B_sxOiKFnEVUrx00RE2MaMA98LpijNhp0EVY11eRAXHg@mail.gmail.com>
In-Reply-To: <CAEf4M_B_sxOiKFnEVUrx00RE2MaMA98LpijNhp0EVY11eRAXHg@mail.gmail.com>
From:   Haojian Zhuang <haojian.zhuang@linaro.org>
Date:   Fri, 13 Mar 2020 13:23:15 +0800
Message-ID: <CAD6h2NT840zMfwaJatfKzai8QjZEQmF5v0xgE+9ngSJJ+Qy+6g@mail.gmail.com>
Subject: Re: gpio-omap: add support gpiolib bias (pull-up/down) flags?
To:     Drew Fustini <pdp7pdp7@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        Kevin Hilman <khilman@kernel.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        Drew Fustini <drew@beagleboard.org>,
        Jason Kridner <jkridner@beagleboard.org>,
        Robert Nelson <robertcnelson@beagleboard.org>,
        Tony Lindgren <tony@atomide.com>, linux-omap@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Fri, 13 Mar 2020 at 08:38, Drew Fustini <pdp7pdp7@gmail.com> wrote:
>
> On Thu, Mar 12, 2020 at 1:43 PM Linus Walleij <linus.walleij@linaro.org> wrote:
> > Do we have a datasheet for this GPIO block somewhere? Should
> > be the datasheet for the ASIC.
>
> I am looking at the AM335x reference manual [0] but I can not actually
> find any references to pull-up/down or bias for GPIO pins.  I guess I
> was making of the mistake of assuming this would be something the gpio
> pins support.
>
> > We already have the required .set_config() callback on the OMAP
> > driver, it's just that it only uses it for debounce.
> >
> > The driver is a bit convoluted with register offsets in a struct
> > omap_gpio_reg_offs depending on variant, but if they have
> > a register for this I'd say just get hacking.
> >
> > If the GPIO driver is using pin control as back-end you are
> > looking at something more complex similar to what Intel is
> > doing inside drivers/pinctrl/intel/pinctrl-intel.c: this driver
> > is just calling up to gpiochip_generic_config() which will
> > try to configure the lines behind the GPIO using pin config,
> > which works if the proper ranges are defined so the
> > framework can map a GPIO line to a pin control pin.
>
> Thank you for the feedback, Linus.
>
> Upon further review of drivers/pinctrl/pinctrl-single.c, I am not
> certain it actually supports pull-up/down.
>
> I see there is pcs_pinconf_clear_bias() and pcs_pinconf_bias_disable()
> but I don't see a place where the PIN_CONFIG_BIAS_PULL_DOWN or
> PIN_CONFIG_BIAS_PULL_UP get set.
>

                        /* 4 parameters */
                        case PIN_CONFIG_BIAS_DISABLE:
                                pcs_pinconf_clear_bias(pctldev, pin);
                                break;
                        case PIN_CONFIG_BIAS_PULL_DOWN:
                        case PIN_CONFIG_BIAS_PULL_UP:
                                if (arg)
                                        pcs_pinconf_clear_bias(pctldev, pin);
                                /* fall through */
                        case PIN_CONFIG_INPUT_SCHMITT_ENABLE:
                                data &= ~func->conf[i].mask;
                                if (arg)
                                        data |= func->conf[i].enable;
                                else
                                        data |= func->conf[i].disable;
                                break;

Because it does fall through, pullup/pulldown is set in the snippet of
"PIN_CONFIG_INPUT_SCHMITT_ENABLE".

Best Regards
Haojian
