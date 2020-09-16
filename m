Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5186826BC66
	for <lists+linux-omap@lfdr.de>; Wed, 16 Sep 2020 08:15:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726242AbgIPGPU (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 16 Sep 2020 02:15:20 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:39462 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726172AbgIPGPS (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 16 Sep 2020 02:15:18 -0400
Received: by mail-wm1-f67.google.com with SMTP id b79so1627678wmb.4;
        Tue, 15 Sep 2020 23:15:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=1Uh7Ou5BUk6cJr1eeO8uTrFUHXPcK3jWLNCgC2OA24Q=;
        b=iimM/rgA0sVbd2BUccvtCaS7S8lZwIZ7g2PlklMvADdLFem6OiWM1Cp8u574+7BbwY
         SuZEVwd7epJNsDiJRE4+Jq1VKQJc9yrwdy0nCpNDLE3qBumZMKQGHyCLvEQq/GmJGGsn
         lozDRkW7Lotntmdd7cNzedQTsHViXLvwODXKDobv18aWWxeqPYoh48hYp2hLFT8LGU4N
         pnFMZ1tCbbmtAcrR45kBgT8VnPgzcULDPzWkXGrLHXGhH72tVQYcEuKf3ckL/FGM+RGC
         4WLF+bKvDqb5ah5X8IjI6+nzJYaqjewQidr10BCM5H+fzQURWokGmPOeAUwiovp3wews
         AY6w==
X-Gm-Message-State: AOAM5315rbuqAsuieb5cut2/3K3WbfXNMeFrmbFiJ+iRqZT6D6JTixeY
        SAiTwWdm09T9zz0g9+peMUE=
X-Google-Smtp-Source: ABdhPJw7nNn+CFhmnzt169e4rqB2CZP7AUPFZ9UBjFZbfGui7iEULE8AHLZ3m9ra4r8Pv7DiLjNGnw==
X-Received: by 2002:a7b:c92c:: with SMTP id h12mr2849155wml.121.1600236916238;
        Tue, 15 Sep 2020 23:15:16 -0700 (PDT)
Received: from kozik-lap ([194.230.155.124])
        by smtp.googlemail.com with ESMTPSA id u126sm4022642wmu.9.2020.09.15.23.15.13
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 15 Sep 2020 23:15:15 -0700 (PDT)
Date:   Wed, 16 Sep 2020 08:15:11 +0200
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        =?utf-8?Q?Beno=C3=AEt?= Cousson <bcousson@baylibre.com>,
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
        Tero Kristo <t-kristo@ti.com>, Nishanth Menon <nm@ti.com>,
        Michal Simek <michal.simek@xilinx.com>,
        Guenter Roeck <linux@roeck-us.net>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Linux-OMAP <linux-omap@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-aspeed <linux-aspeed@lists.ozlabs.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH v2 02/15] dt-bindings: gpio: convert bindings for Maxim
 MAX732x family to dtschema
Message-ID: <20200916061511.GA5719@kozik-lap>
References: <20200910175733.11046-1-krzk@kernel.org>
 <20200910175733.11046-3-krzk@kernel.org>
 <CACRpkdZXu2J4z=1j-syxSbz2x-QiLeTBpwHSOVNfmZ31RgM6Ng@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CACRpkdZXu2J4z=1j-syxSbz2x-QiLeTBpwHSOVNfmZ31RgM6Ng@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Sat, Sep 12, 2020 at 11:58:22AM +0200, Linus Walleij wrote:
> On Thu, Sep 10, 2020 at 7:58 PM Krzysztof Kozlowski <krzk@kernel.org> wrote:
> 
> > Convert the Maxim MAX732x family of GPIO expanders bindings to device
> > tree schema by merging it with existing PCA95xx schema.  These are quite
> > similar so merging reduces duplication.
> >
> > Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> 
> Can I just apply this one patch to the GPIO tree?

No, this requires the previous one (1/15) because it merges the max732x
into pca95xx.

Although now Rob reviewed both so you can pick them up.

Best regards,
Krzysztof
