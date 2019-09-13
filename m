Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 41CCBB2661
	for <lists+linux-omap@lfdr.de>; Fri, 13 Sep 2019 22:02:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730174AbfIMUCL (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 13 Sep 2019 16:02:11 -0400
Received: from mail-io1-f68.google.com ([209.85.166.68]:45190 "EHLO
        mail-io1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729118AbfIMUCL (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 13 Sep 2019 16:02:11 -0400
Received: by mail-io1-f68.google.com with SMTP id f12so65198663iog.12;
        Fri, 13 Sep 2019 13:02:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=tZH1kZ/LzZUg/zYDEzt24vyYhNRbeg7r81ZrO9zi7eE=;
        b=bqxTF2/kue8yb1pSMWesbO5LFQM0LijNuShkGB3bOrVoknkQ/ZI4QeID1U8q2knZ9A
         xW6QOW4AzkAvUPo+18nKkY0aQVWlxqe9xyTLNMt/0HeV/xPQRQ1ouoZeTMwZr1BX+88j
         INfxsi7x+JB4Wg78dfJRmiTmDVmq0ji04JO853RUfN8EkfeJB9hNRGFINe4wvmfOP2mo
         6/VavAL5WffW/dbbFkLKCAg82xw6E8qgw/smtyljUqFG1RBwH60cgpeRB9UNCopnG2gp
         TBHq0PZXIWMyJBe8ELdfulocV9ArU2srJgtDyyIBXuukDVaWtc92xcp4jkPh+ZsfMhix
         A0vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=tZH1kZ/LzZUg/zYDEzt24vyYhNRbeg7r81ZrO9zi7eE=;
        b=UT5kwcM8X7Po86b4jJzptmzi/txHx+GjHpa7cU/aiaZ+PABPB/KTvBVtPOrcpdX0zn
         lH9ek0mx3AcQTyO4KJ+t25ZjfJZukAjb4PN/nhnn8KiKSwLP7qU+pnTvvD/1KXHKTTE/
         WQ1cosytZ5kG4uHpT3V8NdCr5JRqSg/YPMD7laVefIjIU6e9LBRcxPsSHruadu62U9Fr
         /8n8Eo5wq0trqUzjg58yL4T0wzix0VsxCaHW+1x2zexsb8sutVTmXT0mMkdTjpbt5SfW
         +1g86kssWqE3CnpwQlVOL+b6JjZviUHR9V7ta3ziIFQtpMZFTXdjAORAVwM5J4g9E/Am
         ltbw==
X-Gm-Message-State: APjAAAU5cP2Tlb5ZiWHxh9t2A/8q0TX8jTAuADU8fL6jU+/AOpyv2E21
        W+J48vUN0V/PC27B4GES8SzuSRGkUHvJF0OM9/M=
X-Google-Smtp-Source: APXvYqykf0VDcI2M2eg6Xc9LJrsOuwnTfh7pz1l84txKOActn2qh/hZXRcyp03mQ0STcQB3NscuKKRu0E+TAMEr6nmI=
X-Received: by 2002:a6b:8e92:: with SMTP id q140mr1885668iod.205.1568404928441;
 Fri, 13 Sep 2019 13:02:08 -0700 (PDT)
MIME-Version: 1.0
References: <20190912183037.18449-1-aford173@gmail.com> <D4F7E03C-1880-45AC-8F7C-6C8A336E2A01@goldelico.com>
 <CAHCN7xK100mR=fNns3qdDKpOyWsTWXgDnnngQfQ_j8cB_SFfuA@mail.gmail.com>
 <98751DAF-B3F7-4638-97BE-1D067B24EF18@goldelico.com> <CAHCN7xL-CmwmXP3PLdwAHiC-9tMjrpY4k7ZhxQ9WoXY6yUz8BA@mail.gmail.com>
 <ABCE2ACA-D19A-42D2-9606-C60F1A5CBCCB@goldelico.com> <CAHCN7xKfeh-cqJVfbW_km27cgee2MEBdPM3edACRi0fCaohxvw@mail.gmail.com>
 <7C9393BD-B23B-41A6-BF96-E53CD707AAC7@goldelico.com> <CAHCN7x+_f_jrttUGyKHBOUyYjkOx0mJxba1Yb3tPm9ee7+21og@mail.gmail.com>
 <CAHCN7xLODa114M77-rX9WHT+uJtsH3yOmbFG2KdEjZpTSECs2w@mail.gmail.com>
 <D3AF2868-F9A4-4176-A851-5DCF029B65A9@goldelico.com> <81d6cd33-4930-6753-d5ed-678cb1d2038d@linaro.org>
 <CAHCN7xLcCO-QrYTm0jzS64P6o5t8cfudJfYELDSz-_OPV5JO5w@mail.gmail.com>
In-Reply-To: <CAHCN7xLcCO-QrYTm0jzS64P6o5t8cfudJfYELDSz-_OPV5JO5w@mail.gmail.com>
From:   Adam Ford <aford173@gmail.com>
Date:   Fri, 13 Sep 2019 15:01:56 -0500
Message-ID: <CAHCN7xK7Bs2fjgtWjPzVzNWiap4VAWxM3AkihsX-NByDW+df+g@mail.gmail.com>
Subject: Re: [RFC] ARM: dts: omap36xx: Enable thermal throttling
To:     Daniel Lezcano <daniel.lezcano@linaro.org>
Cc:     "H. Nikolaus Schaller" <hns@goldelico.com>,
        Linux-OMAP <linux-omap@vger.kernel.org>,
        Tony Lindgren <tony@atomide.com>,
        =?UTF-8?Q?Andr=C3=A9_Roth?= <neolynx@gmail.com>,
        Discussions about the Letux Kernel 
        <letux-kernel@openphoenux.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Andreas Kemnade <andreas@kemnade.info>,
        Nishanth Menon <nm@ti.com>, Adam Ford <adam.ford@logicpd.com>,
        kernel@pyra-handheld.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Fri, Sep 13, 2019 at 1:46 PM Adam Ford <aford173@gmail.com> wrote:
>
> On Fri, Sep 13, 2019 at 12:18 PM Daniel Lezcano
> <daniel.lezcano@linaro.org> wrote:
> >
> > On 13/09/2019 18:51, H. Nikolaus Schaller wrote:
> >
> > [ ... ]
> >
> > >> Good news (I think)
> > >>
> > >> With cooling-device =3D <&cpu 1 2> setup, I was able to ask the max
> > >> frequency and it returned 600MHz.
> > >>
> > >> # cat /sys/devices/virtual/thermal/thermal_zone0/temp
> > >> 58500
> > >> # cat /sys/devices/system/cpu/cpufreq/policy0/scaling_available_freq=
uencies
> > >> 300000 600000 800000
> > >> # cat /sys/devices/system/cpu/cpufreq/policy0/scaling_m
> > >> scaling_max_freq  scaling_min_freq
> > >> # cat /sys/devices/system/cpu/cpufreq/policy0/scaling_max_freq
> > >> 600000
> > >
> > > looks good!
> > > But we have to understand what the <&cpu 1 2> exactly means...
> > >
> > > Hopefully someone reading your RFCv2 can answer...
> >
> Daniel,
>
> Thank you for replying.
>
> > I may have missed the question :)
> >
> > These are the states allowed for the cooling device (the one you can se=
e
> > in the /sys/class/thermal/cooling_device0/max_state. As the logic is
> > inverted for cpufreq, that can be confusing.
>
> I think that's what has be confused.
>
> >
> > If it was a fan with, let's say 5 speeds, you would use <&fan 0 5>, so
> > when the mitigation begins the cooling device state is 0 and then the
> > thermal governor increase the state until it sees a cooling effect.
> >
> > If <&fan 0 2> is set, the governor won't set a state above 2 even if th=
e
> > temperature increases.
>
> I am not sure I know what you mean by 'state' in this context.
>
> >
> > When the cooling driver is able to return the number of states it
> > supports, it is safe to set the states to THERMAL_NO_LIMIT and let the
> > governor to find the balance point.
>
> If the cooling driver is using cpufreq, is the number of supported
> states equal to the number of operating points given to cpufreq?
>
> >
> > Now if the cooling device is cpufreq, the state order is inverted,
> > because the cooling effects happens when decreasing the OPP.
> >
> > If the boards support 7 OPPs, the state 0 is 7 - 0, so no mitigation, i=
f
> > the state is 1, the cpufreq is throttle to the 6th OPP, 2 to the 5th OP=
P
> > etc.
>
> I am not sure how the state would be set to 2.
>
> >
> > Now the different combinations:
> >
> > <&cpu THERMAL_NO_LIMIT THERMAL_NO_LIMIT> the governor will use the stat=
e
> > 0 to 7.
> >
> > <&cpu THERMAL_NO_LIMIT 2> the governor will use the state 0 to 2
>
> What would be the difference between  <&cpu THERMAL_NO_LIMIT 2>  and
> <&cpu 0 2> ?
> (if there is any)
>
> >
> > <&cpu 1 2> the governor will use the state 1 and 2. That means there is
> > always the cooling effect as the governor won't set it to zero thus
> > stopping the mitigation.
>
> For the purposes of the board in question, we have 4 operating points,
> 300MHz, 600MHz, 800MHz and 1GHz.  Once the board reaches 90C, we need
> them to cease operation at 800MHz and 1GHz and only permit operation
> at 300MHz and 600MHz.  I am going under the assumption that the cpu
> index[0] would be for 300MHz, index[1] =3D 600MHz, etc.
>
> If I am interpreting your comment correctly, I should set <&cpu
> THERMAL_NO_LIMIT 2> which would allow it to either not cool and run up
> to 600MHz and not exceed, is that correct?
>
> >
> >
> > Does it clarify the DT spec?
> >
>
> I think your reply to my inquiry might.  If possible, it would be nice
> to get this documented into the bindings doc for others in the future.
> I can do it, but someone with a better understanding of the concept
> maybe more qualified.  I can totally understand why some may want to
> integrate this into their SoC device trees to slow the processor when
> hot.
>
> Thank you for taking the time to review this.  I appreciate it.
>
> adam
>
> >
> >
> >
> > > What happens with trip point 60000?
> > > (unfortunately one has to reboot in between or can you kexec between =
two kernel/dtb versions?)

I set the trip point just above the ambient temp.  I then tried to run
some benchmarks in the background while constantly polling the max
frequency and it changes, but it needs to skip the 800MHz point and
jump right to the 600 MHz point (or lower)

# cat /sys/devices/system/cpu/cpufreq/policy0/scaling_max_freq
800000

# cat /sys/devices/system/cpu/cpufreq/policy0/scaling_max_freq
600000


Loops: 80000, Iterations: 1, Duration: 12 sec.
C Converted Double Precision Whetstones: 666.7 MIPS
# cat /sys/devices/system/cpu/cpufreq/policy0/scaling_max_freq
800000

[1]+  Done                       whetstone 80000

# cat /sys/devices/system/cpu/cpufreq/policy0/scaling_max_freq
800000

# cat /sys/devices/system/cpu/cpufreq/policy0/scaling_max_freq
1000000


> > >
> > > BR,
> > > Nikolaus
> > >
> >
> >
> > --
> >  <http://www.linaro.org/> Linaro.org =E2=94=82 Open source software for=
 ARM SoCs
> >
> > Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
> > <http://twitter.com/#!/linaroorg> Twitter |
> > <http://www.linaro.org/linaro-blog/> Blog
> >
