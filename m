Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6A0DD2659AB
	for <lists+linux-omap@lfdr.de>; Fri, 11 Sep 2020 08:55:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725601AbgIKGy5 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 11 Sep 2020 02:54:57 -0400
Received: from mail.kernel.org ([198.145.29.99]:48234 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725497AbgIKGy4 (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Fri, 11 Sep 2020 02:54:56 -0400
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id F097322205;
        Fri, 11 Sep 2020 06:54:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1599807295;
        bh=LYU8Tb5GMA6mmuFbZxVtsFi/egUHKAmHaWZZIbnXOvo=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=JiQ0HGMpnHYgpuekKtUf+8YvvWXHzJEvW2KhxPV1s5oG+08DzzajE6E5TXHZ0XXAn
         GD28lSc5mGYQpc+tH2JXNbqpTqYfAtLUFNTrchaT69hRx45fzt/oWcj542xAqWz2U6
         +nsbHt0tt1JmvAU8oVP2XU3yOLPlFIHlOTX7QtZ4=
Received: by mail-ej1-f50.google.com with SMTP id lo4so12302677ejb.8;
        Thu, 10 Sep 2020 23:54:54 -0700 (PDT)
X-Gm-Message-State: AOAM530ef8wsbEoFpHReTp79IIScPGu6EQLEncwTcsZxS/pDIEa6CS0Z
        mzijpHa4C0NWr7Us4tyYhHx1zE8FFHOUhTuLvAs=
X-Google-Smtp-Source: ABdhPJwFL/7j5w+fjQzCHgD8gJxiV9FGUB6o363qCx8Mfmt5a32puUoIjMf+DBJD/BgaOz8YT/NIs5ONHQziHSJrLOA=
X-Received: by 2002:a17:906:4046:: with SMTP id y6mr730092ejj.148.1599807293350;
 Thu, 10 Sep 2020 23:54:53 -0700 (PDT)
MIME-Version: 1.0
References: <20200910175733.11046-1-krzk@kernel.org> <20200910175733.11046-2-krzk@kernel.org>
 <20200910182814.veviax3n377undkv@akan> <CAJKOXPdQJz7aLu4sjds46SiZwxvB-VMBR=stjpUme+8iEo+d-w@mail.gmail.com>
 <CAMuHMdVG6+BsTUxb4wcAwj1WK982S0k2RCxmb3x9gsOS2TphNw@mail.gmail.com>
In-Reply-To: <CAMuHMdVG6+BsTUxb4wcAwj1WK982S0k2RCxmb3x9gsOS2TphNw@mail.gmail.com>
From:   Krzysztof Kozlowski <krzk@kernel.org>
Date:   Fri, 11 Sep 2020 08:54:40 +0200
X-Gmail-Original-Message-ID: <CAJKOXPcSUY6aqvix7R0YkzQL9Mze9O8jrWLLxKoRyjHTRhrYLA@mail.gmail.com>
Message-ID: <CAJKOXPcSUY6aqvix7R0YkzQL9Mze9O8jrWLLxKoRyjHTRhrYLA@mail.gmail.com>
Subject: Re: [PATCH v2 01/15] dt-bindings: gpio: convert bindings for NXP
 PCA953x family to dtschema
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Nishanth Menon <nm@ti.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        =?UTF-8?Q?Beno=C3=AEt_Cousson?= <bcousson@baylibre.com>,
        Tony Lindgren <tony@atomide.com>,
        Russell King <linux@armlinux.org.uk>,
        Jason Cooper <jason@lakedaemon.net>,
        Andrew Lunn <andrew@lunn.ch>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@aj.id.au>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        NXP Linux Team <linux-imx@nxp.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Tero Kristo <t-kristo@ti.com>,
        Michal Simek <michal.simek@xilinx.com>,
        Guenter Roeck <linux@roeck-us.net>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "open list:TI ETHERNET SWITCH DRIVER (CPSW)" 
        <linux-omap@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-aspeed@lists.ozlabs.org, linux-mediatek@lists.infradead.org,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Fri, 11 Sep 2020 at 08:42, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>
> Hi Krzysztof,
>
> On Thu, Sep 10, 2020 at 8:54 PM Krzysztof Kozlowski <krzk@kernel.org> wrote:
> > On Thu, 10 Sep 2020 at 20:28, Nishanth Menon <nm@ti.com> wrote:
> > > On 19:57-20200910, Krzysztof Kozlowski wrote:
> > > [...]
> > > > +  wakeup-source:
> > > > +    $ref: /schemas/types.yaml#/definitions/flag
> > > > +
> > > > +patternProperties:
> > > > +  "^(hog-[0-9]+|.+-hog(-[0-9]+)?)$":
> > >
> > > I wonder if "hog" is too generic and might clash with "something-hog" in
> > > the future?
> >
> > This pattern is already used in
> > Documentation/devicetree/bindings/gpio/fsl-imx-gpio.yaml. It will
> > match only children and so far it did not find any other nodes in ARM
> > and ARM64 dts. I don't expect clashes. Also the question is then - if
> > one adds a child of GPIO expander named "foobar-hog" and it is not a
> > GPIO hog, then what is it?
>
> Perhaps you didn't find any other nodes as children of pca953x
> controllers?

There shouldn't be.. unless one makes some i2c-gpio controller under
such GPIO expander. But now it wouldn't be instantiated as expander is
not a bus.

> There are other hog nodes in other types of GPIO controllers. Typically
> they're named after the purpose, e.g. "wifi-disable", "i2c3_mux_oe_n",
> "pcie_sata_switch", "lcd0_mux".
>
> IMHO it's a hog if it contains a "gpio-hog" property, regardless of node
> naming.

Yes. The question is then whether to expect the "hog" in name. Just
like we expect for all other device nodes to represent the class.

Best regards,
Krzysztof
