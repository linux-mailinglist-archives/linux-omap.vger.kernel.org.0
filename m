Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4BE964023C5
	for <lists+linux-omap@lfdr.de>; Tue,  7 Sep 2021 09:04:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235798AbhIGHDE (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 7 Sep 2021 03:03:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53468 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235147AbhIGHDD (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 7 Sep 2021 03:03:03 -0400
Received: from mail-yb1-xb30.google.com (mail-yb1-xb30.google.com [IPv6:2607:f8b0:4864:20::b30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A93A8C061757
        for <linux-omap@vger.kernel.org>; Tue,  7 Sep 2021 00:01:57 -0700 (PDT)
Received: by mail-yb1-xb30.google.com with SMTP id v17so17860492ybs.9
        for <linux-omap@vger.kernel.org>; Tue, 07 Sep 2021 00:01:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=XZ02cCn3jUYwKkL6zF4WdVr12IAXBqByLITg8GOc89U=;
        b=d93iTWhWZFfJpFHQv7tpLm+6QZsDGz9hKjnedRCRGiLYNluChqhRkJG8SXzFFmOfVW
         vZm8NbbB/ZNCbEH+OY1q9VJXD0fjaGUX9aQJUUYxnbYUhS2xxPjd7t7qnfh3DD0sXqaq
         8eJQxMAUhyqHNspp0CCWfg54DzbMP1WEsE3UY2+m4suxCrOVPaUj4MJvy4uN3GFlxLRi
         v8Jw1aJXLKQ0fVHK5Kmau8Vb9SBrnQ2b+jGFv+MlkS0Adf5MgCxTQmRtLfXtsw91x17g
         HBgR7RJrjjEX8i8GP6AKVtWt8Cib2/svkcKBa08Ofa57+WUEXEGVam4avffXdOQ34jYX
         qFRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=XZ02cCn3jUYwKkL6zF4WdVr12IAXBqByLITg8GOc89U=;
        b=jj8kcUPR4xLv0a7pXHyodPWduCH5Ux/zGHLeu5VtfUEDCe5Y3JwPaf3qtIXL3YMBro
         Ll3WA8oUinp6pOm7VBHBHArKI5FKi3IDqPcp+xIWqjjfowQMVBcJjVCuYaBvWC8VgUIt
         FEmqIn6VyPWZPrpMLBiipNC7v6d2yg41ns8UP1mD3+0mqTUD1ni96RQcjkEnsk++zsB0
         vAPC2sNGMDuVEHjM7p2Ve+blaHOUaEVyBzZ6sMVLIYqBEUmbYXMtZtX7RtsEWyVY86qo
         mgbpfImt78v0UgabTeZvRsNMY9zJ8zMnQVYxeU3oDLYXeoetu4OI6Gbz4GQIjVgRxFe2
         LQDQ==
X-Gm-Message-State: AOAM532jOjPcHhR3AOFJqOxR2iAtw84BKBx19EXibhtCysUXDNaPfDns
        ukF4OrfblmJfdT0LiaYD7vClWqPZPL/uRiz6F1xmcA==
X-Google-Smtp-Source: ABdhPJyLhKD3oP2+8EJssMw8N+mu4D4/j9ZXZmiK4Fvt3T9csxsUw9BdjSpamoLn9OyWs207aw/T9vOcGmFBkW99uG4=
X-Received: by 2002:a25:b94:: with SMTP id 142mr19856293ybl.508.1630998116640;
 Tue, 07 Sep 2021 00:01:56 -0700 (PDT)
MIME-Version: 1.0
References: <20210904000543.2019010-1-saravanak@google.com>
 <20210904000543.2019010-2-saravanak@google.com> <CAMuHMdUhZy7W_HLtNJ2ECK5uQV5xHV7pDk5BXfNUpW9L68G5Aw@mail.gmail.com>
In-Reply-To: <CAMuHMdUhZy7W_HLtNJ2ECK5uQV5xHV7pDk5BXfNUpW9L68G5Aw@mail.gmail.com>
From:   Saravana Kannan <saravanak@google.com>
Date:   Tue, 7 Sep 2021 00:01:23 -0700
Message-ID: <CAGETcx_7N3gtaT-YHGaGL+Qtkv=JOhgPcPF1A+kQ4aaDoetvSA@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] drivers: bus: simple-pm-bus: Add support for
 probing simple bus only devices
To:     Geert Uytterhoeven <geert@linux-m68k.org>
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

On Mon, Sep 6, 2021 at 12:54 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>
> Hi Saravana,
>
> Thanks for your patch!
>
> CC linux-pm, Lee (mfd)
>
> On Sat, Sep 4, 2021 at 2:05 AM Saravana Kannan <saravanak@google.com> wrote:
> > fw_devlink could end up creating device links for bus only devices.
> > However, bus only devices don't get probed and can block probe() or
> > sync_state() [1] call backs of other devices. To avoid this, probe these
> > devices using the simple-pm-bus driver.
> >
> > However, there are instances of devices that are not simple buses (they
> > get probed by their specific drivers) that also list the "simple-bus"
> > (or other bus only compatible strings) in their compatible property to
> > automatically populate their child devices. We still want these devices
> > to get probed by their specific drivers. So, we make sure this driver
> > only probes devices that are only buses.
>
> Note that this can also be the case for buses declaring compatibility
> with "simple-pm-bus".  However, at the moment, none of such device
> nodes in upstream DTS files have device-specific drivers.

Not sure about mfd, but I want to make sure we don't confuse busses
(which are typically added to a class) with these "simple bus" devices
that are added to platform_bus. Also if these other buses are actually
causing an issue, then then should implement their own stub driver or
use try patch[2] if they are added to classes (devices on classes
don't probe)

[2] - https://lore.kernel.org/lkml/20210831224510.703253-1-saravanak@google.com/

>
> > [1] - https://lore.kernel.org/lkml/CAPDyKFo9Bxremkb1dDrr4OcXSpE0keVze94Cm=zrkOVxHHxBmQ@mail.gmail.com/
> > Signed-off-by: Saravana Kannan <saravanak@google.com>
> > Tested-by: Saravana Kannan <saravanak@google.com>
>
> > --- a/drivers/bus/simple-pm-bus.c
> > +++ b/drivers/bus/simple-pm-bus.c
> > @@ -13,11 +13,26 @@
> >  #include <linux/platform_device.h>
> >  #include <linux/pm_runtime.h>
> >
> > -
> >  static int simple_pm_bus_probe(struct platform_device *pdev)
> >  {
> > -       const struct of_dev_auxdata *lookup = dev_get_platdata(&pdev->dev);
> > -       struct device_node *np = pdev->dev.of_node;
> > +       const struct device *dev = &pdev->dev;
> > +       const struct of_dev_auxdata *lookup = dev_get_platdata(dev);
> > +       struct device_node *np = dev->of_node;
> > +       const struct of_device_id *match;
> > +
> > +       match = of_match_device(dev->driver->of_match_table, dev);
> > +
> > +       /*
> > +        * These are transparent bus devices (not simple-pm-bus matches) that
> > +        * have their child nodes populated automatically.  So, don't need to
> > +        * do anything more.
> > +        */
> > +       if (match && match->data) {
> > +               if (of_property_match_string(np, "compatible", match->compatible) == 0)
>
> Does this work as expected? Having multiple compatible values in a
> device node does not guarantee there exist a separate driver for any
> of the device-specific compatible values.

Right, and if they are platform devices that are equivalent to
simple-bus (meaning, they don't do anything in Linux and just have
their devices populated) we can add those to this list too.

>
> > +                       return 0;
> > +               else
> > +                       return -ENODEV;
>
> So if we get here, as both branches use "return", we skip the
> pm_runtime_enable() and of_platform_populate() below:
>   - of_platform_populate() is handled for these buses by
>     of_platform_default_populate(), so that's OK,
>   - I'm wondering if any of the simple-mfd sub-devices use Runtime
>     PM, but currently fail to save power because pm_runtime_enable()
>     is never called for the MFD container, just like with simple-bus...

But this doesn't affect simple-mfd though.

>
> > +       }
> >
> >         dev_dbg(&pdev->dev, "%s\n", __func__);
> >
> > @@ -31,14 +46,25 @@ static int simple_pm_bus_probe(struct platform_device *pdev)
> >
> >  static int simple_pm_bus_remove(struct platform_device *pdev)
> >  {
> > +       const void *data = of_device_get_match_data(&pdev->dev);
> > +
> > +       if (data)
> > +               return 0;
> > +
> >         dev_dbg(&pdev->dev, "%s\n", __func__);
> >
> >         pm_runtime_disable(&pdev->dev);
> >         return 0;
> >  }
> >
> > +#define ONLY_BUS       ((void *) 1) /* Match if the device is only a bus. */
> > +
> >  static const struct of_device_id simple_pm_bus_of_match[] = {
> >         { .compatible = "simple-pm-bus", },
> > +       { .compatible = "simple-bus",   .data = ONLY_BUS },
> > +       { .compatible = "simple-mfd",   .data = ONLY_BUS },
> > +       { .compatible = "isa",          .data = ONLY_BUS },
>
> #ifdef CONFIG_ARM_AMBA ?

Not needed? If CONFIG_ARM_AMBA isn't enabled, the device wouldn't be
created in the first place.

>
> > +       { .compatible = "arm,amba-bus", .data = ONLY_BUS },
> >         { /* sentinel */ }
>
> This is now (almost[*]) the same as of_default_bus_match_table[]
> in drivers/of/platform.c. Perhaps it can be shared?

I wanted this table to be expandable as needed. That's why I'm
intentionally not using of_default_bus_match_table[].

>
> [*] Especially if "simple-pm-bus" and "simple-bus" would be treated
>     the same.

They are not treated the same way.

-Saravana

>
> >  };
> >  MODULE_DEVICE_TABLE(of, simple_pm_bus_of_match);
>
> Gr{oetje,eeting}s,
>
>                         Geert
>
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
>
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds
