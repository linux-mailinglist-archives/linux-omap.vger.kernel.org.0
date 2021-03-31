Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9A3FA350684
	for <lists+linux-omap@lfdr.de>; Wed, 31 Mar 2021 20:39:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235082AbhCaSjB (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 31 Mar 2021 14:39:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43238 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234954AbhCaSig (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 31 Mar 2021 14:38:36 -0400
Received: from mail-yb1-xb30.google.com (mail-yb1-xb30.google.com [IPv6:2607:f8b0:4864:20::b30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E4BF6C061574
        for <linux-omap@vger.kernel.org>; Wed, 31 Mar 2021 11:38:35 -0700 (PDT)
Received: by mail-yb1-xb30.google.com with SMTP id a143so22204335ybg.7
        for <linux-omap@vger.kernel.org>; Wed, 31 Mar 2021 11:38:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=RWY5Pe06zt2bU2jfR3W/PawxYm+jRibge/Goph/Z0xs=;
        b=ud1HW0WQ3vUh38PWJL8PyMGpjBIGGa/ZguPjhdkbzDXLZE74jh9K0xBN22kHs7psgk
         j+lDbddU88SP9/fgVL3M3+ixFkubuxrXLEZxAX3vo8fR/Q4bGRIH2E159f+e4siYp0Dp
         TD2YuZcjPfP1/OlBsrdMT5g5WKI7IZbjPkV8X/OyyaebkyZJPH1uTlMBkstGJVh1Saur
         w0CRiCWjERInRLSGxsulIcXnbCqgxScEzIbuJyzIZYiCppBkNV5Wgq8soRQw5JqGA4sm
         CZtCXbq663UlJhbmclRR5eqzpWRapuHg5Po5iYyqV6+isVI4PuNsl6BPQXYdeRNWRSTQ
         D7ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=RWY5Pe06zt2bU2jfR3W/PawxYm+jRibge/Goph/Z0xs=;
        b=mD12GA5XAuIcdfiKK3DUzUZWwed1dtPH+ubHu5NHxO2EB1X+fqqpPTdTS8SuZPngTq
         s44c462OHLWlPn5Pq/AVOst2MMlx5L2pDdRLd7h23sM8uOXtIhjYAzF6aRxpawa5i7cc
         9p1rPsWUvU3eWAMF3sPH6v2iltVQ6w5OljI7FQnHv//ejeAW0jCP9bkNGk/ZPiczLm8Y
         QUNEJOGgYvGCAEa7XCfNPU4gzK5EJkMyKa4iphtbs2Eav1uSkoNIjAJcH4zqdFA5OAKO
         1zqHibZGONrVQDXFBSnEEKVgPkiVhAWJ/VRRZXOHN3p+BPIPxy4HemgNHCFTHM7qoKA4
         V+Fg==
X-Gm-Message-State: AOAM531H4qUft8Z+i8960oEV8JJwY5C4T5rEGrmxBnUxS+m1zugwheut
        W8ZMirEEPqQrnqVq4cINhvAzZz1a4M6STsmYg81i+g==
X-Google-Smtp-Source: ABdhPJxJ2cvrf4j6fkPrKxlYe8FbVw14ABDzGRChRLHDLEfcPpZap+TuKWL3vFDdxySIaNCzr2pENpUgcaCBgmSDVBY=
X-Received: by 2002:a25:d10b:: with SMTP id i11mr7124969ybg.0.1617215915309;
 Wed, 31 Mar 2021 11:38:35 -0700 (PDT)
MIME-Version: 1.0
References: <1617178751-18937-1-git-send-email-tiantao6@hisilicon.com>
In-Reply-To: <1617178751-18937-1-git-send-email-tiantao6@hisilicon.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Wed, 31 Mar 2021 20:38:24 +0200
Message-ID: <CAMpxmJXxgh_YuHUmJUTBQJTYUdw54y2E+R+UxqsV56Ouj+eF3g@mail.gmail.com>
Subject: Re: [PATCH v2] gpio: omap: Use device_get_match_data() helper
To:     Tian Tao <tiantao6@hisilicon.com>
Cc:     Grygorii Strashko <grygorii.strashko@ti.com>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        Kevin Hilman <khilman@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Linux-OMAP <linux-omap@vger.kernel.org>,
        linux-gpio <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Wed, Mar 31, 2021 at 10:18 AM Tian Tao <tiantao6@hisilicon.com> wrote:
>
> Use the device_get_match_data() helper instead of open coding.
>
> Signed-off-by: Tian Tao <tiantao6@hisilicon.com>
> ---
>
> v2: drop the space between ? and :.
> ---
>  drivers/gpio/gpio-omap.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpio/gpio-omap.c b/drivers/gpio/gpio-omap.c
> index 41952bb..f4df555 100644
> --- a/drivers/gpio/gpio-omap.c
> +++ b/drivers/gpio/gpio-omap.c
> @@ -1364,15 +1364,14 @@ static int omap_gpio_probe(struct platform_device *pdev)
>  {
>         struct device *dev = &pdev->dev;
>         struct device_node *node = dev->of_node;
> -       const struct of_device_id *match;
>         const struct omap_gpio_platform_data *pdata;
>         struct gpio_bank *bank;
>         struct irq_chip *irqc;
>         int ret;
>
> -       match = of_match_device(of_match_ptr(omap_gpio_match), dev);
> +       pdata = device_get_match_data(dev);
>
> -       pdata = match ? match->data : dev_get_platdata(dev);
> +       pdata = pdata ?: dev_get_platdata(dev);
>         if (!pdata)
>                 return -EINVAL;
>
> --
> 2.7.4
>

Applied, thanks!

Bartosz
