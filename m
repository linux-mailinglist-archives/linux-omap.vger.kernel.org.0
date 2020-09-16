Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1279926C7E8
	for <lists+linux-omap@lfdr.de>; Wed, 16 Sep 2020 20:36:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728089AbgIPSgN (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 16 Sep 2020 14:36:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42154 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728079AbgIPS3N (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 16 Sep 2020 14:29:13 -0400
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 13DC0C0A8938;
        Wed, 16 Sep 2020 06:07:25 -0700 (PDT)
Received: by mail-wm1-x343.google.com with SMTP id w2so2725651wmi.1;
        Wed, 16 Sep 2020 06:07:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=wXAbzU7xs3GHOx4VbALatUig0WdQIdhicYVb4LS021Q=;
        b=HkQLLmAJhe1yxNGBO1sfG4gpKaDhSTi5NwsXdTXpKIBovg3XuA3g6/xN3j70bITbU4
         QxjVP0nBEk9CQMbCYGT+u/aBsOGp5zfyrVXQx7I89bg4wEANFhrCw2dfiGY/E052yt3I
         hP2dHzR39YBwGEPHXfXDepc1lPBLt8iuRW+waPSVRhgqd08ZYSdBtKYU5hACthSGW/4X
         lkoZ0zEcqC20TM9vkle2lW8Zij/nvQodlaTf0X61PLM17lVyPxfo9A+nTDUntHYXMiQA
         VeEvEmry8SX0PdlBRMVdFFgaISOKNdZl/qrv/3NQn0kQqNn/cIq+zwt4Zt7UkozUmRcL
         +bKw==
X-Gm-Message-State: AOAM532tlUdVMXhLtggnAgtO1EC2QqIDJh6TroQwMcyWXZ9LVX+bUHD/
        xfVKnUptdkYVmg80LcqyPhbJgJmCVmcXkUoZ
X-Google-Smtp-Source: ABdhPJz6nAcPpzE0Afvi4kc8Wd3d/N2pmOcJi2+gV9N28HTCz/M5xCuuIuDYCxyhmfn+uomSVR6/sQ==
X-Received: by 2002:a1c:152:: with SMTP id 79mr4146687wmb.90.1600254559712;
        Wed, 16 Sep 2020 04:09:19 -0700 (PDT)
Received: from kozik-lap ([194.230.155.191])
        by smtp.googlemail.com with ESMTPSA id n2sm4944652wma.29.2020.09.16.04.09.16
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 16 Sep 2020 04:09:18 -0700 (PDT)
Date:   Wed, 16 Sep 2020 13:09:15 +0200
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
Message-ID: <20200916110915.GA17710@kozik-lap>
References: <20200910175733.11046-1-krzk@kernel.org>
 <20200910175733.11046-3-krzk@kernel.org>
 <CACRpkdZXu2J4z=1j-syxSbz2x-QiLeTBpwHSOVNfmZ31RgM6Ng@mail.gmail.com>
 <20200916061511.GA5719@kozik-lap>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200916061511.GA5719@kozik-lap>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Wed, Sep 16, 2020 at 08:15:11AM +0200, Krzysztof Kozlowski wrote:
> On Sat, Sep 12, 2020 at 11:58:22AM +0200, Linus Walleij wrote:
> > On Thu, Sep 10, 2020 at 7:58 PM Krzysztof Kozlowski <krzk@kernel.org> wrote:
> > 
> > > Convert the Maxim MAX732x family of GPIO expanders bindings to device
> > > tree schema by merging it with existing PCA95xx schema.  These are quite
> > > similar so merging reduces duplication.
> > >
> > > Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> > 
> > Can I just apply this one patch to the GPIO tree?
> 
> No, this requires the previous one (1/15) because it merges the max732x
> into pca95xx.
> 
> Although now Rob reviewed both so you can pick them up.

I found now one comment from Rob so I will send a v3.

Best regards,
Krzysztof

