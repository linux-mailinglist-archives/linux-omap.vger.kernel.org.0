Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F1A84B4017
	for <lists+linux-omap@lfdr.de>; Mon, 16 Sep 2019 20:12:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729924AbfIPSM5 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 16 Sep 2019 14:12:57 -0400
Received: from mo4-p01-ob.smtp.rzone.de ([85.215.255.51]:27338 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729750AbfIPSM5 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 16 Sep 2019 14:12:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1568657574;
        s=strato-dkim-0002; d=goldelico.com;
        h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=tGHWzBJ5eoRRmF1BtPtVyEKPENS75YAHofem8kKFScY=;
        b=XZUaxTUW5eOsvZKq8IseL0awX3Ckh6/VUQrcEY8lkHCTN8KzL/TFvryqG0gSxq+dIo
        FpxEqOnxjLCD0ppCv3+xn4W5ZTf7yCaDxBPV5/wuvRX+eK6LwTQ1T4w/dQBxco4LNAoL
        68MQzt+k0ydrDNOd/UZ3anV9dR+uICtdHYBni3sFPOw/DWjQj4waMUWQ9nvhVuQU5WFE
        3hMMYw/gkKmyX6zhkUSgkMtkqsAxEp5pw0+oFIB4XfVcBzLcbjftQI8nB0kPJRsCWz7U
        IQRVOrup5lYq1BMbMhWdHfnmRc/aeAtXF0MooTYqalpxV+YcPE0nDFqF0ouj8KPyhwln
        +9LA==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj4Qpw9iZeHmAgw43rXTg="
X-RZG-CLASS-ID: mo00
Received: from imac.fritz.box
        by smtp.strato.de (RZmta 44.27.0 DYNA|AUTH)
        with ESMTPSA id u036f9v8GICfScE
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (curve secp521r1 with 521 ECDH bits, eq. 15360 bits RSA))
        (Client did not present a certificate);
        Mon, 16 Sep 2019 20:12:41 +0200 (CEST)
Content-Type: text/plain; charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Subject: Re: [PATCH 6/6] ARM: dts: Configure rstctrl reset for SGX
From:   "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <20190916180418.GH52127@atomide.com>
Date:   Mon, 16 Sep 2019 20:12:41 +0200
Cc:     Linux-OMAP <linux-omap@vger.kernel.org>,
        =?utf-8?Q?Beno=C3=AEt_Cousson?= <bcousson@baylibre.com>,
        devicetree <devicetree@vger.kernel.org>,
        Adam Ford <aford173@gmail.com>,
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
Message-Id: <6CF46DDB-2EC1-454E-83A1-30CC7BFC335D@goldelico.com>
References: <20190814131408.57162-1-tony@atomide.com> <20190814131408.57162-7-tony@atomide.com> <92652315-A763-485F-A4FA-CB868016E045@goldelico.com> <20190916151730.GZ52127@atomide.com> <20190916180418.GH52127@atomide.com>
To:     Tony Lindgren <tony@atomide.com>
X-Mailer: Apple Mail (2.3124)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org


> Am 16.09.2019 um 20:04 schrieb Tony Lindgren <tony@atomide.com>:
>=20
> Hi,
>=20
> * Tony Lindgren <tony@atomide.com> [190916 15:18]:
>> * H. Nikolaus Schaller <hns@goldelico.com> [190913 09:50]:
>>> Hi Tony,
>>>=20
>>>> Am 14.08.2019 um 15:14 schrieb Tony Lindgren <tony@atomide.com>:
>>>>=20
>>>> The following can be tested via sysfs with the following to ensure =
the SGX
>>>> module gets enabled and disabled properly:
>>>>=20
>>>> # echo on > =
/sys/bus/platform/devices/5600fe00.target-module/power/control
>>>> # rwmem 0x5600fe00		# revision register
>>>> 0x5600fe00 =3D 0x40000000
>>>> # echo auto > =
/sys/bus/platform/devices/5600fe00.target-module/power/control
>>>> # rwmem 0x5000fe00
>>>> Bus error
>>>>=20
>>>> Note that this patch depends on the PRM rstctrl driver that has
>>>> been recently posted.
>>>=20
>>> Do you have a list of these patches or a git for pulling the =
complete set
>>> of changes? Does it depend on mainline or linux-next?
>>=20
>> You need the drivers/bus/ti-sysc.c changes from Linux next,
>> and the most recent clkctrl and rstctrl patches posted by
>> Tero.
>>=20
>>> I tried to find the correct patches but it does not seem to work for
>>> me on beaglebone.
>>=20
>> OK can you please check the dependencies again and let me know
>> if you still have issues?
>=20
> To make things easier to test, I pushed out a test branch with
> all the pending dependencies :)
>=20
> It's basically v5.3 + ti-sysc changes in Linux next, and
> the following patches posted by Tero:
>=20
> [PATCHv5 00/10] soc: ti: add OMAP PRM driver (for reset)
> [PATCHv3 00/10] clk: ti: remoteproc / iommu support patches
> [PATCH 00/10] ARM: dts: omap changes for IOMMU / reset support
>=20
> And then finally the $subject patch applied on top, and the
> tests above still work for me.

Ok, fine!

>=20
> The test branch is test-pending-ti-sysc-clkctrl-rstctrl-v5.3
> at [0] and [1] below.
>=20
> Can you please test and see if that works for you?
>=20
> Regards,
>=20
> Tony
>=20
> [0] =
git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap.git =
test-pending-ti-sysc-clkctrl-rstctrl-v5.3
> [1] =
https://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap.git/log/=
?h=3Dtest-pending-ti-sysc-clkctrl-rstctrl-v5.3

I'll check out and try to locate missing pieces.

BR and thanks,
Nikolaus

