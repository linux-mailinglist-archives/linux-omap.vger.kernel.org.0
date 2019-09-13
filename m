Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C84C2B2194
	for <lists+linux-omap@lfdr.de>; Fri, 13 Sep 2019 16:06:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388392AbfIMOGB (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 13 Sep 2019 10:06:01 -0400
Received: from mail-io1-f43.google.com ([209.85.166.43]:42174 "EHLO
        mail-io1-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388229AbfIMOGB (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 13 Sep 2019 10:06:01 -0400
Received: by mail-io1-f43.google.com with SMTP id n197so62789883iod.9;
        Fri, 13 Sep 2019 07:06:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=p+mughJxaYhP88ukBk7Ah6PvSL5JyfCszCFusxq/u0A=;
        b=C6LinUjhYPgy9EPodYN2gtTGlAraHCxRYT5wrdQm/XxtVHk+zY3gVejMxyi3m5k5rc
         VFDhXSerXi243OVIKHdtJIB2qB782AW+nqdrsiBgd+6qhu/6mI1CHaVOJL2Pr2MfGhXY
         fL9eRuk8LFtCAlNFRD4p4iVA7JA4ozGla7tBrC5Gf6oSD6Z8QW7Lfchna8uztTrZuPck
         6wOk1oA6Kq/NUqR35nZQTA269wDP9qTjyGLc5tfUVB4Ur6h0H/nnReXAnM/LsTJImHw5
         mBGk44UL8G/rMFqr70thN8gvw0A3BlS6Lb2TkiGJ5CRxsOyEhRwyZnBK1oHY8Q869QM0
         HFdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=p+mughJxaYhP88ukBk7Ah6PvSL5JyfCszCFusxq/u0A=;
        b=Vsg7Y1PFVeRKHjMhaZQ+BJNDYMhS26TeCVwH58oJW8S2gg6feK2xj5eCc5LcZF9tGD
         d2V/xqwCa4pwYVSEb+Ee8zLzyjDPLjJtd+KEgpRDb1BOONQv3t3Cvn/qxR6k+tcuAuQb
         mNE80q1YTTseBxdChn4HPecFcIpvyWnmql9nroG0lwPLZ4aYr2k8urr0Th4l+Zb8qbOI
         L/awcwdWy1DgTGSZWjGkjpERlKTMAqF/eH9Og+R95aO+1sAwRqLFMfhPa5hhdvEZbQDP
         8GiLGQJF6loKYTglYYGmkR0xELTcwBoU1W/6TigtV41JDYGsq97zjQYecMS2JWLPw/lv
         PwTQ==
X-Gm-Message-State: APjAAAXJjJbumuo3I1S/6X78IwSQUR01VwzXeqgUOJlAXDPymJYQ7wd9
        NeiUgG0fW5gwrADmHvo0JzQz7vAVpdIgmgc7Xsg=
X-Google-Smtp-Source: APXvYqwpQkcP2Xkp3mSXI6ATCVJUVQolqcrzb2AE4BX+QY5Whg+GyL4Wiqq3r2GEcSxm+CHcz3/r8Ctna+oFO8sp/zY=
X-Received: by 2002:a6b:b78b:: with SMTP id h133mr4202iof.276.1568383560189;
 Fri, 13 Sep 2019 07:06:00 -0700 (PDT)
MIME-Version: 1.0
References: <20190912183037.18449-1-aford173@gmail.com> <D4F7E03C-1880-45AC-8F7C-6C8A336E2A01@goldelico.com>
 <CAHCN7xK100mR=fNns3qdDKpOyWsTWXgDnnngQfQ_j8cB_SFfuA@mail.gmail.com> <98751DAF-B3F7-4638-97BE-1D067B24EF18@goldelico.com>
In-Reply-To: <98751DAF-B3F7-4638-97BE-1D067B24EF18@goldelico.com>
From:   Adam Ford <aford173@gmail.com>
Date:   Fri, 13 Sep 2019 09:05:48 -0500
Message-ID: <CAHCN7xL-CmwmXP3PLdwAHiC-9tMjrpY4k7ZhxQ9WoXY6yUz8BA@mail.gmail.com>
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

On Fri, Sep 13, 2019 at 8:32 AM H. Nikolaus Schaller <hns@goldelico.com> wr=
ote:
>
> Hi Adam,
>
> > Am 13.09.2019 um 13:07 schrieb Adam Ford <aford173@gmail.com>:
>
> >>> +     cpu_cooling_maps: cooling-maps {
> >>> +             map0 {
> >>> +                     trip =3D <&cpu_alert0>;
> >>> +                     /* Only allow OPP50 and OPP100 */
> >>> +                     cooling-device =3D <&cpu 0 1>;
> >>
> >> omap4-cpu-thermal.dtsi uses THERMAL_NO_LIMIT constants but I do not
> >> understand their meaning (and how it relates to the opp list).
> >
> > I read through the documentation, but it wasn't completely clear to
> > me. AFAICT, the numbers after &cpu represent the min and max index in
> > the OPP table when the condition is hit.
>
> Ok. It seems to use "cooling state" for those and the first is minimum
> and the last is maximum. Using THERMAL_NO_LIMIT (-1UL) means to have
> no limits.
>
> Since here we use the &cpu node it is likely that the "cooling state"
> is the same as the OPP index currently in use.
>
> I have looked through the .dts which use cpu_crit and the picture is
> not unique...
>
> omap4           seems to only define it
> am57xx          has two different grade dtsi files
> dra7            overwrites critical temperature value
> am57xx-beagle   defines a gpio to control a fan

Checkout rk3288-veyron-mickey.dts

They have almost_warm, warm, almost_hot, hot, hotter, very_hot, and
critical for trips, and they have as many corresponding cooling maps
which appear to limit the CPU speeds, but their index references are
still confusing to me.

For that device,
Warm and no limit first, then 4:   coolling-device =3D <&cpu0 THERMAL_NO_LI=
MIT 4>
...
very_hot uses a number then no limit: cooling-device =3D <&cpu0 8
THERMAL_NO_LIMIT>

This makes me wonder if the min and max are switched or the index
values go backwards.

>
> The fan is only a map0 for the board_alert0 starting to do something at 4=
0=C2=B0C
> and above but there is nothing for the "critical" point.
> But throttling is working on omap5...
>
> Could there be some automatic handling by the govenors for the "critical"
> trip points? So that we do not need to define any cooling-maps for "criti=
cal"?
>
> Even for the exynos54xx where the crical trip point is only defined.
>



> >>
> >>> +             };
> >>> +     };
> >>
> >> Seems to make sense when comparing to omap4-cpu-thermal.dtsi...
> >>
> >> Maybe we can add the trip points to omap3-cpu-thermal.dtsi
> >> because they seem to be the same for all omap3 variants and
> >> just have a SoC variant specific cooling map for omap36xx.dtsi.
> >
> > The OPP's for OMAP3530 show that OPP5 and OPP6 are capable of
> > operating at 105C.  AM3517 is a little different also, so I didn't
> > want to make a generic omap3 throttling table.  Since my goal was to
> > try to remove the need for the turbo option from the newly supported
> > 1GHz omap3630/3730, I was hoping to get this pushed first.  From
> > there, we can tweak the 34xx.dtsi and 3517.dtsi for their respective
> > thermal information.
>
> My observation is that all omap3 have
> commercial range        0=C2=B0C .. 90=C2=B0C
> extended                -40=C2=B0C .. 105=C2=B0C
>
> So there is no difference in defining these as trip points and
> my proposal would be to have these in omap3.dtsi.

I can do that.  I'll copy-paste the omap4 stuff using 90 and 105 as
limits without any mapping.  I'll then keep the mapping in omap3630

>
> Only disabling OPPs differs. Which would make only the mapping
> go to omap36xx.
>
> >
> >>
> >>> +};
> >>> +
> >>> /* OMAP3630 needs dss_96m_fck for VENC */
> >>> &venc {
> >>>      clocks =3D <&dss_tv_fck>, <&dss_96m_fck>;
> >>> --
> >>> 2.17.1
> >>>
> >>
> >> The question is how we can test that. Heating up the omap36xx to 90=C2=
=B0C
> >> or even 105=C2=B0C isn't that easy like with omap5...
> >>
> >> Maybe we can modify the millicelsius values for testing purposes to
> >> something in reachable range, e.g. 60=C2=B0C and 70=C2=B0C and watch w=
hat happens?
> >
> > I have access to a thermal chamber at work, but the guy who knows how
> > to use it is out for the rest of the week.  My plan was do as you
> > suggested and change the milicelsius values, but I wanted to get some
> > buy-in from TI people and/or Tony.  This also means enabling the omap3
> > thermal stuff which clearly throws a message that it's inaccurate.
>
> Basically we need two different types of test:
> 1. is the DTS setup correct so that the bandgap sensor is read and
>    triggers correct actions
> 2. is the bandgap sensor correct enough to that the data sheet limits
>    are really met
>
> >  I don't know how much it's inaccurate, so we may have to make the 90C
> > value lower to compensate.
>
> Hm. If the bandgap sensor is inaccurate, we should make sure it reports t=
he
> maximum value, just to be on the safe side. So that the real temperature
> is guaranteed to be lower than what is reported.
>
> Then we can use the data sheet limits of 90=C2=B0C and 105=C2=B0C in the =
trip point
> table (which should not be tweaked for sensor inaccuracy).

I can see not compensating if it reads high, but if the temp reads
low, shouldn't compensate so we don't over temp the processor?

adam
>
> BR,
> Nikolaus
>
