Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5A4941D7320
	for <lists+linux-omap@lfdr.de>; Mon, 18 May 2020 10:41:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726676AbgERIlk (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 18 May 2020 04:41:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59746 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726285AbgERIlj (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 18 May 2020 04:41:39 -0400
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F65EC061A0C
        for <linux-omap@vger.kernel.org>; Mon, 18 May 2020 01:41:39 -0700 (PDT)
Received: by mail-lj1-x244.google.com with SMTP id w10so8923692ljo.0
        for <linux-omap@vger.kernel.org>; Mon, 18 May 2020 01:41:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=gW1rAjHfmYzKLo3+HNuQ6JT9ne1hXLbLfKgSgNPGdgg=;
        b=K5EwfpGGJek8HJALQ5BBP4EhM5+TcmvJ0549ZPJXQ1LBqqDkcK7A34/aoz+3/Ha3cU
         BAlungwwWdbRz4uXzKryZ7Th8aWhwLWhiHelsPyZkqwP+W8QP31ScEiVaHOxIrRwSZhL
         IkPW0UgVydkXTjEq8upjCKbEJuBnPzMsb3V+UgDSPAtyxM0ffQ0RrHpSgBRzrk7W2J+y
         gmYRTTe7dn/vzEpwL0bDvGjdrLjhjFjBwOTw2PIj03u5zXIwnNLuTpd3LmYOlRvtvydN
         FodQ/0qYPbzeK4GoENZpUx6XspQKlLcOAhvJw4YlNVFghb+uPUz0VSOODL1YVdeYmp2D
         H6sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=gW1rAjHfmYzKLo3+HNuQ6JT9ne1hXLbLfKgSgNPGdgg=;
        b=CFgkUrahM884cZj2xmMAz7hYNlqRgVoje8XdjGIYczyun6kVypvdn2iSRXRbWWkhDU
         MfafI83Jf3AVlZKJrltb1eD5GOX3vOGdDcbkDpSh9or+T6dTJk6CaGAh5NC20hfuNbYd
         tWgnubqMS9AIsV+5bpY+gh7WHJ/1zCwn5Gf0biejL5VVxeo3a5NAL4TjSQE/Z2PqrEbv
         Ymsp7neSRpZv1Ry1WXEXxFQtmxSzF5kiX30YBUIG4JcFzBxH7HyeHwXfZuRENhOF+lLU
         DcDttOVsz7rPwBpByimwufej3mjhKkNQ5g+Ymi1q8XLJ9xtCA1RJxGC0P2XcAX16jI3O
         i6jg==
X-Gm-Message-State: AOAM533BBEgRD/s8t+disYoW3JpejhLYpNeo5RV9m19H4Otd56OOevSN
        7XbWaKARcVAYfIiJw8xalaQnYfxJ+JAF9CUIKEysWQ==
X-Google-Smtp-Source: ABdhPJwJqNAucGKak9tmuVXvkrW85iL40m6qGay/OUsbR1TLGL+cqw9EeIxK3o4zm/Fx0/yqOfMZHysGsnS4dRTj5ko=
X-Received: by 2002:a05:651c:154:: with SMTP id c20mr9091003ljd.99.1589791297948;
 Mon, 18 May 2020 01:41:37 -0700 (PDT)
MIME-Version: 1.0
References: <20200508165821.GA14555@x1> <CACRpkdb+ZP6rfjGg6Ef9_wYvNf6qmSc7LZyYBVKA3XWCtxPfqQ@mail.gmail.com>
 <875zcty7tt.fsf@kernel.org>
In-Reply-To: <875zcty7tt.fsf@kernel.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 18 May 2020 10:41:27 +0200
Message-ID: <CACRpkdZnnRXwv0-71t93HX42jL-muty4yJx5gW6_P3yOM-sGAg@mail.gmail.com>
Subject: Re: [PATCH] arm: dts: am33xx-bone-common: add gpio-line-names
To:     Felipe Balbi <balbi@kernel.org>
Cc:     Drew Fustini <drew@beagleboard.org>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        =?UTF-8?Q?Beno=C3=AEt_Cousson?= <bcousson@baylibre.com>,
        Tony Lindgren <tony@atomide.com>,
        Rob Herring <robh+dt@kernel.org>,
        Linux-OMAP <linux-omap@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Jason Kridner <jkridner@beagleboard.org>,
        Robert Nelson <robertcnelson@beagleboard.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Mon, May 18, 2020 at 10:18 AM Felipe Balbi <balbi@kernel.org> wrote:
> Linus Walleij <linus.walleij@linaro.org> writes:
> >> gpiochip0 - 32 lines:
> >>         line   0:   "ethernet"       unused   input  active-high
> >>         line   1:   "ethernet"       unused   input  active-high
> >
> > Why are the ethernet lines not tagged with respective signal name
> > when right below the SPI lines are explicitly tagged with
> > sclk, cs0 etc?
> >
> > Ethernet is usually RGMII and has signal names like
> > tx_clk, tx_d0, tx_en etc.
> >
> > Also some lines seem to be tagged with the pin number
> > like P9_22, P2_21 below, it seems a bit inconsistent
> > to have much information on some pins and very sketchy
> > information on some.
>
> the pin names match the beagle bone documentation and would help users
> figure out which pins on the expansion headers match to a gpio signal.

OK if it is how it looks in the documentation I agree that is what
users need, maybe the documentation is confusing but there is not
much to do about that.

Yours,
Linus Walleij
