Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2B9888DDCB
	for <lists+linux-omap@lfdr.de>; Wed, 14 Aug 2019 21:13:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727814AbfHNTNd (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 14 Aug 2019 15:13:33 -0400
Received: from mail-ot1-f65.google.com ([209.85.210.65]:33300 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725828AbfHNTNc (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 14 Aug 2019 15:13:32 -0400
Received: by mail-ot1-f65.google.com with SMTP id q20so636871otl.0;
        Wed, 14 Aug 2019 12:13:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=TIMapTPG9TsKNv8gxrvskWdnMtxRZS5RDBC2qelM/IA=;
        b=HDN7Xfjey0zPgdvSwUfQwg/F2tS+QJSnem6AhqG2iCoclIIlDmEiHo/sqGIXDW/+EY
         WQ8R47te4xIFIJpvxdGDxXEgmx3ugMKEJ31gMq9sHOOXBrjEzOX5HdtWjXg8OcGsyGlZ
         GA0j8Gx0prQEe8zkTaP3hxEzo4OnVDga8I9HlNm8E/hklEUp2iNjTcocgDn28SJiKRSJ
         5EzbE95RFvVwQkUUOh1xM/hDNZ9Vm0o5rmsvUEx046kCPR9rMAWhvdgqev8TO7JfEFEt
         Rfze5xvVcCzLfKYbXPvMmpDdHPtEI/2P4Esg0Ft3A3nGL07MMIg4On1HYHRtimiiVQSa
         XXXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=TIMapTPG9TsKNv8gxrvskWdnMtxRZS5RDBC2qelM/IA=;
        b=GAVMubE7r73d5WAntE7YayaN8u0PH7x6jdkHnoodnKJkAn8a2T4nCxmVvjKv/G/ueM
         E+xDeozKyjEa6tE26y8HbHxcN133rUnE157cTXgYMv7QRqroZnKOYtF/y4JjXRN3rJdF
         Qre0BcryACp1R72xxa26zs+8x7RpKN8m/cIaErnpEHuA480m/OvwVrBIi7AmmFjzPugG
         oH/Sla/fW6olXIEuHf7JaT6E5I0a8xUJvjHDlweeHIsS85lPOewHdS1kArxjHDB8Nkoz
         lmBnid5Hk4U3p93WPIpyqXKbTcV2sOJqNRmU72UQlhKUd4iCIVpH7vC1/NMOjyWUPJQM
         z+dw==
X-Gm-Message-State: APjAAAUVHEon2kTUYa5P8wV4kBQe74Nv6k5DhHVBy9QLLx44jI8KRE2U
        eqPKLYOqBLeMlWiHPYOZFglPa68bs6QC5k9+FE9e8LMpW2mD7g==
X-Google-Smtp-Source: APXvYqyHWOWBENOuAaX/jmzLmM06wjbi0uiNrAMmhJcOZVwvxhfuSce5NmWmhfJKC09gvUSKQJacLSGUTCtQ1AzhBSQ=
X-Received: by 2002:a6b:e511:: with SMTP id y17mr1581062ioc.228.1565810011197;
 Wed, 14 Aug 2019 12:13:31 -0700 (PDT)
MIME-Version: 1.0
References: <20190814131408.57162-1-tony@atomide.com>
In-Reply-To: <20190814131408.57162-1-tony@atomide.com>
From:   Adam Ford <aford173@gmail.com>
Date:   Wed, 14 Aug 2019 14:13:19 -0500
Message-ID: <CAHCN7x+p5+XoRHJP--mZ0QcP0FzpYK+pRj7d8Y-js6a8z=p_7A@mail.gmail.com>
Subject: Re: [PATCH 0/6] Configure sgx interconnect data for some omap variants
To:     Tony Lindgren <tony@atomide.com>
Cc:     Linux-OMAP <linux-omap@vger.kernel.org>,
        =?UTF-8?Q?Beno=C3=AEt_Cousson?= <bcousson@baylibre.com>,
        devicetree <devicetree@vger.kernel.org>,
        "H. Nikolaus Schaller" <hns@goldelico.com>,
        =?UTF-8?Q?Filip_Matijevi=C4=87?= <filip.matijevic.pz@gmail.com>,
        Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>,
        Merlijn Wajer <merlijn@wizzup.org>,
        Michael Turquette <mturquette@baylibre.com>,
        =?UTF-8?Q?Pawe=C5=82_Chmiel?= <pawel.mikolaj.chmiel@gmail.com>,
        Philipp Rossak <embed3d@gmail.com>,
        Stephen Boyd <sboyd@kernel.org>, Tero Kristo <t-kristo@ti.com>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>,
        linux-clk <linux-clk@vger.kernel.org>,
        moaz korena <moaz@korena.xyz>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Wed, Aug 14, 2019 at 8:14 AM Tony Lindgren <tony@atomide.com> wrote:
>
> Hi all,
>
> For a while we've been idling sgx module on omap4 by probing it with
> ti-sysc interconnect target module driver. This allows leaving out any
> platform data in favor of device tree data, and idles the module for
> PM even if we don't have any sgx driver.
>
> I've added similar configuration for omap34xx, omap36xx, omap5 and
> am335x. Adding dra7 should work too, but my beagle x15 is suffering
> from a power supply problem right now and I'll need to work more on
> that later on.
>
> For am335x, the recently posted prm rstctrl driver is needed. The
> other SoCs here don't have a dependency to the prm rstctrl driver.
> And probably am335x child driver(s) also need to map the rstctrl
> register to increase the deassert use count.
>
> Please review and test, this should allow sgx child driver(s) to
> just use PM runtime to enable the module with no platform data.
>
> I've only tested these SoCs via sysfs to ensure the sgx module gets
> enabled and disabled properly. If you know something about sgx,
> please describe more why the sgx registers seem to be at different
> place for each SoC like between omap34xx and omap36xx.
>
> These patches may have some dependencies to what I've queued into
> my for-next branch for fixes so it's best to test with that merged
> in. Linux next should be usable for testing with these the next
> time it gets integrated.
>
> Regards,
>
> Tony
>
>
> Tony Lindgren (6):
>   ARM: OMAP2+: Drop legacy platform data for omap4 gpu
>   bus: ti-sysc: Add module enable quirk for SGX on omap36xx
>   clk: ti: add clkctrl data omap5 sgx
>   ARM: dts: Configure sgx for omap5
>   ARM: dts: Configure interconnect target module for omap3 sgx
>   ARM: dts: Configure rstctrl reset for SGX
>

Assuming the following is correct:

echo on > /sys/bus/platform/devices/5000fe00.target-module/power/control
# devmem 0x5000fe00 32
0x40000000

and

echo auto > /sys/bus/platform/devices/5000fe00.target-module/power/control
# devmem 0x5000fe00 32
[  776.373504] 8<--- cut here ---
[  776.376617] Unhandled fault: external abort on non-linefetch (0x1018) at 0xb6
f76e00
[  776.384338] pgd = bde98bb0
[  776.387054] [b6f76e00] *pgd=8cb61831, *pte=5000f383, *ppte=5000fa33
[  776.393402] In-band Error seen by MPU  at address 0

Then

Tested-by: Adam Ford <aford173@gmail.com> #logicpd-torpedo-37xx-devkit

I do wonder if an omap34xx or omap36xx should use
compatible = "ti,sysc-omap4", "ti,sysc";

should it use an omap3 equivalent?

adam

>  arch/arm/boot/dts/am33xx.dtsi              | 25 ++++++++++
>  arch/arm/boot/dts/omap34xx.dtsi            | 26 +++++++++++
>  arch/arm/boot/dts/omap36xx.dtsi            | 27 +++++++++++
>  arch/arm/boot/dts/omap4.dtsi               |  1 -
>  arch/arm/boot/dts/omap5.dtsi               | 23 ++++++++++
>  arch/arm/boot/dts/omap54xx-clocks.dtsi     | 14 ++++++
>  arch/arm/mach-omap2/omap_hwmod_44xx_data.c | 53 ----------------------
>  drivers/bus/ti-sysc.c                      | 21 +++++++++
>  drivers/clk/ti/clk-54xx.c                  | 34 ++++++++++++++
>  include/dt-bindings/clock/omap5.h          |  3 ++
>  include/linux/platform_data/ti-sysc.h      |  1 +
>  11 files changed, 174 insertions(+), 54 deletions(-)
>
> --
> 2.21.0
