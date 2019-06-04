Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DACBB340DE
	for <lists+linux-omap@lfdr.de>; Tue,  4 Jun 2019 09:57:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726805AbfFDH5l (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 4 Jun 2019 03:57:41 -0400
Received: from mail-lf1-f65.google.com ([209.85.167.65]:34216 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726711AbfFDH5l (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 4 Jun 2019 03:57:41 -0400
Received: by mail-lf1-f65.google.com with SMTP id y198so5201474lfa.1;
        Tue, 04 Jun 2019 00:57:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=KyJePs3XnLfOX3cvCnsFt2DsH4jTLKDr7Nu7LZwNhEw=;
        b=RF4o00ZcvtgY5FArPIxTsy0Se/+PkpFENrihklcFGxUu0uRAZJmHCJiJOcmfvNcivY
         fWNwSoXzQ/C2OS0yqs/pqgnq0K3jRH9Eg6Gze9K5HqKsoLWherkaZmlpKCIrVlFeO/MJ
         RQZwfImGay0JpfbpTTPhgvGWpzPHXvUuT9+lH6fVQ3sOYpst94T0Ha3RxRjZnm34OkWN
         yDcptTOJ/c829XVrvcog6Vpj5abA0ONV8nYZbdBFFjjtfMMQoAMwvN25bvYXxPkoue0k
         eMXNlASNwFUejXFw3M07BzuUwm26TKVLDrewQLxU55mwrNzlr97oms8GJsdx5/LDlzcV
         eMfw==
X-Gm-Message-State: APjAAAXzA5z4ztY+MVBLa6iiJx0HBaMtFI4LS4QrV52kIfleyoKS+sl2
        2m7kLJghGBICN76u8x2GfHY6AdjnB9IdIbnICK8=
X-Google-Smtp-Source: APXvYqyZ1Y2BgRT07oWRCciUH//Gkp+j+D39P1c/BSfl+S9xfiOfkzKOZIBXZiSvjWyNUt5EWy6PY1aO97kA/vXC9Yc=
X-Received: by 2002:ac2:5a04:: with SMTP id q4mr15868697lfn.90.1559635059383;
 Tue, 04 Jun 2019 00:57:39 -0700 (PDT)
MIME-Version: 1.0
References: <1559634833-19980-1-git-send-email-krzk@kernel.org>
In-Reply-To: <1559634833-19980-1-git-send-email-krzk@kernel.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 4 Jun 2019 09:57:27 +0200
Message-ID: <CAMuHMdV0RNdB3_n7J0FWfhUTvzq4390HVsuzxXhexZ_zX-+nvg@mail.gmail.com>
Subject: Re: [PATCH] ARM: configs: Remove useless UEVENT_HELPER_PATH
To:     Krzysztof Kozlowski <krzk@kernel.org>
Cc:     arm-soc <arm@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Olof Johansson <olof@lixom.net>,
        Russell King <linux@armlinux.org.uk>,
        Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@aj.id.au>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Ludovic Desroches <ludovic.desroches@microchip.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Vladimir Zapolskiy <vz@mleia.com>,
        Sylvain Lemieux <slemieux.tyco@gmail.com>,
        Jason Cooper <jason@lakedaemon.net>,
        Andrew Lunn <andrew@lunn.ch>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Aaro Koskinen <aaro.koskinen@iki.fi>,
        Tony Lindgren <tony@atomide.com>,
        Dinh Nguyen <dinguyen@kernel.org>,
        Marc Gonzalez <marc.w.gonzalez@free.fr>,
        Mans Rullgard <mans@mansr.com>,
        Liviu Dudau <liviu.dudau@arm.com>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-aspeed@lists.ozlabs.org,
        "open list:TI ETHERNET SWITCH DRIVER (CPSW)" 
        <linux-omap@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Tue, Jun 4, 2019 at 9:54 AM Krzysztof Kozlowski <krzk@kernel.org> wrote:
> Remove the CONFIG_UEVENT_HELPER_PATH because:
> 1. It is disabled since commit 1be01d4a5714 ("driver: base: Disable
>    CONFIG_UEVENT_HELPER by default") as its dependency (UEVENT_HELPER) was
>    made default to 'n',
> 2. It is not recommended (help message: "This should not be used today
>    [...] creates a high system load") and was kept only for ancient
>    userland,
> 3. Certain userland specifically requests it to be disabled (systemd
>    README: "Legacy hotplug slows down the system and confuses udev").
>
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

Acked-by: Geert Uytterhoeven <geert+renesas@glider.be>

>  arch/arm/configs/proceq_vf_bck_defconfig  | 255 +++++++++++++++++++++++++++
>  arch/arm/configs/proceq_vf_crc_defconfig  | 278 ++++++++++++++++++++++++++++++

These look like unrelated changes? Please drop.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
