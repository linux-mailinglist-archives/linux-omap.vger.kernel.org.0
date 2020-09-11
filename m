Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 184C5265977
	for <lists+linux-omap@lfdr.de>; Fri, 11 Sep 2020 08:42:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725554AbgIKGmG (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 11 Sep 2020 02:42:06 -0400
Received: from mail-ot1-f68.google.com ([209.85.210.68]:38112 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725468AbgIKGmE (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 11 Sep 2020 02:42:04 -0400
Received: by mail-ot1-f68.google.com with SMTP id y5so7497325otg.5;
        Thu, 10 Sep 2020 23:42:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Fd37rPIKQ8kE2t3AwO5/OmIuIXHedyKotPXtUMjyF2w=;
        b=ssEj5ur118J6k2Ced/Zj0T1013SX/my+1L6sa+YyX2ltxckYZb9ARvDEDkeg2Wfo1E
         k6It8szDwFkVsCjOiyo/QDdRz8ACwg9HF377zNch/lowKsOnWe3sjdgQ7dpt0cKfJry1
         DXfmTaNwE8tIs9q7QzlisKsr+TpayhVx5wZl0oNMldEBfg04RfFnDO1c0Ek8qmCcaO7A
         7wjkopTQB46LymkwA4we9COpW3uoUcCcp6UbZ78H7AzyBmRyH6yJ+BHeo/5CVABtWXQ+
         k/L0YpI22NZY/NTsxjCx0caNMrMuO0qcWUTrNmy3LSovbXVVc1XaeHls9P2A6aN3MfdN
         Apew==
X-Gm-Message-State: AOAM5318K2LN1z46Ybx0Sh0+VgKvcETAqMlkZc0GMstXGUY6T+4HcZzP
        gVFdxj8gbpTY7B4+CkvPdTYdFPjSifUY74l4quI=
X-Google-Smtp-Source: ABdhPJyHFeXfHoxVfoXb/lF9obDK4GQsw0s+uaaDCZdbjIAVpoMuCLbEzubvLMnxtVhpCEHmoeJzN55crOToqaVuB8s=
X-Received: by 2002:a05:6830:1008:: with SMTP id a8mr296058otp.107.1599806523827;
 Thu, 10 Sep 2020 23:42:03 -0700 (PDT)
MIME-Version: 1.0
References: <20200910175733.11046-1-krzk@kernel.org> <20200910175733.11046-2-krzk@kernel.org>
 <20200910182814.veviax3n377undkv@akan> <CAJKOXPdQJz7aLu4sjds46SiZwxvB-VMBR=stjpUme+8iEo+d-w@mail.gmail.com>
In-Reply-To: <CAJKOXPdQJz7aLu4sjds46SiZwxvB-VMBR=stjpUme+8iEo+d-w@mail.gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 11 Sep 2020 08:41:52 +0200
Message-ID: <CAMuHMdVG6+BsTUxb4wcAwj1WK982S0k2RCxmb3x9gsOS2TphNw@mail.gmail.com>
Subject: Re: [PATCH v2 01/15] dt-bindings: gpio: convert bindings for NXP
 PCA953x family to dtschema
To:     Krzysztof Kozlowski <krzk@kernel.org>
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

Hi Krzysztof,

On Thu, Sep 10, 2020 at 8:54 PM Krzysztof Kozlowski <krzk@kernel.org> wrote:
> On Thu, 10 Sep 2020 at 20:28, Nishanth Menon <nm@ti.com> wrote:
> > On 19:57-20200910, Krzysztof Kozlowski wrote:
> > [...]
> > > +  wakeup-source:
> > > +    $ref: /schemas/types.yaml#/definitions/flag
> > > +
> > > +patternProperties:
> > > +  "^(hog-[0-9]+|.+-hog(-[0-9]+)?)$":
> >
> > I wonder if "hog" is too generic and might clash with "something-hog" in
> > the future?
>
> This pattern is already used in
> Documentation/devicetree/bindings/gpio/fsl-imx-gpio.yaml. It will
> match only children and so far it did not find any other nodes in ARM
> and ARM64 dts. I don't expect clashes. Also the question is then - if
> one adds a child of GPIO expander named "foobar-hog" and it is not a
> GPIO hog, then what is it?

Perhaps you didn't find any other nodes as children of pca953x
controllers?
There are other hog nodes in other types of GPIO controllers. Typically
they're named after the purpose, e.g. "wifi-disable", "i2c3_mux_oe_n",
"pcie_sata_switch", "lcd0_mux".

IMHO it's a hog if it contains a "gpio-hog" property, regardless of node
naming.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
