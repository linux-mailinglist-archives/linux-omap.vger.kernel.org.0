Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 54F30AD898
	for <lists+linux-omap@lfdr.de>; Mon,  9 Sep 2019 14:13:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391040AbfIIMNl (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 9 Sep 2019 08:13:41 -0400
Received: from mail-io1-f67.google.com ([209.85.166.67]:45134 "EHLO
        mail-io1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387487AbfIIMNl (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 9 Sep 2019 08:13:41 -0400
Received: by mail-io1-f67.google.com with SMTP id f12so27975087iog.12;
        Mon, 09 Sep 2019 05:13:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=qg8xC9UxmhKCmV81UpwtW3mMWGVvqlb5I9FtLPwmTUM=;
        b=pku/NLUh4SJEsiCFuwtfYQi0lc090lQAayDr9JSBcsxNeYnjyOe+SOELeG2a0eqCX1
         BKT2Q8DKiqV16ITAFeCNmxC0VsSWvASPSTs713atMDmvhrOcitTUKrCuCwQxMBUV8IUp
         v1Qmpha3KShO+rFXG7/5aqdHM837Fyi+PFFMWRrMSqOHT5uvUtH+ulr9WDzoWVPpTP3s
         XSfsqM55yMsEGmGYfubsHGOgRtx5SaLmm2XhpYyBwGK4Uu7Ar7vU69MBSm+oJ5I/eDdz
         DwitdKuz5jdECbTDlC50wefxqE3Djak/O0KQ5npYtgoaqtfcAQ8WRF8ppSinzgPiBORq
         Yx/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qg8xC9UxmhKCmV81UpwtW3mMWGVvqlb5I9FtLPwmTUM=;
        b=Yum2HJrCsuOtF+IYRU2NdPsNPOui228SGnkvX1ZsX/kivg3kzXm6xdpAbykbFggg3o
         cxkgVHR6NeMEKYWIcMNoFGhNttMgD1is3k49cA3Hg04PenlnobYoU3f/qDWqTWLtTsJK
         N20JVOMP7F0qfoj4Exx766m5tBWdatQhaI1sv/KgOEHqP/xf+BpV59IhMbi+PRnJ+pXZ
         Z2o0dATeZRP2g/y0bbIT8uOx+1OqjCzpY8oGTmXPjpJhzcj1JCRNIDT/YweffsXAeMFg
         HEGwqgw3lXchVmomjivmiLEbFIacs1B3MevV3udze+YFcUUm4XLYMyGtxLbrjU8+FbXZ
         xqJg==
X-Gm-Message-State: APjAAAXzZaPIBiS2Houu0ydIkn/ezT+Pq+mWR4Xrna83e761M2pvOxWp
        NXdfRq+okeL/KQ9Lz88nexgYyNLWS65ECxc7l8I=
X-Google-Smtp-Source: APXvYqyHw54reih0bwbQtWwZoTsD2HFT73oXHKwpVjtXdOQkOcP6NKzt03ZaIh/tcyxPMtwL33xaVzkLbAhFEKYczz0=
X-Received: by 2002:a5e:de47:: with SMTP id e7mr15561943ioq.127.1568031220454;
 Mon, 09 Sep 2019 05:13:40 -0700 (PDT)
MIME-Version: 1.0
References: <20190828150037.2640-1-aford173@gmail.com> <20190905230443.GA52127@atomide.com>
In-Reply-To: <20190905230443.GA52127@atomide.com>
From:   Adam Ford <aford173@gmail.com>
Date:   Mon, 9 Sep 2019 07:13:29 -0500
Message-ID: <CAHCN7xL0fbr=Sv+b=0AuGB1PPhAAFdAFLEd_iBM+ZMTkUw5sHQ@mail.gmail.com>
Subject: Re: [RFC] ARM: omap3: Enable HWMODS for HW Random Number Generator
To:     Tony Lindgren <tony@atomide.com>
Cc:     Linux-OMAP <linux-omap@vger.kernel.org>,
        =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali.rohar@gmail.com>,
        Tero Kristo <t-kristo@ti.com>,
        Aaro Koskinen <aaro.koskinen@iki.fi>,
        Adam Ford <adam.ford@logicpd.com>,
        =?UTF-8?Q?Beno=C3=AEt_Cousson?= <bcousson@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Russell King <linux@armlinux.org.uk>,
        Paul Walmsley <paul@pwsan.com>,
        devicetree <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        arm-soc <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Thu, Sep 5, 2019 at 6:04 PM Tony Lindgren <tony@atomide.com> wrote:
>
> Hi,
>
> * Adam Ford <aford173@gmail.com> [190828 15:01]:
> > The datasheet for the AM3517 shows the RNG is connected to L4.
> > It shows the module address for the RNG is 0x480A0000, and it
> > matches the omap2.dtsi description.  Since the driver can support
> > omap2 and omap4, it seems reasonable to assume the omap3 would
> > use the same core for the RNG.
> >
> > This RFC, mimics much of the omap2 hwmods on the OMAP3. It
> > also adds the necessary clock for driving the RNG.  Unfortunately,
> > it appears non-functional.  If anyone has any suggestions on how
> > to finish the hwmod (or port it to the newer l4 device tree
> > format), feedback is requested.
>
> Yup I'll take the bait :) The patch below seems to do the trick
> for me on dm3730 based on translating your patch to probe with
> ti-sysc.
>
> Not sure about 34xx, it seems we're missing rng_clk? Care
> to give it a try and attempt simlar patches for 34xx and
> 3517?
>
> At least I'm not needing the "ti,no-reset-on-init" property
> that your patch has a comment for. Maybe that's needed on
> some other omap3.
>
> Oh and this needs to default to status = "disabled" for
> HS devices like n900 as it needs to use the omap3-rom-rng.
>
> Regards,
>
> Tony
>
> 8< -----------------------
> diff --git a/arch/arm/boot/dts/omap36xx.dtsi b/arch/arm/boot/dts/omap36xx.dtsi
> --- a/arch/arm/boot/dts/omap36xx.dtsi
> +++ b/arch/arm/boot/dts/omap36xx.dtsi
> @@ -140,6 +140,29 @@
>                         };
>                 };
>
> +               rng_target: target-module@480a0000 {
> +                       compatible = "ti,sysc-omap2", "ti,sysc";
> +                       reg = <0x480a003c 0x4>,
> +                             <0x480a0040 0x4>,
> +                             <0x480a0044 0x4>;
> +                       reg-names = "rev", "sysc", "syss";
> +                       ti,sysc-mask = <(SYSC_OMAP2_AUTOIDLE)>;
> +                       ti,sysc-sidle = <SYSC_IDLE_FORCE>,
> +                                       <SYSC_IDLE_NO>;
> +                       ti,syss-mask = <1>;
> +                       clocks = <&rng_ick>;
> +                       clock-names = "ick";
> +                       #address-cells = <1>;
> +                       #size-cells = <1>;
> +                       ranges = <0 0x480a0000 0x2000>;
> +
> +                       rng: rng@0 {
> +                               compatible = "ti,omap2-rng";
> +                               reg = <0x0 0x2000>;
> +                               interrupts = <52>;
> +                       };
> +               };
> +

Tony,

Can you tell me what branch you're using?  I am not seeing the note
below, so I am not exactly sure what version to base my testing.

ada,
>                 /*
>                  * Note that the sysconfig register layout is a subset of the
>                  * "ti,sysc-omap4" type register with just sidle and midle bits
