Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C53267979BA
	for <lists+linux-omap@lfdr.de>; Thu,  7 Sep 2023 19:19:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242846AbjIGRTs (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 7 Sep 2023 13:19:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55690 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232764AbjIGRTl (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 7 Sep 2023 13:19:41 -0400
Received: from mail-ua1-x930.google.com (mail-ua1-x930.google.com [IPv6:2607:f8b0:4864:20::930])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D52BD1BF9
        for <linux-omap@vger.kernel.org>; Thu,  7 Sep 2023 10:19:20 -0700 (PDT)
Received: by mail-ua1-x930.google.com with SMTP id a1e0cc1a2514c-7a01719d3c5so1337093241.1
        for <linux-omap@vger.kernel.org>; Thu, 07 Sep 2023 10:19:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694107115; x=1694711915; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f20OVJZsVkvgr12m2GLQpGE6nkKLjOApm9F1D76ZYu4=;
        b=AoxbMfYCDwREYll/swnTAMG5I/S+5X6+PRl6LcNRI9b5SRMC1DiOXts6ZDXtDQ6aap
         YCBADiVe33mZUvWoPa6L8VRGRyhXpt83kOZr8L/A7vADu6fjSayKFcyaymOd5sJfpSb/
         p4LDVano2MKIj7au9k1FN/a3jwISCuY0KOznv2NdrOKiG3JDjSWF6pfCexsxd80+D4RN
         Hz+rQdgMqLmS2t4FwwIgDUh7k4mdfHiinOG2leW/ai2iE1Sk6+lfqN8Ts3pIuuX8nBWv
         QsChUpMvCzWlx+bZyOLHiYsh1szO22uzsOqH8pjt9sL17vLBfHoCdutAKUQ+4zMoKywo
         f2TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694107115; x=1694711915;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f20OVJZsVkvgr12m2GLQpGE6nkKLjOApm9F1D76ZYu4=;
        b=lmYmeLU68dMzagLxnWzrcTRq5jm5wc3Nt988v8XFu9UvgX6N9UTrzQujIRRqN4rLEA
         VneWqVsRoCvpO0d+KPnM/h0hvI9RCecDXNynom3rAQW07R9A23LtUTnomPF6Qv+MzLR/
         cyeY7nYM8koT9c+3RAIl9j00rBRgRM9Ziy9p4qJZ/qNb8wqndzupjrdACT9slU46v0WU
         BvYVhHvxqqMG82jQDHLs1T6mnDixQDP1Vos37RCR4w774rCee+teUMpJqgohIGY0Mj52
         Y+uw40iH9/Tz21NMT+w2iMygI9quMvwntIugJWR6tUAEzfj8Q90JP7q4+1+/HwBl5ka/
         58xw==
X-Gm-Message-State: AOJu0YyHg2GPuMXCoYtxitliGgIsLXSaii4QNplmWywRk0VPP1Xz1As1
        8v/VDnyiCzJBPwoFubIiqvdJP2I3kAx1txDo/sH0Oacoc1M45IAjjQ8=
X-Google-Smtp-Source: AGHT+IHeVaENuEkywllarylsoaxFtkX8+wcxLmOt1RC5WvBdIS3BKktFFG9wSU0jnwmUX/wjU0B+ttekv3ZROcdPEGQ=
X-Received: by 2002:a25:f414:0:b0:d73:ed30:1162 with SMTP id
 q20-20020a25f414000000b00d73ed301162mr1939775ybd.28.1694072320536; Thu, 07
 Sep 2023 00:38:40 -0700 (PDT)
MIME-Version: 1.0
References: <20230905185309.131295-1-brgl@bgdev.pl> <20230905185309.131295-18-brgl@bgdev.pl>
In-Reply-To: <20230905185309.131295-18-brgl@bgdev.pl>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 7 Sep 2023 09:38:29 +0200
Message-ID: <CACRpkdZbCjFMytzsF6Sb-6V54J+owk+zJ3oB9ZGCzAdsGwcFOQ@mail.gmail.com>
Subject: Re: [PATCH 17/21] gpio: of: replace gpiochip_find_* with gpio_device_find_*
To:     Bartosz Golaszewski <brgl@bgdev.pl>
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
X-Spam-Status: No, score=-0.6 required=5.0 tests=BAYES_00,DATE_IN_PAST_06_12,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

(Sorry for fatfinger reply)

On Tue, Sep 5, 2023 at 8:53=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl> =
wrote:

> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> We're porting all users of gpiochip_find() to using gpio_device_find().
> Update the OF GPIO code.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Scoped guards, nice!
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
