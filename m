Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5463D79780A
	for <lists+linux-omap@lfdr.de>; Thu,  7 Sep 2023 18:40:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230206AbjIGQkf (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 7 Sep 2023 12:40:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60140 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237607AbjIGQkV (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 7 Sep 2023 12:40:21 -0400
Received: from mail-vs1-xe2a.google.com (mail-vs1-xe2a.google.com [IPv6:2607:f8b0:4864:20::e2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 568EB4689
        for <linux-omap@vger.kernel.org>; Thu,  7 Sep 2023 09:38:26 -0700 (PDT)
Received: by mail-vs1-xe2a.google.com with SMTP id ada2fe7eead31-44d4cef5effso466035137.1
        for <linux-omap@vger.kernel.org>; Thu, 07 Sep 2023 09:38:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694104646; x=1694709446; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Vz1SpvYEblGQIUFOwvXI44dywFm7Krfl3gOSvV8SUSg=;
        b=MzCvCXPHqGKaJ5rpB4N14TBwqASLq3RttLB2ou5craaxd1fdAejToXRhq25qtoymZ0
         K0nsjXTxkoflXWYTKtL+6XuGRRR3uQsYKFR9dYi2UZOvs1cDx4hjVcuFvedS/zEp3s9+
         54r/hYbppMELpW7H4EeqFgmj0IxLc1nMwTYTU9cJrVgRHF3BTgCkf5JvOOrQSSJoukGF
         +i7YuM/BqsNYC/k62vVI3L9yUUUk9SRmEvWcNa1lnwYDv7J8/Upp6ZI3LjAcIWNX3Dtg
         DQ/lepjkW4Hwu+F1AjZBRKwX03efEAADNrG2toJ+bn00w8cmqItCB3wxQP7Ev8rFBFUo
         ov5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694104646; x=1694709446;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Vz1SpvYEblGQIUFOwvXI44dywFm7Krfl3gOSvV8SUSg=;
        b=STeuKKUnfXXHwMaLhax8I4+6LG+jdn7um70bJQ/d3ZIIx+64GSwGZ8DOgIS6TYtZfA
         cN6aaE3f/d1caDiUKPsAXA942/4j2Doyu+gEBMCgcbvYmwsclytfNWfeTlqpG0x4HXlI
         VBnrg8MlgAF5/474ardnFn6tAqA9gG+lMo/k49gyE1oI+vLbUarsZezkkA7h/S8XrGP2
         al/+f2AOzT1PPrYFd40Yphy61Q/WNaQOom5n5Or65hC7L7OijeXpM+FevB1JaNqK0MtZ
         RAgdSCEVpND/vbLTFOg15WokN1vAo4Nxa7keDC/wwRC90hC3RQT+COqMDqeIxda7WYWC
         CBFQ==
X-Gm-Message-State: AOJu0YxLII3w+paw9SAOGW1GYh5OizG2kPkeDoEDyZfDR4YzNOn+aOyG
        68cp69XYfTGeYxAGOoviz764rllG9MwBQjZYmAWZ5pABY/R4enrU
X-Google-Smtp-Source: AGHT+IFX/4eyumxiC7nEFR+XPxzCJ5uyMTs6iy7ZgZ+cx415alKaYaIdPMXy/YLPsS1BT9j2oJ541saIGrDoN3xslRU=
X-Received: by 2002:a25:838b:0:b0:d35:f59a:6e46 with SMTP id
 t11-20020a25838b000000b00d35f59a6e46mr18424020ybk.49.1694072273274; Thu, 07
 Sep 2023 00:37:53 -0700 (PDT)
MIME-Version: 1.0
References: <20230905185309.131295-1-brgl@bgdev.pl> <20230905185309.131295-18-brgl@bgdev.pl>
In-Reply-To: <20230905185309.131295-18-brgl@bgdev.pl>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 7 Sep 2023 09:37:42 +0200
Message-ID: <CACRpkdaq8jwYLWfqvmjJFyxRPktTSTt-FY_OoPQ-ymU3fFk41w@mail.gmail.com>
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

On Tue, Sep 5, 2023 at 8:53=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl> =
wrote:

> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> We're porting all users of gpiochip_find() to using gpio_device_find().
> Update the OF GPIO code.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
