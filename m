Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C84A0422BD3
	for <lists+linux-omap@lfdr.de>; Tue,  5 Oct 2021 17:07:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235335AbhJEPJD (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 5 Oct 2021 11:09:03 -0400
Received: from mail-ua1-f54.google.com ([209.85.222.54]:37726 "EHLO
        mail-ua1-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229488AbhJEPJD (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 5 Oct 2021 11:09:03 -0400
Received: by mail-ua1-f54.google.com with SMTP id i13so443927uat.4;
        Tue, 05 Oct 2021 08:07:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=bk0G/z1T/uosdH3nhuVAPRarw22NSmvJmajc0ie3v6A=;
        b=bN53d8riJpjCyaARGHXvJW88vILTqKU2VwG8/fdJRTH3rxfwBDBC32In8GohAuiuxr
         g4vsVsfAg3ijBNWs9Rq5rhdG3dR17TrkNqKHgd0dQ6pszTElkcV6XTQxNVzUUWJ8A1iN
         foWlfYHv/IdvJ7xTAqCX6RyompmmI6ssO6kx0u7N1SSz+qT825wm/I3IGPntixoGl5dl
         LTEkfTQOPux2us0cnZquNpItbX8GnRibsgDSGw+r4RgXGM1BQu3d6VY8yWk234dzK+9s
         sfiMrKCQBOLaOzz+feZwOOIK3HYyNTjRfA7ok49yj3aa2ZyEKqd8d9wEBhn9/OuxEAic
         aCkw==
X-Gm-Message-State: AOAM531sPTEydhQrq6Fv6S/l6dg8W5uzGA49w//lnn4VAiyvZm1bqaS4
        Kk/nQB26YU+O4oem5Gkh7RmBM8I+hPt9Wy3pnhc=
X-Google-Smtp-Source: ABdhPJzxRXB84hERP6o6WD8zVyYzPaZTAX750wbPz4I9CTy02fziulaptkej0GIkEyJDLO2QdDkhEc1GsBZ/isZxSXk=
X-Received: by 2002:ab0:538a:: with SMTP id k10mr13022243uaa.14.1633446432404;
 Tue, 05 Oct 2021 08:07:12 -0700 (PDT)
MIME-Version: 1.0
References: <20210929000735.585237-1-saravanak@google.com> <20210929000735.585237-2-saravanak@google.com>
In-Reply-To: <20210929000735.585237-2-saravanak@google.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 5 Oct 2021 17:07:01 +0200
Message-ID: <CAMuHMdXG1MLQiwoaa6W5R8fJUBEUePUPnmqQ3baoVzLzp=JMLQ@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] drivers: bus: simple-pm-bus: Add support for
 probing simple bus only devices
To:     Saravana Kannan <saravanak@google.com>
Cc:     Russell King <linux@armlinux.org.uk>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Tony Lindgren <tony@atomide.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Damien Le Moal <damien.lemoal@wdc.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Android Kernel Team <kernel-team@android.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-oxnas@groups.io,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:TI ETHERNET SWITCH DRIVER (CPSW)" 
        <linux-omap@vger.kernel.org>,
        linux-riscv <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Wed, Sep 29, 2021 at 2:07 AM Saravana Kannan <saravanak@google.com> wrote:
> fw_devlink could end up creating device links for bus only devices.
> However, bus only devices don't get probed and can block probe() or
> sync_state() [1] call backs of other devices. To avoid this, probe these
> devices using the simple-pm-bus driver.
>
> However, there are instances of devices that are not simple buses (they get
> probed by their specific drivers) that also list the "simple-bus" (or other
> bus only compatible strings) in their compatible property to automatically
> populate their child devices. We still want these devices to get probed by
> their specific drivers. So, we make sure this driver only probes devices
> that are only buses.
>
> [1] - https://lore.kernel.org/lkml/CAPDyKFo9Bxremkb1dDrr4OcXSpE0keVze94Cm=zrkOVxHHxBmQ@mail.gmail.com/
> Fixes: c442a0d18744 ("driver core: Set fw_devlink to "permissive" behavior by default")
> Signed-off-by: Saravana Kannan <saravanak@google.com>
> Tested-by: Saravana Kannan <saravanak@google.com>
> Tested-by: Ulf Hansson <ulf.hansson@linaro.org>

Works fine on R-Car Gen/Gen3 (simple-bus), and SH-Mobile AG5
and R-Mobile APE6 (simple-pm-bus).
Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
