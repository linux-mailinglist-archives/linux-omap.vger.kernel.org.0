Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 66FB1B2ACF
	for <lists+linux-omap@lfdr.de>; Sat, 14 Sep 2019 11:20:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727698AbfINJUt (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sat, 14 Sep 2019 05:20:49 -0400
Received: from mo4-p01-ob.smtp.rzone.de ([81.169.146.164]:14384 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727551AbfINJUt (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sat, 14 Sep 2019 05:20:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1568452842;
        s=strato-dkim-0002; d=goldelico.com;
        h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=4VDI1pj3pQDRgXox/SgYTetHaZq0Xwp2BgUeWSVVTAI=;
        b=rhTPiUd5fat2JUokjzG/xUHZqx3icGaIKCtm+Fhgpyo2NqNsL5UhLp38tN7ctWMSPK
        +WwYYyOaaZbo3zkQ4Rk9sGYP2tOFtY3YxOgu7vJkvEvaBe/2XtQ3WYy26Q6MzxjZsZRc
        bqCKfRYt4OoOKnojzL//NOCNn/1o5OY/M1ojh0MemlnAcTwwBZsiepNaRg2Nz/CMnqyk
        LbUvbyxbli2DOqSjj9/pMoJ4XCKqHnnoHHMuIbkaWlBXcnPZZh0yVKbHxsqC0p95xvJO
        Uacy/bH4yYZv1VXMebmVwqmsGmwJaHJb7W77duNHAq57xXUVrYTJgzPTk62Yy82dFtWf
        T6hA==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj7wpz8NMGH/PhwDWtpw=="
X-RZG-CLASS-ID: mo00
Received: from imac.fritz.box
        by smtp.strato.de (RZmta 44.27.0 DYNA|AUTH)
        with ESMTPSA id u036f9v8E9KUKCS
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (curve secp521r1 with 521 ECDH bits, eq. 15360 bits RSA))
        (Client did not present a certificate);
        Sat, 14 Sep 2019 11:20:30 +0200 (CEST)
Content-Type: text/plain; charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Subject: Re: [RFC v2 1/2] ARM: dts: omap3: Add cpu trips and cooling map for omap3 family
From:   "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <20190913153714.30980-1-aford173@gmail.com>
Date:   Sat, 14 Sep 2019 11:20:29 +0200
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
Message-Id: <B710D701-6311-4344-BF4E-F39157BBF2BD@goldelico.com>
References: <20190913153714.30980-1-aford173@gmail.com>
To:     Adam Ford <aford173@gmail.com>
X-Mailer: Apple Mail (2.3124)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org


> Am 13.09.2019 um 17:37 schrieb Adam Ford <aford173@gmail.com>:
>=20
> The OMAP3530, AM3517 and DM3730 all show thresholds of 90C and 105C
> depending on commercial or industrial temperature ratings.  This
> patch expands the thermal information to the limits of 90 and 105
> for alert and critical.
>=20
> For boards who never use industrial temperatures, these can be
> changed on their respective device trees with something like:
>=20
> &cpu_alert0 {
> 	temperature =3D <85000>; /* millicelsius */
> };
>=20
> &cpu_crit {
> 	temperature =3D <90000>; /* millicelsius */
> };
>=20
> Signed-off-by: Adam Ford <aford173@gmail.com>
> ---
> V2:  Change the CPU reference to &cpu instead of &cpu0
>=20
> diff --git a/arch/arm/boot/dts/omap3-cpu-thermal.dtsi =
b/arch/arm/boot/dts/omap3-cpu-thermal.dtsi
> index 235ecfd61e2d..dfbd0cb0b00b 100644
> --- a/arch/arm/boot/dts/omap3-cpu-thermal.dtsi
> +++ b/arch/arm/boot/dts/omap3-cpu-thermal.dtsi
> @@ -17,4 +17,25 @@ cpu_thermal: cpu_thermal {
>=20
> 			/* sensor       ID */
> 	thermal-sensors =3D <&bandgap     0>;
> +
> +	cpu_trips: trips {
> +		cpu_alert0: cpu_alert {
> +			temperature =3D <90000>; /* millicelsius */
> +			hysteresis =3D <2000>; /* millicelsius */
> +			type =3D "passive";
> +		};
> +		cpu_crit: cpu_crit {
> +			temperature =3D <105000>; /* millicelsius */
> +			hysteresis =3D <2000>; /* millicelsius */
> +			type =3D "critical";
> +		};
> +	};
> +
> +	cpu_cooling_maps: cooling-maps {
> +		map0 {
> +			trip =3D <&cpu_alert0>;
> +			cooling-device =3D
> +				<&cpu THERMAL_NO_LIMIT =
THERMAL_NO_LIMIT>;
> +		};
> +	};
> };
> --=20
> 2.17.1
>=20

Here is my test log (GTA04A5 with DM3730CBP100).
"high-load" script is driving the NEON to full power
and would report calculation errors.

There is no noise visible in the bandgap sensor data
induced by power supply fluctuations (log shows system
voltage while charging).

root@letux:~# ./high-load -n2
100% load stress test for 1 cores running ./neon_loop2
Sat Sep 14 09:05:50 UTC 2019 65=C2=B0 4111mV 1000MHz
Sat Sep 14 09:05:50 UTC 2019 67=C2=B0 4005mV 1000MHz
Sat Sep 14 09:05:52 UTC 2019 68=C2=B0 4000mV 1000MHz
Sat Sep 14 09:05:53 UTC 2019 68=C2=B0 4000mV 1000MHz
Sat Sep 14 09:05:55 UTC 2019 72=C2=B0 3976mV 1000MHz
Sat Sep 14 09:05:56 UTC 2019 72=C2=B0 4023mV 1000MHz
Sat Sep 14 09:05:57 UTC 2019 72=C2=B0 3900mV 1000MHz
Sat Sep 14 09:05:59 UTC 2019 73=C2=B0 4029mV 1000MHz
Sat Sep 14 09:06:00 UTC 2019 73=C2=B0 3988mV 1000MHz
Sat Sep 14 09:06:01 UTC 2019 73=C2=B0 4005mV 1000MHz
Sat Sep 14 09:06:03 UTC 2019 73=C2=B0 4011mV 1000MHz
Sat Sep 14 09:06:04 UTC 2019 73=C2=B0 4117mV 1000MHz
Sat Sep 14 09:06:06 UTC 2019 73=C2=B0 4005mV 1000MHz
Sat Sep 14 09:06:07 UTC 2019 75=C2=B0 3994mV 1000MHz
Sat Sep 14 09:06:08 UTC 2019 75=C2=B0 3970mV 1000MHz
Sat Sep 14 09:06:09 UTC 2019 75=C2=B0 4046mV 1000MHz
Sat Sep 14 09:06:11 UTC 2019 75=C2=B0 4005mV 1000MHz
Sat Sep 14 09:06:12 UTC 2019 75=C2=B0 4023mV 1000MHz
Sat Sep 14 09:06:14 UTC 2019 75=C2=B0 3970mV 1000MHz
Sat Sep 14 09:06:15 UTC 2019 75=C2=B0 4011mV 1000MHz
Sat Sep 14 09:06:16 UTC 2019 77=C2=B0 4017mV 1000MHz
Sat Sep 14 09:06:18 UTC 2019 77=C2=B0 3994mV 1000MHz
Sat Sep 14 09:06:19 UTC 2019 77=C2=B0 3994mV 1000MHz
Sat Sep 14 09:06:20 UTC 2019 77=C2=B0 3988mV 1000MHz
Sat Sep 14 09:06:22 UTC 2019 77=C2=B0 4023mV 1000MHz
Sat Sep 14 09:06:23 UTC 2019 77=C2=B0 4023mV 1000MHz
Sat Sep 14 09:06:24 UTC 2019 78=C2=B0 4005mV 1000MHz
Sat Sep 14 09:06:26 UTC 2019 78=C2=B0 4105mV 1000MHz
Sat Sep 14 09:06:27 UTC 2019 78=C2=B0 4011mV 1000MHz
Sat Sep 14 09:06:28 UTC 2019 78=C2=B0 3994mV 1000MHz
Sat Sep 14 09:06:30 UTC 2019 78=C2=B0 4123mV 1000MHz
...
Sat Sep 14 09:09:57 UTC 2019 88=C2=B0 4082mV 1000MHz
Sat Sep 14 09:09:59 UTC 2019 88=C2=B0 4164mV 1000MHz
Sat Sep 14 09:10:00 UTC 2019 88=C2=B0 4058mV 1000MHz
Sat Sep 14 09:10:01 UTC 2019 88=C2=B0 4058mV 1000MHz
Sat Sep 14 09:10:03 UTC 2019 88=C2=B0 4082mV 1000MHz
Sat Sep 14 09:10:04 UTC 2019 88=C2=B0 4058mV 1000MHz
Sat Sep 14 09:10:06 UTC 2019 88=C2=B0 4146mV 1000MHz
Sat Sep 14 09:10:07 UTC 2019 88=C2=B0 4041mV 1000MHz
Sat Sep 14 09:10:08 UTC 2019 88=C2=B0 4035mV 1000MHz
Sat Sep 14 09:10:10 UTC 2019 88=C2=B0 4052mV 1000MHz
Sat Sep 14 09:10:11 UTC 2019 88=C2=B0 4087mV 1000MHz
Sat Sep 14 09:10:12 UTC 2019 88=C2=B0 4152mV 1000MHz
Sat Sep 14 09:10:14 UTC 2019 88=C2=B0 4070mV 1000MHz
Sat Sep 14 09:10:15 UTC 2019 88=C2=B0 4064mV 1000MHz
Sat Sep 14 09:10:17 UTC 2019 88=C2=B0 4170mV 1000MHz
Sat Sep 14 09:10:18 UTC 2019 88=C2=B0 4058mV 1000MHz
Sat Sep 14 09:10:19 UTC 2019 88=C2=B0 4187mV 1000MHz
Sat Sep 14 09:10:21 UTC 2019 88=C2=B0 4093mV 1000MHz
Sat Sep 14 09:10:22 UTC 2019 88=C2=B0 4087mV 1000MHz
Sat Sep 14 09:10:23 UTC 2019 90=C2=B0 4070mV 1000MHz
Sat Sep 14 09:10:25 UTC 2019 88=C2=B0 4123mV 800MHz
Sat Sep 14 09:10:26 UTC 2019 88=C2=B0 4064mV 1000MHz
Sat Sep 14 09:10:28 UTC 2019 90=C2=B0 4058mV 1000MHz
Sat Sep 14 09:10:29 UTC 2019 88=C2=B0 4076mV 1000MHz
Sat Sep 14 09:10:30 UTC 2019 88=C2=B0 4064mV 1000MHz
Sat Sep 14 09:10:32 UTC 2019 88=C2=B0 4117mV 1000MHz
Sat Sep 14 09:10:33 UTC 2019 88=C2=B0 4105mV 800MHz
Sat Sep 14 09:10:34 UTC 2019 88=C2=B0 4070mV 1000MHz
Sat Sep 14 09:10:36 UTC 2019 88=C2=B0 4076mV 1000MHz
Sat Sep 14 09:10:37 UTC 2019 88=C2=B0 4087mV 1000MHz
Sat Sep 14 09:10:39 UTC 2019 88=C2=B0 4017mV 1000MHz
Sat Sep 14 09:10:40 UTC 2019 88=C2=B0 4093mV 1000MHz
Sat Sep 14 09:10:41 UTC 2019 88=C2=B0 4058mV 800MHz
Sat Sep 14 09:10:42 UTC 2019 88=C2=B0 4035mV 1000MHz
Sat Sep 14 09:10:44 UTC 2019 90=C2=B0 4058mV 1000MHz
Sat Sep 14 09:10:45 UTC 2019 88=C2=B0 4064mV 1000MHz
Sat Sep 14 09:10:47 UTC 2019 88=C2=B0 4064mV 1000MHz
Sat Sep 14 09:10:48 UTC 2019 88=C2=B0 4029mV 1000MHz
Sat Sep 14 09:10:50 UTC 2019 90=C2=B0 4046mV 1000MHz
^Ckill 4680
root@letux:~# cpufreq-info=20
cpufrequtils 008: cpufreq-info (C) Dominik Brodowski 2004-2009
Report errors and bugs to cpufreq@vger.kernel.org, please.
analyzing CPU 0:
  driver: cpufreq-dt
  CPUs which run at the same hardware frequency: 0
  CPUs which need to have their frequency coordinated by software: 0
  maximum transition latency: 300 us.
  hardware limits: 300 MHz - 1000 MHz
  available frequency steps: 300 MHz, 600 MHz, 800 MHz, 1000 MHz
  available cpufreq governors: conservative, userspace, powersave, =
ondemand, performance
  current policy: frequency should be within 300 MHz and 1000 MHz.
                  The governor "ondemand" may decide which speed to use
                  within this range.
  current CPU frequency is 600 MHz (asserted by call to hardware).
  cpufreq stats: 300 MHz:22.81%, 600 MHz:2.50%, 800 MHz:2.10%, 1000 =
MHz:72.59%  (1563)
root@letux:~#=20

So OPP is reduced if bandgap sensor reports >=3D 90=C2=B0C
which almost immediately makes the temperature
go down.

No operational hickups were observed.

Surface temperature of the PoP chip did rise to
approx. 53=C2=B0C during this test.

Tested-by: H. Nikolaus Schaller <hns@goldelico.com> # on GTA04A5 with =
dm3730cbp100

