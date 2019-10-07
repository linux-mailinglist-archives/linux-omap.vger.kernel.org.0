Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E2A2ECEA8E
	for <lists+linux-omap@lfdr.de>; Mon,  7 Oct 2019 19:25:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728079AbfJGRZh (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 7 Oct 2019 13:25:37 -0400
Received: from mail-io1-f66.google.com ([209.85.166.66]:34154 "EHLO
        mail-io1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727801AbfJGRZh (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 7 Oct 2019 13:25:37 -0400
Received: by mail-io1-f66.google.com with SMTP id q1so30458284ion.1;
        Mon, 07 Oct 2019 10:25:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=v8GbURTQ5kdgbebuDkbzPlB7OzPhXL0GFyIKS4YdnZU=;
        b=le+N9z08q79azfCOVJdc9z1QdvalPb9h937TALRUb3H4Gd4yQ2TmrHLXaqDCKLjvtY
         TLgs8FSJlsRLFgPQh9wq8rO6Vc2PChYn1QgjB5455/VJfXVmwcrj/1OTKHFmRESBoL6l
         QahzMEcNTuF765cbgcx0dtgdQpaHfDt3W4c9Jec5oshXveTuwlq1JsqFXYXR//UO/q5t
         tR/BVoFuV1vbe3tu5PmIpWfixdPzkjr1Kc+Hwu5GSGuMlhODtQzWzBwN9OzcC7i02khS
         /KQ06XnxnMPCTPfrl7Zz1Cqo2Gw0tzhhEEHGEsKv0KthrHtRMVafSzOjYBZFnq6U4eXv
         FNUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=v8GbURTQ5kdgbebuDkbzPlB7OzPhXL0GFyIKS4YdnZU=;
        b=fAvTQn4FtN7o05+C5qX654RpQc/XPBvhKHL1ZKO2camV6fGzWA0HxY6Ul4+LO6OrKY
         DgDLiEcHJd+RRttmiGxT7Kb9440oxJeAc3sS79QxrGBy8m1SJcFq3lIURM0ze1aGGO8h
         /STDsrOb7XKNVOoqNC9T/nYFOs7tIAoIS2c0M8J5U3cv0tknB1eRj92cvK2UDuOa8Xxs
         6XuUp1+xxM72ONwh37kJBKNbhwUZ+eYeoiTyMnt3T1SG6pL6TYECcPmAuEJ7l7c4SiXu
         Ii+2VhIbmr5oqp2IAikn9vVQ0NZirS4/WW8P8mcOKz8nncMA8qbIZVdkIJ2dIV2WaCLj
         qlhQ==
X-Gm-Message-State: APjAAAUi04xlFo5EHeaRUjSrIo/cz+1aXLoeT7rBpF7OHNk8reV0SzIb
        8uoiPxQXMvm4e+1LGqroguqdXEjMXMcKUoguIWA=
X-Google-Smtp-Source: APXvYqzASFc4R1YX0AJlNFxR09QU4oNFgZ9ZuOBN9cK3CDNH1iNcqCOebu21rOgsakOg9FZpjtB2B3SB25ibSz6Kgso=
X-Received: by 2002:a5d:9c4c:: with SMTP id 12mr24240780iof.276.1570469135904;
 Mon, 07 Oct 2019 10:25:35 -0700 (PDT)
MIME-Version: 1.0
References: <20190913153714.30980-1-aford173@gmail.com> <B710D701-6311-4344-BF4E-F39157BBF2BD@goldelico.com>
 <CAHCN7xKU1v-BFkwiuZQx82+Cmdgj_1CH1j51bN0TaaduWcu8rQ@mail.gmail.com>
 <97204F98-FA33-4EBA-80AC-2FB3A6E78B2B@goldelico.com> <CAHCN7xJus=Unsm5rvgtccM9jpdiwGnJXrfjhavwkoswGbNd7qw@mail.gmail.com>
 <CAHCN7x+=O6f4Q0ps1d5KA+-E9L-8wr5B9XggzurJWtEnxEj7yg@mail.gmail.com> <FD6FED45-EF20-49D8-A2B2-012FB314DCC6@goldelico.com>
In-Reply-To: <FD6FED45-EF20-49D8-A2B2-012FB314DCC6@goldelico.com>
From:   Adam Ford <aford173@gmail.com>
Date:   Mon, 7 Oct 2019 12:25:24 -0500
Message-ID: <CAHCN7xLN+52ZW6tzCQPDvwqrdgaQaMrkhPFPotYDr7RdNwqeNA@mail.gmail.com>
Subject: Re: [RFC v2 1/2] ARM: dts: omap3: Add cpu trips and cooling map for
 omap3 family
To:     "H. Nikolaus Schaller" <hns@goldelico.com>
Cc:     Linux-OMAP <linux-omap@vger.kernel.org>,
        Adam Ford <adam.ford@logicpd.com>, Nishanth Menon <nm@ti.com>,
        =?UTF-8?Q?Beno=C3=AEt_Cousson?= <bcousson@baylibre.com>,
        Tony Lindgren <tony@atomide.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Grazvydas Ignotas <notasas@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Mon, Oct 7, 2019 at 10:45 AM H. Nikolaus Schaller <hns@goldelico.com> wr=
ote:
>
>
> > Am 07.10.2019 um 17:11 schrieb Adam Ford <aford173@gmail.com>:
> >
> > On Sat, Sep 14, 2019 at 11:12 AM Adam Ford <aford173@gmail.com> wrote:
> >>
> >> On Sat, Sep 14, 2019 at 9:38 AM H. Nikolaus Schaller <hns@goldelico.co=
m> wrote:
> >>>
> >>>
> >>>> Am 14.09.2019 um 15:42 schrieb Adam Ford <aford173@gmail.com>:
> >>>>
> >>>> On Sat, Sep 14, 2019 at 4:20 AM H. Nikolaus Schaller <hns@goldelico.=
com> wrote:
> >>>>>
> >>>>>
> >>>>>> Am 13.09.2019 um 17:37 schrieb Adam Ford <aford173@gmail.com>:
> >>>>>>
> >>>>>> The OMAP3530, AM3517 and DM3730 all show thresholds of 90C and 105=
C
> >>>>>> depending on commercial or industrial temperature ratings.  This
> >>>>>> patch expands the thermal information to the limits of 90 and 105
> >>>>>> for alert and critical.
> >>>>>>
> >
> > Tom / anyone from TI,
> >
> > I am going to rebase this patch from the current 5.4-RC branch, remove
> > the AM3517 references, and leave the throttling only applicable to
> > omap34xx and 36xx (like it is now), and remove the RFC.  Before I do
> > that, I was hoping for some feedback on whether or not there is a
> > reason to not do this while acknowledging the thermal sensor isn't
> > very accurate.
>
> I wonder if there is a more precise definition what "isn't very accurate"
> means?

That's what I was trying to get by asking TI for feedback.

>
> Is it just because the TI_BANDGAP_FEATURE_UNRELIABLE bit is set in
> the driver and we assume that it is right?

The bandgap sensor is disabled by default and, when enabled, it throws
a comment saying 'You've been warned' so I mostly want to acknowledge
that in the patch.

>
> Of course the "junction temperature" (TJ) is not well defined (at which
> edge? in which area?) and the bandgap sensor can only report a single poi=
nt
> of the die. So e.g. the GPU or the NEON unit may be hotter or cooler.

I look forward to running the GPU again.  ;-)

>
> And, the bandgap sensor + ADC is unlikely to be well calibrated to
> 0.1=C2=B0C precision.
>
> But in my experiments there seems to be not much noise and values rise
> or fall monotonic according to expectations of processor load.
>
> So a report of 90=C2=B0C may not be exactly 90=C2=B0C and some parts of t=
he SoC
> may be hotter.
>
> I would also assume that the TJ limits of 90=C2=B0C have some safety marg=
in
> but there seems to be no information in the data sheet.
>
> So, IMHO an "unreliable" bandgap sensor is better than no sensor and
> no trips / cooling maps.

I completely agree.

>
> One more thing is with the omap3 bandgap sensor (driver?). It appears to
> report the value of the previous measurement. So unless it is regularily
> polled (like cpufreq seems to do) it will report outdated values. The
> first read hours after boot may report the value during probe while booti=
ng.
>
> This is also a source of missing accuracy of course. But I haven't
> investigated this (can only be tested if thermal management is turned
> off) because I think it has no practical influence if cpufreq is polling.
>
> >
> > Does anyone have any objections to this?
> >
> > Other than the omap mailing list, are there other lists that should be =
CC'd?
> >
> > adam
> >
> >>>>>> For boards who never use industrial temperatures, these can be
> >>>>>> changed on their respective device trees with something like:
> >>>>>>
> >>>>>> &cpu_alert0 {
> >>>>>>     temperature =3D <85000>; /* millicelsius */
> >>>>>> };
> >>>>>>
> >>>>>> &cpu_crit {
> >>>>>>     temperature =3D <90000>; /* millicelsius */
> >>>>>> };
> >>>>>>
> >>>>>> Signed-off-by: Adam Ford <aford173@gmail.com>
> >>>>>> ---
> >>>>>> V2:  Change the CPU reference to &cpu instead of &cpu0
> >>>>>>
> >>>>>> diff --git a/arch/arm/boot/dts/omap3-cpu-thermal.dtsi b/arch/arm/b=
oot/dts/omap3-cpu-thermal.dtsi
> >>>>>> index 235ecfd61e2d..dfbd0cb0b00b 100644
> >>>>>> --- a/arch/arm/boot/dts/omap3-cpu-thermal.dtsi
> >>>>>> +++ b/arch/arm/boot/dts/omap3-cpu-thermal.dtsi
> >>>>>> @@ -17,4 +17,25 @@ cpu_thermal: cpu_thermal {
> >>>>>>
> >>>>>>                     /* sensor       ID */
> >>>>>>     thermal-sensors =3D <&bandgap     0>;
> >>>>>> +
> >>>>>> +     cpu_trips: trips {
> >>>>>> +             cpu_alert0: cpu_alert {
> >>>>>> +                     temperature =3D <90000>; /* millicelsius */
> >>>>>> +                     hysteresis =3D <2000>; /* millicelsius */
> >>>>>> +                     type =3D "passive";
> >>>>>> +             };
> >>>>>> +             cpu_crit: cpu_crit {
> >>>>>> +                     temperature =3D <105000>; /* millicelsius */
> >>>>>> +                     hysteresis =3D <2000>; /* millicelsius */
> >>>>>> +                     type =3D "critical";
> >>>>>> +             };
> >>>>>> +     };
> >>>>>> +
> >>>>>> +     cpu_cooling_maps: cooling-maps {
> >>>>>> +             map0 {
> >>>>>> +                     trip =3D <&cpu_alert0>;
> >>>>>> +                     cooling-device =3D
> >>>>>> +                             <&cpu THERMAL_NO_LIMIT THERMAL_NO_LI=
MIT>;
> >>>>>> +             };
> >>>>>> +     };
> >>>>>> };
> >>>>>> --
> >>>>>> 2.17.1
> >>>>>>
> >>>>>
> >>>>> Here is my test log (GTA04A5 with DM3730CBP100).
> >>>>> "high-load" script is driving the NEON to full power
> >>>>> and would report calculation errors.
> >>>>>
> >>>>> There is no noise visible in the bandgap sensor data
> >>>>> induced by power supply fluctuations (log shows system
> >>>>> voltage while charging).
> >>>>>
> >>>>
> >>>> Great data!
> >>>>
> >>>>> root@letux:~# ./high-load -n2
> >>>>> 100% load stress test for 1 cores running ./neon_loop2
> >>>>> Sat Sep 14 09:05:50 UTC 2019 65=C2=B0 4111mV 1000MHz
> >>>>> Sat Sep 14 09:05:50 UTC 2019 67=C2=B0 4005mV 1000MHz
> >>>>> Sat Sep 14 09:05:52 UTC 2019 68=C2=B0 4000mV 1000MHz
> >>>>> Sat Sep 14 09:05:53 UTC 2019 68=C2=B0 4000mV 1000MHz
> >>>>> Sat Sep 14 09:05:55 UTC 2019 72=C2=B0 3976mV 1000MHz
> >>>>> Sat Sep 14 09:05:56 UTC 2019 72=C2=B0 4023mV 1000MHz
> >>>>> Sat Sep 14 09:05:57 UTC 2019 72=C2=B0 3900mV 1000MHz
> >>>>> Sat Sep 14 09:05:59 UTC 2019 73=C2=B0 4029mV 1000MHz
> >>>>> Sat Sep 14 09:06:00 UTC 2019 73=C2=B0 3988mV 1000MHz
> >>>>> Sat Sep 14 09:06:01 UTC 2019 73=C2=B0 4005mV 1000MHz
> >>>>> Sat Sep 14 09:06:03 UTC 2019 73=C2=B0 4011mV 1000MHz
> >>>>> Sat Sep 14 09:06:04 UTC 2019 73=C2=B0 4117mV 1000MHz
> >>>>> Sat Sep 14 09:06:06 UTC 2019 73=C2=B0 4005mV 1000MHz
> >>>>> Sat Sep 14 09:06:07 UTC 2019 75=C2=B0 3994mV 1000MHz
> >>>>> Sat Sep 14 09:06:08 UTC 2019 75=C2=B0 3970mV 1000MHz
> >>>>> Sat Sep 14 09:06:09 UTC 2019 75=C2=B0 4046mV 1000MHz
> >>>>> Sat Sep 14 09:06:11 UTC 2019 75=C2=B0 4005mV 1000MHz
> >>>>> Sat Sep 14 09:06:12 UTC 2019 75=C2=B0 4023mV 1000MHz
> >>>>> Sat Sep 14 09:06:14 UTC 2019 75=C2=B0 3970mV 1000MHz
> >>>>> Sat Sep 14 09:06:15 UTC 2019 75=C2=B0 4011mV 1000MHz
> >>>>> Sat Sep 14 09:06:16 UTC 2019 77=C2=B0 4017mV 1000MHz
> >>>>> Sat Sep 14 09:06:18 UTC 2019 77=C2=B0 3994mV 1000MHz
> >>>>> Sat Sep 14 09:06:19 UTC 2019 77=C2=B0 3994mV 1000MHz
> >>>>> Sat Sep 14 09:06:20 UTC 2019 77=C2=B0 3988mV 1000MHz
> >>>>> Sat Sep 14 09:06:22 UTC 2019 77=C2=B0 4023mV 1000MHz
> >>>>> Sat Sep 14 09:06:23 UTC 2019 77=C2=B0 4023mV 1000MHz
> >>>>> Sat Sep 14 09:06:24 UTC 2019 78=C2=B0 4005mV 1000MHz
> >>>>> Sat Sep 14 09:06:26 UTC 2019 78=C2=B0 4105mV 1000MHz
> >>>>> Sat Sep 14 09:06:27 UTC 2019 78=C2=B0 4011mV 1000MHz
> >>>>> Sat Sep 14 09:06:28 UTC 2019 78=C2=B0 3994mV 1000MHz
> >>>>> Sat Sep 14 09:06:30 UTC 2019 78=C2=B0 4123mV 1000MHz
> >>>>> ...
> >>>>> Sat Sep 14 09:09:57 UTC 2019 88=C2=B0 4082mV 1000MHz
> >>>>> Sat Sep 14 09:09:59 UTC 2019 88=C2=B0 4164mV 1000MHz
> >>>>> Sat Sep 14 09:10:00 UTC 2019 88=C2=B0 4058mV 1000MHz
> >>>>> Sat Sep 14 09:10:01 UTC 2019 88=C2=B0 4058mV 1000MHz
> >>>>> Sat Sep 14 09:10:03 UTC 2019 88=C2=B0 4082mV 1000MHz
> >>>>> Sat Sep 14 09:10:04 UTC 2019 88=C2=B0 4058mV 1000MHz
> >>>>> Sat Sep 14 09:10:06 UTC 2019 88=C2=B0 4146mV 1000MHz
> >>>>> Sat Sep 14 09:10:07 UTC 2019 88=C2=B0 4041mV 1000MHz
> >>>>> Sat Sep 14 09:10:08 UTC 2019 88=C2=B0 4035mV 1000MHz
> >>>>> Sat Sep 14 09:10:10 UTC 2019 88=C2=B0 4052mV 1000MHz
> >>>>> Sat Sep 14 09:10:11 UTC 2019 88=C2=B0 4087mV 1000MHz
> >>>>> Sat Sep 14 09:10:12 UTC 2019 88=C2=B0 4152mV 1000MHz
> >>>>> Sat Sep 14 09:10:14 UTC 2019 88=C2=B0 4070mV 1000MHz
> >>>>> Sat Sep 14 09:10:15 UTC 2019 88=C2=B0 4064mV 1000MHz
> >>>>> Sat Sep 14 09:10:17 UTC 2019 88=C2=B0 4170mV 1000MHz
> >>>>> Sat Sep 14 09:10:18 UTC 2019 88=C2=B0 4058mV 1000MHz
> >>>>> Sat Sep 14 09:10:19 UTC 2019 88=C2=B0 4187mV 1000MHz
> >>>>> Sat Sep 14 09:10:21 UTC 2019 88=C2=B0 4093mV 1000MHz
> >>>>> Sat Sep 14 09:10:22 UTC 2019 88=C2=B0 4087mV 1000MHz
> >>>>> Sat Sep 14 09:10:23 UTC 2019 90=C2=B0 4070mV 1000MHz
> >>>>
> >>>> Should we be a little more conservative?  Without knowing the
> >>>> accuracy, i believe we do not want to run at 800 or 1GHz at 90C, so =
if
> >>>> we made this value 89 instead of 90, we would throttle a little more
> >>>> conservatively.
> >>>
> >>> Well, the OMAP5 also defines exactly 100=C2=B0C in the device tree.
> >>>
> >>> I would assume that the badgap sensor accuracy is so that it
> >>> never reports less than the real temperature. So if we
> >>> throttle at reported 90=C2=B0 TJ is likely lower.
> >>>
> >>>>> Sat Sep 14 09:10:25 UTC 2019 88=C2=B0 4123mV 800MHz
> >>>>> Sat Sep 14 09:10:26 UTC 2019 88=C2=B0 4064mV 1000MHz
> >>>>> Sat Sep 14 09:10:28 UTC 2019 90=C2=B0 4058mV 1000MHz
> >>>>
> >>>> Again here, I interpret the data sheet correctly, we're technically =
out of spec
> >>>
> >>> I read the data sheet as if 90=C2=B0C at OPP1G is still within spec.
> >>> 91 would be obviously outside (if bandgap sensor is precise).
> >>>
> >>>>
> >>>>> Sat Sep 14 09:10:29 UTC 2019 88=C2=B0 4076mV 1000MHz
> >>>>> Sat Sep 14 09:10:30 UTC 2019 88=C2=B0 4064mV 1000MHz
> >>>>> Sat Sep 14 09:10:32 UTC 2019 88=C2=B0 4117mV 1000MHz
> >>>>> Sat Sep 14 09:10:33 UTC 2019 88=C2=B0 4105mV 800MHz
> >>>>> Sat Sep 14 09:10:34 UTC 2019 88=C2=B0 4070mV 1000MHz
> >>>>> Sat Sep 14 09:10:36 UTC 2019 88=C2=B0 4076mV 1000MHz
> >>>>> Sat Sep 14 09:10:37 UTC 2019 88=C2=B0 4087mV 1000MHz
> >>>>> Sat Sep 14 09:10:39 UTC 2019 88=C2=B0 4017mV 1000MHz
> >>>>> Sat Sep 14 09:10:40 UTC 2019 88=C2=B0 4093mV 1000MHz
> >>>>> Sat Sep 14 09:10:41 UTC 2019 88=C2=B0 4058mV 800MHz
> >>>>> Sat Sep 14 09:10:42 UTC 2019 88=C2=B0 4035mV 1000MHz
> >>>>> Sat Sep 14 09:10:44 UTC 2019 90=C2=B0 4058mV 1000MHz
> >>>>> Sat Sep 14 09:10:45 UTC 2019 88=C2=B0 4064mV 1000MHz
> >>>>> Sat Sep 14 09:10:47 UTC 2019 88=C2=B0 4064mV 1000MHz
> >>>>> Sat Sep 14 09:10:48 UTC 2019 88=C2=B0 4029mV 1000MHz
> >>>>> Sat Sep 14 09:10:50 UTC 2019 90=C2=B0 4046mV 1000MHz
> >>>>> ^Ckill 4680
> >>>>> root@letux:~# cpufreq-info
> >>>>> cpufrequtils 008: cpufreq-info (C) Dominik Brodowski 2004-2009
> >>>>> Report errors and bugs to cpufreq@vger.kernel.org, please.
> >>>>> analyzing CPU 0:
> >>>>> driver: cpufreq-dt
> >>>>> CPUs which run at the same hardware frequency: 0
> >>>>> CPUs which need to have their frequency coordinated by software: 0
> >>>>> maximum transition latency: 300 us.
> >>>>> hardware limits: 300 MHz - 1000 MHz
> >>>>> available frequency steps: 300 MHz, 600 MHz, 800 MHz, 1000 MHz
> >>>>> available cpufreq governors: conservative, userspace, powersave, on=
demand, performance
> >>>>> current policy: frequency should be within 300 MHz and 1000 MHz.
> >>>>>                 The governor "ondemand" may decide which speed to u=
se
> >>>>>                 within this range.
> >>>>> current CPU frequency is 600 MHz (asserted by call to hardware).
> >>>>> cpufreq stats: 300 MHz:22.81%, 600 MHz:2.50%, 800 MHz:2.10%, 1000 M=
Hz:72.59%  (1563)
> >>>>> root@letux:~#
> >>>>>
> >>>>> So OPP is reduced if bandgap sensor reports >=3D 90=C2=B0C
> >>>>> which almost immediately makes the temperature
> >>>>> go down.
> >>>>>
> >>>>> No operational hickups were observed.
> >>>>>
> >>>>> Surface temperature of the PoP chip did rise to
> >>>>> approx. 53=C2=B0C during this test.
> >>>>>
> >>>>> Tested-by: H. Nikolaus Schaller <hns@goldelico.com> # on GTA04A5 wi=
th dm3730cbp100
> >>>>>
> >>>
> >>> BTW: this patch (set) is even independent of my 1GHz OPP patches.
> >>> Should also work with OPP-v1 definitions so that maintainers can
> >>> decide which one to apply first.
> >>
> >> If I am going integrate the cooling references into &cpu node, I'll
> >> probably base it on your work since the cooling isn't really that
> >> important until we exceed 800MHz.  If I do it on the current linux
> >> master or omap for-next branch, it may not apply cleanly.
> >>
> >>>
> >>> It is just more difficult to reach TJ of 90=C2=B0C without 1GHz.
> >>
> >> If it even does at all without external influences.
> >>
> >> adam
> >>>
> >>> BR,
> >>> Nikolaus
> >>>
>
