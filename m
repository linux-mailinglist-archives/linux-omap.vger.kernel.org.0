Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0C0842C7F8F
	for <lists+linux-omap@lfdr.de>; Mon, 30 Nov 2020 09:16:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726634AbgK3IQt (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 30 Nov 2020 03:16:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45928 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725880AbgK3IQs (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 30 Nov 2020 03:16:48 -0500
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com [IPv6:2a00:1450:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 566B2C0613D3
        for <linux-omap@vger.kernel.org>; Mon, 30 Nov 2020 00:16:02 -0800 (PST)
Received: by mail-lf1-x144.google.com with SMTP id u18so19781486lfd.9
        for <linux-omap@vger.kernel.org>; Mon, 30 Nov 2020 00:16:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=1WW7NdGi1sFdQkUxxy6Ct166Jaa/cUFKVp9VOVJXhJY=;
        b=k498odRkC4CWp5FzcznjTxr/pCBlxIwv/+Y/qvje5oKOjju0LdiGuUZ1lgnB94z0oy
         FWdK3JzZa5UHdKC63RBkuset2nF2DbNxmPfiyLMlqfjLE02AjSU7aLPPFDutBU1lyOKb
         BUNlxoa2kVxrLFqvmCALsrTKR3Jl2X8/2EieNgI9128E0mCuXmVL02S+wSLUJgIXPGvW
         y+FmnaOfNvvVveg6vytmTjZXJdzmeGnsrSvsziSsmhqcP48pE6farYihYXkVtSad14DD
         n3DogRhll2CSweTE94qOIrzRj58brTwTba+B3/GwxOEaOnqpEGhrbsh+8iRjFmrEhesw
         hiOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1WW7NdGi1sFdQkUxxy6Ct166Jaa/cUFKVp9VOVJXhJY=;
        b=QiudS795CxIfw7bBOV/vYOonlbLXbargXF6ufiirAfWhVzxZwb1PBSv0A7JE5aSZlr
         MbWET2WZVGrdDOhy+HIUiN9rI/rACaGa5/044xb3EhdZYHgF13ESlJgfPJqXOg+rKKjF
         t10T+VLk6m8IwDw5L4aqASEPiSafHxEqnrdkw65mw1jLvZwPFzAzDcTyjL2KxIUlQBCK
         ihje+QdZXxs/0lduJ1rYt8DZTGxBYfGz+2jRy7Ob4GfYwHW2tcELMMGO+aeinlRrs7ZU
         9ywT0NSRchTiiuTrsvF6q2Mbb+qhIcgtpoCY65DhETUqxBXFX5jFbP63c0oGjaxVIfji
         UtPQ==
X-Gm-Message-State: AOAM530yOW8kdfVnHOvlWw6feMPrBAcMfd+cUJKd6Qliut7g/GVH2HXs
        MhbreGWXEsGBK/1fI4UxEdqFBQ9QEULhBr1trKfEQw==
X-Google-Smtp-Source: ABdhPJwjUDapYSqhwuiyUqMZirMI2fiMMQRIx6Wm/py1dcEIOroSVXyUH1hK62LNIiM7QVZNWhF8/sT6/Qg0Qsrmjyk=
X-Received: by 2002:ac2:4578:: with SMTP id k24mr8355336lfm.502.1606724160610;
 Mon, 30 Nov 2020 00:16:00 -0800 (PST)
MIME-Version: 1.0
References: <20201128235154.GF551434@darkstar.musicnaut.iki.fi> <20201129115748.GG551434@darkstar.musicnaut.iki.fi>
In-Reply-To: <20201129115748.GG551434@darkstar.musicnaut.iki.fi>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 30 Nov 2020 09:15:49 +0100
Message-ID: <CACRpkdb0+uaRpC7GwWGjPoQMd=re2-BNPY5ritq3HNMJWKOKpg@mail.gmail.com>
Subject: Re: [BISECTED REGRESSION] Broken USB/GPIO on OMAP1 OSK
To:     Aaro Koskinen <aaro.koskinen@iki.fi>
Cc:     Tony Lindgren <tony@atomide.com>,
        Alan Stern <stern@rowland.harvard.edu>,
        Linux-OMAP <linux-omap@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Sun, Nov 29, 2020 at 12:57 PM Aaro Koskinen <aaro.koskinen@iki.fi> wrote:
> On Sun, Nov 29, 2020 at 01:51:54AM +0200, Aaro Koskinen wrote:

> > I tried to upgrade my OMAP1 OSK board to v5.9, but the rootfs cannot
> > be accessed anymore due to broken USB. It fails to probe with the
> > following logs:
> >
> > [    9.219940] ohci ohci: cannot find GPIO chip i2c-tps65010, deferring
> > [    9.250366] ohci ohci: cannot find GPIO chip i2c-tps65010, deferring
> > [    9.731445] ohci ohci: cannot find GPIO chip i2c-tps65010, deferring
> > [   10.342102] ohci ohci: cannot find GPIO chip i2c-tps65010, deferring
> > [   10.966430] ohci ohci: cannot find GPIO chip i2c-tps65010, deferring
> >
> > Bisected to:
> >
> > commit 15d157e874437e381643c37a10922388d6e55b29
> > Author: Linus Walleij <linus.walleij@linaro.org>
> > Date:   Mon Jul 20 15:55:24 2020 +0200
> >
> >     usb: ohci-omap: Convert to use GPIO descriptors
> >
> > I suspect one of the issues is the name "i2c-tps65010" vs "tps65010":
> >
> > # cat /sys/devices/platform/omap_i2c.1/i2c-1/i2c-tps65010/gpio/gpiochip208/label
> > tps65010
> >
> > However changing that in the lookup table still doesn't help much; I got rid
> > of the "deferring" message but the USB still doesn't work. So far the only
> > workaround I have is to revert the whole commit.
>
> GPIO numbering goes wrong... It's now trying to poke GPIO2.

Hm the old code looked like this:

#define GPIO1  1

tps65010_set_gpio_out_value(GPIO1, LOW);

And I missed that the code inside the tps65010 driver subtracts 1 from
the passed parameter and the standard gpiolib accessors add 1 before
calling the same function. I missed this.

> Also gpiod_set_value_cansleep() probably should be used as tps65010
> can sleep.

OK I'll send a combined patch fixing all issues (I hope).

Yours,
Linus Walleij
