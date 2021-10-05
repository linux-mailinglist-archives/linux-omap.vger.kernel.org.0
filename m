Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6A575422BF6
	for <lists+linux-omap@lfdr.de>; Tue,  5 Oct 2021 17:11:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235763AbhJEPNS (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 5 Oct 2021 11:13:18 -0400
Received: from mail-vs1-f52.google.com ([209.85.217.52]:39557 "EHLO
        mail-vs1-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235697AbhJEPNO (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 5 Oct 2021 11:13:14 -0400
Received: by mail-vs1-f52.google.com with SMTP id o124so24070565vsc.6;
        Tue, 05 Oct 2021 08:11:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=AO/n39DEQE+kNBhOJcG8/vIMrumgJRNvPPJVHpBpJic=;
        b=7k88qyS5175LhLeE8r4ATbwQhNhv0NX1Jac9bvWIdpRbyEzEMqQVDy3nuWXE+uA/K4
         gZiUBn/dg8xo9KIaEzaK19vUsqfNGg1bTRKCQQGsxDb0gnUSWqNKluw6mIqY0sJE2G+2
         e6VC7gKUBuRg5vo0USxtA/tO8rhYIV7UAst1Ra0GIkB8yYhBS/P/NRPOxwIetRF1gNcI
         KsOPAn34iQMiX+evvoI49/BsbkdvA+ao5db6eAadxm8Qe6aq0NPB/FiOE1zB92tQeH79
         904T1aaPPtFFSVR/VLHlUKPo+YpkjyAzv28yIIPhuqTYXSiuxs02YEf8jqqDIo4m4Z5Z
         xBqw==
X-Gm-Message-State: AOAM531YEF2antANONQG+RMvRzLwue+727lIyg1w/F+IyLpD/LhYP7Sy
        +IeFuxlPjpbGr/0OTKfhPgteHUnOIKa8zzt+G6Y=
X-Google-Smtp-Source: ABdhPJwbutRLYFa/x4DgBk6axsrpzqnuQQS9yABJI7P4SqTGGeBmOBsHASLte9b+qo/+S14Axl7WqhSZ8l5JCixtpCM=
X-Received: by 2002:a67:cb0a:: with SMTP id b10mr19359924vsl.9.1633446682848;
 Tue, 05 Oct 2021 08:11:22 -0700 (PDT)
MIME-Version: 1.0
References: <20210929000735.585237-1-saravanak@google.com> <20210929000735.585237-3-saravanak@google.com>
In-Reply-To: <20210929000735.585237-3-saravanak@google.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 5 Oct 2021 17:11:11 +0200
Message-ID: <CAMuHMdWLgpom978bGt1vdNQNxPVb34QJRs5gdRKnRkOs6DJOLA@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] drivers: bus: Delete CONFIG_SIMPLE_PM_BUS
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
> The simple-pm-bus driver is mandatory for CONFIG_OF based platforms to work
> with fw_devlink. So, always compile it in for CONFIG_OF and delete the
> config since it's no longer necessary.
>
> Signed-off-by: Saravana Kannan <saravanak@google.com>
> Tested-by: Ulf Hansson <ulf.hansson@linaro.org>

Works fine on R-Car Gen/Gen3 (simple-bus), and SH-Mobile AG5,
R-Mobile APE6, and K210 (simple-pm-bus).
Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
