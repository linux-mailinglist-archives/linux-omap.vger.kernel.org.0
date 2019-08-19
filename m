Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B679B94DA0
	for <lists+linux-omap@lfdr.de>; Mon, 19 Aug 2019 21:12:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728136AbfHSTMr (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 19 Aug 2019 15:12:47 -0400
Received: from mail-io1-f65.google.com ([209.85.166.65]:39946 "EHLO
        mail-io1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727957AbfHSTMq (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 19 Aug 2019 15:12:46 -0400
Received: by mail-io1-f65.google.com with SMTP id t6so6740509ios.7;
        Mon, 19 Aug 2019 12:12:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=Ukv0qMe05muJlNYiQ6Uce5PMPZSpZc4axetoRBKz3DU=;
        b=CtsJS6pDeGDB3H/bjAencjIeLETrnsj+C5WUnp3KWegzU7V2ozvSt5YYsCIuSHwDgn
         tvfrpTVnOLt2KhKDA1QuJfaXJ7GuTRX8b6xW9VhcWGbGQU3VYztn0shxFNBQZq1mAB8a
         3enlpM8bCzwkmrB+A3V+AckXTTxTCVTzrEpuKH6zfxurQRd/dR7Y0fpSJwxUBYdi3cml
         FHDrgiVkzJWe1rRuGbJ6I1cNrsH886qjamZCGtAy2tLO0FK1h2vGbK1AsGLpEV4mOf46
         IY2g47S5OYgTTakjbnFQgqkwF4HPNz8sx/fkgYwK0o2rn6g6mfYm9Kv9Kak8duIBsB8v
         2B1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=Ukv0qMe05muJlNYiQ6Uce5PMPZSpZc4axetoRBKz3DU=;
        b=FULESQ+Gaj9FxNtHZVmAqYL5FvuKjdFk+8KCJlUeEVNRdq1kgi9fFihIznIm65a/da
         AHLQOKUfuJfG0ZEqa2DQEJ/AUMdKqEZz+b1bIPNc6h+p6NOb4BLyNzLSz3J4sVyomBfW
         49SUBKLubJJY7GfRBTdWZ6T590PZJq0eO7/B1kMYYg3ysidwxcpuW7PS0yocZvtheLa5
         DeWWuWtvkRspTfagiXgVC/4YHeDwCaE8+5WkAM0ROTVJFiIETNF2QgrMPvFt7v+l1cTs
         kvfgZDnJFbHtfUWMCLYW49ki/XDw4q9b8EJ73lSjbXAqWKjfFTz/hDMZCv6AZNjAr14g
         zYxg==
X-Gm-Message-State: APjAAAVHQNaGtHKtDBzHb2VpZvDEF3DsLdQYVhZZDO3s2SlpCqm7Acur
        gvbrwJ8Ald+KdXD10BWWAHwvDpXythVActPIvxqwAQKXY1k=
X-Google-Smtp-Source: APXvYqx1qvT1CWV+VD2I9q7HQKnIL875PSKMaII+tcdK6YT8KL3nR/Ui/gGwdZUF/WsOR7lAOT7CCZJALIzU5Rtn6QI=
X-Received: by 2002:a6b:cdcc:: with SMTP id d195mr2813191iog.78.1566241965454;
 Mon, 19 Aug 2019 12:12:45 -0700 (PDT)
MIME-Version: 1.0
References: <20190814131408.57162-1-tony@atomide.com> <20190814131408.57162-6-tony@atomide.com>
In-Reply-To: <20190814131408.57162-6-tony@atomide.com>
From:   Adam Ford <aford173@gmail.com>
Date:   Mon, 19 Aug 2019 14:12:34 -0500
Message-ID: <CAHCN7x+WxFSU4e72ESu0UUKj_RGfNCOkHS4zvjmwQVoZ_t13Nw@mail.gmail.com>
Subject: Re: [PATCH 5/6] ARM: dts: Configure interconnect target module for
 omap3 sgx
To:     Tony Lindgren <tony@atomide.com>
Cc:     Linux-OMAP <linux-omap@vger.kernel.org>,
        =?UTF-8?Q?Beno=C3=AEt_Cousson?= <bcousson@baylibre.com>,
        devicetree <devicetree@vger.kernel.org>,
        =?UTF-8?Q?Filip_Matijevi=C4=87?= <filip.matijevic.pz@gmail.com>,
        "H. Nikolaus Schaller" <hns@goldelico.com>,
        Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>,
        moaz korena <moaz@korena.xyz>,
        Merlijn Wajer <merlijn@wizzup.org>,
        =?UTF-8?Q?Pawe=C5=82_Chmiel?= <pawel.mikolaj.chmiel@gmail.com>,
        Philipp Rossak <embed3d@gmail.com>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Tero Kristo <t-kristo@ti.com>,
        linux-clk <linux-clk@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Wed, Aug 14, 2019 at 8:14 AM Tony Lindgren <tony@atomide.com> wrote:
>
> Looks like omap34xx OCP registers are not readable unlike on omap36xx.
> We use SGX revision register instead of the OCP revision register for
> 34xx and do not configure any SYSCONFIG register unlike for 36xx.
>
> I've tested that the interconnect target module enables and idles
> just fine with PM runtime control via sys:
>
> # echo on > $(find /sys -name control | grep \/5000); rwmem 0x5000fe10
> # rwmem 0x50000014      # SGX revision register on 36xx
> 0x50000014 =3D 0x00010205

For an OMAP3530, I got:
# echo on > $(find /sys -name control | grep \/5000)
# devmem 0x50000014
0x00010201

Does 0x00010201 seem reasonable?  I am not sure where to find this in
the TRM unless it's located elsewhere, but  [1] seems to lead me to
believe this is correct.

> # echo auto > $(find /sys -name control | grep \/5000)
> # rwmem 0x5000fe00

I assume the above address should be 0x50000014 for OMAP34/35, is that
correct?  It was listed as 0x50000014 above.
If my assumption if correct, it appears to work for me as well.


[1] - http://processors.wiki.ti.com/index.php/GSG:_AM35x_and_OMAP35x_Rebuil=
ding_the_Software#How_to_check_for_SGX_core_revision

> And when idled, it will produce "Bus error" as expected.
>
> Cc: Adam Ford <aford173@gmail.com>
> Cc: Filip Matijevi=C4=87 <filip.matijevic.pz@gmail.com>
> Cc: "H. Nikolaus Schaller" <hns@goldelico.com>
> Cc: Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>
> Cc: moaz korena <moaz@korena.xyz>
> Cc: Merlijn Wajer <merlijn@wizzup.org>
> Cc: Pawe=C5=82 Chmiel <pawel.mikolaj.chmiel@gmail.com>
> Cc: Philipp Rossak <embed3d@gmail.com>
> Cc: Tomi Valkeinen <tomi.valkeinen@ti.com>

If my assumptions are correct, then you can mark it as

Tested-by: Adam Ford <aford173@gmail.com> #logicpd-som-lv-35xx-devkit

> Signed-off-by: Tony Lindgren <tony@atomide.com>
> ---
>  arch/arm/boot/dts/omap34xx.dtsi | 26 ++++++++++++++++++++++++++
>  arch/arm/boot/dts/omap36xx.dtsi | 27 +++++++++++++++++++++++++++
>  2 files changed, 53 insertions(+)
>
> diff --git a/arch/arm/boot/dts/omap34xx.dtsi b/arch/arm/boot/dts/omap34xx=
.dtsi
> --- a/arch/arm/boot/dts/omap34xx.dtsi
> +++ b/arch/arm/boot/dts/omap34xx.dtsi
> @@ -100,6 +100,32 @@
>                                 interrupts =3D <18>;
>                         };
>                 };
> +
> +               /*
> +                * On omap34xx the OCP registers do not seem to be access=
ible
> +                * at all unlike on 36xx. Maybe SGX is permanently set to
> +                * "OCP bypass mode", or maybe there is OCP_SYSCONFIG tha=
t is
> +                * write-only at 0x50000e10. We detect SGX based on the S=
GX
> +                * revision register instead of the unreadable OCP revisi=
on
> +                * register. Also note that on early 34xx es1 revision th=
ere
> +                * are also different clocks, but we do not have any dts =
users
> +                * for it.
> +                */
> +               sgx_module: target-module@50000000 {
> +                       compatible =3D "ti,sysc-omap2", "ti,sysc";
> +                       reg =3D <0x50000014 0x4>;
> +                       reg-names =3D "rev";
> +                       clocks =3D <&sgx_fck>, <&sgx_ick>;
> +                       clock-names =3D "fck", "ick";
> +                       #address-cells =3D <1>;
> +                       #size-cells =3D <1>;
> +                       ranges =3D <0 0x50000000 0x4000>;
> +
> +                       /*
> +                        * Closed source PowerVR driver, no cnhild device
> +                        * binding or driver in mainline
> +                        */
> +               };
>         };
>
>         thermal_zones: thermal-zones {
> diff --git a/arch/arm/boot/dts/omap36xx.dtsi b/arch/arm/boot/dts/omap36xx=
.dtsi
> --- a/arch/arm/boot/dts/omap36xx.dtsi
> +++ b/arch/arm/boot/dts/omap36xx.dtsi
> @@ -139,6 +139,33 @@
>                                 interrupts =3D <18>;
>                         };
>                 };
> +
> +               /*
> +                * The OCP register layout seems to be a subset of the
> +                * "ti,sysc-omap4" with just sidle and midle bits.
> +                */
> +               sgx_module: target-module@50000000 {
> +                       compatible =3D "ti,sysc-omap4", "ti,sysc";
> +                       reg =3D <0x5000fe00 0x4>,
> +                             <0x5000fe10 0x4>;
> +                       reg-names =3D "rev", "sysc";
> +                       ti,sysc-midle =3D <SYSC_IDLE_FORCE>,
> +                                       <SYSC_IDLE_NO>,
> +                                       <SYSC_IDLE_SMART>;
> +                       ti,sysc-sidle =3D <SYSC_IDLE_FORCE>,
> +                                       <SYSC_IDLE_NO>,
> +                                       <SYSC_IDLE_SMART>;
> +                       clocks =3D <&sgx_fck>, <&sgx_ick>;
> +                       clock-names =3D "fck", "ick";
> +                       #address-cells =3D <1>;
> +                       #size-cells =3D <1>;
> +                       ranges =3D <0 0x50000000 0x2000000>;
> +
> +                       /*
> +                        * Closed source PowerVR driver, no cnhild device
> +                        * binding or driver in mainline
> +                        */
> +               };
>         };
>
>         thermal_zones: thermal-zones {
> --
> 2.21.0
