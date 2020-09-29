Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 967DE27C8AB
	for <lists+linux-omap@lfdr.de>; Tue, 29 Sep 2020 14:03:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731689AbgI2MDp (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 29 Sep 2020 08:03:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42444 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731809AbgI2MDe (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 29 Sep 2020 08:03:34 -0400
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com [IPv6:2a00:1450:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 14B54C0613D0
        for <linux-omap@vger.kernel.org>; Tue, 29 Sep 2020 05:03:34 -0700 (PDT)
Received: by mail-ed1-x543.google.com with SMTP id j2so6028856eds.9
        for <linux-omap@vger.kernel.org>; Tue, 29 Sep 2020 05:03:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=60xpqL1mFMP5mTEXMd+Hf/JbwDeJfK2G/uC8t1br+6k=;
        b=U2ylC5Xqp6u8ik+qLLVYLPja9a6CNN7H2bkCEa//UctRW98qRrcJt5iSmfa7HlRGDa
         EDm/19NA602YOLiGzy8pur/PiSigZOnjiDFPDfp0wDQytj0AVKE9l1GJEsQDPHSaTpWN
         VKjV4VqmYPDpuUP8xoVz5EngrDU4Ndza9QesC6eHUD3jbdE7/xUMMFZhYMSOldDRFI3t
         ZdZxo51YFr3ToZQL3S3K4YVDbUkKbPpvyhMDBjwurhhpkVJ0dBbq+psxbbaZoqMRtKT+
         C5157f+z9w4veodAaTjN6EGUBR216cMGPBpMSLAghcRBokc8uH+foNEF+FhICHvyRD9T
         7rng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=60xpqL1mFMP5mTEXMd+Hf/JbwDeJfK2G/uC8t1br+6k=;
        b=Kz3TwxMm4ZcGuy17VFKy+KP9F50R9x1G5KpgMUK5hEbsBOmMYItKr5KJxwxkaudG05
         vwXXLG+b26e4E+59nzBv7dySIp6Wsp0kFo2td4PlY/wLwt6qndAc7WDTqeV4vC9afDDY
         t0so76ktI4xwM9/tX4eW5Nl/iwZM4RWHNs+DGGzTMEfVy+zPIVw4rXZYSFRocokaUlZv
         5VRv86KhIjmy1D35NMau+GHTetB8+arNU8M3SaGxIJemv75YeY/U0NjGFNu2YW+9t2DX
         PyJ67ufXZnb4EB6NA/twPhVqp5l7N8V8ejgJwf/LXyij1Zzi9QVsj4QwA5jJbwQcmXvv
         5j0w==
X-Gm-Message-State: AOAM532AFENQo1LGZzlhO9PmSwYhSVsuYQFDDYWy9XQJzqpgLKmkndva
        4rcYibDPoSUJ4E0IWZI2vhohlUyNvkUmrxCMLH9lbg==
X-Google-Smtp-Source: ABdhPJx9YWw+klvNRqJR45fFUSS6cO52gWk7vHm028tT+rGobO97VJryE+a83/bztKgnEOk/N/ouPUUF0IEqke5ZwL8=
X-Received: by 2002:a50:8e17:: with SMTP id 23mr2797118edw.42.1601381012666;
 Tue, 29 Sep 2020 05:03:32 -0700 (PDT)
MIME-Version: 1.0
References: <20200916155715.21009-1-krzk@kernel.org> <20200916155715.21009-2-krzk@kernel.org>
 <20200925154804.GB16392@kozik-lap>
In-Reply-To: <20200925154804.GB16392@kozik-lap>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 29 Sep 2020 14:03:21 +0200
Message-ID: <CACRpkdZ8Db+6yf6QG8kNgLBWFUzfogxu-CGjy-jYgXSR_sKoFA@mail.gmail.com>
Subject: Re: [PATCH v3 01/15] dt-bindings: gpio: convert bindings for NXP
 PCA953x family to dtschema
To:     Krzysztof Kozlowski <krzk@kernel.org>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        =?UTF-8?Q?Beno=C3=AEt_Cousson?= <bcousson@baylibre.com>,
        Tony Lindgren <tony@atomide.com>,
        Jason Cooper <jason@lakedaemon.net>,
        Andrew Lunn <andrew@lunn.ch>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@aj.id.au>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Tero Kristo <t-kristo@ti.com>, Nishanth Menon <nm@ti.com>,
        Michal Simek <michal.simek@xilinx.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
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
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Fri, Sep 25, 2020 at 5:48 PM Krzysztof Kozlowski <krzk@kernel.org> wrote:

> The first two patches (bindings) have Rob's ack/review. Could you pick
> them via GPIO tree?

Yup! Patches 1 & 2 applied to the GPIO tree.

Thanks for doing this schema work, much appreciated.

Yours,
Linus Walleij
