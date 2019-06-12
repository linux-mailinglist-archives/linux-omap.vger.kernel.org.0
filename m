Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4073341FB8
	for <lists+linux-omap@lfdr.de>; Wed, 12 Jun 2019 10:52:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2436688AbfFLIwC (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 12 Jun 2019 04:52:02 -0400
Received: from mail-lf1-f47.google.com ([209.85.167.47]:44463 "EHLO
        mail-lf1-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731164AbfFLIwC (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 12 Jun 2019 04:52:02 -0400
Received: by mail-lf1-f47.google.com with SMTP id r15so11429049lfm.11
        for <linux-omap@vger.kernel.org>; Wed, 12 Jun 2019 01:52:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=bvnEwm7NrmJqxKF1DLKlWHS86ykeGU7LMVuI1wlnXfM=;
        b=nvQx/XwkGBISeAxB7a9NU6MmYROO/n7mGr7NTsoQWdsqa5EtyR4BTyqSECTPNLgVw3
         JEQGmqmpU5NJ665xaxRV2ccWfHlGn0AKreA5k+leMyxvZ8lun2y6Jf7jrdhfqENyPXA7
         zozU2ReuZLPlDrxOQNNm/pPVtx6Df1DiMjKyRd6ITEFN2Gmr/j1vt7CrY2labmr3iFfQ
         +YIALfWDLtB1kVULQGxyBFwp+bfpJwj1g6xW3P4gbUiW8wl0NZ2xbwePnsva5z+1O8Gi
         juWx2VxQvQfiasvNM7ot+oE9dHV9u+NBIq1NNTV4ByGK+XgggTKNnEWjhhVYfDtbdSxL
         2iKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=bvnEwm7NrmJqxKF1DLKlWHS86ykeGU7LMVuI1wlnXfM=;
        b=GxvvPeatQyRmHJkS7npA4J6MZmuyDqFQTxsocE7MPvja3cvnyrL43FgHfqLg5wrAPR
         V2BG3wGPzZ1nuhOVz25ZAHkRGxkRgDM/E3RkGN+dhVKCymQrO6Pc/UyTkWlajlmr+4Wp
         BFBn/jXk2OHIIskCVS+DEXP+GNzAwTtC9zKXx50CfpMuSDlbf/y0OyyMHjmztg/6KnSK
         G4rC7PwPZhSIF6TUITstV/XPoAC/QixkxEVyCXjty+EEEkMmPBRwyhNNkIrTQ5+BQLNb
         PL6hB7Lry8nlGY8HoJ1q8KzEJ3Xl9+iz1bW7z51rhtg7EOIfPxpiqotEOvkWTW6P1UXi
         0wIQ==
X-Gm-Message-State: APjAAAVF1fHHz8BmAGJmQ9zgv2Ko5VSB7RICEp3gO+AZot9DR1Zf2h2U
        XHSsWrk3/3OA7LhCx6S2Hu4D4MYIirjty/7VJ0rq8Q==
X-Google-Smtp-Source: APXvYqwU/lJWV35YphHgwrB/OkNmwKon6VRJi5Gu4EcAkblIAF9yMwvQMCgoqcIq46RrdC7A0lWiAGgfzI2AiovDU7g=
X-Received: by 2002:a19:dc0d:: with SMTP id t13mr16890333lfg.152.1560329520422;
 Wed, 12 Jun 2019 01:52:00 -0700 (PDT)
MIME-Version: 1.0
References: <20190610171103.30903-1-grygorii.strashko@ti.com> <20190610171103.30903-11-grygorii.strashko@ti.com>
In-Reply-To: <20190610171103.30903-11-grygorii.strashko@ti.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 12 Jun 2019 10:51:49 +0200
Message-ID: <CACRpkdYCiPRPM7evyZsL2jvsfiAYZ36fL1PRjoG7a0jvduqpwQ@mail.gmail.com>
Subject: Re: [PATCH-next 10/20] gpio: gpio-omap: simplify set_multiple()
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

On Mon, Jun 10, 2019 at 7:12 PM Grygorii Strashko
<grygorii.strashko@ti.com> wrote:

> From: Russell King <rmk+kernel@armlinux.org.uk>
>
> One of the reasons for set_multiple() to exist is to allow multiple
> GPIOs on the same chip to be changed simultaneously - see commit
> 5f42424354f5 ("gpiolib: allow simultaneous setting of multiple GPIO
> outputs"):
>
>  - Simultaneous glitch-free setting of multiple pins on any kind of
>    parallel bus attached to GPIOs provided they all reside on the
>    same chip and bank.
>
> In order for this to work, we should not use the atomic set/clear
> registers, but instead read-modify-write the dataout register.  We
> already take the spinlock to ensure that happens atomically, so
> move the code into the set_multiple() function and kill the two
> helper functions.
>
> Signed-off-by: Russell King <rmk+kernel@armlinux.org.uk>
> Signed-off-by: Grygorii Strashko <grygorii.strashko@ti.com>

Patch applied.

Yours,
Linus Walleij
