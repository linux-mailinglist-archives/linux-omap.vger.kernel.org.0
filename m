Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AD2B0797AE2
	for <lists+linux-omap@lfdr.de>; Thu,  7 Sep 2023 19:55:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237564AbjIGRze (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 7 Sep 2023 13:55:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57364 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239463AbjIGRze (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 7 Sep 2023 13:55:34 -0400
Received: from mail-qt1-x82d.google.com (mail-qt1-x82d.google.com [IPv6:2607:f8b0:4864:20::82d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C29F191
        for <linux-omap@vger.kernel.org>; Thu,  7 Sep 2023 10:55:07 -0700 (PDT)
Received: by mail-qt1-x82d.google.com with SMTP id d75a77b69052e-4121130e7afso8519701cf.2
        for <linux-omap@vger.kernel.org>; Thu, 07 Sep 2023 10:55:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694109301; x=1694714101; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wBdELFiF0kNq2P4ovxPr1G/v1B3B5Z0Pa4x1EdUn7xY=;
        b=Wn5uFrkHB3Cd3BnQviRbSAzuqmmdJGWuU1xnhPo2o1tx9uCc08WtTTcdegevvTpLRG
         rwglsGf0qKbxtoNkmk2gTo7iSKLPElHTQ2uugc0FwKanOEwoRkKfCn5eHf4gF3hqPfsy
         npfZgYagjH6+qqwk6uygnGlpoTAfpq9RSMU7pzjqYyVQDF9CFMymad9laCVg5X6xUYjt
         aUPH9hKtbI/blGSrv0nMY8Ns1u5Yy7PcUmjSF2JkFm1XJE3P68aK5AC8ierFfOxu33Xa
         qZj7Cp0/kBLpspGAyrpA8zcvQ4rfl3OrzFmy9qTALBXyNQIhpEBTlAVHHp2q4adZoH77
         u2ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694109301; x=1694714101;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wBdELFiF0kNq2P4ovxPr1G/v1B3B5Z0Pa4x1EdUn7xY=;
        b=obKlVPhiteaQR8s80a4xyAh5nZfY2zSFI1h88zXVX3i0whXiFbRN56MKHt7U9jJzOI
         ZfdhyCebZbp8CgSqU8g35DQGLzY7/yQWUKQWGu0QE55rQ+L30ugdaj59TAGGNb6O3gks
         hdDO6JfhCBOszkW6HVbxtRX4Hwz0tzKXj8G1Tt+EUPqItcytR7M8YNk8h1CcMADYehgg
         s9NIhakoQBm/5eLpehF5JlqMO6HwrXMVemxSdETVLpFeS3qneZa70ZJOK5QO9kAvGJu3
         sPpm4qpNbl/DJkkNyUAwFofvPpzsZLQ4IbDrwPz5HKu8rmIyHxFiIxk+0UGV5jcjzGhU
         k10w==
X-Gm-Message-State: AOJu0YwH7EYgIPFaYZe2oapiyjWFg2vPE11jXsJ1rQar80e9A/Myo0ot
        iPNV9NLjAo+G5YkXNTsPbnl82ScnNUVXnJ1OGLdz3EA60AR0P1jSTt0=
X-Google-Smtp-Source: AGHT+IGquAMmj4BV1IgcH+0hlmwrCPO8RvK5dDPIHBFPHMvw3mBi9yKQYdiyjPsOt1CRLSecOSiNHyNGSnbycipPFpA=
X-Received: by 2002:a25:4057:0:b0:d7f:1ef3:66a9 with SMTP id
 n84-20020a254057000000b00d7f1ef366a9mr10826771yba.15.1694071032928; Thu, 07
 Sep 2023 00:17:12 -0700 (PDT)
MIME-Version: 1.0
References: <20230905185309.131295-1-brgl@bgdev.pl> <20230905185309.131295-8-brgl@bgdev.pl>
In-Reply-To: <20230905185309.131295-8-brgl@bgdev.pl>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 7 Sep 2023 09:17:01 +0200
Message-ID: <CACRpkdbdcPv1LHL2W-enKBJ2OARpduoOJkQ64oL6GSOfmmD3qQ@mail.gmail.com>
Subject: Re: [PATCH 07/21] gpiolib: provide gpio_device_get_base()
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
> Let's start adding getters for the opaque struct gpio_device. Start with
> a function allowing to retrieve the base GPIO number.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

I guess you have a solid usecase for drivers needing to do this
crazy thing, because I suppose you feel as much as me that
this should rather be gpiolib-internal and confined to
drivers/gpio/gpiolib.h?

If you add a valid reason for making this globally visible outside
of drivers/[gpio|pinctrl] to the commit message I guess I can live
with it because we need to think of the bigger picture:
Acked-by: Linus Walleij <linus.walleij@linaro.org>

It brings to mind the now confusing "base" inside of
struct gpio_chip. We all know it should go away, but since it
is never used during the lifetime of the gpio_chip - or SHOULD
never be used - it should rather be an argument to
[devm_]gpiochip_add_data( .... int base);...

Maybe something we should add to our TODO file.

Yours,
Linus Walleij
