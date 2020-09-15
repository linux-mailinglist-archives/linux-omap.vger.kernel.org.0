Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7825D26AE6E
	for <lists+linux-omap@lfdr.de>; Tue, 15 Sep 2020 22:08:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727796AbgIOUIR (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 15 Sep 2020 16:08:17 -0400
Received: from mail-io1-f68.google.com ([209.85.166.68]:40714 "EHLO
        mail-io1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727848AbgIOUFG (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 15 Sep 2020 16:05:06 -0400
Received: by mail-io1-f68.google.com with SMTP id j2so5542115ioj.7;
        Tue, 15 Sep 2020 13:04:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=w5YpoxfTyrzce47e7+bq2Lzj+yxd8SjgCIV6N4Js4ic=;
        b=Ev1/wfsnxSh6KpJVlRePNv0TVoLaqRNIIfNlICJxCsNjP3ourtt92cBzMfd21WeSIg
         yMnTBV+bgVp/vWBVYLDHadGHjxFYZJFf5xX9VfRk34PAGyuPrd2i9IgXyzY2DgNUe6W1
         qwo5SkS6M87LzbAAhk1/nqHQoLVgkDFyOPl3zqPdpR07dNGegrPVzEyMkv4e97BKre7s
         7QlyJMxvHQCp41ND5U95UD6M2hKVqsXosdrPUdniskjhkCoPqWqyknutiZDsA3t9sf2J
         sL8Gyq4kGMBag62AOwyxyXQmmW72RxOOA3WswFMfBgeZmW0OYUroiBbj3GlqoP1JDqD7
         dMpg==
X-Gm-Message-State: AOAM531rrxHIcCbbh1+uFWCDRVFkLVhXAxRp7xltkpBpQ5sQljDk5MkU
        6MawgSmPBSevl0YSJD8w0ksV9Vn3UrLehX0=
X-Google-Smtp-Source: ABdhPJyysbHV/o3l7AFAopcgw0STvpK5TyfVIMhU4B3slSiPLWgiIgY4LBEjD+PF3te9Q+sWVDfzSA==
X-Received: by 2002:a05:6e02:d07:: with SMTP id g7mr12751974ilj.63.1600199989032;
        Tue, 15 Sep 2020 12:59:49 -0700 (PDT)
Received: from xps15 ([64.188.179.253])
        by smtp.gmail.com with ESMTPSA id q23sm8155081iob.19.2020.09.15.12.59.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2020 12:59:48 -0700 (PDT)
Received: (nullmailer pid 2407937 invoked by uid 1000);
        Tue, 15 Sep 2020 19:59:45 -0000
Date:   Tue, 15 Sep 2020 13:59:45 -0600
From:   Rob Herring <robh@kernel.org>
To:     Krzysztof Kozlowski <krzk@kernel.org>
Cc:     Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Tony Lindgren <tony@atomide.com>, linux-kernel@vger.kernel.org,
        Nishanth Menon <nm@ti.com>, Joel Stanley <joel@jms.id.au>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-omap@vger.kernel.org, Shawn Guo <shawnguo@kernel.org>,
        Jason Cooper <jason@lakedaemon.net>,
        Tero Kristo <t-kristo@ti.com>,
        linux-arm-kernel@lists.infradead.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org,
        =?UTF-8?Q?Beno=C3=AEt_Cousson?= <bcousson@baylibre.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        linux-mediatek@lists.infradead.org,
        Guenter Roeck <linux@roeck-us.net>,
        Andrew Jeffery <andrew@aj.id.au>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andrew Lunn <andrew@lunn.ch>, linux-aspeed@lists.ozlabs.org,
        Gregory Clement <gregory.clement@bootlin.com>,
        Michal Simek <michal.simek@xilinx.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Russell King <linux@armlinux.org.uk>
Subject: Re: [PATCH v2 01/15] dt-bindings: gpio: convert bindings for NXP
 PCA953x family to dtschema
Message-ID: <20200915195945.GA2407885@bogus>
References: <20200910175733.11046-1-krzk@kernel.org>
 <20200910175733.11046-2-krzk@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200910175733.11046-2-krzk@kernel.org>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Thu, 10 Sep 2020 19:57:19 +0200, Krzysztof Kozlowski wrote:
> Convert the NXP PCA953x family of GPIO expanders bindings to device tree
> schema.
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> 
> ---
> 
> Changes since v1:
> 1. Use additionalProperties.
> 2. Add wakeup-source.
> 3. Add hogs.
> 4. Extend example with hogs.
> ---
>  .../devicetree/bindings/gpio/gpio-pca953x.txt |  90 ----------
>  .../bindings/gpio/gpio-pca95xx.yaml           | 166 ++++++++++++++++++
>  .../devicetree/bindings/trivial-devices.yaml  |   4 -
>  3 files changed, 166 insertions(+), 94 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/gpio/gpio-pca953x.txt
>  create mode 100644 Documentation/devicetree/bindings/gpio/gpio-pca95xx.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
