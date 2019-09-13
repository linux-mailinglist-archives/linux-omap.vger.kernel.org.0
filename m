Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 49CC0B20E8
	for <lists+linux-omap@lfdr.de>; Fri, 13 Sep 2019 15:49:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391628AbfIMN3K (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 13 Sep 2019 09:29:10 -0400
Received: from mail-oi1-f193.google.com ([209.85.167.193]:34751 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390039AbfIMN3K (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 13 Sep 2019 09:29:10 -0400
Received: by mail-oi1-f193.google.com with SMTP id 12so2433060oiq.1;
        Fri, 13 Sep 2019 06:29:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=0lGX0mmNDZtjfIYdJVFVZ2KgaUdbkDG/oNQ8h8bJVp4=;
        b=gqyk3KVolu2/yCOiY6n9Ki9WFErlDfsmsqFT0Ofq+qYRk9gO3ohIe+onGVwqfvFeyB
         htUeujC5taoBw5rJQJGaPkAtLVipNBwhLp9oirsrzQtDfQhuOIxdADa0bkIkP1fpr4vi
         cfU6UcPXa4mbcTwzkALUS8tHBCPaHWUflKbONdxn2AYqTiwx1Gs8pkg/jJW9SX0CV7yT
         d943ec9xci8tQ0flC16vfhqiCHidv+BiOdcHra2iLMuimq/0dPE5p4hng933YAvBx95D
         SG3cuwN8nDJDdTLnR36ZcHPMiEgTO56SrAUURv5r+8oI95IVeZIfIxNgtBK4FY3cAw9i
         PDGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=0lGX0mmNDZtjfIYdJVFVZ2KgaUdbkDG/oNQ8h8bJVp4=;
        b=Hy33pN1qALbjoX7CddFTOR8qDrHexZ7LBQVb2PeH5Os15SqEygDtwkrL/pMvhbg4Ma
         lG0UcTvjVVVJ67vlDUYTUZKgXxx/z8L7srpdCK9wUsJbG0kYl4lxTRQFTLSnxVe+m7eV
         xxeDvBQdg3FnVcg379RRM48Fn2VwHc11XQHl7lyGigJgx84PL5S6Uz6wLX9UkNulXpaP
         Goj8giN3DWQkYkRRiN/kMRXMLyVOg15tQsv0BCuWzM8kZ2+CIB3STEge2zm9L/VZmjHn
         K5uGiCi/zTe+h42Jbx1EtVtgJYlynuK6B1JaFPbwSEatU03o6mS32X65NKUVeDcPx9/B
         LpXw==
X-Gm-Message-State: APjAAAUIyH0RxsGZx24SG0FKCkurVJRyMeKGs/dFh7Z8NUH4sDKOvBTB
        /KBlaQnDyIc8GX3oDzJ3uzvsH8UZdUrOqOd1kpo=
X-Google-Smtp-Source: APXvYqzcUsPZy4tfC8E/8u9HzImkPf6/1yoMwlrKiuxXgU1w3PS3ACKepCTTb3MQo4IsOzwdn0gmoHpXTBIjKSB2X+w=
X-Received: by 2002:a02:3b21:: with SMTP id c33mr51100071jaa.54.1568381348870;
 Fri, 13 Sep 2019 06:29:08 -0700 (PDT)
MIME-Version: 1.0
References: <20190912183037.18449-1-aford173@gmail.com> <D4F7E03C-1880-45AC-8F7C-6C8A336E2A01@goldelico.com>
 <CAHCN7xK100mR=fNns3qdDKpOyWsTWXgDnnngQfQ_j8cB_SFfuA@mail.gmail.com>
In-Reply-To: <CAHCN7xK100mR=fNns3qdDKpOyWsTWXgDnnngQfQ_j8cB_SFfuA@mail.gmail.com>
From:   Adam Ford <aford173@gmail.com>
Date:   Fri, 13 Sep 2019 08:28:57 -0500
Message-ID: <CAHCN7xLx-XquVqEEqhEG5t7sQWMAWJqM9JH0pPowz+a374D2Dg@mail.gmail.com>
Subject: Re: [RFC] ARM: dts: omap36xx: Enable thermal throttling
To:     "H. Nikolaus Schaller" <hns@goldelico.com>
Cc:     Linux-OMAP <linux-omap@vger.kernel.org>,
        Tony Lindgren <tony@atomide.com>,
        =?UTF-8?Q?Andr=C3=A9_Roth?= <neolynx@gmail.com>,
        Discussions about the Letux Kernel 
        <letux-kernel@openphoenux.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Andreas Kemnade <andreas@kemnade.info>,
        Nishanth Menon <nm@ti.com>, Adam Ford <adam.ford@logicpd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Fri, Sep 13, 2019 at 6:07 AM Adam Ford <aford173@gmail.com> wrote:
>
> On Fri, Sep 13, 2019 at 1:56 AM H. Nikolaus Schaller <hns@goldelico.com> =
wrote:
> >
> > Hi Adam,
> >
> > > Am 12.09.2019 um 20:30 schrieb Adam Ford <aford173@gmail.com>:
> > >
> > > The thermal sensor in the omap3 family isn't accurate, but it's
> > > better than nothing.  The various OPP's enabled for the omap3630
> > > support up to OPP1G, however the datasheet for the DM3730 states
> > > that OPP130 and OPP1G are not available above TJ of 90C.
> >
> > We may have to add similar things for omap34xx as well. See
> > data sheet 3.3 Recommended Operating Conditions
> >
> > But when reading them they do not limit temperature but
> > number of operation hours of each OPP depending on temperature...
> > That is clearly beyond what a kernel can do (we would have to
> > have access to some NVRAM in the kernel counting hours).
> >
> > >
> > > This patch configures the thermal throttling to limit the
> > > operating points of the omap3630 to Only OPP50 and OPP100 if
> >
> > s/Only/only/
>
> I will fix when I do V2
> >
> > > the thermal sensor reads a value above 90C.
> > >
> > > Signed-off-by: Adam Ford <aford173@gmail.com>
> > >
> > > diff --git a/arch/arm/boot/dts/omap36xx.dtsi b/arch/arm/boot/dts/omap=
36xx.dtsi
> > > index 4bb4f534afe2..58b9d347019f 100644
> > > --- a/arch/arm/boot/dts/omap36xx.dtsi
> > > +++ b/arch/arm/boot/dts/omap36xx.dtsi
> > > @@ -25,6 +25,7 @@
> > >
> > >                       vbb-supply =3D <&abb_mpu_iva>;
> > >                       clock-latency =3D <300000>; /* From omap-cpufre=
q driver */
> > > +                     #cooling-cells =3D <2>;
> > >               };
> > >       };
> > >
> > > @@ -195,6 +196,31 @@
> > >       };
> > > };
> > >
> > > +&cpu_thermal {
> > > +     cpu_trips: trips {
> >
> > Yes, that is comparable to what I have seen in omap5 DT where I know
> > that thermal throttling works.
> >
> > > +             /* OPP130 and OPP1G are not available above TJ of 90C. =
*/
> > > +             cpu_alert0: cpu_alert {
> > > +                     temperature =3D <90000>; /* millicelsius */
> > > +                     hysteresis =3D <2000>; /* millicelsius */
> > > +                     type =3D "passive";
> > > +             };
> > > +
> > > +             cpu_crit: cpu_crit {
> > > +                     temperature =3D <125000>; /* millicelsius */
> >
> > Shouldn't this be 105=C2=B0C for all omap3 chips (industrial temperatur=
e range)?
>
> You are correct.  I forgot to change this when I did my copy-paste.
> >
> > > +                     hysteresis =3D <2000>; /* millicelsius */
> > > +                     type =3D "critical";
> > > +             };
> > > +     };
> > > +
> > > +     cpu_cooling_maps: cooling-maps {
> > > +             map0 {
> > > +                     trip =3D <&cpu_alert0>;
> > > +                     /* Only allow OPP50 and OPP100 */
> > > +                     cooling-device =3D <&cpu 0 1>;
> >
> > omap4-cpu-thermal.dtsi uses THERMAL_NO_LIMIT constants but I do not
> > understand their meaning (and how it relates to the opp list).
>
> I read through the documentation, but it wasn't completely clear to
> me. AFAICT, the numbers after &cpu represent the min and max index in
> the OPP table when the condition is hit.
> >
> > > +             };
> > > +     };
> >
> > Seems to make sense when comparing to omap4-cpu-thermal.dtsi...
> >
> > Maybe we can add the trip points to omap3-cpu-thermal.dtsi
> > because they seem to be the same for all omap3 variants and
> > just have a SoC variant specific cooling map for omap36xx.dtsi.
>
> The OPP's for OMAP3530 show that OPP5 and OPP6 are capable of
> operating at 105C.  AM3517 is a little different also, so I didn't
> want to make a generic omap3 throttling table.  Since my goal was to
> try to remove the need for the turbo option from the newly supported
> 1GHz omap3630/3730, I was hoping to get this pushed first.  From
> there, we can tweak the 34xx.dtsi and 3517.dtsi for their respective
> thermal information.
>
> >
> > > +};
> > > +
> > > /* OMAP3630 needs dss_96m_fck for VENC */
> > > &venc {
> > >       clocks =3D <&dss_tv_fck>, <&dss_96m_fck>;
> > > --
> > > 2.17.1
> > >
> >
> > The question is how we can test that. Heating up the omap36xx to 90=C2=
=B0C
> > or even 105=C2=B0C isn't that easy like with omap5...
> >
> > Maybe we can modify the millicelsius values for testing purposes to
> > something in reachable range, e.g. 60=C2=B0C and 70=C2=B0C and watch wh=
at happens?
>
> I have access to a thermal chamber at work, but the guy who knows how
> to use it is out for the rest of the week.  My plan was do as you
> suggested and change the milicelsius values, but I wanted to get some
> buy-in from TI people and/or Tony.  This also means enabling the omap3
> thermal stuff which clearly throws a message that it's inaccurate.  I
> don't know how much it's inaccurate, so we may have to make the 90C
> value lower to compensate.

I set the alert to 60C then booted the system.  It initially read
58.6C, then I ran a benchmark to push the processor over 60C.
Unfortunately, it didn't appear to throttle like I expected.  I was
expecting it to only make 300 amd 600 MHz available.

cat /sys/devices/virtual/thermal/thermal_zone0/temp
58500

whetstone 200000
Loops: 200000, Iterations: 1, Duration: 31 sec.
C Converted Double Precision Whetstones: 645.2 MIPS

cat /sys/devices/virtual/thermal/thermal_zone0/temp
62000

cat /sys/devices/system/cpu/cpufreq/policy0/scaling_available_frequencies
300000 600000 800000

I am going to investigate how other processors do this.  I may have
the cpu reference wrong.

adam
>
> adam
> >
> > BR,
> > Nikolaus
> >
> >
> >
