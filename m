Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4BAC126563D
	for <lists+linux-omap@lfdr.de>; Fri, 11 Sep 2020 02:57:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725497AbgIKA5O (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 10 Sep 2020 20:57:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41022 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725298AbgIKA5I (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 10 Sep 2020 20:57:08 -0400
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com [IPv6:2a00:1450:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0F53DC061573;
        Thu, 10 Sep 2020 17:57:07 -0700 (PDT)
Received: by mail-ej1-x644.google.com with SMTP id u21so11468533eja.2;
        Thu, 10 Sep 2020 17:57:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=tkJnBKB+5Domdf5vHRZtifdi4EWqpxtk+BRDBj+qEQQ=;
        b=FLH0ZPoi2B+nzLIURnXoKuWbMep6zKKPYC6feQLG4/bp/nGSAzqy6LdsXV3RObmTc6
         8YEO0znR4SkOvCAXPwiiYCi3FAjn0RenWwpx5dI/wvCOpBRBA+H/v0l7tO7VVNpkAYqz
         9fQt/MnfMtup4vD0lMBU5WRFoYhppvFPeLw+k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=tkJnBKB+5Domdf5vHRZtifdi4EWqpxtk+BRDBj+qEQQ=;
        b=Fo90qg2u1SgzAs+GdNIFUq9xsphMQCX0RhD/RdORJnYczlSbH3zinKhOhPX9iPpPYV
         EP1QTwslWKhdUhXTopD1s1PsyYlPHcU2ITf4b3hXiHzNHK9OFb/YYeo0zgCfidfAwve+
         nfuHewx0kUkYPXk5q7RDp//w9nUHGrixNssn7OUfJsXriG7HPVMfuCF7VuV6plwhc3Ri
         bwuhvHi79yXrou9YbqMbn2cUJ5Wn1jitjstNemNSd7p2poovMDqCwX1OjVAhm/SAJzqZ
         UhVwEfMVyOAmPHSeB7m9wdqp+krE4MZzJtIM2DyaqjR1kYKTntAYhM5Wd9QFfSKd2XHt
         7V7A==
X-Gm-Message-State: AOAM531KID2c5B6U618khUADIqJ/2xBUOelzJHGnbYUw8qdv0QRTxQVR
        hfB2TXHjPJMID3eip0hjxMGvFCG/742suQAhj1A=
X-Google-Smtp-Source: ABdhPJzN9op/B4tSTilqcYoFaNSXY5BFurioXjFk61As43aUOnnnkGmnc7IPzMBe//QTkgP458J0K5uPVCUqFkW/EI0=
X-Received: by 2002:a17:906:e918:: with SMTP id ju24mr11306983ejb.442.1599785825728;
 Thu, 10 Sep 2020 17:57:05 -0700 (PDT)
MIME-Version: 1.0
References: <20200910175733.11046-1-krzk@kernel.org> <20200910175733.11046-12-krzk@kernel.org>
In-Reply-To: <20200910175733.11046-12-krzk@kernel.org>
From:   Joel Stanley <joel@jms.id.au>
Date:   Fri, 11 Sep 2020 00:56:53 +0000
Message-ID: <CACPK8Xe8ufYxKA_Xh7D=TgocRFQ7BKFdm_Le-Ob-QxZWm6PZJw@mail.gmail.com>
Subject: Re: [PATCH v2 11/15] ARM: dts: aspeed: fix PCA95xx GPIO expander
 properties on Portwell
To:     Krzysztof Kozlowski <krzk@kernel.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        =?UTF-8?Q?Beno=C3=AEt_Cousson?= <bcousson@baylibre.com>,
        Tony Lindgren <tony@atomide.com>,
        Russell King <linux@armlinux.org.uk>,
        Jason Cooper <jason@lakedaemon.net>,
        Andrew Lunn <andrew@lunn.ch>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Andrew Jeffery <andrew@aj.id.au>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        NXP Linux Team <linux-imx@nxp.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Tero Kristo <t-kristo@ti.com>, Nishanth Menon <nm@ti.com>,
        Michal Simek <michal.simek@xilinx.com>,
        Guenter Roeck <linux@roeck-us.net>,
        devicetree <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-omap@vger.kernel.org,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-aspeed <linux-aspeed@lists.ozlabs.org>,
        linux-mediatek@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Thu, 10 Sep 2020 at 17:59, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> The PCA95xx GPIO expander requires GPIO controller properties to operate
> properly.
>
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

Acked-by: Joel Stanley <joel@jms.id.au>

(This device tree can probably be dropped in the future. I heard these
boards were very hard to come by even a year or so ago, and I doubt
they are still in use.)

> ---
>  arch/arm/boot/dts/aspeed-bmc-portwell-neptune.dts | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/arch/arm/boot/dts/aspeed-bmc-portwell-neptune.dts b/arch/arm/boot/dts/aspeed-bmc-portwell-neptune.dts
> index 4a1ca8f5b6a7..03c161493ffc 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-portwell-neptune.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-portwell-neptune.dts
> @@ -121,6 +121,8 @@
>         pca9555@27 {
>                 compatible = "nxp,pca9555";
>                 reg = <0x27>;
> +               gpio-controller;
> +               #gpio-cells = <2>;
>         };
>  };
>
> --
> 2.17.1
>
