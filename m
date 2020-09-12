Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6A049267952
	for <lists+linux-omap@lfdr.de>; Sat, 12 Sep 2020 11:58:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725871AbgILJ6j (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sat, 12 Sep 2020 05:58:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36100 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725834AbgILJ6g (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sat, 12 Sep 2020 05:58:36 -0400
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com [IPv6:2a00:1450:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 275FBC0613ED
        for <linux-omap@vger.kernel.org>; Sat, 12 Sep 2020 02:58:34 -0700 (PDT)
Received: by mail-lf1-x142.google.com with SMTP id y11so8353617lfl.5
        for <linux-omap@vger.kernel.org>; Sat, 12 Sep 2020 02:58:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=qEROEvI5Y0fCmozE88h0a1g1Y25QBKKf6eIHwJfruhM=;
        b=bNkjodzgEyCHQlbMXE1deFOC+aEb+jZ/eg8pcskEb63rdUJ+ZCeEv0qADusqXyFQlc
         A11APrQ8MRSDsiGuWjfcWfUicTuhJdcfAwBCzSZF3AI2dko5bJJE/+P6P2RvpWhV/ZJW
         cfRKDxMcMAwi4jqwEY1QL3E8PLR7qOl6D3LhtSY1EQ6kna+PNpHDhnbZq7o1e4oNRtIS
         k1tXIBeWW3YzjbDT0D4KMDI1g6L5EVxNLSjlbe+aE1Qp3BB7uy1GKQ1k68s6iGK5THKQ
         hs3cS8rZn+V42ez4GUuUuM1DpR5Vs3XOaoHye7MswUQ7kohVMsfNhrpYFV4O+DHq4uKk
         M7KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qEROEvI5Y0fCmozE88h0a1g1Y25QBKKf6eIHwJfruhM=;
        b=UOtORh8s+qW6/UdaJZAkty0t7MJ+VFZQt9hxJbL/DAeZKLotFLQH+98gNUkwLobKk8
         gokcI4fLZ+znSc92N+P3xSeJnkvkoMZXlFZuikTxW9b6K0Y3kukbhMEP4W3tK91HDuUA
         C0DxFTTlBIsHBEA/XGJMBURgcF2BZWYThrsax0/03N1lMz+kRMd+J77Khq/EQPZXrIn6
         DqoUTounsINC2eMn19dE+eEc4bQoqbtApNzCm+PhHBPtnwwvrolEUPH0da9naoY8+rJ2
         ITbCshvMU09dOCXqFLGC1hyXFgW8g1bsNdyfRVFWR5iVq7eUeQKsSV8Hsnoa5gLnvM94
         8sXA==
X-Gm-Message-State: AOAM532xQZIIHlJg3cCCMZyIaDWtr5kbZoPyZOcobKiUyFEYvsZYoXfs
        4Pn3G2Fasd8yqJ6glel6dnrbmHscOqZOay6wY1xE2Q==
X-Google-Smtp-Source: ABdhPJz2DrvLqFno9Czac040PFbYE4v0es0Eq6+34Rf534KupzpDXiQZE1x4bI74fTkUy2VMuaKKZBCTxqQ4dSSRceI=
X-Received: by 2002:a19:520b:: with SMTP id m11mr1358539lfb.502.1599904713123;
 Sat, 12 Sep 2020 02:58:33 -0700 (PDT)
MIME-Version: 1.0
References: <20200910175733.11046-1-krzk@kernel.org> <20200910175733.11046-3-krzk@kernel.org>
In-Reply-To: <20200910175733.11046-3-krzk@kernel.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sat, 12 Sep 2020 11:58:22 +0200
Message-ID: <CACRpkdZXu2J4z=1j-syxSbz2x-QiLeTBpwHSOVNfmZ31RgM6Ng@mail.gmail.com>
Subject: Re: [PATCH v2 02/15] dt-bindings: gpio: convert bindings for Maxim
 MAX732x family to dtschema
To:     Krzysztof Kozlowski <krzk@kernel.org>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
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
Content-Type: text/plain; charset="UTF-8"
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Thu, Sep 10, 2020 at 7:58 PM Krzysztof Kozlowski <krzk@kernel.org> wrote:

> Convert the Maxim MAX732x family of GPIO expanders bindings to device
> tree schema by merging it with existing PCA95xx schema.  These are quite
> similar so merging reduces duplication.
>
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

Can I just apply this one patch to the GPIO tree?

Yours,
Linus Walleij
