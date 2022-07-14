Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D901C57453A
	for <lists+linux-omap@lfdr.de>; Thu, 14 Jul 2022 08:45:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231311AbiGNGp0 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 14 Jul 2022 02:45:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59198 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229455AbiGNGpZ (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 14 Jul 2022 02:45:25 -0400
Received: from mail-yb1-xb31.google.com (mail-yb1-xb31.google.com [IPv6:2607:f8b0:4864:20::b31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A65622515
        for <linux-omap@vger.kernel.org>; Wed, 13 Jul 2022 23:45:24 -0700 (PDT)
Received: by mail-yb1-xb31.google.com with SMTP id i206so1659436ybc.5
        for <linux-omap@vger.kernel.org>; Wed, 13 Jul 2022 23:45:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=sa394u24lXvY23y95+1G8hmxWS5GPwHAwvbyINalFkY=;
        b=Vd0H0VyK7uwZhLxOrobcO6JXHUV22/ypqiaXzdxidhMVI8iFAUoyuCMmpQXvncy5cq
         SsUDv7nXvkwXO/0szKZWPL0rcW0YVmHqTb33HBU97nAnuCZH0iL4d42f0rmVzUt3AbwK
         ZPffgswahBcC3X+vE6elRUAkVBdHWiZwqZ0qv5HQOYGyC1Ed04fbAOUXD4P/uGmA/ATs
         ckoRp2UCO5mqt0SUZMARSXWUi7FU+sTS1QOPuwgyp4KWDmcP+XQjCrfkEyZbOiph+LZF
         1I3k3ad7vcRa2VXkM7gVk+S6ydXBab80mpRIOe9i2di+l+h+RYXCYOPMQv03vLk/TbJ+
         iInQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=sa394u24lXvY23y95+1G8hmxWS5GPwHAwvbyINalFkY=;
        b=y6pERjbRXLVHWXgweSCu/kW7Sbl88vhiyOXFJDZwI/O1V29HkjkKnk46mT/5mNdP3k
         ILbRFAFFuFgZ0SUQjp+a3lTxNLHOT5FbZaCYfv0JesXprdPgHouzmjzsFV3hBSgaim7b
         V6/3rsZQswO7tpheKUBdr043REJXiQ+9Q8lJMwDXc2AGLd29vLuSXBLCA+3poEq1Pioq
         o2jdQT7qaHJjsb+hUrG6tj0Sm4X9oYSPQBoVlOFlp4jJ1MVK414Wp2HZotWqgcH+lfa2
         ROcREyKT1S+Rfj1y8n5WCoGcowLk6be9DC4m9Ck8Ghr/JJqTxsgxfYBgSlc/WDZZC8Nx
         8oPQ==
X-Gm-Message-State: AJIora+x5gMKCGTr/Vrbt/pTPPGDVMWRqhbfvH6EIw3u1O4/HSnWnhzZ
        04UuiPR2K4ADuGbl1T7YYdrJKa82oIj2RhrA0vZgHF5X
X-Google-Smtp-Source: AGRyM1stkUyZIiTsZjYFPSzBORJFE9kAdeeJx2LHrWMQQPhdp3yn6fO3HPL3S+WV3atoykYKcj3+OVPTvDxpCoMwoVQ=
X-Received: by 2002:a25:71c4:0:b0:66f:95ff:b30 with SMTP id
 m187-20020a2571c4000000b0066f95ff0b30mr6785852ybc.63.1657781123440; Wed, 13
 Jul 2022 23:45:23 -0700 (PDT)
MIME-Version: 1.0
References: <20220712071647.21551-1-yegorslists@googlemail.com>
In-Reply-To: <20220712071647.21551-1-yegorslists@googlemail.com>
From:   Yegor Yefremov <yegorslists@googlemail.com>
Date:   Thu, 14 Jul 2022 08:45:12 +0200
Message-ID: <CAGm1_ksVSB-9EeY-JxvY2VeYqPM+5YtGOTcu6aHWE7rN7CUvYQ@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: am335x-baltos: add GPIO names for ir3220 and
 ir5221 devices
To:     Linux-OMAP <linux-omap@vger.kernel.org>
Cc:     Tony Lindgren <tony@atomide.com>, Rob Herring <robh+dt@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        UPPERCASE_50_75 autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Tony,

On Tue, Jul 12, 2022 at 9:16 AM <yegorslists@googlemail.com> wrote:
>
> From: Yegor Yefremov <yegorslists@googlemail.com>
>
> Add GPIO names for both SoC and TCA6416 lines.
>
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
> ---
>  arch/arm/boot/dts/am335x-baltos-ir3220.dts | 148 +++++++++++++++++++++
>  arch/arm/boot/dts/am335x-baltos-ir5221.dts | 148 +++++++++++++++++++++
>  2 files changed, 296 insertions(+)
>
> diff --git a/arch/arm/boot/dts/am335x-baltos-ir3220.dts b/arch/arm/boot/dts/am335x-baltos-ir3220.dts
> index 2123bd589484..ca31733f90b1 100644
> --- a/arch/arm/boot/dts/am335x-baltos-ir3220.dts
> +++ b/arch/arm/boot/dts/am335x-baltos-ir3220.dts
> @@ -91,6 +91,10 @@
>                 interrupts = <20 IRQ_TYPE_EDGE_RISING>;
>                 pinctrl-names = "default";
>                 pinctrl-0 = <&tca6416_pins>;
> +               gpio-line-names = "GP_IN0", "GP_IN1", "GP_IN2", "GP_IN3",
> +                                 "GP_OUT0", "GP_OUT1", "GP_OUT2", "GP_OUT3",
> +                                 "ModeA0", "ModeA1", "ModeA2", "ModeA3",
> +                                 "ModeB0", "ModeB1", "ModeB2", "ModeB3";
>         };
>  };
>
> @@ -123,3 +127,147 @@
>         pinctrl-0 = <&mmc1_pins>;
>         cd-gpios = <&gpio2 18 GPIO_ACTIVE_LOW>;
>  };
> +
> +&gpio0 {
> +       gpio-line-names =
> +               "MDIO",
> +               "MDC",
> +               "UART2_RX",
> +               "UART2_TX",
> +               "I2C1_SDA",
> +               "I2C1_SCL",
> +               "WLAN_BTN",
> +               "W_DISABLE",
> +               "NC",
> +               "NC",
> +               "NC",
> +               "NC",
> +               "I2C2_SDA",
> +               "I2C2_SCL",
> +               "UART1_RX",
> +               "UART1_TX",
> +               "onrisc:blue:wlan",
> +               "onrisc:green:app",
> +               "USB0_DRVVBUS",
> +               "ETH2_INT",
> +               "TCA6416_INT",
> +               "RMII1_TXD1",
> +               "MMC1_DAT0",
> +               "MMC1_DAT1",
> +               "NC",
> +               "NC",
> +               "MMC1_DAT2",
> +               "MMC1_DAT3",
> +               "RMII1_TXD0",
> +               "NC",
> +               "GPMC_WAIT0",
> +               "GPMC_WP_N";
> +};
> +
> +&gpio1 {
> +       gpio-line-names =
> +               "GPMC_AD0",
> +               "GPMC_AD1",
> +               "GPMC_AD2",
> +               "GPMC_AD3",
> +               "GPMC_AD4",
> +               "GPMC_AD5",
> +               "GPMC_AD6",
> +               "GPMC_AD7",
> +               "NC",
> +               "NC",
> +               "CONSOLE_RX",
> +               "CONSOLE_TX",
> +               "UART2_DTR",
> +               "UART2_DSR",
> +               "UART2_DCD",
> +               "UART2_RI",
> +               "RGMII2_TCTL",
> +               "RGMII2_RCTL",
> +               "RGMII2_TD3",
> +               "RGMII2_TD2",
> +               "RGMII2_TD1",
> +               "RGMII2_TD0",
> +               "RGMII2_TCLK",
> +               "RGMII2_RCLK",
> +               "RGMII2_RD3",
> +               "RGMII2_RD2",
> +               "RGMII2_RD1",
> +               "RGMII2_RD0",
> +               "PMIC_INT1",
> +               "GPMC_CSN0_Flash",
> +               "MMC1_CLK",
> +               "MMC1_CMD";
> +};
> +
> +&gpio2 {
> +       gpio-line-names =
> +               "GPMC_CSN3_BUS",
> +               "GPMC_CLK",
> +               "GPMC_ADVN_ALE",
> +               "GPMC_OEN_RE_N",
> +               "GPMC_WE_N",
> +               "GPMC_BEN0_CLE",
> +               "NC",
> +               "NC",
> +               "NC",
> +               "NC",
> +               "NC",
> +               "NC",
> +               "NC",
> +               "NC",
> +               "NC",
> +               "NC",
> +               "NC",
> +               "NC",
> +               "SD_CD",
> +               "SD_WP",
> +               "RMII1_RXD1",
> +               "RMII1_RXD0",
> +               "NC",
> +               "NC",
> +               "NC",
> +               "NC",
> +               "MMC0_DAT3",
> +               "MMC0_DAT2",
> +               "MMC0_DAT1",
> +               "MMC0_DAT0",
> +               "MMC0_CLK",
> +               "MMC0_CMD";
> +};
> +
> +&gpio3 {
> +       gpio-line-names =
> +               "onrisc:red:power",
> +               "RMII1_CRS_DV",
> +               "RMII1_RXER",
> +               "RMII1_TXEN",
> +               "3G_PWR_EN",
> +               "UART2_CTSN",
> +               "UART2_RTSN",
> +               "WLAN_IRQ",
> +               "WLAN_EN",
> +               "NC",
> +               "NC",
> +               "NC",
> +               "NC",
> +               "USB1_DRVVBUS",
> +               "NC",
> +               "NC",
> +               "NC",
> +               "NC",
> +               "NC",
> +               "NC",
> +               "NC",
> +               "NC",
> +               "NC",
> +               "NC",
> +               "NC",
> +               "NC",
> +               "NC",
> +               "NC",
> +               "NC",
> +               "NC",
> +               "NC",
> +               "NC";
> +};
> diff --git a/arch/arm/boot/dts/am335x-baltos-ir5221.dts b/arch/arm/boot/dts/am335x-baltos-ir5221.dts
> index 2f3872dbf4f4..950a07fc5a70 100644
> --- a/arch/arm/boot/dts/am335x-baltos-ir5221.dts
> +++ b/arch/arm/boot/dts/am335x-baltos-ir5221.dts
> @@ -99,6 +99,10 @@
>                 interrupts = <20 IRQ_TYPE_EDGE_RISING>;
>                 pinctrl-names = "default";
>                 pinctrl-0 = <&tca6416_pins>;
> +               gpio-line-names = "GP_IN0", "GP_IN1", "GP_IN2", "GP_IN3",
> +                                 "GP_OUT0", "GP_OUT1", "GP_OUT2", "GP_OUT3",
> +                                 "ModeA0", "ModeA1", "ModeA2", "ModeA3",
> +                                 "ModeB0", "ModeB1", "ModeB2", "ModeB3";
>         };
>  };
>
> @@ -147,3 +151,147 @@
>         pinctrl-0 = <&mmc1_pins>;
>         cd-gpios = <&gpio2 18 GPIO_ACTIVE_LOW>;
>  };
> +
> +&gpio0 {
> +       gpio-line-names =
> +               "MDIO",
> +               "MDC",
> +               "UART2_RX",
> +               "UART2_TX",
> +               "I2C1_SDA",
> +               "I2C1_SCL",
> +               "WLAN_BTN",
> +               "W_DISABLE",
> +               "NC",
> +               "NC",
> +               "NC",
> +               "NC",
> +               "I2C2_SDA",
> +               "I2C2_SCL",
> +               "UART1_RX",
> +               "UART1_TX",
> +               "onrisc:blue:wlan",
> +               "onrisc:green:app",
> +               "USB0_DRVVBUS",
> +               "ETH2_INT",
> +               "TCA6416_INT",
> +               "RMII1_TXD1",
> +               "MMC1_DAT0",
> +               "MMC1_DAT1",
> +               "NC",
> +               "NC",
> +               "MMC1_DAT2",
> +               "MMC1_DAT3",
> +               "RMII1_TXD0",
> +               "NC",
> +               "GPMC_WAIT0",
> +               "GPMC_WP_N";
> +};
> +
> +&gpio1 {
> +       gpio-line-names =
> +               "GPMC_AD0",
> +               "GPMC_AD1",
> +               "GPMC_AD2",
> +               "GPMC_AD3",
> +               "GPMC_AD4",
> +               "GPMC_AD5",
> +               "GPMC_AD6",
> +               "GPMC_AD7",
> +               "DCAN1_TX",
> +               "DCAN1_RX",
> +               "CONSOLE_RX",
> +               "CONSOLE_TX",
> +               "UART2_DTR",
> +               "UART2_DSR",
> +               "UART2_DCD",
> +               "UART2_RI",
> +               "RGMII2_TCTL",
> +               "RGMII2_RCTL",
> +               "RGMII2_TD3",
> +               "RGMII2_TD2",
> +               "RGMII2_TD1",
> +               "RGMII2_TD0",
> +               "RGMII2_TCLK",
> +               "RGMII2_RCLK",
> +               "RGMII2_RD3",
> +               "RGMII2_RD2",
> +               "RGMII2_RD1",
> +               "RGMII2_RD0",
> +               "PMIC_INT1",
> +               "GPMC_CSN0_Flash",
> +               "MMC1_CLK",
> +               "MMC1_CMD";
> +};
> +
> +&gpio2 {
> +       gpio-line-names =
> +               "GPMC_CSN3_BUS",
> +               "GPMC_CLK",
> +               "GPMC_ADVN_ALE",
> +               "GPMC_OEN_RE_N",
> +               "GPMC_WE_N",
> +               "GPMC_BEN0_CLE",
> +               "NC",
> +               "NC",
> +               "NC",
> +               "NC",
> +               "NC",
> +               "NC",
> +               "NC",
> +               "NC",
> +               "NC",
> +               "NC",
> +               "NC",
> +               "NC",
> +               "SD_CD",
> +               "SD_WP",
> +               "RMII1_RXD1",
> +               "RMII1_RXD0",
> +               "NC",
> +               "NC",
> +               "NC",
> +               "NC",
> +               "MMC0_DAT3",
> +               "MMC0_DAT2",
> +               "MMC0_DAT1",
> +               "MMC0_DAT0",
> +               "MMC0_CLK",
> +               "MMC0_CMD";
> +};
> +
> +&gpio3 {
> +       gpio-line-names =
> +               "onrisc:red:power",
> +               "RMII1_CRS_DV",
> +               "RMII1_RXER",
> +               "RMII1_TXEN",
> +               "3G_PWR_EN",
> +               "UART2_CTSN",
> +               "UART2_RTSN",
> +               "WLAN_IRQ",
> +               "WLAN_EN",
> +               "NC",
> +               "NC",
> +               "NC",
> +               "NC",
> +               "USB1_DRVVBUS",
> +               "NC",
> +               "NC",
> +               "NC",
> +               "NC",
> +               "NC",
> +               "NC",
> +               "NC",
> +               "NC",
> +               "NC",
> +               "NC",
> +               "NC",
> +               "NC",
> +               "NC",
> +               "NC",
> +               "NC",
> +               "NC",
> +               "NC",
> +               "NC";
> +};
> --
> 2.17.0

Ignore this patch. I'll send v2.

Yegor
