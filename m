Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 75BB722C711
	for <lists+linux-omap@lfdr.de>; Fri, 24 Jul 2020 15:51:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726567AbgGXNvY (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 24 Jul 2020 09:51:24 -0400
Received: from mout.kundenserver.de ([212.227.17.24]:60513 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726326AbgGXNvY (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 24 Jul 2020 09:51:24 -0400
Received: from mail-qk1-f173.google.com ([209.85.222.173]) by
 mrelayeu.kundenserver.de (mreue109 [212.227.15.145]) with ESMTPSA (Nemesis)
 id 1MMXYH-1kHJdd0H4B-00Jcus; Fri, 24 Jul 2020 15:51:22 +0200
Received: by mail-qk1-f173.google.com with SMTP id l23so8665291qkk.0;
        Fri, 24 Jul 2020 06:51:21 -0700 (PDT)
X-Gm-Message-State: AOAM532LD8Ig3/gFZ7hE+WwRTfGWCAJkfuPgKmX+zKtvUYXork1IdoPM
        x0yoKEosS+9RIBuz9unmaBMmLBCIhuOHL9CzpqU=
X-Google-Smtp-Source: ABdhPJxjGVar32Mo4zyo7czqW6vHPwVJvr9ZZ1aqSE80mAP36DQF09IVdxgsaflYW8FpBItG+23osrBEpNeTs3oF6bs=
X-Received: by 2002:a05:620a:1654:: with SMTP id c20mr10549815qko.138.1595598680633;
 Fri, 24 Jul 2020 06:51:20 -0700 (PDT)
MIME-Version: 1.0
References: <20200724074038.5597-1-krzk@kernel.org>
In-Reply-To: <20200724074038.5597-1-krzk@kernel.org>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Fri, 24 Jul 2020 15:51:04 +0200
X-Gmail-Original-Message-ID: <CAK8P3a2EAm=pxkU-AiucgDQyoMEGFOGqQBkVacWjoT7O9-PHkA@mail.gmail.com>
Message-ID: <CAK8P3a2EAm=pxkU-AiucgDQyoMEGFOGqQBkVacWjoT7O9-PHkA@mail.gmail.com>
Subject: Re: [PATCH v2 00/29] *memory: Cleanup, improve and compile test
 memory drivers
To:     Krzysztof Kozlowski <krzk@kernel.org>
Cc:     Olof Johansson <olof@lixom.net>,
        Markus Mayer <mmayer@broadcom.com>,
        bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Roger Quadros <rogerq@ti.com>,
        Tony Lindgren <tony@atomide.com>,
        Vladimir Zapolskiy <vz@mleia.com>,
        Kukjin Kim <kgene@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "moderated list:ARM/Mediatek SoC..." 
        <linux-mediatek@lists.infradead.org>,
        linux-omap <linux-omap@vger.kernel.org>,
        "moderated list:ARM/SAMSUNG EXYNOS ARM ARCHITECTURES" 
        <linux-samsung-soc@vger.kernel.org>,
        "open list:TEGRA ARCHITECTURE SUPPORT" <linux-tegra@vger.kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Linus Torvalds <torvalds@linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:h51Bmr1YHWGzwbAcnkPPXOC7mTatte8E3oICeOrVD0Zn7jFR5fq
 wLQRyHhkEnG1tNZyehnPejPrRp66/DYwgv/1aROiZjUiiUrAH0AxkD21kOsBnhNzcb+TC2I
 CKxaxack11yO1xF35x3hN4cCH/kFUZ+ByqC0aUNRwBa8GHfzEbPTrZT7e+MvqYTXVvgp+8m
 aALgZgv2a//NSTOUJVuxA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:7t60lDTIdmw=:sEwCTV+kQVemdBbngfGotN
 eSagtz54ty7m6n+reBGgGZ4x+XanhdadHZzz8NuL26Bky9qbCJ7ZWq7/tmTrqJvOITg0+3wfX
 qEMiuciIYJ1rFkf6wCbvPrNdy7pDbZ3dkdjfkFAGDjyGCyBkbIYVzn4vhFoWjGyWMWsCJ4KoT
 hD7vsMJHSli5gpmCgcms7C2SODw/gtucKK2X+m/GbCm/erEZqzs04rw5W9bH69OLiNjivNSCR
 DmtyrYuCZpxLn0/tCj/Rr5N0AwNpzFaQh/Q0vA1X5FogAyPDWog2KwKAgLtXAipqgtSpwabKF
 86q0MqLYDGXq82PPUnoP3RTnxmXk99JFBIYqrXDrVYHm3tPTXHGWtXUwlZtc+Jq2tdLnMAqC8
 8UoeM3BmONMNDYbiKcuywOij5JQQNqaPFeiHqIeYwyM/dy1AK6MGAoqXAIwfkTBV6Qcr7ZmGq
 ulvx0n85to0zkjnkswzrgui0pieFl3auYyris34g+XR7ui9OJGlIwGzf4sijdlGOvUv06WQtc
 GtLGxPcd++lvYha++vMhAhTEmdb2wGo3MhxSHz2F5NzaDGA0W151TprBLRomXyv36G5AFhSlV
 pRYFIPsroUbiRRedibZ3e0RBD3Xt7NcWEk0HXwR3fqgtzhPaM8o7KTxiobkGl7NxGjecHZNMq
 Dm6nmAbzqkvN6ZWF7QUAt9YUW3kMNY7PTsE7oyXjI4wn3yqabKSbM39QS6BQ9EAl7W3A7FEZt
 IHmpUfmoHPjb9SKeWZq8nOUCuZ2D+6NAi6HayAVzveLpyU1o72OrOftmQHXeWjYpr57GtG5Lt
 fWlxmRffwogbmRHoWoAxxWa1iHam7bKP5Sh/cAst/2evP7s746901DQ/+syzTo3JrySeIrQ72
 iaMhnZklTYzx05FD6K8T2xZ0vzlrs/60O2vpY7hpoPN2+X6H1hdZ1b9zFiuIURYc9VApN8GuF
 H/H4vFBWxaHzmYBLu+OnOsdExDStmsGyO0tSSLiL3Y0+AWS7QDL/w
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Fri, Jul 24, 2020 at 9:41 AM Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> Dear All,
>
> Changes since v1:
> 1. Few new patches,
> 2. Please see individual logs (per patch).
>
>
> The drivers/memory directory contains generic code (of_memory.c) and a
> bunch of drivers.  Changes to generic code were coming usually through
> different trees with the driver code.
>
> Over last days, memory drivers grew in numbers but not necessarily in
> quality.  They lacked compile testing and code cleanup.  Also lacked
> maintainer.
>
> I would be happy to take care about this part.
>
> If there are no objections, I will collect the patches and push them
> through arm-soc maintainers.
>
> Driver-specific changes in the patchset were only compile-tested. Tests
> are welcome. The generic code was tested on ARMv7 Exynos based boards
> with a exynos5422-dmc memory controller driver.

Looks all good. Can you send a pull request for the patches that you don't
expect to need testing for, while you still wait for more feedback on the
others?

As the merge window (and my vacation) is getting closer, I would like to
have most of the patches for v5.9 queued up.

       Arnd

     Arnd
