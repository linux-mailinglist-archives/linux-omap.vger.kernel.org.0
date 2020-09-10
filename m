Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E84B3264DE4
	for <lists+linux-omap@lfdr.de>; Thu, 10 Sep 2020 20:55:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726898AbgIJSzD (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 10 Sep 2020 14:55:03 -0400
Received: from mail.kernel.org ([198.145.29.99]:60144 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726539AbgIJSyJ (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 10 Sep 2020 14:54:09 -0400
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 4BA8921D92;
        Thu, 10 Sep 2020 18:54:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1599764045;
        bh=XhMR0se3B2M3cCm4dG7gM2H1njurlMTbkC88FGhIKJs=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=NWf2TTe71JDTV5fTFH3pnw3HOYxZ5ivZJJsDunUt35gp25A4mNzl407I2iacg6Psi
         Budl9qFpHKWvZJLdEln1WkpXuBpI3tCHQdwvnqxK5EHBixzH8JD2FeS50pKl/BJZ9Q
         oW6NJfp9FaoUigAD/y/1aDn9KN/rWfhNcmsuNGLQ=
Received: by mail-ed1-f42.google.com with SMTP id ay8so7391618edb.8;
        Thu, 10 Sep 2020 11:54:05 -0700 (PDT)
X-Gm-Message-State: AOAM530PpEiF4gd8hIQjezXCsXKEU4jDKO+O2s24KIZK0hCqdcKi6WP6
        lRd0yze+KWFNX6QGZfOtGdAIUkCUMP64yFo52DA=
X-Google-Smtp-Source: ABdhPJzxOkwjKIRJe1J7RhPZI8K0aJEHMtzOqR5F+V93515rBHAjgLIuO18iiQn+8UTlJNwgheXSwAxcmyXoMHMFYBk=
X-Received: by 2002:a05:6402:180a:: with SMTP id g10mr10672940edy.18.1599764043844;
 Thu, 10 Sep 2020 11:54:03 -0700 (PDT)
MIME-Version: 1.0
References: <20200910175733.11046-1-krzk@kernel.org> <20200910175733.11046-2-krzk@kernel.org>
 <20200910182814.veviax3n377undkv@akan>
In-Reply-To: <20200910182814.veviax3n377undkv@akan>
From:   Krzysztof Kozlowski <krzk@kernel.org>
Date:   Thu, 10 Sep 2020 20:53:52 +0200
X-Gmail-Original-Message-ID: <CAJKOXPdQJz7aLu4sjds46SiZwxvB-VMBR=stjpUme+8iEo+d-w@mail.gmail.com>
Message-ID: <CAJKOXPdQJz7aLu4sjds46SiZwxvB-VMBR=stjpUme+8iEo+d-w@mail.gmail.com>
Subject: Re: [PATCH v2 01/15] dt-bindings: gpio: convert bindings for NXP
 PCA953x family to dtschema
To:     Nishanth Menon <nm@ti.com>
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
        Guenter Roeck <linux@roeck-us.net>, devicetree@vger.kernel.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-aspeed@lists.ozlabs.org, linux-mediatek@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Thu, 10 Sep 2020 at 20:28, Nishanth Menon <nm@ti.com> wrote:
>
> On 19:57-20200910, Krzysztof Kozlowski wrote:
> [...]
> > +  wakeup-source:
> > +    $ref: /schemas/types.yaml#/definitions/flag
> > +
> > +patternProperties:
> > +  "^(hog-[0-9]+|.+-hog(-[0-9]+)?)$":
>
> I wonder if "hog" is too generic and might clash with "something-hog" in
> the future?

This pattern is already used in
Documentation/devicetree/bindings/gpio/fsl-imx-gpio.yaml. It will
match only children and so far it did not find any other nodes in ARM
and ARM64 dts. I don't expect clashes. Also the question is then - if
one adds a child of GPIO expander named "foobar-hog" and it is not a
GPIO hog, then what is it?

Best regards,
Krzysztof
