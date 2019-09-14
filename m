Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 48347B2C2F
	for <lists+linux-omap@lfdr.de>; Sat, 14 Sep 2019 18:13:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727333AbfINQM7 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sat, 14 Sep 2019 12:12:59 -0400
Received: from mail-io1-f65.google.com ([209.85.166.65]:45171 "EHLO
        mail-io1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725805AbfINQM7 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sat, 14 Sep 2019 12:12:59 -0400
Received: by mail-io1-f65.google.com with SMTP id f12so69317861iog.12;
        Sat, 14 Sep 2019 09:12:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=EiXhZTeIYYdtFevXMKRxgXouAXGtj9y/Owz38LmsjU0=;
        b=Ip1+lHHQlw9cdMpbtw2qO/EYiF+b8v/fuib++FOfqML09QwGIqd4z6TzaUlr88xvYz
         hmtite/Lssl0ZkLjbjun4Ims73+HUp+Gpnn2EpfthkQWb4OV0FoFmIDU5+v/pr+bsfGi
         fsgSBUXRK/O3Zb/eX/6EFxvmssrNAmEf9i8GDFiCiKps2FELvXxuylpDpbhxjy754vRx
         FQ9F8eUV7FmitJFn7XkvdDAk01LLRpaOoDr62xtleYf1d/GLh7pCtOjUIROLHunYp5qO
         FG/yYccZXOS+aPura0jHqyqh+mBAAqb7XdMioevkP5w9Tr3x79NCY2ohwBwnO1pOvkxj
         /BpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=EiXhZTeIYYdtFevXMKRxgXouAXGtj9y/Owz38LmsjU0=;
        b=lblqRSkL7IThevHYAWeqzOvPIrGzA8p8igvQ/bFRWXvGRNhbKCZTHJk3Cjg58K8mR/
         cKMnJKb6UVketgUbjoyq9Uph7iPogO1LG7NHyQKNnCX1isX84k6vKLZKi+nOSc8/os3Z
         a2bz0BIqbAT4Bu8HopSycsAc3XMwnajc9y3zMfcemFrqAdt76pt6YmO+2qYtBzsG/WJq
         Nmt+ny7IhTIaMzRi5mvI76ctXykg1R9yTps1X1gxHBW469oqvHEqEeR70uRpVzkfVHj2
         evvoR6tN9II9nSUIZ//h6CVY5aXyjlHDCz9DgsCHdsF6SytLHnmlw5kqfBLr3OqrrcKb
         jStg==
X-Gm-Message-State: APjAAAWTbigyHibVjfnQYCcC/EiLBbfW6bkxLKnNfRFfRKKKcm5LPx6G
        amE2uOW5Y/Jx2PI4udGW5PEEimCORZVxJw7mdRw=
X-Google-Smtp-Source: APXvYqwy+oFyfIg1Wm6ELo1pHr0r6mXbyyAd6w0BY3UxHBssVAIKdFv3V/XtsKmTauyZrDwZViaGx67fpILE2G0SqEo=
X-Received: by 2002:a6b:c581:: with SMTP id v123mr6643959iof.158.1568477577026;
 Sat, 14 Sep 2019 09:12:57 -0700 (PDT)
MIME-Version: 1.0
References: <20190913153714.30980-1-aford173@gmail.com> <B710D701-6311-4344-BF4E-F39157BBF2BD@goldelico.com>
 <CAHCN7xKU1v-BFkwiuZQx82+Cmdgj_1CH1j51bN0TaaduWcu8rQ@mail.gmail.com> <97204F98-FA33-4EBA-80AC-2FB3A6E78B2B@goldelico.com>
In-Reply-To: <97204F98-FA33-4EBA-80AC-2FB3A6E78B2B@goldelico.com>
From:   Adam Ford <aford173@gmail.com>
Date:   Sat, 14 Sep 2019 11:12:45 -0500
Message-ID: <CAHCN7xJus=Unsm5rvgtccM9jpdiwGnJXrfjhavwkoswGbNd7qw@mail.gmail.com>
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

On Sat, Sep 14, 2019 at 9:38 AM H. Nikolaus Schaller <hns@goldelico.com> wr=
ote:
>
>
> > Am 14.09.2019 um 15:42 schrieb Adam Ford <aford173@gmail.com>:
> >
> > On Sat, Sep 14, 2019 at 4:20 AM H. Nikolaus Schaller <hns@goldelico.com=
> wrote:
> >>
> >>
> >>> Am 13.09.2019 um 17:37 schrieb Adam Ford <aford173@gmail.com>:
> >>>
> >>> The OMAP3530, AM3517 and DM3730 all show thresholds of 90C and 105C
> >>> depending on commercial or industrial temperature ratings.  This
> >>> patch expands the thermal information to the limits of 90 and 105
> >>> for alert and critical.
> >>>
> >>> For boards who never use industrial temperatures, these can be
> >>> changed on their respective device trees with something like:
> >>>
> >>> &cpu_alert0 {
> >>>      temperature =3D <85000>; /* millicelsius */
> >>> };
> >>>
> >>> &cpu_crit {
> >>>      temperature =3D <90000>; /* millicelsius */
> >>> };
> >>>
> >>> Signed-off-by: Adam Ford <aford173@gmail.com>
> >>> ---
> >>> V2:  Change the CPU reference to &cpu instead of &cpu0
> >>>
> >>> diff --git a/arch/arm/boot/dts/omap3-cpu-thermal.dtsi b/arch/arm/boot=
/dts/omap3-cpu-thermal.dtsi
> >>> index 235ecfd61e2d..dfbd0cb0b00b 100644
> >>> --- a/arch/arm/boot/dts/omap3-cpu-thermal.dtsi
> >>> +++ b/arch/arm/boot/dts/omap3-cpu-thermal.dtsi
> >>> @@ -17,4 +17,25 @@ cpu_thermal: cpu_thermal {
> >>>
> >>>                      /* sensor       ID */
> >>>      thermal-sensors =3D <&bandgap     0>;
> >>> +
> >>> +     cpu_trips: trips {
> >>> +             cpu_alert0: cpu_alert {
> >>> +                     temperature =3D <90000>; /* millicelsius */
> >>> +                     hysteresis =3D <2000>; /* millicelsius */
> >>> +                     type =3D "passive";
> >>> +             };
> >>> +             cpu_crit: cpu_crit {
> >>> +                     temperature =3D <105000>; /* millicelsius */
> >>> +                     hysteresis =3D <2000>; /* millicelsius */
> >>> +                     type =3D "critical";
> >>> +             };
> >>> +     };
> >>> +
> >>> +     cpu_cooling_maps: cooling-maps {
> >>> +             map0 {
> >>> +                     trip =3D <&cpu_alert0>;
> >>> +                     cooling-device =3D
> >>> +                             <&cpu THERMAL_NO_LIMIT THERMAL_NO_LIMIT=
>;
> >>> +             };
> >>> +     };
> >>> };
> >>> --
> >>> 2.17.1
> >>>
> >>
> >> Here is my test log (GTA04A5 with DM3730CBP100).
> >> "high-load" script is driving the NEON to full power
> >> and would report calculation errors.
> >>
> >> There is no noise visible in the bandgap sensor data
> >> induced by power supply fluctuations (log shows system
> >> voltage while charging).
> >>
> >
> > Great data!
> >
> >> root@letux:~# ./high-load -n2
> >> 100% load stress test for 1 cores running ./neon_loop2
> >> Sat Sep 14 09:05:50 UTC 2019 65=C2=B0 4111mV 1000MHz
> >> Sat Sep 14 09:05:50 UTC 2019 67=C2=B0 4005mV 1000MHz
> >> Sat Sep 14 09:05:52 UTC 2019 68=C2=B0 4000mV 1000MHz
> >> Sat Sep 14 09:05:53 UTC 2019 68=C2=B0 4000mV 1000MHz
> >> Sat Sep 14 09:05:55 UTC 2019 72=C2=B0 3976mV 1000MHz
> >> Sat Sep 14 09:05:56 UTC 2019 72=C2=B0 4023mV 1000MHz
> >> Sat Sep 14 09:05:57 UTC 2019 72=C2=B0 3900mV 1000MHz
> >> Sat Sep 14 09:05:59 UTC 2019 73=C2=B0 4029mV 1000MHz
> >> Sat Sep 14 09:06:00 UTC 2019 73=C2=B0 3988mV 1000MHz
> >> Sat Sep 14 09:06:01 UTC 2019 73=C2=B0 4005mV 1000MHz
> >> Sat Sep 14 09:06:03 UTC 2019 73=C2=B0 4011mV 1000MHz
> >> Sat Sep 14 09:06:04 UTC 2019 73=C2=B0 4117mV 1000MHz
> >> Sat Sep 14 09:06:06 UTC 2019 73=C2=B0 4005mV 1000MHz
> >> Sat Sep 14 09:06:07 UTC 2019 75=C2=B0 3994mV 1000MHz
> >> Sat Sep 14 09:06:08 UTC 2019 75=C2=B0 3970mV 1000MHz
> >> Sat Sep 14 09:06:09 UTC 2019 75=C2=B0 4046mV 1000MHz
> >> Sat Sep 14 09:06:11 UTC 2019 75=C2=B0 4005mV 1000MHz
> >> Sat Sep 14 09:06:12 UTC 2019 75=C2=B0 4023mV 1000MHz
> >> Sat Sep 14 09:06:14 UTC 2019 75=C2=B0 3970mV 1000MHz
> >> Sat Sep 14 09:06:15 UTC 2019 75=C2=B0 4011mV 1000MHz
> >> Sat Sep 14 09:06:16 UTC 2019 77=C2=B0 4017mV 1000MHz
> >> Sat Sep 14 09:06:18 UTC 2019 77=C2=B0 3994mV 1000MHz
> >> Sat Sep 14 09:06:19 UTC 2019 77=C2=B0 3994mV 1000MHz
> >> Sat Sep 14 09:06:20 UTC 2019 77=C2=B0 3988mV 1000MHz
> >> Sat Sep 14 09:06:22 UTC 2019 77=C2=B0 4023mV 1000MHz
> >> Sat Sep 14 09:06:23 UTC 2019 77=C2=B0 4023mV 1000MHz
> >> Sat Sep 14 09:06:24 UTC 2019 78=C2=B0 4005mV 1000MHz
> >> Sat Sep 14 09:06:26 UTC 2019 78=C2=B0 4105mV 1000MHz
> >> Sat Sep 14 09:06:27 UTC 2019 78=C2=B0 4011mV 1000MHz
> >> Sat Sep 14 09:06:28 UTC 2019 78=C2=B0 3994mV 1000MHz
> >> Sat Sep 14 09:06:30 UTC 2019 78=C2=B0 4123mV 1000MHz
> >> ...
> >> Sat Sep 14 09:09:57 UTC 2019 88=C2=B0 4082mV 1000MHz
> >> Sat Sep 14 09:09:59 UTC 2019 88=C2=B0 4164mV 1000MHz
> >> Sat Sep 14 09:10:00 UTC 2019 88=C2=B0 4058mV 1000MHz
> >> Sat Sep 14 09:10:01 UTC 2019 88=C2=B0 4058mV 1000MHz
> >> Sat Sep 14 09:10:03 UTC 2019 88=C2=B0 4082mV 1000MHz
> >> Sat Sep 14 09:10:04 UTC 2019 88=C2=B0 4058mV 1000MHz
> >> Sat Sep 14 09:10:06 UTC 2019 88=C2=B0 4146mV 1000MHz
> >> Sat Sep 14 09:10:07 UTC 2019 88=C2=B0 4041mV 1000MHz
> >> Sat Sep 14 09:10:08 UTC 2019 88=C2=B0 4035mV 1000MHz
> >> Sat Sep 14 09:10:10 UTC 2019 88=C2=B0 4052mV 1000MHz
> >> Sat Sep 14 09:10:11 UTC 2019 88=C2=B0 4087mV 1000MHz
> >> Sat Sep 14 09:10:12 UTC 2019 88=C2=B0 4152mV 1000MHz
> >> Sat Sep 14 09:10:14 UTC 2019 88=C2=B0 4070mV 1000MHz
> >> Sat Sep 14 09:10:15 UTC 2019 88=C2=B0 4064mV 1000MHz
> >> Sat Sep 14 09:10:17 UTC 2019 88=C2=B0 4170mV 1000MHz
> >> Sat Sep 14 09:10:18 UTC 2019 88=C2=B0 4058mV 1000MHz
> >> Sat Sep 14 09:10:19 UTC 2019 88=C2=B0 4187mV 1000MHz
> >> Sat Sep 14 09:10:21 UTC 2019 88=C2=B0 4093mV 1000MHz
> >> Sat Sep 14 09:10:22 UTC 2019 88=C2=B0 4087mV 1000MHz
> >> Sat Sep 14 09:10:23 UTC 2019 90=C2=B0 4070mV 1000MHz
> >
> > Should we be a little more conservative?  Without knowing the
> > accuracy, i believe we do not want to run at 800 or 1GHz at 90C, so if
> > we made this value 89 instead of 90, we would throttle a little more
> > conservatively.
>
> Well, the OMAP5 also defines exactly 100=C2=B0C in the device tree.
>
> I would assume that the badgap sensor accuracy is so that it
> never reports less than the real temperature. So if we
> throttle at reported 90=C2=B0 TJ is likely lower.
>
> >> Sat Sep 14 09:10:25 UTC 2019 88=C2=B0 4123mV 800MHz
> >> Sat Sep 14 09:10:26 UTC 2019 88=C2=B0 4064mV 1000MHz
> >> Sat Sep 14 09:10:28 UTC 2019 90=C2=B0 4058mV 1000MHz
> >
> > Again here, I interpret the data sheet correctly, we're technically out=
 of spec
>
> I read the data sheet as if 90=C2=B0C at OPP1G is still within spec.
> 91 would be obviously outside (if bandgap sensor is precise).
>
> >
> >> Sat Sep 14 09:10:29 UTC 2019 88=C2=B0 4076mV 1000MHz
> >> Sat Sep 14 09:10:30 UTC 2019 88=C2=B0 4064mV 1000MHz
> >> Sat Sep 14 09:10:32 UTC 2019 88=C2=B0 4117mV 1000MHz
> >> Sat Sep 14 09:10:33 UTC 2019 88=C2=B0 4105mV 800MHz
> >> Sat Sep 14 09:10:34 UTC 2019 88=C2=B0 4070mV 1000MHz
> >> Sat Sep 14 09:10:36 UTC 2019 88=C2=B0 4076mV 1000MHz
> >> Sat Sep 14 09:10:37 UTC 2019 88=C2=B0 4087mV 1000MHz
> >> Sat Sep 14 09:10:39 UTC 2019 88=C2=B0 4017mV 1000MHz
> >> Sat Sep 14 09:10:40 UTC 2019 88=C2=B0 4093mV 1000MHz
> >> Sat Sep 14 09:10:41 UTC 2019 88=C2=B0 4058mV 800MHz
> >> Sat Sep 14 09:10:42 UTC 2019 88=C2=B0 4035mV 1000MHz
> >> Sat Sep 14 09:10:44 UTC 2019 90=C2=B0 4058mV 1000MHz
> >> Sat Sep 14 09:10:45 UTC 2019 88=C2=B0 4064mV 1000MHz
> >> Sat Sep 14 09:10:47 UTC 2019 88=C2=B0 4064mV 1000MHz
> >> Sat Sep 14 09:10:48 UTC 2019 88=C2=B0 4029mV 1000MHz
> >> Sat Sep 14 09:10:50 UTC 2019 90=C2=B0 4046mV 1000MHz
> >> ^Ckill 4680
> >> root@letux:~# cpufreq-info
> >> cpufrequtils 008: cpufreq-info (C) Dominik Brodowski 2004-2009
> >> Report errors and bugs to cpufreq@vger.kernel.org, please.
> >> analyzing CPU 0:
> >>  driver: cpufreq-dt
> >>  CPUs which run at the same hardware frequency: 0
> >>  CPUs which need to have their frequency coordinated by software: 0
> >>  maximum transition latency: 300 us.
> >>  hardware limits: 300 MHz - 1000 MHz
> >>  available frequency steps: 300 MHz, 600 MHz, 800 MHz, 1000 MHz
> >>  available cpufreq governors: conservative, userspace, powersave, onde=
mand, performance
> >>  current policy: frequency should be within 300 MHz and 1000 MHz.
> >>                  The governor "ondemand" may decide which speed to use
> >>                  within this range.
> >>  current CPU frequency is 600 MHz (asserted by call to hardware).
> >>  cpufreq stats: 300 MHz:22.81%, 600 MHz:2.50%, 800 MHz:2.10%, 1000 MHz=
:72.59%  (1563)
> >> root@letux:~#
> >>
> >> So OPP is reduced if bandgap sensor reports >=3D 90=C2=B0C
> >> which almost immediately makes the temperature
> >> go down.
> >>
> >> No operational hickups were observed.
> >>
> >> Surface temperature of the PoP chip did rise to
> >> approx. 53=C2=B0C during this test.
> >>
> >> Tested-by: H. Nikolaus Schaller <hns@goldelico.com> # on GTA04A5 with =
dm3730cbp100
> >>
>
> BTW: this patch (set) is even independent of my 1GHz OPP patches.
> Should also work with OPP-v1 definitions so that maintainers can
> decide which one to apply first.

If I am going integrate the cooling references into &cpu node, I'll
probably base it on your work since the cooling isn't really that
important until we exceed 800MHz.  If I do it on the current linux
master or omap for-next branch, it may not apply cleanly.

>
> It is just more difficult to reach TJ of 90=C2=B0C without 1GHz.

If it even does at all without external influences.

adam
>
> BR,
> Nikolaus
>
