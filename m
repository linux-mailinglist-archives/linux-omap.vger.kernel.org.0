Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 28AAFB22D0
	for <lists+linux-omap@lfdr.de>; Fri, 13 Sep 2019 17:02:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390387AbfIMPCI (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 13 Sep 2019 11:02:08 -0400
Received: from mail-io1-f66.google.com ([209.85.166.66]:46738 "EHLO
        mail-io1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390376AbfIMPCI (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 13 Sep 2019 11:02:08 -0400
Received: by mail-io1-f66.google.com with SMTP id d17so41260561ios.13;
        Fri, 13 Sep 2019 08:02:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=l5FDHbt8lqGJHAWfO4cgNSZrnf0h9Sq8dTow7K6r8jI=;
        b=GfxjsW6Bh/ewfSByUpN0azT/eN5lDwC4a3uApj0HQfyln/Gjb8leQ6dkQCNLMvMLfE
         yDw83dcFS5bbpyltm2p64jdbE+Yj5bbnqdlmHubkkp/bgxWkgh4rhlBmvPxk+YaZlOEf
         jZfVRncSyeSN+UhxuflBLrOuSwSMkB255pqKoQPtKd6N4JqspKs2v8IaOMEAKnQ4TlVj
         WFIfzmPXJModv8i21LNvwthrar48qdihLsiqMreCL6nLOUI0fBIQD8oenmWgwB3bjgNj
         HlH3jH9VHuN8ukr/Zdv9BstVhIW3Y4aFqjN0BzWwheHgy+T58iXFwbAZO5u41CbS3c1e
         xnfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=l5FDHbt8lqGJHAWfO4cgNSZrnf0h9Sq8dTow7K6r8jI=;
        b=YAcgmPtuzgz/H/LKtj+z+9aP7Gblx+/fShU/kIYDBCmdg6fWNyXVjPuC4MSRxSxTBK
         Jwmc9qyGPJ3awg7HFTT3t/Dnov6wAIqh9+V5zMGux2as/2AChNDHYkyaXIne+Asfvufr
         9vT1rHVjeniEwiC2J+/p+e/cZYJgY1QquinL3vyhYM3663h/t2oppVn8tRm/061rFenw
         wQB7X5yGQpEZZXI3f9MGQaIms6/E3Xq0W/YtPgGxHSevGN65JwlNSHj6hLmXfrf5eRkh
         Wh/YGRQziHYhP1pfOvqsMb/K70TAB+/k/xPKDBVZwQC8srz4AshAGDp95GfpYioTZP4d
         ZIbw==
X-Gm-Message-State: APjAAAVi8t1N2HZLlPpkrIidsFKn0xDNHKCr4hnAoogvRiV/H+ja9PC6
        O7BvGE+RN3MsdTjOScdidn0D7F7klSUEoC8KftonaA==
X-Google-Smtp-Source: APXvYqyS8kp3Oxa+ZkW/xzmIjtGuJ0ULPdjfslQ9lAlwJPx9It9zOZQBbTgQMX3Fg2Uomu/X6GZz5ZKg0eZg4TAsyBI=
X-Received: by 2002:a6b:c581:: with SMTP id v123mr286873iof.158.1568386926591;
 Fri, 13 Sep 2019 08:02:06 -0700 (PDT)
MIME-Version: 1.0
References: <20190912183037.18449-1-aford173@gmail.com> <D4F7E03C-1880-45AC-8F7C-6C8A336E2A01@goldelico.com>
 <CAHCN7xK100mR=fNns3qdDKpOyWsTWXgDnnngQfQ_j8cB_SFfuA@mail.gmail.com>
 <98751DAF-B3F7-4638-97BE-1D067B24EF18@goldelico.com> <CAHCN7xL-CmwmXP3PLdwAHiC-9tMjrpY4k7ZhxQ9WoXY6yUz8BA@mail.gmail.com>
 <ABCE2ACA-D19A-42D2-9606-C60F1A5CBCCB@goldelico.com>
In-Reply-To: <ABCE2ACA-D19A-42D2-9606-C60F1A5CBCCB@goldelico.com>
From:   Adam Ford <aford173@gmail.com>
Date:   Fri, 13 Sep 2019 10:01:55 -0500
Message-ID: <CAHCN7xKfeh-cqJVfbW_km27cgee2MEBdPM3edACRi0fCaohxvw@mail.gmail.com>
Subject: Re: [RFC] ARM: dts: omap36xx: Enable thermal throttling
To:     "H. Nikolaus Schaller" <hns@goldelico.com>
Cc:     Linux-OMAP <linux-omap@vger.kernel.org>,
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

On Fri, Sep 13, 2019 at 9:24 AM H. Nikolaus Schaller <hns@goldelico.com> wr=
ote:
>
>
> > Am 13.09.2019 um 16:05 schrieb Adam Ford <aford173@gmail.com>:
> >
> > On Fri, Sep 13, 2019 at 8:32 AM H. Nikolaus Schaller <hns@goldelico.com=
> wrote:
> >>
> >> Hi Adam,
> >>
> >>> Am 13.09.2019 um 13:07 schrieb Adam Ford <aford173@gmail.com>:
> >>
> >>>>> +     cpu_cooling_maps: cooling-maps {
> >>>>> +             map0 {
> >>>>> +                     trip =3D <&cpu_alert0>;
> >>>>> +                     /* Only allow OPP50 and OPP100 */
> >>>>> +                     cooling-device =3D <&cpu 0 1>;
> >>>>
> >>>> omap4-cpu-thermal.dtsi uses THERMAL_NO_LIMIT constants but I do not
> >>>> understand their meaning (and how it relates to the opp list).
> >>>
> >>> I read through the documentation, but it wasn't completely clear to
> >>> me. AFAICT, the numbers after &cpu represent the min and max index in
> >>> the OPP table when the condition is hit.
> >>
> >> Ok. It seems to use "cooling state" for those and the first is minimum
> >> and the last is maximum. Using THERMAL_NO_LIMIT (-1UL) means to have
> >> no limits.
> >>
> >> Since here we use the &cpu node it is likely that the "cooling state"
> >> is the same as the OPP index currently in use.
> >>
> >> I have looked through the .dts which use cpu_crit and the picture is
> >> not unique...
> >>
> >> omap4           seems to only define it
> >> am57xx          has two different grade dtsi files
> >> dra7            overwrites critical temperature value
> >> am57xx-beagle   defines a gpio to control a fan
> >

I am going to push a separate but related RFC with 2 patches in the
series.  This new one will setup the alerts and maps without any
throttling for all omap3's in the first patch.  The second patch will
consolidate the thermal references to omap3.dtsi so omap34, omap36 and
am35 can all use them without having to duplicate the entries.

It will make the omap36xx changes simpler to manage, because we can
just modify a portion of the entries instead of having the whole
table.

Once this parallel RFC gets comments/feedback, I'll re-integrate the
omap36xx throttling.

adam

> > Checkout rk3288-veyron-mickey.dts
> >
> > They have almost_warm, warm, almost_hot, hot, hotter, very_hot, and
> > critical for trips, and they have as many corresponding cooling maps
> > which appear to limit the CPU speeds, but their index references are
> > still confusing to me.
>
> Seems to be quite sophistcated.
>
> The arch/arm/boot/dts/exynos5422-odroidxu3-common.dtsi also has a lot
> of trip points. So there may be very different needs...
>
> But it has potentially helpful comments...
>
>                                 /*
>                                  * When reaching cpu0_alert3, reduce CPU
>                                  * by 2 steps. On Exynos5422/5800 that wo=
uld
>                                  * be: 1600 MHz and 1100 MHz.
>                                  */
>                                 map3 {
>                                         trip =3D <&cpu0_alert3>;
>                                         cooling-device =3D <&cpu0 0 2>;
>                                 };
>                                 map4 {
>                                         trip =3D <&cpu0_alert3>;
>                                         cooling-device =3D <&cpu4 0 2>;
>                                 };
>                                 /*
>                                  * When reaching cpu0_alert4, reduce CPU
>                                  * further, down to 600 MHz (12 steps for=
 big,
>                                  * 7 steps for LITTLE).
>                                  */
>                                 map5 {
>                                         trip =3D <&cpu0_alert4>;
>                                         cooling-device =3D <&cpu0 3 7>;
>                                 };
>                                 map6 {
>                                         trip =3D <&cpu0_alert4>;
>                                         cooling-device =3D <&cpu4 3 12>;
>                                 };
>
> That would mean the second integer is something about how
> many steps to reduce.
>
> But the first is not explained.
>
> BTW: this also demonstrates how a single trip point can map to multiple
> cooling-device actions (something we likely do not need).
>
> >
> > For that device,
> > Warm and no limit first, then 4:   coolling-device =3D <&cpu0 THERMAL_N=
O_LIMIT 4>
> > ...
> > very_hot uses a number then no limit: cooling-device =3D <&cpu0 8
> > THERMAL_NO_LIMIT>
> >
> > This makes me wonder if the min and max are switched or the index
> > values go backwards.
>
> It may depend on the specific cpu driver? Maybe even omap rk and exynos
> have different interpretation in code?
>
> >>
> >> Then we can use the data sheet limits of 90=C2=B0C and 105=C2=B0C in t=
he trip point
> >> table (which should not be tweaked for sensor inaccuracy).
> >
> > I can see not compensating if it reads high, but if the temp reads
> > low, shouldn't compensate so we don't over temp the processor?
>
> I just mean that we must ensure that the TJ is <=3D 90=C2=B0 if the bandg=
ap
> ever reports 90=C2=B0. So it may report 10 or 20 or even 30 degrees more =
than the
> real temperature but never less (reaching the critical temperature too ea=
rly
> but not too late).
>
> We can achieve that by adding bias or changing slope etc. in the bandgap =
sensor
> driver.
>
> If I find some time I am curious enough to look into the code and the dat=
a
> sheets to understand why it is said to be inaccurate... Maybe there is
> jitter from some LDO and it needs a median filter?
>
> And why it seems to add a bias of ca. 10=C2=B0 as soon as I read it more =
than
> for the first time. And how well temperature correlates to ambient temper=
ature
> (it definitively correlates to cpufreq-set -f).
>
> But we should not modify the trip temperatures by 10 or 20 or 30 degrees.
> IMHO they should have the values defined by the data sheet.
>
> BR,
> Nikolaus
>
