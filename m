Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3CC1CADD8C
	for <lists+linux-omap@lfdr.de>; Mon,  9 Sep 2019 18:54:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390559AbfIIQyQ (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 9 Sep 2019 12:54:16 -0400
Received: from mo4-p01-ob.smtp.rzone.de ([81.169.146.165]:28838 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390263AbfIIQyP (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 9 Sep 2019 12:54:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1568048051;
        s=strato-dkim-0002; d=goldelico.com;
        h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=bY9Zsv0toaAL6+H/aBZfY10g+A0xuOv1hEKnmREQGXw=;
        b=GZVGUK4oROGvMpb9ksnbdipnbwjnzY7RJKPcksH8CKBsB8ftWqrnNMKk2nPndDlZ26
        p/m7z4QOkwPLRDQxW5sIArYJbfA3P+ISlNJvJwiPnm8Vu85tlp6YQJzbp4pyzxfpWJJF
        InvGCM6V0XQnPLH5cmHiCSmeIYjQsEF+al3/pQZw5J48ooKDDfB0ZUgB0HqAzYHSGBs3
        TkZ5mNcFoh62ZVgo1JIrW3fyrzkaxzqjcNX0kj7U0HPInja649Xc9YZMIVMoepuOOuWT
        Zo8SkCflF6/LkoTO3Rb7D7cNmP9vMUM6HMZtddBNcbvTPFz3psb9fjZJ0gZ8C9T/DDLM
        X+AQ==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj4Qpw9iZeHmMnw4vkig=="
X-RZG-CLASS-ID: mo00
Received: from imac.fritz.box
        by smtp.strato.de (RZmta 44.27.0 DYNA|AUTH)
        with ESMTPSA id u036f9v89Gs4xwk
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (curve secp521r1 with 521 ECDH bits, eq. 15360 bits RSA))
        (Client did not present a certificate);
        Mon, 9 Sep 2019 18:54:04 +0200 (CEST)
Content-Type: text/plain; charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Subject: Re: [Letux-kernel] [RFC PATCH 0/3] Enable 1GHz support on omap36xx
From:   "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <20190909163236.GP52127@atomide.com>
Date:   Mon, 9 Sep 2019 18:54:04 +0200
Cc:     Adam Ford <aford173@gmail.com>,
        =?utf-8?Q?Andr=C3=A9_Roth?= <neolynx@gmail.com>,
        Linux-OMAP <linux-omap@vger.kernel.org>,
        Discussions about the Letux Kernel 
        <letux-kernel@openphoenux.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Andreas Kemnade <andreas@kemnade.info>,
        Nishanth Menon <nm@ti.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <E001F74D-724E-4C50-9265-CBD33C4F2918@goldelico.com>
References: <C04F49BA-1229-4E96-9FCF-4FC662D1DB11@goldelico.com> <CAHCN7x+Ye6sB_YqO0sAX1OJDw64B-qGS3pL545v3Xk5z914cwQ@mail.gmail.com> <0C1EF64E-B33C-4BFA-A7D3-471DD1B9EE86@goldelico.com> <515048DE-138D-4400-8168-F2B7D61F1005@goldelico.com> <CAHCN7xLPCX9rZ0+7KVBiA_bgZ6tg6VeCXqD-UXu+6iwpFMPVrA@mail.gmail.com> <7B3D1D77-3E8C-444F-90B9-6DF2641178B8@goldelico.com> <CAHCN7xLW58ggx3CpVL=HdCVHWo6D-MCTB91A_9rtSRoZQ+xJuQ@mail.gmail.com> <FA2920FE-B76A-4D44-A264-862A1CCBF7FC@goldelico.com> <CAHCN7xJsPa0i+Z+qpCkWcdAh9+udmGT0RPNchdDsfB=8ptd3Nw@mail.gmail.com> <87420DBD-770F-4C32-9499-A3AEA5876E8A@goldelico.com> <20190909163236.GP52127@atomide.com>
To:     Tony Lindgren <tony@atomide.com>
X-Mailer: Apple Mail (2.3124)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Tony,

> Am 09.09.2019 um 18:32 schrieb Tony Lindgren <tony@atomide.com>:
>=20
> Hi,
>=20
> * H. Nikolaus Schaller <hns@goldelico.com> [190909 14:57]:
>> Another question that came up by private mail from Andr=C3=A9 was if =
we
>> should better disable the turbo OPPs of omap34xx and 36xx by default
>> (status =3D "disabled";) because there are concerns about overheating
>> the chips and we have no thermal regulation like for omap4 & 5.
>>=20
>> But this would mean that every board DTS would have to set it =
explicitly
>> to "enabled".
>=20
> Yes I started thinking about that too. I think there is a requirement
> to do the scaling via the voltage processor for the higher modes.

It depends on how you read the little footnotes...

Table 4-18. Processor Voltages Without SmartReflex:

	=E2=80=A2 This table defines the safe VDD1 (vdd_mpu_iva) voltage =
ranges to be used before using the SmartReflex AVS feature for OPPs =
calibration.
	=E2=80=A2 Values are defined when SmartReflexTM feature is =
deactivated. They can be lower when SmartReflexTM is activated.
	=E2=80=A2 OPP130 and OPP1G are not available above TJ of 90C.
	=E2=80=A2 (6)  OPP1G is a high performance operating point which =
has following requirements:
		=E2=80=A2 =E2=80=93  ABB LDO must be set to FBB (Forward =
Body Bias) mode when switching to this OPP. It requires having a 1 F =
capacitor connected to cap_vdd_bb_mpu_iva.
		=E2=80=A2 =E2=80=93  AVS (Adaptive Voltage Scaling) =
power technique must be used to achieve optimum operating voltage.

So I read this as:

* OPP130 and OPP1G should be guarded by 90=C2=B0C thermal framework
* OPP1G should also set the ABB LDO to FBB mode
* AVS does only reduce voltage levels (to save energy =3D heat =3D =
problem)
* only if we want "optimum operating voltage" (read as: "lowest possible =
voltage" =3D "highest energy saving") we must use AVS

I.e. we do not necessarily need AVS or SmartReflex or help from the
twl4030 (except for changing the voltage).

> And there needs to be some way to automatically change to a lower
> OPP in some cases.

That should probably be done through the thermal framework like
on omap4 & omap5?

>=20
> For normal OPPs, using the twl regulator directly should be OK.

Maybe for the turbo OPPs as well.

> For the higher modes, maybe we could pass the callback functions
> from arch/arm/mach-omap2/voltage.c for the twl regulator so the
> voltage processor hardware can handle them directly. Or add a
> separate regulator driver operating the voltages like Nishanth
> posted patches for earlier.

So in my (limited) understanding it would suffice to set the ABB LDO
to FBB mode for OPP1G.

And make sure that the TJ does not exceed 90=C2=B0C by reducing the =
cpufreq
through the thermal framework. But: the thermal sensors of the omap3
are quite odd (they seem to jump up by 10=C2=B0 after first use).

BR,
Nikolaus

