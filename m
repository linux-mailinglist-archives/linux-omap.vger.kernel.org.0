Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AD917B2B70
	for <lists+linux-omap@lfdr.de>; Sat, 14 Sep 2019 15:47:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730579AbfINNrg (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sat, 14 Sep 2019 09:47:36 -0400
Received: from mail-io1-f65.google.com ([209.85.166.65]:41932 "EHLO
        mail-io1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728741AbfINNrg (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sat, 14 Sep 2019 09:47:36 -0400
Received: by mail-io1-f65.google.com with SMTP id r26so68718303ioh.8;
        Sat, 14 Sep 2019 06:47:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=5c+7toLvMTmRgmguxP1GEOcN8tq63Ii62NDiuk379RA=;
        b=t38f0IxagpfezKSWCERSYqTbsX0x2HA/RBWwIdXA5/avDR6wd5S5L4euBNBYg/cw/e
         F+VCjXJiRYZGG9vqwXaHZcAMdF2uQUYyoEKzDBfgeihzXO5d5Y87dfFsyH89mQl85irU
         ow7lg9M2UcLzVJctrrocZAfv09EWNkBg5VsTjuqSescLGv5HuDVZto92mwin/S08n3J8
         yK1RaxrYOm26R6B8QN2kw6XpKgFBvpKWybU2oMgno7Xa5+bVUg9/2jEsc136SfqtlPix
         ybD+l01Ttcc2ChhF038xUjCzb9lcoXcO8ag5V/hwqvLXkSOKE9xGbhTFQt0Vq0EUo2EC
         xF2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5c+7toLvMTmRgmguxP1GEOcN8tq63Ii62NDiuk379RA=;
        b=I1ZTVt0xNqhH3A0z9NAZmSKKDpmgUUzYNCxuPnOKmWbcbH3dWN0Gtrf/6ul51g/Qg/
         efEQFPblMtRkqVGtGyu4WHsK7ZfaaGjhPHqaAv4kbjHsAGdfx2txfsXZa/XlOXphWwPx
         MziG2t67omAe/D09Tg0QHcVxlDi1u4uGlFc4F9McBSJtJJhftUNaw6ER42XjSKdPbjU5
         9Jv1QqCLzlUgRzppscsNgkF8tGKPnJsPHspy8oiSenPbmHxUYI92awr7u/LIwLbdSi0/
         XBYrPleU4irFBuBUkc82yTSSuyEFHFtpxJRjSDPciiQ7UOdBf8HsQvQDjMXeuq7bcJHZ
         9Z7g==
X-Gm-Message-State: APjAAAW1cwVBhxxNMorRs+JmixCM4/hPcjWNVXy5QTwcRsNRvLn1RN0W
        6/09oZHljhW15ajVDkotc0QTB8pJJ98E2N/1/vA=
X-Google-Smtp-Source: APXvYqwUse6tFuqhH0U4m98RAEPjXI9vDzBPZjzhFMFp+HTD3Raqj6PYbwedbk/NyALcNXsEokeqZLTv64GdQwfzlzc=
X-Received: by 2002:a6b:b213:: with SMTP id b19mr5724302iof.58.1568468854433;
 Sat, 14 Sep 2019 06:47:34 -0700 (PDT)
MIME-Version: 1.0
References: <20190913153714.30980-1-aford173@gmail.com> <20190913153714.30980-2-aford173@gmail.com>
 <40FEEAC9-8F19-466F-83C3-C8F0142D44B7@goldelico.com>
In-Reply-To: <40FEEAC9-8F19-466F-83C3-C8F0142D44B7@goldelico.com>
From:   Adam Ford <aford173@gmail.com>
Date:   Sat, 14 Sep 2019 08:47:23 -0500
Message-ID: <CAHCN7xLVFP23Rt5tpTwN+LGmJr3vC0_v7pfGVdDYj=PSHFGvgA@mail.gmail.com>
Subject: Re: [RFC v2 2/2] ARM: omap3: Consolidate thermal references to common omap3
To:     "H. Nikolaus Schaller" <hns@goldelico.com>
Cc:     Linux-OMAP <linux-omap@vger.kernel.org>,
        Adam Ford <adam.ford@logicpd.com>, Nishanth Menon <nm@ti.com>,
        =?UTF-8?Q?Beno=C3=AEt_Cousson?= <bcousson@baylibre.com>,
        Tony Lindgren <tony@atomide.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Sat, Sep 14, 2019 at 4:25 AM H. Nikolaus Schaller <hns@goldelico.com> wrote:
>
>
> > Am 13.09.2019 um 17:37 schrieb Adam Ford <aford173@gmail.com>:
> >
> > Because the omap34xx, omap36xx and am3517 SoC's have the same
> > thermal junction limits, there is no need to duplicate the entry
> > multiple times.
> >
> > This patch removes the thermal references from omap36xx and
> > omap34xx and pushes it into the common omap3.dtsi file with
> > the added benefit of enabling the thermal info on the AM3517.
> >
> > Signed-off-by: Adam Ford <aford173@gmail.com>

Disregard this patch.  I'll drop it based on Nikolaus' comments below.

> > ---
> > V2:   Add node name for cpu and add cooling-cells entry
> >
> > diff --git a/arch/arm/boot/dts/omap3.dtsi b/arch/arm/boot/dts/omap3.dtsi
> > index 4043ecb38016..84704eb3b604 100644
> > --- a/arch/arm/boot/dts/omap3.dtsi
> > +++ b/arch/arm/boot/dts/omap3.dtsi
> > @@ -32,7 +32,7 @@
> >               #address-cells = <1>;
> >               #size-cells = <0>;
> >
> > -             cpu@0 {
> > +             cpu: cpu@0 {
> >                       compatible = "arm,cortex-a8";
> >                       device_type = "cpu";
> >                       reg = <0x0>;
> > @@ -41,9 +41,14 @@
> >                       clock-names = "cpu";
> >
> >                       clock-latency = <300000>; /* From omap-cpufreq driver */
> > +                     #cooling-cells = <2>;
> >               };
> >       };
>
> Looks ok.
>
> >
> > +     thermal_zones: thermal-zones {
> > +             #include "omap3-cpu-thermal.dtsi"
> > +     };
> > +
>
> I have observed one compile issue: we also include this indirectly by am3517.dtsi
> and the included code refers to <&bandgap 0> but there is no bandgap definition in am3517.dtsi
>
> Therefore I studied the am35x TRM (SPRUGR0C) and compared to the am/dm37x TRM (SPRUGN4M).
>
> But I can't find a bandgap temperature sensor with ADC like it is described in
> "13.4.6 Band Gap Voltage and Temperature Sensor" for the am/dm37x. Only
> "BANDGAP Logic" exists in both and both have the CM_FCLKEN3_CORE but with
> different meaning of bit 0.

I didn't read the technical details, I just read there was a bandgap
logic, so I assumed it existed.

>
> There is also no description of an CONTROL_TEMP_SENSOR (0x48002524) register for am35x.
> (note: the register is also documented for omap3530).

Thanks for looking into this.

>
> So this might mean that the am35x does not have this feature unless TI simply
> did not document it because the chip is specified for a single OPP only where it
> make no sense to monitor the temperature.
>
> We can find out only by looking at 0x48002524 if there is an undocumented
> bandgap converter.

I will try to read this register when I have some time, but I have to
watch Chelsea FC play in 15 minutes.  ;-)

>
> Which means we probably can't make thermal throttling work for it. And even
> if the bandgap sensor exists we are lacking an value -> celsius table.

I think it's probably best to abandon this patch, per my comment based
on all your comments.

>
>
> >       pmu@54000000 {
> >               compatible = "arm,cortex-a8-pmu";
> >               reg = <0x54000000 0x800000>;
> > diff --git a/arch/arm/boot/dts/omap34xx.dtsi b/arch/arm/boot/dts/omap34xx.dtsi
> > index f572a477f74c..b80378d6e5c1 100644
> > --- a/arch/arm/boot/dts/omap34xx.dtsi
> > +++ b/arch/arm/boot/dts/omap34xx.dtsi
> > @@ -101,10 +101,6 @@
> >                       };
> >               };
> >       };
> > -
> > -     thermal_zones: thermal-zones {
> > -             #include "omap3-cpu-thermal.dtsi"
> > -     };
> > };
> >
> > &ssi {
> > diff --git a/arch/arm/boot/dts/omap36xx.dtsi b/arch/arm/boot/dts/omap36xx.dtsi
> > index 6fb23ada1f64..ff2dca63a04e 100644
> > --- a/arch/arm/boot/dts/omap36xx.dtsi
> > +++ b/arch/arm/boot/dts/omap36xx.dtsi
> > @@ -140,10 +140,6 @@
> >                       };
> >               };
> >       };
> > -
> > -     thermal_zones: thermal-zones {
> > -             #include "omap3-cpu-thermal.dtsi"
> > -     };
> > };
>
> So if we have to exclude the am3517 we can not apply the rearrangement part
> of this patch.
>
> I'd suggest to move the cpu: cpu@0 and #cooling-cells into 1/2 (also to make it
> compile stand-alone). And have the consolidation separately - if we can fix the
> am3517 bandgap sensor issue.

I'll drop this, and leave everything in the omap3-cpu-thermal file and
let omap34xx and omap36xx point to them as we do now.

>
> >
> > /* OMAP3630 needs dss_96m_fck for VENC */
> > --
> > 2.17.1
> >
>
> Tested-by: H. Nikolaus Schaller <hns@goldelico.com> # on GTA04A5 with dm3730cbp100
>
