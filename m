Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A724B797C66
	for <lists+linux-omap@lfdr.de>; Thu,  7 Sep 2023 20:54:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233794AbjIGSyL (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 7 Sep 2023 14:54:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37818 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232031AbjIGSyL (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 7 Sep 2023 14:54:11 -0400
Received: from mail-ot1-x32c.google.com (mail-ot1-x32c.google.com [IPv6:2607:f8b0:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB6D810FC
        for <linux-omap@vger.kernel.org>; Thu,  7 Sep 2023 11:53:31 -0700 (PDT)
Received: by mail-ot1-x32c.google.com with SMTP id 46e09a7af769-6bf04263dc8so963746a34.3
        for <linux-omap@vger.kernel.org>; Thu, 07 Sep 2023 11:53:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694112809; x=1694717609; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9b7v8ynf43I8EPh86qv2+Qihb/MMTTB3QC+Af1PR4Qs=;
        b=Qul2obVHMTa4vwnYRPBu/YYmRKCCS2EO2Bs/knMnn0fyq9Ys1wwS46esEejkUrZkLD
         mL2wykMcERrFhWDEM7zdtJ+rv2VrLnFVHRcfRDDCRyq175QMBa+YnsOtVqw1lgLSfU6l
         8+4PZS9Z6f9P25nUW9zaxTXeSp03EEYx6E1tUJmzGnSrBsT9momtPN6Ihs68JCfMOaPY
         Dv6aiPdRQo8awaffflZNgGaX3rlwP1pD6teRFFN1rT0CwA/76dn+GgZ+6adbyQpqTNb+
         p9EiCEIXzyxJkn2AydzqjOBza0ahZGHhbq2LEGDTKxpvghVFTraJzvilI+KzNHQsaZs3
         y12A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694112809; x=1694717609;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9b7v8ynf43I8EPh86qv2+Qihb/MMTTB3QC+Af1PR4Qs=;
        b=WMXWih3QoqwSpLT6m+JtIg7Gl3coVD1YKxGtaw13RqVshQ9r3pKHV18p+S0Yro5KO9
         gOOk9nZUKwVNjT1aan3vf7mQsmyDp/55UqQUSRAswYeGw6VZc036eRxufmA2RUKa5Bbl
         1aTLWc5n8isX5DQjuAbwHvqV0JlhCakfLtB0/xs+dZf1jDPb/7TXFXCcfnrEQJYTQNgs
         XHbA7kLRWZRPcyN0yfN+PhP6A6SM6qB+KduljSsCmVUZvlv2etkjAnrmH8rBLQjMQcE3
         cYNkGxw96932qCfMi1Z3eTgd0swEScwFyOToPNEv8/u/lS/GV+7Jt1vdemvzZnRQaCB+
         /KHA==
X-Gm-Message-State: AOJu0YwwvC3wkJLcSMgEO3LoPIxuu05zw2zIgr7ZQAcW5XihETwWXSkS
        +wI/pdU5VJfitBgF9T5sJD4rk3GU9vzxhFwwF4Nt5ls9dPNvqn+i2P8=
X-Google-Smtp-Source: AGHT+IFBMY2aVjLfU4IGVauVzzx/POp8es0I/Cix3TKhZtX3AA6hztSUPcllgbHHruPMjhuUvCKYwAD/N3CsJPq8yKo=
X-Received: by 2002:a25:bc53:0:b0:d62:6514:45b7 with SMTP id
 d19-20020a25bc53000000b00d62651445b7mr18630990ybk.37.1694070562057; Thu, 07
 Sep 2023 00:09:22 -0700 (PDT)
MIME-Version: 1.0
References: <20230905185309.131295-1-brgl@bgdev.pl> <20230905185309.131295-6-brgl@bgdev.pl>
In-Reply-To: <20230905185309.131295-6-brgl@bgdev.pl>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 7 Sep 2023 09:09:10 +0200
Message-ID: <CACRpkdbAeBQj2RUjj9ybaAiytvtgpF4PXFvX+S4C0ZVP0bb8Rg@mail.gmail.com>
Subject: Re: [PATCH 05/21] gpiolib: add support for scope-based management to gpio_device
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

On Tue, Sep 5, 2023 at 8:53=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl> =
wrote:

> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> As the few users that need to get the reference to the GPIO device often
> release it right after inspecting its properties, let's add support for
> the automatic reference release to struct gpio_device.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Needless to say, I'm a strong advocate for scoped resource management.
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
