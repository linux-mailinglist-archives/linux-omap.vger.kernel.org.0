Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 54174797392
	for <lists+linux-omap@lfdr.de>; Thu,  7 Sep 2023 17:28:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229459AbjIGP1R (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 7 Sep 2023 11:27:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48708 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232193AbjIGPWU (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 7 Sep 2023 11:22:20 -0400
Received: from mail-qk1-x732.google.com (mail-qk1-x732.google.com [IPv6:2607:f8b0:4864:20::732])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D550C1BEE
        for <linux-omap@vger.kernel.org>; Thu,  7 Sep 2023 08:21:51 -0700 (PDT)
Received: by mail-qk1-x732.google.com with SMTP id af79cd13be357-76da121478dso62140685a.2
        for <linux-omap@vger.kernel.org>; Thu, 07 Sep 2023 08:21:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694100111; x=1694704911; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UYoxChlU4Q9Xf4jiILAEb1/yHuX3jjQxtu/fJCh6QGo=;
        b=MRIHBjncCef74G1nB8SQGSRTeGs5d7hbI+P9Kj9AKHzDJTBJ/Q8sYkhZkSiIS8oPRT
         6IcFC0BsqjcGsiIsbTPOhT1cJWHw04C91sy0xIulZ5a7uG2F+dKYyJejkKOlXuoL1pef
         OE6u8y6kvpbgOjfiISbUln/p496XApYkUyjiq+VHN113GoshfkePCvfhGNni7i6RlBge
         KfUsEAEieJ/SLHgodUSfMCmOEOCu4pBAJV+jZryx/OTuawzjvlG2mxeTi9A9BZ8giDZP
         2vbChnQZRD0BTBGGPplN3Q+jprpA7luTzKD/0mVVvzN29qwkrq+SnqHlwPkWl24kGj54
         wnFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694100111; x=1694704911;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UYoxChlU4Q9Xf4jiILAEb1/yHuX3jjQxtu/fJCh6QGo=;
        b=RihgVsa481qxc7pEvGaAIA5lpQAJSUs7xMk/5PdkYhsW4OZraL0WjqBr588puu4V2/
         ik57Ci9NulxhJlSV1Tem4J4r62VJpKKrm+X/Vu/DnFxTrJlO6TqbKC6IbNOBhH/8E6Lm
         JiqFbmHM7CarcoHWXyOU0Vf5fdsp83GrRGiVcqbo5juv1pVMiCXaLhXJlvEBwRO/aphH
         dgvxhBW539gCYgtxcLTu9BhnkChCUmK2rfRzPwVL+pfzyu1O0cFAmRYM35f5DWqmQrnm
         gr2TSTMUUMMqKYTmqSJICZt5G8Kgq6v5jLV8ZmoOwQ3ogFwv8s1fFQEKlUaCl2VB9WRB
         e+PA==
X-Gm-Message-State: AOJu0YylSZTwJl0XPDlnwNe8NxcmxR6Kz7dXYQG3AP5iZq3b/AsVJCmc
        sXRgb0VAcl+ifMrpZsisMcOaJS74AupyU7QY/MfwXP2FgC7TDlEMIjE=
X-Google-Smtp-Source: AGHT+IHaxiCnBZm00LuWWUA+a8rnudg+hvum/6YQLw0kwU5o8WTcy0PQZuAfaxNBOQSTfwUYu0m1J/nwQGnmFDsy/5I=
X-Received: by 2002:a25:e6c9:0:b0:d05:fa02:5bf5 with SMTP id
 d192-20020a25e6c9000000b00d05fa025bf5mr19872193ybh.48.1694072468477; Thu, 07
 Sep 2023 00:41:08 -0700 (PDT)
MIME-Version: 1.0
References: <20230905185309.131295-1-brgl@bgdev.pl> <20230905185309.131295-21-brgl@bgdev.pl>
In-Reply-To: <20230905185309.131295-21-brgl@bgdev.pl>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 7 Sep 2023 09:40:57 +0200
Message-ID: <CACRpkdY-DMJAzkjVFx2Jyw6yG76u8cZ61YPUbcCsosN5kZ02Ww@mail.gmail.com>
Subject: Re: [PATCH 20/21] gpio: sysfs: drop the mention of gpiochip_find()
 from sysfs code
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
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Tue, Sep 5, 2023 at 8:53=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl> =
wrote:

> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> We have removed all callers of gpiochip_find() so don't mention it in
> gpiolib-sysfs.c.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
