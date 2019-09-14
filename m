Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F4058B2BA9
	for <lists+linux-omap@lfdr.de>; Sat, 14 Sep 2019 16:38:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388734AbfINOiu (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sat, 14 Sep 2019 10:38:50 -0400
Received: from mo4-p01-ob.smtp.rzone.de ([81.169.146.165]:24462 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388491AbfINOiu (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sat, 14 Sep 2019 10:38:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1568471925;
        s=strato-dkim-0002; d=goldelico.com;
        h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=5qKZ/c4uSWTY5fdiOP9AiNfCi22I2WJ1moqjJcQYbAg=;
        b=F3g5BAhJWMkwrZTiehcpGD+/y+UnlE7vkCUkP5wAAcuSyuRlR4j7qii7Ove7gciWAq
        Ca4IeE9qUOuXv8ix71YmsGdZz93G/f3ppjxn/t2ToSqP+e9+QiycVsLB+B5taw6DkcHI
        snnA/WsvL+uu0aEByeZKpaYKw9oTDEQm2R5Yx3V9OmRjDLdUlK9DzK9dfVUlOpvcju5S
        r/C4rCe3M9qwhAatSj3BYxj1bGvS02DTihppxcSOHd0qDJCN6mzBj+lcqA/pY/6jQ6uH
        vSdAaWmsk8JF76Ya0NEJWQOQLsvrN3xj+dfqxjim/dOSCzPBCjCp9s1VUtQK0Oou/MO4
        rqjw==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj7wpz8NMGH/PhwDWtpw=="
X-RZG-CLASS-ID: mo00
Received: from imac.fritz.box
        by smtp.strato.de (RZmta 44.27.0 DYNA|AUTH)
        with ESMTPSA id u036f9v8EEcVKhU
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (curve secp521r1 with 521 ECDH bits, eq. 15360 bits RSA))
        (Client did not present a certificate);
        Sat, 14 Sep 2019 16:38:31 +0200 (CEST)
Content-Type: text/plain; charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Subject: Re: [RFC v2 1/2] ARM: dts: omap3: Add cpu trips and cooling map for omap3 family
From:   "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <CAHCN7xKU1v-BFkwiuZQx82+Cmdgj_1CH1j51bN0TaaduWcu8rQ@mail.gmail.com>
Date:   Sat, 14 Sep 2019 16:38:30 +0200
Cc:     Linux-OMAP <linux-omap@vger.kernel.org>,
        Adam Ford <adam.ford@logicpd.com>, Nishanth Menon <nm@ti.com>,
        =?utf-8?Q?Beno=C3=AEt_Cousson?= <bcousson@baylibre.com>,
        Tony Lindgren <tony@atomide.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Grazvydas Ignotas <notasas@gmail.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <97204F98-FA33-4EBA-80AC-2FB3A6E78B2B@goldelico.com>
References: <20190913153714.30980-1-aford173@gmail.com> <B710D701-6311-4344-BF4E-F39157BBF2BD@goldelico.com> <CAHCN7xKU1v-BFkwiuZQx82+Cmdgj_1CH1j51bN0TaaduWcu8rQ@mail.gmail.com>
To:     Adam Ford <aford173@gmail.com>
X-Mailer: Apple Mail (2.3124)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org


> Am 14.09.2019 um 15:42 schrieb Adam Ford <aford173@gmail.com>:
>=20
> On Sat, Sep 14, 2019 at 4:20 AM H. Nikolaus Schaller =
<hns@goldelico.com> wrote:
>>=20
>>=20
>>> Am 13.09.2019 um 17:37 schrieb Adam Ford <aford173@gmail.com>:
>>>=20
>>> The OMAP3530, AM3517 and DM3730 all show thresholds of 90C and 105C
>>> depending on commercial or industrial temperature ratings.  This
>>> patch expands the thermal information to the limits of 90 and 105
>>> for alert and critical.
>>>=20
>>> For boards who never use industrial temperatures, these can be
>>> changed on their respective device trees with something like:
>>>=20
>>> &cpu_alert0 {
>>>      temperature =3D <85000>; /* millicelsius */
>>> };
>>>=20
>>> &cpu_crit {
>>>      temperature =3D <90000>; /* millicelsius */
>>> };
>>>=20
>>> Signed-off-by: Adam Ford <aford173@gmail.com>
>>> ---
>>> V2:  Change the CPU reference to &cpu instead of &cpu0
>>>=20
>>> diff --git a/arch/arm/boot/dts/omap3-cpu-thermal.dtsi =
b/arch/arm/boot/dts/omap3-cpu-thermal.dtsi
>>> index 235ecfd61e2d..dfbd0cb0b00b 100644
>>> --- a/arch/arm/boot/dts/omap3-cpu-thermal.dtsi
>>> +++ b/arch/arm/boot/dts/omap3-cpu-thermal.dtsi
>>> @@ -17,4 +17,25 @@ cpu_thermal: cpu_thermal {
>>>=20
>>>                      /* sensor       ID */
>>>      thermal-sensors =3D <&bandgap     0>;
>>> +
>>> +     cpu_trips: trips {
>>> +             cpu_alert0: cpu_alert {
>>> +                     temperature =3D <90000>; /* millicelsius */
>>> +                     hysteresis =3D <2000>; /* millicelsius */
>>> +                     type =3D "passive";
>>> +             };
>>> +             cpu_crit: cpu_crit {
>>> +                     temperature =3D <105000>; /* millicelsius */
>>> +                     hysteresis =3D <2000>; /* millicelsius */
>>> +                     type =3D "critical";
>>> +             };
>>> +     };
>>> +
>>> +     cpu_cooling_maps: cooling-maps {
>>> +             map0 {
>>> +                     trip =3D <&cpu_alert0>;
>>> +                     cooling-device =3D
>>> +                             <&cpu THERMAL_NO_LIMIT =
THERMAL_NO_LIMIT>;
>>> +             };
>>> +     };
>>> };
>>> --
>>> 2.17.1
>>>=20
>>=20
>> Here is my test log (GTA04A5 with DM3730CBP100).
>> "high-load" script is driving the NEON to full power
>> and would report calculation errors.
>>=20
>> There is no noise visible in the bandgap sensor data
>> induced by power supply fluctuations (log shows system
>> voltage while charging).
>>=20
>=20
> Great data!
>=20
>> root@letux:~# ./high-load -n2
>> 100% load stress test for 1 cores running ./neon_loop2
>> Sat Sep 14 09:05:50 UTC 2019 65=C2=B0 4111mV 1000MHz
>> Sat Sep 14 09:05:50 UTC 2019 67=C2=B0 4005mV 1000MHz
>> Sat Sep 14 09:05:52 UTC 2019 68=C2=B0 4000mV 1000MHz
>> Sat Sep 14 09:05:53 UTC 2019 68=C2=B0 4000mV 1000MHz
>> Sat Sep 14 09:05:55 UTC 2019 72=C2=B0 3976mV 1000MHz
>> Sat Sep 14 09:05:56 UTC 2019 72=C2=B0 4023mV 1000MHz
>> Sat Sep 14 09:05:57 UTC 2019 72=C2=B0 3900mV 1000MHz
>> Sat Sep 14 09:05:59 UTC 2019 73=C2=B0 4029mV 1000MHz
>> Sat Sep 14 09:06:00 UTC 2019 73=C2=B0 3988mV 1000MHz
>> Sat Sep 14 09:06:01 UTC 2019 73=C2=B0 4005mV 1000MHz
>> Sat Sep 14 09:06:03 UTC 2019 73=C2=B0 4011mV 1000MHz
>> Sat Sep 14 09:06:04 UTC 2019 73=C2=B0 4117mV 1000MHz
>> Sat Sep 14 09:06:06 UTC 2019 73=C2=B0 4005mV 1000MHz
>> Sat Sep 14 09:06:07 UTC 2019 75=C2=B0 3994mV 1000MHz
>> Sat Sep 14 09:06:08 UTC 2019 75=C2=B0 3970mV 1000MHz
>> Sat Sep 14 09:06:09 UTC 2019 75=C2=B0 4046mV 1000MHz
>> Sat Sep 14 09:06:11 UTC 2019 75=C2=B0 4005mV 1000MHz
>> Sat Sep 14 09:06:12 UTC 2019 75=C2=B0 4023mV 1000MHz
>> Sat Sep 14 09:06:14 UTC 2019 75=C2=B0 3970mV 1000MHz
>> Sat Sep 14 09:06:15 UTC 2019 75=C2=B0 4011mV 1000MHz
>> Sat Sep 14 09:06:16 UTC 2019 77=C2=B0 4017mV 1000MHz
>> Sat Sep 14 09:06:18 UTC 2019 77=C2=B0 3994mV 1000MHz
>> Sat Sep 14 09:06:19 UTC 2019 77=C2=B0 3994mV 1000MHz
>> Sat Sep 14 09:06:20 UTC 2019 77=C2=B0 3988mV 1000MHz
>> Sat Sep 14 09:06:22 UTC 2019 77=C2=B0 4023mV 1000MHz
>> Sat Sep 14 09:06:23 UTC 2019 77=C2=B0 4023mV 1000MHz
>> Sat Sep 14 09:06:24 UTC 2019 78=C2=B0 4005mV 1000MHz
>> Sat Sep 14 09:06:26 UTC 2019 78=C2=B0 4105mV 1000MHz
>> Sat Sep 14 09:06:27 UTC 2019 78=C2=B0 4011mV 1000MHz
>> Sat Sep 14 09:06:28 UTC 2019 78=C2=B0 3994mV 1000MHz
>> Sat Sep 14 09:06:30 UTC 2019 78=C2=B0 4123mV 1000MHz
>> ...
>> Sat Sep 14 09:09:57 UTC 2019 88=C2=B0 4082mV 1000MHz
>> Sat Sep 14 09:09:59 UTC 2019 88=C2=B0 4164mV 1000MHz
>> Sat Sep 14 09:10:00 UTC 2019 88=C2=B0 4058mV 1000MHz
>> Sat Sep 14 09:10:01 UTC 2019 88=C2=B0 4058mV 1000MHz
>> Sat Sep 14 09:10:03 UTC 2019 88=C2=B0 4082mV 1000MHz
>> Sat Sep 14 09:10:04 UTC 2019 88=C2=B0 4058mV 1000MHz
>> Sat Sep 14 09:10:06 UTC 2019 88=C2=B0 4146mV 1000MHz
>> Sat Sep 14 09:10:07 UTC 2019 88=C2=B0 4041mV 1000MHz
>> Sat Sep 14 09:10:08 UTC 2019 88=C2=B0 4035mV 1000MHz
>> Sat Sep 14 09:10:10 UTC 2019 88=C2=B0 4052mV 1000MHz
>> Sat Sep 14 09:10:11 UTC 2019 88=C2=B0 4087mV 1000MHz
>> Sat Sep 14 09:10:12 UTC 2019 88=C2=B0 4152mV 1000MHz
>> Sat Sep 14 09:10:14 UTC 2019 88=C2=B0 4070mV 1000MHz
>> Sat Sep 14 09:10:15 UTC 2019 88=C2=B0 4064mV 1000MHz
>> Sat Sep 14 09:10:17 UTC 2019 88=C2=B0 4170mV 1000MHz
>> Sat Sep 14 09:10:18 UTC 2019 88=C2=B0 4058mV 1000MHz
>> Sat Sep 14 09:10:19 UTC 2019 88=C2=B0 4187mV 1000MHz
>> Sat Sep 14 09:10:21 UTC 2019 88=C2=B0 4093mV 1000MHz
>> Sat Sep 14 09:10:22 UTC 2019 88=C2=B0 4087mV 1000MHz
>> Sat Sep 14 09:10:23 UTC 2019 90=C2=B0 4070mV 1000MHz
>=20
> Should we be a little more conservative?  Without knowing the
> accuracy, i believe we do not want to run at 800 or 1GHz at 90C, so if
> we made this value 89 instead of 90, we would throttle a little more
> conservatively.

Well, the OMAP5 also defines exactly 100=C2=B0C in the device tree.

I would assume that the badgap sensor accuracy is so that it
never reports less than the real temperature. So if we
throttle at reported 90=C2=B0 TJ is likely lower.

>> Sat Sep 14 09:10:25 UTC 2019 88=C2=B0 4123mV 800MHz
>> Sat Sep 14 09:10:26 UTC 2019 88=C2=B0 4064mV 1000MHz
>> Sat Sep 14 09:10:28 UTC 2019 90=C2=B0 4058mV 1000MHz
>=20
> Again here, I interpret the data sheet correctly, we're technically =
out of spec

I read the data sheet as if 90=C2=B0C at OPP1G is still within spec.
91 would be obviously outside (if bandgap sensor is precise).

>=20
>> Sat Sep 14 09:10:29 UTC 2019 88=C2=B0 4076mV 1000MHz
>> Sat Sep 14 09:10:30 UTC 2019 88=C2=B0 4064mV 1000MHz
>> Sat Sep 14 09:10:32 UTC 2019 88=C2=B0 4117mV 1000MHz
>> Sat Sep 14 09:10:33 UTC 2019 88=C2=B0 4105mV 800MHz
>> Sat Sep 14 09:10:34 UTC 2019 88=C2=B0 4070mV 1000MHz
>> Sat Sep 14 09:10:36 UTC 2019 88=C2=B0 4076mV 1000MHz
>> Sat Sep 14 09:10:37 UTC 2019 88=C2=B0 4087mV 1000MHz
>> Sat Sep 14 09:10:39 UTC 2019 88=C2=B0 4017mV 1000MHz
>> Sat Sep 14 09:10:40 UTC 2019 88=C2=B0 4093mV 1000MHz
>> Sat Sep 14 09:10:41 UTC 2019 88=C2=B0 4058mV 800MHz
>> Sat Sep 14 09:10:42 UTC 2019 88=C2=B0 4035mV 1000MHz
>> Sat Sep 14 09:10:44 UTC 2019 90=C2=B0 4058mV 1000MHz
>> Sat Sep 14 09:10:45 UTC 2019 88=C2=B0 4064mV 1000MHz
>> Sat Sep 14 09:10:47 UTC 2019 88=C2=B0 4064mV 1000MHz
>> Sat Sep 14 09:10:48 UTC 2019 88=C2=B0 4029mV 1000MHz
>> Sat Sep 14 09:10:50 UTC 2019 90=C2=B0 4046mV 1000MHz
>> ^Ckill 4680
>> root@letux:~# cpufreq-info
>> cpufrequtils 008: cpufreq-info (C) Dominik Brodowski 2004-2009
>> Report errors and bugs to cpufreq@vger.kernel.org, please.
>> analyzing CPU 0:
>>  driver: cpufreq-dt
>>  CPUs which run at the same hardware frequency: 0
>>  CPUs which need to have their frequency coordinated by software: 0
>>  maximum transition latency: 300 us.
>>  hardware limits: 300 MHz - 1000 MHz
>>  available frequency steps: 300 MHz, 600 MHz, 800 MHz, 1000 MHz
>>  available cpufreq governors: conservative, userspace, powersave, =
ondemand, performance
>>  current policy: frequency should be within 300 MHz and 1000 MHz.
>>                  The governor "ondemand" may decide which speed to =
use
>>                  within this range.
>>  current CPU frequency is 600 MHz (asserted by call to hardware).
>>  cpufreq stats: 300 MHz:22.81%, 600 MHz:2.50%, 800 MHz:2.10%, 1000 =
MHz:72.59%  (1563)
>> root@letux:~#
>>=20
>> So OPP is reduced if bandgap sensor reports >=3D 90=C2=B0C
>> which almost immediately makes the temperature
>> go down.
>>=20
>> No operational hickups were observed.
>>=20
>> Surface temperature of the PoP chip did rise to
>> approx. 53=C2=B0C during this test.
>>=20
>> Tested-by: H. Nikolaus Schaller <hns@goldelico.com> # on GTA04A5 with =
dm3730cbp100
>>=20

BTW: this patch (set) is even independent of my 1GHz OPP patches.
Should also work with OPP-v1 definitions so that maintainers can
decide which one to apply first.

It is just more difficult to reach TJ of 90=C2=B0C without 1GHz.

BR,
Nikolaus

