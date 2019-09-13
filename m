Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B2B7DB255B
	for <lists+linux-omap@lfdr.de>; Fri, 13 Sep 2019 20:46:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389420AbfIMSq4 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 13 Sep 2019 14:46:56 -0400
Received: from mail-io1-f67.google.com ([209.85.166.67]:33607 "EHLO
        mail-io1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388709AbfIMSq4 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 13 Sep 2019 14:46:56 -0400
Received: by mail-io1-f67.google.com with SMTP id m11so64798148ioo.0;
        Fri, 13 Sep 2019 11:46:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=lmfbL2z4vtd0VpWMSffUTIuSUrzLUyG+rIioXPWyrbU=;
        b=Hh/fwrS9Vz2AMXYkNwffok9v+0LoV3kYjFIfU3ztvIY7jfzsxVexBCCuH3L7grIzD1
         kETCshVfoivMis6vQUgQGtKU2NDzRfFR2FrniOC3fnqovMZX4Fb4JV89gQn/D6or5O1f
         0rdwZagkwAjqSa7Tzy6ngX9qCYLrkQzmPysUHDEmEolIClOMFf6JVroTdNO4w5Giq9FJ
         58eItxLZhOed7rGDGqmxYOndfjxAhNl4EnWyEGuHrdMW5Ht+lXpVtc4sdNoEtyHSWlQH
         4x8dMaAxldn1rOK1LzE9kksupfB+Sb36vLaTzBc9xEG08pYwKECOJtYn92uukOV93mct
         Ykmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=lmfbL2z4vtd0VpWMSffUTIuSUrzLUyG+rIioXPWyrbU=;
        b=NwubNkw9QTeE8ccDTkK7SbkdhZSOUAIGyXpRvJ90rpjNpzhTWrxEq/aiT7cI7V2ZIJ
         gk9AXcWlHTVVPVm0oVlVqhYxY7yzzZfyu9oOUKtxDL/CkDvhFjippUsvvViZwbH8xwSb
         8V9KNjumNSPzAWnp8tYXDa0Kd/gB5Tbo2erTV/55KFbROuChz4QQVN57Y628OcXwA4dQ
         DrGyhA6eZv9dqlrKEb245aZGnDPcxGIZnXl8xYNQcWa+Sa1hxZk3tNJXls6ge02W76Pg
         NGs3UvTOsHX59Gesd59DmkkfN6lRsnSEBWePJfWBtlI6FdvgSjXuHXHU+w35Rbp/5pod
         f7/w==
X-Gm-Message-State: APjAAAWtISumOTftVYAFyZGV0E7e1MqKNjicYSUupeA01Au6+7w5TNid
        6P0oCUe9INReGUQnXzYdLlljLlRBKBgD5XHM4GQ=
X-Google-Smtp-Source: APXvYqzjtkOMuV22EzyZSoPa9S6e+4Act4hSQeIz0woAi8ZBiGv01NF5q/CMpbHMdt67bo3+yRjvLd2jW71R3voJehs=
X-Received: by 2002:a6b:cd81:: with SMTP id d123mr1526093iog.78.1568400413443;
 Fri, 13 Sep 2019 11:46:53 -0700 (PDT)
MIME-Version: 1.0
References: <20190912183037.18449-1-aford173@gmail.com> <D4F7E03C-1880-45AC-8F7C-6C8A336E2A01@goldelico.com>
 <CAHCN7xK100mR=fNns3qdDKpOyWsTWXgDnnngQfQ_j8cB_SFfuA@mail.gmail.com>
 <98751DAF-B3F7-4638-97BE-1D067B24EF18@goldelico.com> <CAHCN7xL-CmwmXP3PLdwAHiC-9tMjrpY4k7ZhxQ9WoXY6yUz8BA@mail.gmail.com>
 <ABCE2ACA-D19A-42D2-9606-C60F1A5CBCCB@goldelico.com> <CAHCN7xKfeh-cqJVfbW_km27cgee2MEBdPM3edACRi0fCaohxvw@mail.gmail.com>
 <7C9393BD-B23B-41A6-BF96-E53CD707AAC7@goldelico.com> <CAHCN7x+_f_jrttUGyKHBOUyYjkOx0mJxba1Yb3tPm9ee7+21og@mail.gmail.com>
 <CAHCN7xLODa114M77-rX9WHT+uJtsH3yOmbFG2KdEjZpTSECs2w@mail.gmail.com>
 <D3AF2868-F9A4-4176-A851-5DCF029B65A9@goldelico.com> <81d6cd33-4930-6753-d5ed-678cb1d2038d@linaro.org>
In-Reply-To: <81d6cd33-4930-6753-d5ed-678cb1d2038d@linaro.org>
From:   Adam Ford <aford173@gmail.com>
Date:   Fri, 13 Sep 2019 13:46:41 -0500
Message-ID: <CAHCN7xLcCO-QrYTm0jzS64P6o5t8cfudJfYELDSz-_OPV5JO5w@mail.gmail.com>
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

On Fri, Sep 13, 2019 at 12:18 PM Daniel Lezcano
<daniel.lezcano@linaro.org> wrote:
>
> On 13/09/2019 18:51, H. Nikolaus Schaller wrote:
>
> [ ... ]
>
> >> Good news (I think)
> >>
> >> With cooling-device =3D <&cpu 1 2> setup, I was able to ask the max
> >> frequency and it returned 600MHz.
> >>
> >> # cat /sys/devices/virtual/thermal/thermal_zone0/temp
> >> 58500
> >> # cat /sys/devices/system/cpu/cpufreq/policy0/scaling_available_freque=
ncies
> >> 300000 600000 800000
> >> # cat /sys/devices/system/cpu/cpufreq/policy0/scaling_m
> >> scaling_max_freq  scaling_min_freq
> >> # cat /sys/devices/system/cpu/cpufreq/policy0/scaling_max_freq
> >> 600000
> >
> > looks good!
> > But we have to understand what the <&cpu 1 2> exactly means...
> >
> > Hopefully someone reading your RFCv2 can answer...
>
Daniel,

Thank you for replying.

> I may have missed the question :)
>
> These are the states allowed for the cooling device (the one you can see
> in the /sys/class/thermal/cooling_device0/max_state. As the logic is
> inverted for cpufreq, that can be confusing.

I think that's what has be confused.

>
> If it was a fan with, let's say 5 speeds, you would use <&fan 0 5>, so
> when the mitigation begins the cooling device state is 0 and then the
> thermal governor increase the state until it sees a cooling effect.
>
> If <&fan 0 2> is set, the governor won't set a state above 2 even if the
> temperature increases.

I am not sure I know what you mean by 'state' in this context.

>
> When the cooling driver is able to return the number of states it
> supports, it is safe to set the states to THERMAL_NO_LIMIT and let the
> governor to find the balance point.

If the cooling driver is using cpufreq, is the number of supported
states equal to the number of operating points given to cpufreq?

>
> Now if the cooling device is cpufreq, the state order is inverted,
> because the cooling effects happens when decreasing the OPP.
>
> If the boards support 7 OPPs, the state 0 is 7 - 0, so no mitigation, if
> the state is 1, the cpufreq is throttle to the 6th OPP, 2 to the 5th OPP
> etc.

I am not sure how the state would be set to 2.

>
> Now the different combinations:
>
> <&cpu THERMAL_NO_LIMIT THERMAL_NO_LIMIT> the governor will use the state
> 0 to 7.
>
> <&cpu THERMAL_NO_LIMIT 2> the governor will use the state 0 to 2

What would be the difference between  <&cpu THERMAL_NO_LIMIT 2>  and
<&cpu 0 2> ?
(if there is any)

>
> <&cpu 1 2> the governor will use the state 1 and 2. That means there is
> always the cooling effect as the governor won't set it to zero thus
> stopping the mitigation.

For the purposes of the board in question, we have 4 operating points,
300MHz, 600MHz, 800MHz and 1GHz.  Once the board reaches 90C, we need
them to cease operation at 800MHz and 1GHz and only permit operation
at 300MHz and 600MHz.  I am going under the assumption that the cpu
index[0] would be for 300MHz, index[1] =3D 600MHz, etc.

If I am interpreting your comment correctly, I should set <&cpu
THERMAL_NO_LIMIT 2> which would allow it to either not cool and run up
to 600MHz and not exceed, is that correct?

>
>
> Does it clarify the DT spec?
>

I think your reply to my inquiry might.  If possible, it would be nice
to get this documented into the bindings doc for others in the future.
I can do it, but someone with a better understanding of the concept
maybe more qualified.  I can totally understand why some may want to
integrate this into their SoC device trees to slow the processor when
hot.

Thank you for taking the time to review this.  I appreciate it.

adam

>
>
>
> > What happens with trip point 60000?
> > (unfortunately one has to reboot in between or can you kexec between tw=
o kernel/dtb versions?)
> >
> > BR,
> > Nikolaus
> >
>
>
> --
>  <http://www.linaro.org/> Linaro.org =E2=94=82 Open source software for A=
RM SoCs
>
> Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
> <http://twitter.com/#!/linaroorg> Twitter |
> <http://www.linaro.org/linaro-blog/> Blog
>
