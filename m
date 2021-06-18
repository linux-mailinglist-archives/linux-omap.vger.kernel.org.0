Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 13D7F3ACFA5
	for <lists+linux-omap@lfdr.de>; Fri, 18 Jun 2021 18:02:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230430AbhFRQEu (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 18 Jun 2021 12:04:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38252 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230340AbhFRQEu (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 18 Jun 2021 12:04:50 -0400
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 67CE1C061574;
        Fri, 18 Jun 2021 09:02:40 -0700 (PDT)
Received: by mail-ed1-x52c.google.com with SMTP id z12so9368008edc.1;
        Fri, 18 Jun 2021 09:02:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=FeMZkRKu8I2r+KYH6VOSJibXy1W5BhFH+qkTYQAet8Y=;
        b=sNSc/wZA6DmbhwyM4CkUU7yJakpjTZIkuQp1YDLnjhqsmGOZsDH46jPfudG+4FV+dP
         szsKW+IE9CJr7hW9udjKxrJsO2eE/nGvhfqzFkFtQ7tcdrr3vFIfoDAqvM6f8Iczl4uY
         e115xA0YJlr6GngzNFOvPTB12oAsCp/jZVQ6syGNo+XwZiQiQRK2XjvtEfsCF8xDFHHb
         NAX1BUZ+k0eldKPEwzfGDok84QCdAA/SFjBiDfP3rk41q0rwPX46fEyjjn902jH9O2va
         35wuLRcUJNIIeX4XCU06P15aXDtrRm84ouKFAm8fIK2OBqptgHbnt0FPfClBK5R390Vq
         fltA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=FeMZkRKu8I2r+KYH6VOSJibXy1W5BhFH+qkTYQAet8Y=;
        b=FGOM8nrK6i1vouwWwAedHi5j5CUJ+70TydpP4T3d0xQKzVukJrXdp1h3E2OaWTBFIW
         uvByN8rfgNmd+b6cULOPaW0Ab/Wu9/qPJdVPR3h/xIOBKU/3C+jqS2J2ljARH1aD5LxY
         WhZv05FyspsI59FJnUmE6Si/STBbtyMfY/eXs4hi+747IJdeZg6r+0WQUa2wN2TrbRF3
         9Ri3+VMmfgTTE96VQ6LtCjIe5jFbKPL/SB7tbG5VrGmnhbgrnlH3e1wuueevvtDg+BYI
         I5HfjmmJZwKNRW/eLAH5aij3W3Y++x266KPhwGnHmXX+Vw9iDHRB0FO6vuee4TSBiBT6
         ZyBg==
X-Gm-Message-State: AOAM533qMIIdzCUxPBXdDtv3TLzWxZFVDtgnKgpetUflMWxROvH2Bop/
        Bd/5WW5YKd597AKj+xrssxSkPZrt0ZqC6rb+Gh4=
X-Google-Smtp-Source: ABdhPJyObSdlRTyvAUv6DlfwyKzuLyz0w1veDZeaI9nH49gN+3gAji451IYtR9ou1VtmQx29+xPR4YwfD9sMPMGXBxQ=
X-Received: by 2002:aa7:dccb:: with SMTP id w11mr5862932edu.96.1624032158864;
 Fri, 18 Jun 2021 09:02:38 -0700 (PDT)
MIME-Version: 1.0
References: <20210617093330.9179-1-paul.barker@sancloud.com> <20210617093330.9179-4-paul.barker@sancloud.com>
In-Reply-To: <20210617093330.9179-4-paul.barker@sancloud.com>
From:   Robert Nelson <robertcnelson@gmail.com>
Date:   Fri, 18 Jun 2021 11:02:12 -0500
Message-ID: <CAOCHtYjEn+F+_chyMQ0cppA0y=ZeHrme3c66A2Z5U6pJf9a8_w@mail.gmail.com>
Subject: Re: [PATCH 3/4] ARM: dts: am335x-sancloud-bbe-lite: New devicetree
To:     Paul Barker <paul.barker@sancloud.com>
Cc:     =?UTF-8?Q?Beno=C3=AEt_Cousson?= <bcousson@baylibre.com>,
        Tony Lindgren <tony@atomide.com>,
        linux-omap <linux-omap@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        Marc Murphy <marc.murphy@sancloud.com>,
        Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Paul,

On Thu, Jun 17, 2021 at 4:35 AM Paul Barker <paul.barker@sancloud.com> wrote:
>
> This adds support for the Sancloud BBE Lite which shares a common
> hardware base with the non-Lite version of the BBE.
>
> Signed-off-by: Paul Barker <paul.barker@sancloud.com>
> ---
>  arch/arm/boot/dts/Makefile                    |  1 +
>  .../arm/boot/dts/am335x-sancloud-bbe-lite.dts | 51 +++++++++++++++++++
>  2 files changed, 52 insertions(+)
>  create mode 100644 arch/arm/boot/dts/am335x-sancloud-bbe-lite.dts
>
> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
> index f8f09c5066e7..8629c941f573 100644
> --- a/arch/arm/boot/dts/Makefile
> +++ b/arch/arm/boot/dts/Makefile
> @@ -834,6 +834,7 @@ dtb-$(CONFIG_SOC_AM33XX) += \
>         am335x-pocketbeagle.dtb \
>         am335x-regor-rdk.dtb \
>         am335x-sancloud-bbe.dtb \
> +       am335x-sancloud-bbe-lite.dtb \
>         am335x-shc.dtb \
>         am335x-sbc-t335.dtb \
>         am335x-sl50.dtb \
> diff --git a/arch/arm/boot/dts/am335x-sancloud-bbe-lite.dts b/arch/arm/boot/dts/am335x-sancloud-bbe-lite.dts
> new file mode 100644
> index 000000000000..9c311bd106f6
> --- /dev/null
> +++ b/arch/arm/boot/dts/am335x-sancloud-bbe-lite.dts
> @@ -0,0 +1,51 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (C) 2012 Texas Instruments Incorporated - http://www.ti.com/
> + * Copyright (C) 2021 SanCloud Ltd
> + */
> +/dts-v1/;
> +
> +#include "am33xx.dtsi"
> +#include "am335x-bone-common.dtsi"
> +#include "am335x-boneblack-common.dtsi"
> +#include "am335x-sancloud-bbe-common.dtsi"
> +
> +/ {
> +       model = "SanCloud BeagleBone Enhanced Lite";
> +       compatible = "sancloud,am335x-boneenhanced",
> +                    "ti,am335x-bone-black",
> +                    "ti,am335x-bone",
> +                    "ti,am33xx";
> +};
> +
> +&am33xx_pinmux {
> +       bb_spi0_pins: pinmux_bb_spi0_pins {
> +               pinctrl-single,pins = <
> +                       AM33XX_PADCONF(AM335X_PIN_SPI0_SCLK, PIN_INPUT, MUX_MODE0)
> +                       AM33XX_PADCONF(AM335X_PIN_SPI0_D0, PIN_INPUT, MUX_MODE0)
> +                       AM33XX_PADCONF(AM335X_PIN_SPI0_D1, PIN_INPUT, MUX_MODE0)
> +                       AM33XX_PADCONF(AM335X_PIN_SPI0_CS0, PIN_INPUT, MUX_MODE0)
> +               >;
> +       };
> +};
> +
> +&spi0 {
> +       #address-cells = <1>;
> +       #size-cells = <0>;
> +
> +       status = "okay";
> +       pinctrl-names = "default";
> +       pinctrl-0 = <&bb_spi0_pins>;
> +
> +       channel@0 {
> +               #address-cells = <1>;
> +               #size-cells = <0>;
> +
> +               compatible = "micron,spi-authenta";
> +               symlink = "spi/0.0";

Sorry, this "symlink" is an undocumented "feature" of the
BeagleBoard.org tree.. We use it to help "identity" spi/usart/i2c
nodes names when they dynamically change node numbers based on kernel
versions or even 'drivers'....

https://github.com/beagleboard/customizations/blob/master/etc/udev/rules.d/10-of-symlink.rules

For 'mainline' we need to remove it..

Regards,

-- 
Robert Nelson
https://rcn-ee.com/
