Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8296DADB90
	for <lists+linux-omap@lfdr.de>; Mon,  9 Sep 2019 16:57:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732084AbfIIO5D (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 9 Sep 2019 10:57:03 -0400
Received: from mo4-p00-ob.smtp.rzone.de ([85.215.255.20]:13205 "EHLO
        mo4-p00-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731919AbfIIO5D (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 9 Sep 2019 10:57:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1568041017;
        s=strato-dkim-0002; d=goldelico.com;
        h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=GF9QWFAeWPT5xgeVLqGMsw7outsKW8oxl4popYjcjI8=;
        b=ty9pCv8ip+gaah9Y9z85fY/iB77O+EDu/L37zwpZFWdY1IY4YswF61m5qH3PVj71k0
        G3KTIJEnAe1wvYEkjopmjRP3r7I+QfWXkKn2PPJPyBSqIN+GJDK47Y4VgjOq1wG/GGqy
        52bT/Vvly3J3XS7SaBYwRqzeyaFeY4yosGx47Q1c5B3DRDB0zGi/UN9f7OGGcn3qhEhD
        T60xM4UFQD3gHxLt5RvSEtvXuFX9itljn/xK4xBcy6LkiLdgUS7uqhhP0pltRYVHxNXx
        m6gZmJtwiwnP14GAG2c2jeE0NEXhESvnEudQkhR3fmfbFT/XzMES6JYK7JXVepw6rAwW
        2qMA==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj4Qpw9iZeHmMnw4vkig=="
X-RZG-CLASS-ID: mo00
Received: from imac.fritz.box
        by smtp.strato.de (RZmta 44.27.0 DYNA|AUTH)
        with ESMTPSA id u036f9v89EuqxVR
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (curve secp521r1 with 521 ECDH bits, eq. 15360 bits RSA))
        (Client did not present a certificate);
        Mon, 9 Sep 2019 16:56:52 +0200 (CEST)
Content-Type: text/plain; charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Subject: Re: [Letux-kernel] [RFC PATCH 0/3] Enable 1GHz support on omap36xx
From:   "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <CAHCN7xJsPa0i+Z+qpCkWcdAh9+udmGT0RPNchdDsfB=8ptd3Nw@mail.gmail.com>
Date:   Mon, 9 Sep 2019 16:56:51 +0200
Cc:     =?utf-8?Q?Andr=C3=A9_Roth?= <neolynx@gmail.com>,
        Linux-OMAP <linux-omap@vger.kernel.org>,
        Discussions about the Letux Kernel 
        <letux-kernel@openphoenux.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Andreas Kemnade <andreas@kemnade.info>,
        Tony Lindgren <tony@atomide.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <87420DBD-770F-4C32-9499-A3AEA5876E8A@goldelico.com>
References: <20190801012823.28730-1-neolynx@gmail.com> <CAHCN7x+nD0J6KZYtfH+0ApQTPO5byO2obMkUwc9Uf4WubyRbTw@mail.gmail.com> <C04F49BA-1229-4E96-9FCF-4FC662D1DB11@goldelico.com> <CAHCN7x+Ye6sB_YqO0sAX1OJDw64B-qGS3pL545v3Xk5z914cwQ@mail.gmail.com> <0C1EF64E-B33C-4BFA-A7D3-471DD1B9EE86@goldelico.com> <515048DE-138D-4400-8168-F2B7D61F1005@goldelico.com> <CAHCN7xLPCX9rZ0+7KVBiA_bgZ6tg6VeCXqD-UXu+6iwpFMPVrA@mail.gmail.com> <7B3D1D77-3E8C-444F-90B9-6DF2641178B8@goldelico.com> <CAHCN7xLW58ggx3CpVL=HdCVHWo6D-MCTB91A_9rtSRoZQ+xJuQ@mail.gmail.com> <FA2920FE-B76A-4D44-A264-862A1CCBF7FC@goldelico.com> <CAHCN7xJsPa0i+Z+qpCkWcdAh9+udmGT0RPNchdDsfB=8ptd3Nw@mail.gmail.com>
To:     Adam Ford <aford173@gmail.com>
X-Mailer: Apple Mail (2.3124)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Adam,

> Am 09.09.2019 um 16:26 schrieb Adam Ford <aford173@gmail.com>:
>=20
> On Sat, Sep 7, 2019 at 2:38 AM H. Nikolaus Schaller =
<hns@goldelico.com> wrote:
>>=20
>> Hi Adam,
>>=20
>>> Am 02.09.2019 um 23:10 schrieb Adam Ford <aford173@gmail.com>:
>>>=20
>>> On Mon, Sep 2, 2019 at 10:46 AM H. Nikolaus Schaller =
<hns@goldelico.com> wrote:
>>>>=20
>>>>=20
>>>>=20
>>>> But my tests show that decoding works now. So you already might =
give it a try.
>>>=20
>>> I am traveling all this week, but I have an omap3530, DM3730
>>> (omap3630), and an AM3517 that I use for testing.
>>=20
>> now as the omap3430 and omap3630 opp-v2 tables are installed,
>> we could add am35x7 as well.
>>=20
>> What needs to be done:
>>=20
>> 1. add OPP-v2 table to am3517.dtsi
>>=20
>> for example copy skeleton from omap36xx.dtsi
>>=20
>> and define reasonable clock speeds. I would think about
>> 150 MHz, 300 MHz, 600MHz.
>=20
> This might be more of a question for TI, but  can we match the 3430
> list of frequencies?
>=20
> Something like:
>    125000  1200000
>    250000  1200000
>    500000  1200000
>    550000  1200000
>    600000  1200000

And another question: is it more derived from omap3430 or omap3630?

>=20
>=20
>>=20
>> Debatable is if we need a clock-latency definition.
>>=20
>> 2. change all voltages to 1.2V
>>=20
>>                        opp-microvolt =3D <1200000 1200000 1200000>;
>>=20
>> There is no point to specify 3 voltages <target min max> here since =
we
>> will never need a min and a max value.
>>=20
>>                        opp-microvolt =3D <1200000>;
>>=20
>> should also be ok (AFAIK, parser handles single-value records).
>>=20
>> 3. AFAIK there is no speed binned eFuse...
>>=20
>> But the ti-cpufreq driver always wants to read some eFuse register.
>>=20
>> So please check if you can read 0x4800244C and 0x4830A204
>> like on omap36xx and if they produce stable values (and not
>> random noise).
>=20
> For the AM3517,
>=20
> 0x4800244C =3D 0000 0cc0

If it behaves like an dm3730 (Table 1-6) this would be read as =
800/600MHz
and some reserved code in bit 7:6.

If it behaves like an omap3530 (Table 1-6) this would bean 600MHz but =
reserved
value for IVA Frequency.


> 0x4830A204 =3D 1b86 802f

would be decoded (Table 1-7) as "AM/DM37x ES1.1"

omap35xx would have a different code (Table 1-9). Most similar is =
"OMAP35x ES2.0" with 0x1B7A E02F

So this seems to answer that the am3517 is indeed a derivative of the =
am/dm37xx.

Therefore the only OPPs would be OPP50 (300 MHz) and OPP100 (600 MHz).

Only tests or TI internal documentations could show if the am3517 still
runs stable at newly invented "OPP25" (150MHz).

>=20
> The AM3517 shows these are valid addresses and I read them multiple
> times and they yielded the same results even after power cycling.
>=20
>=20
>>=20
>> If yes, we simply assume that am3517 is similar enough to omap3630,
>> ignore that there is no eFuse, but read the register anyways and
>> then ignore the bit if it is 0 or 1.
>>=20
>> This means that all OPPs can get
>>=20
>>                        opp-supported-hw =3D <0xffffffff 0xffffffff>;
>>=20
>> There could also be a default handler if this property is missing,
>> but I have not researched this.
>>=20
> Like this?
>=20
> opp1-125000000 {
>     opp-hz =3D /bits/ 64 <125000000>;
>     opp-microvolt =3D <1200000>;
>     opp-supported-hw =3D <0xffffffff 0xffffffff>;
> };
>=20
> opp2-250000000 {
>     opp-hz =3D /bits/ 64 <250000000>;
>     opp-microvolt =3D <1200000>;
>    opp-supported-hw =3D <0xffffffff 0xffffffff>;
>     opp-suspend;
> };
>=20
> opp3-500000000 {
>     opp-hz =3D /bits/ 64 <500000000>;
>     opp-microvolt =3D <1200000>;
>     opp-supported-hw =3D <0xffffffff 0xffffffff>;
> };
>=20
> opp4-550000000 {
>     opp-hz =3D /bits/ 64 <550000000>;
>     opp-microvolt =3D <1200000>;
>     opp-supported-hw =3D <0xffffffff 0xffffffff>;
> };
>=20
> opp5-600000000 {
>     opp-hz =3D /bits/ 64 <600000000>;
>     opp-microvolt =3D <1200000>;
>     opp-supported-hw =3D <0xffffffff 0xffffffff>;
> };

Yes.

>=20
> What does opp-suspend do?  I noticed it in the 34xx.dtsi

Good question. I think it is the OPP to be chosen before suspend:

https://www.kernel.org/doc/Documentation/devicetree/bindings/opp/opp.txt
says

- opp-suspend: Marks the OPP to be used during device suspend. Only one =
OPP in
  the table should have this.

But that doesn't mean the drivers make use of this marker.

This makes me also wonder if we should tag the OPP1G and OPP6 as =
"turbo-mode"...

Another question that came up by private mail from Andr=C3=A9 was if we
should better disable the turbo OPPs of omap34xx and 36xx by default
(status =3D "disabled";) because there are concerns about overheating
the chips and we have no thermal regulation like for omap4 & 5.

But this would mean that every board DTS would have to set it explicitly
to "enabled".

And another concern is if the 1GHz OPP doesn't also need to switch the
ABB bias LDO to a different mode. This is not done by the ti-cpufreq =
driver.
Maybe it is done by some driver in mach-omap but I have not searched =
for.

So the concern is that we will run the turbo modes outside of the TI =
specs
while before applying the patch set this would be a lesser problem =
(OPP130
should also be thermally limited to 90=C2=B0C).

I.e. users of 1GHz capable boards will not only see 25% more speed but
suddenly higher SoC temperatures than the years before.

>=20
>> 4. add compatible to ti-cpufreq
>> and share the register offsets, bit masks etc. with omap3630:
>>=20
>>        { .compatible =3D "ti,am33xx", .data =3D &am3x_soc_data, },
>>        { .compatible =3D "ti,am3517", .data =3D &omap36xx_soc_data, =
},
>>        { .compatible =3D "ti,am43", .data =3D &am4x_soc_data, },
>>        { .compatible =3D "ti,dra7", .data =3D &dra7_soc_data },
>>        { .compatible =3D "ti,omap3430", .data =3D &omap34xx_soc_data, =
},
>>        { .compatible =3D "ti,omap3630", .data =3D &omap36xx_soc_data, =
},
>>=20
>> 5. configure for CONFIG_ARM_TI_CPUFREQ=3Dy
>>=20
>> This should IMHO suffice.
>=20
> If you're OK with what I am proposing, I'll run some tests and submit
> a patch.  I won't promise to fully understand what's happening.  :-)

Same for me :)

BR and thanks,
Nikolaus

