Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B565217DC62
	for <lists+linux-omap@lfdr.de>; Mon,  9 Mar 2020 10:27:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726446AbgCIJ1B (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 9 Mar 2020 05:27:01 -0400
Received: from mail-lf1-f65.google.com ([209.85.167.65]:35685 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725962AbgCIJ1B (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 9 Mar 2020 05:27:01 -0400
Received: by mail-lf1-f65.google.com with SMTP id g4so736572lfh.2
        for <linux-omap@vger.kernel.org>; Mon, 09 Mar 2020 02:26:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=A7hpoWHApTHmqExHIYzq5O430jcgRqsiEYj9yFZNI6Y=;
        b=S1Hf96q/jJI6OJXfsNbutrIjMbckiMiq1f7Sq26bp4QiWaocZHyYfKFs854No9aXk+
         RqNOMNQHz2Iwh2Ci1ViY609WbKxjDFojaPMMKOfx2mLxK/m63ieeuNOQ4LLBN76smUnu
         G9KDZktjtqLjbje9fDnypDwyVdr1Pys6eURXyoXdl8yKAbxYu8PmPyLSCjxHgnfR5P+w
         PUcv9paYoG2jaPQ2/gGeSTXpYG/2SzsDTieQQyZ7VWRJ4jqXLHW2papjn3CUUkTwPb1U
         EIRfLvzY2nSqvEpYxTfadHxYsm+hpo3w/G+5DYta47quYp4G6WNG5kdJcoL0chjURFnj
         /9UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=A7hpoWHApTHmqExHIYzq5O430jcgRqsiEYj9yFZNI6Y=;
        b=L/4uEIn2zDXKsW3BQHiV5lQyVHiICsKNFZ2Q9D9lBEJduOOnOjFjtXEhQw7PAOG0+p
         1x6Ft6tXKx7U80Adb7oslwOE9EXnnifTtdikskcwKNp1+BM3Y5H+8DRgTBVWBTIULrJ8
         Bu5W2Ao+oEpUX+qmyAFXoD3k+uayUSJ2EUPHp/fpOmbxB7uwxrbM9MIWE273DYcAml+s
         o7fy5WehRyQAgB53Drtueok9dw72H86Xw+u/WvNUDTo2pnA1EmkQEjQ45kWGRnsG4v8y
         6bbN6PgW5d9zGQQyMFHekPFtmGTd8ldjzWEaE8ZtLqFUXX7GNEOmZq4pLebJnqF08R6j
         jZYw==
X-Gm-Message-State: ANhLgQ1vLWKIUoUFaLs74d1WxfkJsk1GHU53iZisLefQH44unitzVEI/
        v+UFvyjmn5XiWjGWLmROaG6eyMaZOGeUanYWdbu/yw==
X-Google-Smtp-Source: ADFU+vu2ArJMW5D9CnzwG4xq4wa06pcfnLZNUFzSCPQ35LVPrel7wpiZ22Ayswzj/Ovduv9p6f5tdPhOI0bceskI8RQ=
X-Received: by 2002:ac2:5f50:: with SMTP id 16mr8883801lfz.194.1583746018865;
 Mon, 09 Mar 2020 02:26:58 -0700 (PDT)
MIME-Version: 1.0
References: <20200304225433.37336-1-tony@atomide.com>
In-Reply-To: <20200304225433.37336-1-tony@atomide.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 9 Mar 2020 10:26:47 +0100
Message-ID: <CACRpkdYL5mZ7i6bEF0b_CUXaG-jHKz4KnSXsBNfs_9M054U3vQ@mail.gmail.com>
Subject: Re: [PATCH 0/3] Block idle in gpio-omap with cpu_pm
To:     Tony Lindgren <tony@atomide.com>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux-OMAP <linux-omap@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Aaro Koskinen <aaro.koskinen@iki.fi>,
        Dave Gerlach <d-gerlach@ti.com>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        Keerthy <j-keerthy@ti.com>,
        Ladislav Michl <ladis@linux-mips.org>,
        Peter Ujfalusi <peter.ujfalusi@ti.com>,
        Russell King <rmk+kernel@armlinux.org.uk>,
        Tero Kristo <t-kristo@ti.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Wed, Mar 4, 2020 at 11:54 PM Tony Lindgren <tony@atomide.com> wrote:

> As discussed earlier, here's a series to use cpu_pm to block deeper SoC
> idle states if a gpio interrupt is pending.

As you requested I queued these on an immutable branch
based on v5.6-rc1:
https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git/log/?h=ib-omap-block-idle

And merged into gpio-devel for v5.7.

Yours,
Linus Walleij
