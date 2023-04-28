Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2AD926F13B4
	for <lists+linux-omap@lfdr.de>; Fri, 28 Apr 2023 10:57:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345704AbjD1I5W (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 28 Apr 2023 04:57:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32900 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345707AbjD1I5H (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 28 Apr 2023 04:57:07 -0400
Received: from mail-qt1-x82c.google.com (mail-qt1-x82c.google.com [IPv6:2607:f8b0:4864:20::82c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4578B6582
        for <linux-omap@vger.kernel.org>; Fri, 28 Apr 2023 01:56:27 -0700 (PDT)
Received: by mail-qt1-x82c.google.com with SMTP id d75a77b69052e-3ef112cac17so44235131cf.0
        for <linux-omap@vger.kernel.org>; Fri, 28 Apr 2023 01:56:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682672186; x=1685264186;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mj/vGXAiNM/q7ui07vh89DWrb00dzyL39j1gjwatZng=;
        b=Oh5gwZC4Siz5H943uwtIAyxqRfdr4YcMCv+/gA801vs/+5xR/wJwGSYBDs4mwvBRsF
         bKipJ+BHkO92mZdC6DiIqNqHdl9Etp/bYY9e4ka+mtJhMrM4Thu8pNIu0qpLk/MucVDL
         n4LcLGNprRZZ5SanKAll8NqPoHgtyMLgvU+NcTzxiwAA7mjezStW/b1rRT0dkZIrL3RZ
         iZM3TQ0rZbQKObeCEVqdEJ3Rm2EfKqORvcrk7cy+1fHvb4qRT95CWqciR7lh6kLiFAw/
         OwbfRgoySnDCPYlWktdkDDxIotCKF4aBV/ZwjE0PquRrhXxineVUxhBomxydtCyTSxwm
         xI0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682672186; x=1685264186;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mj/vGXAiNM/q7ui07vh89DWrb00dzyL39j1gjwatZng=;
        b=R4qg4MGCEsnKUZF6UNRO6q+KX2XPsPxWmefVCC01eBP4uaYCfx6r8lLUqFyjbkZrYl
         1cEXZiL+auHcYD59i8wIl0EdP0tswf8oTCljVta9GjdQngJ+qrAGddBSl2+Vu/x/vsWR
         mpsLq6XOgstZ/ScPe5OFHRXdcHuwBq0jBKK9W8c8N48eVvKJbH7OuiMFcJTqj0cGn0EH
         tIs7d4p38+yyvFnYD0/g3DSgCVoWIyT5nX9Q1/t6txy0MMeHBCztDX1fVxUD1QN9Ucqz
         AYJ8Lfzs6sW/qbt+Vj1rsVB8UDTU0XT+Y5MBwXJKPUP7yILcrbEpNHAr9tnP15NvFPyb
         V8ow==
X-Gm-Message-State: AC+VfDyz4XOiX8M/e/2uFBuViUvY0yK0Cz+LFb0v3PN7oiMgxifqUXZ7
        yc1amhNxuv5Bsi5H/IJb70Z/si+EDJwfuc9PWCB0WxfSd9rd7A==
X-Google-Smtp-Source: ACHHUZ6Fq7GzItGqKsJWO9loGFuF/BX0swy+G+zWrTpe7SFzTjyJjuhWlltyM2KWYaO9r2Nd8ckuWE1oOAWN+abpLCY=
X-Received: by 2002:a05:622a:613:b0:3ef:618d:2da9 with SMTP id
 z19-20020a05622a061300b003ef618d2da9mr8276978qta.13.1682672186108; Fri, 28
 Apr 2023 01:56:26 -0700 (PDT)
MIME-Version: 1.0
References: <20230428084109.486785-1-linus.walleij@linaro.org>
In-Reply-To: <20230428084109.486785-1-linus.walleij@linaro.org>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Fri, 28 Apr 2023 11:55:49 +0300
Message-ID: <CAHp75Vd5X3f4LrzTD5X1LqNGOyymVmp=toHa5WEAtDSXGyGTkg@mail.gmail.com>
Subject: Re: [PATCH v2] ARM/mfd/gpio: Fixup TPS65010 regression on OMAP1 OSK1
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

On Fri, Apr 28, 2023 at 11:41=E2=80=AFAM Linus Walleij <linus.walleij@linar=
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

...

>  static struct gpiod_lookup_table osk_usb_gpio_table =3D {
>         .dev_id =3D "ohci",
>         .table =3D {
>                 /* Power GPIO on the I2C-attached TPS65010 */
> -               GPIO_LOOKUP("tps65010", 0, "power", GPIO_ACTIVE_HIGH),
> +               GPIO_LOOKUP("tps65010", OSK_TPS_GPIO_USB_PWR_EN, "power",
> +                           GPIO_ACTIVE_HIGH),
>                 GPIO_LOOKUP(OMAP_GPIO_LABEL, 9, "overcurrent",
>                             GPIO_ACTIVE_HIGH),

Missing terminator?

>         },

...

> +static struct gpiod_lookup_table osk_irq_gpio_table =3D {
> +       .dev_id =3D NULL,
> +       .table =3D {
> +               /* GPIO used for SMC91x IRQ */
> +               GPIO_LOOKUP(OMAP_GPIO_LABEL, 0, "smc_irq",
> +                           GPIO_ACTIVE_HIGH),
> +               /* GPIO used for CF IRQ */
> +               GPIO_LOOKUP("gpio-48-63", 14, "cf_irq",
> +                           GPIO_ACTIVE_HIGH),
> +               /* GPIO used by the TPS65010 chip */
> +               GPIO_LOOKUP("mpuio", 1, "tps65010",
> +                           GPIO_ACTIVE_HIGH),
> +       },

Ditto.

> +};

...

> +               osk5912_smc91x_resources[1].start =3D gpiod_to_irq(d);
> +               osk5912_smc91x_resources[1].end =3D gpiod_to_irq(d);

=3D DEFINE_RES_IRQ() ?

...

> +               osk5912_cf_resources[0].start =3D gpiod_to_irq(d);
> +               osk5912_cf_resources[0].end =3D gpiod_to_irq(d);

Ditto.

...

> +       if (IS_ERR(d)) {
> +               pr_err("Unable to get TPS65010 IRQ GPIO descriptor\n");
> +       } else {
> +               osk_i2c_board_info[0].irq =3D gpiod_to_irq(d);
> +       }

{} are not needed in both branches.

...

>  #ifndef __LINUX_I2C_TPS65010_H
>  #define __LINUX_I2C_TPS65010_H

+ blank line

> +#include <linux/gpio/driver.h>

Why? Shouldn't

struct gpio_chip;

be sufficient?


--=20
With Best Regards,
Andy Shevchenko
