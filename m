Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 53E6CB21DE
	for <lists+linux-omap@lfdr.de>; Fri, 13 Sep 2019 16:24:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727405AbfIMOYj (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 13 Sep 2019 10:24:39 -0400
Received: from mo4-p01-ob.smtp.rzone.de ([85.215.255.52]:25536 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725536AbfIMOYj (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 13 Sep 2019 10:24:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1568384675;
        s=strato-dkim-0002; d=goldelico.com;
        h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=0RQR4EVRvfIGS4a7f65/3zrJcdUshdLqla9xO5wB5Ic=;
        b=oSo2mnx3J5Z8j6rxYvfuUN88Q2uQH98i6iOVhXbLbBNNEluKv2eut+eWyehhYG3hw8
        0krM89wq0A9aFOnAbJ0sNgp2QrJu4H9JLaiyCCsQ1wJ2WPRw6jC/JuN71ZPfkz4d8sQO
        SWBFuH0SwY8smkITV7dbq9fhGU12ov5DQu8nUFxt5mzp6ZFrJe4MBhpymG3yn8ily9dY
        i5waaceXRm3WQii7888oCQqUkrAgMz2NS98OxiT+dm9YNrZuv2X+iaqG/pbulIx12hal
        G3QLQ1q+lq/3nFwOCeptQZhNm01VnvWfF3NDnDgJYu43i1SfPQ0C7Tc/Jc6eB258tLZ3
        w/Ew==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj5Qpw97WFDlSVXA4OAWU="
X-RZG-CLASS-ID: mo00
Received: from imac.fritz.box
        by smtp.strato.de (RZmta 44.27.0 DYNA|AUTH)
        with ESMTPSA id u036f9v8DEOIIgj
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (curve secp521r1 with 521 ECDH bits, eq. 15360 bits RSA))
        (Client did not present a certificate);
        Fri, 13 Sep 2019 16:24:18 +0200 (CEST)
Content-Type: text/plain; charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Subject: Re: [RFC] ARM: dts: omap36xx: Enable thermal throttling
From:   "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <CAHCN7xL-CmwmXP3PLdwAHiC-9tMjrpY4k7ZhxQ9WoXY6yUz8BA@mail.gmail.com>
Date:   Fri, 13 Sep 2019 16:24:18 +0200
Cc:     Linux-OMAP <linux-omap@vger.kernel.org>,
        Tony Lindgren <tony@atomide.com>,
        =?utf-8?Q?Andr=C3=A9_Roth?= <neolynx@gmail.com>,
        Discussions about the Letux Kernel 
        <letux-kernel@openphoenux.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Andreas Kemnade <andreas@kemnade.info>,
        Nishanth Menon <nm@ti.com>, Adam Ford <adam.ford@logicpd.com>,
        kernel@pyra-handheld.com
Content-Transfer-Encoding: quoted-printable
Message-Id: <ABCE2ACA-D19A-42D2-9606-C60F1A5CBCCB@goldelico.com>
References: <20190912183037.18449-1-aford173@gmail.com> <D4F7E03C-1880-45AC-8F7C-6C8A336E2A01@goldelico.com> <CAHCN7xK100mR=fNns3qdDKpOyWsTWXgDnnngQfQ_j8cB_SFfuA@mail.gmail.com> <98751DAF-B3F7-4638-97BE-1D067B24EF18@goldelico.com> <CAHCN7xL-CmwmXP3PLdwAHiC-9tMjrpY4k7ZhxQ9WoXY6yUz8BA@mail.gmail.com>
To:     Adam Ford <aford173@gmail.com>
X-Mailer: Apple Mail (2.3124)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org


> Am 13.09.2019 um 16:05 schrieb Adam Ford <aford173@gmail.com>:
>=20
> On Fri, Sep 13, 2019 at 8:32 AM H. Nikolaus Schaller =
<hns@goldelico.com> wrote:
>>=20
>> Hi Adam,
>>=20
>>> Am 13.09.2019 um 13:07 schrieb Adam Ford <aford173@gmail.com>:
>>=20
>>>>> +     cpu_cooling_maps: cooling-maps {
>>>>> +             map0 {
>>>>> +                     trip =3D <&cpu_alert0>;
>>>>> +                     /* Only allow OPP50 and OPP100 */
>>>>> +                     cooling-device =3D <&cpu 0 1>;
>>>>=20
>>>> omap4-cpu-thermal.dtsi uses THERMAL_NO_LIMIT constants but I do not
>>>> understand their meaning (and how it relates to the opp list).
>>>=20
>>> I read through the documentation, but it wasn't completely clear to
>>> me. AFAICT, the numbers after &cpu represent the min and max index =
in
>>> the OPP table when the condition is hit.
>>=20
>> Ok. It seems to use "cooling state" for those and the first is =
minimum
>> and the last is maximum. Using THERMAL_NO_LIMIT (-1UL) means to have
>> no limits.
>>=20
>> Since here we use the &cpu node it is likely that the "cooling state"
>> is the same as the OPP index currently in use.
>>=20
>> I have looked through the .dts which use cpu_crit and the picture is
>> not unique...
>>=20
>> omap4           seems to only define it
>> am57xx          has two different grade dtsi files
>> dra7            overwrites critical temperature value
>> am57xx-beagle   defines a gpio to control a fan
>=20
> Checkout rk3288-veyron-mickey.dts
>=20
> They have almost_warm, warm, almost_hot, hot, hotter, very_hot, and
> critical for trips, and they have as many corresponding cooling maps
> which appear to limit the CPU speeds, but their index references are
> still confusing to me.

Seems to be quite sophistcated.

The arch/arm/boot/dts/exynos5422-odroidxu3-common.dtsi also has a lot
of trip points. So there may be very different needs...

But it has potentially helpful comments...

				/*=20
				 * When reaching cpu0_alert3, reduce CPU
				 * by 2 steps. On Exynos5422/5800 that =
would
				 * be: 1600 MHz and 1100 MHz.
				 */
				map3 {
					trip =3D <&cpu0_alert3>;
					cooling-device =3D <&cpu0 0 2>;
				};
				map4 {
					trip =3D <&cpu0_alert3>;
					cooling-device =3D <&cpu4 0 2>;
				};
				/*
				 * When reaching cpu0_alert4, reduce CPU
				 * further, down to 600 MHz (12 steps =
for big,
				 * 7 steps for LITTLE).
				 */
				map5 {
					trip =3D <&cpu0_alert4>;
					cooling-device =3D <&cpu0 3 7>;
				};
				map6 {
					trip =3D <&cpu0_alert4>;
					cooling-device =3D <&cpu4 3 12>;
				};

That would mean the second integer is something about how
many steps to reduce.

But the first is not explained.

BTW: this also demonstrates how a single trip point can map to multiple
cooling-device actions (something we likely do not need).

>=20
> For that device,
> Warm and no limit first, then 4:   coolling-device =3D <&cpu0 =
THERMAL_NO_LIMIT 4>
> ...
> very_hot uses a number then no limit: cooling-device =3D <&cpu0 8
> THERMAL_NO_LIMIT>
>=20
> This makes me wonder if the min and max are switched or the index
> values go backwards.

It may depend on the specific cpu driver? Maybe even omap rk and exynos
have different interpretation in code?

>>=20
>> Then we can use the data sheet limits of 90=C2=B0C and 105=C2=B0C in =
the trip point
>> table (which should not be tweaked for sensor inaccuracy).
>=20
> I can see not compensating if it reads high, but if the temp reads
> low, shouldn't compensate so we don't over temp the processor?

I just mean that we must ensure that the TJ is <=3D 90=C2=B0 if the =
bandgap
ever reports 90=C2=B0. So it may report 10 or 20 or even 30 degrees more =
than the
real temperature but never less (reaching the critical temperature too =
early
but not too late).

We can achieve that by adding bias or changing slope etc. in the bandgap =
sensor
driver.

If I find some time I am curious enough to look into the code and the =
data
sheets to understand why it is said to be inaccurate... Maybe there is
jitter from some LDO and it needs a median filter?

And why it seems to add a bias of ca. 10=C2=B0 as soon as I read it more =
than
for the first time. And how well temperature correlates to ambient =
temperature
(it definitively correlates to cpufreq-set -f).

But we should not modify the trip temperatures by 10 or 20 or 30 =
degrees.
IMHO they should have the values defined by the data sheet.

BR,
Nikolaus

