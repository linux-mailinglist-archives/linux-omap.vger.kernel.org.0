Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E8C3E26791F
	for <lists+linux-omap@lfdr.de>; Sat, 12 Sep 2020 11:26:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725814AbgILJ06 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sat, 12 Sep 2020 05:26:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59478 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725823AbgILJ0x (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sat, 12 Sep 2020 05:26:53 -0400
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com [IPv6:2a00:1450:4864:20::141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3E12EC061757
        for <linux-omap@vger.kernel.org>; Sat, 12 Sep 2020 02:26:51 -0700 (PDT)
Received: by mail-lf1-x141.google.com with SMTP id b12so8282849lfp.9
        for <linux-omap@vger.kernel.org>; Sat, 12 Sep 2020 02:26:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=S+48eoB8+wThondXw2toHob0ZQwe3LgTU2CE7AlUBMM=;
        b=OuRWaG40whjIBcB91iNEvAaHGH0XDNk5AXjxsFd+lICwB8++pB5UsygLg6jwo/lL2A
         qd53HqFUUnm3cDfBUscBkRR1u9VdxLP7qcflg9bAFk0JXmup6OrDzfQpQsCOhL9SY7XW
         vR0VT+2T1bqV19wiKfCyC3E9Nx/TcZ88mR8/c8gXF0yduk3xdoC/Ir50d7AIkuzKUjUy
         4F0dMDAIYUEth89uoIqHYVdc8C+bdXJyz5JmcupsoZY0mzUstYXOqCoD/nN76FZS7ImA
         lJD8JSIjMf3V+xJpzWOjcQptKuobR+0USHm2aAa9OpznGdsOHeTJ6ZJVdmq+wn0U96tO
         N3jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=S+48eoB8+wThondXw2toHob0ZQwe3LgTU2CE7AlUBMM=;
        b=aAS3B18wH6ndIwOBqnPMG7NJ8dbMKwuyibUSI7xQEG1E/NbiT8p1oZbh3e+BUoZ23H
         JY9HndS6Vd5hnRvx+N/ZLUnwXGUd/Gl58yL6QdYa3cr+GjDArAKXjWMrSu38QEhAQc+x
         YLmWzROqINHz/1kQ4wLdTe3Ms0cGeqlGIYK9Bjpci4kT+zig2lyOPuXfyJ8JRJqHO6Ac
         dN7wZuiGzcVCrSpqZtOFVYNySCxOYpwoFEVAXgnKFFqHDH0vr/CE6wePyAuD/a0gjP4M
         j6J/yesR/ZKKLo63LmR+r59yo3ogHkC9FvAgIsweUZk/LCOanhoZW3hMBQo3dBMTWdcX
         if+g==
X-Gm-Message-State: AOAM532UOvciPPLWi6VbtplFel86GL0PfM6NlDvVfM5u+CXrVQyyTKRt
        fcyZPrpG0UC3UAteIAlolNvau3X8WMnb51Wh7xjPog==
X-Google-Smtp-Source: ABdhPJxdoNVDkt5k0KwL4T1WSSnHEJDy+mY/l76Bcz8T6aGaxXWR//LA/bThMnertfCCTg+IRPpUIcuvCtcRsJJk2dk=
X-Received: by 2002:a19:520b:: with SMTP id m11mr1331733lfb.502.1599902810277;
 Sat, 12 Sep 2020 02:26:50 -0700 (PDT)
MIME-Version: 1.0
References: <20200827200827.26462-1-krzk@kernel.org> <20200827200827.26462-6-krzk@kernel.org>
In-Reply-To: <20200827200827.26462-6-krzk@kernel.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sat, 12 Sep 2020 11:26:39 +0200
Message-ID: <CACRpkdZJ78LBANGOdE6+kokfJV5hUYWaXhdhG+9cFUyj6YjVpw@mail.gmail.com>
Subject: Re: [PATCH 6/6] gpio: zynq: Simplify with dev_err_probe()
To:     Krzysztof Kozlowski <krzk@kernel.org>
Cc:     Ray Jui <rjui@broadcom.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Scott Branden <sbranden@broadcom.com>,
        bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>,
        Keerthy <j-keerthy@ti.com>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        Kevin Hilman <khilman@kernel.org>,
        Michal Simek <michal.simek@xilinx.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Linux-OMAP <linux-omap@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Thu, Aug 27, 2020 at 10:08 PM Krzysztof Kozlowski <krzk@kernel.org> wrote:

> Common pattern of handling deferred probe can be simplified with
> dev_err_probe().  Less code and also it prints the error value.
>
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

All six patches applied!

Thanks!
Yours,
Linus Walleij
