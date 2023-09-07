Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0526B7978DA
	for <lists+linux-omap@lfdr.de>; Thu,  7 Sep 2023 18:56:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244074AbjIGQ4T (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 7 Sep 2023 12:56:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57746 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229711AbjIGQ4R (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 7 Sep 2023 12:56:17 -0400
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com [209.85.219.178])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EFA151FD2
        for <linux-omap@vger.kernel.org>; Thu,  7 Sep 2023 09:55:53 -0700 (PDT)
Received: by mail-yb1-f178.google.com with SMTP id 3f1490d57ef6-d7e904674aeso1072815276.3
        for <linux-omap@vger.kernel.org>; Thu, 07 Sep 2023 09:55:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694105604; x=1694710404; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2QUcdjgXxrS+bTKkF3r2QRe+Cc9aRk/mkNDQCAPj22c=;
        b=ziRgASGigCXnG8fNZ6fbXmZW8tUEhER2p0DsTIWG+9Ae9Ox27TBQVj38bba3Jg2u+B
         HykGvrH1r6GgngHg/w+yjDnSF0Zxwdu2UvIw3ZmSTne7L2CRJflD3v87EecOKwCg2c0d
         dEiHONK22UixNi9/HwTw2fvvtovlH2qDz4C89WnBS+/zbG/rLWF2V3m0g3E8h0jgu5pN
         d4mFo2+xS3JpfkYflin7XnOoZS52tVT9Toq4049xuDiU7CzqESkteIAUNr5UpQNAEndb
         /8wbLmodB8YL1W6Rnj7c97Xn7F97wFoxu3RU0QXiVlcfN9tdrp8sfxOBewNJN6J6iFc0
         +Y9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694105604; x=1694710404;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2QUcdjgXxrS+bTKkF3r2QRe+Cc9aRk/mkNDQCAPj22c=;
        b=P6heoGPZzjsuHvPt73/ULIZgkyowXDme/qMNtvhoQPakA1o+8wN1eZg5bDlR0+EV13
         zJF3a3UXAQRCgpCsopmIw9sH609kF3gZDORlw0nZ2oJ0gnxctlYFTHn1EXXbJYLEqexi
         P9+6gMM6KOzsWCYUCWpBjtAB8oLUnbYF3WgYWvGGAEBQnnF77/eykGA9jhh/Co8BTBlV
         7Mb8Bfcaf4KcWiR2VzWUfADBs1NvZJIGM8N/NvEPFhZyXLK9WtoLPxqqCqYtMICaJrp6
         0+kywjMuOWx8avNIMw9Ht9KSy/IRecJA/B4grA6tMy2YTz1Hh0M2KNHXqQVU5cTBQr9V
         nTow==
X-Gm-Message-State: AOJu0Yw1CpToJCqOBw3aCshdNzW1YSYjF4V1yWNs9R2xgIUbx3hf/5lY
        KyfA1iIpiTo9xCyJZmyQl1AKYkn6O8IOLi76FVBTVAiwz6k+wttRetQ=
X-Google-Smtp-Source: AGHT+IG2TLQ2WqAfuGI+vTl02pQSFPJWDZVOY1MfvYV7hKobdzNo0vRGz8kywS9VyDIIMdmuzYR3qPmWC3h4lMZlj/s=
X-Received: by 2002:a25:dc81:0:b0:d7b:9a5d:37c with SMTP id
 y123-20020a25dc81000000b00d7b9a5d037cmr18599620ybe.49.1694071708542; Thu, 07
 Sep 2023 00:28:28 -0700 (PDT)
MIME-Version: 1.0
References: <20230905185309.131295-1-brgl@bgdev.pl> <20230905185309.131295-15-brgl@bgdev.pl>
In-Reply-To: <20230905185309.131295-15-brgl@bgdev.pl>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 7 Sep 2023 09:28:17 +0200
Message-ID: <CACRpkda9=VULj4Cy_sit-UpUQnVEbS-RJKAeULVCw8ZCRTq1sw@mail.gmail.com>
Subject: Re: [RFT PATCH 14/21] hte: tegra194: don't access struct gpio_chip
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
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Tue, Sep 5, 2023 at 8:53=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl> =
wrote:

> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> Using struct gpio_chip is not safe as it will disappear if the
> underlying driver is unbound for any reason. Switch to using reference
> counted struct gpio_device and its dedicated accessors.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

As Andy points out add <linux/cleanup.h>, with that fixed:
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

I think this can be merged into the gpio tree after leaving some
slack for the HTE maintainer to look at it, things look so much
better after this.

Yours,
Linus Walleij
