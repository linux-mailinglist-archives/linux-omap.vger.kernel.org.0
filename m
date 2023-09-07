Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 29FFF797927
	for <lists+linux-omap@lfdr.de>; Thu,  7 Sep 2023 19:03:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238017AbjIGRDk (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 7 Sep 2023 13:03:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40530 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238608AbjIGRDj (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 7 Sep 2023 13:03:39 -0400
Received: from mail-ot1-x32b.google.com (mail-ot1-x32b.google.com [IPv6:2607:f8b0:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5BF4F1BEA
        for <linux-omap@vger.kernel.org>; Thu,  7 Sep 2023 10:03:13 -0700 (PDT)
Received: by mail-ot1-x32b.google.com with SMTP id 46e09a7af769-6bd0a0a6766so877519a34.2
        for <linux-omap@vger.kernel.org>; Thu, 07 Sep 2023 10:03:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694106104; x=1694710904; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UdWsNUufxYU54d2v+3Wxi5MrfQGJIJLOBq5vhtohyVg=;
        b=BGOjwzT/TSRGkXZWXlN34j+Z8mVmIsID0dRjnIzfJxdm9YG0HvwFDVZ/CX0KBQq3w1
         ShVMkGCZgGnTT1Gor0EHfUL5Qxnb7LIqfg9YBD7jHwqMypeOoQrR3EqUopx+AP8EkgYk
         NpNrGpGlHZBZHHy/axZ+5BbzBeffQhxo5zGDg59PdMjHwgpnV1XsHVO06proXybVXrhA
         JIfmjAif7Ew6Gq+7JMRpq8IKOSQRouloYKn/uQRAsSvOZ5qSuKcnfF5tRGE/JiKk41C2
         rIMaUCQndYL2QevOcqzkPRoieERSocebt0DXM2eCVvysHi00pfdgehQZEqZdEIr0g0Pq
         KFiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694106104; x=1694710904;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UdWsNUufxYU54d2v+3Wxi5MrfQGJIJLOBq5vhtohyVg=;
        b=XWypGWNYOnXzTBUqqtAGhUgg1PbxGKhsxOubeOFkM3eX0MyaNIVS4VUOLj5RPZcTTj
         j0HdjJmv/qQjq0UYG2DgEXgqxxWhxDYKaQS9m30M5sucwnisg/+8ojViLYVbGPmYWKuf
         R+woQN3OXxUIneYHZ1Joe1ZlS//fssM0t2rD5MYvK9t+JWaklTxfE/q1t7hWOzRwPQO2
         V1F2qNsocanDnvJu34bZ2lvBlA2/dxtENPrQn1QiLqDHMj6HXKqr25xPw6fl45WSuPMN
         6ycP6PQH7Fucqepzh6GVMwu88XcpWaCixW3M/5EYHqEFJFkncZeAljlPliPfDqujIqEk
         2Z+g==
X-Gm-Message-State: AOJu0Yxix5sCawVuKUwtK8DQGmu1UO0r/LVGZBTlio1EnfpYZfcENP16
        NvD160plm+L7gqdVyrZpuIaEs9kVFZXgOtSFFwHXFd89a7f9sMy4v4w=
X-Google-Smtp-Source: AGHT+IGMY/aPJYeBu1Pp0IzmGxqtgA0g7tRf3VGot5Pdq6hh1Y77T4EpHI+nXikBBcDxY/Os4mlIAHH2bnKyBxN7wMo=
X-Received: by 2002:a25:258f:0:b0:d7a:edf3:f0a9 with SMTP id
 l137-20020a25258f000000b00d7aedf3f0a9mr17868648ybl.50.1694070333187; Thu, 07
 Sep 2023 00:05:33 -0700 (PDT)
MIME-Version: 1.0
References: <20230905185309.131295-1-brgl@bgdev.pl> <20230905185309.131295-3-brgl@bgdev.pl>
In-Reply-To: <20230905185309.131295-3-brgl@bgdev.pl>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 7 Sep 2023 09:05:22 +0200
Message-ID: <CACRpkdZEphqvwpid7QzXuYX79q2==58eKT7wg9Cmr8m1FLOuRA@mail.gmail.com>
Subject: Re: [PATCH 02/21] gpiolib: provide gpio_device_find()
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
> gpiochip_find() is wrong and its kernel doc is misleading as the
> function doesn't return a reference to the gpio_chip but just a raw
> pointer. The chip itself is not guaranteed to stay alive, in fact it can
> be deleted at any point. Also: other than GPIO drivers themselves,
> nobody else has any business accessing gpio_chip structs.
>
> Provide a new gpio_device_find() function that returns a real reference
> to the opaque gpio_device structure that is guaranteed to stay alive for
> as long as there are active users of it.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
