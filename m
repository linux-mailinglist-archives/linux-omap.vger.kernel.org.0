Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 49F16AF010
	for <lists+linux-omap@lfdr.de>; Tue, 10 Sep 2019 18:59:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2436883AbfIJQ7j (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 10 Sep 2019 12:59:39 -0400
Received: from mo4-p01-ob.smtp.rzone.de ([81.169.146.164]:12537 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2436712AbfIJQ7j (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 10 Sep 2019 12:59:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1568134773;
        s=strato-dkim-0002; d=goldelico.com;
        h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=n76XzHq0vYPY5CvY/1RBtkVjl+/4++35pRA1yLghgIQ=;
        b=VagYFspVclkze6RSijgvFAhHlK8IF8ME36Nu/2c2jucv8/yTEvndcC2pkjkPO2Ajds
        jsryAXjg1xJ9wZ4eF34jsIHLgfm7BqP7SezpHi/9dkH6OGe9hCLltJ82i/DcYtVqGqVy
        W4aTSOHxDQWmVjFYp0o7J/ZP3PNGIbz2nhuokTdpXO6P8Cc/2MIUFF1Bc/m7A2r9UllP
        sXG/ZQMYO1+Bpa3fYMDNLokPdAgmM+IYaiI6Xkq6YsMIHXEgspm588RTLS99RWAzzui2
        kht1B43T9d0Oysiq6Tyc6GcbxTH5lPn1QW+FxlC86Dai70hA4cg2qo2MWRwJEIfq2xIa
        JWCA==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj7wpz8NMGH/PhwDWsEw=="
X-RZG-CLASS-ID: mo00
Received: from imac.fritz.box
        by smtp.strato.de (RZmta 44.27.0 DYNA|AUTH)
        with ESMTPSA id u036f9v8AGxI3Ia
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (curve secp521r1 with 521 ECDH bits, eq. 15360 bits RSA))
        (Client did not present a certificate);
        Tue, 10 Sep 2019 18:59:18 +0200 (CEST)
Content-Type: text/plain; charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Subject: Re: [Letux-kernel] [RFC PATCH 0/3] Enable 1GHz support on omap36xx
From:   "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <CAHCN7x+fgtMHMNYU2W7BRQwd-d2g_Tb8-L5QNcnZjCF=VzRXJg@mail.gmail.com>
Date:   Tue, 10 Sep 2019 18:59:17 +0200
Cc:     Tony Lindgren <tony@atomide.com>,
        =?utf-8?Q?Andr=C3=A9_Roth?= <neolynx@gmail.com>,
        Linux-OMAP <linux-omap@vger.kernel.org>,
        Discussions about the Letux Kernel 
        <letux-kernel@openphoenux.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Andreas Kemnade <andreas@kemnade.info>,
        Nishanth Menon <nm@ti.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <3663B13C-1AAB-4BE3-8CAD-F821B70393FA@goldelico.com>
References: <C04F49BA-1229-4E96-9FCF-4FC662D1DB11@goldelico.com> <CAHCN7x+Ye6sB_YqO0sAX1OJDw64B-qGS3pL545v3Xk5z914cwQ@mail.gmail.com> <0C1EF64E-B33C-4BFA-A7D3-471DD1B9EE86@goldelico.com> <515048DE-138D-4400-8168-F2B7D61F1005@goldelico.com> <CAHCN7xLPCX9rZ0+7KVBiA_bgZ6tg6VeCXqD-UXu+6iwpFMPVrA@mail.gmail.com> <7B3D1D77-3E8C-444F-90B9-6DF2641178B8@goldelico.com> <CAHCN7xLW58ggx3CpVL=HdCVHWo6D-MCTB91A_9rtSRoZQ+xJuQ@mail.gmail.com> <FA2920FE-B76A-4D44-A264-862A1CCBF7FC@goldelico.com> <CAHCN7xJsPa0i+Z+qpCkWcdAh9+udmGT0RPNchdDsfB=8ptd3Nw@mail.gmail.com> <87420DBD-770F-4C32-9499-A3AEA5876E8A@goldelico.com> <20190909163236.GP52127@atomide.com> <E001F74D-724E-4C50-9265-CBD33C4F2918@goldelico.com> <F8F08882-8011-441C-9581-ECCE9772EC21@goldelico.com> <CAHCN7x+fgtMHMNYU2W7BRQwd-d2g_Tb8-L5QNcnZjCF=VzRXJg@mail.gmail.com>
To:     Adam Ford <aford173@gmail.com>
X-Mailer: Apple Mail (2.3124)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Adam,

> Am 09.09.2019 um 21:13 schrieb Adam Ford <aford173@gmail.com>:
>=20
> On Mon, Sep 9, 2019 at 1:11 PM H. Nikolaus Schaller =
<hns@goldelico.com> wrote:
>>=20
>> Ok, we have to check if the ti,abb-v2 "LDO" driver
>> drivers/regulator/ti-abb-regulator.c
>> can handle that with a DT entry similar to:
>>=20
>> =
https://elixir.bootlin.com/linux/latest/source/arch/arm/boot/dts/omap5.dts=
i#L365
>=20
> At least for the 3630, the ti-abb-regulator driver is the same driver,
> but different structures based on v1, v2, or v3 are used based on
> which compatible flag is used.
>=20
> I tried enabling the vbb-supply in the device tree, but the driver
> doesn't load it without .multi_regulator being true.
>=20
> cpus {
> /* OMAP3630/OMAP37xx variants OPP50 to OPP130 and OPP1G */
>     cpu: cpu@0 {
>          operating-points-v2 =3D <&cpu0_opp_table>;
>          vbb-supply =3D <&abb_mpu_iva>;

Oh, that is great that the app_mpu_iva already exists!

So we just need plumbing pieces together.

>          clock-latency =3D <300000>; /* =46rom omap-cpufreq driver */
>     };
> };
>=20
> I enabled that in the 3630 structure, but then the opp must list
> voltage points for both regulators.
> Looking at the entry for abb_mpu_iva, it appears to have voltages that
> directly match the OPP table, so I made a duplicate entry:
>=20
> opp-microvolt =3D <1012500 1012500 1012500>,
>                           <1012500 1012500 1012500>;
>=20
> and similar for 600, 800 and 1000 similar to the way dra7.dtsi does

Yes.

> it, but then I got some nasty errors and crashes.

I have done the same but not (yet) seen a crash or error. Maybe you had
a typo?

>=20
> I started undoing the stuff, and I wanted to see if the abb_mpu_iva
> regulator was even running, but I would get -22 errors when I went to
> read the voltage.
>=20
> # cat =
/sys/devices/platform/68000000.ocp/483072f0.regulator-abb-mpu/regulator/re=
gulator.5/microvolts
> -22

So it reports wrong voltage settings of -22=C2=B5V...

I have tested and have the same.

root@letux:~# cd =
/sys/bus/platform/devices/483072f0.regulator-abb-mpu/regulator/regulator.3=
/
=
root@letux:/sys/bus/platform/devices/483072f0.regulator-abb-mpu/regulator/=
regulator.3# ls -l
total 0
lrwxrwxrwx 1 root root    0 Jan  1 00:02 device -> =
../../../483072f0.regulator-abb-mpu
-r--r--r-- 1 root root 4096 Jan  1 00:02 max_microvolts
-r--r--r-- 1 root root 4096 Jan  1 00:02 microvolts
-r--r--r-- 1 root root 4096 Jan  1 00:02 min_microvolts
-r--r--r-- 1 root root 4096 Jan  1 00:02 name
-r--r--r-- 1 root root 4096 Jan  1 00:02 num_users
lrwxrwxrwx 1 root root    0 Jan  1 00:02 of_node -> =
../../../../../../firmware/devicetree/base/ocp@68000000/regulator-abb-mpu
drwxr-xr-x 2 root root    0 Jan  1 00:02 power
-r--r--r-- 1 root root 4096 Jan  1 00:02 requested_microamps
lrwxrwxrwx 1 root root    0 Jan  1 00:02 subsystem -> =
../../../../../../class/regulator
-r--r--r-- 1 root root 4096 Jan  1 00:02 suspend_disk_state
-r--r--r-- 1 root root 4096 Jan  1 00:02 suspend_mem_state
-r--r--r-- 1 root root 4096 Jan  1 00:02 suspend_standby_state
-r--r--r-- 1 root root 4096 Jan  1 00:02 type
-rw-r--r-- 1 root root 4096 Jan  1 00:02 uevent
=
root@letux:/sys/bus/platform/devices/483072f0.regulator-abb-mpu/regulator/=
regulator.3# cat *
cat: device: Is a directory
1375000
-22
1012500
abb_mpu_iva
1
cat: of_node: Is a directory
cat: power: Is a directory
0
cat: subsystem: Is a directory
disabled
disabled
disabled
voltage
OF_NAME=3Dregulator-abb-mpu
OF_FULLNAME=3D/ocp@68000000/regulator-abb-mpu
OF_COMPATIBLE_0=3Dti,abb-v1
OF_COMPATIBLE_N=3D1
=
root@letux:/sys/bus/platform/devices/483072f0.regulator-abb-mpu/regulator/=
regulator.3# cd
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
  current CPU frequency is 300 MHz (asserted by call to hardware).
  cpufreq stats: 300 MHz:31.36%, 600 MHz:4.23%, 800 MHz:3.76%, 1000 =
MHz:60.65%  (1933)
root@letux:~#=20

So it runs with different OPPs... My chip may also be more robust to =
wrong ABB FBB setting.

>=20
> If someone has any suggestions on how to test the abb_mpu_iva driver,
> let me know.

Well, next I want to look into the code for cat microvolts and
maybe add some printk to understand the result...

A first result is that it comes from

	/* We do not know where the OPP voltage is at the moment */
	abb->current_info_idx =3D -EINVAL;

But this is not treated as an -EINVAL but value of -22 microvolts...
Maybe an error check is missing somewhere in the regulator core.

I just need more time to track it down.

BR and thanks for the description,
Nikolaus

