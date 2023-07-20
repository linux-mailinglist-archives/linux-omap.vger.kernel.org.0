Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 72DD975B831
	for <lists+linux-omap@lfdr.de>; Thu, 20 Jul 2023 21:42:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231147AbjGTTm0 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 20 Jul 2023 15:42:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46700 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229552AbjGTTmZ (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 20 Jul 2023 15:42:25 -0400
Received: from mail-yb1-xb34.google.com (mail-yb1-xb34.google.com [IPv6:2607:f8b0:4864:20::b34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 101741BC1
        for <linux-omap@vger.kernel.org>; Thu, 20 Jul 2023 12:42:24 -0700 (PDT)
Received: by mail-yb1-xb34.google.com with SMTP id 3f1490d57ef6-c11e2b31b95so1047441276.3
        for <linux-omap@vger.kernel.org>; Thu, 20 Jul 2023 12:42:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689882143; x=1690486943;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6uboV9zE5viSPMUN9jRcO0cjpaJKLGwKotI/bN04OyY=;
        b=Is+h2NeaSzJfFfsZ98ro8BWc2npdTi8/mAPrWVvtpsxb716Whq2DsR1nkUJ5zX14Xz
         79qaflwC3BG2VYXCeK0ijBZtmZDQ1AwFmwaxjZDd/vn/AKdit/VHpHHNt7ZvyrLIlMK1
         rAvvaKIi1pdCGIE6T6PamxnnJ1xdepfGuegPYvjWZ/2v5uqSbyOmvOqKrH1HZMZxxQ9u
         TipBUYHRAcaq7G2V/lDcSoviQy3dB4LjRa8c+TMTdx5eHkXHMxyv/6aRPA0MgnDthZDb
         /qNXdFoMB9q33L3QYVfMXu7JSq0qiwBR5arRe8VeAjZhX1/RRVS46BZipMLM8QxKUS/8
         /7lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689882143; x=1690486943;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6uboV9zE5viSPMUN9jRcO0cjpaJKLGwKotI/bN04OyY=;
        b=lNKHcHnl439PvLWJ3mqJet5MxPjCvt76xFV0gGVmavBaJlwgo5N78yubPTuMvUimVw
         cFNsJQ1FLEinkpszPd+x+czjGbM4Lmisf5DpqaJnvPNsZ0EpfOcj3Afkmgz5xQhyUgMY
         zNNs0PHqYKrSSmyIG4c3xjzISVKLpaZHKiyCnS7/aIEvj/lL9N5rDAVFnxJIWHHYim2b
         Ur7BwIQRqxB+ipJ7CxIPOPlvL7Syka+iAMe9zZgpAmc2tLexIqHVAFVLCg6VU82vQQuX
         NzMr6/s+52EWUAQQfsQu9SX8M6ycG18J9IFchft9vWiM+ZgzEW2U0UOg1w19dSm2lW7Y
         oeQg==
X-Gm-Message-State: ABy/qLbrbBSUZSy5GxYoo41wyUJgN73p1ZkW4mESpnb/v2wlEE8KmzUQ
        23OWnN8Zls/4GC+rlwD3kdVHkKaqS8DeyNeGAnmD2A==
X-Google-Smtp-Source: APBJJlE7cBabIqsDgOVse9OOZ6aTjmPoq/DJCfwfg6nCOEVEXRqRJUSYnSIJLuoYJ0UvKAptp1crbwCoFVPdkqeY7hY=
X-Received: by 2002:a25:c50b:0:b0:cdd:6635:a1f8 with SMTP id
 v11-20020a25c50b000000b00cdd6635a1f8mr5819173ybe.15.1689882143201; Thu, 20
 Jul 2023 12:42:23 -0700 (PDT)
MIME-Version: 1.0
References: <20230714174901.4062397-1-robh@kernel.org>
In-Reply-To: <20230714174901.4062397-1-robh@kernel.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 20 Jul 2023 21:42:12 +0200
Message-ID: <CACRpkdYe9b4ZpvYZqkcMq0Jjni_VD_75Zt5oKv4+v9f3pmJbVA@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: Explicitly include correct DT includes
To:     Rob Herring <robh@kernel.org>
Cc:     Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
        Broadcom internal kernel review list 
        <bcm-kernel-feedback-list@broadcom.com>,
        Dong Aisheng <aisheng.dong@nxp.com>,
        Fabio Estevam <festevam@gmail.com>,
        Shawn Guo <shawnguo@kernel.org>, Jacky Bai <ping.bai@nxp.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        NXP Linux Team <linux-imx@nxp.com>,
        Sean Wang <sean.wang@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Andrew Lunn <andrew@lunn.ch>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Chester Lin <clin@suse.com>, NXP S32 Linux Team <s32@nxp.com>,
        Chen-Yu Tsai <wens@csie.org>,
        Damien Le Moal <dlemoal@kernel.org>,
        Vladimir Zapolskiy <vz@mleia.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Tony Lindgren <tony@atomide.com>,
        Haojian Zhuang <haojian.zhuang@linaro.org>,
        Daniel Mack <daniel@zonque.org>,
        Robert Jarzmik <robert.jarzmik@free.fr>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Viresh Kumar <vireshk@kernel.org>,
        Shiraz Hashim <shiraz.linux.kernel@gmail.com>, soc@kernel.org,
        Orson Zhai <orsonzhai@gmail.com>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        Chunyan Zhang <zhang.lyra@gmail.com>,
        Emil Renner Berthing <kernel@esmil.dk>,
        Jianlong Huang <jianlong.huang@starfivetech.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Dvorkin Dmitry <dvorkin@tibbo.com>,
        Wells Lu <wellslutw@gmail.com>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-mediatek@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-riscv@lists.infradead.org,
        linux-oxnas@groups.io, linux-rockchip@lists.infradead.org,
        linux-omap@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Fri, Jul 14, 2023 at 7:49=E2=80=AFPM Rob Herring <robh@kernel.org> wrote=
:

> The DT of_device.h and of_platform.h date back to the separate
> of_platform_bus_type before it as merged into the regular platform bus.
> As part of that merge prepping Arm DT support 13 years ago, they
> "temporarily" include each other. They also include platform_device.h
> and of.h. As a result, there's a pretty much random mix of those include
> files used throughout the tree. In order to detangle these headers and
> replace the implicit includes with struct declarations, users need to
> explicitly include the correct includes.
>
> Signed-off-by: Rob Herring <robh@kernel.org>

It still applied cleanly so I just applied it.

Thanks for attention to detail.

Yours,
Linus Walleij
