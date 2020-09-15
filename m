Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A260E26ADFB
	for <lists+linux-omap@lfdr.de>; Tue, 15 Sep 2020 21:48:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727874AbgIOTsS (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 15 Sep 2020 15:48:18 -0400
Received: from mail-il1-f194.google.com ([209.85.166.194]:38071 "EHLO
        mail-il1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727755AbgIOTrp (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 15 Sep 2020 15:47:45 -0400
Received: by mail-il1-f194.google.com with SMTP id t18so4188416ilp.5;
        Tue, 15 Sep 2020 12:47:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=vlMe/O0KpaLLn52vRtI2d+InOdmPVFJgxviIiqo487k=;
        b=Hx4JcNekRElzjsosTQx18YzIcAvdLGVEES+rJid6gQj8CuzpeLZiGqNN91MIJy46XI
         MPEYE2DZXkOwQsUYD9QW3wYY0zoROIvSvCxBz8JNFWdn4y+pq+PTXOt4/xhsK0pjfk5/
         7J6lXDHBJTBvAMjdGHbW77yU7mS1GYzmU6ZMlNCtBAe2MPmC0soev5xTEx/1mggZ3pG1
         9QmQjf1azbHnRho0R3kVgpF/UtJGKgbc/RzWMpK5c0YxtFKAFApKa15QU/uRDCp9zMtT
         5wCk6cB1o1WupcgC08+E4VOREBEW5qvRqYDXdqPYHTVdsV9LJpfzca/7mVc9e+1ARyaX
         2Oiw==
X-Gm-Message-State: AOAM530azeMPhpH9u6NYbGx0xkXn8phd0dSH1cuX1n8l/XFUbHa7hh/A
        1k2YWDZQRD9HpQjSVJbMdw==
X-Google-Smtp-Source: ABdhPJyJBucL9yXLzWld+N7C06O44ALNqm0DtTmTngrhGguRJncbPkgBRf60HAkVwNDjrR37f44klQ==
X-Received: by 2002:a92:6901:: with SMTP id e1mr17859827ilc.209.1600199263981;
        Tue, 15 Sep 2020 12:47:43 -0700 (PDT)
Received: from xps15 ([64.188.179.253])
        by smtp.gmail.com with ESMTPSA id m15sm7972824iow.9.2020.09.15.12.47.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2020 12:47:43 -0700 (PDT)
Received: (nullmailer pid 2389041 invoked by uid 1000);
        Tue, 15 Sep 2020 19:47:40 -0000
Date:   Tue, 15 Sep 2020 13:47:40 -0600
From:   Rob Herring <robh@kernel.org>
To:     Nishanth Menon <nm@ti.com>
Cc:     Krzysztof Kozlowski <krzk@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
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
Subject: Re: [PATCH v2 01/15] dt-bindings: gpio: convert bindings for NXP
 PCA953x family to dtschema
Message-ID: <20200915194740.GA2385241@bogus>
References: <20200910175733.11046-1-krzk@kernel.org>
 <20200910175733.11046-2-krzk@kernel.org>
 <20200910182814.veviax3n377undkv@akan>
 <CAJKOXPdQJz7aLu4sjds46SiZwxvB-VMBR=stjpUme+8iEo+d-w@mail.gmail.com>
 <20200910191305.phjtijx2fhkhqavu@akan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200910191305.phjtijx2fhkhqavu@akan>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Thu, Sep 10, 2020 at 02:13:05PM -0500, Nishanth Menon wrote:
> On 20:53-20200910, Krzysztof Kozlowski wrote:
> > On Thu, 10 Sep 2020 at 20:28, Nishanth Menon <nm@ti.com> wrote:
> > >
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
> Probably a nitpick.. but then,.. I have'nt seen us depend on hierarchy
> for uniqueness of naming.. we choose for example "bus" no matter where
> in the hierarchy it falls in, as long it is a bus.. etc.. same argument
> holds good for properties as well.. "gpio-hog;" is kinda redundant if
> you think of it for a compatible that is already gpio ;)..
> 
> I did'nt mean to de-rail the discussion, but was curious what the DT
> maintainers think..

Not really a fan of gpio-hog binding to have another type of hog nor can 
I imagine what that would be.

Rob
