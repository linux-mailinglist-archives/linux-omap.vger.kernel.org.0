Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4B22C22AB07
	for <lists+linux-omap@lfdr.de>; Thu, 23 Jul 2020 10:48:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725984AbgGWIsj (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 23 Jul 2020 04:48:39 -0400
Received: from mout.kundenserver.de ([217.72.192.74]:48793 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725858AbgGWIsj (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 23 Jul 2020 04:48:39 -0400
Received: from mail-qt1-f170.google.com ([209.85.160.170]) by
 mrelayeu.kundenserver.de (mreue109 [212.227.15.145]) with ESMTPSA (Nemesis)
 id 1M26j1-1jw3001ocL-002Vg4; Thu, 23 Jul 2020 10:48:37 +0200
Received: by mail-qt1-f170.google.com with SMTP id g13so3825819qtv.8;
        Thu, 23 Jul 2020 01:48:36 -0700 (PDT)
X-Gm-Message-State: AOAM533aGWhguCG5PSiUop/l0ctsz8XgtQ7xBEJz99U5c+YELmqxVwTi
        OCiiEKhHVxT0rV84rqz8dUdVW/JwyUosNlAuG7I=
X-Google-Smtp-Source: ABdhPJxIKTuSteato6jqyke4C3qQizgz+kXKWTXrT7ek9BY4C2QafHHN8TpUaT0zIkV/nhaSrqqklNABRKQujZiGvQw=
X-Received: by 2002:ac8:4507:: with SMTP id q7mr3191244qtn.142.1595494116048;
 Thu, 23 Jul 2020 01:48:36 -0700 (PDT)
MIME-Version: 1.0
References: <20200723073744.13400-1-krzk@kernel.org> <20200723073744.13400-15-krzk@kernel.org>
In-Reply-To: <20200723073744.13400-15-krzk@kernel.org>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Thu, 23 Jul 2020 10:48:19 +0200
X-Gmail-Original-Message-ID: <CAK8P3a3btGD5oqmPXJk=UOmA=wuUxn-vOOO982uAjuRcE3crVg@mail.gmail.com>
Message-ID: <CAK8P3a3btGD5oqmPXJk=UOmA=wuUxn-vOOO982uAjuRcE3crVg@mail.gmail.com>
Subject: Re: [PATCH 14/23] memory: ti-emif-pm: Fix cast to iomem pointer
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
X-Provags-ID: V03:K1:/K8Y20hLrBrDKyuJdCUFgVwsjFFbohfIk0S0FkDYk1TJEh+70RC
 F3/IHpQF9wuJdL5gIpCKDKB+BriZzmSaBFvpMLSZmDRQ6yZ3RZ0eZ28mEL/IRYCb7EnJSxp
 sgW7+2FKBixJjPbTi6bbVvG5q7mptTl4JVozHQDgGpZ7zoU2i0hlpU6hJK2nHuIehMr+3iL
 eQ7KWAF4YE/LssGsmFWHg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:I32rgHI3Xik=:4MvWuDot9zVhp4EQvz+jJe
 5meCbLxb9kLH7prDZrmrMwr0HEtCtMlXfBCfZuVuaf7qx4vQGwv7dy1nFLwTlkuYi3EmUIek6
 mIK8NSl97BC87oFUrDqjSda/1usafxiJFHuPS3rwzJ6QgllTL+E0DxU4d9yNx90T46je3zqDG
 f263diTyFSsWJPa63g6t3Hg5hg088MUUj3RyyTndISQuG7Z+psKjcIGB8gQnMxsRSvOROEeuR
 GJKNE0Xazf0pJzGXvz6DGxYSPl29G34e3eOKUjhs4dxtvTdwPra/Lzek+469bL5UaJJuNpLFK
 GCA307vC/NG78jKO6xsqPc/DInDWwap76duVrNPoCJVkRjevpF3L4Kecxzo3SQr9+Z7TjFbrZ
 ChgJEuLQ4FVVVv15b+y3xhzy5IpRZaanK6/2FydeUiISXvNL641kqoeBtq1xB9nkPThJoQ5Bf
 MpAVoGkkb8y+hi5nKbg7T1GDd1YrFvn3GPzVZmwfwWjubPxSQlSBxovjhebbpDyLYsmEru7UQ
 //Qa5DZsFAB7D1/4teDLZL2MFAU/guEv+O46yx7LbnASOFoq32o2Q/c3dPM5JXbaXo3qCVtFt
 +U5jcUUhWN1D/qLwuatLBFFlvfPrlhQ2tR4iIvE7WGOwQtfUJea7PmY0J0pevCA16jM2WPF23
 wjr4rWioIGKw8B7ZsrcPVFjLa76sAT2NtHZjBvKbuqJD6h9mOA9uJPvpMNelwGafcvtFDfy/F
 XD/OOB1u0ziDP4WJYfMNyTqc60MLMo83sn87OSB35CnBSAQi4BULj/+c2DYQhpTFX3iGvZpYy
 zxmVizTCQ5UQqPIB0x+IShYWyWzUHlocFUMiB2UPOCsJAulABuKhy8EnHudMuNedo3h0FaO
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Thu, Jul 23, 2020 at 9:39 AM Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> Cast pointer to iomem memory properly to fix sparse warning:
>
>     drivers/memory/ti-emif-pm.c:251:38: warning: incorrect type in argument 1 (different address spaces)
>     drivers/memory/ti-emif-pm.c:251:38:    expected void const volatile [noderef] __iomem *addr
>     drivers/memory/ti-emif-pm.c:251:38:    got void *
>
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---
>  drivers/memory/ti-emif-pm.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/memory/ti-emif-pm.c b/drivers/memory/ti-emif-pm.c
> index 9c90f815ad3a..6c747c1e98cb 100644
> --- a/drivers/memory/ti-emif-pm.c
> +++ b/drivers/memory/ti-emif-pm.c
> @@ -248,7 +248,7 @@ MODULE_DEVICE_TABLE(of, ti_emif_of_match);
>  static int ti_emif_resume(struct device *dev)
>  {
>         unsigned long tmp =
> -                       __raw_readl((void *)emif_instance->ti_emif_sram_virt);
> +                       __raw_readl((void __iomem *)emif_instance->ti_emif_sram_virt);
>

Maybe this shouldn't even be __raw_readl(), but instead READ_ONCE()?

The other accesses in this file don't use MMIO wrappers either but just treat
it as a pointer. The effect would be the same though.

      Arnd
