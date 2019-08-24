Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 700CB9BFC7
	for <lists+linux-omap@lfdr.de>; Sat, 24 Aug 2019 21:14:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727094AbfHXTOt (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sat, 24 Aug 2019 15:14:49 -0400
Received: from mail-io1-f65.google.com ([209.85.166.65]:42198 "EHLO
        mail-io1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726553AbfHXTOt (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sat, 24 Aug 2019 15:14:49 -0400
Received: by mail-io1-f65.google.com with SMTP id e20so27850883iob.9
        for <linux-omap@vger.kernel.org>; Sat, 24 Aug 2019 12:14:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=SUWLLSMRgv1ayDaPJ/nSN3/cWl7K8/dBxrNkN6DZfKY=;
        b=CuL2mev4Qup5bG0iGHr/7nlAu8loA9QZm6+u6yeQb+MI+w+xtqVQFK4+LeBp1dbVr+
         Ymmk3p0US6Zb+dL+tQX/++nlkmxDRzEzqXViBh7ZnmE6NLETiXz3x5O+vaukIVLEGi2C
         H8Ha58E5CEyaPohgdiL6uC6iH5pns7dzIF3PLKDTLcmw/AP0PV4uX2g32cr3t5URPQg9
         84NwujaF1bPukPJK0l69Rvh6zU79CyVWQf+GppUgwmQLtJ1tYNdKpGl4SYRXEIglG2eS
         wMEaKJru1sXh18wJKQ3zhOUDHNaNKdH4DPDgRSTCT43hohMmh/JOwXzUUULiSu/KQ2T8
         Ow+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=SUWLLSMRgv1ayDaPJ/nSN3/cWl7K8/dBxrNkN6DZfKY=;
        b=MZRcRjC4Rjbkrx8de8LzJ+9zkjHxWmfwf9GvGUUhoMQks8IPA61asbXTEOJ4qB02Kr
         t4+kxBg5h4k1O3zkUMFDQPMGDReLYCzfgraesVv1zPMYpxksUBk419lmWSLCEQvqCf/Q
         G1tDAz75keGv+FY8mDXtL+Wix9CX2mkbMAsP1+YfpwwQaf0qo3PbZ1BfM2DEW6/VXWzJ
         EbNo18A9kdyv1+LbL4LgkA/Iu++HsbYRaSTI8NVQSV4SWM0x7nAYkTKdgQ2PCKxIP6aE
         bdPYD8xkRN9u8JGUrgEm8/fRBAT8IHotf+r7RmqTlToKKj7FSsubTX/1nCYm1/AKJ12A
         QxmA==
X-Gm-Message-State: APjAAAWkg1fno1mbJLiWxjr47A58IF8fPGLxn/aRCr4Y9OTJhoV9wCiB
        4FS0R1BZx7Uusd0nsW4eFOZvaQnCUFwmlx37LILrnKh8
X-Google-Smtp-Source: APXvYqyYdvZs1juiil87j4zCB9D3yr2gIA48bhYQ6h8xYZ6AYZK9gab1J83k29ilNo+nSxHkV9l2KcSWNTDpJGi5n5U=
X-Received: by 2002:a6b:c98c:: with SMTP id z134mr14665131iof.276.1566674088179;
 Sat, 24 Aug 2019 12:14:48 -0700 (PDT)
MIME-Version: 1.0
References: <20190820121727.3883-1-aford173@gmail.com>
In-Reply-To: <20190820121727.3883-1-aford173@gmail.com>
From:   Adam Ford <aford173@gmail.com>
Date:   Sat, 24 Aug 2019 14:14:36 -0500
Message-ID: <CAHCN7xKBjHP7rHFHk2HfFa9gkmegHLB1qGgLfdJfUZ6PnytPOA@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: logicpd-som-lv: Fix i2c2 and i2c3 Pin mux
To:     Linux-OMAP <linux-omap@vger.kernel.org>
Cc:     Adam Ford <adam.ford@logicpd.com>, Tom Rini <trini@konsulko.com>,
        Stefano Babic <sbabic@denx.de>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Tue, Aug 20, 2019 at 7:17 AM Adam Ford <aford173@gmail.com> wrote:
>
> When the pinmux configuration was added, it was accidentally placed into
> the omap3_pmx_wkup node  when it should have been placed into the
> omap3_pmx_core.  This error was accidentally propagated to stable by
> me when I blindly requested the pull after seeing I2C issues without
> actually reviewing the content of the pinout.  Since the bootloader
> previously muxed these correctly in the past, was a hidden error.
>
> This patch moves the i2c2_pins and i2c3_pins to the correct node
> which should eliminate i2c bus errors and timeouts due to the fact
> the bootloader uses the save device tree that no longer properly
> assigns these pins.
>
> Fixes: 5fe3c0fa0d54 ("ARM: dts: Add pinmuxing for i2c2 and i2c3
> for LogicPD SOM-LV") #4.9+
>
> Signed-off-by: Adam Ford <aford173@gmail.com>
>

Tom,
i noticed this was assigned to Stefano.  I don't know if it matters,
but this board is an omap3 board, and I think he does NXP stuff, so I
am not sure if he's the right custodian.

adam

> diff --git a/arch/arm/boot/dts/logicpd-som-lv.dtsi b/arch/arm/boot/dts/logicpd-som-lv.dtsi
> index 5563ee54c960..b56524cc7fe2 100644
> --- a/arch/arm/boot/dts/logicpd-som-lv.dtsi
> +++ b/arch/arm/boot/dts/logicpd-som-lv.dtsi
> @@ -228,6 +228,20 @@
>                 >;
>         };
>
> +       i2c2_pins: pinmux_i2c2_pins {
> +               pinctrl-single,pins = <
> +                       OMAP3_CORE1_IOPAD(0x21be, PIN_INPUT | MUX_MODE0)        /* i2c2_scl */
> +                       OMAP3_CORE1_IOPAD(0x21c0, PIN_INPUT | MUX_MODE0)        /* i2c2_sda */
> +               >;
> +       };
> +
> +       i2c3_pins: pinmux_i2c3_pins {
> +               pinctrl-single,pins = <
> +                       OMAP3_CORE1_IOPAD(0x21c2, PIN_INPUT | MUX_MODE0)        /* i2c3_scl */
> +                       OMAP3_CORE1_IOPAD(0x21c4, PIN_INPUT | MUX_MODE0)        /* i2c3_sda */
> +               >;
> +       };
> +
>         tsc2004_pins: pinmux_tsc2004_pins {
>                 pinctrl-single,pins = <
>                         OMAP3_CORE1_IOPAD(0x2186, PIN_INPUT | MUX_MODE4)        /* mcbsp4_dr.gpio_153 */
> @@ -249,18 +263,6 @@
>                         OMAP3_WKUP_IOPAD(0x2a0c, PIN_OUTPUT | MUX_MODE4)        /* sys_boot1.gpio_3 */
>                 >;
>         };
> -       i2c2_pins: pinmux_i2c2_pins {
> -               pinctrl-single,pins = <
> -                       OMAP3_CORE1_IOPAD(0x21be, PIN_INPUT | MUX_MODE0)        /* i2c2_scl */
> -                       OMAP3_CORE1_IOPAD(0x21c0, PIN_INPUT | MUX_MODE0)        /* i2c2_sda */
> -               >;
> -       };
> -       i2c3_pins: pinmux_i2c3_pins {
> -               pinctrl-single,pins = <
> -                       OMAP3_CORE1_IOPAD(0x21c2, PIN_INPUT | MUX_MODE0)        /* i2c3_scl */
> -                       OMAP3_CORE1_IOPAD(0x21c4, PIN_INPUT | MUX_MODE0)        /* i2c3_sda */
> -               >;
> -       };
>  };
>
>  &omap3_pmx_core2 {
> --
> 2.17.1
>
