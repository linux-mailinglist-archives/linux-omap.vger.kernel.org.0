Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3482722AC42
	for <lists+linux-omap@lfdr.de>; Thu, 23 Jul 2020 12:14:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727916AbgGWKOn (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 23 Jul 2020 06:14:43 -0400
Received: from mout.kundenserver.de ([212.227.126.134]:51785 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727769AbgGWKOm (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 23 Jul 2020 06:14:42 -0400
Received: from mail-qk1-f174.google.com ([209.85.222.174]) by
 mrelayeu.kundenserver.de (mreue010 [212.227.15.129]) with ESMTPSA (Nemesis)
 id 1Mt7Pt-1kmwye0ZLd-00tXq9; Thu, 23 Jul 2020 12:14:41 +0200
Received: by mail-qk1-f174.google.com with SMTP id b79so4771078qkg.9;
        Thu, 23 Jul 2020 03:14:40 -0700 (PDT)
X-Gm-Message-State: AOAM532fGOpRT19s6+JgcY1n0IXeoxcWCRqivArxt+YM3tT8xje02JEw
        UPQMc/o0QNubPPfGaOYahyKIeUAHIYkNW+2rrHc=
X-Google-Smtp-Source: ABdhPJxAf+812MuVjcfu0XwRQWQnRGJhKuMoucN2dt9Q6NE0hzXxWnmvljuMU8/tZW5Ym6SImtgRoUMVG9dICDcl5Bc=
X-Received: by 2002:a37:9004:: with SMTP id s4mr4264475qkd.286.1595499279844;
 Thu, 23 Jul 2020 03:14:39 -0700 (PDT)
MIME-Version: 1.0
References: <20200723073744.13400-1-krzk@kernel.org> <CAK8P3a0hcVhBbKCBDSZYXChmPpRVsEi_G6+oj5quC6uUiPeeiA@mail.gmail.com>
 <20200723095209.GA30472@kozik-lap>
In-Reply-To: <20200723095209.GA30472@kozik-lap>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Thu, 23 Jul 2020 12:14:24 +0200
X-Gmail-Original-Message-ID: <CAK8P3a0g0k6e-STpqPS0S-wajxqS-M3DV+3UD=QFE7e-98J-og@mail.gmail.com>
Message-ID: <CAK8P3a0g0k6e-STpqPS0S-wajxqS-M3DV+3UD=QFE7e-98J-og@mail.gmail.com>
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
X-Provags-ID: V03:K1:mm6ugzMgTFJSARdpDf1u0ah3/h8EqCvIO7cjX34WhdJ2m2VlrOq
 Kyi/okZpILXsPUhnhgefIsPwcCQeiHl5Ccap+3XaCthEOq0A1KGLTmpoR/npq8DIQzSjE8a
 EGhIGNvNDQo43D9U7KJRVgwQEfNIoo9So/GO0oyIxYnetsNN+XIUohMZC8LEBjDQgpmkqZe
 yrSQJfHyqV8El1vgJnC9g==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:apjJuQlJE/E=:rzpOGNOjFDsKvOF6lffk82
 hqB//tv9z5zMKSYKj1FcbTPoDNfIGwq0wyrHUAobD0wnNCKo47RfEnVSILjng0nOHa3LCetOb
 arwFdnvw1KqlSgA6NZzarq1ymz4Sb8Xe7fxhoGaDsfAeqENQ+LbMpP1vZ2FX6RJdWWvAaOO1v
 7TJcz7SVTAWCdxBPxDsD4Zb3aqOvQvLXg1fVm9xtVAkK6IMDgRM24RtNeaa8d5quJl80Sg9nI
 HCVLuE9j3mnVV6CItrwEr725UnDbeIUZPKPHxi0tMJLMaU/5p+lGilV/gtykaAf8YWdAOQRLA
 cMh6wFTDmTCo+4l0tA8gUxQX43VSnyCcHHY1q2ZjQfL/pdxAev2jZzfbpCloAR73qVvlHhE1O
 OzfD2ZNUX/wEpVam9C3NCsH2mTVo+xUa4Py2hMqnpyTjZ0B0PyMZGqwQ4se2v1IRQ21LZbVwX
 qa5VdAY0NO63oFVqIdN3hkunfU+xl4Kv05NVVEWoKmCihXFpeezTwq///OyxbMVUWwCgA854r
 WmP5uKgkXZYMtDGAxOJg6hhKX0HkgtI99HIEW0LfB5ofXzWfmgUyJi8hocRf0L1aaYmVSP4ai
 GQZKX0+/4od/UoxKlYy2GRUPScVYUKaNQzAmxEIWdfRjmtlew/qyU4G5MYnDb6GEJ2MehDHQr
 /kPNShLTy7HfAFfARpJuYrIgLbOBxpxtkjY+BC1vHROHrV0MtbfM2zectksVteO6o+TSXcgiW
 uqsSFKWXGV3YcBrjmFmVS+SGPdTtSdiqaFT0OdoOhdc4XkjOkZg1MX4IY6zXf9iP49PnfuHNB
 wFLYRsZERYkyIkqwMQuGPjbm9x/PHen4pQWhUQuz57GrfIbeoEJxMEmLA5RBJ/lq4ta6OCJSy
 aoF9wtNFEregcjV14VyFLd2amjL9HTBwJp+BpPLEPsWG93IzVMQOjDwwUhGEjEdlb9Fc75/8t
 jn6u9nWs7j8/EWRSajAtxLaVeWLKTQk8DkpKaDfK9Cbw3MsIPEQBq
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Thu, Jul 23, 2020 at 11:52 AM Krzysztof Kozlowski <krzk@kernel.org> wrote:
> On Thu, Jul 23, 2020 at 11:31:02AM +0200, Arnd Bergmann wrote:
> > On Thu, Jul 23, 2020 at 9:37 AM Krzysztof Kozlowski <krzk@kernel.org> wrote:
> >
> > Afterwards you could either send the pull requests to Linus directly,
> > or send them to the soc team (or to Greg) as well, the way we handle
> > a couple of other subsystems like drivers/reset and drivers/tee that
> > usually only have a handful of patches per release.
>
> Most of the drivers are for ARM architecture so arm-soc seems like the
> way to do it.  However BT1_L2_CTL and JZ4780_NEMC are MIPS specific and
> maybe more would come in the future.  Are you fine taking them as well?

Yes, that's not a problem at all. Most other architectures are ramping down
anyway, both on the maintainership side and on newly supported hardware,
so we are picking those up where necessary. I also merged a couple of
drivers for the MIPS based Baikal SoCs recently.

     Arnd
