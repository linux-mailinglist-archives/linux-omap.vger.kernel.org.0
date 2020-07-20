Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3958E22620A
	for <lists+linux-omap@lfdr.de>; Mon, 20 Jul 2020 16:26:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728749AbgGTO0e (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 20 Jul 2020 10:26:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55916 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728543AbgGTO0e (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 20 Jul 2020 10:26:34 -0400
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com [IPv6:2a00:1450:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B54B2C0619D2
        for <linux-omap@vger.kernel.org>; Mon, 20 Jul 2020 07:26:33 -0700 (PDT)
Received: by mail-ej1-x643.google.com with SMTP id o18so18237268eje.7
        for <linux-omap@vger.kernel.org>; Mon, 20 Jul 2020 07:26:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=KAyErvrsmsg2yl8HJaeI8qkyJy7u6qTS/Aw3lCZAIlQ=;
        b=ztJXSb87r/qQfxKi+7vOos/B89RV26brZQVQ6s1aAVVoG2JdLyuYRol/QYC3/moMz5
         /F3w7LaaCk4u2rDR1b0RmRFQCnTJsX7Dy2CGHqqZQQne3XLDa9D4O80hbGBDDog9/0C8
         zpjzS6Z5/bH5iL92Q9bPLoWXNAGl6jQWzteTcz8+JVmyD9AKyoFw6nC0XR0P3EIySCnQ
         bE+0sJD+i6+OBvRl5os3uQSnSc/jE7Nd/gEftLTbiH6SLrhYS2DVaIIPiLIfDxUg0NnD
         BVdgRjGXMhvr6p+wqdHhQcz8WDjd//QpVzqk74JLrfTLhUhr4oLLJYfUkDTJMtsaxVRN
         sl1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=KAyErvrsmsg2yl8HJaeI8qkyJy7u6qTS/Aw3lCZAIlQ=;
        b=K0P3zQ/ywEK8cy5ixZo9gk033saCKntQb/6fqrfsHAzBjnDdCqVLdT0OXKoSKGfAvD
         VrWJbxqCA2/b+0jwbIgfk20K4quh5cvrugHRKdfRpSu6JSTAldyomEcdRiG6J3m9B1V8
         Wb8vWUE/fuvmCmTflCDpydDrpkk0ERLh1zsuhrPEkii57Try4gZqsGLpB49CZpwRjJIq
         LiWuMzjl4/d6PZW4yPApKCx3V77YSh2Q6UMBr1s+FFcee+FoGu1s1dc+J/vSVc9OBJX1
         BnGtTILv+pHOzADUhy+AdodZLtVpkNHasDFMJTBwdR3A2eejGgkef5c7e8eT0cvgfjaK
         FOyw==
X-Gm-Message-State: AOAM533/nmroLpo21dglsKilOnc1wzsHz0SDphTK1dVZyc66MX9KfW8L
        PYTJYtESdTItGENvBGBnqu/aZGg1cQGrXh+PVEproA==
X-Google-Smtp-Source: ABdhPJw0is1LrzDGO+RSe9ZgSBD3yon69XrfPOGSyQdsM4gQolQ+anP1PVWoq7gNuJoTStTzoel7kjPpeB+rZDstYzI=
X-Received: by 2002:a17:906:a44:: with SMTP id x4mr21956032ejf.193.1595255192387;
 Mon, 20 Jul 2020 07:26:32 -0700 (PDT)
MIME-Version: 1.0
References: <20200718154908.1816031-1-drew@beagleboard.org>
In-Reply-To: <20200718154908.1816031-1-drew@beagleboard.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 20 Jul 2020 16:26:21 +0200
Message-ID: <CACRpkdapJj5Q3MBKrJkd3CBeJJDuuS-Cj6D=Gk67uyt4O_Oj-A@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: core: print gpio in pins debugfs file
To:     Drew Fustini <drew@beagleboard.org>
Cc:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Tony Lindgren <tony@atomide.com>,
        Linux-OMAP <linux-omap@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Jason Kridner <jkridner@beagleboard.org>,
        Robert Nelson <robertcnelson@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Drew,

thanks for this patch, we're going the right direction here
and creating things that are generically useful.

On Sat, Jul 18, 2020 at 5:53 PM Drew Fustini <drew@beagleboard.org> wrote:

> pin 103 (PIN103) GPIO-113 44e1099c 00000027 pinctrl-single
> pin 104 (PIN104) GPIO-114 44e109a0 0000002c pinctrl-single
(...)

Uh oh, that is the global GPIO number that we want to get
rid of.

> +               gpio_num = 0;
> +               list_for_each_entry(range, &pctldev->gpio_ranges, node) {
> +                       if ((pin >= range->pin_base) &&
> +                           (pin < (range->pin_base + range->npins)))
> +                               gpio_num = range->base + (pin - range->pin_base);

There should be a break; here should it not?

> +               }
> +
> +               if (gpio_num > 0)
> +                       seq_printf(s, "GPIO-%u ", gpio_num);

Can we print the gpio_chip name and offset instead?
I want to discourage the world from thinking about these
global GPIO numbers.

You can fetch the gpio_chip for the range pretty easily
with

struct gpio_chip *chip = gpio_to_chip(gpio_num);

Also notice that this code needs to be
#ifdef CONFIG_GPIOLIB somehow
(maybe IS_ENABLED() works) because there
are pin controllers in use without gpiolib believe it
or not.

Yours,
Linus Walleij
