Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 461F1797395
	for <lists+linux-omap@lfdr.de>; Thu,  7 Sep 2023 17:28:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231466AbjIGP2C (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 7 Sep 2023 11:28:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33322 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238773AbjIGPX4 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 7 Sep 2023 11:23:56 -0400
Received: from mail-oa1-x30.google.com (mail-oa1-x30.google.com [IPv6:2001:4860:4864:20::30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 95263135
        for <linux-omap@vger.kernel.org>; Thu,  7 Sep 2023 08:23:52 -0700 (PDT)
Received: by mail-oa1-x30.google.com with SMTP id 586e51a60fabf-1d4daca8edcso836340fac.2
        for <linux-omap@vger.kernel.org>; Thu, 07 Sep 2023 08:23:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694100231; x=1694705031; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=13mPF61qHFznELBakOuaBROvGPz0+u+UN1db/TtYWeY=;
        b=kCYsNpqcDMgHXEttCZnCJHm1E151Vu0ij9Eg8FGTNJe/NiDpSCxROYZ06jTcKgxvXS
         3YLl9Y7iNHo8byJLew6YQWLIGWKRl/9an0/fjAsmEvL/i5IEhTEKYRhRfeLM/fubgo5E
         jZ2vElMiqdlQ2f1XKrxHwyLXeWA3Vw2w18XBj4hD44/q3t+PyGqIlNARPdeLJ5ZAb/p3
         8yNcD2ZU7TOiqVN7TGL2cGi6Jdt3d1+scjC0y+J/leyGXrdiUSuJZYjGFPyhi9ePPGv2
         h0Lgh8nOuFarA00XLfJ+p0hQOi9afiwB913bLgBNeg4IyE+7f4Nj4NqTd24/5TD8Wi6E
         8kPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694100231; x=1694705031;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=13mPF61qHFznELBakOuaBROvGPz0+u+UN1db/TtYWeY=;
        b=K+KeQ/9VflO51j/eGSy7lJZqLmcMmljSc+Igb4utzt+R5upkFzoVZuD17afyhnQFO+
         guTMWm85RBZS2qRZMAR1zrKgI1IxIFZNQSB3OqSC8LiCnjNR4NFMmWN9/30z3HYAcOuM
         tGPw3APXRYaJWlu0VIp24RgbVRpxDHGXSGOuBeDFH/SrnkOg3XaWCXKi1FuPwFKj4FBJ
         lyIwbN5chfbuMgFdqd7tfKGg7fJ94pfFUx8UEzUrrqC3/zwoMUY9QcnZX0BSLck6ZPts
         PVPx0rFkdmZlsEZdB38x5XFROXG9/FL9gHkXii9oVsiAOfuJE7sZ6xaGKWiXcR4w5n6T
         VTRA==
X-Gm-Message-State: AOJu0YxpO3hrkeReentpszflH+PczmBzkUcV4gaUdJFPZE0lmkGEJIpS
        d2/KgsI+bpuecRjb+sMyEm7KVUa/FY+VZ6IbsJzOe41qEMm9dgQBMPo=
X-Google-Smtp-Source: AGHT+IEb93BSLJ6ys0EYsaB8W8EpvBdYT15JIdt6VJnTL5yTIvHPIi3k4AVOKcoqpkbYj81EENL5j+za7CaCpwJcXlw=
X-Received: by 2002:a25:d783:0:b0:d0e:b924:8e20 with SMTP id
 o125-20020a25d783000000b00d0eb9248e20mr19000067ybg.22.1694072539775; Thu, 07
 Sep 2023 00:42:19 -0700 (PDT)
MIME-Version: 1.0
References: <20230905185309.131295-1-brgl@bgdev.pl> <20230905185309.131295-22-brgl@bgdev.pl>
In-Reply-To: <20230905185309.131295-22-brgl@bgdev.pl>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 7 Sep 2023 09:42:08 +0200
Message-ID: <CACRpkdZBa7SY=3vykMSOxcQ=z8=igru5uFmyVw0zmTBvAWZTBQ@mail.gmail.com>
Subject: Re: [PATCH 21/21] gpiolib: remove gpiochip_find()
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
> With all users of gpiochip_find() converted to using gpio_device_find(),
> we can now remove this function from the kernel.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

This is so much cleaner, and introducing some scoped guards
along the way it's a clear win.
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
