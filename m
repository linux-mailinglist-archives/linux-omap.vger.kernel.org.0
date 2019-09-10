Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9B07CAF1EC
	for <lists+linux-omap@lfdr.de>; Tue, 10 Sep 2019 21:36:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725875AbfIJTg5 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 10 Sep 2019 15:36:57 -0400
Received: from mail-io1-f67.google.com ([209.85.166.67]:44878 "EHLO
        mail-io1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725770AbfIJTg5 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 10 Sep 2019 15:36:57 -0400
Received: by mail-io1-f67.google.com with SMTP id j4so40274949iog.11;
        Tue, 10 Sep 2019 12:36:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=hpbD42jGtwQ/+WhUqsXzRJho1C2MYYg9b3VscgazxJg=;
        b=BKdFqQ3+fjrVVGhPlMjDOpR1ZPSPmxDrNGSsgYS8HvZhyyzWgx1TaTsnuwsaJaFTgV
         bn6hQ/aWc6TumzyJaiQtuqzMhQPQaopyxm86WSs+8gG6KWPm/rgmVtV21Ay9EC+Md0IN
         0aVs7JEjQtoPuabUs8PYKRaSFLgm/b1JD0156QkakNl2qWv/FSvDDvew8HZJNmj5NJ8o
         e+lluhk6XQxMa/OAmVWYjuh7cHfZhKs6MK9Dklt76vv+y5xxUvlxqUdfmxmr26HiC7AN
         WM7OQURx3c986perkn0cBPKyHPkCYyPCW/07EbYTDzNbAPJxyC86SskhepfaE6U4009c
         R1Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=hpbD42jGtwQ/+WhUqsXzRJho1C2MYYg9b3VscgazxJg=;
        b=Ifsxr9HAK/SgjrNOqYhBfkrboFMXe5MQk6d1gseogFFgxVqd9rfz4/rNAaI+InMb6K
         YPPdjLRWULersvFqXsl6Ys3KMzLls0ibWZ4M2ttGnQOL/JL2e86kx6pgWSXSzK4zXqqb
         auHQLSNcHad8iEp0Yd410/GnDR5ox0/umoXEmkAjH7ihhFNGN9qNXqJSceXtZUI1oiuW
         pmDcOW8J4MjnOC7fgoqKNu/ZAecXn83H0U7QtiOFFgS+xTigd7ahCUP1oBV/XyhqB5FW
         KSS0/vNRhd7l1VOM/VP5q1QkcNa3Q0PaRw+tqLVVwA7kFKWkuOoYh2UqSNf8AQ3fYaa2
         UYxA==
X-Gm-Message-State: APjAAAUMi0NE/X5BRv98tFQacHk2D5sy0YYp3t5rGNpqd1FesnPDqUJ0
        DK/zMKBQC8+oz3FCjU3JCxbVSPzsOlo1gThsP1M=
X-Google-Smtp-Source: APXvYqx+A0yHeCJ5o0br48HQaA4PlYIC27sAu+6VCngetShOp6W+xCj8HqxYnwAQe/Nae6lH5QQo5Mn4heOtd/eLqEE=
X-Received: by 2002:a05:6638:4b:: with SMTP id a11mr33589668jap.0.1568144213814;
 Tue, 10 Sep 2019 12:36:53 -0700 (PDT)
MIME-Version: 1.0
References: <C04F49BA-1229-4E96-9FCF-4FC662D1DB11@goldelico.com>
 <CAHCN7x+Ye6sB_YqO0sAX1OJDw64B-qGS3pL545v3Xk5z914cwQ@mail.gmail.com>
 <0C1EF64E-B33C-4BFA-A7D3-471DD1B9EE86@goldelico.com> <515048DE-138D-4400-8168-F2B7D61F1005@goldelico.com>
 <CAHCN7xLPCX9rZ0+7KVBiA_bgZ6tg6VeCXqD-UXu+6iwpFMPVrA@mail.gmail.com>
 <7B3D1D77-3E8C-444F-90B9-6DF2641178B8@goldelico.com> <CAHCN7xLW58ggx3CpVL=HdCVHWo6D-MCTB91A_9rtSRoZQ+xJuQ@mail.gmail.com>
 <FA2920FE-B76A-4D44-A264-862A1CCBF7FC@goldelico.com> <CAHCN7xJsPa0i+Z+qpCkWcdAh9+udmGT0RPNchdDsfB=8ptd3Nw@mail.gmail.com>
 <87420DBD-770F-4C32-9499-A3AEA5876E8A@goldelico.com> <20190909163236.GP52127@atomide.com>
 <E001F74D-724E-4C50-9265-CBD33C4F2918@goldelico.com> <F8F08882-8011-441C-9581-ECCE9772EC21@goldelico.com>
 <CAHCN7x+fgtMHMNYU2W7BRQwd-d2g_Tb8-L5QNcnZjCF=VzRXJg@mail.gmail.com>
 <3663B13C-1AAB-4BE3-8CAD-F821B70393FA@goldelico.com> <CAHCN7x+mLCNq4evwGZfk6Ka=3o6EzhL=s38aNdukyLwKB1xO7A@mail.gmail.com>
 <56482888-DBD3-4658-8DB9-FB57653B5AA8@goldelico.com>
In-Reply-To: <56482888-DBD3-4658-8DB9-FB57653B5AA8@goldelico.com>
From:   Adam Ford <aford173@gmail.com>
Date:   Tue, 10 Sep 2019 14:36:42 -0500
Message-ID: <CAHCN7xJnagCem9B7DB14_pS5PdmDHs+RmHjc95Y_HR9XMM28yA@mail.gmail.com>
Subject: Re: [Letux-kernel] [RFC PATCH 0/3] Enable 1GHz support on omap36xx
To:     "H. Nikolaus Schaller" <hns@goldelico.com>
Cc:     Tony Lindgren <tony@atomide.com>,
        =?UTF-8?Q?Andr=C3=A9_Roth?= <neolynx@gmail.com>,
        Linux-OMAP <linux-omap@vger.kernel.org>,
        Discussions about the Letux Kernel 
        <letux-kernel@openphoenux.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Andreas Kemnade <andreas@kemnade.info>,
        Nishanth Menon <nm@ti.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Tue, Sep 10, 2019 at 1:51 PM H. Nikolaus Schaller <hns@goldelico.com> wr=
ote:
>
> Hi,
>
> > Am 10.09.2019 um 20:30 schrieb Adam Ford <aford173@gmail.com>:
> >
> > On Tue, Sep 10, 2019 at 11:59 AM H. Nikolaus Schaller <hns@goldelico.co=
m> wrote:
> >>
> >> Hi Adam,
> >>
> >>> Am 09.09.2019 um 21:13 schrieb Adam Ford <aford173@gmail.com>:
> >>>
> >>> On Mon, Sep 9, 2019 at 1:11 PM H. Nikolaus Schaller <hns@goldelico.co=
m> wrote:
> >>>>
> >>>> Ok, we have to check if the ti,abb-v2 "LDO" driver
> >>>> drivers/regulator/ti-abb-regulator.c
> >>>> can handle that with a DT entry similar to:
> >>>>
> >>>> https://elixir.bootlin.com/linux/latest/source/arch/arm/boot/dts/oma=
p5.dtsi#L365
> >>>
> >>> At least for the 3630, the ti-abb-regulator driver is the same driver=
,
> >>> but different structures based on v1, v2, or v3 are used based on
> >>> which compatible flag is used.
> >>>
> >>> I tried enabling the vbb-supply in the device tree, but the driver
> >>> doesn't load it without .multi_regulator being true.
> >>>
> >>> cpus {
> >>> /* OMAP3630/OMAP37xx variants OPP50 to OPP130 and OPP1G */
> >>>    cpu: cpu@0 {
> >>>         operating-points-v2 =3D <&cpu0_opp_table>;
> >>>         vbb-supply =3D <&abb_mpu_iva>;
> >>
> >> Oh, that is great that the app_mpu_iva already exists!
> >>
> >> So we just need plumbing pieces together.
> >>
> >>>         clock-latency =3D <300000>; /* From omap-cpufreq driver */
> >>>    };
> >>> };
> >>>
> >>> I enabled that in the 3630 structure, but then the opp must list
> >>> voltage points for both regulators.
> >>> Looking at the entry for abb_mpu_iva, it appears to have voltages tha=
t
> >>> directly match the OPP table, so I made a duplicate entry:
> >>>
> >>> opp-microvolt =3D <1012500 1012500 1012500>,
> >>>                          <1012500 1012500 1012500>;
> >
> > Out of curiosity, if we're only going to use one value for the opp
> > voltage, do we need to have 3 listed?  when I looked at the driver
> > yesterday, it appears to support either 1 or 3 entries per opp.
> > If we're going to support two regulators, showing them as
> > opp-microvolt =3D <1012500>, <1012500>; would be cleaner and can fit on
> > one line.
>
> Well, IMHO it would be cleaner to specify min and max values as well
> since the data sheets define them. It is also not clear if we need
> them for AVS or such mechanisms.
>
> >
> >>>
> >>> and similar for 600, 800 and 1000 similar to the way dra7.dtsi does
> >>
> >> Yes.
> >>
> >>> it, but then I got some nasty errors and crashes.
> >>
> >> I have done the same but not (yet) seen a crash or error. Maybe you ha=
d
> >> a typo?
> >
> > Can you send me an updated patch?  I'd like to try to get where you
> > are that doesn't crash.
>
> Yes, as soon as I have access.
>
> >
> >>
> >>>
> >>> I started undoing the stuff, and I wanted to see if the abb_mpu_iva
> >>> regulator was even running, but I would get -22 errors when I went to
> >>> read the voltage.
> >>>
> >>> # cat /sys/devices/platform/68000000.ocp/483072f0.regulator-abb-mpu/r=
egulator/regulator.5/microvolts
> >>> -22
> >>
> >> So it reports wrong voltage settings of -22=C2=B5V...
> >>
> >> I have tested and have the same.
> >>
> >> root@letux:~# cd /sys/bus/platform/devices/483072f0.regulator-abb-mpu/=
regulator/regulator.3/
> >> root@letux:/sys/bus/platform/devices/483072f0.regulator-abb-mpu/regula=
tor/regulator.3# ls -l
> >> total 0
> >> lrwxrwxrwx 1 root root    0 Jan  1 00:02 device -> ../../../483072f0.r=
egulator-abb-mpu
> >> -r--r--r-- 1 root root 4096 Jan  1 00:02 max_microvolts
> >> -r--r--r-- 1 root root 4096 Jan  1 00:02 microvolts
> >> -r--r--r-- 1 root root 4096 Jan  1 00:02 min_microvolts
> >> -r--r--r-- 1 root root 4096 Jan  1 00:02 name
> >> -r--r--r-- 1 root root 4096 Jan  1 00:02 num_users
> >> lrwxrwxrwx 1 root root    0 Jan  1 00:02 of_node -> ../../../../../../=
firmware/devicetree/base/ocp@68000000/regulator-abb-mpu
> >> drwxr-xr-x 2 root root    0 Jan  1 00:02 power
> >> -r--r--r-- 1 root root 4096 Jan  1 00:02 requested_microamps
> >> lrwxrwxrwx 1 root root    0 Jan  1 00:02 subsystem -> ../../../../../.=
./class/regulator
> >> -r--r--r-- 1 root root 4096 Jan  1 00:02 suspend_disk_state
> >> -r--r--r-- 1 root root 4096 Jan  1 00:02 suspend_mem_state
> >> -r--r--r-- 1 root root 4096 Jan  1 00:02 suspend_standby_state
> >> -r--r--r-- 1 root root 4096 Jan  1 00:02 type
> >> -rw-r--r-- 1 root root 4096 Jan  1 00:02 uevent
> >> root@letux:/sys/bus/platform/devices/483072f0.regulator-abb-mpu/regula=
tor/regulator.3# cat *
> >> cat: device: Is a directory
> >> 1375000
> >> -22
> >> 1012500
> >> abb_mpu_iva
> >> 1
> >> cat: of_node: Is a directory
> >> cat: power: Is a directory
> >> 0
> >> cat: subsystem: Is a directory
> >> disabled
> >> disabled
> >> disabled
> >> voltage
> >> OF_NAME=3Dregulator-abb-mpu
> >> OF_FULLNAME=3D/ocp@68000000/regulator-abb-mpu
> >> OF_COMPATIBLE_0=3Dti,abb-v1
> >> OF_COMPATIBLE_N=3D1
> >
> > I concur with your findings.
> >
> >> root@letux:/sys/bus/platform/devices/483072f0.regulator-abb-mpu/regula=
tor/regulator.3# cd
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
> >>  current CPU frequency is 300 MHz (asserted by call to hardware).
> >>  cpufreq stats: 300 MHz:31.36%, 600 MHz:4.23%, 800 MHz:3.76%, 1000 MHz=
:60.65%  (1933)
> >> root@letux:~#
> >>
> >> So it runs with different OPPs... My chip may also be more robust to w=
rong ABB FBB setting.
> >>
> >>>
> >>> If someone has any suggestions on how to test the abb_mpu_iva driver,
> >>> let me know.
> >>
> >> Well, next I want to look into the code for cat microvolts and
> >> maybe add some printk to understand the result...
> >>
> >> A first result is that it comes from
> >>
> >>        /* We do not know where the OPP voltage is at the moment */
> >>        abb->current_info_idx =3D -EINVAL;
> >>
> >> But this is not treated as an -EINVAL but value of -22 microvolts...
> >> Maybe an error check is missing somewhere in the regulator core.
> >
> > I assumed this to be -EINVAL, but I'd be happy to be wrong.
>
> It seems that cat microvolts stringifies the int returned from reading
> the regulator voltage.
>
> Since it is initialized to -EINVAL it returns "-22" as string instead of
> converting into an errno return when reading /sys... So one step is
> missing a proper error check.
>
> But that is just a symptom that there is no call to set a good voltage.

I unrolled the patches to see what a stock kernel does.  When I 'cat
num_users' it returns 1.  Do you know if there is a way to determine
who the user is?  The stock tree doesn't appear to have any users of
this regulator.

adam
>
> BR,
> Nikolaus
>
