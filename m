Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A5F03AC529
	for <lists+linux-omap@lfdr.de>; Sat,  7 Sep 2019 09:38:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405803AbfIGHiA (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sat, 7 Sep 2019 03:38:00 -0400
Received: from mo4-p03-ob.smtp.rzone.de ([85.215.255.102]:27252 "EHLO
        mo4-p03-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404968AbfIGHiA (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sat, 7 Sep 2019 03:38:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1567841878;
        s=strato-dkim-0002; d=goldelico.com;
        h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=anVLX26Fedx+F6HcQmrODjYuvY8o8srVCOa6nrVkXYQ=;
        b=Oyq38yqZrg4JLBZWSSzRgh+RCemrCYqhwEhoKco9QzcBPS62wkJ/olGpggNmAKe3FX
        Yz5wGjzu46YALHF7YTvA0pGv5FEx3JTy5vvmiJSeBDp+Y17PjlF1Hut3nB4JxL8sOauB
        q+evpEBdd/dVSmTFaLxmVqSArtlLIW9wzt8vnDICcwX/NgKN/og+/H+sX8omTvKek/Ox
        7hH2HgufzINcIzoiYb780kyiaV3jD2YrUF3iwhy2ZiosEEQInv3UM5XZkdhEMYim6Cf1
        XvucdDAdRxvIok/n/KMNDOUribclycUgAVj4umQOzZbqCg4oSOsM5uCJoAzpSAqyeqa8
        1GBA==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj5Qpw97WFDVCaXAwLbA=="
X-RZG-CLASS-ID: mo00
Received: from imac.fritz.box
        by smtp.strato.de (RZmta 44.27.0 DYNA|AUTH)
        with ESMTPSA id u036f9v877bdqba
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (curve secp521r1 with 521 ECDH bits, eq. 15360 bits RSA))
        (Client did not present a certificate);
        Sat, 7 Sep 2019 09:37:39 +0200 (CEST)
Content-Type: text/plain; charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Subject: Re: [Letux-kernel] [RFC PATCH 0/3] Enable 1GHz support on omap36xx
From:   "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <CAHCN7xLW58ggx3CpVL=HdCVHWo6D-MCTB91A_9rtSRoZQ+xJuQ@mail.gmail.com>
Date:   Sat, 7 Sep 2019 09:37:39 +0200
Cc:     =?utf-8?Q?Andr=C3=A9_Roth?= <neolynx@gmail.com>,
        Tony Lindgren <tony@atomide.com>,
        Linux-OMAP <linux-omap@vger.kernel.org>,
        Discussions about the Letux Kernel 
        <letux-kernel@openphoenux.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Andreas Kemnade <andreas@kemnade.info>
Content-Transfer-Encoding: quoted-printable
Message-Id: <FA2920FE-B76A-4D44-A264-862A1CCBF7FC@goldelico.com>
References: <20190801012823.28730-1-neolynx@gmail.com> <CAHCN7x+nD0J6KZYtfH+0ApQTPO5byO2obMkUwc9Uf4WubyRbTw@mail.gmail.com> <C04F49BA-1229-4E96-9FCF-4FC662D1DB11@goldelico.com> <CAHCN7x+Ye6sB_YqO0sAX1OJDw64B-qGS3pL545v3Xk5z914cwQ@mail.gmail.com> <0C1EF64E-B33C-4BFA-A7D3-471DD1B9EE86@goldelico.com> <515048DE-138D-4400-8168-F2B7D61F1005@goldelico.com> <CAHCN7xLPCX9rZ0+7KVBiA_bgZ6tg6VeCXqD-UXu+6iwpFMPVrA@mail.gmail.com> <7B3D1D77-3E8C-444F-90B9-6DF2641178B8@goldelico.com> <CAHCN7xLW58ggx3CpVL=HdCVHWo6D-MCTB91A_9rtSRoZQ+xJuQ@mail.gmail.com>
To:     Adam Ford <aford173@gmail.com>
X-Mailer: Apple Mail (2.3124)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Adam,

> Am 02.09.2019 um 23:10 schrieb Adam Ford <aford173@gmail.com>:
>=20
> On Mon, Sep 2, 2019 at 10:46 AM H. Nikolaus Schaller =
<hns@goldelico.com> wrote:
>>=20
>>=20
>>=20
>> But my tests show that decoding works now. So you already might give =
it a try.
>=20
> I am traveling all this week, but I have an omap3530, DM3730
> (omap3630), and an AM3517 that I use for testing.

now as the omap3430 and omap3630 opp-v2 tables are installed,
we could add am35x7 as well.

What needs to be done:

1. add OPP-v2 table to am3517.dtsi

for example copy skeleton from omap36xx.dtsi

and define reasonable clock speeds. I would think about
150 MHz, 300 MHz, 600MHz.

Debatable is if we need a clock-latency definition.

2. change all voltages to 1.2V

			opp-microvolt =3D <1200000 1200000 1200000>;

There is no point to specify 3 voltages <target min max> here since we
will never need a min and a max value.

			opp-microvolt =3D <1200000>;

should also be ok (AFAIK, parser handles single-value records).

3. AFAIK there is no speed binned eFuse...

But the ti-cpufreq driver always wants to read some eFuse register.

So please check if you can read 0x4800244C and 0x4830A204
like on omap36xx and if they produce stable values (and not
random noise).

If yes, we simply assume that am3517 is similar enough to omap3630,
ignore that there is no eFuse, but read the register anyways and
then ignore the bit if it is 0 or 1.

This means that all OPPs can get

			opp-supported-hw =3D <0xffffffff 0xffffffff>;

There could also be a default handler if this property is missing,
but I have not researched this.

4. add compatible to ti-cpufreq
and share the register offsets, bit masks etc. with omap3630:

	{ .compatible =3D "ti,am33xx", .data =3D &am3x_soc_data, },
	{ .compatible =3D "ti,am3517", .data =3D &omap36xx_soc_data, },
	{ .compatible =3D "ti,am43", .data =3D &am4x_soc_data, },
	{ .compatible =3D "ti,dra7", .data =3D &dra7_soc_data },
	{ .compatible =3D "ti,omap3430", .data =3D &omap34xx_soc_data, =
},
	{ .compatible =3D "ti,omap3630", .data =3D &omap36xx_soc_data, =
},

5. configure for CONFIG_ARM_TI_CPUFREQ=3Dy

This should IMHO suffice.

Since I can't test anything I can't define working OPP points
and therefore I can't provide patches myself. Hope you can make
it work this way.

BR,
Nikolaus=
