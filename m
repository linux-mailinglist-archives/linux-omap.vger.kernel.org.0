Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 745858EC56
	for <lists+linux-omap@lfdr.de>; Thu, 15 Aug 2019 15:05:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731840AbfHONFe (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 15 Aug 2019 09:05:34 -0400
Received: from mail-ot1-f68.google.com ([209.85.210.68]:41701 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730304AbfHONFd (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 15 Aug 2019 09:05:33 -0400
Received: by mail-ot1-f68.google.com with SMTP id o101so5623760ota.8;
        Thu, 15 Aug 2019 06:05:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=Ll+cy8BwpEMSCL28Hd9i8ZjYyPna3WaqlsO/PRdFugQ=;
        b=lQOho5vux+i0DC/OAwuXfvHhWR66MFKZW0Ed9CSEMcNrgWH3TukVHA4c3TtvYZojJO
         I5nuHhnA5t4pwj4bZpr7GPmMm7XR62JrXMcY49AxX0YHzsCQ5QYMrr0ZYjsJ1GNJYiDH
         0+irZwua2UaY4HB6n9ZhLcDHE6nOal5ZOy7vsEA4LbsRdaSQclj6mZJ1bQwHqbr2ueb9
         rt8dbxnzPQORqac2+GE7h6VxtCXbq9hZQNrEbO7pDdJV8V45F5ZXYPltWqIpxbh9E65w
         QlM8jnY588mITOSXt/RJA8xEtx+sZiQ8g8sBHWQH0eBtm0wBpOM4y5TRTYkUtaMxUyP8
         8ybQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=Ll+cy8BwpEMSCL28Hd9i8ZjYyPna3WaqlsO/PRdFugQ=;
        b=A+MxzlLAhG6dUo9WAdGKkQUxyAHZxfnbRpQAgggIouuUg/RXUuEuXsqW0Wwd567Zym
         2kQ4YUyJwfy7009FgThYgf9NA2W7y+lzGTlNDpTM8dZ/5agR/wGl21IHe5g+9zL0+ho4
         Mrqh1Pe9gKKQVVLxFVLWmBA+z4Ary2Cw0PFMxz0mALdBUjIz/vGNMJ0KT6uqdNva2WVT
         hUm6Wk+8xI6McUjwoPD9S/9uMqYa+KBM+a640aw84tD4OYYcm6Zndyh1beB4n8TGB99p
         6IDPv7nQrcJUSkuHKbGz3Dnkdz/ApgtU04yFzEwu4eo2hwd7mjXUoUktXhCKzOe5BMd0
         xIsw==
X-Gm-Message-State: APjAAAXliWXY2XwtP/ynhttxtlySyrIKyz6hn8u0Gb9G+SKW58RnPpUV
        EOFz11YxyEWpmZWFE735wKThX1HKfkcTdrGIwYs=
X-Google-Smtp-Source: APXvYqwirOBDdXtI3wgWpG/SfHUCWmk0KPhu+M4XOZNa/fTtSPjZhGTY44y5ZFWAc53+k4Z6rsiuYIWc30XQyLLMchk=
X-Received: by 2002:a5e:db0a:: with SMTP id q10mr1026212iop.58.1565874332032;
 Thu, 15 Aug 2019 06:05:32 -0700 (PDT)
MIME-Version: 1.0
References: <20190814131408.57162-1-tony@atomide.com> <CAHCN7x+p5+XoRHJP--mZ0QcP0FzpYK+pRj7d8Y-js6a8z=p_7A@mail.gmail.com>
 <20190815040248.GF52127@atomide.com> <20190815041502.GG52127@atomide.com>
In-Reply-To: <20190815041502.GG52127@atomide.com>
From:   Adam Ford <aford173@gmail.com>
Date:   Thu, 15 Aug 2019 08:05:20 -0500
Message-ID: <CAHCN7xLNmTkvX9cKdRTu6xLvX+G-kkN6CbwXU0z+mdqscB3fvQ@mail.gmail.com>
Subject: Re: [PATCH 0/6] Configure sgx interconnect data for some omap variants
To:     Tony Lindgren <tony@atomide.com>
Cc:     Linux-OMAP <linux-omap@vger.kernel.org>,
        =?UTF-8?Q?Beno=C3=AEt_Cousson?= <bcousson@baylibre.com>,
        devicetree <devicetree@vger.kernel.org>,
        "H. Nikolaus Schaller" <hns@goldelico.com>,
        =?UTF-8?Q?Filip_Matijevi=C4=87?= <filip.matijevic.pz@gmail.com>,
        Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>,
        Merlijn Wajer <merlijn@wizzup.org>,
        Michael Turquette <mturquette@baylibre.com>,
        =?UTF-8?Q?Pawe=C5=82_Chmiel?= <pawel.mikolaj.chmiel@gmail.com>,
        Philipp Rossak <embed3d@gmail.com>,
        Stephen Boyd <sboyd@kernel.org>, Tero Kristo <t-kristo@ti.com>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>,
        linux-clk <linux-clk@vger.kernel.org>,
        moaz korena <moaz@korena.xyz>, "Andrew F. Davis" <afd@ti.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Wed, Aug 14, 2019 at 11:15 PM Tony Lindgren <tony@atomide.com> wrote:
>
> * Tony Lindgren <tony@atomide.com> [190815 04:03]:
> > * Adam Ford <aford173@gmail.com> [190814 19:14]:
> > > I do wonder if an omap34xx or omap36xx should use
> > > compatible =3D "ti,sysc-omap4", "ti,sysc";
> > >
> > > should it use an omap3 equivalent?
> >
> > We named the old hwmod type1 as ti,sysc-omap2, type2 as ti,sysc-omap4,
> > and type3 as ti,sysc-omap4-simple based on where we thought they
> > appeared. Based on the sysconfig register bit layout, sgx on omap36xx
> > seems to have a subset of ti,sysc-omap4 and we can recycle it. If we
> > used a wrong type, the module would not get enabled or disabled as
> > the register bits would not match.
> >
> > How about let's add a comment like:
> >
> > Yes sg has a subset of ti,sysc-omap4 type sysconfig register
>
> Well actually we already have some comments there, I clarified
> it a bit more and fixed the typos noted by Andrew. Updated patch
> below.
>
> Regards,
>
> Tony
>
> 8< ------------------
> From tony Mon Sep 17 00:00:00 2001
> From: Tony Lindgren <tony@atomide.com>
> Date: Wed, 14 Aug 2019 05:18:16 -0700
> Subject: [PATCH] ARM: dts: Configure interconnect target module for omap3
>  sgx
> MIME-Version: 1.0
> Content-Type: text/plain; charset=3DUTF-8
> Content-Transfer-Encoding: 8bit
>
> Looks like omap34xx OCP registers are not readable unlike on omap36xx.
> We use SGX revision register instead of the OCP revision register for
> 34xx and do not configure any SYSCONFIG register unlike for 36xx.

Do you want/need me to test the OMAP3530?  I can run the same tests I
did for the DM3730.

adam
>
> I've tested that the interconnect target module enables and idles
> just fine with PM runtime control via sys:
>
> # echo on > $(find /sys -name control | grep \/5000); rwmem 0x5000fe10
> # rwmem 0x50000014      # SGX revision register on 36xx
> 0x50000014 =3D 0x00010205
> # echo auto > $(find /sys -name control | grep \/5000)
> # rwmem 0x5000fe00
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
> Tested-by: Adam Ford <aford173@gmail.com> #logicpd-torpedo-37xx-devkit
> Signed-off-by: Tony Lindgren <tony@atomide.com>
> ---
>  arch/arm/boot/dts/omap34xx.dtsi | 26 ++++++++++++++++++++++++++
>  arch/arm/boot/dts/omap36xx.dtsi | 28 ++++++++++++++++++++++++++++
>  2 files changed, 54 insertions(+)
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
> +                        * Closed source PowerVR driver, no child device
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
> @@ -139,6 +139,34 @@
>                                 interrupts =3D <18>;
>                         };
>                 };
> +
> +               /*
> +                * Note that the sysconfig register layout is a subset of=
 the
> +                * "ti,sysc-omap4" type register with just sidle and midl=
e bits
> +                * available while omap34xx has "ti,sysc-omap2" type sysc=
onfig.
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
> +                        * Closed source PowerVR driver, no child device
> +                        * binding or driver in mainline
> +                        */
> +               };
>         };
>
>         thermal_zones: thermal-zones {
> --
> 2.21.0
