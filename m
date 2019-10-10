Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 961E7D21DE
	for <lists+linux-omap@lfdr.de>; Thu, 10 Oct 2019 09:39:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732928AbfJJHiJ (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 10 Oct 2019 03:38:09 -0400
Received: from mail-vs1-f68.google.com ([209.85.217.68]:39045 "EHLO
        mail-vs1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1733051AbfJJHaX (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 10 Oct 2019 03:30:23 -0400
Received: by mail-vs1-f68.google.com with SMTP id y129so3257652vsc.6
        for <linux-omap@vger.kernel.org>; Thu, 10 Oct 2019 00:30:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=CQ1YByZ73Mbufo1qkTLIH1uGUYbhoHyBhaHdYebd6Hw=;
        b=DH+qyimaVqlUfKk7gc27ahaRVHkRJi/YXNWXXTTYQjqyk+LetAr3uxetUTuEwDxGIt
         VxRuuS4+I5Xs44tOarvdC8haQ0H9P1CWNjEGaIFVojc2uTE8ATXJWnB31i2jvdiag5Si
         ikjkomBgvJLJoM7QFJWSr4HHnUunE4yUR5vT/T+YyGrmt6yiPjNH+yNkyUSmnLzQR7+o
         2r98wCVHVm8xNTYRmkbjzGFnbCo0TJcUU3zI6tnV8YV8NtSN3quZxldO2gjyIRC83DH5
         gIXbw0mOMgHZ4rnpZkTUQVw/E6Qf/xX9zs+sWgNPDCUR2Ju9ipAmWQLB7WVVM0GwKYAP
         UjcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=CQ1YByZ73Mbufo1qkTLIH1uGUYbhoHyBhaHdYebd6Hw=;
        b=tpSFqZkn3fEW4FMHS3NIsVDMP/OXDqSM+CfE4iW/kFO5N9RGS7sAgy0b/ZLkTUF8+S
         H0K14Z7e3HZuX4fQiZzau1kbTkLnbSOd1M6CIikLT83+3qk4fsB8+BtrWLfss8V+oFs7
         EDOp0IaC5f9K3raOfnY28M32WyImGSPszrORnCeT+tk9jiWBZJ/3w0pQRk4VfdZm0Q4T
         zryqcyd33wfqgrIR7PWnYeNLs7wjpPsVipXxBoHwQ8/P6vBE9e83zuCD1QrGXtHZCyoK
         BNcS26gAEelBAvLjgMhth49nGEuZs9lljcrO/p9tMxpsbJwTx00SO1Zawkusx9t/P2LD
         pJXg==
X-Gm-Message-State: APjAAAU1fREPiyZPowSADjxkncHTih5O5LQc6GVQyYFBt2mQikVbTPRo
        35zDX1ykqTQs8LHhexL9aFwDXeQvPUIGFvNcqyn1BQ==
X-Google-Smtp-Source: APXvYqwSdjcOR1qCmgjqkV47CZ5gOBzPcecYVg4c70Ujb9JuqZJZHw6bODYsY9iH/ccgCGeaJI/aY06PoJw5QS+1aMI=
X-Received: by 2002:a05:6102:5e1:: with SMTP id w1mr4671201vsf.191.1570692622302;
 Thu, 10 Oct 2019 00:30:22 -0700 (PDT)
MIME-Version: 1.0
References: <20191009164344.41093-1-tony@atomide.com>
In-Reply-To: <20191009164344.41093-1-tony@atomide.com>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Thu, 10 Oct 2019 09:29:45 +0200
Message-ID: <CAPDyKFqUL1Cso1H-sNcWFngWiLHLD76Uk9PtN2TkKS_Kd6TKJw@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: Use level interrupt for omap4 & 5 wlcore
To:     Tony Lindgren <tony@atomide.com>
Cc:     linux-omap <linux-omap@vger.kernel.org>,
        =?UTF-8?Q?Beno=C3=AEt_Cousson?= <bcousson@baylibre.com>,
        DTML <devicetree@vger.kernel.org>,
        Anders Roxell <anders.roxell@linaro.org>,
        Eyal Reizer <eyalr@ti.com>, Guy Mishol <guym@ti.com>,
        John Stultz <john.stultz@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Wed, 9 Oct 2019 at 18:43, Tony Lindgren <tony@atomide.com> wrote:
>
> Commit 572cf7d7b07d ("ARM: dts: Improve omap l4per idling with wlcore edge
> sensitive interrupt") changed wlcore interrupts to use edge interrupt based
> on what's specified in the wl1835mod.pdf data sheet.
>
> However, there are still cases where we can have lost interrupts as
> described in omap_gpio_unidle(). And using a level interrupt instead of edge
> interrupt helps as we avoid the check for untriggered GPIO interrupts in
> omap_gpio_unidle().
>
> And with commit e6818d29ea15 ("gpio: gpio-omap: configure edge detection
> for level IRQs for idle wakeup") GPIOs idle just fine with level interrupts.
>
> Let's change omap4 and 5 wlcore users back to using level interrupt
> instead of edge interrupt. Let's not change the others as I've only seen
> this on omap4 and 5, probably because the other SoCs don't have l4per idle
> independent of the CPUs.

I assume this relates to the implementation for support of SDIO IRQs
(and wakeups) in the omap_hsmmc driver?

In any case, just wanted to share some experience in the field, feel
free to do whatever you want with the below information. :-)

So, while I was working for ST-Ericsson on ux500, we had a very
similar approach to re-route the SDIO bus DAT1 line to a GPIO IRQ as a
remote/system wakeup (vendor hack in the mmci driver). In other words,
while runtime suspending the mmc host controller, we configured a GPIO
IRQ, via an always on logic, to capture the IRQ instead. The point is,
I believe we may have ended up looking at similar problems as you have
been facing on OMAP.

In hindsight, I realized that we actually violated the SDIO spec by
using this approach. More precisely, during runtime suspend we do
clock gating and then re-routes the IRQ. However, clock gating isn't
allowed before the SDIO bus width have been changed back from 4-bit
into 1-bit. This last piece of action, would be an interesting change
to see if it could affect the behaviour, but unfortunately I have
never been able to check this.

The tricky part, is that we can't issue a command to change the bus to
1-bit in omap_hsmmc ->runtime_suspend() callback (this needs to be
managed by the core in some way). However, we can make a simple test,
by simply always limit the bus width to 1-bit, as that should mean we
should conform to the SDIO spec.

Kind regards
Uffe

>
> Fixes: 572cf7d7b07d ("ARM: dts: Improve omap l4per idling with wlcore edge sensitive interrupt")
> Depends-on: e6818d29ea15 ("gpio: gpio-omap: configure edge detection for level IRQs for idle wakeup")
> Cc: Anders Roxell <anders.roxell@linaro.org>
> Cc: Eyal Reizer <eyalr@ti.com>
> Cc: Guy Mishol <guym@ti.com>
> Cc: John Stultz <john.stultz@linaro.org>
> Cc: Ulf Hansson <ulf.hansson@linaro.org>
> Signed-off-by: Tony Lindgren <tony@atomide.com>
> ---
>  arch/arm/boot/dts/omap4-droid4-xt894.dts       | 2 +-
>  arch/arm/boot/dts/omap4-panda-common.dtsi      | 2 +-
>  arch/arm/boot/dts/omap4-sdp.dts                | 2 +-
>  arch/arm/boot/dts/omap4-var-som-om44-wlan.dtsi | 2 +-
>  arch/arm/boot/dts/omap5-board-common.dtsi      | 2 +-
>  5 files changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/arch/arm/boot/dts/omap4-droid4-xt894.dts b/arch/arm/boot/dts/omap4-droid4-xt894.dts
> --- a/arch/arm/boot/dts/omap4-droid4-xt894.dts
> +++ b/arch/arm/boot/dts/omap4-droid4-xt894.dts
> @@ -369,7 +369,7 @@
>                 compatible = "ti,wl1285", "ti,wl1283";
>                 reg = <2>;
>                 /* gpio_100 with gpmc_wait2 pad as wakeirq */
> -               interrupts-extended = <&gpio4 4 IRQ_TYPE_EDGE_RISING>,
> +               interrupts-extended = <&gpio4 4 IRQ_TYPE_LEVEL_HIGH>,
>                                       <&omap4_pmx_core 0x4e>;
>                 interrupt-names = "irq", "wakeup";
>                 ref-clock-frequency = <26000000>;
> diff --git a/arch/arm/boot/dts/omap4-panda-common.dtsi b/arch/arm/boot/dts/omap4-panda-common.dtsi
> --- a/arch/arm/boot/dts/omap4-panda-common.dtsi
> +++ b/arch/arm/boot/dts/omap4-panda-common.dtsi
> @@ -474,7 +474,7 @@
>                 compatible = "ti,wl1271";
>                 reg = <2>;
>                 /* gpio_53 with gpmc_ncs3 pad as wakeup */
> -               interrupts-extended = <&gpio2 21 IRQ_TYPE_EDGE_RISING>,
> +               interrupts-extended = <&gpio2 21 IRQ_TYPE_LEVEL_HIGH>,
>                                       <&omap4_pmx_core 0x3a>;
>                 interrupt-names = "irq", "wakeup";
>                 ref-clock-frequency = <38400000>;
> diff --git a/arch/arm/boot/dts/omap4-sdp.dts b/arch/arm/boot/dts/omap4-sdp.dts
> --- a/arch/arm/boot/dts/omap4-sdp.dts
> +++ b/arch/arm/boot/dts/omap4-sdp.dts
> @@ -512,7 +512,7 @@
>                 compatible = "ti,wl1281";
>                 reg = <2>;
>                 interrupt-parent = <&gpio1>;
> -               interrupts = <21 IRQ_TYPE_EDGE_RISING>; /* gpio 53 */
> +               interrupts = <21 IRQ_TYPE_LEVEL_HIGH>; /* gpio 53 */
>                 ref-clock-frequency = <26000000>;
>                 tcxo-clock-frequency = <26000000>;
>         };
> diff --git a/arch/arm/boot/dts/omap4-var-som-om44-wlan.dtsi b/arch/arm/boot/dts/omap4-var-som-om44-wlan.dtsi
> --- a/arch/arm/boot/dts/omap4-var-som-om44-wlan.dtsi
> +++ b/arch/arm/boot/dts/omap4-var-som-om44-wlan.dtsi
> @@ -69,7 +69,7 @@
>                 compatible = "ti,wl1271";
>                 reg = <2>;
>                 interrupt-parent = <&gpio2>;
> -               interrupts = <9 IRQ_TYPE_EDGE_RISING>; /* gpio 41 */
> +               interrupts = <9 IRQ_TYPE_LEVEL_HIGH>; /* gpio 41 */
>                 ref-clock-frequency = <38400000>;
>         };
>  };
> diff --git a/arch/arm/boot/dts/omap5-board-common.dtsi b/arch/arm/boot/dts/omap5-board-common.dtsi
> --- a/arch/arm/boot/dts/omap5-board-common.dtsi
> +++ b/arch/arm/boot/dts/omap5-board-common.dtsi
> @@ -362,7 +362,7 @@
>                 pinctrl-names = "default";
>                 pinctrl-0 = <&wlcore_irq_pin>;
>                 interrupt-parent = <&gpio1>;
> -               interrupts = <14 IRQ_TYPE_EDGE_RISING>; /* gpio 14 */
> +               interrupts = <14 IRQ_TYPE_LEVEL_HIGH>;  /* gpio 14 */
>                 ref-clock-frequency = <26000000>;
>         };
>  };
> --
> 2.23.0
