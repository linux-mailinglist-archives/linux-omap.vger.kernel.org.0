Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DB6D722AB0C
	for <lists+linux-omap@lfdr.de>; Thu, 23 Jul 2020 10:50:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725911AbgGWIu2 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 23 Jul 2020 04:50:28 -0400
Received: from mout.kundenserver.de ([212.227.17.10]:49429 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725858AbgGWIu2 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 23 Jul 2020 04:50:28 -0400
Received: from mail-qv1-f42.google.com ([209.85.219.42]) by
 mrelayeu.kundenserver.de (mreue107 [212.227.15.145]) with ESMTPSA (Nemesis)
 id 1MmkjY-1kiLLj2YwY-00jto9; Thu, 23 Jul 2020 10:50:25 +0200
Received: by mail-qv1-f42.google.com with SMTP id u15so943808qvx.7;
        Thu, 23 Jul 2020 01:50:25 -0700 (PDT)
X-Gm-Message-State: AOAM531Rp5KQWCifnKMRXE6KOuXw2mvqPcHZdAo7pZt5G8sSloWT3uX5
        RAjL5acwI3351CWEpbiXxo7m7Q7CDaOsd/ctOKU=
X-Google-Smtp-Source: ABdhPJx/8iMOoQeuagptb1XxDW3qWIfpAYP9JEOH9O/fasuWg4WHNOHmGUtLnKRpZtu6H/lGAICf6WUPWzlQb7/e0Ec=
X-Received: by 2002:a0c:f802:: with SMTP id r2mr3732657qvn.197.1595494224298;
 Thu, 23 Jul 2020 01:50:24 -0700 (PDT)
MIME-Version: 1.0
References: <20200723073744.13400-1-krzk@kernel.org> <20200723073744.13400-19-krzk@kernel.org>
In-Reply-To: <20200723073744.13400-19-krzk@kernel.org>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Thu, 23 Jul 2020 10:50:08 +0200
X-Gmail-Original-Message-ID: <CAK8P3a1TSTX9ATUuyWyqJ1xtd6GP13JM-RQkhGCi1BSTiM9X9A@mail.gmail.com>
Message-ID: <CAK8P3a1TSTX9ATUuyWyqJ1xtd6GP13JM-RQkhGCi1BSTiM9X9A@mail.gmail.com>
Subject: Re: [PATCH 18/23] memory: mtk-smi: Add argument to function definition
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
X-Provags-ID: V03:K1:T07cc0gP5MoCdz4PnvOZ2+zYhjo+pKqjdS96OLHkp0Rf4TM7IJu
 Q/tCYLBpxPRxMbLHIcNQA5VZX3/xfqvz+uT9XXvNceNTl1k+ibKjZw36RfLsp7jbRVSwkR0
 AByWy35dUQjYKho256fh1xHt6fWnPwcY/QS17QxCOEHViQIOaFnwm43CB8GDGH8+CazV4l0
 RNlEog4mlCixWq3CAaxgA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:TH6InGJ3QXE=:PZIapkJdtmFpYegJlc3fA6
 de/wssOUZJEKXOCfmgqYbZVe6ONzzebUWf6LiGtnzJ8QBhNV5W+K3sSN6YI9wrO5CUYd59TAj
 6OTfTnUj1zsbkST3Gm8u+wY3qp/IH0tYcH8x0tD/rXdUeVqPzhlkRi3hgtVN7fcxjjaEo2FTX
 gV/xzpxRRiookTaA6bgdp6nuv4nAtzttBP7snNOve89CUBOuQRbOEd6Z/U6ca98JS6KooqfoT
 N/zbDoUQL7d5DtTnmOnIdfHDODOTi28mebwEz8ukYNhIJFp3ZYTxqTqlosLyXTxYLdei29Aej
 jmdlpqO0KzNqzJkW+LyrGpXjxKlQrvtCg+MJByBU0/ksuYTzdlozOomfMVci2Ia9oS4E6Dml/
 UuR/iy+yp1y1nSbT7YAJAGHVWYOPnFYBT+ABp0skzDPGKljL/veyiT9QD7GYi6hqQum0sOreg
 hgQ1tlFFFi1NdnqqWQl3NFww1qUtr9rl8s7nIzEWh1M9/nQYKgaudCe4FR3/FurXtyQimZuZA
 LuzgvviqhvycnIdl2MBx6ZcLjJ5EKB4Z9wjkQoyKwHAvyzuNQ+qhjsnctdFmnnx3eGnMEkOUJ
 IdzEpny9BcioPSuJIf+mXrEOIAtXSjTtLTXnj9R6R58Igk89hYx3Sl/xmxlWtGg35XBanwyee
 iD8wnERBCLhOpuQamnOx/lsblFsUj1EEhXwmGEwr/yETnZLCk/HPxsjZEOOkaAYDJsT/Mkn0o
 hDb1ioeY0iKGU7NvrrxJ9p12exVZpp8bDz2brKMEiweVfRJsMUkIfGWbBVUZTv1q+P61z0AKV
 yt7RCnRs5zU2THcFM9ucYT+n8SzrvHI1jDnFEYY7xFGPr0SpAssd3KgJp7uNTTVr4d0S1++ij
 f59mG9GXKTJ1SDNEhgjZmgNA6dgGrChU2QW0WbCumf/gZeqI9hx5o2FlR28+ISTECxQRbB950
 1KMmeWQpOpVNt4Hl54CstM2vHL6/qktE2A2SGO4fL39iikFmnz6Np
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Thu, Jul 23, 2020 at 9:39 AM Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> Fix checkpatch warning:
>     WARNING: function definition argument 'struct device *' should also have an identifier name
>
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

Is this a bug in checkpatch? I don't see why it should warn about this,
as there is no function definition here.

Your change is clearly harmless, but I wonder if we should fix
checkpatch instead.

      Arnd

> ---
>  drivers/memory/mtk-smi.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/memory/mtk-smi.c b/drivers/memory/mtk-smi.c
> index 109c7e51d551..c21262502581 100644
> --- a/drivers/memory/mtk-smi.c
> +++ b/drivers/memory/mtk-smi.c
> @@ -60,7 +60,7 @@ struct mtk_smi_common_plat {
>
>  struct mtk_smi_larb_gen {
>         int port_in_larb[MTK_LARB_NR_MAX + 1];
> -       void (*config_port)(struct device *);
> +       void (*config_port)(struct device *dev);
>         unsigned int                    larb_direct_to_common_mask;
>         bool                            has_gals;
>  };
> --
> 2.17.1
>
