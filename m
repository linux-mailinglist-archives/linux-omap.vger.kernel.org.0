Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E84B41A33EA
	for <lists+linux-omap@lfdr.de>; Thu,  9 Apr 2020 14:15:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726582AbgDIMPC (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 9 Apr 2020 08:15:02 -0400
Received: from mail-ed1-f68.google.com ([209.85.208.68]:46250 "EHLO
        mail-ed1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725971AbgDIMPC (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 9 Apr 2020 08:15:02 -0400
Received: by mail-ed1-f68.google.com with SMTP id dk4so1561741edb.13;
        Thu, 09 Apr 2020 05:15:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=gYvBs+A4oEEcIMW3rEpNzM655tFmA/5YHjSipVpMudE=;
        b=KNpAMrlizzkRUjdtArRcZnepHKNbBBN3N29ICe8f+8u6zOuwzgheP2XUgCe+44NkIR
         mQLi0LbDma0eJfXyOWBKcbI2n8ancJall5BX2XkJNVRNNTKMoc9a5b/UIpi2u5H8OdAL
         wApHdYZ1LSSr/6trI/dFG30x/Qyr6p7NIUqAv1DOYTzLuPrY0sPMLn94+uwoMPyEWaBW
         iVEgmf1Qbe3qa84zsIAGGS/pv73wUuLRlgOQEiKqf0CFJrzUUWOVeXsAEFJhh97kXPyr
         GZyGrCIrhxxiIcOrNhwBEE1X+Y+gwd4BQvdD7blpBMPJQIY5Zp2FVyy0J6fa9RShslsv
         euOw==
X-Gm-Message-State: AGi0PuZNdCjWjEQGXtYtDzyb1AFiyKSVK99JM7iY3Sjepioh9ROim5x1
        yUJDf1ERp7TF+bavcIpO8i0=
X-Google-Smtp-Source: APiQypJUJiiLoo3HAf51vgJTKYVBHwPZEVH7hjM1r+1VFWyM0ypQpU23tWpSatmkBm3yArwlL/zmtg==
X-Received: by 2002:a17:906:66c1:: with SMTP id k1mr11490807ejp.208.1586434500891;
        Thu, 09 Apr 2020 05:15:00 -0700 (PDT)
Received: from kozik-lap ([194.230.155.125])
        by smtp.googlemail.com with ESMTPSA id m1sm532752ejr.81.2020.04.09.05.14.58
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 09 Apr 2020 05:14:59 -0700 (PDT)
Date:   Thu, 9 Apr 2020 14:14:56 +0200
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Oleksandr Suvorov <oleksandr.suvorov@toradex.com>
Cc:     devicetree@vger.kernel.org, Paul Barker <pbarker@konsulko.com>,
        Marcel Ziswiler <marcel.ziswiler@toradex.com>,
        Igor Opaniuk <igor.opaniuk@toradex.com>,
        Philippe Schenker <philippe.schenker@toradex.com>,
        Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        =?utf-8?Q?Beno=C3=AEt?= Cousson <bcousson@baylibre.com>,
        Chen-Yu Tsai <wens@csie.org>,
        David Lechner <david@lechnology.com>,
        Fabio Estevam <festevam@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Heiko Stuebner <heiko@sntech.de>,
        Jisheng Zhang <Jisheng.Zhang@synaptics.com>,
        Kevin Hilman <khilman@baylibre.com>,
        Kukjin Kim <kgene@kernel.org>,
        Ludovic Desroches <ludovic.desroches@microchip.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Maxime Ripard <mripard@kernel.org>,
        NXP Linux Team <linux-imx@nxp.com>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Peter Rosin <peda@axentia.se>,
        Rob Herring <robh+dt@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Sekhar Nori <nsekhar@ti.com>, Shawn Guo <shawnguo@kernel.org>,
        Stefan Agner <stefan@agner.ch>,
        Tony Lindgren <tony@atomide.com>,
        linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-omap@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-rockchip@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
Subject: Re: [RFC PATCH v2 6/6] arm: dts: pwm: replace flag 0 with PWM_NOFLAGS
Message-ID: <20200409121456.GB802@kozik-lap>
References: <20200405192246.3741784-1-oleksandr.suvorov@toradex.com>
 <20200405192246.3741784-7-oleksandr.suvorov@toradex.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200405192246.3741784-7-oleksandr.suvorov@toradex.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Sun, Apr 05, 2020 at 10:22:46PM +0300, Oleksandr Suvorov wrote:
> The raw value '0' in the 3rd cell of the "pwms" property means there are
> no flags to be set.
> 
> This patch converts '0' value into PWM_NOFLAGS.
> 
> Signed-off-by: Oleksandr Suvorov <oleksandr.suvorov@toradex.com>
> ---
> 
> Changes in v2:
> - remove the driver part of patchset as dangerous and senseless.
> - use PWM_NOFLAGS instead of PWM_POLARITY_NORMAL to avoid possible
>   conflict with enum pwm_polarity in <linux/pwm.h>. Also, this name
>   reflects the sense of this value more precisely.
> 
>  arch/arm/boot/dts/am335x-cm-t335.dts               | 2 +-
>  arch/arm/boot/dts/am335x-evm.dts                   | 2 +-
>  arch/arm/boot/dts/am3517-evm.dts                   | 2 +-
>  arch/arm/boot/dts/at91-dvk_su60_somc_lcm.dtsi      | 2 +-
>  arch/arm/boot/dts/at91-kizbox2-common.dtsi         | 6 +++---
>  arch/arm/boot/dts/at91-kizbox3_common.dtsi         | 8 ++++----
>  arch/arm/boot/dts/at91-kizboxmini-common.dtsi      | 6 +++---
>  arch/arm/boot/dts/at91-nattis-2-natte-2.dts        | 2 +-
>  arch/arm/boot/dts/at91-sama5d4_ma5d4evk.dts        | 2 +-
>  arch/arm/boot/dts/at91sam9n12ek.dts                | 2 +-
>  arch/arm/boot/dts/at91sam9x5dm.dtsi                | 2 +-
>  arch/arm/boot/dts/berlin2cd-google-chromecast.dts  | 4 ++--
>  arch/arm/boot/dts/da850-evm.dts                    | 2 +-
>  arch/arm/boot/dts/da850-lego-ev3.dts               | 4 ++--
>  arch/arm/boot/dts/exynos4412-midas.dtsi            | 2 +-
>  arch/arm/boot/dts/exynos4412-odroidu3.dts          | 2 +-
>  arch/arm/boot/dts/exynos5250-snow-common.dtsi      | 2 +-
>  arch/arm/boot/dts/exynos5410-odroidxu.dts          | 2 +-
>  arch/arm/boot/dts/exynos5420-peach-pit.dts         | 2 +-
>  arch/arm/boot/dts/exynos5422-odroidhc1.dts         | 2 +-
>  arch/arm/boot/dts/exynos5422-odroidxu3-common.dtsi | 2 +-
>  arch/arm/boot/dts/exynos5422-odroidxu4.dts         | 2 +-
>  arch/arm/boot/dts/exynos54xx-odroidxu-leds.dtsi    | 4 ++--
>  arch/arm/boot/dts/exynos5800-peach-pi.dts          | 2 +-
>  arch/arm/boot/dts/imx53-tx53-x13x.dts              | 5 +++--
>  arch/arm/boot/dts/imx6dl-tx6dl-comtft.dts          | 2 +-
>  arch/arm/boot/dts/imx6q-display5.dtsi              | 2 +-
>  arch/arm/boot/dts/imx6q-tx6q-1010-comtft.dts       | 2 +-
>  arch/arm/boot/dts/imx6q-tx6q-1020-comtft.dts       | 2 +-
>  arch/arm/boot/dts/imx6qdl-tx6-lvds.dtsi            | 4 ++--
>  arch/arm/boot/dts/imx7-colibri.dtsi                | 4 +++-
>  arch/arm/boot/dts/imx7d-nitrogen7.dts              | 3 ++-
>  arch/arm/boot/dts/imx7d-pico.dtsi                  | 3 ++-
>  arch/arm/boot/dts/imx7d-sdb.dts                    | 3 ++-
>  arch/arm/boot/dts/imx7ulp-evk.dts                  | 3 ++-
>  arch/arm/boot/dts/iwg20d-q7-common.dtsi            | 2 +-
>  arch/arm/boot/dts/logicpd-torpedo-baseboard.dtsi   | 2 +-
>  arch/arm/boot/dts/meson8b-ec100.dts                | 4 ++--
>  arch/arm/boot/dts/meson8b-mxq.dts                  | 4 ++--
>  arch/arm/boot/dts/meson8b-odroidc1.dts             | 4 ++--
>  arch/arm/boot/dts/motorola-mapphone-common.dtsi    | 3 ++-
>  arch/arm/boot/dts/omap3-gta04.dtsi                 | 2 +-
>  arch/arm/boot/dts/omap3-n900.dts                   | 2 +-
>  arch/arm/boot/dts/rk3288-veyron-edp.dtsi           | 2 +-
>  arch/arm/boot/dts/rk3288-veyron.dtsi               | 2 +-
>  arch/arm/boot/dts/rv1108-evb.dts                   | 2 +-
>  arch/arm/boot/dts/s3c6410-mini6410.dts             | 2 +-
>  arch/arm/boot/dts/s5pv210-aries.dtsi               | 2 +-
>  arch/arm/boot/dts/s5pv210-smdkv210.dts             | 2 +-


I understand you are going to push it through arm-soc, so:
For Exynos/S3C/S5P:
Acked-by: Krzysztof Kozlowski <krzk@kernel.org>

Otherwise if you expect individual maintainers to pick it up, please
split per architecture.

Best regards,
Krzysztof
