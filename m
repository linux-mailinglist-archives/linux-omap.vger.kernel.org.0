Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D425822C6F1
	for <lists+linux-omap@lfdr.de>; Fri, 24 Jul 2020 15:45:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726607AbgGXNp4 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 24 Jul 2020 09:45:56 -0400
Received: from mout.kundenserver.de ([212.227.126.135]:41219 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726235AbgGXNp4 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 24 Jul 2020 09:45:56 -0400
Received: from mail-qv1-f46.google.com ([209.85.219.46]) by
 mrelayeu.kundenserver.de (mreue010 [212.227.15.129]) with ESMTPSA (Nemesis)
 id 1MIdS1-1k4imt21Lh-00EaUk; Fri, 24 Jul 2020 15:45:54 +0200
Received: by mail-qv1-f46.google.com with SMTP id y11so1156506qvl.4;
        Fri, 24 Jul 2020 06:45:54 -0700 (PDT)
X-Gm-Message-State: AOAM530KOvLES40vz+Mtlbj1P8O/qulL2EQTSP6ecmbnfgk04I68s9fc
        YIxh7YfjmOAuLJVkAlzzjUcKRhgC3qCcZQ7uHKE=
X-Google-Smtp-Source: ABdhPJyEqdZ1Ds6rBzMmh7FhmiJq043DLd+gXjlj19IcD1ElA3GGqGC9iWVYViBP8To1mNjzEbIjhOKDCmec66ErY0E=
X-Received: by 2002:a0c:f802:: with SMTP id r2mr9798584qvn.197.1595598353111;
 Fri, 24 Jul 2020 06:45:53 -0700 (PDT)
MIME-Version: 1.0
References: <20200724074038.5597-1-krzk@kernel.org> <20200724074038.5597-6-krzk@kernel.org>
In-Reply-To: <20200724074038.5597-6-krzk@kernel.org>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Fri, 24 Jul 2020 15:45:37 +0200
X-Gmail-Original-Message-ID: <CAK8P3a0h3dMRH_wuGX5dZ5znnx+EHJKYwQeZ9aB7cFGudo6vmw@mail.gmail.com>
Message-ID: <CAK8P3a0h3dMRH_wuGX5dZ5znnx+EHJKYwQeZ9aB7cFGudo6vmw@mail.gmail.com>
Subject: Re: [PATCH v2 05/29] memory: jz4780-nemc: Do not enable by default on
 every compile test
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
X-Provags-ID: V03:K1:soHCVb3seYD56gHy/0SdQglapEtOH69xvweH3No/Ge7qobhcnyA
 QyP5hC+SvP4JLRYULNtEV08zE5B1rpsfVd1ZJyfamzHbRY7to3c6MHQuHMfGoft5MfoPTz/
 FwBdNnv91f8FpuqM4WKd8sJGH/7PIf76Gu5ZxWu3PgsaiN503W4HB66u97KTr7ZYCe3KYBf
 glBFGLHLMpXRgCoCnC78w==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:MC6hDKZPP8c=:lxsAByWiIwd7nLKBlXwA2h
 u2L1lzJkH1z9AbhW9pNwd1V9yjGEo9SoklbUN5xRi2eb+mF3bXUbtkhTUkrWs0fykQ7HrOnUH
 TG66nx+giyGuWwd0QSuK8pCbz7BDXpPM71bsGc97d8wqOEaYzxbbHdUGOoUShGZWT7M4Ciq7R
 P++efFKFNYIz4K+4lE3SjaepHtCGiy4GTWA5Mt4mUWzSHIpvOQ91vhkspZEnzHIsdRDl8JCm3
 1c5JJH5le2ZRKx2x++lpcl9vI4CLfYIXY8JiQlB8dTGXkajbkj4QqYmtg7V5jOIqrtmJqOFS+
 67MmBf9gSyWBn5iBoNCzZGCKZXqbQx5RSCIXO2z/I8ObHFww6+J+x/yMufpuELQ5K3wAoeK1T
 slpd+VmZid7iGYoUGf8D3fkKQH5g3VngNTlyFO1BtbtWODy/SeNQXcgdPUJC1sCiR00i+D/X5
 Ua3y3d9e9qMEDisPUYdUQCnMU/ZezBQ3ldnzLdl+C6bDfw+OobNbAiqSXcmaje7MbJ/Lybmuj
 NyiMqFVXDwlANDkgwZ3qBFTEE0JXBN/5rEkDDUABWUDzptopAbRoXcI4n3/J0I1m9n4/SxYAK
 ya0YyN+RLn77vh7tJz12q90LYzklq8WvD9lj3PTGvNaBiBl3/y7v8EYJozIEMKXo5sHGr985q
 B/u4wpIywaNsOcDFRKb+5+IH0s+/++b+Ug7aROataTg1RZjyGdNEieVg5AJAMXfgu+S3CBveh
 EFoNj0hIx++LxEguptHMNbGhTBkDJL8ZQJrNouyjy9m0/xEz5GGShjRHFVvcDMflrckox3znY
 /dZCBZx75JL4k7Lz45dZxW2pmZiRGX9MRD5cfnj88CWh4+bsW7uakVeONvAOJIMsQCq3Vqvme
 we7wzDEM2cCEuX0tCGjeDJxgy3FRB47XGrtV8jtmc9fNXs2FWwLFXv2iFMTv39wal32HyNNkn
 d8CTHC084LO5H7Gn9jtnAbyXxrC31y1pMIvN4/pxalvayw9lgEyZJ
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Fri, Jul 24, 2020 at 9:41 AM Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> When compile testing, enable the driver by default only on MIPS
> architecture.
>
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
>
> ---
>
> Changes since v1:
> 1. New patch
 @@ -141,7 +141,7 @@ config FSL_IFC
>
>  config JZ4780_NEMC
>         bool "Ingenic JZ4780 SoC NEMC driver"
> -       default y
> +       default y if MIPS
>         depends on MIPS || COMPILE_TEST


Actually I think this should be 'default MACH_INGENIC',
and probably also 'depends on MACH_INGENIC || COMPILE_TEST'.

     Arnd
