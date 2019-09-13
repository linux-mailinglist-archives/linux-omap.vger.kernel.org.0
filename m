Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7556AB2301
	for <lists+linux-omap@lfdr.de>; Fri, 13 Sep 2019 17:09:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390368AbfIMPJY (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 13 Sep 2019 11:09:24 -0400
Received: from mo4-p01-ob.smtp.rzone.de ([85.215.255.52]:27397 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390046AbfIMPJY (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 13 Sep 2019 11:09:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1568387362;
        s=strato-dkim-0002; d=goldelico.com;
        h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=MjDaNE23KGmdcexxJE0YAkaPMCvMuA5pb1NItekYG4A=;
        b=LI1o/E3kaCf9Augbo30pbZlQ5M0sVyBh96Ra84FNbjvgosJfw6/K9Qe8uIci1xJBCb
        oXSV584w+uqfOEoXirnhGS087d+wBOSMvv1q50lL20PLxYE/3okNsnm6fWQNx2nLE57V
        UkEH+w1Muu46ACxZWfccJS6u+c3vqxA4xPGpnL+WrXEtwJ/2QC1Aed3/Yi7xqkiuoTWs
        bDA+YNH+Im0dZ9gQ3IJIDGICcegeONFyeiJSIGsWWy8BSWPsaPZIkYLxz+ZgWj6j0OBA
        KQzpnKnx3YS7jYZhUji3DoLGRzEh4Wpw73C2tC2xgdlOsy6L0Lod3FQXZJtG1KSAHjUV
        Ht2A==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj5Qpw97WFDlSVXA4OAWU="
X-RZG-CLASS-ID: mo00
Received: from mbp-13-nikolaus.fritz.box
        by smtp.strato.de (RZmta 44.27.0 DYNA|AUTH)
        with ESMTPSA id u036f9v8DF8xIqW
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (curve secp521r1 with 521 ECDH bits, eq. 15360 bits RSA))
        (Client did not present a certificate);
        Fri, 13 Sep 2019 17:08:59 +0200 (CEST)
Content-Type: text/plain; charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Subject: Re: [RFC] ARM: dts: omap36xx: Enable thermal throttling
From:   "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <CAHCN7xKfeh-cqJVfbW_km27cgee2MEBdPM3edACRi0fCaohxvw@mail.gmail.com>
Date:   Fri, 13 Sep 2019 17:09:00 +0200
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
Message-Id: <7C9393BD-B23B-41A6-BF96-E53CD707AAC7@goldelico.com>
References: <20190912183037.18449-1-aford173@gmail.com> <D4F7E03C-1880-45AC-8F7C-6C8A336E2A01@goldelico.com> <CAHCN7xK100mR=fNns3qdDKpOyWsTWXgDnnngQfQ_j8cB_SFfuA@mail.gmail.com> <98751DAF-B3F7-4638-97BE-1D067B24EF18@goldelico.com> <CAHCN7xL-CmwmXP3PLdwAHiC-9tMjrpY4k7ZhxQ9WoXY6yUz8BA@mail.gmail.com> <ABCE2ACA-D19A-42D2-9606-C60F1A5CBCCB@goldelico.com> <CAHCN7xKfeh-cqJVfbW_km27cgee2MEBdPM3edACRi0fCaohxvw@mail.gmail.com>
To:     Adam Ford <aford173@gmail.com>
X-Mailer: Apple Mail (2.3124)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org


> Am 13.09.2019 um 17:01 schrieb Adam Ford <aford173@gmail.com>:
>=20
> On Fri, Sep 13, 2019 at 9:24 AM H. Nikolaus Schaller =
<hns@goldelico.com> wrote:
>>=20
>>=20
>>> Am 13.09.2019 um 16:05 schrieb Adam Ford <aford173@gmail.com>:
>>>=20
>>> On Fri, Sep 13, 2019 at 8:32 AM H. Nikolaus Schaller =
<hns@goldelico.com> wrote:
>>>>=20
>>>> Hi Adam,
>>>>=20
>>>>> Am 13.09.2019 um 13:07 schrieb Adam Ford <aford173@gmail.com>:
>>>>=20
>>>>>>> +     cpu_cooling_maps: cooling-maps {
>>>>>>> +             map0 {
>>>>>>> +                     trip =3D <&cpu_alert0>;
>>>>>>> +                     /* Only allow OPP50 and OPP100 */
>>>>>>> +                     cooling-device =3D <&cpu 0 1>;
>>>>>>=20
>>>>>> omap4-cpu-thermal.dtsi uses THERMAL_NO_LIMIT constants but I do =
not
>>>>>> understand their meaning (and how it relates to the opp list).
>>>>>=20
>>>>> I read through the documentation, but it wasn't completely clear =
to
>>>>> me. AFAICT, the numbers after &cpu represent the min and max index =
in
>>>>> the OPP table when the condition is hit.
>>>>=20
>>>> Ok. It seems to use "cooling state" for those and the first is =
minimum
>>>> and the last is maximum. Using THERMAL_NO_LIMIT (-1UL) means to =
have
>>>> no limits.
>>>>=20
>>>> Since here we use the &cpu node it is likely that the "cooling =
state"
>>>> is the same as the OPP index currently in use.
>>>>=20
>>>> I have looked through the .dts which use cpu_crit and the picture =
is
>>>> not unique...
>>>>=20
>>>> omap4           seems to only define it
>>>> am57xx          has two different grade dtsi files
>>>> dra7            overwrites critical temperature value
>>>> am57xx-beagle   defines a gpio to control a fan
>>>=20
>=20
> I am going to push a separate but related RFC with 2 patches in the
> series.  This new one will setup the alerts and maps without any
> throttling for all omap3's in the first patch.  The second patch will
> consolidate the thermal references to omap3.dtsi so omap34, omap36 and
> am35 can all use them without having to duplicate the entries.
>=20
> It will make the omap36xx changes simpler to manage, because we can
> just modify a portion of the entries instead of having the whole
> table.
>=20
> Once this parallel RFC gets comments/feedback, I'll re-integrate the
> omap36xx throttling.

Good idea. I have looked over them and they seem to be ok.

>=20
> adam

BR and thanks,
Nikolaus

