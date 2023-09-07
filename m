Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DB87A797584
	for <lists+linux-omap@lfdr.de>; Thu,  7 Sep 2023 17:52:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235836AbjIGPrk (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 7 Sep 2023 11:47:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37508 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344793AbjIGPdu (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 7 Sep 2023 11:33:50 -0400
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com [IPv6:2607:f8b0:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 63FD8135
        for <linux-omap@vger.kernel.org>; Thu,  7 Sep 2023 08:33:25 -0700 (PDT)
Received: by mail-ot1-x334.google.com with SMTP id 46e09a7af769-6bcac140aaaso830256a34.2
        for <linux-omap@vger.kernel.org>; Thu, 07 Sep 2023 08:33:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1694100769; x=1694705569; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BYCw6MjcMH0VBXX64k2n7JI1Ap28j06fLMRRfYT33EM=;
        b=KUQLMcLYv2gf+qTyk6LTA4MfyeQpo7B8iOvuAzU3fdatXOlv9N21BdeGg+W6rgelE1
         0ciXmXHeT/xL5Hh8CVdTc+FnWV9Be3NB9Y2bnqXo1Gt03hATMNAkDE4dopGDj9N681mD
         LprCOpW62JfLv+h+bZaDprnvk0mM0Fhkq6Q9q8ncos9K1QG9VHuK1be8TvnAM5n51bNY
         Qjv6sIZ7IaDuLGQwaGdxPZRgOr+L0IOzs26AaR3jdDnXMgUPJ76suyAPdPVxT5BaoH9O
         KdLEE0cWOhmHxXrBU8eS3YHZ7gkBs5wbhdQ+2KITvcNueqHGCmNB3fKeMPEYLY8xWEkL
         jvcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694100769; x=1694705569;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BYCw6MjcMH0VBXX64k2n7JI1Ap28j06fLMRRfYT33EM=;
        b=HhgvQCmPPtCo2edlx6AVDqLpb5QXT46C2h5CW2Em6+pY/TxNdlfnbk7sRk/ug9DlW+
         ukXX0HiXboLG9RxorxXzS43d/ywhyW39D2538Nu5tVhs/fSVOsIyVkrTOatRWqsrDHXn
         78Z1ankefdYZRjNddsr0KubLZkOURq5yU0HpqgNCO1Vbh0pxoyuGp/04lXnftBGnD261
         HaAtZIYeIiqO6OWAP/ZgJOF1iCTMmY1xIIdqqI1h4pHHv6sZpB0KqIR7k66q3jniOGR+
         XD9w2xxsCDHkCnV4u9OLKyNqHKl7ZXqS6sqFwP3Py5ZGCGsqxW1lwGgpAj+TW+esESQM
         taTA==
X-Gm-Message-State: AOJu0Yzb7QeE/BYYQdcWslVSBlL1Xq4jxHeshMc2d7/4ofC0z3b4ZBnO
        otCJ+1N589h2et8X/9YSeGjSGNhF67KKx2mbdUre3LQT2L9pYQuF
X-Google-Smtp-Source: AGHT+IEKK3pIZHt2QRqcId7nWRc2DLGZhZ7BIVl+nPAXJnwX2Sf45+9R0pQFVmMx9pkduIAsjCSxAhDM52WNmcfhZPQ=
X-Received: by 2002:a67:fa11:0:b0:44d:6290:e422 with SMTP id
 i17-20020a67fa11000000b0044d6290e422mr4850316vsq.35.1694073434785; Thu, 07
 Sep 2023 00:57:14 -0700 (PDT)
MIME-Version: 1.0
References: <20230905185309.131295-1-brgl@bgdev.pl> <20230905185309.131295-8-brgl@bgdev.pl>
 <CACRpkdbdcPv1LHL2W-enKBJ2OARpduoOJkQ64oL6GSOfmmD3qQ@mail.gmail.com>
In-Reply-To: <CACRpkdbdcPv1LHL2W-enKBJ2OARpduoOJkQ64oL6GSOfmmD3qQ@mail.gmail.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Thu, 7 Sep 2023 09:57:03 +0200
Message-ID: <CAMRc=McSBBeHi5jDVYOF6s1etfQzYRNLo25LeY+DWG_2tEf7=w@mail.gmail.com>
Subject: Re: [PATCH 07/21] gpiolib: provide gpio_device_get_base()
To:     Linus Walleij <linus.walleij@linaro.org>,
        Dipen Patel <dipenp@nvidia.com>
Cc:     Aaro Koskinen <aaro.koskinen@iki.fi>,
        Janusz Krzysztofik <jmkrzyszt@gmail.com>,
        Tony Lindgren <tony@atomide.com>,
        Russell King <linux@armlinux.org.uk>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <markgross@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-acpi@vger.kernel.org, timestamp@lists.linux.dev,
        linux-tegra@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.4 required=5.0 tests=BAYES_00,DATE_IN_PAST_06_12,
        DKIM_SIGNED,DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Thu, Sep 7, 2023 at 9:17=E2=80=AFAM Linus Walleij <linus.walleij@linaro.=
org> wrote:
>
> On Tue, Sep 5, 2023 at 8:53=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl=
> wrote:
>
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > Let's start adding getters for the opaque struct gpio_device. Start wit=
h
> > a function allowing to retrieve the base GPIO number.
> >
> > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> I guess you have a solid usecase for drivers needing to do this
> crazy thing, because I suppose you feel as much as me that
> this should rather be gpiolib-internal and confined to
> drivers/gpio/gpiolib.h?
>
> If you add a valid reason for making this globally visible outside
> of drivers/[gpio|pinctrl] to the commit message I guess I can live
> with it because we need to think of the bigger picture:
> Acked-by: Linus Walleij <linus.walleij@linaro.org>
>
> It brings to mind the now confusing "base" inside of
> struct gpio_chip. We all know it should go away, but since it
> is never used during the lifetime of the gpio_chip - or SHOULD
> never be used - it should rather be an argument to
> [devm_]gpiochip_add_data( .... int base);...
>
> Maybe something we should add to our TODO file.
>
> Yours,
> Linus Walleij

For this series it's the HTE driver that uses it and I don't have a
good idea about how to change it. Dipen?

I would also love to make pinctrl not use the internal GPIOLIB header
so it'll be another user, unless you can figure out a way to not use
gc->base? :)

I think we're stuck with it for now.

Bart
