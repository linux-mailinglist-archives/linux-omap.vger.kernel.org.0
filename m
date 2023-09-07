Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8D68C7975C5
	for <lists+linux-omap@lfdr.de>; Thu,  7 Sep 2023 17:55:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231544AbjIGPzI (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 7 Sep 2023 11:55:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35930 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233884AbjIGPxw (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 7 Sep 2023 11:53:52 -0400
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com [IPv6:2607:f8b0:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7ABBD30D3
        for <linux-omap@vger.kernel.org>; Thu,  7 Sep 2023 08:43:48 -0700 (PDT)
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-68a42d06d02so984156b3a.0
        for <linux-omap@vger.kernel.org>; Thu, 07 Sep 2023 08:43:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694101352; x=1694706152; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XvLrxMQ1IidFWYQv1qbOrK7Zz+kctFqLG1SqA3KCV8I=;
        b=Gvqk5TqkDgPPIapprRpqP1Dm83XC8LvG26PoQmL4exMYTYoFYqI3r5WaYYYDTBQbxU
         8T/SrgRcGg26a0NLDIjirliUVQ0P/dksSAxg7ObqUaVoCyZtLI050+zXANR4hN0GlAoz
         PYOAHdpsurW1Y9VKCaJgoqcbmdZTjkYQxpF1rNB4NquNAmH3YoY2bZD4ZoYyQMIF2pW3
         Fhyd6LISzV30p8Oq4GjdF1cfOsneajK0W+/Md00OnCd32i9tBjHStmMwVyDgcbVIge/F
         +WYEtXKSDc8Vxkv5Kz1/2Pe5RbeDE4MPJAqrpe/0vYkeU+IepcVcieBC6MqD9vvTrk9H
         d9cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694101352; x=1694706152;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XvLrxMQ1IidFWYQv1qbOrK7Zz+kctFqLG1SqA3KCV8I=;
        b=UC/JtP+zzOcZrFNsUZ36ZdE1lROWdgE/yFcqxUuw6fd1qTwHihCa5Z330YLMuSwt3X
         iPhOZU4aOadng5qfmySjrf4c1Er+N1dgTVBlzDpVee59rjRRkcawHhb0NoY1qWyw8b2t
         WOk3a8H+8fds2xZ9zHfqLrA87+qLfRd8Ty8TizxjNCOYuKrkU8QEIrZ8vrcHYQxS0Sjl
         3MMqtBC/Hl8UdH5Bj4VRv466ujJtIho+AZUFg8ZMdcsspp0XabjezGim2x3A200w6pj4
         YGvqUsqt+xmyheacQPZ1OLRXWAaqobOyRnSYFmPVucqfUFwWQrQKS6t4Dgnkc9kDgKEo
         vnLw==
X-Gm-Message-State: AOJu0YyVejdiwjHnxQcAwaS1HpmQzMUOXhTBJvgpi28yxnEE2o7ljwbH
        +16+gVNfjbtotOkE6M/jXHACulBkb4QZ3BDee8o9oX1QKz5Qz3yc
X-Google-Smtp-Source: AGHT+IF33BsQs6PXZBD6Yyx6MLxtC5D3dCLaevE9AUQBN2cYvO/VBix1ip+znuJz46jocHvadEET9qd1DQq8TKxIbhc=
X-Received: by 2002:a25:fc16:0:b0:d78:be:6f02 with SMTP id v22-20020a25fc16000000b00d7800be6f02mr17528083ybd.11.1694071503985;
 Thu, 07 Sep 2023 00:25:03 -0700 (PDT)
MIME-Version: 1.0
References: <20230905185309.131295-1-brgl@bgdev.pl> <20230905185309.131295-14-brgl@bgdev.pl>
In-Reply-To: <20230905185309.131295-14-brgl@bgdev.pl>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 7 Sep 2023 09:24:52 +0200
Message-ID: <CACRpkdZE9hMWNeY=J0LrGTO1=83L46z69V6b7BX=Q-vaM3kBAA@mail.gmail.com>
Subject: Re: [PATCH 13/21] hte: tegra194: improve the GPIO-related comment
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
> Using any of the GPIO interfaces using the global numberspace is
> deprecated. Make it clear in the comment.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Split this off and send separately to Dipen.
Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
