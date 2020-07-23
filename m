Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7BEC422ABC9
	for <lists+linux-omap@lfdr.de>; Thu, 23 Jul 2020 11:31:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727940AbgGWJbW (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 23 Jul 2020 05:31:22 -0400
Received: from mout.kundenserver.de ([217.72.192.73]:45559 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726177AbgGWJbW (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 23 Jul 2020 05:31:22 -0400
Received: from mail-qk1-f182.google.com ([209.85.222.182]) by
 mrelayeu.kundenserver.de (mreue108 [212.227.15.145]) with ESMTPSA (Nemesis)
 id 1Mj8iJ-1kUHxK3jCH-00f836; Thu, 23 Jul 2020 11:31:20 +0200
Received: by mail-qk1-f182.google.com with SMTP id 2so607145qkf.10;
        Thu, 23 Jul 2020 02:31:19 -0700 (PDT)
X-Gm-Message-State: AOAM531m6YSVcAVLPAhciE0ftVMoiBVgRqWccZ5f61GKJl+cTwlmGGR+
        oYi0gZYgTWdUEaTJYLaSLg9X9MkSoKNwBXwIErA=
X-Google-Smtp-Source: ABdhPJxJKdRsJa6yWByxQwxyQoyASSDoGeaJ3XhjqBQJAJYOQ5ZDK2hqTVqfgEw11DfZTk4S2OABG3feavWNTF9x3Gw=
X-Received: by 2002:a37:b484:: with SMTP id d126mr4153205qkf.394.1595496678583;
 Thu, 23 Jul 2020 02:31:18 -0700 (PDT)
MIME-Version: 1.0
References: <20200723073744.13400-1-krzk@kernel.org>
In-Reply-To: <20200723073744.13400-1-krzk@kernel.org>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Thu, 23 Jul 2020 11:31:02 +0200
X-Gmail-Original-Message-ID: <CAK8P3a0hcVhBbKCBDSZYXChmPpRVsEi_G6+oj5quC6uUiPeeiA@mail.gmail.com>
Message-ID: <CAK8P3a0hcVhBbKCBDSZYXChmPpRVsEi_G6+oj5quC6uUiPeeiA@mail.gmail.com>
Subject: Re: [RFC PATCH 00/23] memory: Cleanup, improve and compile test
 memory drivers
To:     Krzysztof Kozlowski <krzk@kernel.org>
Cc:     Olof Johansson <olof@lixom.net>, arm-soc <arm@kernel.org>,
        SoC Team <soc@kernel.org>, Markus Mayer <mmayer@broadcom.com>,
        bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Roger Quadros <rogerq@ti.com>,
        Tony Lindgren <tony@atomide.com>,
        Vladimir Zapolskiy <vz@mleia.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "moderated list:ARM/Mediatek SoC..." 
        <linux-mediatek@lists.infradead.org>,
        linux-omap <linux-omap@vger.kernel.org>,
        "open list:TEGRA ARCHITECTURE SUPPORT" <linux-tegra@vger.kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:xza7jWz1c8aPhmAtfydo55zMN6nXghvI+kIiSgoPURVQEC6YCGp
 DeWnirmVGuMOJzV9kAyXbcrzshzQf/Kf/PXeu0P/t6ssjnN76lje8N6OdfJB255AabbRGIL
 c7Ww/g1fXWkCyMMqZXJavAG9P2OOuOJbyq3V+/svM8FZJYtpJCDkvGvW41z3yX0QHUkI8PD
 fJlAte4vAXi9rcuTJCHjA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:n6Z7PsH2R04=:RKo8v0lVqvfYGT9lZUjbsp
 Tab1Qv6SKjM8kYsCxmFWSmMK/kUQ+HC/PHQN6Eekj+vlcq+nJ2kIUtkCdyducJwYYXMcX7W0K
 gUppSPBJktLXnaWm+ojRxpZp8ol0qrnDUW4UsiHSHxZTZuXS0B7zK12jtaAfjZ4ZDqzZWkB9l
 aHGIzK3COetLnsSIXFZhXh9l0Icl+5DsG4ZF2bSKGxDkzNgh0mtWPc5CQYQGEpcQMKvEM1QGM
 LEVzrXSUIB92V29Bjk1Hh7TCtNCtubCtIq9TW0ZI1dnBvcFVmN7eOgMsHHhGiJ/pQoMeWPwI5
 gDu9mBYvmnK7pTce6rI9EcOE9/0cX/Vqa3KqKS1CgFHiUiz2EC1WT3mUi/SuoRdQqQSqhTZ6g
 6TnpOB76WfTsHgYsLmZqgYWGwD+5boNP18gNuV4xTzpLNRTfXTiaqyzm4mEymLPFABMJjGwHW
 cey1EEiUk5Qun1NOWmGRLLhZ7mk9qit1UlpSJ5RNEfPemUOCiQR8J6MJtoTQNHJQQJmb3qpNh
 1uilts7hOKKkPCAfSbzGg3VKMyzirwKSYQtdNBIxdLJs/q0XtXTXfoc6i2d6rykYf4AyqXp07
 j36YUbuDnd/FI+ElVsXTcgpv/5qi3eVaRWj0X3bGmDoHX0wv6AVNuUhKCGCcdA7ZnzE7NyF3p
 CKrhopW5jYUWIApqWjVZRdVMnSsnXTfflG1xhW2weeoIztsqfwDldMVUcehmnUiUGaCLNhCGP
 ivROThRBIcWmjXpK/OYIuog8WL0sx4RkzuUypEnFqmPRi4H+hxIx0QlhsEcT3OqoNsk7CxUIt
 7lhZMMdzmnWo+/AoIn5WUPzZljwmXbaNJ/AsReTOLQ9974NpuMVMuWENYFg4SEndoBqu5eDLu
 6D1OFLv2qEx/G4muURSf+FP2G3kPzI+st+qUi8pb+4gjyp2t2ZJLH99tiKQTAcxGCuTT4eXhT
 vLLojN9DP59akORzI0iwWDLhrzJDrK52cAcXnYc/jwv1rHByWB+0A
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Thu, Jul 23, 2020 at 9:37 AM Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> Dear All,
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
> If there are no objections, the patches could go either to Linus or to
> arm-soc (most of drivers are ARM specific).
>
> Driver-specific changes in the patchset were only compile-tested. Tests
> are welcome. The generic code was tested on ARMv7 Exynos based boards
> with a exynos5422-dmc memory controller driver.

Overall this looks great, I had a look through the patches and commented
on the few things that seemed slightly odd though harmless.

Thanks for picking up the subsystem. How do you want to proceed
in the long run? I suppose you can send a pull request to soc@kernel.org
to be picked up for the coming merge window as the normal way, since
you are not yet listed as the maintained until the end of the series.

Afterwards you could either send the pull requests to Linus directly,
or send them to the soc team (or to Greg) as well, the way we handle
a couple of other subsystems like drivers/reset and drivers/tee that
usually only have a handful of patches per release.

     Arnd
