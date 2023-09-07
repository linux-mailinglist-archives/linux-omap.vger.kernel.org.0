Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F2A26797754
	for <lists+linux-omap@lfdr.de>; Thu,  7 Sep 2023 18:24:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235240AbjIGQYS (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 7 Sep 2023 12:24:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46904 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238035AbjIGQMO (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 7 Sep 2023 12:12:14 -0400
Received: from mail-yw1-x1129.google.com (mail-yw1-x1129.google.com [IPv6:2607:f8b0:4864:20::1129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D5F3959C9
        for <linux-omap@vger.kernel.org>; Thu,  7 Sep 2023 09:09:16 -0700 (PDT)
Received: by mail-yw1-x1129.google.com with SMTP id 00721157ae682-5922b96c5fcso11147187b3.0
        for <linux-omap@vger.kernel.org>; Thu, 07 Sep 2023 09:09:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694102858; x=1694707658; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KDyS14lOc9gIdV8qqpJN7dVOi7FiXE2O1crBwgTrNhg=;
        b=IEdmuhphSqgGlp2x+AuixQLt4D1isxZWO+g4YTCWHM1IjuOOGHkOZp3bZxqhms+4oI
         bxcG1Pr7QWA30qGZxKamFXQDnZHrTtpmjDx4M2Cc5eepmtIVWEwgpLXqe19gbWDLu+UW
         IrP8qhG7EhtaopncXFPqotGWsq55o3NiaFsowOLWsx2ox474/yJHYHVR/rI0AlEQpKa9
         YWXb5tRU2xqvRbEA/s/Ye4jF30IBycf5kIebL8ZbWntV0B5A7yfYFD+KPFGctB0o/3/X
         rONjy5deohFotz/6ni3lvpctxj/JrdCUornWzSKtQ05+w5EP30ZjQEHqxzRHHmhx8C66
         BBdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694102858; x=1694707658;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KDyS14lOc9gIdV8qqpJN7dVOi7FiXE2O1crBwgTrNhg=;
        b=TDpuanb1yCycVE7ZRhijTrujATtwTpvRDcrv0cpOvBOTa9Fv3UjJcpeS1xdyLCSul8
         8jlJJtjT6M6Oa7KCXIiH+wiVdXzDotmT/KxHz+iR8AcLX50urorWSPIHOQ/JI0IhHit+
         Rb+MzctwTqKw30pHYTW9XPQwXsIxlxuSZHlJzo7C2eMj9KDJpEghKAKIjCqhqR9cxmew
         LMLAqES4pTOVe9uZ3GXiosefbNw01buBE+8tLIbiGH+XfytItW1rIhvWkaAai8iWF5nK
         RTXAGgh5qGJtHgGTvxnMpwcW6KHlufmyG57mArxo3AOJEBDvTRviEvrr6qFmaBg7rfNB
         6Xug==
X-Gm-Message-State: AOJu0YwuCyds63BDTI9J2akVaYeH78X2zB3pL1NascyOV6t/0w2Xth/H
        GUjzl9cLePoBip4HAG+/VXJAYUcFXfBRX/RnOcDgU19WWEBHfjvX
X-Google-Smtp-Source: AGHT+IGJ2fOJYbfgZwCYkGOqpBoV8zRdwms0YQyjwmM812KoO4CG3kmEhKK7s/PjKGQeVe41+y3pVjBhSp9/fdWja/U=
X-Received: by 2002:a25:408a:0:b0:d06:49e9:a29c with SMTP id
 n132-20020a25408a000000b00d0649e9a29cmr19754022yba.34.1694071374753; Thu, 07
 Sep 2023 00:22:54 -0700 (PDT)
MIME-Version: 1.0
References: <20230905185309.131295-1-brgl@bgdev.pl> <20230905185309.131295-13-brgl@bgdev.pl>
In-Reply-To: <20230905185309.131295-13-brgl@bgdev.pl>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 7 Sep 2023 09:22:43 +0200
Message-ID: <CACRpkdYJhP5otaFXbn49sK_33GJMy85MszyD9rqoQT1-fqd9dA@mail.gmail.com>
Subject: Re: [PATCH 12/21] hte: allow building modules with COMPILE_TEST enabled
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
> Allow building all HTE modules with COMPILE_TEST Kconfig option enabled.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

This should be a separate patch should it not?
Just send it separately to Dipen so he can merge it.
Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
