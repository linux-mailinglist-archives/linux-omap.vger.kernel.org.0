Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E62BC2DE75F
	for <lists+linux-omap@lfdr.de>; Fri, 18 Dec 2020 17:22:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725797AbgLRQWg (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 18 Dec 2020 11:22:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49186 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728293AbgLRQWg (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 18 Dec 2020 11:22:36 -0500
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BA246C0617B0
        for <linux-omap@vger.kernel.org>; Fri, 18 Dec 2020 08:21:55 -0800 (PST)
Received: by mail-lf1-x12f.google.com with SMTP id x20so6762222lfe.12
        for <linux-omap@vger.kernel.org>; Fri, 18 Dec 2020 08:21:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=rDLpU6fmO9Dc1x1t61R7OfUqiugdNOS6K3qFKa97G3M=;
        b=RNcrom89+00TLhoqKq5HSfBMQiTcLhLTVqleKDUtotyAUgS9d/nMNw/jGeiCQhM4jS
         x9MkXG284bkHM8TnLfe9lsXoj0/J8isD4M9/eIiE02ofukBEqa6pmGSp6NUWXjWtfUUI
         alAsm7chyGHjGOzMufNh4+niTbrfwWDZr1qAr/DCKiF+g1NK1GsVwDuzfUpQyxLvLfDt
         bw81/eYelpMbjt92ZWTBzWGsI3ceWAxFY5un9rLm8PjM4rF/UJ1gc8WA6udpHCHg/Rtg
         gIXyFNweAuSiawcTLQjmTNWA4MS0DEWEgZ+64SBtudrKJZpb3IJ7sgzPTlrf679bxakB
         6WmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rDLpU6fmO9Dc1x1t61R7OfUqiugdNOS6K3qFKa97G3M=;
        b=tO0y33gqgNsFfk2el+H+KmFev3NmjyLEZs/jsRx8hYz6JKKlcfaSE1DcLU0x+T9oWT
         L6dD6IgocZMfSKEnjqI9PmFdbZIfLeeGDwBUNEO1jXHNiyrW+XWS09/dcjNDO16EzvLz
         14r868g1kg9P0YiMMOMJTurAHnwbumZ30uEIQtwCwKxLTn2cPzRSheKIDItEm7v3cO6Z
         HQLH3O7yASeenOsqUQcEgw9BV7mfZY5O/eA2lfOupsZ288oKbUZzWA8c4MNvLKSLivqv
         MlyaLz2tWxNP/3lZAfWoCGe5cm0cgGY8zoArdh9eVOl6m7AZ7VhVGkI7G0/GXqGHU7DU
         MVMA==
X-Gm-Message-State: AOAM530MBBVLwmtC0haDUvIU9szdT+fGpUytHXjogkPMJuvp/WsiFdT1
        1Wgg9yGvwBKkFd67h4U2+Fg9kyIyftTGHayV2slcbg==
X-Google-Smtp-Source: ABdhPJyaI5j2YELD3txTYS+jzFJKX/484b8gFBA7GJ+WBgF/OzCBTjjZXSRym+OOTn9VZPe80LIn4ZlRTbk8tMpwEF0=
X-Received: by 2002:a2e:586:: with SMTP id 128mr2273552ljf.273.1608308514133;
 Fri, 18 Dec 2020 08:21:54 -0800 (PST)
MIME-Version: 1.0
References: <20201214210121.22042-1-aaro.koskinen@iki.fi>
In-Reply-To: <20201214210121.22042-1-aaro.koskinen@iki.fi>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 18 Dec 2020 17:21:42 +0100
Message-ID: <CACRpkdbayocHXEgvfs9d1YCj2TN=nMpEkpXiF4T95MVuBwHUSw@mail.gmail.com>
Subject: Re: [PATCH] ARM: OMAP1: OSK: fix ohci-omap breakage
To:     Aaro Koskinen <aaro.koskinen@iki.fi>
Cc:     Tony Lindgren <tony@atomide.com>,
        Linux-OMAP <linux-omap@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Mon, Dec 14, 2020 at 10:01 PM Aaro Koskinen <aaro.koskinen@iki.fi> wrote:

> From: Linus Walleij <linus.walleij@linaro.org>
>
> Commit 45c5775460f3 ("usb: ohci-omap: Fix descriptor conversion") tried to
> fix all issues related to ohci-omap descriptor conversion, but a wrong
> patch was applied, and one needed change to the OSK board file is still
> missing. Fix that.
>
> Fixes: 45c5775460f3 ("usb: ohci-omap: Fix descriptor conversion")
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> [aaro.koskinen@iki.fi: rebased and updated the changelog]
> Signed-off-by: Aaro Koskinen <aaro.koskinen@iki.fi>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Thanks for sweeping up the mistakes, much appreciated!

I am vaguely feeling it might be lower effort for me to convert
the OSK board to device tree than fixing all GPIO consumers
one by one, but I don't think I could procure the hardware :P

Yours,
Linus Walleij
