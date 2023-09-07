Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8424A797841
	for <lists+linux-omap@lfdr.de>; Thu,  7 Sep 2023 18:44:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230219AbjIGQox (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 7 Sep 2023 12:44:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59684 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232417AbjIGQow (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 7 Sep 2023 12:44:52 -0400
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 20B321FCA
        for <linux-omap@vger.kernel.org>; Thu,  7 Sep 2023 09:44:25 -0700 (PDT)
Received: by mail-pj1-x1029.google.com with SMTP id 98e67ed59e1d1-26d5970cd28so954113a91.2
        for <linux-omap@vger.kernel.org>; Thu, 07 Sep 2023 09:44:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694105005; x=1694709805; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I18DoVxRqFJaTqip4HKub/TPXgj9WnWp7a45EaJWvuM=;
        b=dc8NKDmsNP6iKVufPWA7CKIlyeDN91wGu8VUAVMEDi92W8R4tNU0i5DwlcipCsHTjg
         95vpSrU83MwqWYCcaZCUtA/f64SahN0vqiIk0qh74WM3uITpT4MODgrh5Zo59CvC1GrJ
         rmchchPanw9Wz1jfBtZYbwjrO+7SgaBLgDITZ3lfMmZTzstWkS2ERHYenQG3Fj/1sI3+
         XMx56RZiTnDPX/e/qmCZBW4GJYeKJYlPt/DF7uAhYVYiuNiE+dlKODEB3pfrKtiIjNnv
         tftTG7ULBbVl2tZYzigxGY99NBbOSm6JD0T9CtqPrDPRL9wEGy5gZdEVrS/pONg4fXgN
         UmkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694105005; x=1694709805;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I18DoVxRqFJaTqip4HKub/TPXgj9WnWp7a45EaJWvuM=;
        b=jKWwnYd/6Dg6FD6GoIfdNwhOS/wIR+h/+o8ZG/v3nfbbwcRpw00Vv0QjRVy6Y1oFWy
         lqP224fi8bSmbti5L3Or65sJPi2CL9BtTBje81OSQCWeFTA2MooSOLpQz4oDCFQaI+/q
         rFY6eTMok606opPZ+Ej06kTtfjh42Wm+BouXkqt1V33O5r7vh26ObkWhpKE1hHSHCwZe
         FOOJeg0dbIbmVhaKLAMt7ZP2Yc3yFmQgMZXwliNGGQFWM61mx8wYsOh5yKWbPdIykFfv
         0A6KiuyNkMJC/3HO/2lPodpNzglhw+T4H3lEvKcb3jG1ZTXSvOc93OmmXGmdcwVUc92a
         6RSg==
X-Gm-Message-State: AOJu0YwyC6TRfRMdaKikvzuQTt7iZO+jTc8m5QFee/gOTOUxP2+JdxY3
        /vhKp34XpFftoaB8fMwEq/slr3Asnn4XyrxCCr6PtZaxa4xwO0+SIpg=
X-Google-Smtp-Source: AGHT+IH52ZmMDQle74d5+xBv94alRH/CYtL/TIhLKM9b7HFrce/j3cJJJRCz5BcoTZ3hxH+Wxp8LvqydUyq2rr0UgjU=
X-Received: by 2002:a25:5f0d:0:b0:d7b:90c6:683c with SMTP id
 t13-20020a255f0d000000b00d7b90c6683cmr17866183ybb.26.1694070426178; Thu, 07
 Sep 2023 00:07:06 -0700 (PDT)
MIME-Version: 1.0
References: <20230905185309.131295-1-brgl@bgdev.pl> <20230905185309.131295-4-brgl@bgdev.pl>
In-Reply-To: <20230905185309.131295-4-brgl@bgdev.pl>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 7 Sep 2023 09:06:55 +0200
Message-ID: <CACRpkdbE5AJHiGan_oj4_kBSOh7okfwM0u9qDcEyTBr+NCO=wA@mail.gmail.com>
Subject: Re: [PATCH 03/21] gpiolib: provide gpio_device_find_by_label()
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
> By far the most common way of looking up GPIO devices is using their
> label. Provide a helpers for that to avoid every user implementing their
> own matching function.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Yeah this is what everyone and their dog reimplements.
Good to centralize this.
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
