Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E6DDEE0C9
	for <lists+linux-omap@lfdr.de>; Mon, 29 Apr 2019 12:45:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727973AbfD2Kpu (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 29 Apr 2019 06:45:50 -0400
Received: from mail-vs1-f68.google.com ([209.85.217.68]:36568 "EHLO
        mail-vs1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727918AbfD2Kpu (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 29 Apr 2019 06:45:50 -0400
Received: by mail-vs1-f68.google.com with SMTP id x78so3170823vsc.3
        for <linux-omap@vger.kernel.org>; Mon, 29 Apr 2019 03:45:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=et/npkNIorgdGot5d1HzokiqbJQ8Gh0K1joI75MNIac=;
        b=Ve1WNkIDse3QBHPps/fmIJd/CV4T/lN9ZDCLtrDRz2/FYapa1OSvfd+q1Ab83gaBGC
         tlEW+igfO+o6mPm8YpQJ0yXbyaLebs9DrjAvAn2FNqIVG5Igf8P3hAKC69MhVyLABIia
         urCSnsmNn6IFB8lzcOMdodV+X3/51W3zP8TgU7B4A2WWr/eHKIYBgpAjh/jwmB7BMPrE
         6w2shdOKowd7Tq7MXLxFs0UqfxFhvOqWpvx0mLqU/QwD+YFIelM5nSlLa6H392Un9sOu
         kswbsj3IxaYpdBHjkfvojMFKtcNYXojheCI3mD0lv3gjj8mfT7wtmHjCjTNrn1HvqFYj
         uQDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=et/npkNIorgdGot5d1HzokiqbJQ8Gh0K1joI75MNIac=;
        b=TWeDGpXjNDjUCM7lqu8lK94v5Nt4gcf2u1bhvQ7BthicbMMK7Esgq+aK+gRO+8vJsy
         f05zGunI81GbgnUD73nxaOzh+Yr4LWg4VrdMSnYAMshJiSTFPocqHDYwlhEXBDJMxfvj
         boQWPVr9enLN0xRvDjMrTJoiT2XWuJlGDATrPLmGHebtwVxh0j8YAb03DQMDXqCR78M4
         jEC5cekg/hjcnkc0KkavBY9D/ZSpd6idHTbKHcRpqjX8p4Jb/cslJMaB3yP6Mlhn7dxO
         cgrXoTkhwdri4XYQ32+qu5Kd3qyaSGoipHMjIGxrQWBVPeVmoAU4LPDMQSfSHtpSzgVW
         nzhQ==
X-Gm-Message-State: APjAAAVNNsm41Yg7Ivg0A4v4j7D17Q+dCmq29ynMQbSMXn++wg1OglAA
        XNv9SfIONluy+nz5Z5+VGe3OE8Rb5P6AyWI7CVlFwA==
X-Google-Smtp-Source: APXvYqwr48nNxbRl4UcxozHPOr0f1masNE7VzrVR1EAH7p0Q7CQLtQ3Fjw8j31KkI9cyZtQG8CHoAh8DWG47/0o986Q=
X-Received: by 2002:a67:ec03:: with SMTP id d3mr32154639vso.165.1556534749192;
 Mon, 29 Apr 2019 03:45:49 -0700 (PDT)
MIME-Version: 1.0
References: <20190423075020.173734-1-wangkefeng.wang@huawei.com> <20190423075020.173734-18-wangkefeng.wang@huawei.com>
In-Reply-To: <20190423075020.173734-18-wangkefeng.wang@huawei.com>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Mon, 29 Apr 2019 12:45:13 +0200
Message-ID: <CAPDyKFoQ07RF00aKc+G8OTtvwP+ret8XFRa6d5kEQKbDbzwEHQ@mail.gmail.com>
Subject: Re: [PATCH next 17/25] mmc: omap_hsmmc: Use dev_get_drvdata()
To:     Kefeng Wang <wangkefeng.wang@huawei.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        linux-omap <linux-omap@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Tue, 23 Apr 2019 at 09:40, Kefeng Wang <wangkefeng.wang@huawei.com> wrote:
>
> Using dev_get_drvdata directly.
>
> Cc: Ulf Hansson <ulf.hansson@linaro.org>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: linux-mmc@vger.kernel.org
> Cc: linux-omap@vger.kernel.org
> Signed-off-by: Kefeng Wang <wangkefeng.wang@huawei.com>

Applied for next, thanks!

Kind regards
Uffe


> ---
>  drivers/mmc/host/omap_hsmmc.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/mmc/host/omap_hsmmc.c b/drivers/mmc/host/omap_hsmmc.c
> index 29a1ddaa7466..952fa4063ff8 100644
> --- a/drivers/mmc/host/omap_hsmmc.c
> +++ b/drivers/mmc/host/omap_hsmmc.c
> @@ -2077,7 +2077,7 @@ static int omap_hsmmc_runtime_suspend(struct device *dev)
>         unsigned long flags;
>         int ret = 0;
>
> -       host = platform_get_drvdata(to_platform_device(dev));
> +       host = dev_get_drvdata(dev);
>         omap_hsmmc_context_save(host);
>         dev_dbg(dev, "disabled\n");
>
> @@ -2118,7 +2118,7 @@ static int omap_hsmmc_runtime_resume(struct device *dev)
>         struct omap_hsmmc_host *host;
>         unsigned long flags;
>
> -       host = platform_get_drvdata(to_platform_device(dev));
> +       host = dev_get_drvdata(dev);
>         omap_hsmmc_context_restore(host);
>         dev_dbg(dev, "enabled\n");
>
> --
> 2.20.1
>
