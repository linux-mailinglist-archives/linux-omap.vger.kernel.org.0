Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6684641E72
	for <lists+linux-omap@lfdr.de>; Wed, 12 Jun 2019 09:58:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2436731AbfFLH56 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 12 Jun 2019 03:57:58 -0400
Received: from mail-lj1-f170.google.com ([209.85.208.170]:43743 "EHLO
        mail-lj1-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2436726AbfFLH56 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 12 Jun 2019 03:57:58 -0400
Received: by mail-lj1-f170.google.com with SMTP id 16so14206494ljv.10
        for <linux-omap@vger.kernel.org>; Wed, 12 Jun 2019 00:57:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=hu5mYy1Aik4aGPpt9uX6kLLpSvEpnab82Qz7EMOsZ3s=;
        b=W1Zi7sy9qLC8jVk3nI8TRNpGFhYFOg7/lKaQRrKAONX2MyAFj2Lxo/XZLD7w9L9J7G
         4HYzdvdsUG1/nA6PskBT2Pr7ZmrNoSE/oO7BZSxQg0QizW2L9D2Ggzgd2EO6fVqvIE1L
         zKWQOcKKgkm5x997Hyd3bJaqGq8QHPX1IVzJy9BU19gJUn4CtAijTcv4GDZm/PKjp/q+
         M0GG5oMeL0QsLX/oHElAhFI1DN1MWe+Xe7KcLbp9lLt3IgDbDZXdaZz1wuIs1rwn41Rg
         GwxUnKxkTbajCy/iDW6NUVvfR37huqzvfE4N+QRN73y1wWkSrzq4SWgd5sRV/NMwzdtE
         6pFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=hu5mYy1Aik4aGPpt9uX6kLLpSvEpnab82Qz7EMOsZ3s=;
        b=HRLJ7VtQasj/h4DSc1Mavhk8iWmo+95RI+ZdAhEmivdVzjgTPVkqB+eCxPcT7yi0Xa
         VC/b6trPk53tNLAD1evlgtE5Ph0GbhXPcrXQfSCaiH3+ZcwnrNzAgVIrTIv+fUql2dnE
         4wISqXkP/dGfwhkZ1JeOVrZnvXfPGA2RxdCeSG1xifzAx102fkEBmzY3qhK0JZdTsxGB
         m8XogYh9OohmRYWloeQB4y3trXngrKMMw/myFNPsEE1FenKZzNmomnqK8N2Jw422pnVx
         3lKa7QEiWE90nKWCDICNaQuVc9go5rh8UxHjAE3mbXvKhc89pFqz8PkjaoYzqX99aK2b
         B95A==
X-Gm-Message-State: APjAAAVwLC+F+kVsfKNl+Y2D2vOGK95dLL5a1r3yHiMSYe2676yX2bab
        8RJalWgznSrKmWrZ/a3wMMGDxtw3YCxppqqYdqlobA==
X-Google-Smtp-Source: APXvYqxl+ZtAXPoKQZGqWkavmG+pD5XFEpR1tkG2C7EK7lnCxHlD6+0qWESpsMmznMtDhMWnyXc7r0iAy9Bqcf/Y/90=
X-Received: by 2002:a2e:9753:: with SMTP id f19mr3842459ljj.113.1560326276665;
 Wed, 12 Jun 2019 00:57:56 -0700 (PDT)
MIME-Version: 1.0
References: <20190610171103.30903-1-grygorii.strashko@ti.com> <20190610171103.30903-5-grygorii.strashko@ti.com>
In-Reply-To: <20190610171103.30903-5-grygorii.strashko@ti.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 12 Jun 2019 09:57:45 +0200
Message-ID: <CACRpkdZ2o1AP4YdbNqS7BjHZzpgfpMLSM8GeXNWFPdJ8_C0shQ@mail.gmail.com>
Subject: Re: [PATCH-next 04/20] gpio: gpio-omap: clean up edge interrupt handling
To:     Grygorii Strashko <grygorii.strashko@ti.com>
Cc:     Russell King <rmk@arm.linux.org.uk>,
        Tony Lindgren <tony@atomide.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linux-OMAP <linux-omap@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        Russell King <rmk+kernel@armlinux.org.uk>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Mon, Jun 10, 2019 at 7:11 PM Grygorii Strashko
<grygorii.strashko@ti.com> wrote:

> From: Russell King <rmk+kernel@armlinux.org.uk>
>
> The edge interrupt handling was effectively:
>
>         isr = ISR_reg & enabled;
>         if (bank->level_mask)
>                 level_mask = bank->level_mask & enabled;
>         else
>                 level_mask = 0;
>
>         edge = isr & ~level_mask;
>
> When bank->level_mask is zero, level_mask will be computed as zero
> anyway, so the if() statement is redundant.  We are then left with:
>
>         isr = ISR_reg & enabled;
>         level_mask = bank->level_mask & enabled;
>         edge = isr & ~level_mask;
>
> This can be simplified further to:
>
>         isr = ISR_reg & enabled;
>         edge = isr & ~bank->level_mask;
>
> since the second mask with 'enabled' is redundant.
>
> Improve the associated comment as well.
>
> Signed-off-by: Russell King <rmk+kernel@armlinux.org.uk>
> Signed-off-by: Grygorii Strashko <grygorii.strashko@ti.com>

Patch applied.

Yours,
Linus Walleij
