Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2E5D7707412
	for <lists+linux-omap@lfdr.de>; Wed, 17 May 2023 23:21:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229578AbjEQVVt (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 17 May 2023 17:21:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33352 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229936AbjEQVVs (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 17 May 2023 17:21:48 -0400
Received: from mail-yw1-x1135.google.com (mail-yw1-x1135.google.com [IPv6:2607:f8b0:4864:20::1135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 657BEAD20
        for <linux-omap@vger.kernel.org>; Wed, 17 May 2023 14:21:20 -0700 (PDT)
Received: by mail-yw1-x1135.google.com with SMTP id 00721157ae682-561a7d96f67so15947197b3.3
        for <linux-omap@vger.kernel.org>; Wed, 17 May 2023 14:21:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684358434; x=1686950434;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c/xRTFfbK4NYimyDUxrCUmH9rx6aZeiSGuBiaYTmxbw=;
        b=ahFgt2u2X9w9clM14mYo/38fBow6nCB8b73iuZFrZfxREkniMjSDCp8HWAKBaRYMxi
         LUOLzS54YDfp+Fr/Mwn3HnxydyKpcX0KE3NKHTuPrpZvYD8fIYxwCdWVB9sRG7z33pEY
         hVS/nrIbGldQAmcwS2yjW26/kKIUEF9XVCAhAnyUgze5yZAgsyK/sbClPjsrltulIobF
         9GoO31H6UiWQyrTETXhpad2945FX2wlbEy1FGuoQgPINKjZsXR4QBP9cNQq2o+tpCDlW
         yHA9FLI7M4w2wJfkJkDGncg57spNyhccK5KPLDkzxuc6ZieyQGgmFy2/Q8tFJV2I10SV
         QPxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684358434; x=1686950434;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c/xRTFfbK4NYimyDUxrCUmH9rx6aZeiSGuBiaYTmxbw=;
        b=ji6nFzrsml0txBNN8EKDGVkoxCcZHf9j+V5/ZuZp0gvRSlvUAsBuj4oAxnkPrfh/dz
         JQ2X/Skf++WZBvHbGYGzJa7fy3mdneE5y+IbrKU4AmyJ/XCSHKoQxnJsVuB/BuJ9kKVH
         MMqutmgNjn0uCuIurkcmc1+K6pw+B4XL2krjFdIzGaTSd66c/wihIabuN/JfI7jQPTFr
         q7jR991YU5qCFMx8Z6zf6yl40s5byvIKQhD+axomVeBh/dUBYkpUPYiok5ZUfBhd72DK
         TeNyE99xMul3nNAGpX4SyEGbTXKAnIiXfdseDGBXGeZX4SIjRLrL/WUTqJ81TnGewJZ/
         buNA==
X-Gm-Message-State: AC+VfDzlPrZEjTMF0JnM03rApNIVFUoBpe5+iuQJVRAjBsf70A0BrYwj
        oKyqilllbbYK24n8cMhmhxU9vTM3Mq6VQ/iI/OEB9w==
X-Google-Smtp-Source: ACHHUZ4te0AaK/JzTEsMGDqUpCCjq8nPtW1UY5HTyKVkPeqxtL5BAZZNlI0T3h3SEvEB44eVdaFAHp0j8rMQPrfGTL8=
X-Received: by 2002:a0d:d6c9:0:b0:561:c9c1:ce with SMTP id y192-20020a0dd6c9000000b00561c9c100cemr2679247ywd.8.1684358434224;
 Wed, 17 May 2023 14:20:34 -0700 (PDT)
MIME-Version: 1.0
References: <20230430-nokia770-regression-v4-0-9b6dc5536b17@linaro.org>
 <20230430-nokia770-regression-v4-1-9b6dc5536b17@linaro.org> <20230517203953.GI271152@darkstar.musicnaut.iki.fi>
In-Reply-To: <20230517203953.GI271152@darkstar.musicnaut.iki.fi>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 17 May 2023 23:20:22 +0200
Message-ID: <CACRpkdbv6hb6KTTSPMhzYJrS_TGoPdeTUO4CZVjaTH0R=G66=w@mail.gmail.com>
Subject: Re: [PATCH v4 1/4] Input: ads7846 - Convert to use software nodes
To:     Aaro Koskinen <aaro.koskinen@iki.fi>
Cc:     Janusz Krzysztofik <jmkrzyszt@gmail.com>,
        Tony Lindgren <tony@atomide.com>,
        Russell King <linux@armlinux.org.uk>,
        Daniel Mack <daniel@zonque.org>,
        Haojian Zhuang <haojian.zhuang@gmail.com>,
        Robert Jarzmik <robert.jarzmik@free.fr>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Andreas Kemnade <andreas@kemnade.info>,
        Helge Deller <deller@gmx.de>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
        linux-input@vger.kernel.org, linux-spi@vger.kernel.org,
        linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-mmc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Wed, May 17, 2023 at 10:39=E2=80=AFPM Aaro Koskinen <aaro.koskinen@iki.f=
i> wrote:

> When tested w/gpio-descriptors-omap branch, the touchscreen probe fails:
>
> [    2.378540] SPI driver ads7846 has no spi_device_id for ti,tsc2046
> [    2.391906] SPI driver ads7846 has no spi_device_id for ti,ads7843
> [    2.405029] SPI driver ads7846 has no spi_device_id for ti,ads7845
> [    2.418151] SPI driver ads7846 has no spi_device_id for ti,ads7873

This is just regular noise from SPI device drivers that are missing
spi_device_id.

> [    2.432556] ads7846 spi2.0: Unknown device model
> [    2.443817] ads7846: probe of spi2.0 failed with error -22
>
> I don't know if that's caused by any the patches in the branch or some
> other regression. With v6.2 it probes OK.

The device is missing compatible. I fixed it.

Will push the branch after looking at the rest of the comments.

Yours,
Linus Walleij
