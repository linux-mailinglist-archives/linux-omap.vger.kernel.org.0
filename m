Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C87491954E0
	for <lists+linux-omap@lfdr.de>; Fri, 27 Mar 2020 11:10:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726096AbgC0KKo (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 27 Mar 2020 06:10:44 -0400
Received: from mail-lf1-f68.google.com ([209.85.167.68]:46685 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726002AbgC0KKo (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 27 Mar 2020 06:10:44 -0400
Received: by mail-lf1-f68.google.com with SMTP id q5so7335817lfb.13
        for <linux-omap@vger.kernel.org>; Fri, 27 Mar 2020 03:10:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=5Npbjmx2EEwqSvhfm8k1aVlqXx6O4MStkJENyJ0fqd4=;
        b=FT8qzeO2T+rJuaOA0DKTsXprHUdy9BzaA7nB0Fr/QoXarVRQwzxhp7ZWERJ9S6Nk3x
         1MmXn7rBgq6Knbjw+my1fmGfvrKb8HApm0swiL8DmY9PQa9MXJl92nPLb5whysAEig8y
         gGaacje71Fwcn3Fc0uMXJF17TmzJ0JgJa32mkqnDFptAKimXjN0G4BeoTz8e8+5t3fbE
         ugPIv7Y1GBHjDzF0qXIt2VnrwHR1viqbLaLaFePYBTZ1POhrro9XHlPwcNRy+KWIJuyc
         ntLw9mARR8eVUnC2QZM7WILY85/+ZX5oce8D1ZiD6ZNSPWAM3Toiq6KvX7NRnXOIlIu/
         I0yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5Npbjmx2EEwqSvhfm8k1aVlqXx6O4MStkJENyJ0fqd4=;
        b=G2VWf0ZGSC8d8pnjjIC+pDeONGGiVLSyhEwpBiIaTlwCtCHUWAOYePZBC9uTwXaypd
         ZzuPfpzkigEVzoliFCjeu1xCYDhlv4Qf8O1WVg8lViUsf3vj+APM6YSOgKHtLMTRr4bK
         HSrt0UKqv73YLxaCbOa3tyayJJVCy/IUydog+/h1lCa6fDafUPp0QsqwVPS+JZX8IMgY
         8cimyJtt0hioGI1Z2kCx/uWze6vfMOO9OOqWWHAmfaGbS9B91uwlxmFdhfiyKNz860I/
         s1ufxjIzqFga2/nBd7zqZxrFnuNxFcGdYA7ZS60/1TLYlkJ8dXuz9BCGu6O55v6M8od/
         NFRA==
X-Gm-Message-State: ANhLgQ3oFdH4FUefzBwrjQAhlDWofAA+TU9Ugsof+2BLShtBauySdlbc
        iLpj+v+8ZwBegJRR85aVG2CgW/FddlxLpiGART5AXg==
X-Google-Smtp-Source: ADFU+vuo7rHjjKyQgOxCXqSH33bSM+Ja4ivZZHhrCjU/q4tcBMMOvFAfACxfFq8agQOOqIlp22v+O/jFyzpwpcjpyIw=
X-Received: by 2002:ac2:5f7c:: with SMTP id c28mr8192077lfc.4.1585303842443;
 Fri, 27 Mar 2020 03:10:42 -0700 (PDT)
MIME-Version: 1.0
References: <20200304225433.37336-1-tony@atomide.com> <CACRpkdYL5mZ7i6bEF0b_CUXaG-jHKz4KnSXsBNfs_9M054U3vQ@mail.gmail.com>
 <20200317173422.GN37466@atomide.com>
In-Reply-To: <20200317173422.GN37466@atomide.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 27 Mar 2020 11:10:31 +0100
Message-ID: <CACRpkdad2Qm76aMhSw9Pdh9=Ed9BXsa6SVsAG2+v=KYRNcwEhg@mail.gmail.com>
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

On Tue, Mar 17, 2020 at 6:34 PM Tony Lindgren <tony@atomide.com> wrote:
> * Linus Walleij <linus.walleij@linaro.org> [200309 09:27]:
> > On Wed, Mar 4, 2020 at 11:54 PM Tony Lindgren <tony@atomide.com> wrote:
> >
> > > As discussed earlier, here's a series to use cpu_pm to block deeper SoC
> > > idle states if a gpio interrupt is pending.
> >
> > As you requested I queued these on an immutable branch
> > based on v5.6-rc1:
> > https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git/log/?h=ib-omap-block-idle
> >
> > And merged into gpio-devel for v5.7.
>
> Hmm I'm not seeing these in Linux next yet though, care to check?

I was just slow on getting it build tested and pushed out, sorry.

Yours,
Linus Walleij
