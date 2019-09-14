Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CFB4BB2B6D
	for <lists+linux-omap@lfdr.de>; Sat, 14 Sep 2019 15:43:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730744AbfINNnF (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sat, 14 Sep 2019 09:43:05 -0400
Received: from mail-io1-f65.google.com ([209.85.166.65]:32891 "EHLO
        mail-io1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730739AbfINNnF (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sat, 14 Sep 2019 09:43:05 -0400
Received: by mail-io1-f65.google.com with SMTP id m11so68866790ioo.0;
        Sat, 14 Sep 2019 06:43:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=sEh+NFUnNzOqaKFuMPrw8vEceb15ckMMUWj1cxO8DnY=;
        b=opB9sFvXMk1XjoFYQETF/xvWc5mqOUqgN6nEixsszzEHVXhaDxsaODYGKBzi/nVDis
         zv8nCw5UesREoMH6KGk1K2Qdr3dQ9tqXaJGrhAIbaHZkoLTFOqHBA24VhJZDG53sr1X7
         SbZICE/OmhDtBtV457ZiOrvqzSuUgCpBpc3MfgCPYnrusfeTjU1WGNGul+CcGJJnraG6
         Bo4VvOd3cC6hm65OyAfyJa9mKKqKW+YlCtJmJhXa/ALvzWN/9w+AOGuF4DQchis+MiSA
         ORk9doq6Ov/ujJNaqncgm7mvs8XZO8HjQknSsD+nxA6pYhJjNyJGScoNkci/Nk2tPekb
         eDMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=sEh+NFUnNzOqaKFuMPrw8vEceb15ckMMUWj1cxO8DnY=;
        b=DOXRwriyJ7GrOnXbiosU7P9jecaeuBmC3AcoWTfJvynedhrJ6Klf6dBsmG/B4loK7O
         UOaTTDaGyXHBo96jKwcumzhj8fx4Kk8BrCtKmOQsIdOpsm6F5USN8ePsyyavqE5U2JJx
         Ax4RWCwpsHk2qvHHOrjHyR+iVEM/CgjmuWG3a477LBMgPP8OJO00+2m+18nYe4g1GOe6
         JZwK9NcqzFGhtlHon3zTrnd/pdUJb8AvAQuXvJZJZgJAcOFv3DtSPD4TH/k6ZsnjGOj9
         hA2AKRnTUNeKKGCIq3KM0PL60oeDmav2aoZcMWzaQUX/px0JIfNs2HfoGXWH0kB5I33U
         YCVQ==
X-Gm-Message-State: APjAAAUiuxWlexR7vf8mHEl5dtk7uhv0/5psoXYDcgdjGIV6FEzwl6zJ
        71eYWOLinriEybSo5YLoG/MW1CCleJnVX9BuWT0=
X-Google-Smtp-Source: APXvYqwxhh9fPPGVNC3Dq2cAkuGjs451BxDB8YGLbXfKkyUsXYj3pX1GkOzo1T3BlFKj9OGSsA/NZDawdz1A4LSOFCk=
X-Received: by 2002:a6b:cd81:: with SMTP id d123mr3490655iog.78.1568468583472;
 Sat, 14 Sep 2019 06:43:03 -0700 (PDT)
MIME-Version: 1.0
References: <20190913153714.30980-1-aford173@gmail.com> <B710D701-6311-4344-BF4E-F39157BBF2BD@goldelico.com>
In-Reply-To: <B710D701-6311-4344-BF4E-F39157BBF2BD@goldelico.com>
From:   Adam Ford <aford173@gmail.com>
Date:   Sat, 14 Sep 2019 08:42:51 -0500
Message-ID: <CAHCN7xKU1v-BFkwiuZQx82+Cmdgj_1CH1j51bN0TaaduWcu8rQ@mail.gmail.com>
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

On Sat, Sep 14, 2019 at 4:20 AM H. Nikolaus Schaller <hns@goldelico.com> wr=
ote:
>
>
> > Am 13.09.2019 um 17:37 schrieb Adam Ford <aford173@gmail.com>:
> >
> > The OMAP3530, AM3517 and DM3730 all show thresholds of 90C and 105C
> > depending on commercial or industrial temperature ratings.  This
> > patch expands the thermal information to the limits of 90 and 105
> > for alert and critical.
> >
> > For boards who never use industrial temperatures, these can be
> > changed on their respective device trees with something like:
> >
> > &cpu_alert0 {
> >       temperature =3D <85000>; /* millicelsius */
> > };
> >
> > &cpu_crit {
> >       temperature =3D <90000>; /* millicelsius */
> > };
> >
> > Signed-off-by: Adam Ford <aford173@gmail.com>
> > ---
> > V2:  Change the CPU reference to &cpu instead of &cpu0
> >
> > diff --git a/arch/arm/boot/dts/omap3-cpu-thermal.dtsi b/arch/arm/boot/d=
ts/omap3-cpu-thermal.dtsi
> > index 235ecfd61e2d..dfbd0cb0b00b 100644
> > --- a/arch/arm/boot/dts/omap3-cpu-thermal.dtsi
> > +++ b/arch/arm/boot/dts/omap3-cpu-thermal.dtsi
> > @@ -17,4 +17,25 @@ cpu_thermal: cpu_thermal {
> >
> >                       /* sensor       ID */
> >       thermal-sensors =3D <&bandgap     0>;
> > +
> > +     cpu_trips: trips {
> > +             cpu_alert0: cpu_alert {
> > +                     temperature =3D <90000>; /* millicelsius */
> > +                     hysteresis =3D <2000>; /* millicelsius */
> > +                     type =3D "passive";
> > +             };
> > +             cpu_crit: cpu_crit {
> > +                     temperature =3D <105000>; /* millicelsius */
> > +                     hysteresis =3D <2000>; /* millicelsius */
> > +                     type =3D "critical";
> > +             };
> > +     };
> > +
> > +     cpu_cooling_maps: cooling-maps {
> > +             map0 {
> > +                     trip =3D <&cpu_alert0>;
> > +                     cooling-device =3D
> > +                             <&cpu THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
> > +             };
> > +     };
> > };
> > --
> > 2.17.1
> >
>
> Here is my test log (GTA04A5 with DM3730CBP100).
> "high-load" script is driving the NEON to full power
> and would report calculation errors.
>
> There is no noise visible in the bandgap sensor data
> induced by power supply fluctuations (log shows system
> voltage while charging).
>

Great data!

> root@letux:~# ./high-load -n2
> 100% load stress test for 1 cores running ./neon_loop2
> Sat Sep 14 09:05:50 UTC 2019 65=C2=B0 4111mV 1000MHz
> Sat Sep 14 09:05:50 UTC 2019 67=C2=B0 4005mV 1000MHz
> Sat Sep 14 09:05:52 UTC 2019 68=C2=B0 4000mV 1000MHz
> Sat Sep 14 09:05:53 UTC 2019 68=C2=B0 4000mV 1000MHz
> Sat Sep 14 09:05:55 UTC 2019 72=C2=B0 3976mV 1000MHz
> Sat Sep 14 09:05:56 UTC 2019 72=C2=B0 4023mV 1000MHz
> Sat Sep 14 09:05:57 UTC 2019 72=C2=B0 3900mV 1000MHz
> Sat Sep 14 09:05:59 UTC 2019 73=C2=B0 4029mV 1000MHz
> Sat Sep 14 09:06:00 UTC 2019 73=C2=B0 3988mV 1000MHz
> Sat Sep 14 09:06:01 UTC 2019 73=C2=B0 4005mV 1000MHz
> Sat Sep 14 09:06:03 UTC 2019 73=C2=B0 4011mV 1000MHz
> Sat Sep 14 09:06:04 UTC 2019 73=C2=B0 4117mV 1000MHz
> Sat Sep 14 09:06:06 UTC 2019 73=C2=B0 4005mV 1000MHz
> Sat Sep 14 09:06:07 UTC 2019 75=C2=B0 3994mV 1000MHz
> Sat Sep 14 09:06:08 UTC 2019 75=C2=B0 3970mV 1000MHz
> Sat Sep 14 09:06:09 UTC 2019 75=C2=B0 4046mV 1000MHz
> Sat Sep 14 09:06:11 UTC 2019 75=C2=B0 4005mV 1000MHz
> Sat Sep 14 09:06:12 UTC 2019 75=C2=B0 4023mV 1000MHz
> Sat Sep 14 09:06:14 UTC 2019 75=C2=B0 3970mV 1000MHz
> Sat Sep 14 09:06:15 UTC 2019 75=C2=B0 4011mV 1000MHz
> Sat Sep 14 09:06:16 UTC 2019 77=C2=B0 4017mV 1000MHz
> Sat Sep 14 09:06:18 UTC 2019 77=C2=B0 3994mV 1000MHz
> Sat Sep 14 09:06:19 UTC 2019 77=C2=B0 3994mV 1000MHz
> Sat Sep 14 09:06:20 UTC 2019 77=C2=B0 3988mV 1000MHz
> Sat Sep 14 09:06:22 UTC 2019 77=C2=B0 4023mV 1000MHz
> Sat Sep 14 09:06:23 UTC 2019 77=C2=B0 4023mV 1000MHz
> Sat Sep 14 09:06:24 UTC 2019 78=C2=B0 4005mV 1000MHz
> Sat Sep 14 09:06:26 UTC 2019 78=C2=B0 4105mV 1000MHz
> Sat Sep 14 09:06:27 UTC 2019 78=C2=B0 4011mV 1000MHz
> Sat Sep 14 09:06:28 UTC 2019 78=C2=B0 3994mV 1000MHz
> Sat Sep 14 09:06:30 UTC 2019 78=C2=B0 4123mV 1000MHz
> ...
> Sat Sep 14 09:09:57 UTC 2019 88=C2=B0 4082mV 1000MHz
> Sat Sep 14 09:09:59 UTC 2019 88=C2=B0 4164mV 1000MHz
> Sat Sep 14 09:10:00 UTC 2019 88=C2=B0 4058mV 1000MHz
> Sat Sep 14 09:10:01 UTC 2019 88=C2=B0 4058mV 1000MHz
> Sat Sep 14 09:10:03 UTC 2019 88=C2=B0 4082mV 1000MHz
> Sat Sep 14 09:10:04 UTC 2019 88=C2=B0 4058mV 1000MHz
> Sat Sep 14 09:10:06 UTC 2019 88=C2=B0 4146mV 1000MHz
> Sat Sep 14 09:10:07 UTC 2019 88=C2=B0 4041mV 1000MHz
> Sat Sep 14 09:10:08 UTC 2019 88=C2=B0 4035mV 1000MHz
> Sat Sep 14 09:10:10 UTC 2019 88=C2=B0 4052mV 1000MHz
> Sat Sep 14 09:10:11 UTC 2019 88=C2=B0 4087mV 1000MHz
> Sat Sep 14 09:10:12 UTC 2019 88=C2=B0 4152mV 1000MHz
> Sat Sep 14 09:10:14 UTC 2019 88=C2=B0 4070mV 1000MHz
> Sat Sep 14 09:10:15 UTC 2019 88=C2=B0 4064mV 1000MHz
> Sat Sep 14 09:10:17 UTC 2019 88=C2=B0 4170mV 1000MHz
> Sat Sep 14 09:10:18 UTC 2019 88=C2=B0 4058mV 1000MHz
> Sat Sep 14 09:10:19 UTC 2019 88=C2=B0 4187mV 1000MHz
> Sat Sep 14 09:10:21 UTC 2019 88=C2=B0 4093mV 1000MHz
> Sat Sep 14 09:10:22 UTC 2019 88=C2=B0 4087mV 1000MHz
> Sat Sep 14 09:10:23 UTC 2019 90=C2=B0 4070mV 1000MHz

Should we be a little more conservative?  Without knowing the
accuracy, i believe we do not want to run at 800 or 1GHz at 90C, so if
we made this value 89 instead of 90, we would throttle a little more
conservatively.

> Sat Sep 14 09:10:25 UTC 2019 88=C2=B0 4123mV 800MHz
> Sat Sep 14 09:10:26 UTC 2019 88=C2=B0 4064mV 1000MHz
> Sat Sep 14 09:10:28 UTC 2019 90=C2=B0 4058mV 1000MHz

Again here, I interpret the data sheet correctly, we're technically out of =
spec

> Sat Sep 14 09:10:29 UTC 2019 88=C2=B0 4076mV 1000MHz
> Sat Sep 14 09:10:30 UTC 2019 88=C2=B0 4064mV 1000MHz
> Sat Sep 14 09:10:32 UTC 2019 88=C2=B0 4117mV 1000MHz
> Sat Sep 14 09:10:33 UTC 2019 88=C2=B0 4105mV 800MHz
> Sat Sep 14 09:10:34 UTC 2019 88=C2=B0 4070mV 1000MHz
> Sat Sep 14 09:10:36 UTC 2019 88=C2=B0 4076mV 1000MHz
> Sat Sep 14 09:10:37 UTC 2019 88=C2=B0 4087mV 1000MHz
> Sat Sep 14 09:10:39 UTC 2019 88=C2=B0 4017mV 1000MHz
> Sat Sep 14 09:10:40 UTC 2019 88=C2=B0 4093mV 1000MHz
> Sat Sep 14 09:10:41 UTC 2019 88=C2=B0 4058mV 800MHz
> Sat Sep 14 09:10:42 UTC 2019 88=C2=B0 4035mV 1000MHz
> Sat Sep 14 09:10:44 UTC 2019 90=C2=B0 4058mV 1000MHz
> Sat Sep 14 09:10:45 UTC 2019 88=C2=B0 4064mV 1000MHz
> Sat Sep 14 09:10:47 UTC 2019 88=C2=B0 4064mV 1000MHz
> Sat Sep 14 09:10:48 UTC 2019 88=C2=B0 4029mV 1000MHz
> Sat Sep 14 09:10:50 UTC 2019 90=C2=B0 4046mV 1000MHz
> ^Ckill 4680
> root@letux:~# cpufreq-info
> cpufrequtils 008: cpufreq-info (C) Dominik Brodowski 2004-2009
> Report errors and bugs to cpufreq@vger.kernel.org, please.
> analyzing CPU 0:
>   driver: cpufreq-dt
>   CPUs which run at the same hardware frequency: 0
>   CPUs which need to have their frequency coordinated by software: 0
>   maximum transition latency: 300 us.
>   hardware limits: 300 MHz - 1000 MHz
>   available frequency steps: 300 MHz, 600 MHz, 800 MHz, 1000 MHz
>   available cpufreq governors: conservative, userspace, powersave, ondema=
nd, performance
>   current policy: frequency should be within 300 MHz and 1000 MHz.
>                   The governor "ondemand" may decide which speed to use
>                   within this range.
>   current CPU frequency is 600 MHz (asserted by call to hardware).
>   cpufreq stats: 300 MHz:22.81%, 600 MHz:2.50%, 800 MHz:2.10%, 1000 MHz:7=
2.59%  (1563)
> root@letux:~#
>
> So OPP is reduced if bandgap sensor reports >=3D 90=C2=B0C
> which almost immediately makes the temperature
> go down.
>
> No operational hickups were observed.
>
> Surface temperature of the PoP chip did rise to
> approx. 53=C2=B0C during this test.
>
> Tested-by: H. Nikolaus Schaller <hns@goldelico.com> # on GTA04A5 with dm3=
730cbp100
>
