Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 12BF926AE43
	for <lists+linux-omap@lfdr.de>; Tue, 15 Sep 2020 21:58:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727753AbgIOT5S (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 15 Sep 2020 15:57:18 -0400
Received: from mail-io1-f66.google.com ([209.85.166.66]:42503 "EHLO
        mail-io1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727848AbgIOT5C (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 15 Sep 2020 15:57:02 -0400
Received: by mail-io1-f66.google.com with SMTP id u6so5504931iow.9;
        Tue, 15 Sep 2020 12:57:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=fnB3WXd3CVX86l4oOXnRMqvub51IFEMuC66CQlN98to=;
        b=duOoMrsTrqJ98YOJnymyLnO1kKiwlXKsaVaC6/kvZeo3MohvZW0pUZoUWzWZt/x5yQ
         gyc6tROKGETI9/gzNamV/IUuvS4SragQzFnlLl6FImIGCf0R2IcpCP83uocesuocQ/Dm
         I/H8WbBs/LunHXSaBjSl/d0Gh2eCC02ZGzT8IFVRAB6cH5qDeJYbpCGW0k1ULSJGqoqS
         ybVKRfdQ3cF2lUWkMkO+6xQNo0MZrP0hFz0vAxSgKznR6XpEn4EhuMB/YiLKuehSqGe4
         A3gnuXKAKQy6COVIEGnxULh8gtYBV8KrlV4A7okHyu3RQ5r7iEag1H+r5djoOYlxUpR4
         PCJw==
X-Gm-Message-State: AOAM531fbrcaUYpKyPXgKuzlZ7wfB0a4cx1HGiJIwUTh+NRtGBkiw3Zg
        CWvvUu6bXAu6YyP1A6dThA==
X-Google-Smtp-Source: ABdhPJyXC7MAHBd+l614l66gdacLiXXbyiJ4NpMgA0JFmeY2XbfsqSS7arJJq3e+Rj2HINzyPMBI/w==
X-Received: by 2002:a05:6602:15c5:: with SMTP id f5mr15689559iow.42.1600199821359;
        Tue, 15 Sep 2020 12:57:01 -0700 (PDT)
Received: from xps15 ([64.188.179.253])
        by smtp.gmail.com with ESMTPSA id 64sm8345119iob.36.2020.09.15.12.56.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2020 12:57:00 -0700 (PDT)
Received: (nullmailer pid 2403540 invoked by uid 1000);
        Tue, 15 Sep 2020 19:56:56 -0000
Date:   Tue, 15 Sep 2020 13:56:56 -0600
From:   Rob Herring <robh@kernel.org>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Grygorii Strashko <grygorii.strashko@ti.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Joel Stanley <joel@jms.id.au>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
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
        Linux-OMAP <linux-omap@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-aspeed <linux-aspeed@lists.ozlabs.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH v2 01/15] dt-bindings: gpio: convert bindings for NXP
 PCA953x family to dtschema
Message-ID: <20200915195656.GB2385241@bogus>
References: <20200910175733.11046-1-krzk@kernel.org>
 <20200910175733.11046-2-krzk@kernel.org>
 <CACPK8XdocAX5mOXf3VP29cNXH+6unYunB9NiT3qFVKyzR6WXPg@mail.gmail.com>
 <CAJKOXPe6Tf0B5W27XaD5zLk77OBzGCHpirhTdZjFH0oh8GvWgg@mail.gmail.com>
 <c162b6ad-57f1-a75a-11e3-9c80c60bd845@ti.com>
 <CACRpkdbrrzkYVW13V89PJ5_WRGhxSL0rOxAHA_7hYSyw28Shvg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACRpkdbrrzkYVW13V89PJ5_WRGhxSL0rOxAHA_7hYSyw28Shvg@mail.gmail.com>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Sat, Sep 12, 2020 at 12:07:59PM +0200, Linus Walleij wrote:
> On Fri, Sep 11, 2020 at 11:54 AM Grygorii Strashko
> <grygorii.strashko@ti.com> wrote:
> 
> > More over, there is already generic schema for gpio hogs: gpio-hog.yaml
> 
> Where is this? I don't have it in my GPIO devel branch for sure, and
> it is not in linux-next either so not in Bartosz' tree.

https://github.com/devicetree-org/dt-schema/tree/master/schemas/gpio

> 
> I did suggest that I want a gpio-common.yaml file which includes the
> hogs.

Already there, but not wired together ATM.

> > Originally, gpio bindings were defined without restricting gpio hog node names and,
> > generic schema follows this.

Originally, almost all node names were a free-for-all even for classes 
defined 20 years ago. Now the names are getting enforced.

Rob
