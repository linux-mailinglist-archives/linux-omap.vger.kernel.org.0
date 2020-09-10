Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 61224264C24
	for <lists+linux-omap@lfdr.de>; Thu, 10 Sep 2020 20:02:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726287AbgIJSC0 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 10 Sep 2020 14:02:26 -0400
Received: from mail-ej1-f65.google.com ([209.85.218.65]:33007 "EHLO
        mail-ej1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726728AbgIJSBm (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 10 Sep 2020 14:01:42 -0400
Received: by mail-ej1-f65.google.com with SMTP id j11so10113674ejk.0;
        Thu, 10 Sep 2020 11:01:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=vzlILYYSQksxsWvenp+0BQ/ZzGG+3vsuxeefhQwKuys=;
        b=mwTzLPsoHkTZHv7eITzwGJGiLpcSM9a0eSAiXuJS0Pkbr8WAQm6yt5JR1TK/HanrZF
         blUI7hI/ATdAwNbw/jVLBIwryzQijskvDIEy5CYtIQ7SdrUj2i6Lp3y/YeQgz2ysX3T+
         XiPuF5PnN0WdLmACkie6BDqDAxY6uluk8d2FzNbx7D5qK0pHbcy5xmlXTjdiZl1uRAfv
         oSDf1Yj0+R7Qf/+41FGSHtkNPkrncvOciByv/PRg4dQ9qpdNcfL02e6GS53looXZE9GE
         b6l0JhxxlxSeALw2PbZ5JnDmKJFTSR/V+TU5y/hkzAk0IXFe/IDH21V9R3fkX0pAg/9J
         t9kQ==
X-Gm-Message-State: AOAM531DM/OBR9DpuVNXvd2Abg7Nf0u5QzTFnjjtF6+HoTAycDPP0kQD
        aizNvnSMAF3ZSA+pZwbS6aI=
X-Google-Smtp-Source: ABdhPJwT6JbyXfUrGZCRSOFBx+boMTdYFSDTFrULKEN0eqYHOZ15ua7zgfpIH84oBBIKMt8Sze2wOQ==
X-Received: by 2002:a17:906:a4b:: with SMTP id x11mr10673914ejf.368.1599760899958;
        Thu, 10 Sep 2020 11:01:39 -0700 (PDT)
Received: from kozik-lap ([194.230.155.174])
        by smtp.googlemail.com with ESMTPSA id 1sm7839797ejn.50.2020.09.10.11.01.37
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 10 Sep 2020 11:01:38 -0700 (PDT)
Date:   Thu, 10 Sep 2020 20:01:35 +0200
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
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
        Guenter Roeck <linux@roeck-us.net>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-aspeed@lists.ozlabs.org, linux-mediatek@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 08/15] ARM: dts: am335x: lxm: fix PCA9539 GPIO
 expander properties
Message-ID: <20200910180135.GA11154@kozik-lap>
References: <20200910175733.11046-1-krzk@kernel.org>
 <20200910175733.11046-9-krzk@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200910175733.11046-9-krzk@kernel.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Thu, Sep 10, 2020 at 07:57:26PM +0200, Krzysztof Kozlowski wrote:
> The PCA9539 GPIO expander requires GPIO controller properties to operate
> properly.
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

I forgot to add here Ack from v1:
Acked-by: Tony Lindgren <tony@atomide.com>

Tony,

I think it should go through sub-architecture maintainers, not as entire
series.

Best regards,
Krzysztof

