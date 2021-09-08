Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 459A24040D6
	for <lists+linux-omap@lfdr.de>; Thu,  9 Sep 2021 00:03:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236955AbhIHWEH (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 8 Sep 2021 18:04:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50042 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235972AbhIHWEG (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 8 Sep 2021 18:04:06 -0400
Received: from mail-yb1-xb33.google.com (mail-yb1-xb33.google.com [IPv6:2607:f8b0:4864:20::b33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E22ABC061575
        for <linux-omap@vger.kernel.org>; Wed,  8 Sep 2021 15:02:57 -0700 (PDT)
Received: by mail-yb1-xb33.google.com with SMTP id y16so786512ybm.3
        for <linux-omap@vger.kernel.org>; Wed, 08 Sep 2021 15:02:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=h/KrPoSusIWXfaxxiz6d+5SZKzgcam3GYDlFFEZnnMY=;
        b=pe7+5xlygWREYLTBPwQ4X2nvtNtdGJRqObWDRJY9EMov224EgPVX8Ha+BITykbcrHD
         pgsGo/GfwQZLxzwUvA+bnJjC95jBhDgCnzyENJs8mZKhTTXQuAXdlqFyEL/8CNVtHmrO
         n8utNK+rV2QUw0YCAaPdPBh9QbZ+uyEQXNfliHXAtJ1zTv/zI+gbbP5QD0Ker4nklmVS
         h3smtQKVGfJLnPLDpcCPwSStMR1VMU37GPu8lzuf1k4S/UEqeUm4zr8TPpmWmMoJltTf
         7MRUz+in30TtguUqXKOYxQWfmwNGBFSYQGmksXgJF+6xmRiisHJEcGLmQZ8KcMnngO3F
         fMXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=h/KrPoSusIWXfaxxiz6d+5SZKzgcam3GYDlFFEZnnMY=;
        b=luTUBOpJO8d0KcYM1WXNMpnZQEW3oYN6/wjSzeSefjen0wMzGW6hzTQ2es3iv5bDm3
         bnQCfDLBnq5U5Io7+04e6j+NGLWso3+o/lrBGNMajvbNbR/tzD7MN2dRfByd4RzrMaOC
         4x1H4XvFSNDr1wVmCclP3lENdMROHShBWowKLuXDQ1eSp+SMs/WikY0bViZWBgHMi5ob
         YHGZHBLciiMPr6bx4r9Ojw50R1qZ/RcNjYoB5yplU5h0Q6yeqh+HqLGPi4phAsowbyWi
         yBRkM99UZkY95l/pB5s7MqhpeLfdf5wlyOhkvFX0c3XPoYFJUibB68eM6pBRaRudRg1b
         O7PQ==
X-Gm-Message-State: AOAM533DhBGvESjHtA9MpONjZktm//ZIp/8wBzKqfX4Q+YdTlHWOEYJq
        ncDQxr91pVmBoOIGxbSXn8PTSrT4WwWIgXlq1HamOg==
X-Google-Smtp-Source: ABdhPJxClOdeLnlr90MK1KP1cTL7b5WQrlcEprzjPCW6hNsUleQfKwSjp3Z9+e8nH9EAsa8vkVGGODNF/IKN+WaxZHU=
X-Received: by 2002:a05:6902:1201:: with SMTP id s1mr600170ybu.432.1631138577011;
 Wed, 08 Sep 2021 15:02:57 -0700 (PDT)
MIME-Version: 1.0
References: <20210904000543.2019010-1-saravanak@google.com>
 <20210904000543.2019010-2-saravanak@google.com> <CAPDyKFrsKvHXMT-6CuFXKfqX+hZa3vGAu7hQz=9ZYBC7-dYS0w@mail.gmail.com>
In-Reply-To: <CAPDyKFrsKvHXMT-6CuFXKfqX+hZa3vGAu7hQz=9ZYBC7-dYS0w@mail.gmail.com>
From:   Saravana Kannan <saravanak@google.com>
Date:   Wed, 8 Sep 2021 15:02:21 -0700
Message-ID: <CAGETcx8xfb+mnmo9wvX_C19Ta_FFh+jn8sz2sKyx5PJY1aZCyg@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] drivers: bus: simple-pm-bus: Add support for
 probing simple bus only devices
To:     Ulf Hansson <ulf.hansson@linaro.org>
Cc:     Russell King <linux@armlinux.org.uk>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Tony Lindgren <tony@atomide.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Damien Le Moal <damien.lemoal@wdc.com>,
        Rob Herring <robh+dt@kernel.org>,
        Android Kernel Team <kernel-team@android.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-oxnas@groups.io,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-omap <linux-omap@vger.kernel.org>,
        linux-riscv <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Tue, Sep 7, 2021 at 3:41 AM Ulf Hansson <ulf.hansson@linaro.org> wrote:
>
> On Sat, 4 Sept 2021 at 02:05, Saravana Kannan <saravanak@google.com> wrote:
> >
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
> >
> > [1] - https://lore.kernel.org/lkml/CAPDyKFo9Bxremkb1dDrr4OcXSpE0keVze94Cm=zrkOVxHHxBmQ@mail.gmail.com/
> > Signed-off-by: Saravana Kannan <saravanak@google.com>
> > Tested-by: Saravana Kannan <saravanak@google.com>
>
> Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>
>
> I will run some tests as soon as I can and let you know the results.

Thanks.

-Saravana

>
> Kind regards
> Uffe
>
> > ---
> >  drivers/bus/simple-pm-bus.c | 32 +++++++++++++++++++++++++++++---
> >  1 file changed, 29 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/bus/simple-pm-bus.c b/drivers/bus/simple-pm-bus.c
> > index 01a3d0cd08ed..3e086a9f34cb 100644
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
> > +                       return 0;
> > +               else
> > +                       return -ENODEV;
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
> > +       { .compatible = "arm,amba-bus", .data = ONLY_BUS },
> >         { /* sentinel */ }
> >  };
> >  MODULE_DEVICE_TABLE(of, simple_pm_bus_of_match);
> > --
> > 2.33.0.153.gba50c8fa24-goog
> >
