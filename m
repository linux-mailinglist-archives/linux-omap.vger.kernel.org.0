Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C76AF401759
	for <lists+linux-omap@lfdr.de>; Mon,  6 Sep 2021 09:54:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240303AbhIFHzF (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 6 Sep 2021 03:55:05 -0400
Received: from mail-vs1-f46.google.com ([209.85.217.46]:37571 "EHLO
        mail-vs1-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240117AbhIFHzF (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 6 Sep 2021 03:55:05 -0400
Received: by mail-vs1-f46.google.com with SMTP id i23so4844872vsj.4;
        Mon, 06 Sep 2021 00:54:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Xon8B2SCZnddw6P26dcLHhHXVXDY1KEqtTk0C4c5WI8=;
        b=szQNWjj+G0hWiwJFuk3suUNWJ8gBJ9K2ol/zZXrWYqQFnfgblr/8JH6UBAq41eYow7
         lr8I02tgJiLcQ/ov6OliWak13u7wlrFIUT4LHHovHKfaOCbJsSGaqw/eWGOJf5w/rkKb
         Ml6fr81oL/XVQwJw8lH3NACVt8Y24ACGlbq0/qy0StG2oi3RzlNVyDVhV8L/9Wj6YFWz
         gawhT1afjrWrw2YqeDB7TyBeuXHoIc/BZPF9P1arb/9n7JxNZV7+wrIfwA9kx7T7UTzm
         k1gi9LdiwN5V0q8Q8kVV50v4a0MmIBwdBIMrlLExNLuIOZxYCHKIBvacxbNq2ba+REV0
         H5AQ==
X-Gm-Message-State: AOAM531AZDZY74FmS15CWyM2OdnhlbBVO2mxzuGi6ZbzVihj0cju5rvL
        q6FFIpaXQiqQ1uh/qqIUQexbERYHyD9n09CMkLg=
X-Google-Smtp-Source: ABdhPJwiJLO1eun4znmfPQAmEZ02gXfXHVnSn4DLHuIKjjf0oWm84/rA+gjdhs/7qH0Ulg2tAq6+9LjizZw+NnURxdw=
X-Received: by 2002:a67:cb0a:: with SMTP id b10mr4993974vsl.9.1630914840618;
 Mon, 06 Sep 2021 00:54:00 -0700 (PDT)
MIME-Version: 1.0
References: <20210904000543.2019010-1-saravanak@google.com> <20210904000543.2019010-2-saravanak@google.com>
In-Reply-To: <20210904000543.2019010-2-saravanak@google.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 6 Sep 2021 09:53:49 +0200
Message-ID: <CAMuHMdUhZy7W_HLtNJ2ECK5uQV5xHV7pDk5BXfNUpW9L68G5Aw@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] drivers: bus: simple-pm-bus: Add support for
 probing simple bus only devices
To:     Saravana Kannan <saravanak@google.com>
Cc:     Russell King <linux@armlinux.org.uk>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Tony Lindgren <tony@atomide.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Damien Le Moal <damien.lemoal@wdc.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Android Kernel Team <kernel-team@android.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-oxnas@groups.io,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:TI ETHERNET SWITCH DRIVER (CPSW)" 
        <linux-omap@vger.kernel.org>,
        linux-riscv <linux-riscv@lists.infradead.org>,
        Lee Jones <lee.jones@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Saravana,

Thanks for your patch!

CC linux-pm, Lee (mfd)

On Sat, Sep 4, 2021 at 2:05 AM Saravana Kannan <saravanak@google.com> wrote:
> fw_devlink could end up creating device links for bus only devices.
> However, bus only devices don't get probed and can block probe() or
> sync_state() [1] call backs of other devices. To avoid this, probe these
> devices using the simple-pm-bus driver.
>
> However, there are instances of devices that are not simple buses (they
> get probed by their specific drivers) that also list the "simple-bus"
> (or other bus only compatible strings) in their compatible property to
> automatically populate their child devices. We still want these devices
> to get probed by their specific drivers. So, we make sure this driver
> only probes devices that are only buses.

Note that this can also be the case for buses declaring compatibility
with "simple-pm-bus".  However, at the moment, none of such device
nodes in upstream DTS files have device-specific drivers.

> [1] - https://lore.kernel.org/lkml/CAPDyKFo9Bxremkb1dDrr4OcXSpE0keVze94Cm=zrkOVxHHxBmQ@mail.gmail.com/
> Signed-off-by: Saravana Kannan <saravanak@google.com>
> Tested-by: Saravana Kannan <saravanak@google.com>

> --- a/drivers/bus/simple-pm-bus.c
> +++ b/drivers/bus/simple-pm-bus.c
> @@ -13,11 +13,26 @@
>  #include <linux/platform_device.h>
>  #include <linux/pm_runtime.h>
>
> -
>  static int simple_pm_bus_probe(struct platform_device *pdev)
>  {
> -       const struct of_dev_auxdata *lookup = dev_get_platdata(&pdev->dev);
> -       struct device_node *np = pdev->dev.of_node;
> +       const struct device *dev = &pdev->dev;
> +       const struct of_dev_auxdata *lookup = dev_get_platdata(dev);
> +       struct device_node *np = dev->of_node;
> +       const struct of_device_id *match;
> +
> +       match = of_match_device(dev->driver->of_match_table, dev);
> +
> +       /*
> +        * These are transparent bus devices (not simple-pm-bus matches) that
> +        * have their child nodes populated automatically.  So, don't need to
> +        * do anything more.
> +        */
> +       if (match && match->data) {
> +               if (of_property_match_string(np, "compatible", match->compatible) == 0)

Does this work as expected? Having multiple compatible values in a
device node does not guarantee there exist a separate driver for any
of the device-specific compatible values.

> +                       return 0;
> +               else
> +                       return -ENODEV;

So if we get here, as both branches use "return", we skip the
pm_runtime_enable() and of_platform_populate() below:
  - of_platform_populate() is handled for these buses by
    of_platform_default_populate(), so that's OK,
  - I'm wondering if any of the simple-mfd sub-devices use Runtime
    PM, but currently fail to save power because pm_runtime_enable()
    is never called for the MFD container, just like with simple-bus...

> +       }
>
>         dev_dbg(&pdev->dev, "%s\n", __func__);
>
> @@ -31,14 +46,25 @@ static int simple_pm_bus_probe(struct platform_device *pdev)
>
>  static int simple_pm_bus_remove(struct platform_device *pdev)
>  {
> +       const void *data = of_device_get_match_data(&pdev->dev);
> +
> +       if (data)
> +               return 0;
> +
>         dev_dbg(&pdev->dev, "%s\n", __func__);
>
>         pm_runtime_disable(&pdev->dev);
>         return 0;
>  }
>
> +#define ONLY_BUS       ((void *) 1) /* Match if the device is only a bus. */
> +
>  static const struct of_device_id simple_pm_bus_of_match[] = {
>         { .compatible = "simple-pm-bus", },
> +       { .compatible = "simple-bus",   .data = ONLY_BUS },
> +       { .compatible = "simple-mfd",   .data = ONLY_BUS },
> +       { .compatible = "isa",          .data = ONLY_BUS },

#ifdef CONFIG_ARM_AMBA ?

> +       { .compatible = "arm,amba-bus", .data = ONLY_BUS },
>         { /* sentinel */ }

This is now (almost[*]) the same as of_default_bus_match_table[]
in drivers/of/platform.c. Perhaps it can be shared?

[*] Especially if "simple-pm-bus" and "simple-bus" would be treated
    the same.

>  };
>  MODULE_DEVICE_TABLE(of, simple_pm_bus_of_match);

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
