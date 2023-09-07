Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5490B7979C0
	for <lists+linux-omap@lfdr.de>; Thu,  7 Sep 2023 19:20:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238821AbjIGRUb (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 7 Sep 2023 13:20:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38264 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243150AbjIGRUP (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 7 Sep 2023 13:20:15 -0400
Received: from mail-yw1-x1135.google.com (mail-yw1-x1135.google.com [IPv6:2607:f8b0:4864:20::1135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C56F51FE5
        for <linux-omap@vger.kernel.org>; Thu,  7 Sep 2023 10:19:53 -0700 (PDT)
Received: by mail-yw1-x1135.google.com with SMTP id 00721157ae682-58d41109351so32213707b3.1
        for <linux-omap@vger.kernel.org>; Thu, 07 Sep 2023 10:19:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694107148; x=1694711948; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HY2mdAZRDyp8VLACjM3IsJrv/DB/YaVz8BTWDKGc7zo=;
        b=bfBUqVnDyTMUdT0h5SETxLCj6EcdxP5Cy2K9onRaiwDHg94m+lZZtBjEkaxb1P3J35
         jsxm/LHxFRteG+r4JTnEH1x80SRmSnCIbN32zpWznJ1K4s6AdT3vFCM3DCZ7NkP+TXWK
         KbGqtK5a7PuSI8bgJvz7r0gooAa+TnBV6GXOc9s/cKdUFMjvHYvsNz/DpJ3aP/+MnZSu
         u5Am69Pj2CVyF46yW1vQx3oj4rcqCOur3dHZxrXP++YeecsewjUusLtsaV2qwR7hGATa
         /U8QB/FxpZU/yHfHpjyMrJkKWMZiB6POeyQiL/4rKXcQ3e42DXwnaHeGccNMF3pUG/Rt
         chOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694107148; x=1694711948;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HY2mdAZRDyp8VLACjM3IsJrv/DB/YaVz8BTWDKGc7zo=;
        b=cfpHmVuzV3gdtAJ8YQBJ35hCGKMQoeby7RScMcXF1sKV1pxxwTztnWYOb33jPkPWOh
         k/KYnCRYUjfi7CcqY5b1eafCqM6pb4iRayALShWjAq0mzwvUg8jvFuBNxHNRSA8Acp/Z
         jiapyB/jVesIR4yLDserOi5jtS7OQMnSWo56F27U2wC1m1DBqWgPp5paiSWtrbtH7A00
         Nfk/wvc+wyChhpR0bl8nsPy3t8SEDiU5//wKAXO6Pzl+0IaTBykVnYJOyDLg866TmiLV
         r0zNYDoMWO/GgbmEKNWLcjRIvchXCDEqUk4EldFtFP368mMxTlXc32pMMPXGEZEZkq1X
         AWZw==
X-Gm-Message-State: AOJu0YxUfgKBFEvOBs4COhQ+DW3gEaPlYsGu1FIsdLqU+27aUf9AVGKU
        YwYT0TQ5Mw7bycu2G9xoWg6aOLqR1dT6wmHQABrBLjxzNFZpLajJux8=
X-Google-Smtp-Source: AGHT+IG0DLNKfUPhB/XHRakKjzQvJdJ2oAW9KHDtArjRFCSpF0Q5z+EJuu/6b8snoqW3fkVGsSaqNy6kxIliPZAjMsU=
X-Received: by 2002:a25:dc04:0:b0:d4a:499d:a881 with SMTP id
 y4-20020a25dc04000000b00d4a499da881mr2163263ybe.9.1694072375343; Thu, 07 Sep
 2023 00:39:35 -0700 (PDT)
MIME-Version: 1.0
References: <20230905185309.131295-1-brgl@bgdev.pl> <20230905185309.131295-19-brgl@bgdev.pl>
In-Reply-To: <20230905185309.131295-19-brgl@bgdev.pl>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 7 Sep 2023 09:39:24 +0200
Message-ID: <CACRpkdYOp5162vhQXBp9FwLZzXnjByYHt8OurK4aUyQmJzgfoA@mail.gmail.com>
Subject: Re: [PATCH 18/21] gpio: acpi: replace gpiochip_find() with gpio_device_find()
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
> Update the ACPI GPIO code.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

With Andy's comment addressed:
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
