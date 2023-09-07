Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D251E79739E
	for <lists+linux-omap@lfdr.de>; Thu,  7 Sep 2023 17:28:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232011AbjIGP2D (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 7 Sep 2023 11:28:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55556 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245122AbjIGP00 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 7 Sep 2023 11:26:26 -0400
Received: from mail-ot1-x330.google.com (mail-ot1-x330.google.com [IPv6:2607:f8b0:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 62334173B
        for <linux-omap@vger.kernel.org>; Thu,  7 Sep 2023 08:26:02 -0700 (PDT)
Received: by mail-ot1-x330.google.com with SMTP id 46e09a7af769-6c0bbbbad81so272473a34.3
        for <linux-omap@vger.kernel.org>; Thu, 07 Sep 2023 08:26:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694100348; x=1694705148; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9VX520/JAjo5YxFEs6vhZtWf0iQa736VrN0vgqzfoO4=;
        b=FeB5RNLAsTisrNfwLpgTkmYw0oVxnxjPCkyP7+T2lF0qFFM8sbFtOk4U3FUBJ1thMK
         qXrEY0YwRk7XmFB9JrYdAHc7s9WY4V3HblZYt2axA90c6h5+NO3vjyIAnVvBQky9rf1g
         Jqhv6hSKJDbOU4NnVMNCMppBhqcwQeRAC5x8LwD/0v45Bh0t2qrojZj81grGxNwSia9q
         1A7yyePbinbXmaW9zVlPhdZx0i6FWB6LkY7WOA4rXlloyMcpeDyRRIRl5+o7n+wEjzYW
         n9EorDjpC2DUu3d+ZjXEZdsPOv23zC9JnOoJEduQRZc0SAGUyBvxf1sqvJnO7uKaIem/
         Fg9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694100348; x=1694705148;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9VX520/JAjo5YxFEs6vhZtWf0iQa736VrN0vgqzfoO4=;
        b=Ir7JNeU+zQI2e2l20XxhNiX0F70US3NWBaqDUlUo5STA5ZVjMKEUObL5jn4RLCzaMH
         JzDIZ0GdGeVMDXJoaGfi1KGKNUYJgFW0fiOUilt8UbZsD+JgLH61gzQaOTvf6J7IbW8E
         WXYj/ctzs2Zz1Ok+xLUT+2KnKLXWfCwtd7+mqGzog4tX5Sv8Lj/7MIAkcWvRpYTGZmIJ
         /nZoJ34MLOE40+rnbcLvJrt73L1CiLBSJo/y6b9kL1VSQLP5pYNI9uFkjw4cee2Ff0sD
         k1zDz+Epq3738ff0j7X0yIJRzEExo1KMPFNqceb9PgBy7EaJW+B2jMLlcz8XyMFz80yp
         dgQg==
X-Gm-Message-State: AOJu0Yz7ORXVGsTfxeoiRNfwbIipFuZqaVGs/zsIC7ZRzQ+bmQcrQZnz
        CJ0n0lGwihSwfztxV7MZeM9/iFkod8+k26lA9iDfbcaxppL4Ai9X
X-Google-Smtp-Source: AGHT+IGsG5hJJbLxB8MJ18cSL64AbAsKmU8HUkb1gvXKq17Y/8ZLDXSkKoAPtcsGb/CfUJGklHIiazXnZYlmi1tiRYs=
X-Received: by 2002:a25:d78a:0:b0:d78:47a:d76e with SMTP id
 o132-20020a25d78a000000b00d78047ad76emr19559951ybg.49.1694072224500; Thu, 07
 Sep 2023 00:37:04 -0700 (PDT)
MIME-Version: 1.0
References: <20230905185309.131295-1-brgl@bgdev.pl> <20230905185309.131295-17-brgl@bgdev.pl>
In-Reply-To: <20230905185309.131295-17-brgl@bgdev.pl>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 7 Sep 2023 09:36:53 +0200
Message-ID: <CACRpkdap-AFmVFG_gtYeGuR5JFLgHQ6i7w6HRwKP4+pu=nd66A@mail.gmail.com>
Subject: Re: [PATCH 16/21] gpio: of: correct notifier return codes
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
> According to the comments in linux/notifier.h, the code to return when a
> notifications is "not for us" is NOTIFY_DONE, not NOTIFY_OK.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

This should just be applied, right? If the notifiers already
went upstream (sorry for my ignorance) then it should be
a Fixes: even.

Yours,
Linus Walleij
