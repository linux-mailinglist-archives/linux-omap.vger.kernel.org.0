Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D7927265943
	for <lists+linux-omap@lfdr.de>; Fri, 11 Sep 2020 08:24:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725730AbgIKGYn (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 11 Sep 2020 02:24:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34638 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725535AbgIKGYm (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 11 Sep 2020 02:24:42 -0400
Received: from mail-ej1-x642.google.com (mail-ej1-x642.google.com [IPv6:2a00:1450:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BE855C061573;
        Thu, 10 Sep 2020 23:24:39 -0700 (PDT)
Received: by mail-ej1-x642.google.com with SMTP id lo4so12215856ejb.8;
        Thu, 10 Sep 2020 23:24:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=F8q8VZI/KqEdOVJ9DW+ecexrsQ8uO8xdnTiT3lh40GY=;
        b=iwxNNRSqHQPPw7NRN3+AJDPYeet1cIe/BlZC9CmOPEmivDcmkXwVg6nAsHooODEeC8
         9EO7FQ5VufnzEfm3/j4+SKpqHNDE2sPor9HObeojQJ7mkcSDKAYX3+dgbzEnwAmX/zt5
         EgDmsRXXN/ycose+Vtdl1SotJHnNGv/5q06uU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=F8q8VZI/KqEdOVJ9DW+ecexrsQ8uO8xdnTiT3lh40GY=;
        b=ReHO9jenfyt7qwSfmGBAa/jLJ526u0LwxWcSTShYipDrGDGZD69Noqi02tX4UvNX16
         gGUCZwLjRG0KhWkJWjC1Zn9abhvcoSBWY/uCEwZw1oUud11Rf8mrDOQKHmnwDHnHbBss
         3731djuCioFApyUEmLkzGkSlQpwoKPZrmCo67XnuJNFT2njalLelr7zKLK8AaoDxK6hO
         E9CUtGbinRFJukEAsNo0TrHFSW8/Bi+Yg1F4CRCRd/EAuVs2S9Bmd53YAv0G9qSI9DI8
         8IUetcsami60d3p5tg4kAAwUVbM6Icm1MoUaD00fc2wrwQoY6tRoIs2SKEcfTlOEPz21
         ZtJg==
X-Gm-Message-State: AOAM531gQsapjao0URnJ4zcwePJNfV7J2JLQ6Gs29q/cDcJjMUp1pKaL
        ctor9DRS9gQDsV19oAWagxX6FLuwIqML39CnhxQ=
X-Google-Smtp-Source: ABdhPJwGsIFct6xD49icnIdRIUypp1dR0gXkCjgcK8V0N6s7a11zNG7uif/vfB4uystoNpvqg7tfhllyjz2DhzvlA5Y=
X-Received: by 2002:a17:906:4c58:: with SMTP id d24mr630416ejw.108.1599805477428;
 Thu, 10 Sep 2020 23:24:37 -0700 (PDT)
MIME-Version: 1.0
References: <20200910175733.11046-1-krzk@kernel.org> <20200910175733.11046-2-krzk@kernel.org>
In-Reply-To: <20200910175733.11046-2-krzk@kernel.org>
From:   Joel Stanley <joel@jms.id.au>
Date:   Fri, 11 Sep 2020 06:24:25 +0000
Message-ID: <CACPK8XdocAX5mOXf3VP29cNXH+6unYunB9NiT3qFVKyzR6WXPg@mail.gmail.com>
Subject: Re: [PATCH v2 01/15] dt-bindings: gpio: convert bindings for NXP
 PCA953x family to dtschema
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

On Thu, 10 Sep 2020 at 17:57, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> Convert the NXP PCA953x family of GPIO expanders bindings to device tree
> schema.
>
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

> +patternProperties:
> +  "^(hog-[0-9]+|.+-hog(-[0-9]+)?)$":
> +    type: object
> +    properties:
> +      gpio-hog: true
> +      gpios: true
> +      input: true
> +      output-high: true
> +      output-low: true
> +      line-name: true
> +
> +    required:
> +      - gpio-hog
> +      - gpios
> +

> +            usb3-sata-sel-hog {
> +                gpio-hog;
> +                gpios = <4 GPIO_ACTIVE_HIGH>;
> +                output-low;
> +                line-name = "usb3_sata_sel";

I would prefer we didn't require the addition of hte -hog prefix. It's
mostly just a matter of taste, but I can think of a few more concrete
reasons:

We don't require -high or -low prefixes, so the node name doesn't need
to describe the properties that will be found below.

Changing around node names for existing boards carries with it the
chance of userspace breakage (as sysfs paths change). I would prefer
we avoid that if possible.

Cheers,

Joel
