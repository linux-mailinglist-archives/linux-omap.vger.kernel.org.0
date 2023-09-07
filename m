Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3DE407979E3
	for <lists+linux-omap@lfdr.de>; Thu,  7 Sep 2023 19:25:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234751AbjIGRZb (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 7 Sep 2023 13:25:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48922 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234340AbjIGRZb (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 7 Sep 2023 13:25:31 -0400
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com [IPv6:2607:f8b0:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A43DA1BFC
        for <linux-omap@vger.kernel.org>; Thu,  7 Sep 2023 10:25:05 -0700 (PDT)
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-1c1e128135aso10232255ad.3
        for <linux-omap@vger.kernel.org>; Thu, 07 Sep 2023 10:25:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694107454; x=1694712254; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2Rz9GiS8mTfnAVkN8QSO49dpqTEISv8k2Dk2MfoLtSg=;
        b=K0oOc71C8dLVzSj09Miik1mLUcoE/7wetf2zSaS6jF1KYbsQpIYG8Z+NjWM5nNf6HD
         F1+iDWE1CcEazKcJlT61f1s03U7W6ML1ib0h+hWNoPCLRsFn2+dT8HAfNJ28ku7oEi/m
         EQNW4nsve34gku9CBWB4QrU2eY2AeGTYco4R84kYd9TxViJ60LdkZlytpV6bSlJwVaV1
         4heZXUVuqzee3CCdDUqd5Qiz3HThr/77nVXPw3r3z/flBmapD3kVQeCpLd0H3igaHG0v
         dIGLPXK4ND4CGYIJMrZAcqji0lSTBAXbbaq9o881uz0s1L8tS0wO7ZIbFB/4hw11nYXu
         7zxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694107454; x=1694712254;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2Rz9GiS8mTfnAVkN8QSO49dpqTEISv8k2Dk2MfoLtSg=;
        b=iQ4eTFzYosejYOdgMcErNCMFeGHrd/HO0dn/1WURc3xzGrPlb7JI+xdWn3uii1EAvt
         jEPlgEkIrAgCmeJ9ZLvCCSFHaakAkih8hWv0uXNgBQDTFAruZv7IfvvVSmToHZfzXYWj
         zpiCHxEg32+WOLONX0D2Jvn+Mg4Wxgi44hy7qUxB4362RakdWxsGLMbaFEGybdQYcite
         +DwqpFAb5NYZmQXA7BdOGy4us+m6mUjFrua8KJSUAzXKIDNdOtzFT3YYDgMm18fd+DZt
         VgtO9bQJ+BXvhvqbtkJZ7xi++/WEXBu+gzUVCoqL5HmfgYt5O0nzmFYud+0KAkuG/5xH
         +hcA==
X-Gm-Message-State: AOJu0Yz6dDMnB8Jw2hnVDRNIc+8SRjwLalvCjPB6umtAZwBYUdD+qjs9
        TxRkKljpRVD5js8R3RfiV6vJjOHFBi36IITF88x2hoPbVtjy0PWClOM=
X-Google-Smtp-Source: AGHT+IFnux13voMEYKL2AvFFZ2IntVTZOtmPk8jRTbyWfstIdLEdj42EUj9cU8dCaEOekjzsm7vjd98pJPwVLSbOMrc=
X-Received: by 2002:a05:6902:120e:b0:d78:1b39:fd03 with SMTP id
 s14-20020a056902120e00b00d781b39fd03mr22126055ybu.64.1694072432520; Thu, 07
 Sep 2023 00:40:32 -0700 (PDT)
MIME-Version: 1.0
References: <20230905185309.131295-1-brgl@bgdev.pl> <20230905185309.131295-20-brgl@bgdev.pl>
In-Reply-To: <20230905185309.131295-20-brgl@bgdev.pl>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 7 Sep 2023 09:40:20 +0200
Message-ID: <CACRpkdZkPbvDTMo_ZOJ8rZ5+dUOqOi2_EfS+jzreWjMtpJrVYg@mail.gmail.com>
Subject: Re: [PATCH 19/21] gpio: swnode: replace gpiochip_find() with gpio_device_find_by_label()
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
> We're porting all users of gpiochip_find() to using gpio_device_find().
> Update the swnode GPIO code.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

With Andy's comment addressed:
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
