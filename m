Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 77E03793FBC
	for <lists+linux-omap@lfdr.de>; Wed,  6 Sep 2023 16:56:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242203AbjIFO4n (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 6 Sep 2023 10:56:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38018 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241841AbjIFO4m (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 6 Sep 2023 10:56:42 -0400
Received: from mail-vk1-xa2e.google.com (mail-vk1-xa2e.google.com [IPv6:2607:f8b0:4864:20::a2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 444C61996
        for <linux-omap@vger.kernel.org>; Wed,  6 Sep 2023 07:56:24 -0700 (PDT)
Received: by mail-vk1-xa2e.google.com with SMTP id 71dfb90a1353d-49059b1ca83so1276045e0c.2
        for <linux-omap@vger.kernel.org>; Wed, 06 Sep 2023 07:56:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1694012183; x=1694616983; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0b+LrhpzD5zlDQ1f5MsWSMzQeSCCSm94gfnG0eru8no=;
        b=MtkxY4AXWAtLYiDITObnjhqqBAd6yV6C/RcVat9RtgJpsKr4Pby1a8bAiUE032J2OI
         RSr6th0q6mqw2uA0zinRN+wqXc4m4QqtYEL4gmIAGDOghicRCvtc0I3EGW0R/k02s9o9
         7tYk0Q4XT0Z2xo0u20dGu994+P8YX2HFCaUfoTHMQyKIfGdRATgA2ZjzGjgHE6eP1yS5
         dCq0W3bXozka2qnROw/XeWciDAflTzRkpXnwtqTE+P5D20hOc66OlsJ7FFtO6I1tWLGb
         Vpmrru06iv8/ZyqJZ98DkhhwC+vLJSRagRnAl1x677v6ToML7Hu8NIXzjG/B7JFLPnZg
         5oqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694012183; x=1694616983;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0b+LrhpzD5zlDQ1f5MsWSMzQeSCCSm94gfnG0eru8no=;
        b=Bhw2ie0sKUHshrqTgN0ttTFWqcYy3hsuTUpBFVVkcO+A4PctUbXkTKmtanh9bnEJI1
         JZHG9l5pHyddy738r6f6JMr+6pp+1ozRcENxFpFKuas23Ypez1RPKSMdNBl3mXoNuWwS
         TY+hwl3BzEIEUupcFZlCZEVGcaVg0legSNoI9x48F+IkEkjW8caLEyYy+TJutLt0tRhi
         E/wPjWJPzADnTdyuh/diyGXpqKh+HyD8u0azQEtquJo/XKnjKJ7xb0COre2ZeMQHY4qp
         ROzAFM6cORMu6/fhs7UPap+zrKYr+zk7eeSzrlC6i0zp1LtdNY05lP3I8oseo+gaIK4Q
         3woA==
X-Gm-Message-State: AOJu0YyNcMsaVjJ1vu64KwWwcJiGE6rVCtrOpSO0iSmxF2WvKGGgrxGZ
        ysD5r3MxVmb7DNzkq4D1nmirr0bN0E7rdXxGO1e/9w==
X-Google-Smtp-Source: AGHT+IHFUAaQuXJCvoaHz5cxhv0bEhMufwh67QZ6cCxl5kH6KvbUhYeVa6KPRbL1zs6bpPHq6Ld1E0a7yk+msYaoihA=
X-Received: by 2002:a1f:e402:0:b0:48d:2a1:5d26 with SMTP id
 b2-20020a1fe402000000b0048d02a15d26mr3439732vkh.4.1694012182436; Wed, 06 Sep
 2023 07:56:22 -0700 (PDT)
MIME-Version: 1.0
References: <20230905185309.131295-1-brgl@bgdev.pl> <20230905185309.131295-16-brgl@bgdev.pl>
 <ZPiRTfN3ZbvcuE6I@smile.fi.intel.com>
In-Reply-To: <ZPiRTfN3ZbvcuE6I@smile.fi.intel.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Wed, 6 Sep 2023 16:56:11 +0200
Message-ID: <CAMRc=Md3gRyfizGxkGwCUhO1ahkgew5qURueKbJNmkBJJn7=EA@mail.gmail.com>
Subject: Re: [RFT PATCH 15/21] arm: omap1: ams-delta: stop using gpiochip_find()
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Aaro Koskinen <aaro.koskinen@iki.fi>,
        Janusz Krzysztofik <jmkrzyszt@gmail.com>,
        Tony Lindgren <tony@atomide.com>,
        Russell King <linux@armlinux.org.uk>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
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
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Wed, Sep 6, 2023 at 4:50=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Tue, Sep 05, 2023 at 08:53:03PM +0200, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > gpiochip_find() is going away as it's not hot-unplug safe. This platfor=
m
> > is not affected by any of the related problems as this GPIO controller
> > cannot really go away but in order to finally remove this function, we
> > need to convert it to using gpio_device_find() as well.
>
> Side question, have you used --patience when preparing this series?
>

Yes! Thanks for bringing it to my attention.

Bart
