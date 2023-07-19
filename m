Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E53FA75941C
	for <lists+linux-omap@lfdr.de>; Wed, 19 Jul 2023 13:24:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229712AbjGSLYs (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 19 Jul 2023 07:24:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49116 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229765AbjGSLYr (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 19 Jul 2023 07:24:47 -0400
Received: from mail-ua1-x92a.google.com (mail-ua1-x92a.google.com [IPv6:2607:f8b0:4864:20::92a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 93BAEE75
        for <linux-omap@vger.kernel.org>; Wed, 19 Jul 2023 04:24:45 -0700 (PDT)
Received: by mail-ua1-x92a.google.com with SMTP id a1e0cc1a2514c-794d1714617so2460934241.0
        for <linux-omap@vger.kernel.org>; Wed, 19 Jul 2023 04:24:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1689765884; x=1690370684;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OZSrWDc/cBveds+xSFFWhnQ/pzCd4lTeY64B0PPEGW0=;
        b=T1IMgiireLSvSXiTqLXmFjq9F8EsjIjVEm5sr6vcGRZMB9arVcgUqsKwzTbbVZ5B0d
         ajVxvut0epp7SNwmwKzEJMgdJvXYkYEb8jBPrsW0yDzJnFFxJoO/RQdh2N1yZJ5O9MRS
         Ev8Qg9vc4kY2/ME9SqOM+vCW3ViGaZsYa86Kxz9XR/ZPgndF9vzesGT0RksXS5eMc04h
         ell7+2PcrXlKisrXM96SjKXJ5kwoMY57qLfIyeplwiEJjo9Q4LxRnOriSbtInNjcqq+o
         I6RYEDjc39Gn0ddNJHe53OJEYZqvaM+hrQhZij6E4WH+TgsfMnxGoOOW7yjSfGQETgYn
         U63A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689765884; x=1690370684;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OZSrWDc/cBveds+xSFFWhnQ/pzCd4lTeY64B0PPEGW0=;
        b=hQNyY4m0tL07YUEvURSn4PwBb7M2Eptd8k/pA3rQ656xUrRMnq3+98FGH7EM+R6+2M
         TSTMZmRzy0Qm9wfrfFYnxEW1zbkrd4bM7PgIk3tNiZOQrr6Lgn6/q26fAYot5n3YVvcB
         lGxIxLaAms8kuE590RfBdO9A1kjrK4HPjXwED/K5/6QPMrJ0AbNNLkrHxhW6ShFPgP2b
         ho86dLXSL/HInNqbwydolCN+5fyjvE4ntPfh2wlpq9w2gD4NPSq2wQ/48h/DJzDx1tze
         IatlssDWAPRrX4Z1IfLjJda3bNex6CcOa7+2e9jQC3gguyDf1CMzQBxxHuCMsBsFGB3D
         J8LA==
X-Gm-Message-State: ABy/qLbk+z3yOc8uuDqCtuFbfnoT5eyV2SNODiLOvqlWdMGKUVH6MF7f
        pOkTY0lVh9Gz/hX6xwj9Ivxe6VxbmVXhF7PkEA011A==
X-Google-Smtp-Source: APBJJlETfEXohyULgSqD+dtrZrcCLBAUgDaqwYgYehWjp3RUYrt8J/1ty1q/3ivKhd5XQbecf0XzDYFagtzXJqIh+lM=
X-Received: by 2002:a67:fa85:0:b0:443:7503:a537 with SMTP id
 f5-20020a67fa85000000b004437503a537mr8935739vsq.28.1689765884686; Wed, 19 Jul
 2023 04:24:44 -0700 (PDT)
MIME-Version: 1.0
References: <20230714174525.4055475-1-robh@kernel.org>
In-Reply-To: <20230714174525.4055475-1-robh@kernel.org>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Wed, 19 Jul 2023 13:24:33 +0200
Message-ID: <CAMRc=MeR=uEufQ3p2cqN2ABL1w9V0QHRSYLv_WVZ97q8C4AgJQ@mail.gmail.com>
Subject: Re: [PATCH] gpio: Explicitly include correct DT includes
To:     Rob Herring <robh@kernel.org>
Cc:     Alban Bedel <albeu@free.fr>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andy@kernel.org>,
        Doug Berger <opendmb@gmail.com>,
        Broadcom internal kernel review list 
        <bcm-kernel-feedback-list@broadcom.com>,
        Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
        Orson Zhai <orsonzhai@gmail.com>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        Chunyan Zhang <zhang.lyra@gmail.com>,
        Daniel Palmer <daniel@thingy.jp>,
        Romain Perier <romain.perier@gmail.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        Kevin Hilman <khilman@kernel.org>,
        Robert Jarzmik <robert.jarzmik@free.fr>,
        Heiko Stuebner <heiko@sntech.de>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>,
        Srinivas Neeli <srinivas.neeli@amd.com>,
        Michal Simek <michal.simek@amd.com>,
        Nandor Han <nandor.han@ge.com>, devicetree@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org,
        linux-rockchip@lists.infradead.org, linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Fri, Jul 14, 2023 at 7:45=E2=80=AFPM Rob Herring <robh@kernel.org> wrote=
:
>
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
> ---

Applied, thanks!

Bart
