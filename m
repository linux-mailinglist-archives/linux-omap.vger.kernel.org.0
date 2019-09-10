Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 10A52AF1DB
	for <lists+linux-omap@lfdr.de>; Tue, 10 Sep 2019 21:26:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727510AbfIJT0U (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 10 Sep 2019 15:26:20 -0400
Received: from mo4-p02-ob.smtp.rzone.de ([85.215.255.80]:11186 "EHLO
        mo4-p02-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727780AbfIJT0U (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 10 Sep 2019 15:26:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1568143575;
        s=strato-dkim-0002; d=goldelico.com;
        h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=cv+Edmyh7Q77ONzodXR6r48kRod7QYj1aXIMSz+yVjE=;
        b=Pd5e7QInBhGLAMD78oDrXhc2C3wa6oga6bVTdXoz87SCzzbRukj24XdSx4Bxk0NKDz
        3A8B5z3/69zQHuZtV6psARYipGMHCpYBy8ujPbSx275ou3a66jDo/Akgh6254/fRdnb1
        vL//foDK8R62BIsKXjxhsbMo6iOoOG3ASFWYvQ9uIjn/rYYmG8LJbI3v5FhulwBcX+Eh
        v2gjKG6AjcFOtkCU9Am46INeNgUb8g3NXNg6jwI0lw5i5wzo4iRV5aWkYPSPVtWjANrI
        Slh7F/jsNWIvWqe0x8DXb9ElWR06KEMGueWwJnrcWUwABBb3d76K5Yc6iMxx73ZOxVz4
        5qFQ==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj7wpz8NMGH/PhwDWsEw=="
X-RZG-CLASS-ID: mo00
Received: from imac.fritz.box
        by smtp.strato.de (RZmta 44.27.0 DYNA|AUTH)
        with ESMTPSA id u036f9v8AJQ33Z0
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (curve secp521r1 with 521 ECDH bits, eq. 15360 bits RSA))
        (Client did not present a certificate);
        Tue, 10 Sep 2019 21:26:03 +0200 (CEST)
Content-Type: text/plain; charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Subject: Re: [Letux-kernel] [RFC PATCH 0/3] Enable 1GHz support on omap36xx
From:   "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <56482888-DBD3-4658-8DB9-FB57653B5AA8@goldelico.com>
Date:   Tue, 10 Sep 2019 21:26:03 +0200
Cc:     Tony Lindgren <tony@atomide.com>,
        =?utf-8?Q?Andr=C3=A9_Roth?= <neolynx@gmail.com>,
        Linux-OMAP <linux-omap@vger.kernel.org>,
        Discussions about the Letux Kernel 
        <letux-kernel@openphoenux.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Andreas Kemnade <andreas@kemnade.info>,
        Nishanth Menon <nm@ti.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <E0D77E0F-6A04-4C5D-8821-BB185EBDC511@goldelico.com>
References: <C04F49BA-1229-4E96-9FCF-4FC662D1DB11@goldelico.com> <CAHCN7x+Ye6sB_YqO0sAX1OJDw64B-qGS3pL545v3Xk5z914cwQ@mail.gmail.com> <0C1EF64E-B33C-4BFA-A7D3-471DD1B9EE86@goldelico.com> <515048DE-138D-4400-8168-F2B7D61F1005@goldelico.com> <CAHCN7xLPCX9rZ0+7KVBiA_bgZ6tg6VeCXqD-UXu+6iwpFMPVrA@mail.gmail.com> <7B3D1D77-3E8C-444F-90B9-6DF2641178B8@goldelico.com> <CAHCN7xLW58ggx3CpVL=HdCVHWo6D-MCTB91A_9rtSRoZQ+xJuQ@mail.gmail.com> <FA2920FE-B76A-4D44-A264-862A1CCBF7FC@goldelico.com> <CAHCN7xJsPa0i+Z+qpCkWcdAh9+udmGT0RPNchdDsfB=8ptd3Nw@mail.gmail.com> <87420DBD-770F-4C32-9499-A3AEA5876E8A@goldelico.com> <20190909163236.GP52127@atomide.com> <E001F74D-724E-4C50-9265-CBD33C4F2918@goldelico.com> <F8F08882-8011-441C-9581-ECCE9772EC21@goldelico.com> <CAHCN7x+fgtMHMNYU2W7BRQwd-d2g_Tb8-L5QNcnZjCF=VzRXJg@mail.gmail.com> <3663B13C-1AAB-4BE3-8CAD-F821B70393FA@goldelico.com> <CAHCN7x+mLCNq4evwGZfk6Ka=3o6EzhL=s38aNdukyLwKB1xO7A@mail.gmail.com> <56482888-DBD3-4658-8DB9-FB57653B5AA8@goldelico.com>
To:     Adam Ford <aford173@gmail.com>
X-Mailer: Apple Mail (2.3124)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Adam,

> Am 10.09.2019 um 20:51 schrieb H. Nikolaus Schaller =
<hns@goldelico.com>:
>=20
> Hi,
>=20
>> Am 10.09.2019 um 20:30 schrieb Adam Ford <aford173@gmail.com>:
>>=20
>> On Tue, Sep 10, 2019 at 11:59 AM H. Nikolaus Schaller =
<hns@goldelico.com> wrote:
>>>=20

>>=20
>> I assumed this to be -EINVAL, but I'd be happy to be wrong.
>=20
> It seems that cat microvolts stringifies the int returned from reading
> the regulator voltage.
>=20
> Since it is initialized to -EINVAL it returns "-22" as string instead =
of
> converting into an errno return when reading /sys... So one step is
> missing a proper error check.

Ok, found it in regulator_uV_show().

ret =3D sprintf(buf, "%d\n", regulator_get_voltage_rdev(rdev));

simply prints the result into a string.

But regulator_get_voltage_rdev() (or _regulator_get_voltage() before =
v5.3-rc1)
may return errors like -EPROBE_DEFER or -EINVAL or whatever
rdev->desc->ops->get_voltage_sel(rdev) returns.

So this is clearly a bug in regulator_uV_show().

> But that is just a symptom that there is no call to set a good =
voltage.

That is the next issue to find...

BR,
Nikolaus

