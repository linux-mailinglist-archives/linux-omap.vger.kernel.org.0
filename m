Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5E86120F11B
	for <lists+linux-omap@lfdr.de>; Tue, 30 Jun 2020 11:03:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731786AbgF3JDR (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 30 Jun 2020 05:03:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59744 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731591AbgF3JDQ (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 30 Jun 2020 05:03:16 -0400
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com [IPv6:2607:f8b0:4864:20::743])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 47CDEC061755
        for <linux-omap@vger.kernel.org>; Tue, 30 Jun 2020 02:03:16 -0700 (PDT)
Received: by mail-qk1-x743.google.com with SMTP id c139so17832215qkg.12
        for <linux-omap@vger.kernel.org>; Tue, 30 Jun 2020 02:03:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=csyHqi1dgCFTiTLH92m1pa/01f6/WL6cXgwUlzD9rQs=;
        b=HD4AHzV/G4h+Qg4Jf13PqCiiixOihB5TxcT0bF1y6ewEADJ9V2spVuaQRlP9dBzy69
         5bkx4da1YWTJ8uwLkfjy8PvpO1sydpdbB06U9g6vQz5OXIsN4TdfnWkYqvfrBDxYwkmn
         GUI8+bmuFxhwVbfF1a7rLPuh6GIbbyUsQ71u6QMWTzEtPC0+K2qOR+LiuX4CruoT8wh9
         0isjNHlHsRje9C/Lz2ZcHKbPnlsXC6wSB8e4j1gJaiYKuho9dEg/tk8PBwrSXQsBUzmU
         euQ7o0Ri3f35NR3vaPCUQMZvv6bTa99Iu1x9WxROMITca1tDD8qVKuHyD9812y0+B0De
         J+Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=csyHqi1dgCFTiTLH92m1pa/01f6/WL6cXgwUlzD9rQs=;
        b=RRFWC/ShcoiB6zCQyE0RahiX1EsXDF2qIKZ8diggwZjEyi6PUKgWJNY/hxiPEIS4ld
         OlEuzvZGoMMgBDIJUua3a2E/YnfXobyvAo3Zzze2WIeQwubGCbqmLCz2ZiRnFX6twhbC
         KxiVTN8YGt4/fnnf+k7D82GpMqlL4pS1AwCAb2gDEvvjnnJvovnct0AGjPwdQsfwDBOy
         +ItTH74RgAGl0CIlQKr64u+syrE99FIAL/qNXIT7pqD+Tu3jFio7NsO1wbiPBlY0FkLq
         bxGEYQJOyut6nHMXgZs1hr5u9Nf6lnL9XLK0Cvf5AKQSEvXyo0TqCyKYqfMNoAGlc1Qk
         1fTw==
X-Gm-Message-State: AOAM530wcTGqu2nRvefYnia0ji/aOgAVLJO9al3gxAzt3M1pQiP6ELph
        v7cpOyq/r1MZAJ0W1sTeos3BhG+vDTa/oopxGuskbA==
X-Google-Smtp-Source: ABdhPJyjaXiWK6XZ9b/I9+BjA4tksSscWU+OFzjp2Ia0HC38A3dnw6Cm+HFUohMblrOwECY7vvWo8ub3+608Ayf5mZY=
X-Received: by 2002:a37:9c81:: with SMTP id f123mr17606293qke.21.1593507795079;
 Tue, 30 Jun 2020 02:03:15 -0700 (PDT)
MIME-Version: 1.0
References: <20200629164114.1186-1-tony@atomide.com>
In-Reply-To: <20200629164114.1186-1-tony@atomide.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Tue, 30 Jun 2020 11:03:04 +0200
Message-ID: <CAMpxmJWE7NWPp6Evek+HJp97Vb6XUXDsw6XD3mYNfSwctHDoEg@mail.gmail.com>
Subject: Re: [PATCH] gpio: omap: Add missing PM ops for suspend
To:     Tony Lindgren <tony@atomide.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        Linux-OMAP <linux-omap@vger.kernel.org>,
        arm-soc <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Mon, Jun 29, 2020 at 6:41 PM Tony Lindgren <tony@atomide.com> wrote:
>
> We've had the legacy platform code take care of suspend for us but
> this no longer is the case when probed without legacy mode with
> ti-sysc. We need to configure PM ops like standard Linux device
> drivers do.
>
> As we still have some SoCs booting also the legacy mode, we need to
> add omap_gpio_suspend() and omap_gpio_resume(), and check for the
> is_suspended flag to avoid legacy _od_suspend_noirq() calling them
> on an already suspended GPIO instance.
>
> Once we have no SoCs booting in legacy mode, we can just switch to
> using the standard PM ops with pm_runtime_force_suspend() and
> pm_runtime_force_resume().
>
> Signed-off-by: Tony Lindgren <tony@atomide.com>
> ---

Applied, thanks!

Bartosz
