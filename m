Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8D4396F0079
	for <lists+linux-omap@lfdr.de>; Thu, 27 Apr 2023 07:42:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233083AbjD0Fmd (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 27 Apr 2023 01:42:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52032 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232094AbjD0Fmc (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 27 Apr 2023 01:42:32 -0400
Received: from mail-qk1-x72c.google.com (mail-qk1-x72c.google.com [IPv6:2607:f8b0:4864:20::72c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A15B2D73
        for <linux-omap@vger.kernel.org>; Wed, 26 Apr 2023 22:42:31 -0700 (PDT)
Received: by mail-qk1-x72c.google.com with SMTP id af79cd13be357-74e1aec175eso385293785a.1
        for <linux-omap@vger.kernel.org>; Wed, 26 Apr 2023 22:42:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682574149; x=1685166149;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LR0Obb0/BmENE+qZ28SAN6saORe3qTDJ1L4m8xmLDdU=;
        b=UBKz/wIeiSk5wOJ7rcq7aZ7I9BoJsO4E4g8njf0Un7eSrlMMRpBHadU1zXVPXSntnx
         RUcTr7ymcey7THaV2MBMgEeADuk49OiF+sxEarO91f8+4KRTDTaR1q94x0TXNuLnKDXG
         ljB0LzG1khnKf8378TX1S0CXC53z1rkKrBMAE/7m8tPR9m/1S6QeD7Oe48TAe71hYHWZ
         a4LBkfXvXHRE4w0dMLvqxrzkIp/ujHogCmKbY1SnJHIDltYshYnyINJEcSPsEI1Olk87
         Uw2OabF78bERJBXwLpkk2TpeDWCt0nShQGM8A5DS00ho+PfiPmOuGgAg0k9FwivgiBvN
         HWbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682574149; x=1685166149;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LR0Obb0/BmENE+qZ28SAN6saORe3qTDJ1L4m8xmLDdU=;
        b=KmOhgWYcCoPNapaWnJlRzlFQi+7FGUU3wpTRsAp6cC3VpYOAt43bc4Fq6gJ4nalANt
         RFXo527a5eUy8bMOL6P3GgUAmHsZ9jumWCFOsF5rjJcVJuXv83bjZ2A7T1CawxSvwUVN
         xLCKvBC2aL76URTVR+t4xxCKQqyRnhMo5I34BjG3e3nAZqjfyyunFyE6g3s2PFnk8CJr
         VKPOejwrwEClYdY01iOrqtfZ2oRsbaipXMaiVojia1mUWwO3s6eD7U/pr4lKU2rhAggL
         uqyZyBBAsRFhG+Zvj/pP5iyXRpyYOuVsQcn98snRgxLW0qd4d2iNJWkEmYe4ab9S844N
         ZASg==
X-Gm-Message-State: AC+VfDwOXr6oTT1LWhI0jqMVowfXzKotS0UgkA83HODWwlRUO19bI7r0
        /1r3bh/tmcEFqdMOdyH7GG+g6Jd1uyrP31O90FA=
X-Google-Smtp-Source: ACHHUZ69UIAYxYyUrL584ZM/d9vkyne+GaFc5zFmyq2UhO184wkhKFtU5uLwwIKMs+20aubUxGBPpjav1K18bbjCXgk=
X-Received: by 2002:ad4:5bc9:0:b0:5ef:8c79:fe99 with SMTP id
 t9-20020ad45bc9000000b005ef8c79fe99mr248224qvt.7.1682574149482; Wed, 26 Apr
 2023 22:42:29 -0700 (PDT)
MIME-Version: 1.0
References: <20230426203341.360155-1-linus.walleij@linaro.org>
In-Reply-To: <20230426203341.360155-1-linus.walleij@linaro.org>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Thu, 27 Apr 2023 08:41:53 +0300
Message-ID: <CAHp75Vc-uDQaHk39rEnC4KNT-2cV59djtzOO9h4mERGRpin9Ug@mail.gmail.com>
Subject: Re: [PATCH] ARM/mfd/gpio: Fixup TPS65010 regression on OMAP1 OSK1
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Aaro Koskinen <aaro.koskinen@iki.fi>,
        Janusz Krzysztofik <jmkrzyszt@gmail.com>,
        Tony Lindgren <tony@atomide.com>, linux-omap@vger.kernel.org,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Andreas Kemnade <andreas@kemnade.info>,
        Lee Jones <lee@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Wed, Apr 26, 2023 at 11:33=E2=80=AFPM Linus Walleij <linus.walleij@linar=
o.org> wrote:
>
> Aaro reports problems on the OSK1 board after we altered
> the dynamic base for GPIO allocations.
>
> It appears this happens because the OMAP driver now
> allocates GPIO numbers dynamically, so all that is
> references by number is a bit up in the air.
>
> Let's bite the bullet and try to just move the gpio_chip
> in the tps65010 MFD driver over to using dynamic allocations.
> Alter everything in the OSK1 board file to use a GPIO
> descriptor table and lookups.
>
> Utilize the NULL device to define some board-specific
> GPIO lookups and use these to immediately look up the
> same GPIOs, convert to IRQ numbers and pass as resources
> to the devices. This is ugly but should work.
>
> The .setup() callback for tps65010 was used for some GPIO
> hogging, but since the OSK1 is the only user in the entire
> kernel we can alter the signatures to something that
> is helpful and make a clean transition.
>
> Fixes: 7b61212f2a07 ("gpiolib: Get rid of ARCH_NR_GPIOS")
> Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
> Cc: andy.shevchenko@gmail.com
> Cc: Andreas Kemnade <andreas@kemnade.info>
> Cc: Lee Jones <lee@kernel.org>
> Reported-by: Aaro Koskinen <aaro.koskinen@iki.fi>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> This is a hopeless patch, if the subsystem maintainers are
> OK with it, I guess it should be merged into the SoC
> tree.
>
> If this approach works we can use the same approach for
> any other potentially broken OMAP1 platform.

Independently of the (potential) changes in GPIO library on how to
allocate the base, this should go upstream in my opinion as it's the
right direction to go.


--=20
With Best Regards,
Andy Shevchenko
