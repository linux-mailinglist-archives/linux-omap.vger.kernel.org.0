Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A11747978DB
	for <lists+linux-omap@lfdr.de>; Thu,  7 Sep 2023 18:56:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230180AbjIGQ4V (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 7 Sep 2023 12:56:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57746 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244810AbjIGQ4U (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 7 Sep 2023 12:56:20 -0400
Received: from mail-vs1-xe2f.google.com (mail-vs1-xe2f.google.com [IPv6:2607:f8b0:4864:20::e2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 57393199A
        for <linux-omap@vger.kernel.org>; Thu,  7 Sep 2023 09:55:57 -0700 (PDT)
Received: by mail-vs1-xe2f.google.com with SMTP id ada2fe7eead31-44e8fc5dc63so462077137.2
        for <linux-omap@vger.kernel.org>; Thu, 07 Sep 2023 09:55:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694105703; x=1694710503; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RoLVfI/Qa17hM0LLGxXlqleEL6Bcc6ph7u/GtpOctOM=;
        b=EO6jadzKJQ3ckDu5hOoXH9gAVBNpn7ElIJXR5wDTd4Yywg8fE+aemVNt88yS2BcdMk
         /S29COyV5Vmv9H+yMdLV3jTFGYngW5aLCXhpcUmTeb3Jq9fD58X8D/Z7cf7MPBcH4XMU
         bc3C/lGxrEl1IVSCl5dQmtq3K4+V/JTLq7HPO8qBP2NnSkOuY5d51cCfmEVW+vYf7XXI
         XYqSYLIlHq3HeAIeTTmGVWWfIpbt6i5L+LGzijXtwwWeWU7H/8iVV1HA7Qt8VtFScv+c
         hqo8nbsKMWPK2Qs8HR+DvvitG0om7eWl8oMVzASdeJ0lSDC27O9BvuKr3Jxl38If+i0I
         evTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694105703; x=1694710503;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RoLVfI/Qa17hM0LLGxXlqleEL6Bcc6ph7u/GtpOctOM=;
        b=E+MB0K8zq5G56RqUnl/N/PCdXoxbQ/xbD2gfJtbbrYDLKm8igm3JuCY/Qm+QZCewRc
         7ELvyBc8prJKZJDgdp5gXWrBS6829RrI6PW/hwxJD507yRjBKU8rlNtpisBV8U72KhUn
         epo/NFxREcVKUqKUeowr4/m71BY/Qb/Kilyy7TaeOgsx8oM9IyEN2HTlvpBloXe4H1ip
         wzgFjo+Tregja/IpOKUJQiugmzU+/PiLAdhDAy54I7xAPjJ289dIc4c36r5EvDrWPWbY
         z/AV6C+6QxlUaXQaPRW499R2lWTGZAtzSjByBEUaK6HhwD/HqUW3BEPntTQ7sn8A7MdC
         I7OQ==
X-Gm-Message-State: AOJu0YzazrZxk98kUaNRnx0HIx+rZEfHT9QgeEGhfVamGr9YnJWOkOG/
        8NpWeGNJlMsISSXUfY26s9C0EZ8tKOU1Moz6r3bJijCaD4L2snAy
X-Google-Smtp-Source: AGHT+IHG0TBlmxyoTQFIa7FFpqQqYMcVr4pyVQslrpSztqetV//HxeApegU4hZ/YXLQ350AtIlPtITxSVFId9gOqRWY=
X-Received: by 2002:a25:40a:0:b0:d7f:7690:d865 with SMTP id
 10-20020a25040a000000b00d7f7690d865mr6786114ybe.6.1694072130152; Thu, 07 Sep
 2023 00:35:30 -0700 (PDT)
MIME-Version: 1.0
References: <20230905185309.131295-1-brgl@bgdev.pl> <20230905185309.131295-16-brgl@bgdev.pl>
In-Reply-To: <20230905185309.131295-16-brgl@bgdev.pl>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 7 Sep 2023 09:35:18 +0200
Message-ID: <CACRpkdaLKqNM1xMCo9jz1Pe_18A=GJodbaTHL+VmoRZa5jJbjQ@mail.gmail.com>
Subject: Re: [RFT PATCH 15/21] arm: omap1: ams-delta: stop using gpiochip_find()
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

Oops one more note:

On Tue, Sep 5, 2023 at 8:53=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl> =
wrote:

> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> gpiochip_find() is going away as it's not hot-unplug safe. This platform
> is not affected by any of the related problems as this GPIO controller
> cannot really go away but in order to finally remove this function, we
> need to convert it to using gpio_device_find() as well.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
(...)
> +       struct gpio_device *gdev;
(...)
> +       gdev =3D gpio_device_find_by_label(OMAP_GPIO_LABEL);

This leaves a reference to the gdev right? No scoped guard?

If you leave a dangling reference intentionally I think it warrants
a comment ("leaving a ref here so the device will never be
free:ed").

Yours,
Linus Walleij
