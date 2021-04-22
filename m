Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 66942367606
	for <lists+linux-omap@lfdr.de>; Thu, 22 Apr 2021 02:03:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243606AbhDVAEY (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 21 Apr 2021 20:04:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43398 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235232AbhDVAEX (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 21 Apr 2021 20:04:23 -0400
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B84F8C06138C
        for <linux-omap@vger.kernel.org>; Wed, 21 Apr 2021 17:03:49 -0700 (PDT)
Received: by mail-lj1-x22d.google.com with SMTP id u20so49724412lja.13
        for <linux-omap@vger.kernel.org>; Wed, 21 Apr 2021 17:03:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=U1QwnFjwg+qiruvAOg6+zinx5rvS8M0pyF4i2GcVAmE=;
        b=orTnhf36GXirDCeVsiypbssXe5rFZB36xmmZJdK17QMOApGwcOrDsxs6j36DBTUHff
         BE+ipnCRL9NPi9dNUfOdrK6qHu9253lpggD13jhZKs5t7AjevxncOfAkjMPBSvAItOmM
         Zq21BSOAamOfx4J0+8wXkoT5sG0rYl31F1wn0u/NeNAAHWJOcDtm6WTGOU9EYqafd0sg
         IMTdA021DCeMaOsnDfggJvS8TgYKqbvSW0CrllZU5qsJKLjWvhvu0lLmU91P/dvGz8JX
         D/csxW5ZtVlRJd2rLXcrYuJrBYqbwe4NBuyCoRLLM8swQHR9F7oRr3DDCX/drUz1c9KR
         w6Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=U1QwnFjwg+qiruvAOg6+zinx5rvS8M0pyF4i2GcVAmE=;
        b=Slb7H1DzAzFqkUAlpu+2VcaJ7aM5XJm27WWSDLYkmhtWAA3UfR3Ixmb7PGPuGKvBVk
         xTlJ+4sk4jMfjJZyYDIJIFJME43jxiWVPiJYZO+wy2otuicgAQhxXkdxmhhk5Ksv6UTN
         QkWQSFdd9DJSNhQSfUJGig2asMZxSUn8YSMh9ANcEsWjFqrf0imWWIFyj33AN0AXL47V
         3OAShG+ESv9zPaElE6fhai5pdA+hBfQyZZt6LggQU63XmdQwZyRorHS0M3F6OGxiBqBX
         8+goyLNsFNfnMrG6kuFmGEMihKxUvwx+OmreiXvOXVfZn4f/kAJMxKvG4Qj1G9lAClaD
         Izjg==
X-Gm-Message-State: AOAM530Ntpz9xynT3Dnb/wG5Ep3dm9cSP8szohB+99LVPDnxVEiyL61K
        jkpFrC0w+iF5f2kyNnyUi1HBNSuoD9taH+jwULcWwg==
X-Google-Smtp-Source: ABdhPJw07ibiZOQbsV404TdA6gZ4rmjnOIj6eSTd1OEVtUlqJBSjowl8qj6pES3zVtQAjnNOKDjShDZ5vjjxK6szcMg=
X-Received: by 2002:a2e:9cb:: with SMTP id 194mr530280ljj.438.1619049828194;
 Wed, 21 Apr 2021 17:03:48 -0700 (PDT)
MIME-Version: 1.0
References: <20210412140741.39946-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20210412140741.39946-1-andriy.shevchenko@linux.intel.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 22 Apr 2021 02:03:37 +0200
Message-ID: <CACRpkdbGsnkFa13O2pPSQaSR3aCZa=iXC19MNgv8is4-Wc3BxA@mail.gmail.com>
Subject: Re: [PATCH v1 1/3] pinctrl: Keep enum pin_config_param ordered by name
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Drew Fustini <drew@beagleboard.org>,
        Tony Lindgren <tony@atomide.com>,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        Thierry Reding <treding@nvidia.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux-OMAP <linux-omap@vger.kernel.org>,
        linux-tegra <linux-tegra@vger.kernel.org>,
        Vladimir Zapolskiy <vz@mleia.com>,
        Haojian Zhuang <haojian.zhuang@linaro.org>,
        Michal Simek <michal.simek@xilinx.com>,
        Daniel Mack <daniel@zonque.org>,
        Robert Jarzmik <robert.jarzmik@free.fr>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Mon, Apr 12, 2021 at 4:07 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> It seems the ordering is by name. Keep it that way.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Patches applied, nice spring cleaning so why not!

Yours,
Linus Walleij
