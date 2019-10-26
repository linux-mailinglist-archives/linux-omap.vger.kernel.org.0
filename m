Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E943AE5830
	for <lists+linux-omap@lfdr.de>; Sat, 26 Oct 2019 04:59:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725996AbfJZC7J (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 25 Oct 2019 22:59:09 -0400
Received: from mail-il1-f193.google.com ([209.85.166.193]:43676 "EHLO
        mail-il1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725957AbfJZC7J (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 25 Oct 2019 22:59:09 -0400
Received: by mail-il1-f193.google.com with SMTP id t5so3487179ilh.10;
        Fri, 25 Oct 2019 19:59:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=NLfPrr1N/6xjP1uYZrlEDQ2ulSwFNlt1bLFIvB1CPH4=;
        b=Fc2eDB3DpXsipr5eOSOX2PCmn0xRZfCZmfoMjCqPOw4/V9YDKVSJIt3bdWHmWb1ECZ
         skpg6LqnglcS2w8HYG1hyzrC99ZyCqrg1Q7z7SBC2de6cOyR2M1147f2G3coWR+WUw5J
         MD9Y2NQolGB8IfRs5iQcXRcJ18Cfresil91ZYMxEmibWClbiHZG3fHooGUMu9rahNnBy
         5zWII1Hbmg4SPcXwvWOOOSFPEKpIUPJLlD8PE2zNBCl8TyPGh+8W6gQ02fWH8uAQVX5G
         dmUJ09VFYQNfG0kYbzt/2gdWrwxPkoQRz3KeIYkui7OlqcaOs3A4p0u17g9HQYGoRh43
         ipnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=NLfPrr1N/6xjP1uYZrlEDQ2ulSwFNlt1bLFIvB1CPH4=;
        b=Fx11WWSoCikvxTERW5+v5VSa7c1IgL31yHlVwA+HKYEhaCgDa4NMRCD1XU+VoAQTYT
         yYbslxVWFZgjKCejZoFXLFsPpZV6TVrPlDendP6I0xgyzw2jD58JtgoedcsjS9fKnmJ3
         AKMjEWwftnBw9ryYhQW+ISXXElXqBVLaZ5uMpkSRwnjWZSREo2L4kPcGlu5JfwpRpP6U
         3ki7sxv0XLwvky+jqpzmxfuAyZDw1w97HfhmBccZznvEIIgvD9g/Ky3R6ZqhhbHSFQ/X
         VIhzPtLtreuPyBZeOwk8L6lfqL7Uf772NieqsoK3trecot6UTEgFHdwO60DlqZg7vGzM
         /N4A==
X-Gm-Message-State: APjAAAUQpNWT/iybtPesQO0zlQtcZeRo2LjKNWKdS2rmgm1/NY4TZlFt
        6trHLaw0FPObTWqS4FudEannnsLZLom8nrEnEVjvew==
X-Google-Smtp-Source: APXvYqypTUGtydqEUWkA8Br9pAWHGwckpWS8yRATBydZbfz9308CQmPWrWTBPmiN6N3pTgjKT6kUz4wOH+HV/Jth9ko=
X-Received: by 2002:a92:cb84:: with SMTP id z4mr8574940ilo.78.1572058747541;
 Fri, 25 Oct 2019 19:59:07 -0700 (PDT)
MIME-Version: 1.0
References: <20191023183942.12142-1-tony@atomide.com>
In-Reply-To: <20191023183942.12142-1-tony@atomide.com>
From:   Adam Ford <aford173@gmail.com>
Date:   Fri, 25 Oct 2019 21:58:56 -0500
Message-ID: <CAHCN7x+nJSMsLN_R+xDm4xOq8AibZgpiWX4UgUfjeB0Lv7Qk8w@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: Configure omap3 rng
To:     Tony Lindgren <tony@atomide.com>
Cc:     Linux-OMAP <linux-omap@vger.kernel.org>,
        =?UTF-8?Q?Beno=C3=AEt_Cousson?= <bcousson@baylibre.com>,
        devicetree <devicetree@vger.kernel.org>,
        Aaro Koskinen <aaro.koskinen@iki.fi>,
        =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali.rohar@gmail.com>,
        Sebastian Reichel <sre@kernel.org>,
        Tero Kristo <t-kristo@ti.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Wed, Oct 23, 2019 at 1:39 PM Tony Lindgren <tony@atomide.com> wrote:
>
> Looks like omap3 RNG is similar to the omap2 rng, let's get it working
> by configring the dts node for it.

Thank you for doing this.  This really helps reduce the startup delays
while waiting for entropy.

>
> We must also add rng_ick to core_l4_clkdm as noted by Adam Ford.
>
> And please note that the RNG is likely disabled on HS devices. At least
> n900 does not have it accessible, and instead omap3-rom-rng driver must
> be used. So let's tag RNG as disabled on n900 as noted by Pali Roh=C3=A1r
> <pali.rohar@gmail.com>.
>
> On am3517 at least the clocks need to be configured to get it working
> as noted by Adam Ford, so let's tag it disabled for now.
>

Tested-by: Adam Ford <aford173@gmail.com> #logicpd-torpedo-37xx-devkit

> Cc: Aaro Koskinen <aaro.koskinen@iki.fi>
> Cc: Adam Ford <aford173@gmail.com>
> Cc: Pali Roh=C3=A1r <pali.rohar@gmail.com>
> Cc: Sebastian Reichel <sre@kernel.org>
> Cc: Tero Kristo <t-kristo@ti.com>
> Signed-off-by: Tony Lindgren <tony@atomide.com>
> ---
>
> Sorry for the delay on getting this posted, please test.
>
> ---
>  arch/arm/boot/dts/am3517.dtsi                 |  6 +++++
>  arch/arm/boot/dts/omap3-n900.dts              |  5 ++++
>  arch/arm/boot/dts/omap3.dtsi                  | 25 +++++++++++++++++++
>  .../boot/dts/omap34xx-omap36xx-clocks.dtsi    |  2 +-
>  4 files changed, 37 insertions(+), 1 deletion(-)
>
> diff --git a/arch/arm/boot/dts/am3517.dtsi b/arch/arm/boot/dts/am3517.dts=
i
> --- a/arch/arm/boot/dts/am3517.dtsi
> +++ b/arch/arm/boot/dts/am3517.dtsi
> @@ -115,6 +115,12 @@
>         };
>  };
>
> +/* Not currently working, probably needs at least different clocks */
> +&rng_target {
> +       status =3D "disabled";
> +       /delete-property/ clocks;
> +};
> +
>  /* Table Table 5-79 of the TRM shows 480ab000 is reserved */
>  &usb_otg_hs {
>         status =3D "disabled";
> diff --git a/arch/arm/boot/dts/omap3-n900.dts b/arch/arm/boot/dts/omap3-n=
900.dts
> --- a/arch/arm/boot/dts/omap3-n900.dts
> +++ b/arch/arm/boot/dts/omap3-n900.dts
> @@ -1013,6 +1013,11 @@
>         };
>  };
>
> +/* RNG not directly accessible on n900, se omap3-rom-rng instead */
> +&rng_target {
> +       status =3D "disabled";
> +};
> +
>  &usb_otg_hs {
>         interface-type =3D <0>;
>         usb-phy =3D <&usb2_phy>;
> diff --git a/arch/arm/boot/dts/omap3.dtsi b/arch/arm/boot/dts/omap3.dtsi
> --- a/arch/arm/boot/dts/omap3.dtsi
> +++ b/arch/arm/boot/dts/omap3.dtsi
> @@ -8,6 +8,7 @@
>   * kind, whether express or implied.
>   */
>
> +#include <dt-bindings/bus/ti-sysc.h>
>  #include <dt-bindings/gpio/gpio.h>
>  #include <dt-bindings/interrupt-controller/irq.h>
>  #include <dt-bindings/pinctrl/omap.h>
> @@ -502,6 +503,30 @@
>                         status =3D "disabled";
>                 };
>
> +               /* Likely needs to be tagged disabled on HS devices */
> +               rng_target: target-module@480a0000 {
> +                       compatible =3D "ti,sysc-omap2", "ti,sysc";
> +                       reg =3D <0x480a003c 0x4>,
> +                             <0x480a0040 0x4>,
> +                             <0x480a0044 0x4>;
> +                       reg-names =3D "rev", "sysc", "syss";
> +                       ti,sysc-mask =3D <(SYSC_OMAP2_AUTOIDLE)>;
> +                       ti,sysc-sidle =3D <SYSC_IDLE_FORCE>,
> +                                       <SYSC_IDLE_NO>;
> +                       ti,syss-mask =3D <1>;
> +                       clocks =3D <&rng_ick>;
> +                       clock-names =3D "ick";
> +                       #address-cells =3D <1>;
> +                       #size-cells =3D <1>;
> +                       ranges =3D <0 0x480a0000 0x2000>;
> +
> +                       rng: rng@0 {
> +                               compatible =3D "ti,omap2-rng";
> +                               reg =3D <0x0 0x2000>;
> +                               interrupts =3D <52>;
> +                       };
> +               };
> +
>                 mcbsp2: mcbsp@49022000 {
>                         compatible =3D "ti,omap3-mcbsp";
>                         reg =3D <0x49022000 0xff>,
> diff --git a/arch/arm/boot/dts/omap34xx-omap36xx-clocks.dtsi b/arch/arm/b=
oot/dts/omap34xx-omap36xx-clocks.dtsi
> --- a/arch/arm/boot/dts/omap34xx-omap36xx-clocks.dtsi
> +++ b/arch/arm/boot/dts/omap34xx-omap36xx-clocks.dtsi
> @@ -260,6 +260,6 @@
>                          <&gpt10_ick>, <&mcbsp5_ick>, <&mcbsp1_ick>,
>                          <&omapctrl_ick>, <&aes2_ick>, <&sha12_ick>, <&ic=
r_ick>,
>                          <&des2_ick>, <&mspro_ick>, <&mailboxes_ick>,
> -                        <&mspro_fck>;
> +                        <&rng_ick>, <&mspro_fck>;
>         };
>  };
> --
> 2.23.0
