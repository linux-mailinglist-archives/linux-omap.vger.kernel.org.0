Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E127F118D75
	for <lists+linux-omap@lfdr.de>; Tue, 10 Dec 2019 17:23:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727177AbfLJQXQ (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 10 Dec 2019 11:23:16 -0500
Received: from mail-lj1-f196.google.com ([209.85.208.196]:43579 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727178AbfLJQXQ (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 10 Dec 2019 11:23:16 -0500
Received: by mail-lj1-f196.google.com with SMTP id a13so20589886ljm.10
        for <linux-omap@vger.kernel.org>; Tue, 10 Dec 2019 08:23:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=newoldbits-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ZppeWlVZq9XGJ0E70KlSRmIjhOToRgsSOOQSx1cb7cc=;
        b=BxjoVp3SZ5fTJFkhWzIPuKQzM4DRKxiKrlvVh9f7lE5xhfTokmyJnLmYvZBwOIe40c
         aIpue8TAljxhgsa5UB9WZaExKeyr9wjL8RPS7QikpqPiNB4J6pfnzOmQ/M3gdHpExhwb
         RYmud0ZlpBClr0ak3jpqzPnk6sxX4D+FHcWvx8hl0C4AmkYICbythyECD94miPWm21ww
         bDK/8BXuZj6/XkZ0zmi7K2cf0HD4tMaVH3Zj/wyurOtoP2VwU58XXg32YrFNZnGxHZ27
         n7zcQxHRmPeZ7KtrCbpGvsXaesn9vqJgjkV5qgbsjUEfds48bbhl+e3fiZeGjXZZiFuk
         NZ3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ZppeWlVZq9XGJ0E70KlSRmIjhOToRgsSOOQSx1cb7cc=;
        b=GHuTx9KdaER31FWW5l7hedr+i4t5GTl0alPSqQMJ0XXTYK7shrQ8t4oNUSbNefdydm
         VW63CCiKmnqBYbQ4YOe+xdymV8Rs7gRPTzAeXP+l76IME7RyjGHKAkSBvuI6pGOlUq/E
         8bx+5/8HFZY1gK9gg4r+/MKFh57Zwyu8sLNT4lltlySiDPtX6n/en93VNidNXY5lbpbu
         pwdleojxawZi4KfW0bsMH8++OHNHnSsbTQAkVdYTUj8qkMxhuql+stZVyCT7KKj+z8bS
         Bz20kAd959Jc/YxDJvU6pxCF6momA71Zauo+W5FRaRnnjImT1+2aTihBm5mhe8grWEhH
         dnkA==
X-Gm-Message-State: APjAAAXQvPw/1DuDYff6fP2XyPEgWZ798veLPLql0jnXb6gTs3dLJkRA
        SvUWqAak/B1buxFyujcUF3sLGsK6XQZ2+M1x4lC9SW9QoSxJVA==
X-Google-Smtp-Source: APXvYqzhULQKCBAzI5vpaa/GJ26x32lxwDUVVcoq9pskLU5Kk/SVrPvtQlAKAQxk3PZDw6bnL0/QS5mD98Lo8bM2i6U=
X-Received: by 2002:a2e:b4cb:: with SMTP id r11mr18006038ljm.68.1575994993248;
 Tue, 10 Dec 2019 08:23:13 -0800 (PST)
MIME-Version: 1.0
References: <20191206160007.331801-1-jean.pihet@newoldbits.com>
 <20191206160007.331801-2-jean.pihet@newoldbits.com> <20191206162431.GF35479@atomide.com>
 <CAORVsuUBseM3vnZsSajMmUS1O6rEC4U_aa951HwMsGxyEm+t+g@mail.gmail.com> <20191206175731.GG35479@atomide.com>
In-Reply-To: <20191206175731.GG35479@atomide.com>
From:   Jean Pihet <jean.pihet@newoldbits.com>
Date:   Tue, 10 Dec 2019 17:23:02 +0100
Message-ID: <CAORVsuXe7SyAmzLv4VoKMsf4jcYV1bKoCixhsgZ3U0rBHFJA4Q@mail.gmail.com>
Subject: Re: [PATCH 1/3] TI QSPI: Fix fclk frequency
To:     Tony Lindgren <tony@atomide.com>, Tero Kristo <t-kristo@ti.com>
Cc:     Mark Brown <broonie@kernel.org>, linux-omap@vger.kernel.org,
        linux-spi@vger.kernel.org,
        Ryan Barnett <ryan.barnett@rockwellcollins.com>,
        Conrad Ratschan <conrad.ratschan@rockwellcollins.com>,
        Vignesh R <vigneshr@ti.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Tony, Tero,

On Fri, Dec 6, 2019 at 6:57 PM Tony Lindgren <tony@atomide.com> wrote:
>
> * Jean Pihet <jean.pihet@newoldbits.com> [191206 16:30]:
> > Hi Tony,
> >
> > On Fri, Dec 6, 2019 at 5:24 PM Tony Lindgren <tony@atomide.com> wrote:
> > >
> > > Hi Jean,
> > >
> > > * Jean Pihet <jean.pihet@newoldbits.com> [191206 16:01]:
> > > > The QSPI IP is clocked by two clocks:
> > > > - CORE_CLKOUTM4 / 2 (L3) as interface clock,
> > > > - PER_CLKOUTM2 / 4 (L4) as functional clock, which is PER_CLKOUTM2
> > > >   divided by 4, so at 192Mhz / 4 = 48MHz.
> > > >
> > > > Fix the use of the correct fclk by the driver and fix the frequency
> > > > value so that the divider is correctly programmed to generate the
> > > > desired frequency of QSPI_CLK.
> > >
> > > This source clock can be different between the SoC models, the
> > > related fck probably needs to be fixed in the SoC specific dtsi
> > > file.
> > >
> > > Currently qspi it's there only in dra7.dtsi, sounds like you
> > > are using it on am3/am4 based on the clock name?
> >
> > I am using the AM4376 chipset. Only the interface is fixed in the
> > hwmod data as fck.
> > What is the best solution to add the extra fck?
>
> Well the long term solution would be to make it probe with
> ti-sysc interconnect target module driver, then you can specify
> both fck and ick there as needed.
>
> Care to test with the patch below (without your changes) to see if
> something else is still needed?

With the patch applied fck still is the ick, not the L4 clock as required.

Could both ick and fck be defined in the DT files, like here below?
   clocks = <&l3s_clkctrl AM4_L3S_QSPI_CLKCTRL 0>,
                 <&l4per2_clkctrl AM4_L4PER2_QSPI_CLKCTRL 0>;
   clock-names = "ick", "fck";
The issue is that there is no l4_per for AM4.

Looking at the DRA7 DT files there is an fck defined (in dra7.dtsi):
   clocks = <&l4per2_clkctrl DRA7_L4PER2_QSPI_CLKCTRL 25>;
   clock-names = "fck";

What is best to do from here?

Thanks,
Jean

>
> I only added the fck there, not sure if we should also the l3 ick.
> Eventually this node will be a child of the l3 interconnect, and
> genpd will ensure the l3 ick is in use when pm_runtime_get() is
> done in the qspi driver.
>
> Note that this will produce a boot time warning until the related
> hwmod data is dropped. I'll be posting a proper patch once we
> know what's going on here, not sure what's the right fix for the
> clock issue for v5.5-rc series though.
>
> Regards,
>
> Tony
>
> 8< ----------------------
> diff --git a/arch/arm/boot/dts/am4372.dtsi b/arch/arm/boot/dts/am4372.dtsi
> --- a/arch/arm/boot/dts/am4372.dtsi
> +++ b/arch/arm/boot/dts/am4372.dtsi
> @@ -302,17 +302,33 @@
>                         status = "disabled";
>                 };
>
> -               qspi: spi@47900000 {
> -                       compatible = "ti,am4372-qspi";
> -                       reg = <0x47900000 0x100>,
> -                             <0x30000000 0x4000000>;
> -                       reg-names = "qspi_base", "qspi_mmap";
> +               target-module@47900000 {
> +                       compatible = "ti,sysc-omap4", "ti,sysc";
> +                       //ti,hwmods = "qspi";
> +                       reg = <0x47900000 0x4>,
> +                             <0x47900010 0x4>;
> +                       reg-names = "rev", "sysc";
> +                       ti,sysc-sidle = <SYSC_IDLE_FORCE>,
> +                                       <SYSC_IDLE_NO>,
> +                                       <SYSC_IDLE_SMART>,
> +                                       <SYSC_IDLE_SMART_WKUP>;
> +                       clocks = <&l3s_clkctrl AM4_L3S_QSPI_CLKCTRL 0>;
> +                       clock-names = "fck";
>                         #address-cells = <1>;
> -                       #size-cells = <0>;
> -                       ti,hwmods = "qspi";
> -                       interrupts = <0 138 0x4>;
> -                       num-cs = <4>;
> -                       status = "disabled";
> +                       #size-cells = <1>;
> +                       ranges = <0x0 0x47900000 0x1000>,
> +                                <0x30000000 0x30000000 0x4000000>;
> +
> +                       qspi: spi@0 {
> +                               compatible = "ti,am4372-qspi";
> +                               reg = <0 0x100>,
> +                                     <0x30000000 0x4000000>;
> +                               reg-names = "qspi_base", "qspi_mmap";
> +                               #address-cells = <1>;
> +                               #size-cells = <0>;
> +                               interrupts = <0 138 0x4>;
> +                               num-cs = <4>;
> +                       };
>                 };
>
>                 dss: dss@4832a000 {
> --
> 2.24.0
