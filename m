Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4A8763B39A4
	for <lists+linux-omap@lfdr.de>; Fri, 25 Jun 2021 01:11:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232300AbhFXXNu (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 24 Jun 2021 19:13:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49970 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229521AbhFXXNt (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 24 Jun 2021 19:13:49 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D1319C061574
        for <linux-omap@vger.kernel.org>; Thu, 24 Jun 2021 16:11:28 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id f30so13187620lfj.1
        for <linux-omap@vger.kernel.org>; Thu, 24 Jun 2021 16:11:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=RKvQ84L7i7Q66+4hgvpmihpYU0bPeDpVb9EJphxZQuI=;
        b=JHg/jc0bbwBhVvdYJ5vx8d2GNcCz+NMvF8A3yduFH0LYdaCwsrnchIU0jhqhz5Ve2Z
         f4dY09j0Xb0kkjv2omyezcrJQQGA077N47WmrXQMHxkvB3IngzZUknQOk/ikkVSbhbWG
         +FVtuHVD3ajJ+OcnzMKRfaz8agcde6DoG2XMBzAlxHMvs3k9Ag5WEguLTXZSm6uZsO9n
         nEPASYO+9eXNZOKhcTP95ddDQ3VWfXP04dnJsBnFo+u7tliAgiTkSMBQ+PK4RSodCqKj
         JCV5EeOxSMU7F3csKlTCCkhzFUQaSKc3WXuLfcJVkzJWy7WNAGYiCgX8AuHQouhP0Owr
         5n2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=RKvQ84L7i7Q66+4hgvpmihpYU0bPeDpVb9EJphxZQuI=;
        b=pdxRAiWaf7+kcUFmcHUFH6T4QCLbBs3FUT3cNdWzwuqnBDsXkwjIVQYYf50xKDUTql
         XqRodQAI0JIu+cXn9MQgZDYaIuZU9HzsTysJkEYM0il4XZIhmYco5EEhISsKOqVn+TEg
         dUYSa8OjNDvxOuNKHgnDgZCw7Mx7Mauda4jCapji5N2DlPLH8V55/Xh43Uhk2K40k1+7
         q88lLqlBUE6LQyzp5UtWsNFwSIfFfVbcpeXDYiChhDYhmVbI3XVFZf78NCymXY5gUhwj
         lpCzvZpOLK71iwwvsUzRyH7UDGEYy8nXPGZ1wmGH7Pwn4rdC53IOAbe4UGiOZ+vyV1kB
         vuQQ==
X-Gm-Message-State: AOAM532WRZGml9qgLB+whNLgnDANB/cgjxg/8D8PotCnC6g7/g0nnAuC
        P4TbfdHyBdn0wXy1F1fCE8bCFLXWcqTBv6J1osRsJQ==
X-Google-Smtp-Source: ABdhPJyom1TBXNm48PvJfgmrVt21Lq9BwYs6rnP7RXGGEJS3orfgEWQ3PsfcdUgopwph82aVwwuXTZhWBgPlhN4YIOg=
X-Received: by 2002:ac2:4d25:: with SMTP id h5mr3565495lfk.291.1624576287158;
 Thu, 24 Jun 2021 16:11:27 -0700 (PDT)
MIME-Version: 1.0
References: <20210531090540.2663171-1-luca@lucaceresoli.net>
 <20210531133211.llyiq3jcfy25tmz4@pali> <8ff1c54f-bb29-1e40-8342-905e34361e1c@lucaceresoli.net>
 <9fdbada4-4902-cec1-f283-0d12e1d4ac64@ti.com> <20210531162242.jm73yzntzmilsvbg@pali>
 <8207a53c-4de9-d0e5-295a-c165e7237e36@lucaceresoli.net> <20210622110627.aqzxxtf2j3uxfeyl@pali>
 <20210622115604.GA25503@lpieralisi> <20210622121649.ouiaecdvwutgdyy5@pali>
 <18a104a9-2cb8-7535-a5b2-f5f049adff47@lucaceresoli.net> <4d4c0d4d-41b4-4756-5189-bffa15f88406@ti.com>
In-Reply-To: <4d4c0d4d-41b4-4756-5189-bffa15f88406@ti.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 25 Jun 2021 01:11:15 +0200
Message-ID: <CACRpkdYp17MLavG_OMSHmS5DfMGLXrfK11nDfJX86rM9LJ9DtQ@mail.gmail.com>
Subject: Re: [PATCH v2] PCI: dra7xx: Fix reset behaviour
To:     Kishon Vijay Abraham I <kishon@ti.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     Luca Ceresoli <luca@lucaceresoli.net>,
        =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        linux-pci <linux-pci@vger.kernel.org>,
        Linux-OMAP <linux-omap@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Rob Herring <robh@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Tue, Jun 22, 2021 at 3:57 PM Kishon Vijay Abraham I <kishon@ti.com> wrote:

> While the patch itself is correct, this kind-of changes the behavior on
> already upstreamed platforms. Previously the driver expected #PERST to
> be asserted be external means (or default power-up state) and only takes
> care of de-asserting the #PERST line.
>
> There are 2 platforms that will be impacted due to this change
> 1) arch/arm/boot/dts/am57xx-beagle-x15-common.dist (has an inverter on
> GPIO line)
> 2) arch/arm/boot/dts/am571x-idk.dts (directly connected to #PERST)
>
> For 1), gpiod_set_value(reset, 0) will assert the PERST line due to the
> inverter (and GPIO_ACTIVE_LOW)
> For 2), gpiod_set_value(reset, 0) will assert the PERST line because we
> have GPIO_ACTIVE_HIGH

The presence of an inverter makes it necessary to model this the right
way to get out of the situation.

> So this patch should have to be accompanied with DT changes (and this
> patch also breaks old DT compatibility).

There are ways to deal with this perfectly. It may or may not be worth
the extra work. But I can show how it is done.

Make the patch to the driver that assumes driving the gpio descriptor
to 1 (asserted) has the desired effect.

In this patch, I would include a hunk that fixes the above device trees,
so they are correct from this point. This is one of the few cases where
I think it warrants to fix the driver and the DTS file at the same time,
but the DTS can also be patched separately because of the described
solution below:

To avoid regressions with old device trees, add code to
drivers/gpio/gpiolib-of.c in function of_gpio_flags_quirks()
to react to the old incorrect device trees. This is where we
stockpile OF errors and bug fixes.

This needs to be pretty elaborate. It begins like this:

if (IS_ENABLED(CONFIG_PCI) &&
      (of_machine_is_compatible("ti,am572x-beagle-x15") ||
      of_machine_is_compatible("ti,am5718-idk")) &&
      of_node_name_eq(np, "pcie")) {
      /* ... add code to check and enforce the flags ... */
}

You see the idea here. Include this in the patch to make the
Perfect(TM) solution to this problem both fixing all device trees
in place and dealing with the old erroneous ones using some
elaborate code.

There are plenty of examples on how to detect warn and
modify flags in of_gpio_flags_quirks() make it clear and add
some warning prints and comments. Keep me and Bartosz
in the loop. It'll look fine in the end.

Yours,
Linus Walleij
