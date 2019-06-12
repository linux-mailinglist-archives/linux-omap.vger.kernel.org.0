Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B76FB41E53
	for <lists+linux-omap@lfdr.de>; Wed, 12 Jun 2019 09:56:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731545AbfFLHzE (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 12 Jun 2019 03:55:04 -0400
Received: from mail-lf1-f53.google.com ([209.85.167.53]:40727 "EHLO
        mail-lf1-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729413AbfFLHzE (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 12 Jun 2019 03:55:04 -0400
Received: by mail-lf1-f53.google.com with SMTP id a9so11307919lff.7
        for <linux-omap@vger.kernel.org>; Wed, 12 Jun 2019 00:55:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=7PzIlTNIG9ZNiKS3hRUm3RewsbWBmwo6U2w2huv5deg=;
        b=Ikh3hhr86U05Rwd/ohMNVvV7u0ctcFy7sv/uEL+EuxN98f3uQ67oC/e0EYe1RhQy8P
         GJFuf3O1tXMHShRpTgs1L8ewX/PFmrqAppj5PDuaoH3wYMGxvrkub2lXMWDhtvhhHInF
         ARAMOP1P6S6rvNLYPYfqORNKO1XSgrKGhExGTZJLtohlRIq3Npv7paeV6ElrVG69IdHH
         LxJS0EsMtyX1pKMDDSRbrirELXHF5eqYTU4kvAAzk5tfUlvp4fdYCIKCCxKMbk6xgobY
         lhpxsi57qNqQJVRRei3ceZXe4P0MuV4wPp9R8Mu4xrPb3dZbVCKlfuKWnUJ7naD6LBXM
         m3kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7PzIlTNIG9ZNiKS3hRUm3RewsbWBmwo6U2w2huv5deg=;
        b=NIWF+fFGUHWjXYQV5aaLhXIJsfVN82mAoCqBzB+g1InhNm33tKWTW/02ugLbGG33Tr
         hsmTZ5Pn8JnrbzOfVhqmY02DJvjXVHXtDJoeZA83AZe8k0UZnrjuv9SejlrXuI/U1FyB
         L32hWAgx9aSTl9+D0jEzqI3ywoqr/OWDIZoNpe6qs8O9Ed0m04iTBiEg6ZzWpfqq6/uj
         v1Hm4tnHvt2Kw/zn/HEWwqFnlJoDbJNeV3mA1YaC9B8MgiEcxB8k6VJdBRKk0SHddXUq
         YQNJKsD/nw1BqhnFUcoA2oDTSQ+7xBcKBNBxQZFvmneGdh34dTz4ulwR+umffHOOgCWd
         n9Aw==
X-Gm-Message-State: APjAAAXpvGzxvvkrvb63dVfEVu4yVYHmve9RqjvBUI7jKs8dXDgbWvUI
        c4hp1LnNxxlh7UrXJu8WfnK86hOZMoKOaH4yhZBdQQ==
X-Google-Smtp-Source: APXvYqwr+IggkBTWnR7/O1aUrCDYKzqAI3QVMBZqKcDtkTqDwEoqgL77KBrEFS20MTecxS2RTiEs6OZy6RxBT1DXdYY=
X-Received: by 2002:a19:7616:: with SMTP id c22mr36632491lff.115.1560326101939;
 Wed, 12 Jun 2019 00:55:01 -0700 (PDT)
MIME-Version: 1.0
References: <20190610171103.30903-1-grygorii.strashko@ti.com> <20190610171103.30903-2-grygorii.strashko@ti.com>
In-Reply-To: <20190610171103.30903-2-grygorii.strashko@ti.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 12 Jun 2019 09:54:50 +0200
Message-ID: <CACRpkdZvd_pApYbDL+PTJ1LDuDuvcVc2OCA_anRoWvwka_xm6g@mail.gmail.com>
Subject: Re: [PATCH-next 01/20] gpio: gpio-omap: ensure irq is enabled before wakeup
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
> Documentation states:
>
>   NOTE: There must be a correlation between the wake-up enable and
>   interrupt-enable registers. If a GPIO pin has a wake-up configured
>   on it, it must also have the corresponding interrupt enabled (on
>   one of the two interrupt lines).
>
> Ensure that this condition is always satisfied by enabling the detection
> events after enabling the interrupt, and disabling the detection before
> disabling the interrupt.  This ensures interrupt/wakeup events can not
> happen until both the wakeup and interrupt enables correlate.
>
> If we do any clearing, clear between the interrupt enable/disable and
> trigger setting.
>
> Signed-off-by: Russell King <rmk+kernel@armlinux.org.uk>
> Signed-off-by: Grygorii Strashko <grygorii.strashko@ti.com>

Patch applied.

Yours,
Linus Walleij
