Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 055ED797881
	for <lists+linux-omap@lfdr.de>; Thu,  7 Sep 2023 18:47:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241644AbjIGQrY (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 7 Sep 2023 12:47:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41830 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242364AbjIGQrB (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 7 Sep 2023 12:47:01 -0400
Received: from mail-oo1-xc31.google.com (mail-oo1-xc31.google.com [IPv6:2607:f8b0:4864:20::c31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 551FE2110
        for <linux-omap@vger.kernel.org>; Thu,  7 Sep 2023 09:46:30 -0700 (PDT)
Received: by mail-oo1-xc31.google.com with SMTP id 006d021491bc7-57129417cecso588416eaf.1
        for <linux-omap@vger.kernel.org>; Thu, 07 Sep 2023 09:46:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1694105113; x=1694709913; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EM9vERMeF0RyymslElMGVcmFN1ITJOkS0HhbR6rj4eY=;
        b=E1HDHHTKx1yU9KjfuAvtfJKetwhlg5aAcPn1sSufSvwiyCmLBmx7rIVv/mZrL5SZqr
         uNEeO2plgfPq3rviQ7iGMYnzI8msg/tEnpEwNmIUS5cv7q8Y0EGrGMLP7P9Qq+fJ+jwZ
         l6IF+R14bSxVHMrcfZ8P1j0TIrVKjWeMrUxBqVhwWDBYHAsbi4yYoAwg+jO8WXi/L4X8
         LsxdpI/MywWHew/8JnXWMustzXRGOGDyjZs/A7G0FjwsYXGw5bVlI0hjzCakk3TjCAFm
         PsczBXnvAy3qx1lauBTfCs9pXPWM8tFv6pb2rwP/0CdXnae0uH7NeTKL/4nl/FoPpDZn
         yQyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694105113; x=1694709913;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EM9vERMeF0RyymslElMGVcmFN1ITJOkS0HhbR6rj4eY=;
        b=bW9IHOlq1+CcHoxzF6AqKTYOdKW0W33aVbRNpWamgV+oCYcema3tVDo/FaLsjohRjb
         alUweiQddPLD074WID9js7+hW2NLpunQRpJWZrjAWc2UattQF4JTh48u9fvT8X4gbRZF
         YN5vTm8/hd0SIkELG4ONWR/Pkwk4SbWxW3xn2wouUji5ZvUg0dvvRWBU5iBbbQAMPxpc
         ypdmWAWJ3G8kx/AA1OpJR2X4WW7K7czMIKYPNhDujlQWmRX6aQ7Vw5DbcAX8/X0k3M2F
         tll2XZalRRLLLKPRifGUWcNUoGtd4j/bjfTUIWY+GZJiSrP70GDC2HsbeGsVVz3DNbQI
         YNSg==
X-Gm-Message-State: AOJu0YxCflvQc0YAYwl0rysSRDtQnmTjaVYlPlUGvEs6TD0iQNMn3Z0d
        0sNrjs49vxxnu8Q82p52Urs49EEwIil5JhLH/pzQ6WLjosWGvgJb
X-Google-Smtp-Source: AGHT+IE8anPJZAGlVEtdUDBvfZSj/6PcDMAuKXqvs+G37inCYN9bOlMGcS0/NNLAQtkZM5qKA1KbbaOuVnGUeMyCl78=
X-Received: by 2002:a05:6102:2408:b0:447:9339:a5f with SMTP id
 j8-20020a056102240800b0044793390a5fmr1416739vsi.0.1694073488292; Thu, 07 Sep
 2023 00:58:08 -0700 (PDT)
MIME-Version: 1.0
References: <20230905185309.131295-1-brgl@bgdev.pl> <20230905185309.131295-16-brgl@bgdev.pl>
 <CACRpkdaLKqNM1xMCo9jz1Pe_18A=GJodbaTHL+VmoRZa5jJbjQ@mail.gmail.com>
In-Reply-To: <CACRpkdaLKqNM1xMCo9jz1Pe_18A=GJodbaTHL+VmoRZa5jJbjQ@mail.gmail.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Thu, 7 Sep 2023 09:57:57 +0200
Message-ID: <CAMRc=McBMTrcVpjWr2Qo2N5Z6+BEAWr6kLG_bPDmmuO=OFTtfg@mail.gmail.com>
Subject: Re: [RFT PATCH 15/21] arm: omap1: ams-delta: stop using gpiochip_find()
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Aaro Koskinen <aaro.koskinen@iki.fi>,
        Janusz Krzysztofik <jmkrzyszt@gmail.com>,
        Tony Lindgren <tony@atomide.com>,
        Russell King <linux@armlinux.org.uk>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Dipen Patel <dipenp@nvidia.com>,
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
        DKIM_SIGNED,DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Thu, Sep 7, 2023 at 9:35=E2=80=AFAM Linus Walleij <linus.walleij@linaro.=
org> wrote:
>
> Oops one more note:
>
> On Tue, Sep 5, 2023 at 8:53=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl=
> wrote:
>
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > gpiochip_find() is going away as it's not hot-unplug safe. This platfor=
m
> > is not affected by any of the related problems as this GPIO controller
> > cannot really go away but in order to finally remove this function, we
> > need to convert it to using gpio_device_find() as well.
> >
> > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> (...)
> > +       struct gpio_device *gdev;
> (...)
> > +       gdev =3D gpio_device_find_by_label(OMAP_GPIO_LABEL);
>
> This leaves a reference to the gdev right? No scoped guard?
>
> If you leave a dangling reference intentionally I think it warrants
> a comment ("leaving a ref here so the device will never be
> free:ed").
>

It's right there in the comment. :)

Bart
