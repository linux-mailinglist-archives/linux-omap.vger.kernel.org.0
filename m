Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C54A1B414C
	for <lists+linux-omap@lfdr.de>; Mon, 16 Sep 2019 21:45:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388400AbfIPTpR (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 16 Sep 2019 15:45:17 -0400
Received: from mo4-p02-ob.smtp.rzone.de ([85.215.255.82]:27295 "EHLO
        mo4-p02-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728147AbfIPTpR (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 16 Sep 2019 15:45:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1568663113;
        s=strato-dkim-0002; d=goldelico.com;
        h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=5u8Hsia6IdhJmf43smAXCOHttrmjccW+OZfIxurbUbk=;
        b=lslmTUepZl3fzPkxsE51c15QYWOs49BYFJJ5DQYFimzkX+vyznS5O50qxJ7ayNsNBf
        jvJv7C+6Z7vHcf80U4QGW8I9xMglEjolqrlfTuEpO74drTjjOHv9Z2wPthT2+Dwqwuba
        WdUuoJUVhz6wlnWxQ7FhOEdyiS3JiY7AcePJE+HPW+BDdD4RSUQBPdBkxE4LN3bOfAsY
        FeEoJshadpGe4u/8V1fe725Y0tPEmSw1T0lK9byD1ElhEC2SGqyQ1tB2h1pVplsD7TSp
        BmfMRoO8ykL8ooFBQhCJRnpGqP7ZWIiAgcGpoRGv4bCqRK4kK2renkpDag8lfZD7MNaB
        qEBw==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj4Qpw9iZeHmAgw43rXTg="
X-RZG-CLASS-ID: mo00
Received: from imac.fritz.box
        by smtp.strato.de (RZmta 44.27.0 DYNA|AUTH)
        with ESMTPSA id u036f9v8GJj2SmW
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (curve secp521r1 with 521 ECDH bits, eq. 15360 bits RSA))
        (Client did not present a certificate);
        Mon, 16 Sep 2019 21:45:02 +0200 (CEST)
Content-Type: text/plain; charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Subject: Re: [PATCH 6/6] ARM: dts: Configure rstctrl reset for SGX
From:   "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <CAHCN7xJ3vpT-7Wdjy9d=N_9VuThczwYV0TZ2Dm-1iMDP52jzog@mail.gmail.com>
Date:   Mon, 16 Sep 2019 21:45:01 +0200
Cc:     Tony Lindgren <tony@atomide.com>,
        Linux-OMAP <linux-omap@vger.kernel.org>,
        =?utf-8?Q?Beno=C3=AEt_Cousson?= <bcousson@baylibre.com>,
        devicetree <devicetree@vger.kernel.org>,
        =?utf-8?Q?Filip_Matijevi=C4=87?= <filip.matijevic.pz@gmail.com>,
        Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>,
        moaz korena <moaz@korena.xyz>,
        Merlijn Wajer <merlijn@wizzup.org>,
        =?utf-8?Q?Pawe=C5=82_Chmiel?= <pawel.mikolaj.chmiel@gmail.com>,
        Philipp Rossak <embed3d@gmail.com>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Tero Kristo <t-kristo@ti.com>,
        linux-clk <linux-clk@vger.kernel.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <10BE6AA1-8E43-4AEA-A323-5F7CD0B155FC@goldelico.com>
References: <20190814131408.57162-1-tony@atomide.com> <20190814131408.57162-7-tony@atomide.com> <92652315-A763-485F-A4FA-CB868016E045@goldelico.com> <20190916151730.GZ52127@atomide.com> <20190916180418.GH52127@atomide.com> <6CF46DDB-2EC1-454E-83A1-30CC7BFC335D@goldelico.com> <D413323E-6B96-473E-979B-18D476AB3065@goldelico.com> <CAHCN7xJ3vpT-7Wdjy9d=N_9VuThczwYV0TZ2Dm-1iMDP52jzog@mail.gmail.com>
To:     Adam Ford <aford173@gmail.com>
X-Mailer: Apple Mail (2.3124)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org


> Am 16.09.2019 um 21:20 schrieb Adam Ford <aford173@gmail.com>:
>=20
> On Mon, Sep 16, 2019 at 2:15 PM H. Nikolaus Schaller =
<hns@goldelico.com> wrote:
>>=20
>>=20
>>> Am 16.09.2019 um 20:12 schrieb H. Nikolaus Schaller =
<hns@goldelico.com>:
>>>=20
>>>=20
>> " for 56000000.sgx on minor 1" is suspect.
>> IMHO, it should have to be " for 5600fe00.sgx on minor 1"
>> But anyways this is a big step forwards having giving me three =
different
>> platforms for testing and comparisons.
>=20
> I can try to help again with the SGX once I can get the LCD stuff
> working.  At some point, the panel-dpi driver was removed, and I am
> struggling to get my LCD's back.

We had similar issues when that happened...

>  Until I can get the LCD's fully
> function, I can't test the SGX.  I got a little distracted with the
> OPP stuff you did and the thermal throttling.

Same for me. I just started over today

I have pushed my latest trees (where this now working-for-me patch is =
included) to

	=
https://github.com/openpvrsgx-devgroup/linux_openpvrsgx/branches/active

This branch contains everything on top of v5.3:

	=
https://github.com/openpvrsgx-devgroup/linux_openpvrsgx/commits/letux-pvr

Maybe for further more general SGX discussion we should now start a new =
mail
thread or continue the "Lay common foundation to make PVR/SGX work ...".

BR,
Nikolaus

