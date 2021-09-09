Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E11AF4048D8
	for <lists+linux-omap@lfdr.de>; Thu,  9 Sep 2021 13:02:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234565AbhIILDe (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 9 Sep 2021 07:03:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55142 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234412AbhIILDd (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 9 Sep 2021 07:03:33 -0400
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1ED3AC061756
        for <linux-omap@vger.kernel.org>; Thu,  9 Sep 2021 04:02:24 -0700 (PDT)
Received: by mail-lj1-x229.google.com with SMTP id w4so2308751ljh.13
        for <linux-omap@vger.kernel.org>; Thu, 09 Sep 2021 04:02:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=HqMw/0l1kESubu2uMBYTCMZr+nbcPkWmEaa8w30Z3Ss=;
        b=xIwstDFqbjVnFK3QnzRTMN0EG2JKgfszQq2XLDgslizPmY4v6dP8UJZjjqlxKby6Mp
         0KJgvLrdmrGWirG868pOOPdsvJJ3wvQn4HkuNGkCKL+5AK09jt8kwULq/1fFgbNj/zJh
         DgiUwA+I9ht71YaJwD+/egwug7iP8l3WAL3uG8+63AzTHLyqAsK0emCtbiYDpHZ5RD8o
         nXPP9ukAOMaLrge7iHJSN6pNxYP5rBChKHGsoNSvRzI8QMOaOhwGoS8IK0ywKlKMSqpt
         Krk1MSkR/EWsz7PKnjgqn+kK5tJouOKWILi/kPWt0Bj3Mh1o2vgfuhf0SU8aRz5NPaNQ
         j4AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=HqMw/0l1kESubu2uMBYTCMZr+nbcPkWmEaa8w30Z3Ss=;
        b=w71mjPVKR5dMuX1glpOC6X6ndsaZFGrs+N3NrS1aGzQSLv+HcjkRLsA1VeUSxbeCU9
         6gnxE1DjPn+bbfiXWO3Z9uCpssl9z7cxRINrjUPCuxYc7m1nK80HX0cSCJj87FnZcq6e
         xrBMznnH5A7lKINjJmw5a/WWE/8m8OSNpIULdVWnzhrixd6tdWXAgZmi0XYOccRRrral
         Kzk/o0sgSZYtpUvNRdbz0kgN0U0/XVY97tNdX2SXCbKKyzgAk7Wd7eb42THuPUUgTM50
         uESVK4eGVx+Ns1mAb2IFArOvEv0PHQr1a2g8DXg+cxekXP+RG4z2PVWNDCaIM7P+hY2V
         2/4g==
X-Gm-Message-State: AOAM5319gmsNHFf94kaT5ZHgOv5AD7oKDFldlh3vLOyLgUeopIYTDaCB
        Cljz2PY2RL+LVfvdVUfTG46n4Es+nft42jbejhQxKQ==
X-Google-Smtp-Source: ABdhPJxQvRGdQcwMRyPKe/v7I+JRraf0+2CwO4dEv14CGJ8gaECBtDJTpCm9aPScDx10Jp9Ce7uZo62Ly4MHBeb1p0s=
X-Received: by 2002:a2e:b610:: with SMTP id r16mr1746946ljn.367.1631185342288;
 Thu, 09 Sep 2021 04:02:22 -0700 (PDT)
MIME-Version: 1.0
References: <20210904000543.2019010-1-saravanak@google.com> <20210904000543.2019010-2-saravanak@google.com>
In-Reply-To: <20210904000543.2019010-2-saravanak@google.com>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Thu, 9 Sep 2021 13:01:42 +0200
Message-ID: <CAPDyKFqkvN=ZrfAnj4CqfjBu_Pj0YH9txnkP-1d=FhaEhbPrPA@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] drivers: bus: simple-pm-bus: Add support for
 probing simple bus only devices
To:     Saravana Kannan <saravanak@google.com>
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

On Sat, 4 Sept 2021 at 02:05, Saravana Kannan <saravanak@google.com> wrote:
>
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
>
> [1] - https://lore.kernel.org/lkml/CAPDyKFo9Bxremkb1dDrr4OcXSpE0keVze94Cm=zrkOVxHHxBmQ@mail.gmail.com/
> Signed-off-by: Saravana Kannan <saravanak@google.com>
> Tested-by: Saravana Kannan <saravanak@google.com>

Tested-by: Ulf Hansson <ulf.hansson@linaro.org>

Kind regards
Uffe


> ---
>  drivers/bus/simple-pm-bus.c | 32 +++++++++++++++++++++++++++++---
>  1 file changed, 29 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/bus/simple-pm-bus.c b/drivers/bus/simple-pm-bus.c
> index 01a3d0cd08ed..3e086a9f34cb 100644
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
> +                       return 0;
> +               else
> +                       return -ENODEV;
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
> +       { .compatible = "arm,amba-bus", .data = ONLY_BUS },
>         { /* sentinel */ }
>  };
>  MODULE_DEVICE_TABLE(of, simple_pm_bus_of_match);
> --
> 2.33.0.153.gba50c8fa24-goog
>
