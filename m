Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7B81F2659A3
	for <lists+linux-omap@lfdr.de>; Fri, 11 Sep 2020 08:52:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725800AbgIKGwR (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 11 Sep 2020 02:52:17 -0400
Received: from mail.kernel.org ([198.145.29.99]:46718 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725536AbgIKGwQ (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Fri, 11 Sep 2020 02:52:16 -0400
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 625F0221EB;
        Fri, 11 Sep 2020 06:52:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1599807135;
        bh=PvPqMWHR4rTZyg0mx7guwNSzHx2gYCEab6A1OsvoQGs=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=dkCscqbJ3BxxdnaZ/s6BEfah6323j4W+ukH0h4kgXUSZBGSjPNCszgETLQuOlSPY+
         hHHXjPeIlp/SzfcWA71QsgsxVyqpB3JKnaxx/jDzyjpc1piRf3TCeZ52f9cJLoW0M9
         h+RhyvvwFCHIqbOUMC6NMBXmO6EsGTjTqgCsKeBo=
Received: by mail-ej1-f47.google.com with SMTP id o8so12302758ejb.10;
        Thu, 10 Sep 2020 23:52:15 -0700 (PDT)
X-Gm-Message-State: AOAM531nqmF0We8Bd4DOP58iWZoDLnPuEaMbPLIuOuSziapMQ8viB/pw
        o92HaWmdDtkZe5A9uQ9H1X6h5zZSRwLrHO9uEV8=
X-Google-Smtp-Source: ABdhPJyQsp18R1aO6xomXKrS4P4TBW8oLLN/MwZ/kE/MYbR5zlnBByW56Q9pS5gbWiZx5BgY7fQIaaEpv0zAcIPIrGc=
X-Received: by 2002:a17:906:4046:: with SMTP id y6mr722021ejj.148.1599807133943;
 Thu, 10 Sep 2020 23:52:13 -0700 (PDT)
MIME-Version: 1.0
References: <20200910175733.11046-1-krzk@kernel.org> <20200910175733.11046-2-krzk@kernel.org>
 <CACPK8XdocAX5mOXf3VP29cNXH+6unYunB9NiT3qFVKyzR6WXPg@mail.gmail.com>
In-Reply-To: <CACPK8XdocAX5mOXf3VP29cNXH+6unYunB9NiT3qFVKyzR6WXPg@mail.gmail.com>
From:   Krzysztof Kozlowski <krzk@kernel.org>
Date:   Fri, 11 Sep 2020 08:52:01 +0200
X-Gmail-Original-Message-ID: <CAJKOXPe6Tf0B5W27XaD5zLk77OBzGCHpirhTdZjFH0oh8GvWgg@mail.gmail.com>
Message-ID: <CAJKOXPe6Tf0B5W27XaD5zLk77OBzGCHpirhTdZjFH0oh8GvWgg@mail.gmail.com>
Subject: Re: [PATCH v2 01/15] dt-bindings: gpio: convert bindings for NXP
 PCA953x family to dtschema
To:     Joel Stanley <joel@jms.id.au>
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

On Fri, 11 Sep 2020 at 08:24, Joel Stanley <joel@jms.id.au> wrote:
>
> On Thu, 10 Sep 2020 at 17:57, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> >
> > Convert the NXP PCA953x family of GPIO expanders bindings to device tree
> > schema.
> >
> > Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
>
> > +patternProperties:
> > +  "^(hog-[0-9]+|.+-hog(-[0-9]+)?)$":
> > +    type: object
> > +    properties:
> > +      gpio-hog: true
> > +      gpios: true
> > +      input: true
> > +      output-high: true
> > +      output-low: true
> > +      line-name: true
> > +
> > +    required:
> > +      - gpio-hog
> > +      - gpios
> > +
>
> > +            usb3-sata-sel-hog {
> > +                gpio-hog;
> > +                gpios = <4 GPIO_ACTIVE_HIGH>;
> > +                output-low;
> > +                line-name = "usb3_sata_sel";
>
> I would prefer we didn't require the addition of hte -hog prefix. It's
> mostly just a matter of taste, but I can think of a few more concrete
> reasons:
>
> We don't require -high or -low prefixes, so the node name doesn't need
> to describe the properties that will be found below.

Thanks for the comments.

It is not about properties (high or low) but the role of a device
node. The node names should represent a generic class of device (ePAPR
and device tree spec) and "hog" is such class.

The Documentation/devicetree/bindings/gpio/fsl-imx-gpio.yaml already
uses such naming so the best would be to unify.

>
> Changing around node names for existing boards carries with it the
> chance of userspace breakage (as sysfs paths change). I would prefer
> we avoid that if possible.

The impact on userspace is indeed important, but are you sure that
hogs are visible to user-space via sysfs and configurable? I guess you
think of deprecated CONFIG_GPIO_SYSFS?

Rob,
Any hints from you about hog-naming?

Best regards,
Krzysztof
