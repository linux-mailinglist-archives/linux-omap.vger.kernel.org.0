Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2ECDF797C98
	for <lists+linux-omap@lfdr.de>; Thu,  7 Sep 2023 21:15:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231271AbjIGTPK (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 7 Sep 2023 15:15:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45926 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230484AbjIGTPJ (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 7 Sep 2023 15:15:09 -0400
Received: from mail-qt1-x82a.google.com (mail-qt1-x82a.google.com [IPv6:2607:f8b0:4864:20::82a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3DA35A8
        for <linux-omap@vger.kernel.org>; Thu,  7 Sep 2023 12:15:06 -0700 (PDT)
Received: by mail-qt1-x82a.google.com with SMTP id d75a77b69052e-4135f3d1213so8328451cf.1
        for <linux-omap@vger.kernel.org>; Thu, 07 Sep 2023 12:15:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694114105; x=1694718905; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sZM5LCrIIZq6Cza2RJhNNmn9rDXfdqmiDRo4rHF5ssg=;
        b=xetZzFAMLtLybLBkLFicajZyebGZvu9+FPamy8zZziK4St9PVPJ5A2U35OgQFdCB+M
         n4KWG1MOV0hndiebImURCmbie5/hQughFb+G+9CdKqvlQM9JoHOKbWbCzYjCB+xz/w2X
         nYE0Upzfs4+bYD+cPVY38yN5/qRyRVyU1uvJRV2BNKT+JAKmjqUPWK5tdFPsiMdavsVC
         txORi/eRuaNz0pXHt69Gsjgc7D2W/wg9Mam/XH/dA+AfS+ci+OeriseAP6Q+3rirRqPG
         HPR0b5KN6Wiiq6ZI5ftO6OefDmAI7RWSpUA/COUtSOL6J2TKFXocsBYWXjW+gytK6bHQ
         dONQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694114105; x=1694718905;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sZM5LCrIIZq6Cza2RJhNNmn9rDXfdqmiDRo4rHF5ssg=;
        b=OUgbamKx6bZbo+Ri5mAJ6mw8Yjuji3KubDQQwdpwOyQA/B2Cw44CJ+7sH8kENsNmbb
         bUAoY8vKv4ewUARumdtZB3y5OQbtkdzgrX11zaxZfAz3lGZ8o8jB1fx2MvBZTV/EZtrA
         HipiBtxoR6WZGJNE/C4kgWk3QdCNDbSxo90XuDXgouAA2k3kwIyX+mazxLM+BIWZ8qu7
         wRLoK75x5DaJluuaIm/DQdBqTwdXnIENwhWLPLCtic39qy07vH0r6q4XH5ZffiNJLkjf
         ustE3z+LSk59Sdj6qFV71NssxmRfrLnbGpTchHz0wECXjUN/lmYPYY9c+IhHZoEgsSCQ
         4/sg==
X-Gm-Message-State: AOJu0Yz1Pfb8cBhVkDwPkYwK5DLrlwSmezgjgAX9++j979yBwwPviKbv
        4UZ8Adz3qv2psqJhHkNB+MQq8fC9bT0RIKOxdhQMURjAOkCTqC09cjY=
X-Google-Smtp-Source: AGHT+IHhj18itEgT7Zkm6inaHN3nE+QPEGLPicrIzqqx/vXBzW0adJyqRztqORI4Xy/4ylPWC4tCJ9Ht9cCQq18uOlw=
X-Received: by 2002:a25:aae3:0:b0:d1a:955f:304d with SMTP id
 t90-20020a25aae3000000b00d1a955f304dmr18305004ybi.64.1694070633444; Thu, 07
 Sep 2023 00:10:33 -0700 (PDT)
MIME-Version: 1.0
References: <20230905185309.131295-1-brgl@bgdev.pl> <20230905185309.131295-7-brgl@bgdev.pl>
In-Reply-To: <20230905185309.131295-7-brgl@bgdev.pl>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 7 Sep 2023 09:10:22 +0200
Message-ID: <CACRpkdadcw=E38o=cNWT4fQ_PK0UPifJZdVjuXTw0cjxPAEaKw@mail.gmail.com>
Subject: Re: [PATCH 06/21] gpiolib: provide gpiod_to_device()
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
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DATE_IN_PAST_12_24,
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
> struct gpio_desc is opaque so provide a way for users to retrieve the
> underlying GPIO device.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
