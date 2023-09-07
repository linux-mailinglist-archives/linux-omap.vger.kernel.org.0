Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1CAA07977F8
	for <lists+linux-omap@lfdr.de>; Thu,  7 Sep 2023 18:39:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240306AbjIGQix (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 7 Sep 2023 12:38:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60122 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243033AbjIGQhz (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 7 Sep 2023 12:37:55 -0400
Received: from mail-qt1-x829.google.com (mail-qt1-x829.google.com [IPv6:2607:f8b0:4864:20::829])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BAF447D82
        for <linux-omap@vger.kernel.org>; Thu,  7 Sep 2023 09:23:19 -0700 (PDT)
Received: by mail-qt1-x829.google.com with SMTP id d75a77b69052e-4122e42a76aso8531901cf.1
        for <linux-omap@vger.kernel.org>; Thu, 07 Sep 2023 09:23:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694103733; x=1694708533; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nAcaB2pTm5ugUpb7jItBu7GBa9HGPWbiLI0lhRjflAk=;
        b=NMCBD25SdwqnUWZBfspGogBHah+CeOqiAkryfWijgxDJcpZhgC041gTid8XkHu2gDJ
         88ItDJNq1rhdpD4SPToN16EhPyW2o5E1MsCupKa48DXD0MbXQgWgysnvH8mM3mUN8OAs
         mAdilwMeOC6M7WzuBumWu/QEUkJh54B4AHDwQM5sKfVmshy5j7TcCN+BUY4RMf9Tb5dt
         f0dFRovIgD1NH9uqRQo0wxOfaGDU8wrYY9Y8oaI8DNP5fLT0gownkj0+EI5ZqYRD6oVB
         mKKW9CeWa6bfjBnuqdRgwR94FuEn3/pR0bufsu+Y7JWdowjkllHVg7JDGjkNdoUsAnlj
         zKpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694103733; x=1694708533;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nAcaB2pTm5ugUpb7jItBu7GBa9HGPWbiLI0lhRjflAk=;
        b=GJ/nSIBDqLHzWdNEEGyCU3tKtm6kpGBcf9SQ7AOmahFQ91AzJ/xV3Ce15JwfQ6eyFD
         BKrSZMLHKAmo9Ngtmt6HPPDZVhsdCCTNUwMw0Q50EbSWy9bkBCmIqdcno38AP1dutq+R
         5OxYyvGSb7lAaqvehSAn281vNRLHXSh6ttPRZHpbFMQFfcfaBFhmkFzFW7YTRE22oIMM
         zD/A8qZ1Yd6GjtFsqK6LdDsGKV9t4e1pDW1APYNkFdwHxu4oSuogVaIQ/6Sa8qU7C/Be
         emDbHWTeqZOqNftr+2jlQxNYXacQ9+nwGk+3Eb89y61VDbW1DOEOliFyLPx8Wm7lZc+2
         vdpA==
X-Gm-Message-State: AOJu0YzIXkyn8oVULD15dUnD/DNzjJFY9+N/9JX6XLxLZTf52Zd1h0at
        UHJisHb8vS3yAlpzfdOuKvGQjcgPaZo/I/Je0FhMmg9noYVhlBfb
X-Google-Smtp-Source: AGHT+IG3iM5SVFsQBffezpzdNtWCyc5u9P9zQgzxCYNNrdFDmyZDKiMxM6k7I5B7BvMWEn22bFgEPztstkMTEryGy0M=
X-Received: by 2002:a25:e808:0:b0:d7f:ec57:bce6 with SMTP id
 k8-20020a25e808000000b00d7fec57bce6mr1114484ybd.26.1694070032245; Thu, 07 Sep
 2023 00:00:32 -0700 (PDT)
MIME-Version: 1.0
References: <20230905185309.131295-1-brgl@bgdev.pl>
In-Reply-To: <20230905185309.131295-1-brgl@bgdev.pl>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 7 Sep 2023 09:00:20 +0200
Message-ID: <CACRpkdZFDMvyP=8hwH_ssUUEYbwyTATmbbXWQsZ2pqOh1Z9LNQ@mail.gmail.com>
Subject: Re: [PATCH 00/21] gpio: convert users to gpio_device_find() and
 remove gpiochip_find()
To:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Johan Hovold <johan@kernel.org>
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
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Tue, Sep 5, 2023 at 8:53=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl> =
wrote:

> The GPIO subsystem does not handle hot-unplug events very well.

Yeah :/ it was never designed for this, and I've seen the discussions.

The person who made the biggest effort to make this sort-of work
was actually Johan Hovold so I added him to the mail so you can
include him in upcoming iterations. I think he was working with
GPIO on greybus at the time. Maybe he want to take a look!

> Before we can even get to fixing the locking, we need to address a seriou=
s
> abuse of the GPIO driver API - accessing struct gpio_chip by anyone who i=
sn't
> the driver owning this object. This structure is owned by the GPIO provid=
er
> and its lifetime is tied to that of that provider. It is destroyed when t=
he
> device is unregistered and this may happen at any moment. struct gpio_dev=
ice
> is the opaque, reference counted interface to struct gpio_chip (which is =
the
> low-level implementation) and all access should pass through it.

Thanks for looking into this. As I remember I have tried to bring down
this abuse over the years and IIRC it used to be even worse, it came
from the fact that all GPIO drivers used to be under some arch/*
tree and often loosely using the kernel GPIO API but in addition
providing a custom API...

> The end-goal is to make all gpio_device manipulators check the existence =
of
> gdev->chip and then lock it for the duration of any of the calls using SR=
CU.

Excellent!

> This series starts the process by replacing gpiochip_find() with
> gpio_device_find(). This is in line with other device_find type interface=
s and
> returns a reference to the GPIO device that is guaranteed to remain valid
> until it is put.

I agree with the direction and I see no major problem with the
patches other than some testing and cosmetics. The kernel sure
as hell looks better *after* this than *before* so once you have rough
confidence in the patches I think they should be merged and any
issuse fixed up in-tree so we get wider audience and can continue
the planned refactorings. So:
Acked-by: Linus Walleij <linus.walleij@linaro.org>

I'll try to provide some detailed reviews if something stands out.

Yours,
Linus Walleij
