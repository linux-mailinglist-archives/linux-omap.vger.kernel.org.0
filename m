Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1BA22797B28
	for <lists+linux-omap@lfdr.de>; Thu,  7 Sep 2023 20:05:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234225AbjIGSFr (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 7 Sep 2023 14:05:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38316 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243469AbjIGSFq (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 7 Sep 2023 14:05:46 -0400
Received: from mail-oa1-x30.google.com (mail-oa1-x30.google.com [IPv6:2001:4860:4864:20::30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 615CE2105
        for <linux-omap@vger.kernel.org>; Thu,  7 Sep 2023 11:05:21 -0700 (PDT)
Received: by mail-oa1-x30.google.com with SMTP id 586e51a60fabf-1c504386370so873063fac.1
        for <linux-omap@vger.kernel.org>; Thu, 07 Sep 2023 11:05:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1694109917; x=1694714717; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RuYVBuRk1qSk/vysKkYAGZLoaF4hP5KwSrbdU9HLCHc=;
        b=TyeU2Veeeh5aAdYXSthVL8+3lceCXfyi8bQY6ogpCZlOBkG2LFlsMW/Z0mBKS4O6zs
         zZ73V2PrG7z4uRz41ZYDRgVhdJMqBWoY6lkHVBTHwCyjEcZmOps8mRbrWbNCufFw7F+5
         o7KS9P1Irf21EA+iSqQn9nd4+bilfUUHp/TGaxz/AN0xgJFhe0viugC+UEctpbawiQW2
         aCWyfDFMQkfda2hkBrNMIsbPzDZgS1v4bFeJSILVT22NaZdsFJAf7FKSqAWJZ65Fmmt5
         yOB0oeNyvFgUaFRT7vLdO+kveplcZ4o/nQ0rMFpcVOoQgbFI/qI+aaf/u+lAJ4k5Qqjd
         RYkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694109917; x=1694714717;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RuYVBuRk1qSk/vysKkYAGZLoaF4hP5KwSrbdU9HLCHc=;
        b=ForDHY97sl3sU8goxV9YpnIWtsZ4RkyiiUdmeqP0OOKqRJ9vjmyLXk+Yeg51rLYbrO
         3snN5xzPdRL+omijd+ItxG/sZ+lMLfsZJmeaW/YWwCoDAjl3aMnkri+IL3dOSIl57LJ6
         S0sRrXmXIm7NAoX6kCs6IGNJ3KQ8MjiKVCpK3qgbjLziVhwIcODSFLrWMJmQ9XhyiLuG
         8c8OXi6eBXdr2OpVQnGP4hsHTQDdleXSIyWrZAZY2q2NKBHt7JAN0E5hcqpOg+VdfdbM
         MSUo/aHOnC1qJO/gaytMq15zq4mSe83fI3X1Y2BWc10rBEJC/FH+Gm+B8gJHv/QMAAYH
         kBfg==
X-Gm-Message-State: AOJu0Yx1moVkKODJ4g2cCBrQcUfT3SgH6KGQlzqjIreUTTeYP97a1Oqn
        ctsjiZeZxpsUichyf/GX2XqjqJU73lLpEpzSnkksvNRakivFcyH0
X-Google-Smtp-Source: AGHT+IFH+TTCwwws89F7SNPi0GGOZFWp/OkGv5hkCV0kl2J1CUqPAY/iOB9bwWhCU9n1g7MoTzaR/hVwP1cetSs2hGI=
X-Received: by 2002:a67:ebd9:0:b0:44e:a3e9:68d1 with SMTP id
 y25-20020a67ebd9000000b0044ea3e968d1mr5642709vso.1.1694071890893; Thu, 07 Sep
 2023 00:31:30 -0700 (PDT)
MIME-Version: 1.0
References: <20230905185309.131295-1-brgl@bgdev.pl> <20230905185309.131295-13-brgl@bgdev.pl>
 <CACRpkdYJhP5otaFXbn49sK_33GJMy85MszyD9rqoQT1-fqd9dA@mail.gmail.com>
In-Reply-To: <CACRpkdYJhP5otaFXbn49sK_33GJMy85MszyD9rqoQT1-fqd9dA@mail.gmail.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Thu, 7 Sep 2023 09:31:19 +0200
Message-ID: <CAMRc=MdXU_EiG4iYhHJd7faRPEQ21hXHhRpPAqTa-TiMiraZpw@mail.gmail.com>
Subject: Re: [PATCH 12/21] hte: allow building modules with COMPILE_TEST enabled
To:     Linus Walleij <linus.walleij@linaro.org>,
        Dipen Patel <dipenp@nvidia.com>
Cc:     Aaro Koskinen <aaro.koskinen@iki.fi>,
        Janusz Krzysztofik <jmkrzyszt@gmail.com>,
        Tony Lindgren <tony@atomide.com>,
        Russell King <linux@armlinux.org.uk>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
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
X-Spam-Status: No, score=-0.4 required=5.0 tests=BAYES_00,DATE_IN_PAST_06_12,
        DKIM_SIGNED,DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Thu, Sep 7, 2023 at 9:22=E2=80=AFAM Linus Walleij <linus.walleij@linaro.=
org> wrote:
>
> On Tue, Sep 5, 2023 at 8:53=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl=
> wrote:
>
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > Allow building all HTE modules with COMPILE_TEST Kconfig option enabled=
.
> >
> > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> This should be a separate patch should it not?
> Just send it separately to Dipen so he can merge it.
> Acked-by: Linus Walleij <linus.walleij@linaro.org>
>
> Yours,
> Linus Walleij

Dipen,

Can you just pick this up and the other patch addressing a comment in
a HTE driver separately? Would spare a resend to the list and I'd drop
it from the series.

Bart
