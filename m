Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B498324A3D9
	for <lists+linux-omap@lfdr.de>; Wed, 19 Aug 2020 18:16:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726735AbgHSQQy (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 19 Aug 2020 12:16:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38854 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726640AbgHSQQu (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 19 Aug 2020 12:16:50 -0400
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com [IPv6:2607:f8b0:4864:20::844])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C44FAC061383
        for <linux-omap@vger.kernel.org>; Wed, 19 Aug 2020 09:16:49 -0700 (PDT)
Received: by mail-qt1-x844.google.com with SMTP id e5so18179041qth.5
        for <linux-omap@vger.kernel.org>; Wed, 19 Aug 2020 09:16:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=gKC3JrltoHNCRRNe9rGPlKVLmajTZ2YTeYEO1e3K7/s=;
        b=lQ3oKpJkZKD3Bh2jO/uRZk/MX0WD4c9ClZTaDdOprZU2ZIXc2DidPmljk1Mm5/8Kux
         rT5VmLZiWkM2QkIV9+7f9l89lQSKHJQh8w+0d+pLze8zOvozLskdIpIQLDPXUXLjM6pg
         IS2iy1oKuqhxgEtguWoPiuQAKwQ6VCcUozgKp/RSmaK1ACWZby7M+c3ANTFjXLScgsnU
         dX/ndaq9QlVqMyOj5l5z1BQlNRj0174i8ci8ieGMpLqq5hmx8+S8UEacyU9ntTChVOIh
         pRyxihHv4zrOBbr72oRvLXhY86wnBxrnumE/Xbfc3POSu/X5xas5+OmrODq4QVl6anLx
         jFBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=gKC3JrltoHNCRRNe9rGPlKVLmajTZ2YTeYEO1e3K7/s=;
        b=cU25+wB4VhMr2emovRQQz7aaqt31FJEMJQAkD8zP2zvLZzeI2fgHlyipBIFPtfnXjB
         Va+g6iADEq35VxgI6aCgPbCwwOSpttxCy4T3dhG4bgkFh/paCFE14b9F7/2/RRDhn1YH
         cIt1irJs30rDXeP3QgIj2jo6KoewDsvMy4ron1GZKB5TNaPR3OnxRrFFKaHVMsBuxuXX
         BAJDAamktT8ASwoQkBaFdHQtGPv/hw3lnganOurXV5qrFW9iRrZ7aYKqjpbmUqzwklIQ
         FrONJ1nWt3miza77AnDYKpqc0+co/KunoM9/wDHRCZwPtjoCIwwBl/8v8s8+yXk0Ch0k
         gpVw==
X-Gm-Message-State: AOAM531mlrAknoD4VYu3GUiL+WsM29djHzRfcBQl8A1Zo4ZjdhVLsuJe
        /eX1ONQ6AJAvRkOPiW8A257YmnDmpTPNmtBFIt4afg==
X-Google-Smtp-Source: ABdhPJwit8P/uhJUwL9TQHT1GcKDdYhENtsdfmRxHGsqAEisZdJ4Hy2n76dCkvtPlynazhzg29s+cREq641riTwAYwM=
X-Received: by 2002:ac8:4e39:: with SMTP id d25mr22580262qtw.208.1597853808119;
 Wed, 19 Aug 2020 09:16:48 -0700 (PDT)
MIME-Version: 1.0
References: <20200819092445.15702-1-tony@atomide.com>
In-Reply-To: <20200819092445.15702-1-tony@atomide.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Wed, 19 Aug 2020 18:16:37 +0200
Message-ID: <CAMpxmJUUkq3442KRDxsTec6C6V+0_WFF1uzvsB216swSV7rSAg@mail.gmail.com>
Subject: Re: [PATCH] gpio: omap: Fix warnings if PM is disabled
To:     Tony Lindgren <tony@atomide.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        Linux-OMAP <linux-omap@vger.kernel.org>,
        arm-soc <linux-arm-kernel@lists.infradead.org>,
        Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Wed, Aug 19, 2020 at 11:24 AM Tony Lindgren <tony@atomide.com> wrote:
>
> Fix warnings for omap_gpio_resume and omap_gpio_suspend
> defined but not used when PM is disabled as noticed when
> doing make randconfig builds.
>
> Fixes: f02a03985d06 ("gpio: omap: Add missing PM ops for suspend")
> Cc: Arnd Bergmann <arnd@arndb.de>
> Signed-off-by: Tony Lindgren <tony@atomide.com>
> ---
>  drivers/gpio/gpio-omap.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpio/gpio-omap.c b/drivers/gpio/gpio-omap.c
> --- a/drivers/gpio/gpio-omap.c
> +++ b/drivers/gpio/gpio-omap.c
> @@ -1516,7 +1516,7 @@ static int __maybe_unused omap_gpio_runtime_resume(struct device *dev)
>         return 0;
>  }
>
> -static int omap_gpio_suspend(struct device *dev)
> +static int __maybe_unused omap_gpio_suspend(struct device *dev)
>  {
>         struct gpio_bank *bank = dev_get_drvdata(dev);
>
> @@ -1528,7 +1528,7 @@ static int omap_gpio_suspend(struct device *dev)
>         return omap_gpio_runtime_suspend(dev);
>  }
>
> -static int omap_gpio_resume(struct device *dev)
> +static int __maybe_unused omap_gpio_resume(struct device *dev)
>  {
>         struct gpio_bank *bank = dev_get_drvdata(dev);
>
> --
> 2.28.0

Applied for fixes, thanks!

Bartosz
