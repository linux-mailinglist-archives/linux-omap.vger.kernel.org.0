Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5BD62690599
	for <lists+linux-omap@lfdr.de>; Thu,  9 Feb 2023 11:47:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229583AbjBIKrY (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 9 Feb 2023 05:47:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36402 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229498AbjBIKq1 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 9 Feb 2023 05:46:27 -0500
Received: from mail-yb1-xb2c.google.com (mail-yb1-xb2c.google.com [IPv6:2607:f8b0:4864:20::b2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3BDCC69522
        for <linux-omap@vger.kernel.org>; Thu,  9 Feb 2023 02:45:31 -0800 (PST)
Received: by mail-yb1-xb2c.google.com with SMTP id 184so1812150ybw.5
        for <linux-omap@vger.kernel.org>; Thu, 09 Feb 2023 02:45:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=6ECisu58Ou5Xr+AMVxHOSKNEG1TgY5Zq0H9DdDE7KjY=;
        b=PVhgmNxsQQPyBAEDdyt8QfmWO6MNCgn8yXiI9Mk1P0Ph6Z19uULy1nXT56GCFjrWPx
         kjKAE5+lQs+meWWdvnVXJViYasQ2BIpN581gJLur43fb8v+TauC8ZGc8lXkHOKYKGPcA
         FP9AoOGP4SFr4QMxn1WBQianBQR4oWtc3600hrLz3lvn4coxlQ/kaFuOWt2ycqbFfbXj
         SxVqq2jNdWE80O8KHlaeEokxbPI9aumzyK9cn0FOyw0rWNFqZc4gomcB9McjjYB1Bcm8
         Us5DeeJ+v5hZbjP8yos1A+fhfcFeiZ/hBxsKgjJrx5lCY9fTmG5/RwJWvoKjyWMph0k2
         WXDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6ECisu58Ou5Xr+AMVxHOSKNEG1TgY5Zq0H9DdDE7KjY=;
        b=SoFAOmS53ICvE+Omrm+53ZdermHvIUIBojkigbRfPJunxsYqRpe6WGcbBwc6Fybris
         il38VZ695GwfyJS5ycskYTegHOymuuRVAVxm+Qq1KOHMPThEXRF1rerugW5p+UNToCD5
         aPf0WiBnhJDFZLKWaa7/9m+yQT8RRCKe2oQ37e3i4NLDUnyOsewJGZXRx5j+Z4SWKb8u
         h1qOYfBuHE64jy6VcHAhfbqjRJo+dgiTnSDejMB5Z/CEWt4zIQJyLPsy36iX4wP4YOYE
         1sTtJhX30GSY0NqooK/H8og3b7CKwF5ls25+HeMp9RLVjV7oDjQNsvpYc36YevWocGl+
         vhdQ==
X-Gm-Message-State: AO0yUKXTWQITt47WZmwMPbpaYr5WVbqPjOqu1He95w2QfvRPI0L6+STt
        CMdPbOcqb4O0wKDsMCgX6Sw4tK2KKMkKH9UlHwVIGw==
X-Google-Smtp-Source: AK7set+c8vMXQoWt9zrvvB2u9a8HdXjW8xESL/qxrGLNm0jpSb7R5TJb/uyrRXXnVWpXHWRj2G52DUyGkXuHv+E8/cU=
X-Received: by 2002:a5b:6c5:0:b0:88f:946:bd98 with SMTP id r5-20020a5b06c5000000b0088f0946bd98mr1339211ybq.24.1675939530421;
 Thu, 09 Feb 2023 02:45:30 -0800 (PST)
MIME-Version: 1.0
References: <20230208173343.37582-1-andriy.shevchenko@linux.intel.com>
 <20230208173343.37582-3-andriy.shevchenko@linux.intel.com> <30234963-33e5-e2d7-a6ef-112e89efbdd0@linaro.org>
In-Reply-To: <30234963-33e5-e2d7-a6ef-112e89efbdd0@linaro.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 9 Feb 2023 11:45:18 +0100
Message-ID: <CACRpkdYRTq35gJq3YODGh9S_JnH1jxSOT8mNnetyRQY9Z5LhWQ@mail.gmail.com>
Subject: Re: [PATCH v4 02/18] ARM: s3c24xx: Use the right include
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Tony Lindgren <tony@atomide.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Vincenzo Palazzo <vincenzopalazzodev@gmail.com>,
        Devarsh Thakkar <devarsht@ti.com>,
        Michael Walle <michael@walle.cc>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Dipen Patel <dipenp@nvidia.com>,
        Thierry Reding <treding@nvidia.com>,
        Stefan Schmidt <stefan@datenfreihafen.org>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Lee Jones <lee@kernel.org>, linux-gpio@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-doc-tw-discuss@lists.sourceforge.net,
        linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
        linuxppc-dev@lists.ozlabs.org, linux-sh@vger.kernel.org,
        linux-acpi@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-input@vger.kernel.org, linux-media@vger.kernel.org,
        linux-wpan@vger.kernel.org, netdev@vger.kernel.org,
        linux-wireless@vger.kernel.org,
        brcm80211-dev-list.pdl@broadcom.com,
        SHA-cyfmac-dev-list@infineon.com, linux-arch@vger.kernel.org,
        devicetree@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>,
        Jonathan Corbet <corbet@lwn.net>, Alex Shi <alexs@kernel.org>,
        Yanteng Si <siyanteng@loongson.cn>,
        Hu Haowen <src.res@email.cn>,
        Russell King <linux@armlinux.org.uk>,
        Aaro Koskinen <aaro.koskinen@iki.fi>,
        Janusz Krzysztofik <jmkrzyszt@gmail.com>,
        Andrew Lunn <andrew@lunn.ch>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Nicholas Piggin <npiggin@gmail.com>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>,
        Mun Yew Tham <mun.yew.tham@intel.com>,
        Keerthy <j-keerthy@ti.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Alexander Aring <alex.aring@gmail.com>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Arend van Spriel <aspriel@gmail.com>,
        Franky Lin <franky.lin@broadcom.com>,
        Hante Meuleman <hante.meuleman@broadcom.com>,
        Kalle Valo <kvalo@kernel.org>, Qiang Zhao <qiang.zhao@nxp.com>,
        Li Yang <leoyang.li@nxp.com>, Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Wed, Feb 8, 2023 at 6:39 PM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:

> On 08/02/2023 18:33, Andy Shevchenko wrote:
> > From: Linus Walleij <linus.walleij@linaro.org>
> >
> > The file s3c64xx.c is including <linux/gpio.h> despite using no
> > symbols from the file, however it needs it to implicitly bring in
> > of_have_populated_dt() so include <linux/of.h> explicitly instead.
> >
> > Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > ---
> >  arch/arm/mach-s3c/s3c64xx.c | 2 +-
>
> It's not s3c24xx anymore, so subject prefix:
> ARM: s3c64xx:

My mistake, mea culpa.

Yours,
Linus Walleij
